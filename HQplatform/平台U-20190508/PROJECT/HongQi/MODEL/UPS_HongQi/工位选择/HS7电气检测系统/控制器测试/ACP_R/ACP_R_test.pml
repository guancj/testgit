<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3032" pbltext="DEP1758">
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
<Variable id="CAN_SND_ID" type="3" data="0x743" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="290" top="54" right="390" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="304" top="750" right="404" bottom="782"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="后中控开关(ACP_R)">
<Rect left="286" top="115" right="386" bottom="147"/>
<TitleText Enable="1" Text="后中控开关(ACP_R)"/>
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
<Rect left="288" top="288" right="388" bottom="320"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1760" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="288" top="337" right="388" bottom="369"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1761" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="13" flags="0" name="计算">
<Rect left="288" top="387" right="388" bottom="419"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x85B957CA"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送key">
<Rect left="289" top="456" right="389" bottom="488"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1762" type="8" flags="97"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP1759" type="8" flags="97"/>
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
<Rect left="112" top="750" right="144" bottom="782"/>
</Activity>
<Activity id="392" ActivityType="3" flags="0" name="关闭左后座椅加热">
<Rect left="513" top="356" right="613" bottom="388"/>
<Strategy TotalTime="250" NokTime="250" RetryTimeOut="25" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC1
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="30" name="DEP2424" type="8" flags="97"/>
</Activity>
<Activity id="393" ActivityType="3" flags="0" name="左后座椅加热调到一档">
<Rect left="509" top="551" right="609" bottom="583"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅加热调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC1
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x02) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="33" name="DEP2425" type="8" flags="97"/>
</Activity>
<Activity id="394" ActivityType="3" flags="0" name="左后座椅加热调到二档">
<Rect left="512" top="485" right="612" bottom="517"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅加热调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC1
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x04) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="32" name="DEP2426" type="8" flags="97"/>
</Activity>
<Activity id="395" ActivityType="3" flags="0" name="左后座椅加热调到三档">
<Rect left="517" top="427" right="617" bottom="459"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅加热调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC1
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x06) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="31" name="DEP2427" type="8" flags="97"/>
</Activity>
<Activity id="396" ActivityType="3" flags="0" name="关闭左后座椅加热">
<Rect left="510" top="624" right="610" bottom="656"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC1
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="34" name="DEP2424" type="8" flags="97"/>
</Activity>
<Activity id="397" ActivityType="3" flags="0" name="左后座椅加热">
<Rect left="513" top="295" right="613" bottom="327"/>
<Script></Script></Activity>
<Activity id="398" ActivityType="3" flags="0" name="关闭左后座椅通风">
<Rect left="648" top="358" right="748" bottom="390"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC3
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="35" name="DEP2428" type="8" flags="97"/>
</Activity>
<Activity id="399" ActivityType="3" flags="0" name="左后座椅通风调到一档">
<Rect left="648" top="554" right="748" bottom="586"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅通风调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC3
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x02) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="38" name="DEP2429" type="8" flags="97"/>
</Activity>
<Activity id="400" ActivityType="3" flags="0" name="左后座椅通风调到二档">
<Rect left="647" top="487" right="747" bottom="519"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅通风调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC3
engine.SetLineText(3,@3);
if(@0 == 0x62)then
--local acp_fflag = 
	if (@3 == 0x04) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="37" name="DEP2430" type="8" flags="97"/>
</Activity>
<Activity id="401" ActivityType="3" flags="0" name="左后座椅通风调到三档">
<Rect left="647" top="433" right="747" bottom="465"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅通风调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC3
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x06) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="36" name="DEP2431" type="8" flags="97"/>
</Activity>
<Activity id="402" ActivityType="3" flags="0" name="关闭左后座椅通风">
<Rect left="649" top="624" right="749" bottom="656"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将左后座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC3
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="39" name="DEP2428" type="8" flags="97"/>
</Activity>
<Activity id="403" ActivityType="3" flags="0" name="左后座椅通风">
<Rect left="648" top="297" right="748" bottom="329"/>
<Script></Script></Activity>
<Activity id="404" ActivityType="3" flags="0" name="关闭右后座椅加热">
<Rect left="823" top="357" right="923" bottom="389"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC2
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="40" name="DEP2432" type="8" flags="97"/>
</Activity>
<Activity id="405" ActivityType="3" flags="0" name="右后座椅加热调到一档">
<Rect left="822" top="549" right="922" bottom="581"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅加热调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC2
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x02) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="43" name="DEP2433" type="8" flags="97"/>
</Activity>
<Activity id="406" ActivityType="3" flags="0" name="右后座椅加热调到二档">
<Rect left="822" top="486" right="922" bottom="518"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅加热调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC2
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x04) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="42" name="DEP2434" type="8" flags="97"/>
</Activity>
<Activity id="407" ActivityType="3" flags="0" name="右后座椅加热调到三档">
<Rect left="822" top="420" right="922" bottom="452"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅加热调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC2
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x06) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="41" name="DEP2435" type="8" flags="97"/>
</Activity>
<Activity id="408" ActivityType="3" flags="0" name="关闭右后座椅加热">
<Rect left="824" top="623" right="924" bottom="655"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅加热关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC2
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="44" name="DEP2432" type="8" flags="97"/>
</Activity>
<Activity id="409" ActivityType="3" flags="0" name="右后座椅加热">
<Rect left="823" top="296" right="923" bottom="328"/>
<Script></Script></Activity>
<Activity id="410" ActivityType="3" flags="0" name="关闭右后座椅通风">
<Rect left="958" top="359" right="1058" bottom="391"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC4
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="45" name="DEP2436" type="8" flags="97"/>
</Activity>
<Activity id="411" ActivityType="3" flags="0" name="左后座椅通风调到一档">
<Rect left="955" top="549" right="1055" bottom="581"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅通风调到一档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC4
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x02) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="48" name="DEP2437" type="8" flags="97"/>
</Activity>
<Activity id="412" ActivityType="3" flags="0" name="右后座椅通风调到二档">
<Rect left="957" top="488" right="1057" bottom="520"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅通风调到二档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC4
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x04) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="47" name="DEP2438" type="8" flags="97"/>
</Activity>
<Activity id="413" ActivityType="3" flags="0" name="右后座椅通风调到三档">
<Rect left="961" top="430" right="1061" bottom="462"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅通风调到三档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC4
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x06) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="46" name="DEP2439" type="8" flags="97"/>
</Activity>
<Activity id="414" ActivityType="3" flags="0" name="关闭右后座椅通风">
<Rect left="959" top="625" right="1059" bottom="657"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将右后座椅通风关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC4
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="49" name="DEP2436" type="8" flags="97"/>
</Activity>
<Activity id="415" ActivityType="3" flags="0" name="右后座椅通风">
<Rect left="958" top="298" right="1058" bottom="330"/>
<Script></Script></Activity>
<Activity id="416" ActivityType="3" flags="0" name="普通节点">
<Rect left="1326" top="345" right="1426" bottom="377"/>
<Script></Script></Activity>
<Activity id="418" ActivityType="3" flags="0" name="打开遮阳帘">
<Rect left="1140" top="361" right="1240" bottom="393"/>
<Strategy TotalTime="150" NokTime="150" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请按下遮阳帘开启按钮（大于1秒终钟）"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC5
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x01) then
        --if(bit32.band(@3,0x01) == 1)then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="50" name="DEP2440" type="8" flags="97"/>
</Activity>
<Activity id="419" ActivityType="3" flags="0" name="人工确认">
<Rect left="1140" top="426" right="1240" bottom="458"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="遮阳帘开启了吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script></Activity>
<Activity id="420" ActivityType="3" flags="0" name="关闭遮阳帘">
<Rect left="1139" top="490" right="1239" bottom="522"/>
<Strategy TotalTime="150" NokTime="150" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请按下遮阳帘关闭按钮（大于1秒终钟）"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x4F 0xC5
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x02) then
        --if(bit32.band(@3,0x02) == 1)then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="51" name="DEP2441" type="8" flags="97"/>
</Activity>
<Activity id="421" ActivityType="3" flags="0" name="人工确认">
<Rect left="1140" top="560" right="1240" bottom="592"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="遮阳帘关闭了吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end</Script></Activity>
<Activity id="423" ActivityType="3" flags="0" name="遮阳伞">
<Rect left="1140" top="300" right="1240" bottom="332"/>
<Script></Script></Activity>
<Activity id="424" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="749" right="1206" bottom="781"/>
</Activity>
<Activity id="425" ActivityType="3" flags="0" name="请到后排落座">
<Rect left="288" top="516" right="388" bottom="548"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请到后排开始检测后中控"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="426" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="234" right="716" bottom="266"/>
</Activity>
<Activity id="427" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="234" right="1026" bottom="266"/>
</Activity>
<Activity id="428" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="234" right="886" bottom="266"/>
</Activity>
<Activity id="429" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="234" right="1206" bottom="266"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="39" type="0">
</Transition>
<Transition StartId="7" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="425" type="0">
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
<Transition StartId="396" EndId="426" type="0">
</Transition>
<Transition StartId="397" EndId="392" type="0">
</Transition>
<Transition StartId="398" EndId="401" type="0">
</Transition>
<Transition StartId="399" EndId="402" type="0">
</Transition>
<Transition StartId="400" EndId="399" type="0">
</Transition>
<Transition StartId="401" EndId="400" type="0">
</Transition>
<Transition StartId="402" EndId="428" type="0">
</Transition>
<Transition StartId="403" EndId="398" type="0">
</Transition>
<Transition StartId="404" EndId="407" type="0">
</Transition>
<Transition StartId="405" EndId="408" type="0">
</Transition>
<Transition StartId="406" EndId="405" type="0">
</Transition>
<Transition StartId="407" EndId="406" type="0">
</Transition>
<Transition StartId="408" EndId="427" type="0">
</Transition>
<Transition StartId="409" EndId="404" type="0">
</Transition>
<Transition StartId="410" EndId="413" type="0">
</Transition>
<Transition StartId="411" EndId="414" type="0">
</Transition>
<Transition StartId="412" EndId="411" type="0">
</Transition>
<Transition StartId="413" EndId="412" type="0">
</Transition>
<Transition StartId="414" EndId="423" type="0">
</Transition>
<Transition StartId="415" EndId="410" type="0">
</Transition>
<Transition StartId="418" EndId="419" type="0">
</Transition>
<Transition StartId="419" EndId="420" type="0">
</Transition>
<Transition StartId="420" EndId="421" type="0">
</Transition>
<Transition StartId="421" EndId="424" type="0">
</Transition>
<Transition StartId="423" EndId="418" type="0">
</Transition>
<Transition StartId="424" EndId="2" type="0">
</Transition>
<Transition StartId="425" EndId="397" type="0">
</Transition>
<Transition StartId="426" EndId="403" type="1">
<Expression>LibGeneral.CarTNC_HS7_H(engine.CarType)</Expression></Transition>
<Transition StartId="426" EndId="428" type="0">
</Transition>
<Transition StartId="427" EndId="415" type="1">
<Expression>engine.CarType == 'DAPYHACC0000' or engine.CarType == 'DAPYHACC0001' or engine.CarType == 'DAPSHACC0000' or engine.CarType == 'DAPSHACC0001'</Expression></Transition>
<Transition StartId="427" EndId="429" type="0">
</Transition>
<Transition StartId="428" EndId="409" type="0">
</Transition>
<Transition StartId="429" EndId="423" type="0">
</Transition>
</Transitions>
</Process>

