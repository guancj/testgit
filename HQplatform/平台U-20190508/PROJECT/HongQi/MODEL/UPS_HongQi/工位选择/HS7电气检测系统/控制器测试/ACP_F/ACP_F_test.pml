<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3031" pbltext="DEP1743">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="ACP_R_TBD_partnumber"/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data=""/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x742" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74A" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="286" top="65" right="386" bottom="97"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="295" top="704" right="395" bottom="736"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="前中控开关(ACP_F)">
<Rect left="286" top="115" right="386" bottom="147"/>
<TitleText Enable="1" Text="前中控开关(ACP_F)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="286" top="165" right="386" bottom="197"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="290" top="294" right="390" bottom="326"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1745" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="290" top="354" right="390" bottom="386"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1746" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="13" flags="0" name="计算">
<Rect left="290" top="414" right="390" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x85A857B9"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送key">
<Rect left="290" top="474" right="390" bottom="506"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1747" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="通讯">
<Rect left="287" top="223" right="387" bottom="255"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP1744" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="通讯失败">
<Rect left="80" top="224" right="180" bottom="256"/>
<Line1Text Enable="1" Text="ACP_R控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="结束通讯">
<Rect left="80" top="164" right="180" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="391" ActivityType="4" flags="0" name="路由节点">
<Rect left="112" top="705" right="144" bottom="737"/>
</Activity>
<Activity id="392" ActivityType="3" flags="0" name="关闭驾驶员座椅加热">
<Rect left="500" top="354" right="600" bottom="386"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x81
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="80" name="DEP2408" type="8" flags="97"/>
</Activity>
<Activity id="393" ActivityType="3" flags="0" name="驾驶员座椅加热调到一档">
<Rect left="500" top="534" right="600" bottom="566"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅加热调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x81
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "1") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="83" name="DEP2409" type="8" flags="97"/>
</Activity>
<Activity id="394" ActivityType="3" flags="0" name="驾驶员座椅加热调到二档">
<Rect left="500" top="474" right="600" bottom="506"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅加热调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x81
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "2") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="82" name="DEP2410" type="8" flags="97"/>
</Activity>
<Activity id="395" ActivityType="3" flags="0" name="驾驶员座椅加热调到三档">
<Rect left="500" top="414" right="600" bottom="446"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅加热调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x81
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "3") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="81" name="DEP2411" type="8" flags="97"/>
</Activity>
<Activity id="396" ActivityType="3" flags="0" name="关闭驾驶员座椅加热">
<Rect left="500" top="624" right="600" bottom="656"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x81
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="84" name="DEP2408" type="8" flags="97"/>
</Activity>
<Activity id="397" ActivityType="3" flags="0" name="驾驶员座椅加热">
<Rect left="500" top="224" right="600" bottom="256"/>
<Script></Script></Activity>
<Activity id="398" ActivityType="3" flags="0" name="关闭驾驶员座椅通风">
<Rect left="640" top="354" right="740" bottom="386"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x83
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="85" name="DEP2412" type="8" flags="97"/>
</Activity>
<Activity id="399" ActivityType="3" flags="0" name="驾驶员座椅通风调到一档">
<Rect left="640" top="534" right="740" bottom="566"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅通风调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x83
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "1") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="87" name="DEP2413" type="8" flags="97"/>
</Activity>
<Activity id="400" ActivityType="3" flags="0" name="驾驶员座椅通风调到二档">
<Rect left="640" top="474" right="740" bottom="506"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅通风调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x83
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "2") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="86" name="DEP2414" type="8" flags="97"/>
</Activity>
<Activity id="402" ActivityType="3" flags="0" name="关闭驾驶员左后座椅通风">
<Rect left="640" top="624" right="740" bottom="656"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将驾驶员座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x83
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="88" name="DEP2412" type="8" flags="97"/>
</Activity>
<Activity id="404" ActivityType="3" flags="0" name="关闭副驾驶座椅加热">
<Rect left="810" top="354" right="910" bottom="386"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x82
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="89" name="DEP2416" type="8" flags="97"/>
</Activity>
<Activity id="405" ActivityType="3" flags="0" name="副驾驶座椅加热调到一档">
<Rect left="810" top="534" right="910" bottom="566"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅加热调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x82
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "1") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="92" name="DEP2417" type="8" flags="97"/>
</Activity>
<Activity id="406" ActivityType="3" flags="0" name="副驾驶座椅加热调到二档">
<Rect left="810" top="474" right="910" bottom="506"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅加热调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x82
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "2") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="91" name="DEP2418" type="8" flags="97"/>
</Activity>
<Activity id="407" ActivityType="3" flags="0" name="副驾驶座椅加热调到三档">
<Rect left="810" top="414" right="910" bottom="446"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅加热调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x82
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "3") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="90" name="DEP2419" type="8" flags="97"/>
</Activity>
<Activity id="408" ActivityType="3" flags="0" name="关闭副驾驶座椅加热">
<Rect left="810" top="614" right="910" bottom="646"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x82
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="93" name="DEP2416" type="8" flags="97"/>
</Activity>
<Activity id="409" ActivityType="3" flags="0" name="副驾驶座椅加热">
<Rect left="810" top="294" right="910" bottom="326"/>
<Script></Script></Activity>
<Activity id="410" ActivityType="3" flags="0" name="关闭副驾驶座椅通风">
<Rect left="950" top="354" right="1050" bottom="386"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x84
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="94" name="DEP2420" type="8" flags="97"/>
</Activity>
<Activity id="411" ActivityType="3" flags="0" name="副驾驶座椅通风调到一档">
<Rect left="950" top="534" right="1050" bottom="566"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅通风调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x84
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "1") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="96" name="DEP2421" type="8" flags="97"/>
</Activity>
<Activity id="412" ActivityType="3" flags="0" name="副驾驶座椅通风调到二档">
<Rect left="950" top="474" right="1050" bottom="506"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅通风调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x84
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "2") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="95" name="DEP2422" type="8" flags="97"/>
</Activity>
<Activity id="414" ActivityType="3" flags="0" name="关闭副驾驶座椅通风">
<Rect left="950" top="614" right="1050" bottom="646"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将副驾驶座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0x84
engine.SetLineText(3,@3);
if(@0 == 0x62)then
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
local sig = hexstr(StringRes);
--sig = string.sub(sig,7,7);
engine.println("sig="..sig);
local subsig = string.sub(sig,7,7);
engine.println("subsig = "..subsig);
	if (subsig == "0") then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end</Script><assessment no="97" name="DEP2420" type="8" flags="97"/>
</Activity>
<Activity id="415" ActivityType="3" flags="0" name="副驾驶座椅通风">
<Rect left="950" top="294" right="1050" bottom="326"/>
<Script></Script></Activity>
<Activity id="424" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="704" right="1016" bottom="736"/>
</Activity>
<Activity id="425" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="224" right="646" bottom="256"/>
</Activity>
<Activity id="426" ActivityType="4" flags="0" name="路由节点">
<Rect left="844" top="224" right="876" bottom="256"/>
</Activity>
<Activity id="427" ActivityType="3" flags="0" name="驾驶员座椅通风">
<Rect left="640" top="294" right="740" bottom="326"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="39" type="0">
</Transition>
<Transition StartId="7" EndId="397" type="0">
</Transition>
<Transition StartId="29" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="397" type="0">
</Transition>
<Transition StartId="39" EndId="7" type="3">
</Transition>
<Transition StartId="39" EndId="42" type="4">
</Transition>
<Transition StartId="42" EndId="91" type="0">
</Transition>
<Transition StartId="42" EndId="391" type="5">
</Transition>
<Transition StartId="91" EndId="6" type="0">
</Transition>
<Transition StartId="391" EndId="2" type="0">
</Transition>
<Transition StartId="392" EndId="395" type="0">
</Transition>
<Transition StartId="393" EndId="396" type="0">
</Transition>
<Transition StartId="394" EndId="393" type="0">
</Transition>
<Transition StartId="395" EndId="394" type="0">
</Transition>
<Transition StartId="396" EndId="425" type="0">
</Transition>
<Transition StartId="396" EndId="427" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType) == false</Expression></Transition>
<Transition StartId="397" EndId="392" type="0">
</Transition>
<Transition StartId="398" EndId="400" type="0">
</Transition>
<Transition StartId="399" EndId="402" type="0">
</Transition>
<Transition StartId="400" EndId="399" type="0">
</Transition>
<Transition StartId="402" EndId="409" type="0">
</Transition>
<Transition StartId="404" EndId="407" type="0">
</Transition>
<Transition StartId="405" EndId="408" type="0">
</Transition>
<Transition StartId="406" EndId="405" type="0">
</Transition>
<Transition StartId="407" EndId="406" type="0">
</Transition>
<Transition StartId="408" EndId="415" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType) == false</Expression></Transition>
<Transition StartId="408" EndId="424" type="0">
</Transition>
<Transition StartId="409" EndId="404" type="0">
</Transition>
<Transition StartId="410" EndId="412" type="0">
</Transition>
<Transition StartId="411" EndId="414" type="0">
</Transition>
<Transition StartId="412" EndId="411" type="0">
</Transition>
<Transition StartId="414" EndId="424" type="0">
</Transition>
<Transition StartId="415" EndId="410" type="0">
</Transition>
<Transition StartId="424" EndId="2" type="0">
</Transition>
<Transition StartId="425" EndId="426" type="0">
</Transition>
<Transition StartId="426" EndId="409" type="0">
</Transition>
<Transition StartId="427" EndId="398" type="0">
</Transition>
</Transitions>
</Process>

