<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="AVM_partnumber"/>
<Variable id="DString_VariCoding" type="8" dir="0" data="AVM_varicoding"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x726" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="450" top="62" right="550" bottom="94"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="250" top="634" right="350" bottom="666"/>
<Script>#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="全景控制单元(AVM)">
<Rect left="449" top="132" right="549" bottom="164"/>
<TitleText Enable="1" Text="全景控制单元(AVM)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="618" top="634" right="718" bottom="666"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP1695" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="449" top="261" right="549" bottom="293"/>
<Line1Text Enable="1" Text="连接ECU..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="450" top="374" right="550" bottom="406"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1696" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="449" top="441" right="549" bottom="473"/>
<Line1Text Enable="1" Text="安全访问"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1697" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="449" top="491" right="549" bottom="523"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xEC20BE31"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="450" top="554" right="550" bottom="586"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1698" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="通讯">
<Rect left="449" top="301" right="549" bottom="333"/>
<Line1Text Enable="1" Text="通讯中"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP1694" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="通讯失败">
<Rect left="249" top="301" right="349" bottom="333"/>
<Line1Text Enable="1" Text="全景控制单元(AVM)控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="结束通讯">
<Rect left="249" top="261" right="349" bottom="293"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="对中开启">
<Rect left="450" top="194" right="550" bottom="226"/>
<Line1Text Enable="1" Text="等待对中气缸伸出..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--repeat
	engine.cylinderOut = true
        engine.Delay(5000)
--until (engine.outSigF == true and engine.outSigR == true)
engine.cylinderOut = false

--#DELAY 5000
</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="AVM标定开启">
<Rect left="610" top="554" right="710" bottom="586"/>
<Line1Text Enable="1" Text="AVM开启标定"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xE1 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="40" name="DEP2466" type="8" flags="97"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="AVM标定">
<Rect left="781" top="634" right="881" bottom="666"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="180" DelayTime="300"/>
<Line1Text Enable="1" Text="AVM标定中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x03 0xE1 0x00
if(@0 == 0x71)then
	if(@4 == 0x01)then
		engine.LastError = 0;
                engine.TestResult = 0;
		engine.SetLineText(1,"全景标定成功！");
#DELAY 2000
	elseif(@4 == 0x02)then
		engine.LastError = 1;
		engine.TestResult = 1;
                engine.SetLineText(1,"全景标定中...");
	elseif(@4 == 0x00)then
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(1,"全景标定失败...");
		#DELAY 2000
		engine.LastError = 1;
		engine.TestResult = 1;
	end	
else
	engine.LastError = 1;
	engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="41" name="DEP2467" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="延时3秒">
<Rect left="780" top="554" right="880" bottom="586"/>
<Line1Text Enable="1" Text="延时3秒"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 3000</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="116" type="0">
</Transition>
<Transition StartId="4" EndId="2" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="117" type="0">
</Transition>
<Transition StartId="11" EndId="6" type="3">
</Transition>
<Transition StartId="11" EndId="12" type="4">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="2" type="5">
</Transition>
<Transition StartId="13" EndId="5" type="0">
</Transition>
<Transition StartId="116" EndId="5" type="0">
</Transition>
<Transition StartId="117" EndId="124" type="0">
</Transition>
<Transition StartId="118" EndId="4" type="0">
</Transition>
<Transition StartId="124" EndId="118" type="0">
</Transition>
</Transitions>
</Process>

