<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3013" pbltext="DEP73">
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
<Variable id="CAN_SND_ID" type="3" data="0x725" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72D" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="250" right="350" bottom="32"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="90" top="874" right="190" bottom="906"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="10" ActivityType="3" flags="0" name="手动按PDC开关">
<Rect left="180" top="74" right="280" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(1,"#L=请打开 PDC开关".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="前左雷达">
<Rect left="250" top="534" right="350" bottom="566"/>
<Line2Text Enable="1" Text="请站于前左雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于前左雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC0"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="54" name="DEP2472" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="前中左雷达">
<Rect left="400" top="564" right="500" bottom="596"/>
<Line2Text Enable="1" Text="请站于前中左雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于前中左雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC1"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="55" name="DEP2473" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="前中右雷达">
<Rect left="400" top="704" right="500" bottom="736"/>
<Line2Text Enable="1" Text="请站于前中右雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于前中右雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC2"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="56" name="DEP2475" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="250" top="614" right="350" bottom="646"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP492" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="184" top="574" right="216" bottom="606"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="初始化变量">
<Rect left="400" top="484" right="500" bottom="516"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;
Pram_4 = nil ;
Pram_5 = nil ;
Pram_6 = nil ;
Pram_7 = nil ;
Pram_8 = nil ;</Script></Activity>
<Activity id="177" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="400" top="634" right="500" bottom="666"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP493" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="594" right="576" bottom="626"/>
</Activity>
<Activity id="179" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="400" top="794" right="500" bottom="826"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP494" type="8" flags="97"/>
</Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="744" right="356" bottom="776"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="前右雷达">
<Rect left="680" top="554" right="780" bottom="586"/>
<Line2Text Enable="1" Text="请站于前右雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于前右雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC3"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="57" name="DEP2474" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="680" top="634" right="780" bottom="666"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP495" type="8" flags="97"/>
</Activity>
<Activity id="184" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="594" right="836" bottom="626"/>
</Activity>
<Activity id="185" ActivityType="3" flags="0" name="初始化变量">
<Rect left="680" top="484" right="780" bottom="516"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;
Pram_4 = nil ;
Pram_5 = nil ;
Pram_6 = nil ;
Pram_7 = nil ;
Pram_8 = nil ;</Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="后右雷达">
<Rect left="680" top="704" right="780" bottom="736"/>
<Line2Text Enable="1" Text="请站于后右雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于后右雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC7"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="58" name="DEP2476" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="680" top="794" right="780" bottom="826"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP496" type="8" flags="97"/>
</Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="754" right="696" bottom="786"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="后右中雷达">
<Rect left="840" top="554" right="940" bottom="586"/>
<Line2Text Enable="1" Text="请站于后右中雷达前约30cm处"/>
<Script>engine.SetLineText(1,"请站于后右中雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC6"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="59" name="DEP2477" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="840" top="634" right="940" bottom="666"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP497" type="8" flags="97"/>
</Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="594" right="986" bottom="626"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="初始化变量">
<Rect left="840" top="484" right="940" bottom="516"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;
Pram_4 = nil ;
Pram_5 = nil ;
Pram_6 = nil ;
Pram_7 = nil ;
Pram_8 = nil ;</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="后中左雷达">
<Rect left="840" top="704" right="940" bottom="736"/>
<Line2Text Enable="1" Text="请站于后中左雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于后中左雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC5"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="60" name="DEP2478" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="840" top="794" right="940" bottom="826"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="27" name="DEP498" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="744" right="846" bottom="776"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="后左雷达">
<Rect left="990" top="554" right="1090" bottom="586"/>
<Line2Text Enable="1" Text="请站于后左雷达前约30cm处"/>
<Script>--engine.SetLineText(1,"请站于后左雷达前约30cm处")
#COMMEX vciHandle -1 0x22  "\x2A\xC4"
if(engine.LastError == 0 ) then
	recvTel = @3-;
	result = tonumber(LibGeneral.hex2str(recvTel),16)
else
	result = ""
end </Script><assessment no="61" name="DEP2479" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="13" flags="1" name="Tolerance_view_Float_A">
<Rect left="990" top="634" right="1090" bottom="666"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="result"/>
<Parameter id="RightViewText" value="&quot;距离&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="28" name="DEP499" type="8" flags="97"/>
</Activity>
<Activity id="198" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="594" right="1136" bottom="626"/>
</Activity>
<Activity id="199" ActivityType="3" flags="0" name="初始化变量">
<Rect left="990" top="484" right="1090" bottom="516"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;
Pram_4 = nil ;
Pram_5 = nil ;
Pram_6 = nil ;
Pram_7 = nil ;
Pram_8 = nil ;</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="按下PDC开关,读取开关打开状态">
<Rect left="1260" top="674" right="1360" bottom="706"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下PDC开关,读取开关打开状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22  "\x01\x04"

if(engine.LastError == 0 ) then
	engine.SetLineText(2,@3);
	if(@3 == 0x01) then 
		engine.LastError = 0;
	else
		engine.LastError = 1;
	end 
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP500" type="8" flags="97"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="关闭PDC开关，读取开关关闭状态">
<Rect left="1260" top="724" right="1360" bottom="756"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="关闭PDC开关，读取开关关闭状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22  "\x01\x04"

if(engine.LastError == 0 ) then
	engine.SetLineText(2,@3);
	if(@3 == 0x00) then 
		engine.LastError = 0;
	else
		engine.LastError = 1;
	end 
end 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP502" type="8" flags="97"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="切诊断">
<Rect left="250" top="264" right="350" bottom="296"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="51" name="DEP1080" type="8" flags="97"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="250" top="314" right="350" bottom="346"/>
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
</Script><assessment no="52" name="DEP77" type="8" flags="97"/>
</Activity>
<Activity id="212" ActivityType="3" flags="0" name="发送key">
<Rect left="250" top="414" right="350" bottom="446"/>
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


</Script><assessment no="53" name="DEP78" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="250" top="364" right="350" bottom="396"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xEC0FBE20"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="874" right="1056" bottom="906"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="初始化变量">
<Rect left="250" top="484" right="350" bottom="516"/>
<Script>Pram_1 = nil ;
--[[
Pram_2 = nil ;
Pram_3 = nil ;
Pram_4 = nil ;
Pram_5 = nil ;
Pram_6 = nil ;
Pram_7 = nil ;
Pram_8 = nil ;
--]]</Script></Activity>
<Activity id="220" ActivityType="3" flags="0" name="通讯失败">
<Rect left="90" top="204" right="190" bottom="236"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="221" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="250" top="144" right="350" bottom="176"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="222" ActivityType="13" flags="0" name="扩展会话">
<Rect left="250" top="204" right="350" bottom="236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="50" name="DEP74" type="8" flags="97"/>
</Activity>
<Activity id="223" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="90" top="144" right="190" bottom="176"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="手动确认P档">
<Rect left="1060" top="724" right="1160" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(1,"#L=请手动挂P挡".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="227" ActivityType="3" flags="0" name="手动确认R档">
<Rect left="310" top="74" right="410" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(1,"#L=!!!发动机熄火，并保持车辆上电".."#R=bmpeye")
engine.SetLineText(2,"#L=请手动挂R挡".."#R=bmpeye")
#PRESSBUTTON

-- L 车型 提示   :点火（上电）挂R挡     M-   开打PDC开关 </Script></Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="414" right="616" bottom="446"/>
</Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="704" right="616" bottom="736"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="10" type="0">
</Transition>
<Transition StartId="1" EndId="227" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType)</Expression></Transition>
<Transition StartId="10" EndId="221" type="0">
</Transition>
<Transition StartId="12" EndId="43" type="0">
</Transition>
<Transition StartId="13" EndId="177" type="0">
</Transition>
<Transition StartId="39" EndId="179" type="0">
</Transition>
<Transition StartId="43" EndId="175" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="43" EndId="176" type="0">
</Transition>
<Transition StartId="175" EndId="12" type="0">
</Transition>
<Transition StartId="176" EndId="13" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="177" EndId="39" type="0">
</Transition>
<Transition StartId="178" EndId="13" type="0">
</Transition>
<Transition StartId="179" EndId="180" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="179" EndId="185" type="0">
</Transition>
<Transition StartId="180" EndId="39" type="0">
</Transition>
<Transition StartId="181" EndId="183" type="0">
</Transition>
<Transition StartId="183" EndId="184" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="183" EndId="186" type="0">
</Transition>
<Transition StartId="184" EndId="181" type="0">
</Transition>
<Transition StartId="185" EndId="181" type="0">
</Transition>
<Transition StartId="186" EndId="187" type="0">
</Transition>
<Transition StartId="187" EndId="188" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="187" EndId="192" type="0">
</Transition>
<Transition StartId="188" EndId="186" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="191" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="190" EndId="193" type="0">
</Transition>
<Transition StartId="191" EndId="189" type="0">
</Transition>
<Transition StartId="192" EndId="189" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="195" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="194" EndId="199" type="0">
</Transition>
<Transition StartId="195" EndId="193" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="197" EndId="225" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(DString_C079_Car_Type)</Expression></Transition>
<Transition StartId="197" EndId="218" type="0">
</Transition>
<Transition StartId="198" EndId="196" type="0">
</Transition>
<Transition StartId="199" EndId="196" type="0">
</Transition>
<Transition StartId="210" EndId="211" type="0">
</Transition>
<Transition StartId="211" EndId="213" type="0">
</Transition>
<Transition StartId="212" EndId="219" type="0">
</Transition>
<Transition StartId="212" EndId="228" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType)</Expression></Transition>
<Transition StartId="213" EndId="212" type="0">
</Transition>
<Transition StartId="218" EndId="2" type="0">
</Transition>
<Transition StartId="219" EndId="12" type="0">
</Transition>
<Transition StartId="220" EndId="223" type="0">
</Transition>
<Transition StartId="220" EndId="2" type="5">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="220" type="4">
</Transition>
<Transition StartId="222" EndId="210" type="0">
</Transition>
<Transition StartId="223" EndId="221" type="0">
</Transition>
<Transition StartId="225" EndId="218" type="0">
</Transition>
<Transition StartId="227" EndId="221" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="186" type="0">
</Transition>
</Transitions>
</Process>

