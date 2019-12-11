<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1201" pbltext="DEP1243">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="283" right="383" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="685" top="1217" right="785" bottom="1249"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="284" top="120" right="384" bottom="152"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="DVE自学习条件检测">
<Rect left="283" top="62" right="383" bottom="94"/>
<TitleText Enable="1" Text="DVE自学习条件检测"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="清DTC">
<Rect left="285" top="216" right="385" bottom="248"/>
<Line1Text Enable="1" Text="EMS清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3003" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="发动机进气温度">
<Rect left="679" top="607" right="779" bottom="639"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机进气温度"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="发动机进气温度">
<Rect left="680" top="656" right="780" bottom="688"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x01 0x0d
if(@0==0x62)then
resu = @3;
airTmp=resu*0.75-48;
engine.println("发动机进气温度".. airTmp);
if (airTmp&gt;=5.25 and airTmp &lt;=143.25) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."5.25"..",".."143.25"..",".."1"..","..tostring(airTmp).."#R=C");
engine.StatValue=airTmp;
engine.StatLower=5.25;
engine.StatUpper=143.25;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="34" name="DEP447" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="发动机水温">
<Rect left="679" top="446" right="779" bottom="478"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机水温"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="检测失败">
<Rect left="567" top="658" right="667" bottom="690"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="发动机水温">
<Rect left="679" top="493" right="779" bottom="525"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x01 0x2F
if(@0==0x62)then
resu = @3;
engineTmp=resu*0.75-48;
engine.println("发动机水温"..engineTmp);
if (engineTmp&gt;=5.25 and engineTmp&lt;= 100.5) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."5.25"..",".."100.5"..",".."1"..","..tostring(engineTmp).."#R=C");
engine.StatValue=engineTmp;
engine.StatLower=5.25;
engine.StatUpper=100.5;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="55" name="DEP1247" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="检测失败">
<Rect left="561" top="496" right="661" bottom="528"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="转速">
<Rect left="678" top="278" right="778" bottom="310"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机进气温度"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="转速">
<Rect left="679" top="336" right="779" bottom="368"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x01 0x04
if(@0==0x62)then
resu = (@3 * 256 + @4) ;
engineSpeed=resu*0.25+0;
--engine.SetLineText(3,engineSpeed);
engine.println("发动机转速"..engineSpeed);
if ( engineSpeed&lt;= 250) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."0.0"..",".."250.0"..",".."1"..","..tostring(engineSpeed).."#R=rpm");
engine.StatValue=engineSpeed;
engine.StatLower=0;
engine.StatUpper=250;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="36" name="DEP1246" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="检测失败">
<Rect left="557" top="335" right="657" bottom="367"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="电瓶电压">
<Rect left="684" top="929" right="784" bottom="961"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="电瓶电压"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="电瓶电压">
<Rect left="684" top="976" right="784" bottom="1008"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x01 0x0a
if(@0==0x62)then
resu = @3*256 + @4;
batteryVol=resu*0.000390625+0;
engine.println("电瓶电压"..batteryVol);
if (batteryVol&gt;=10 and batteryVol&lt;=25.5) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."10.0"..",".."25.5"..",".."1"..","..tostring(batteryVol).."#R=V");
engine.StatValue=batteryVol;
engine.StatLower=10;
engine.StatUpper=25.5;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="38" name="DEP452" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="检测失败">
<Rect left="562" top="977" right="662" bottom="1009"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="车速">
<Rect left="677" top="118" right="777" bottom="150"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="车速"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="车速">
<Rect left="676" top="167" right="776" bottom="199"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x01 0x08
if(@0==0x62)then
resu = (@3 * 256 + @4) ;
vehicleSpeed=resu*0.0078125+0;
engine.SetLineText(3,vehicleSpeed);
engine.println("车速".. vehicleSpeed);
if (vehicleSpeed==0) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=vehicleSpeed;
engine.StatPoint=0;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="41" name="DEP1245" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="558" top="167" right="658" bottom="199"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="284" top="316" right="384" bottom="348"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3034" name="DEP146" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="13" flags="0" name="计算key">
<Rect left="284" top="366" right="384" bottom="398"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x7D8AAC7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="发送key">
<Rect left="284" top="414" right="384" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3035" name="DEP147" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="284" top="267" right="384" bottom="299"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3004" name="DEP1098" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="685" top="1162" right="785" bottom="1194"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="通讯">
<Rect left="284" top="168" right="384" bottom="200"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3000" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="397" top="168" right="497" bottom="200"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="结束通讯">
<Rect left="397" top="118" right="497" bottom="150"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="201" ActivityType="4" flags="0" name="路由节点">
<Rect left="711" top="223" right="743" bottom="255"/>
</Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="712" top="390" right="744" bottom="422"/>
</Activity>
<Activity id="207" ActivityType="4" flags="0" name="路由节点">
<Rect left="712" top="550" right="744" bottom="582"/>
</Activity>
<Activity id="208" ActivityType="4" flags="0" name="路由节点">
<Rect left="715" top="710" right="747" bottom="742"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="油门踏板开度">
<Rect left="682" top="770" right="782" bottom="802"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="电子油门踏板开度"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="电子节气门开度">
<Rect left="682" top="815" right="782" bottom="847"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="2"/>
<Script>#COMM 0x22 0x20 0x01
if(@0==0x62)then
resu = @3;
throttlePos=resu*0.390625;
engine.println("电子节气门开度&amp;油门口踏板开度"..throttlePos);
if (throttlePos&lt;= 14.9) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."0.0"..",".."14.9"..",".."1"..","..tostring(throttlePos).."#R=DK");
engine.StatValue=throttlePos;
engine.StatLower=0;
engine.StatUpper=14.9;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="35" name="DEP1248" type="8" flags="97"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="检测失败">
<Rect left="559" top="816" right="659" bottom="848"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="212" ActivityType="4" flags="0" name="路由节点">
<Rect left="717" top="871" right="749" bottom="903"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="719" top="1026" right="751" bottom="1058"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="718" top="1083" right="750" bottom="1115"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="普通节点">
<Rect left="2659" top="2172" right="2759" bottom="2204"/>
<Script></Script></Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="710" top="63" right="742" bottom="95"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="195" type="0">
</Transition>
<Transition StartId="4" EndId="241" type="0">
</Transition>
<Transition StartId="5" EndId="124" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="208" type="3">
</Transition>
<Transition StartId="81" EndId="83" type="4">
</Transition>
<Transition StartId="82" EndId="84" type="0">
</Transition>
<Transition StartId="83" EndId="208" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="4">
</Transition>
<Transition StartId="84" EndId="207" type="3">
</Transition>
<Transition StartId="85" EndId="207" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="206" type="3">
</Transition>
<Transition StartId="87" EndId="90" type="4">
</Transition>
<Transition StartId="90" EndId="206" type="0">
</Transition>
<Transition StartId="91" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="219" type="3">
</Transition>
<Transition StartId="93" EndId="95" type="4">
</Transition>
<Transition StartId="95" EndId="219" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="201" type="3">
</Transition>
<Transition StartId="115" EndId="117" type="4">
</Transition>
<Transition StartId="117" EndId="201" type="0">
</Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="124" EndId="120" type="0">
</Transition>
<Transition StartId="132" EndId="2" type="0">
</Transition>
<Transition StartId="195" EndId="5" type="3">
</Transition>
<Transition StartId="195" EndId="196" type="4">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="3" type="0">
</Transition>
<Transition StartId="201" EndId="86" type="0">
</Transition>
<Transition StartId="206" EndId="82" type="0">
</Transition>
<Transition StartId="207" EndId="80" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="212" type="3">
</Transition>
<Transition StartId="210" EndId="211" type="4">
</Transition>
<Transition StartId="211" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="91" type="0">
</Transition>
<Transition StartId="219" EndId="220" type="0">
</Transition>
<Transition StartId="220" EndId="132" type="0">
</Transition>
<Transition StartId="241" EndId="114" type="0">
</Transition>
</Transitions>
</Process>

