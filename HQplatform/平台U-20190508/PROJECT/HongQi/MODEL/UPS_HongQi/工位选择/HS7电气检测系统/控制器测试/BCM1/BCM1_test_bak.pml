<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3027" pbltext="DEP41">
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="220" top="14" right="320" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="660" top="874" right="760" bottom="906"/>
<Script>#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="打开发动机机盖读状态">
<Rect left="1050" top="14" right="1150" bottom="46"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x2A
if (@3==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=手动打开发动机箱盖".."#R=bmpok")
else
  engine.LastError = 1;
  engine.SetLineText(1,"#L=手动打开发动机箱盖".."#R=bmpnok")

end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="129" name="DEP714" type="8" flags="97"/>
</Activity>
<Activity id="441" ActivityType="3" flags="0" name="关闭发动机机盖读状态">
<Rect left="1050" top="154" right="1150" bottom="186"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x2A
if (@3==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=手动关闭发动机箱盖".."#R=bmpok")
else
  engine.LastError = 1;
  engine.SetLineText(1,"#L=手动关闭发动机箱盖".."#R=bmpnok")


end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="130" name="DEP715" type="8" flags="97"/>
</Activity>
<Activity id="443" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="220" top="84" right="320" bottom="116"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="444" ActivityType="3" flags="0" name="清DTC">
<Rect left="220" top="304" right="320" bottom="336"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="125" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="445" ActivityType="3" flags="0" name="连接ECU">
<Rect left="220" top="164" right="320" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="446" ActivityType="3" flags="0" name="切诊断">
<Rect left="220" top="364" right="320" bottom="396"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="126" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="447" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="220" top="434" right="320" bottom="466"/>
<Line2Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="127" name="DEP44" type="8" flags="97"/>
</Activity>
<Activity id="448" ActivityType="3" flags="0" name="发送key">
<Rect left="220" top="584" right="320" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="128" name="DEP45" type="8" flags="97"/>
</Activity>
<Activity id="449" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="220" top="504" right="320" bottom="536"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="450" ActivityType="3" flags="0" name="通讯">
<Rect left="220" top="244" right="320" bottom="276"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="124" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="451" ActivityType="3" flags="0" name="通讯失败">
<Rect left="40" top="194" right="140" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="通讯失败，程序退出"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.TestResult = 1;
#STOPCOMM</Script></Activity>
<Activity id="452" ActivityType="3" flags="0" name="结束通讯">
<Rect left="40" top="104" right="140" bottom="136"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="479" ActivityType="3" flags="0" name="打开远近光灯">
<Rect left="660" top="14" right="760" bottom="46"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察大灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x01 </Script><assessment no="131" name="DEP1233" type="8" flags="97"/>
</Activity>
<Activity id="484" ActivityType="3" flags="0" name="打开前雾灯">
<Rect left="660" top="134" right="760" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察前雾灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x02</Script><assessment no="136" name="DEP1234" type="8" flags="97"/>
</Activity>
<Activity id="492" ActivityType="3" flags="0" name="打开室内灯">
<Rect left="410" top="124" right="510" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察前排室内灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x03 </Script><assessment no="138" name="DEP2101" type="8" flags="97"/>
</Activity>
<Activity id="499" ActivityType="3" flags="0" name="打开阅读灯">
<Rect left="410" top="244" right="510" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察后排左右阅读灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x04</Script><assessment no="140" name="DEP2103" type="8" flags="97"/>
</Activity>
<Activity id="506" ActivityType="3" flags="0" name="雨刷器检测">
<Rect left="1180" top="14" right="1280" bottom="46"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察前雨刷器打开"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x00</Script><assessment no="142" name="DEP1235" type="8" flags="97"/>
</Activity>
<Activity id="512" ActivityType="3" flags="0" name="打开日间行车灯">
<Rect left="660" top="534" right="760" bottom="566"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察日间行车灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM  0x2F 0x02 0x14 0x03 0x01</Script><assessment no="93" name="DEP2301" type="8" flags="97"/>
</Activity>
<Activity id="541" ActivityType="3" flags="0" name="打开氛围灯">
<Rect left="410" top="384" right="510" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察氛围灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM  0x2F 0x02 0x17 0x03 0x04
</Script><assessment no="97" name="DEP2304" type="8" flags="97"/>
</Activity>
<Activity id="542" ActivityType="3" flags="0" name="氛围灯自动测试">
<Rect left="410" top="444" right="510" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取氛围灯状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x3E
if (@3==0x04) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=LibGeneral.hex2str(StringRes)</Script><assessment no="76" name="DEP2295" type="8" flags="97"/>
</Activity>
<Activity id="544" ActivityType="3" flags="0" name="关闭氛围灯">
<Rect left="410" top="634" right="510" bottom="666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察关闭氛围灭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM  0x2F 0x02 0x17 0x03 0x00</Script><assessment no="98" name="DEP2305" type="8" flags="97"/>
</Activity>
<Activity id="545" ActivityType="3" flags="1" name="氛围灯自动测试">
<Rect left="410" top="694" right="510" bottom="726"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取氛围灯状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x3E
if (@3==0x00) then
  engine.LastError = 0;
  --  engine.SetLineText(2,"#L=氛围灯关闭状态".."#R=bmpok")
else
  engine.LastError = 1;
  -- engine.SetLineText(2,"#L=氛围灯关闭状态".."#R=bmpnok")

end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="79" name="DEP2297" type="8" flags="97"/>
</Activity>
<Activity id="546" ActivityType="3" flags="0" name="返回控制">
<Rect left="410" top="834" right="510" bottom="866"/>
<Script>#COMM  0x2F 0x02 0x17 0x00</Script></Activity>
<Activity id="548" ActivityType="3" flags="0" name="关闭日间行车灯">
<Rect left="660" top="274" right="760" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察关闭日间行车灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM  0x2F 0x02 0x14 0x03 0x00</Script><assessment no="90" name="DEP2298" type="8" flags="97"/>
</Activity>
<Activity id="555" ActivityType="3" flags="0" name="手动确认">
<Rect left="660" top="74" right="760" bottom="106"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(2,"#L=请确认大灯点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
  engine.TestResult = 1;
else
end
</Script><assessment no="132" name="DEP716" type="8" flags="97"/>
</Activity>
<Activity id="558" ActivityType="3" flags="0" name="手动确认">
<Rect left="660" top="204" right="760" bottom="236"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(2,"#L=请确认前雾灯点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
else
end</Script><assessment no="137" name="DEP699" type="8" flags="97"/>
</Activity>
<Activity id="561" ActivityType="3" flags="0" name="手动确认">
<Rect left="410" top="184" right="510" bottom="216"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认前排室内灯点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
else
end</Script><assessment no="139" name="DEP2102" type="8" flags="97"/>
</Activity>
<Activity id="564" ActivityType="3" flags="0" name="手动确认">
<Rect left="410" top="314" right="510" bottom="346"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认后排阅读灯点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
else
end</Script><assessment no="141" name="DEP2104" type="8" flags="97"/>
</Activity>
<Activity id="566" ActivityType="3" flags="0" name="手动确认">
<Rect left="1180" top="74" right="1280" bottom="106"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认雨刷器打开#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
else
end</Script><assessment no="143" name="DEP717" type="8" flags="97"/>
</Activity>
<Activity id="571" ActivityType="3" flags="0" name="日间行车灯结果">
<Rect left="660" top="334" right="760" bottom="366"/>
<Script>#COMM 0x22 0x01 0x37
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="91" name="DEP2299" type="8" flags="97"/>
</Activity>
<Activity id="572" ActivityType="3" flags="0" name="日间行车灯结果">
<Rect left="660" top="604" right="760" bottom="636"/>
<Script>#COMM 0x22 0x01 0x37
if (@3==0x01) then
  engine.LastError = 0;

else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="94" name="DEP2302" type="8" flags="97"/>
</Activity>
<Activity id="573" ActivityType="3" flags="0" name="返回控制">
<Rect left="660" top="734" right="760" bottom="766"/>
<Script>#COMM  0x2F 0x02 0x14 0x00</Script></Activity>
<Activity id="587" ActivityType="3" flags="0" name="普通节点">
<Rect left="1050" top="84" right="1150" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请走到车前关闭发动机盖并且开始检测灯光状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="588" ActivityType="3" flags="0" name="手动确认">
<Rect left="660" top="404" right="760" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认日间行车灯关闭#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
 else
end</Script><assessment no="92" name="DEP2300" type="8" flags="97"/>
</Activity>
<Activity id="589" ActivityType="3" flags="0" name="手动确认">
<Rect left="660" top="674" right="760" bottom="706"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认日间行车灯打开#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
else
end</Script><assessment no="95" name="DEP2303" type="8" flags="97"/>
</Activity>
<Activity id="590" ActivityType="3" flags="0" name="手动确认">
<Rect left="410" top="504" right="510" bottom="536"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认氛围灯打开#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;
  engine.TestResult = 1;
else
end</Script><assessment no="75" name="DEP2294" type="8" flags="97"/>
</Activity>
<Activity id="591" ActivityType="3" flags="0" name="手动确认">
<Rect left="410" top="764" right="510" bottom="796"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script> engine.SetLineText(1,"#L=请确认氛围灯关闭#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
  engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
  engine.LastError = 1;

else
end</Script><assessment no="145" name="DEP2296" type="8" flags="97"/>
</Activity>
<Activity id="592" ActivityType="3" flags="0" name="返回控制">
<Rect left="660" top="474" right="760" bottom="506"/>
<Script>#COMM  0x2F 0x02 0x14 0x00</Script></Activity>
<Activity id="593" ActivityType="3" flags="0" name="返回控制">
<Rect left="410" top="564" right="510" bottom="596"/>
<Script>#COMM  0x2F 0x02 0x17 0x00</Script></Activity>
<Activity id="594" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="660" top="804" right="760" bottom="836"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="600" ActivityType="3" flags="0" name="打开DOOR开关">
<Rect left="410" top="64" right="510" bottom="96"/>
<Line1Text Enable="1" Text="确定所有车门关闭"/>
<Line2Text Enable="1" Text="打开室内灯DOOR开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="602" ActivityType="3" flags="0" name="打开发动机机盖读状态">
<Rect left="220" top="634" right="320" bottom="666"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Line1Text Enable="1" Text="获取发动机盖打开状态"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x2A
if(@3==0x01) then 
local recvTel = @0-;
engine.println("打开发动机盖OK");
engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	
else
engine.println("打开发动机盖NOK");
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end </Script><assessment no="135" name="DEP714" type="8" flags="97"/>
</Activity>
<Activity id="603" ActivityType="3" flags="0" name="打开危险报警灯">
<Rect left="220" top="694" right="320" bottom="726"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="打开危险报警灯"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="605" ActivityType="3" flags="0" name="关闭危险报警灯手动确认">
<Rect left="100" top="844" right="200" bottom="876"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="关闭危险报警灯"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯灭了吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯灭了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==false)then
   engine.SetLineText(1,"#L=仪表盘报警灯灭了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="606" ActivityType="3" flags="0" name="获取打开报警灯状态">
<Rect left="220" top="744" right="320" bottom="776"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="#L=仪表盘报警灯闪烁吗？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#COMM  0x22 0x01 0x27
if(@3 == 01)then
engine.LastError = 0;
 engine.SetLineText(2,"打开成功");
else
engine.LastError = 1;
end
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end
#PRESSBUTTON
</Script></Activity>
<Activity id="607" ActivityType="3" flags="0" name="危险报警灯开关手动确认">
<Rect left="100" top="784" right="200" bottom="816"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯闪烁吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯闪烁吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed== false)then
   engine.SetLineText(1,"#L=仪表盘报警灯闪烁吗？#R=BMPOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="608" ActivityType="3" flags="0" name="关闭危险报警灯">
<Rect left="220" top="794" right="320" bottom="826"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="关闭危险报警灯"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="610" ActivityType="3" flags="0" name="获取关闭报警灯状态">
<Rect left="220" top="844" right="320" bottom="876"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="#L=仪表盘报警灯灭了吗？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x22 0x01 0x27
if(@3 == 00)then
engine.LastError = 0;
 engine.SetLineText(2,"关闭成功");
else
engine.LastError = 1;

end
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end
#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="443" type="0">
</Transition>
<Transition StartId="4" EndId="587" type="0">
</Transition>
<Transition StartId="443" EndId="445" type="0">
</Transition>
<Transition StartId="444" EndId="446" type="0">
</Transition>
<Transition StartId="445" EndId="450" type="0">
</Transition>
<Transition StartId="446" EndId="447" type="0">
</Transition>
<Transition StartId="446" EndId="447" type="0">
</Transition>
<Transition StartId="447" EndId="449" type="0">
</Transition>
<Transition StartId="448" EndId="602" type="0">
</Transition>
<Transition StartId="449" EndId="448" type="0">
</Transition>
<Transition StartId="450" EndId="444" type="3">
</Transition>
<Transition StartId="450" EndId="451" type="4">
</Transition>
<Transition StartId="479" EndId="555" type="0">
</Transition>
<Transition StartId="484" EndId="558" type="0">
</Transition>
<Transition StartId="492" EndId="561" type="0">
</Transition>
<Transition StartId="499" EndId="564" type="0">
</Transition>
<Transition StartId="506" EndId="566" type="0">
</Transition>
<Transition StartId="512" EndId="572" type="0">
</Transition>
<Transition StartId="541" EndId="542" type="0">
</Transition>
<Transition StartId="542" EndId="590" type="0">
</Transition>
<Transition StartId="544" EndId="545" type="0">
</Transition>
<Transition StartId="545" EndId="591" type="0">
</Transition>
<Transition StartId="546" EndId="479" type="0">
</Transition>
<Transition StartId="548" EndId="571" type="0">
</Transition>
<Transition StartId="555" EndId="484" type="0">
</Transition>
<Transition StartId="558" EndId="548" type="0">
</Transition>
<Transition StartId="561" EndId="499" type="0">
</Transition>
<Transition StartId="564" EndId="479" type="1">
<Expression>LibGeneral.HS7_NotAmbientLight(engine.CarType)</Expression></Transition>
<Transition StartId="564" EndId="541" type="0">
</Transition>
<Transition StartId="571" EndId="588" type="0">
</Transition>
<Transition StartId="572" EndId="589" type="0">
</Transition>
<Transition StartId="573" EndId="594" type="0">
</Transition>
<Transition StartId="587" EndId="441" type="0">
</Transition>
<Transition StartId="588" EndId="592" type="0">
</Transition>
<Transition StartId="589" EndId="573" type="0">
</Transition>
<Transition StartId="590" EndId="593" type="0">
</Transition>
<Transition StartId="591" EndId="546" type="0">
</Transition>
<Transition StartId="592" EndId="512" type="0">
</Transition>
<Transition StartId="593" EndId="544" type="0">
</Transition>
<Transition StartId="594" EndId="2" type="0">
</Transition>
<Transition StartId="600" EndId="492" type="0">
</Transition>
<Transition StartId="602" EndId="600" type="0">
</Transition>
<Transition StartId="603" EndId="606" type="0">
</Transition>
<Transition StartId="606" EndId="608" type="0">
</Transition>
<Transition StartId="608" EndId="610" type="0">
</Transition>
</Transitions>
</Process>

