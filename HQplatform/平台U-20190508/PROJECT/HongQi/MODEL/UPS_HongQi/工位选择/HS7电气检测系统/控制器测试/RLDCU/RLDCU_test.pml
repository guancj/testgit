<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3021" pbltext="DEP119">
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
<Variable id="CAN_SND_ID" type="3" data="0x756" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="34" right="590" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="724" right="170" bottom="756"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="左后门 (RLDCU)">
<Rect left="490" top="114" right="590" bottom="146"/>
<TitleText Enable="1" Text="左后门(RLDCU)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="1190" top="614" right="1290" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="490" top="164" right="590" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="490" top="304" right="590" bottom="336"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="490" top="354" right="590" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP123" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="计算key">
<Rect left="490" top="404" right="590" bottom="436"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x41641375"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="发送key">
<Rect left="490" top="454" right="590" bottom="486"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP124" type="8" flags="97"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="通讯">
<Rect left="490" top="214" right="590" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(100)

#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment no="21" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="通讯失败">
<Rect left="70" top="214" right="170" bottom="246"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="结束通讯">
<Rect left="70" top="164" right="170" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="自动测试">
<Rect left="490" top="514" right="590" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开左后门门灯"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2F 0xCF 0xA2 0x03 0x01
engine.Delay(2000)</Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="左后门灯打开">
<Rect left="490" top="564" right="590" bottom="596"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x3D 0x23
if (@3==0x01) then
  engine.LastError = 0;
    engine.SetLineText(2,"#L=门灯打开状态#R=bmpok")
else
       engine.SetLineText(2,"#L=门灯打开状态#R=bmpnok")
  engine.LastError = 1;
  engine.TestResult = 1;
end

engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="247" ActivityType="3" flags="1" name="自动测试">
<Rect left="670" top="514" right="770" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动关闭左后门灯"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2F 0xCF 0xA2 0x03 0x00</Script></Activity>
<Activity id="248" ActivityType="3" flags="0" name="左后门灯关闭">
<Rect left="670" top="564" right="770" bottom="596"/>
<Strategy TotalTime="5" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x03d 0x23
if (@3==0x00) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=门灯关闭状态#R=bmpok")
else
  engine.SetLineText(2,"#L=门灯关闭状态#R=bmpnok")
  engine.LastError = 1;
 engine.TestResult = 1;
end

 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP599" type="8" flags="97"/>
</Activity>
<Activity id="249" ActivityType="3" flags="0" name="反回控制">
<Rect left="670" top="614" right="770" bottom="646"/>
<Script>#COMM 0x2f  0xcf 0xA2 0x00








</Script></Activity>
<Activity id="253" ActivityType="3" flags="0" name="自动测试">
<Rect left="840" top="514" right="940" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行左后门玻璃下降"/>
<Line3Text Enable="1"/>
<Script>#COMM  0x2F 0xcf 0xa1 0x03 0x02
--engine.Delay(2000)</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="判断下降状态">
<Rect left="840" top="564" right="940" bottom="596"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x3d 0x21
if (@3==0x06) then
  engine.LastError = 0;
    engine.SetLineText(2,"#L=玻璃下降#R=bmpok")
else
    engine.SetLineText(2,"#L=玻璃下降#R=bmpok")
  engine.LastError = 1;
  engine.TestResult = 1;
end

 engine.println(" engine.LastError=".. engine.LastError);



local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP600" type="8" flags="97"/>
</Activity>
<Activity id="261" ActivityType="3" flags="0" name="自动测试">
<Rect left="990" top="244" right="1090" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行左后门玻璃上升"/>
<Line3Text Enable="1"/>
<Script>#COMM  0x2F 0xcf 0xa1 0x03 0x01
engine.Delay(2000)







</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="判断上升状态">
<Rect left="990" top="294" right="1090" bottom="326"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x3d 0x21
if (@3==0x05) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=玻璃上升状态#R=bmpok")
 engine.println(" engine.LastError=".. engine.LastError);
else
 engine.SetLineText(2,"#L=玻璃上升状态#R=bmpnok")
  engine.LastError = 1;
 engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP601" type="8" flags="97"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="返回控制">
<Rect left="990" top="344" right="1090" bottom="376"/>
<Script>#COMM 0x2F 0xcf 0xa1 0x00





</Script></Activity>
<Activity id="269" ActivityType="3" flags="0" name="反回控制">
<Rect left="490" top="614" right="590" bottom="646"/>
<Script>#COMM 0x2f  0xcf 0xA2 0x00








</Script></Activity>
<Activity id="270" ActivityType="3" flags="0" name="返回控制">
<Rect left="840" top="614" right="940" bottom="646"/>
<Script>#COMM   0x2f  0xcf 0xa1 0x00








</Script></Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="724" right="1256" bottom="756"/>
</Activity>
<Activity id="276" ActivityType="3" flags="0" name="手动自学习">
<Rect left="1190" top="514" right="1290" bottom="546"/>
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
end</Script><assessment no="29" name="DEP1117" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="274" type="0">
</Transition>
<Transition StartId="5" EndId="138" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="142" type="0">
</Transition>
<Transition StartId="138" EndId="6" type="3">
</Transition>
<Transition StartId="138" EndId="139" type="4">
</Transition>
<Transition StartId="139" EndId="141" type="0">
</Transition>
<Transition StartId="139" EndId="2" type="5">
</Transition>
<Transition StartId="141" EndId="5" type="0">
</Transition>
<Transition StartId="142" EndId="246" type="0">
</Transition>
<Transition StartId="246" EndId="269" type="0">
</Transition>
<Transition StartId="247" EndId="248" type="0">
</Transition>
<Transition StartId="248" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="270" type="0">
</Transition>
<Transition StartId="261" EndId="262" type="0">
</Transition>
<Transition StartId="262" EndId="264" type="0">
</Transition>
<Transition StartId="269" EndId="247" type="0">
</Transition>
<Transition StartId="270" EndId="4" type="0">
</Transition>
<Transition StartId="274" EndId="2" type="0">
</Transition>
<Transition StartId="276" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

