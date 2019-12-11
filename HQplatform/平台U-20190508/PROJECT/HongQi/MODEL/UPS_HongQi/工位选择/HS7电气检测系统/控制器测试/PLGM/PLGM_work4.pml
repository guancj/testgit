<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x76C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="660" top="94" right="760" bottom="126"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="110" top="2424" right="210" bottom="2456"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电动尾门">
<Rect left="660" top="154" right="760" bottom="186"/>
<TitleText Enable="1" Text="电动尾门控制器（PLGM）"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="660" top="314" right="760" bottom="346"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="660" top="204" right="760" bottom="236"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="660" top="364" right="760" bottom="396"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="660" top="414" right="760" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="发送key">
<Rect left="660" top="514" right="760" bottom="546"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script></Activity>
<Activity id="14" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="660" top="464" right="760" bottom="496"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xC2F1F1E4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="通讯">
<Rect left="660" top="254" right="760" bottom="286"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="通讯失败">
<Rect left="500" top="254" right="600" bottom="286"/>
<Line1Text Enable="1" Text="PLGM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="结束通讯">
<Rect left="500" top="204" right="600" bottom="236"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="室内开启行李箱准备1">
<Rect left="660" top="584" right="760" bottom="616"/>
<Line1Text Enable="1" Text="确定后备箱是关闭状态"/>
<Line2Text Enable="1" Text="OK?"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="271" ActivityType="3" flags="0" name="室内开启行李箱准备2">
<Rect left="660" top="644" right="760" bottom="676"/>
<Line1Text Enable="1" Text="车辆为静止状态并且点火开关ON档"/>
<Line2Text Enable="1" Text="OK?"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="273" ActivityType="3" flags="0" name="打开行李箱">
<Rect left="660" top="704" right="760" bottom="736"/>
<Line1Text Enable="1" Text="请在室内开启行李箱"/>
<Line2Text Enable="1"/>
<Script></Script></Activity>
<Activity id="274" ActivityType="3" flags="0" name="读取室内行李箱开关状态">
<Rect left="660" top="764" right="760" bottom="796"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x01)
if (aa==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="275" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="764" right="630" bottom="796"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="276" ActivityType="3" flags="0" name="读取后备箱锁状态">
<Rect left="660" top="814" right="760" bottom="846"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x02
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@4);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="277" ActivityType="3" flags="0" name="读取行李箱灯的状态">
<Rect left="660" top="864" right="760" bottom="896"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x03
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="278" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="864" right="630" bottom="896"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="279" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="814" right="630" bottom="846"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="280" ActivityType="3" flags="0" name="延时">
<Rect left="660" top="924" right="760" bottom="956"/>
<Script>engine.Delay(500);</Script></Activity>
<Activity id="281" ActivityType="3" flags="0" name="按行李箱内侧开关关闭行李箱">
<Rect left="660" top="984" right="760" bottom="1016"/>
<Line1Text Enable="1" Text="请按行李箱内侧开关关闭行李箱"/>
<Line2Text Enable="1"/>
<Script></Script></Activity>
<Activity id="282" ActivityType="3" flags="0" name="读取行李箱内侧开关状态">
<Rect left="660" top="1044" right="760" bottom="1076"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x04)
if (aa==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="283" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="1044" right="630" bottom="1076"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="284" ActivityType="3" flags="0" name="读取行李箱开启状态">
<Rect left="660" top="1094" right="760" bottom="1126"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x05) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@4);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="285" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="1094" right="630" bottom="1126"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="288" ActivityType="3" flags="0" name="延时">
<Rect left="660" top="1154" right="760" bottom="1186"/>
<Script>engine.Delay(500);</Script></Activity>
<Activity id="290" ActivityType="3" flags="0" name="按行李箱外侧开关打开行李箱">
<Rect left="660" top="1214" right="760" bottom="1246"/>
<Line1Text Enable="1" Text="请按行李箱外侧开关打开行李箱"/>
<Line2Text Enable="1"/>
<Script></Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="读取行李箱外侧开关状态">
<Rect left="660" top="1274" right="760" bottom="1306"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x02)
if (aa==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="292" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1274" right="640" bottom="1306"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="293" ActivityType="3" flags="0" name="读取行李箱开启状态">
<Rect left="660" top="1334" right="760" bottom="1366"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x04) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="294" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1334" right="640" bottom="1366"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="295" ActivityType="3" flags="0" name="延时">
<Rect left="660" top="1394" right="760" bottom="1426"/>
<Script>engine.Delay(500);</Script></Activity>
<Activity id="296" ActivityType="3" flags="0" name="内测开关关闭时防夹">
<Rect left="660" top="1454" right="760" bottom="1486"/>
<Line1Text Enable="1" Text="请按内侧开关关闭"/>
<Line2Text Enable="1" Text="行李箱执行关闭一半时阻止关闭"/>
<Script></Script></Activity>
<Activity id="297" ActivityType="3" flags="1" name="读取行李箱开启状态">
<Rect left="660" top="1514" right="760" bottom="1546"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="298" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1514" right="640" bottom="1546"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="299" ActivityType="3" flags="0" name="读取防夹报警输出状态">
<Rect left="660" top="1574" right="760" bottom="1606"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x06
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="300" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1574" right="640" bottom="1606"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="301" ActivityType="3" flags="0" name="人工确认">
<Rect left="660" top="1634" right="760" bottom="1666"/>
<Line1Text Enable="1" Text="撤去外力再次按下内侧开关"/>
<Line2Text Enable="1" Text="行李箱开启了吗？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end
</Script></Activity>
<Activity id="302" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1634" right="640" bottom="1666"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="303" ActivityType="3" flags="0" name="人工操作">
<Rect left="660" top="1704" right="760" bottom="1736"/>
<Line1Text Enable="1" Text="请将行李箱关闭"/>
<Script>--延时5S
engine.Delay(5000);
</Script></Activity>
<Activity id="304" ActivityType="3" flags="0" name="行李箱外侧开关开启防撞">
<Rect left="660" top="1764" right="760" bottom="1796"/>
<Line1Text Enable="1" Text="请按行李箱外侧开关开启行李箱"/>
<Line2Text Enable="1" Text="开启一半时施加外力阻止开启"/>
<Script></Script></Activity>
<Activity id="305" ActivityType="3" flags="0" name="读取行李箱开启状态">
<Rect left="660" top="1824" right="760" bottom="1856"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="306" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1824" right="640" bottom="1856"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="307" ActivityType="3" flags="0" name="读取防撞报警输出状态">
<Rect left="660" top="1884" right="760" bottom="1916"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x01 0x07
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="308" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1884" right="640" bottom="1916"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="309" ActivityType="3" flags="0" name="人工确认">
<Rect left="660" top="1944" right="760" bottom="1976"/>
<Line1Text Enable="1" Text="撤去外力再次按下外侧开关"/>
<Line2Text Enable="1" Text="行李箱关闭了吗"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end
</Script></Activity>
<Activity id="310" ActivityType="3" flags="0" name="检测失败">
<Rect left="540" top="1944" right="640" bottom="1976"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="311" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="2004" right="726" bottom="2036"/>
</Activity>
<Activity id="312" ActivityType="3" flags="0" name="脚踢开关功能1">
<Rect left="660" top="2064" right="760" bottom="2096"/>
<Line1Text Enable="1" Text="IG OFF;"/>
<Line2Text Enable="1" Text="行李箱处于关闭状态"/>
<Line3Text Enable="1" Text="携带智能钥匙触发脚踢开关"/>
<Line4Text Enable="1" Text="行李箱开启？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end</Script></Activity>
<Activity id="313" ActivityType="3" flags="0" name="脚踢开关功能2">
<Rect left="660" top="2124" right="760" bottom="2156"/>
<Line1Text Enable="1" Text="IG OFF;"/>
<Line2Text Enable="1" Text="行李箱处于关闭状态"/>
<Line3Text Enable="1" Text="携带智能钥匙触发脚踢开关"/>
<Line4Text Enable="1" Text="行李箱灯点亮？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end</Script></Activity>
<Activity id="314" ActivityType="3" flags="0" name="脚踢开关功能3">
<Rect left="660" top="2184" right="760" bottom="2216"/>
<Line1Text Enable="1" Text="IG OFF;"/>
<Line2Text Enable="1" Text="行李箱处于关闭状态"/>
<Line3Text Enable="1" Text="携带智能钥匙触发脚踢开关"/>
<Line4Text Enable="1" Text="高位制动灯点亮？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end</Script></Activity>
<Activity id="315" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="2064" right="630" bottom="2096"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="316" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="2124" right="630" bottom="2156"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="317" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="2184" right="630" bottom="2216"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="318" ActivityType="3" flags="0" name="遥控行李箱功能1">
<Rect left="660" top="2284" right="760" bottom="2316"/>
<Line1Text Enable="1" Text="IG OFF"/>
<Line2Text Enable="1" Text="行李箱处于闭锁状态"/>
<Line3Text Enable="1" Text="按下遥控钥匙行李箱开启按钮大于2S"/>
<Line4Text Enable="1" Text="行李箱完全开启了吗？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end</Script></Activity>
<Activity id="319" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="2234" right="726" bottom="2266"/>
</Activity>
<Activity id="320" ActivityType="3" flags="0" name="遥控行李箱功能2">
<Rect left="660" top="2354" right="760" bottom="2386"/>
<Line1Text Enable="1" Text="IG OFF"/>
<Line2Text Enable="1" Text="行李箱处于闭锁状态"/>
<Line3Text Enable="1" Text="按下遥控钥匙行李箱开启按钮大于2S"/>
<Line4Text Enable="1" Text="行李箱灯点亮？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError=0;
elseif(engine.LButtonPressed==true)then
	engine.LastError=1;
else
end</Script></Activity>
<Activity id="321" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="2284" right="630" bottom="2316"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="322" ActivityType="3" flags="0" name="检测失败">
<Rect left="530" top="2354" right="630" bottom="2386"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="323" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="2424" right="726" bottom="2456"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="116" type="0">
</Transition>
<Transition StartId="14" EndId="13" type="0">
</Transition>
<Transition StartId="15" EndId="17" type="4">
</Transition>
<Transition StartId="15" EndId="4" type="3">
</Transition>
<Transition StartId="17" EndId="115" type="0">
</Transition>
<Transition StartId="17" EndId="2" type="5">
</Transition>
<Transition StartId="115" EndId="5" type="0">
</Transition>
<Transition StartId="116" EndId="271" type="6">
</Transition>
<Transition StartId="271" EndId="273" type="6">
</Transition>
<Transition StartId="273" EndId="274" type="0">
</Transition>
<Transition StartId="274" EndId="275" type="4">
</Transition>
<Transition StartId="274" EndId="276" type="0">
</Transition>
<Transition StartId="275" EndId="276" type="0">
</Transition>
<Transition StartId="276" EndId="277" type="0">
</Transition>
<Transition StartId="276" EndId="279" type="4">
</Transition>
<Transition StartId="277" EndId="278" type="4">
</Transition>
<Transition StartId="277" EndId="280" type="0">
</Transition>
<Transition StartId="278" EndId="280" type="0">
</Transition>
<Transition StartId="279" EndId="277" type="0">
</Transition>
<Transition StartId="280" EndId="281" type="0">
</Transition>
<Transition StartId="281" EndId="282" type="0">
</Transition>
<Transition StartId="282" EndId="283" type="4">
</Transition>
<Transition StartId="282" EndId="284" type="0">
</Transition>
<Transition StartId="283" EndId="284" type="0">
</Transition>
<Transition StartId="284" EndId="285" type="4">
</Transition>
<Transition StartId="284" EndId="288" type="0">
</Transition>
<Transition StartId="285" EndId="288" type="0">
</Transition>
<Transition StartId="288" EndId="290" type="0">
</Transition>
<Transition StartId="290" EndId="291" type="0">
</Transition>
<Transition StartId="291" EndId="293" type="0">
</Transition>
<Transition StartId="291" EndId="292" type="4">
</Transition>
<Transition StartId="292" EndId="293" type="0">
</Transition>
<Transition StartId="293" EndId="294" type="4">
</Transition>
<Transition StartId="293" EndId="295" type="0">
</Transition>
<Transition StartId="294" EndId="295" type="0">
</Transition>
<Transition StartId="295" EndId="296" type="0">
</Transition>
<Transition StartId="296" EndId="297" type="0">
</Transition>
<Transition StartId="297" EndId="299" type="0">
</Transition>
<Transition StartId="297" EndId="298" type="4">
</Transition>
<Transition StartId="298" EndId="299" type="0">
</Transition>
<Transition StartId="299" EndId="301" type="0">
</Transition>
<Transition StartId="299" EndId="300" type="4">
</Transition>
<Transition StartId="300" EndId="301" type="0">
</Transition>
<Transition StartId="301" EndId="302" type="4">
</Transition>
<Transition StartId="301" EndId="303" type="0">
</Transition>
<Transition StartId="303" EndId="304" type="0">
</Transition>
<Transition StartId="304" EndId="305" type="0">
</Transition>
<Transition StartId="305" EndId="306" type="4">
</Transition>
<Transition StartId="306" EndId="307" type="0">
</Transition>
<Transition StartId="307" EndId="309" type="0">
</Transition>
<Transition StartId="307" EndId="308" type="4">
</Transition>
<Transition StartId="308" EndId="309" type="0">
</Transition>
<Transition StartId="309" EndId="310" type="4">
</Transition>
<Transition StartId="309" EndId="311" type="0">
</Transition>
<Transition StartId="310" EndId="311" type="0">
</Transition>
<Transition StartId="311" EndId="312" type="0">
</Transition>
<Transition StartId="312" EndId="315" type="4">
</Transition>
<Transition StartId="312" EndId="313" type="0">
</Transition>
<Transition StartId="313" EndId="314" type="0">
</Transition>
<Transition StartId="313" EndId="316" type="4">
</Transition>
<Transition StartId="314" EndId="317" type="4">
</Transition>
<Transition StartId="314" EndId="319" type="0">
</Transition>
<Transition StartId="315" EndId="313" type="0">
</Transition>
<Transition StartId="316" EndId="314" type="0">
</Transition>
<Transition StartId="317" EndId="319" type="0">
</Transition>
<Transition StartId="318" EndId="320" type="0">
</Transition>
<Transition StartId="318" EndId="321" type="4">
</Transition>
<Transition StartId="319" EndId="318" type="0">
</Transition>
<Transition StartId="320" EndId="322" type="4">
</Transition>
<Transition StartId="320" EndId="323" type="0">
</Transition>
<Transition StartId="321" EndId="320" type="0">
</Transition>
<Transition StartId="322" EndId="323" type="0">
</Transition>
<Transition StartId="323" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

