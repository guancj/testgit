<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3019" pbltext="DEP113">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x755" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75D" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="530" top="34" right="630" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="390" top="674" right="490" bottom="706"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="打开乘客门门灯">
<Rect left="690" top="494" right="790" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开乘客门门灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0xCF 0x83 0x03 0x01
engine.Delay(1000)</Script></Activity>
<Activity id="255" ActivityType="3" flags="0" name="乘客门门灯打开结果">
<Rect left="690" top="544" right="790" bottom="576"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x3D 0x07
if (@3==0x01) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=门灯打开状态#R=bmpok")
else
  engine.SetLineText(2,"#L=门灯打开状态#R=bmpnok")
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP776" type="8" flags="97"/>
</Activity>
<Activity id="256" ActivityType="3" flags="0" name="关闭乘客门门灯">
<Rect left="840" top="494" right="940" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动关闭乘客门门灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0xCF 0x83 0x03 0x00</Script></Activity>
<Activity id="257" ActivityType="3" flags="0" name="乘客门门灯关闭">
<Rect left="840" top="544" right="940" bottom="576"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x3D 0x07
if (@3==0x00) then
  engine.LastError = 0;
    engine.SetLineText(2,"#L=门灯关闭状态#R=bmpok")
else
  engine.SetLineText(2,"#L=门灯关闭状态#R=bmpok")
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP777" type="8" flags="97"/>
</Activity>
<Activity id="260" ActivityType="3" flags="0" name="反回控制">
<Rect left="840" top="604" right="940" bottom="636"/>
<Script>#COMM  0x2F 0xCF 0x83 0x00</Script></Activity>
<Activity id="261" ActivityType="3" flags="1" name="乘客门玻璃下降">
<Rect left="1000" top="494" right="1100" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行乘客门玻璃下降"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0xCF 0x81 0x03 0x02
engine.Delay(2000)</Script></Activity>
<Activity id="276" ActivityType="3" flags="0" name="乘客门玻璃下降结果">
<Rect left="1000" top="544" right="1100" bottom="576"/>
<Strategy TotalTime="500" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Script>#COMM 0x22 0x3D 0x01
if (@3==0x06) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=玻璃下降#R=bmpok")
  
else
  engine.SetLineText(2,"#L=玻璃下降#R=bmpnok")
  engine.LastError = 1;
  engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP778" type="8" flags="97"/>
</Activity>
<Activity id="277" ActivityType="3" flags="0" name="反回控制">
<Rect left="1000" top="604" right="1100" bottom="636"/>
<Script>#COMM  0x2F 0xCF 0x81 0x00
</Script></Activity>
<Activity id="278" ActivityType="3" flags="0" name="乘客门玻璃上升">
<Rect left="1040" top="244" right="1140" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行乘客门玻璃上升"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0xCF 0x81 0x03 0x01
engine.Delay(2000)</Script></Activity>
<Activity id="279" ActivityType="3" flags="0" name="乘客门玻璃上升结果">
<Rect left="1040" top="294" right="1140" bottom="326"/>
<Strategy TotalTime="500" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="200"/>
<Script>#COMM 0x22 0x3D 0x01
if (@3==0x05) then
  engine.LastError = 0;
   engine.SetLineText(2,"#L=玻璃上升#R=bmpok")
else
 engine.SetLineText(2,"#L=玻璃上升#R=bmpnok")
  engine.LastError = 1;
  engine.TestResult = 1
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP1939" type="8" flags="97"/>
</Activity>
<Activity id="280" ActivityType="3" flags="0" name="反回控制">
<Rect left="1040" top="354" right="1140" bottom="386"/>
<Script>#COMM  0x2F 0xCF 0x81 0x00</Script></Activity>
<Activity id="284" ActivityType="3" flags="0" name="Window initialization(Auto function&amp;Anti-pinch fucntion)手动测试">
<Rect left="1260" top="1124" right="1360" bottom="1156"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="按下乘客窗口的上开关"/>
<Line2Text Enable="1" Text="#L=确定窗口移动“上”&gt;“下”&gt;自动上升？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script></Activity>
<Activity id="437" ActivityType="3" flags="0" name="乘客门检测">
<Rect left="530" top="104" right="630" bottom="136"/>
<TitleText Enable="1" Text="乘客门检测(PDCU)准备"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="438" ActivityType="3" flags="0" name="清DTC">
<Rect left="1320" top="604" right="1420" bottom="636"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP115" type="8" flags="97"/>
</Activity>
<Activity id="439" ActivityType="3" flags="0" name="连接ECU">
<Rect left="530" top="164" right="630" bottom="196"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="440" ActivityType="3" flags="0" name="切诊断">
<Rect left="530" top="324" right="630" bottom="356"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP2203" type="8" flags="97"/>
</Activity>
<Activity id="441" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="530" top="384" right="630" bottom="416"/>
<Line2Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP117" type="8" flags="97"/>
</Activity>
<Activity id="442" ActivityType="13" flags="0" name="计算">
<Rect left="530" top="434" right="630" bottom="466"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30640275"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="443" ActivityType="3" flags="0" name="通讯">
<Rect left="530" top="224" right="630" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end

</Script><assessment no="19" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="444" ActivityType="3" flags="0" name="通讯失败">
<Rect left="390" top="224" right="490" bottom="256"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="445" ActivityType="3" flags="0" name="结束通讯">
<Rect left="390" top="164" right="490" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="446" ActivityType="3" flags="0" name="发送key">
<Rect left="530" top="494" right="630" bottom="526"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP118" type="8" flags="97"/>
</Activity>
<Activity id="447" ActivityType="3" flags="0" name="反回控制">
<Rect left="690" top="604" right="790" bottom="636"/>
<Script>#COMM  0x2F 0xCF 0x83 0x00</Script></Activity>
<Activity id="449" ActivityType="4" flags="0" name="路由节点">
<Rect left="1354" top="674" right="1386" bottom="706"/>
</Activity>
<Activity id="450" ActivityType="3" flags="0" name="手动自学习">
<Rect left="1320" top="504" right="1420" bottom="536"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="#L=自动完成上升、下降、再上升的循环#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script><assessment no="28" name="DEP1118" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="437" type="0">
</Transition>
<Transition StartId="4" EndId="255" type="0">
</Transition>
<Transition StartId="255" EndId="447" type="0">
</Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="260" type="0">
</Transition>
<Transition StartId="260" EndId="261" type="0">
</Transition>
<Transition StartId="261" EndId="276" type="0">
</Transition>
<Transition StartId="276" EndId="277" type="0">
</Transition>
<Transition StartId="277" EndId="438" type="0">
</Transition>
<Transition StartId="278" EndId="279" type="0">
</Transition>
<Transition StartId="279" EndId="280" type="0">
</Transition>
<Transition StartId="437" EndId="439" type="0">
</Transition>
<Transition StartId="438" EndId="449" type="0">
</Transition>
<Transition StartId="439" EndId="443" type="0">
</Transition>
<Transition StartId="440" EndId="441" type="0">
</Transition>
<Transition StartId="441" EndId="442" type="0">
</Transition>
<Transition StartId="442" EndId="446" type="0">
</Transition>
<Transition StartId="443" EndId="444" type="4">
</Transition>
<Transition StartId="443" EndId="440" type="3">
</Transition>
<Transition StartId="444" EndId="445" type="0">
</Transition>
<Transition StartId="444" EndId="2" type="5">
</Transition>
<Transition StartId="445" EndId="439" type="0">
</Transition>
<Transition StartId="446" EndId="4" type="0">
</Transition>
<Transition StartId="447" EndId="256" type="0">
</Transition>
<Transition StartId="449" EndId="2" type="0">
</Transition>
<Transition StartId="450" EndId="438" type="0">
</Transition>
</Transitions>
</Process>

