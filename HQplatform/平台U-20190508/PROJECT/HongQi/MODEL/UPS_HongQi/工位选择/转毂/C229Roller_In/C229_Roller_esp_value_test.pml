<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1607" pbltext="DEP1529">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="isOK" type="11" dir="1" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AC" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="150" top="44" right="250" bottom="76"/>
<Script>repeatAction = false

--YYA
tmpBrakeForce_RL = 0
tmpBrakeForce_FL = 0
tmpBrakeForce_RR = 0
tmpBrakeForce_FR = 0</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1980" top="2724" right="2080" bottom="2756"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="150" top="154" right="250" bottom="186"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="643" ActivityType="13" flags="0" name="扩展会话">
<Rect left="150" top="214" right="250" bottom="246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="1277" ActivityType="13" flags="0" name="安全访问">
<Rect left="150" top="274" right="250" bottom="306"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xB9DC8BED"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="1328" ActivityType="3" flags="0" name="检测系统状态评估">
<Rect left="150" top="404" right="250" bottom="436"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 FD02 ##"..DVciResult);</Script></Activity>
<Activity id="1329" ActivityType="13" flags="0" name="状态比对">
<Rect left="150" top="464" right="250" bottom="496"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="TextCmp" value="&quot;01&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;检测系统状态评估&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="12" name="DEP1886" type="8" flags="97"/>
</Activity>
<Activity id="1330" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="150" top="524" right="250" bottom="556"/>
<Script></Script></Activity>
<Activity id="1331" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="454" right="366" bottom="486"/>
</Activity>
<Activity id="1332" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="150" top="344" right="250" bottom="376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x17\xA2&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1515" type="8" flags="97"/>
</Activity>
<Activity id="1333" ActivityType="13" flags="1" name="禁用阀组继电器关闭">
<Rect left="150" top="584" right="250" bottom="616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xDF\x47\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1510" type="8" flags="97"/>
</Activity>
<Activity id="1334" ActivityType="5" flags="0" name="全毂5km/h">
<Rect left="150" top="644" right="250" bottom="676"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="5.0"/>
<Parameter id="speedFR" value="5.0"/>
<Parameter id="speedRL" value="5.0"/>
<Parameter id="speedRR" value="5.0"/>
<Parameter id="torqueFL" value="3000"/>
<Parameter id="torqueFR" value="3000"/>
<Parameter id="torqueRL" value="3000"/>
<Parameter id="torqueRR" value="3000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1583" ActivityType="3" flags="0" name="IDT错误">
<Rect left="10" top="644" right="110" bottom="676"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false</Script></Activity>
<Activity id="1589" ActivityType="5" flags="0" name="速度检查">
<Rect left="150" top="694" right="250" bottom="726"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="5.0"/>
<Parameter id="Target_FR" value="5.0"/>
<Parameter id="Target_RL" value="5.0"/>
<Parameter id="Target_RR" value="5.0"/>
<Parameter id="DlgText" value="&quot;确定毂5km/h&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1590" ActivityType="3" flags="0" name="毂速度不正确">
<Rect left="300" top="694" right="400" bottom="726"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false
print("四毂速度检查不正确")</Script></Activity>
<Activity id="1591" ActivityType="3" flags="0" name="获取阻滞力">
<Rect left="150" top="754" right="250" bottom="786"/>
<Script>engine.Delay(1000)

local i = 0
local oldRevTel = ""
local curtRevTel
local factor = 1.0

DragForceSum_FL = 0
DragForceSum_FR = 0
DragForceSum_RL = 0
DragForceSum_RR = 0

DragForce_FL = 0
DragForce_FL = 0
DragForce_RL = 0
DragForce_RR = 0

repeat 
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("四轮阻滞力当前获取IDT报文:"..curtRevTelHex)
        if (curtRevTel ~= oldRevTel) then
		--获取左前轮制动力
		DragForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
		--获取右前轮制动力
		DragForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
		--获取左后轮制动力
		DragForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
		--获取右后轮制动力
		DragForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor             
                
		 DragForceSum_FL = DragForceSum_FL + math.abs(DragForce_FL)
		 DragForceSum_FR = DragForceSum_FR + math.abs(DragForce_FR)
                 DragForceSum_RL = DragForceSum_RL + math.abs(DragForce_RL)
		 DragForceSum_RR = DragForceSum_RR + math.abs(DragForce_RR)
                 oldRevTel = curtRevTel
                 i = i + 1
		print("四轮制动力中阻滞力值:"..DragForce_FL..";"..DragForce_FR..";"..DragForce_RL..";"..DragForce_RR)
	end
        engine.Delay(10)
until(i == 10)

DragForce_FL = DragForceSum_FL / 10
DragForce_FR = DragForceSum_FR / 10
DragForce_RL = DragForceSum_RL / 10
DragForce_RR = DragForceSum_RR / 10

print("四轮阻滞力10次平均值:"..DragForce_FL..";"..DragForce_FR..";"..DragForce_RL..";"..DragForce_RR)</Script></Activity>
<Activity id="1592" ActivityType="3" flags="0" name="Read_Time">
<Rect left="150" top="804" right="250" bottom="836"/>
<Script>engine.DialogBackColor = -1;
--DFlag_Ventilpruefung_aktiv = 1;
DTimeF = os.clock();</Script></Activity>
<Activity id="1594" ActivityType="3" flags="0" name="Pump motor on">
<Rect left="150" top="854" right="250" bottom="886"/>
<Script>local req = '\x01\xDF\x43\xFF\xFF\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="13" name="DEP1531" type="8" flags="97"/>
</Activity>
<Activity id="1596" ActivityType="3" flags="0" name="USV2 HSV2 and RR FL EV on">
<Rect left="150" top="904" right="250" bottom="936"/>
<Script>local req = '\x01\xDF\x43\x00\x28\x00\x50\xFF\xFF\x00\x54\x00\x00\xFF\xFF\x00\x38\xFF\xFF\x00\x30\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script></Activity>
<Activity id="1597" ActivityType="3" flags="0" name="增压脉冲FL">
<Rect left="150" top="1014" right="250" bottom="1046"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x30\x00\x00\x00\x00\x00\x0E\xFF\xFF\x00\x30\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(140)
</Script><assessment no="14" name="DEP1548" type="8" flags="97"/>
</Activity>
<Activity id="1598" ActivityType="3" flags="0" name="循环增压FL">
<Rect left="150" top="1204" right="250" bottom="1236"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x30\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x30\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)



</Script><assessment no="15" name="DEP1549" type="8" flags="97"/>
</Activity>
<Activity id="1600" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="150" top="1324" right="250" bottom="1356"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("BrakeForce_FL:"..BrakeForce_FL)
print("BrakeForce_FR:"..BrakeForce_FR)
print("BrakeForce_RL:"..BrakeForce_RL)
print("BrakeForce_RR:"..BrakeForce_RR)



--YYA
tmpBrakeForce_FL = tostring(tmpBrakeForce_FL)..";"..tostring(BrakeForce_FL)
engine.LastError = 0
engine.StatValue = "BrakeForce_FL Cycle = "..tostring(tmpBrakeForce_FL)
</Script><assessment no="60" name="DEP2339" type="8" flags="97"/>
</Activity>
<Activity id="1601" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="150" top="1384" right="250" bottom="1416"/>
<Script>print("be_LoopBrake:"..LoopBrake)
if(BrakeForce_FL &gt; 2400.0) then
        LoopBrake = 1
	engine.LastError = 1
elseif(BrakeForce_FL &lt; 1600.0) then
	engine.LastError = 1
else
	LoopBrake = 1
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FL)
</Script><assessment no="17" name="DEP1543" type="8" flags="105"/>
</Activity>
<Activity id="1602" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="150" top="1454" right="250" bottom="1486"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="18" name="DEP1544" type="8" flags="105"/>
</Activity>
<Activity id="1603" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="150" top="1514" right="250" bottom="1546"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RL)
</Script><assessment no="19" name="DEP1536" type="8" flags="105"/>
</Activity>
<Activity id="1604" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="150" top="1574" right="250" bottom="1606"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RR)

</Script><assessment no="20" name="DEP1545" type="8" flags="105"/>
</Activity>
<Activity id="1606" ActivityType="3" flags="0" name="USV2 HSV2 off">
<Rect left="150" top="1644" right="250" bottom="1676"/>
<Script>engine.Delay(260)

local req = '\x01\xDF\x43\x00\x00\x00\x50\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="22" name="DEP1546" type="8" flags="97"/>
</Activity>
<Activity id="1607" ActivityType="3" flags="0" name="减压FL">
<Rect left="150" top="1714" right="250" bottom="1746"/>
<Script>local req = '\x01\xDF\x43\xFF\xFF\x00\x32\x00\x00\x00\x00\x00\x19\x00\x00\x00\x32\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(250)</Script><assessment no="21" name="DEP1550" type="8" flags="97"/>
</Activity>
<Activity id="1608" ActivityType="3" flags="0" name="RR FL EV off">
<Rect left="490" top="2104" right="590" bottom="2136"/>
<Script>
local req = '\x01\xDF\x43\x00\x00\x00\x38\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(2000)</Script><assessment no="29" name="DEP1887" type="8" flags="97"/>
</Activity>
<Activity id="1609" ActivityType="3" flags="0" name="USV1 HSV1 and RL FR EV on">
<Rect left="730" top="914" right="830" bottom="946"/>
<Script>local req = '\x01\xDF\x43\x00\x28\x00\x4E\xFF\xFF\x00\x52\x00\x00\xFF\xFF\x00\x3C\xFF\xFF\x00\x34\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="90" name="DEP2222" type="8" flags="97"/>
</Activity>
<Activity id="1610" ActivityType="3" flags="0" name="增压脉冲FR">
<Rect left="730" top="1024" right="830" bottom="1056"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x34\x00\x00\x00\x00\x00\x0E\xFF\xFF\x00\x34\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(140)
</Script><assessment no="23" name="DEP1553" type="8" flags="97"/>
</Activity>
<Activity id="1611" ActivityType="3" flags="0" name="循环增压FR">
<Rect left="730" top="1194" right="830" bottom="1226"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x34\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x34\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
</Script><assessment no="24" name="DEP1554" type="8" flags="97"/>
</Activity>
<Activity id="1612" ActivityType="3" flags="0" name="USV1 HSV1 off">
<Rect left="730" top="1634" right="830" bottom="1666"/>
<Script>engine.Delay(260)
local req = '\x01\xDF\x43\x00\x00\x00\x4E\x00\x00\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="40" name="DEP1888" type="8" flags="97"/>
</Activity>
<Activity id="1613" ActivityType="3" flags="0" name="减压FR">
<Rect left="730" top="1694" right="830" bottom="1726"/>
<Script>local req = '\x01\xDF\x43\xFF\xFF\x00\x36\x00\x00\x00\x00\x00\x19\x00\x00\x00\x36\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(260)
</Script><assessment no="41" name="DEP1555" type="8" flags="97"/>
</Activity>
<Activity id="1614" ActivityType="3" flags="0" name="RL FR EV off">
<Rect left="1100" top="2104" right="1200" bottom="2136"/>
<Script>
local req = '\x01\xDF\x43\x00\x00\x00\x3C\x00\x00\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(130)</Script><assessment no="91" name="DEP2223" type="8" flags="97"/>
</Activity>
<Activity id="1615" ActivityType="3" flags="0" name="USV1 HSV1 and RL FR EV on">
<Rect left="1370" top="914" right="1470" bottom="946"/>
<Script>local req = '\x01\xDF\x43\x00\x28\x00\x4E\xFF\xFF\x00\x52\x00\x00\xFF\xFF\x00\x3C\xFF\xFF\x00\x34\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="92" name="DEP2222" type="8" flags="97"/>
</Activity>
<Activity id="1616" ActivityType="3" flags="0" name="增压脉冲RL">
<Rect left="1370" top="1034" right="1470" bottom="1066"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x0A\xFF\xFF\x00\x3C\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(140)
</Script><assessment no="44" name="DEP1532" type="8" flags="97"/>
</Activity>
<Activity id="1617" ActivityType="3" flags="0" name="循环增压RL">
<Rect left="1370" top="1214" right="1470" bottom="1246"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x02\xFF\xFF\x00\x3C\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

</Script><assessment no="45" name="DEP1535" type="8" flags="97"/>
</Activity>
<Activity id="1618" ActivityType="3" flags="0" name="USV1 HSV1 off">
<Rect left="1370" top="1654" right="1470" bottom="1686"/>
<Script>engine.Delay(260)
local req = '\x01\xDF\x43\x00\x00\x00\x4E\x00\x00\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="46" name="DEP1888" type="8" flags="97"/>
</Activity>
<Activity id="1619" ActivityType="3" flags="0" name="减压RL">
<Rect left="1370" top="1704" right="1470" bottom="1736"/>
<Script>local req = '\x01\xDF\x43\xFF\xFF\x00\x3E\x00\x00\x00\x00\x00\x19\x00\x00\x00\x3E\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(500)</Script><assessment no="47" name="DEP1538" type="8" flags="97"/>
</Activity>
<Activity id="1620" ActivityType="3" flags="0" name="RL FR EV off">
<Rect left="1710" top="2114" right="1810" bottom="2146"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x3C\x00\x00\x00\x34\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(130)</Script><assessment no="93" name="DEP2223" type="8" flags="97"/>
</Activity>
<Activity id="1621" ActivityType="3" flags="0" name="USV2 HSV2 and RR FL EV on">
<Rect left="1980" top="914" right="2080" bottom="946"/>
<Script>local req = '\x01\xDF\x43\x00\x28\x00\x50\xFF\xFF\x00\x54\x00\x00\xFF\xFF\x00\x38\xFF\xFF\x00\x30\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="94" name="DEP2225" type="8" flags="97"/>
</Activity>
<Activity id="1622" ActivityType="3" flags="0" name="增压脉冲RR">
<Rect left="1980" top="1024" right="2080" bottom="1056"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x38\x00\x00\x00\x00\x00\x0A\xFF\xFF\x00\x38\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
engine.Delay(140)
</Script><assessment no="50" name="DEP1541" type="8" flags="97"/>
</Activity>
<Activity id="1623" ActivityType="3" flags="0" name="循环增压RR">
<Rect left="1980" top="1204" right="2080" bottom="1236"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x38\x00\x00\x00\x00\x00\x02\xFF\xFF\x00\x38\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
</Script><assessment no="51" name="DEP1542" type="8" flags="97"/>
</Activity>
<Activity id="1624" ActivityType="3" flags="0" name="USV2 HSV2 off">
<Rect left="1980" top="1644" right="2080" bottom="1676"/>
<Script>engine.Delay(260)
local req = '\x01\xDF\x43\x00\x00\x00\x50\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

</Script><assessment no="95" name="DEP2226" type="8" flags="97"/>
</Activity>
<Activity id="1625" ActivityType="3" flags="0" name="减压RR">
<Rect left="1980" top="1694" right="2080" bottom="1726"/>
<Script>local req = '\x01\xDF\x43\xFF\xFF\x00\x3A\x00\x00\x00\x00\x00\x19\x00\x00\x00\x3A\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(500)</Script><assessment no="96" name="DEP2227" type="8" flags="97"/>
</Activity>
<Activity id="1626" ActivityType="3" flags="0" name="RR FL EV off">
<Rect left="1980" top="2174" right="2080" bottom="2206"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x38\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(130)</Script><assessment no="54" name="DEP1887" type="8" flags="97"/>
</Activity>
<Activity id="1627" ActivityType="3" flags="0" name="ALL USV  and HSV off">
<Rect left="1980" top="2244" right="2080" bottom="2276"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x4E\x00\x00\x00\x50\x00\x00\x00\x00\x00\x52\x00\x00\x00\x54\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="97" name="DEP2228" type="8" flags="97"/>
</Activity>
<Activity id="1628" ActivityType="3" flags="0" name="ALL EV off">
<Rect left="1980" top="2304" right="2080" bottom="2336"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x30\x00\x00\x00\x34\x00\x00\x00\x00\x00\x38\x00\x00\x00\x3C\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="56" name="DEP1558" type="8" flags="97"/>
</Activity>
<Activity id="1629" ActivityType="3" flags="0" name="ALL AV off">
<Rect left="1980" top="2354" right="2080" bottom="2386"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x32\x00\x00\x00\x36\x00\x00\x00\x00\x00\x3A\x00\x00\x00\x3E\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(2000)</Script><assessment no="57" name="DEP1559" type="8" flags="97"/>
</Activity>
<Activity id="1630" ActivityType="3" flags="0" name="Pump motor after 2000 off">
<Rect left="1980" top="2414" right="2080" bottom="2446"/>
<Script>local req = '\x01\xDF\x43\x00\x00\x00\x00\x00\x00\x00\x00\x00\xC8\x00\x00\x00\x22\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="58" name="DEP1560" type="8" flags="97"/>
</Activity>
<Activity id="1631" ActivityType="13" flags="0" name="激活阀组继电器关闭">
<Rect left="1980" top="2584" right="2080" bottom="2616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xDF\x47\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="98" name="DEP2229" type="8" flags="97"/>
</Activity>
<Activity id="1635" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="730" top="1314" right="830" bottom="1346"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("BrakeForce_FL:"..BrakeForce_FL)
print("BrakeForce_FR:"..BrakeForce_FR)
print("BrakeForce_RL:"..BrakeForce_RL)
print("BrakeForce_RR:"..BrakeForce_RR)



--YYA
tmpBrakeForce_FR = tostring(tmpBrakeForce_FR)..";"..tostring(BrakeForce_FR)
engine.LastError = 0
engine.StatValue = "BrakeForce_FR Cycle = "..tostring(tmpBrakeForce_FR)
</Script><assessment no="61" name="DEP2340" type="8" flags="97"/>
</Activity>
<Activity id="1638" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1370" top="1334" right="1470" bottom="1366"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("BrakeForce_FL:"..BrakeForce_FL)
print("BrakeForce_FR:"..BrakeForce_FR)
print("BrakeForce_RL:"..BrakeForce_RL)
print("BrakeForce_RR:"..BrakeForce_RR)


--YYA
tmpBrakeForce_RL = tostring(tmpBrakeForce_RL)..";"..tostring(BrakeForce_RL)
engine.LastError = 0
engine.StatValue = "BrakeForce_RL Cycle = "..tostring(tmpBrakeForce_RL)

</Script><assessment no="63" name="DEP2338" type="8" flags="97"/>
</Activity>
<Activity id="1641" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1980" top="1324" right="2080" bottom="1356"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("BrakeForce_FL:"..BrakeForce_FL)
print("BrakeForce_FR:"..BrakeForce_FR)
print("BrakeForce_RL:"..BrakeForce_RL)
print("BrakeForce_RR:"..BrakeForce_RR)



--YYA
tmpBrakeForce_RR = tostring(tmpBrakeForce_RR)..";"..tostring(BrakeForce_RR)
engine.LastError = 0
engine.StatValue = "BrakeForce_RR Cycle = "..tostring(tmpBrakeForce_RR)
</Script><assessment no="64" name="DEP2341" type="8" flags="97"/>
</Activity>
<Activity id="1643" ActivityType="3" flags="0" name="左前制动力不合格">
<Rect left="320" top="1384" right="420" bottom="1416"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("FL valve NOK time:"..ncount)</Script></Activity>
<Activity id="1644" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1204" right="386" bottom="1236"/>
</Activity>
<Activity id="1645" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="730" top="1384" right="830" bottom="1416"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="25" name="DEP1543" type="8" flags="105"/>
</Activity>
<Activity id="1646" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="730" top="1444" right="830" bottom="1476"/>
<Script>if(BrakeForce_FR &gt; 2400.0) then
         LoopBrake = 1
	engine.LastError = 1
elseif(BrakeForce_FR &lt; 1600.0) then
	engine.LastError = 1
else
	LoopBrake = 1
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FR)
</Script><assessment no="26" name="DEP1544" type="8" flags="105"/>
</Activity>
<Activity id="1647" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="730" top="1504" right="830" bottom="1536"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="27" name="DEP1536" type="8" flags="105"/>
</Activity>
<Activity id="1648" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="730" top="1564" right="830" bottom="1596"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RR)
</Script><assessment no="28" name="DEP1536" type="8" flags="105"/>
</Activity>
<Activity id="1649" ActivityType="3" flags="0" name="右前制动力不合格">
<Rect left="900" top="1444" right="1000" bottom="1476"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("FR valve NOK time:"..ncount)</Script></Activity>
<Activity id="1650" ActivityType="4" flags="0" name="路由节点">
<Rect left="934" top="1194" right="966" bottom="1226"/>
</Activity>
<Activity id="1651" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1370" top="1404" right="1470" bottom="1436"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FL)

</Script><assessment no="30" name="DEP1543" type="8" flags="105"/>
</Activity>
<Activity id="1652" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1370" top="1464" right="1470" bottom="1496"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FR)
</Script><assessment no="31" name="DEP1544" type="8" flags="105"/>
</Activity>
<Activity id="1653" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1370" top="1524" right="1470" bottom="1556"/>
<Script>if(BrakeForce_RL &gt; 1400.0) then
         LoopBrake = 1
	engine.LastError = 1
elseif(BrakeForce_RL &lt; 800.0) then
	engine.LastError = 1
else
	LoopBrake = 1
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RL)

</Script><assessment no="32" name="DEP1536" type="8" flags="105"/>
</Activity>
<Activity id="1654" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1370" top="1584" right="1470" bottom="1616"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RR)
</Script><assessment no="34" name="DEP1545" type="8" flags="105"/>
</Activity>
<Activity id="1655" ActivityType="3" flags="0" name="左后制动力不合格">
<Rect left="1540" top="1524" right="1640" bottom="1556"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("RL valve NOK time:"..ncount)</Script></Activity>
<Activity id="1656" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1980" top="1394" right="2080" bottom="1426"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FL)
</Script><assessment no="35" name="DEP1543" type="8" flags="105"/>
</Activity>
<Activity id="1657" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1980" top="1454" right="2080" bottom="1486"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FR)
</Script><assessment no="36" name="DEP1544" type="8" flags="105"/>
</Activity>
<Activity id="1658" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1980" top="1514" right="2080" bottom="1546"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RL)
</Script><assessment no="37" name="DEP1536" type="8" flags="105"/>
</Activity>
<Activity id="1659" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1980" top="1574" right="2080" bottom="1606"/>
<Script>if(BrakeForce_RR &gt; 1400.0) then
         LoopBrake = 1
	engine.LastError = 1
elseif(BrakeForce_RR &lt; 800.0) then
	engine.LastError = 1
else
	LoopBrake = 1
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_RR)
</Script><assessment no="38" name="DEP1545" type="8" flags="105"/>
</Activity>
<Activity id="1660" ActivityType="3" flags="0" name="右后制动力不合格">
<Rect left="2150" top="1574" right="2250" bottom="1606"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("RR valve NOK time:"..ncount)</Script></Activity>
<Activity id="1661" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="1214" right="1606" bottom="1246"/>
</Activity>
<Activity id="1662" ActivityType="4" flags="0" name="路由节点">
<Rect left="2184" top="1204" right="2216" bottom="1236"/>
</Activity>
<Activity id="1663" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1980" top="2664" right="2080" bottom="2696"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1664" ActivityType="3" flags="0" name="获取制动力">
<Rect left="150" top="1074" right="250" bottom="1106"/>
<Script>oldRevTel = ""
curtRevTel = ""

local factor = 1.0;

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
curtRevTelHex = LibGeneral.hex2str(curtRevTel)
print("FL阀门制动力获取IDT报文:"..curtRevTelHex)

--获取左前轮制动力
BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
--获取右前轮制动力
BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
--获取左后轮制动力
BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
--获取右后轮制动力
BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   

engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")

oldRevTel = curtRevTel</Script></Activity>
<Activity id="1748" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="150" top="1134" right="250" bottom="1166"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1749" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="1134" right="86" bottom="1166"/>
</Activity>
<Activity id="1750" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="1384" right="86" bottom="1416"/>
</Activity>
<Activity id="1751" ActivityType="3" flags="0" name="变量初始化">
<Rect left="150" top="954" right="250" bottom="986"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1753" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="914" right="556" bottom="946"/>
</Activity>
<Activity id="1754" ActivityType="3" flags="0" name="获取制动力">
<Rect left="730" top="1074" right="830" bottom="1106"/>
<Script>oldRevTel = ""
curtRevTel = ""

local factor = 1.0;

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
curtRevTelHex = LibGeneral.hex2str(curtRevTel)
print("FR阀门制动力获取IDT报文:"..curtRevTelHex)

--获取左前轮制动力
BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
--获取右前轮制动力
BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
--获取左后轮制动力
BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
--获取右后轮制动力
BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   

engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")

oldRevTel = curtRevTel</Script></Activity>
<Activity id="1755" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="730" top="1134" right="830" bottom="1166"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1756" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="1134" right="636" bottom="1166"/>
</Activity>
<Activity id="1757" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="1384" right="636" bottom="1416"/>
</Activity>
<Activity id="1758" ActivityType="3" flags="0" name="变量初始化">
<Rect left="730" top="974" right="830" bottom="1006"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1759" ActivityType="3" flags="0" name="获取制动力">
<Rect left="150" top="1264" right="250" bottom="1296"/>
<Script>local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("FL阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1760" ActivityType="3" flags="0" name="获取制动力">
<Rect left="730" top="1254" right="830" bottom="1286"/>
<Script>local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("FR阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1762" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="914" right="1166" bottom="946"/>
</Activity>
<Activity id="1763" ActivityType="3" flags="0" name="变量初始化">
<Rect left="1370" top="974" right="1470" bottom="1006"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1764" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="1094" right="1470" bottom="1126"/>
<Script>oldRevTel = ""
curtRevTel = ""

local factor = 1.0;

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
curtRevTelHex = LibGeneral.hex2str(curtRevTel)
print("RL阀门制动力获取IDT报文:"..curtRevTelHex)

--获取左前轮制动力
BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
--获取右前轮制动力
BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
--获取左后轮制动力
BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
--获取右后轮制动力
BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   

engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")

oldRevTel = curtRevTel</Script></Activity>
<Activity id="1765" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1370" top="1154" right="1470" bottom="1186"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1766" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="1154" right="1286" bottom="1186"/>
</Activity>
<Activity id="1767" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="1404" right="1286" bottom="1436"/>
</Activity>
<Activity id="1768" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="1274" right="1470" bottom="1306"/>
<Script>local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("RL阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1770" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="914" right="1776" bottom="946"/>
</Activity>
<Activity id="1771" ActivityType="3" flags="0" name="变量初始化">
<Rect left="1980" top="974" right="2080" bottom="1006"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1772" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1980" top="1084" right="2080" bottom="1116"/>
<Script>oldRevTel = ""
curtRevTel = ""

local factor = 1.0;

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
curtRevTelHex = LibGeneral.hex2str(curtRevTel)
print("RR阀门制动力获取IDT报文:"..curtRevTelHex)

--获取左前轮制动力
BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
--获取右前轮制动力
BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
--获取左后轮制动力
BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
--获取右后轮制动力
BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   

engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")

oldRevTel = curtRevTel</Script></Activity>
<Activity id="1773" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1980" top="1144" right="2080" bottom="1176"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1774" ActivityType="4" flags="0" name="路由节点">
<Rect left="1864" top="1144" right="1896" bottom="1176"/>
</Activity>
<Activity id="1775" ActivityType="4" flags="0" name="路由节点">
<Rect left="1864" top="1394" right="1896" bottom="1426"/>
</Activity>
<Activity id="1776" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1980" top="1264" right="2080" bottom="1296"/>
<Script>local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("RR阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1778" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="150" top="1854" right="250" bottom="1886"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1779" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="150" top="1914" right="250" bottom="1946"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script></Activity>
<Activity id="1780" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="150" top="1974" right="250" bottom="2006"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script></Activity>
<Activity id="1781" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="150" top="2034" right="250" bottom="2066"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script></Activity>
<Activity id="1782" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="150" top="2104" right="250" bottom="2136"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script></Activity>
<Activity id="1783" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="340" top="1914" right="440" bottom="1946"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1784" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1794" right="406" bottom="1826"/>
</Activity>
<Activity id="1785" ActivityType="3" flags="0" name="获取制动力">
<Rect left="150" top="1794" right="250" bottom="1826"/>
<Script>curtRevTel = ""
local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("泄压FL阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1786" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="730" top="1854" right="830" bottom="1886"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1787" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="730" top="1914" right="830" bottom="1946"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script></Activity>
<Activity id="1788" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="730" top="1974" right="830" bottom="2006"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script></Activity>
<Activity id="1789" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="730" top="2034" right="830" bottom="2066"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script></Activity>
<Activity id="1790" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="730" top="2104" right="830" bottom="2136"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script></Activity>
<Activity id="1791" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="950" top="1914" right="1050" bottom="1946"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1792" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1794" right="1016" bottom="1826"/>
</Activity>
<Activity id="1793" ActivityType="3" flags="0" name="获取制动力">
<Rect left="730" top="1794" right="830" bottom="1826"/>
<Script>curtRevTel = ""
local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("泄压FR阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1794" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1370" top="1864" right="1470" bottom="1896"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1795" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1370" top="1924" right="1470" bottom="1956"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script></Activity>
<Activity id="1796" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1370" top="1984" right="1470" bottom="2016"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script></Activity>
<Activity id="1797" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1370" top="2044" right="1470" bottom="2076"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script></Activity>
<Activity id="1798" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1370" top="2114" right="1470" bottom="2146"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script></Activity>
<Activity id="1799" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="1590" top="1924" right="1690" bottom="1956"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1800" ActivityType="4" flags="0" name="路由节点">
<Rect left="1624" top="1804" right="1656" bottom="1836"/>
</Activity>
<Activity id="1801" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="1804" right="1470" bottom="1836"/>
<Script>curtRevTel = ""
local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("泄压RL阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1802" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1980" top="1854" right="2080" bottom="1886"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1803" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1980" top="1914" right="2080" bottom="1946"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script></Activity>
<Activity id="1804" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1980" top="1974" right="2080" bottom="2006"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script></Activity>
<Activity id="1805" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1980" top="2034" right="2080" bottom="2066"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script></Activity>
<Activity id="1806" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1980" top="2104" right="2080" bottom="2136"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script></Activity>
<Activity id="1807" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="2240" top="1914" right="2340" bottom="1946"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1808" ActivityType="4" flags="0" name="路由节点">
<Rect left="2274" top="1794" right="2306" bottom="1826"/>
</Activity>
<Activity id="1809" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1980" top="1794" right="2080" bottom="1826"/>
<Script>curtRevTel = ""
local curtRevTelHex = ""

local factor = 1.0;

repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("泄压RR阀门制动力获取IDT报文:"..curtRevTelHex)
	
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor   
        
	engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
        engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")
        engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
        engine.SetLineText(3,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")
         
	
until(curtRevTel ~= oldRevTel)</Script></Activity>
<Activity id="1810" ActivityType="4" flags="0" name="路由节点">
<Rect left="2274" top="2174" right="2306" bottom="2206"/>
</Activity>
<Activity id="1812" ActivityType="3" flags="0" name="左前最终不合格">
<Rect left="320" top="1454" right="420" bottom="1486"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1813" ActivityType="3" flags="0" name="右前最终不合格">
<Rect left="900" top="1504" right="1000" bottom="1536"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1814" ActivityType="3" flags="0" name="左后最终不合格">
<Rect left="1540" top="1584" right="1640" bottom="1616"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1815" ActivityType="3" flags="0" name="右后最终不合格">
<Rect left="2150" top="1644" right="2250" bottom="1676"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1816" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="1980" top="2464" right="2080" bottom="2496"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1817" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="1980" top="2524" right="2080" bottom="2556"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;缓慢踩刹车让毂静止&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1818" ActivityType="3" flags="0" name="重做">
<Rect left="2390" top="2524" right="2490" bottom="2556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="阀门检测不合格"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="是否重做？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>repeatAction  = false
#PRESSBUTTON</Script></Activity>
<Activity id="1819" ActivityType="4" flags="0" name="路由节点">
<Rect left="2424" top="644" right="2456" bottom="676"/>
</Activity>
<Activity id="1821" ActivityType="13" flags="0" name="ECU_Close">
<Rect top="214" right="100" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="643" type="0">
</Transition>
<Transition StartId="643" EndId="1277" type="3">
</Transition>
<Transition StartId="643" EndId="1821" type="0">
</Transition>
<Transition StartId="1277" EndId="1332" type="3">
</Transition>
<Transition StartId="1277" EndId="1821" type="0">
</Transition>
<Transition StartId="1328" EndId="1329" type="0">
</Transition>
<Transition StartId="1329" EndId="1330" type="0">
</Transition>
<Transition StartId="1330" EndId="1331" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1330" EndId="1333" type="0">
</Transition>
<Transition StartId="1331" EndId="1332" type="0">
</Transition>
<Transition StartId="1332" EndId="1328" type="0">
</Transition>
<Transition StartId="1333" EndId="1334" type="0">
</Transition>
<Transition StartId="1334" EndId="1583" type="0">
</Transition>
<Transition StartId="1334" EndId="1589" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1589" EndId="1590" type="0">
</Transition>
<Transition StartId="1589" EndId="1591" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="1591" EndId="1592" type="0">
</Transition>
<Transition StartId="1592" EndId="1594" type="0">
</Transition>
<Transition StartId="1594" EndId="1596" type="0">
</Transition>
<Transition StartId="1596" EndId="1751" type="0">
</Transition>
<Transition StartId="1597" EndId="1664" type="0">
</Transition>
<Transition StartId="1598" EndId="1759" type="0">
</Transition>
<Transition StartId="1600" EndId="1601" type="0">
</Transition>
<Transition StartId="1601" EndId="1602" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1601" EndId="1643" type="0">
</Transition>
<Transition StartId="1601" EndId="1812" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1602" EndId="1603" type="0">
</Transition>
<Transition StartId="1603" EndId="1604" type="0">
</Transition>
<Transition StartId="1604" EndId="1606" type="0">
</Transition>
<Transition StartId="1606" EndId="1607" type="0">
</Transition>
<Transition StartId="1607" EndId="1785" type="0">
</Transition>
<Transition StartId="1608" EndId="1753" type="0">
</Transition>
<Transition StartId="1609" EndId="1758" type="0">
</Transition>
<Transition StartId="1610" EndId="1754" type="0">
</Transition>
<Transition StartId="1611" EndId="1760" type="0">
</Transition>
<Transition StartId="1612" EndId="1613" type="0">
</Transition>
<Transition StartId="1613" EndId="1793" type="0">
</Transition>
<Transition StartId="1614" EndId="1762" type="0">
</Transition>
<Transition StartId="1615" EndId="1763" type="0">
</Transition>
<Transition StartId="1616" EndId="1764" type="0">
</Transition>
<Transition StartId="1617" EndId="1768" type="0">
</Transition>
<Transition StartId="1618" EndId="1619" type="0">
</Transition>
<Transition StartId="1619" EndId="1801" type="0">
</Transition>
<Transition StartId="1620" EndId="1770" type="0">
</Transition>
<Transition StartId="1621" EndId="1771" type="0">
</Transition>
<Transition StartId="1622" EndId="1772" type="0">
</Transition>
<Transition StartId="1623" EndId="1776" type="0">
</Transition>
<Transition StartId="1624" EndId="1625" type="0">
</Transition>
<Transition StartId="1625" EndId="1809" type="0">
</Transition>
<Transition StartId="1626" EndId="1627" type="0">
</Transition>
<Transition StartId="1627" EndId="1628" type="0">
</Transition>
<Transition StartId="1628" EndId="1629" type="0">
</Transition>
<Transition StartId="1629" EndId="1630" type="0">
</Transition>
<Transition StartId="1630" EndId="1816" type="0">
</Transition>
<Transition StartId="1631" EndId="1663" type="0">
</Transition>
<Transition StartId="1635" EndId="1645" type="0">
</Transition>
<Transition StartId="1638" EndId="1651" type="0">
</Transition>
<Transition StartId="1641" EndId="1656" type="0">
</Transition>
<Transition StartId="1643" EndId="1644" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1643" EndId="1812" type="0">
</Transition>
<Transition StartId="1644" EndId="1598" type="0">
</Transition>
<Transition StartId="1645" EndId="1646" type="0">
</Transition>
<Transition StartId="1646" EndId="1647" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1646" EndId="1649" type="0">
</Transition>
<Transition StartId="1646" EndId="1813" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1647" EndId="1648" type="0">
</Transition>
<Transition StartId="1648" EndId="1612" type="0">
</Transition>
<Transition StartId="1649" EndId="1650" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1649" EndId="1813" type="0">
</Transition>
<Transition StartId="1650" EndId="1611" type="0">
</Transition>
<Transition StartId="1651" EndId="1652" type="0">
</Transition>
<Transition StartId="1652" EndId="1653" type="0">
</Transition>
<Transition StartId="1653" EndId="1654" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1653" EndId="1655" type="0">
</Transition>
<Transition StartId="1653" EndId="1814" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1654" EndId="1618" type="0">
</Transition>
<Transition StartId="1655" EndId="1661" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1655" EndId="1814" type="0">
</Transition>
<Transition StartId="1656" EndId="1657" type="0">
</Transition>
<Transition StartId="1657" EndId="1658" type="0">
</Transition>
<Transition StartId="1658" EndId="1659" type="0">
</Transition>
<Transition StartId="1659" EndId="1660" type="0">
</Transition>
<Transition StartId="1659" EndId="1624" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1659" EndId="1815" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1660" EndId="1662" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1660" EndId="1815" type="0">
</Transition>
<Transition StartId="1661" EndId="1617" type="0">
</Transition>
<Transition StartId="1662" EndId="1623" type="0">
</Transition>
<Transition StartId="1663" EndId="2" type="0">
</Transition>
<Transition StartId="1664" EndId="1748" type="0">
</Transition>
<Transition StartId="1748" EndId="1749" type="0">
</Transition>
<Transition StartId="1749" EndId="1750" type="0">
</Transition>
<Transition StartId="1750" EndId="1601" type="0">
</Transition>
<Transition StartId="1751" EndId="1597" type="0">
</Transition>
<Transition StartId="1753" EndId="1609" type="0">
</Transition>
<Transition StartId="1754" EndId="1755" type="0">
</Transition>
<Transition StartId="1755" EndId="1756" type="0">
</Transition>
<Transition StartId="1756" EndId="1757" type="0">
</Transition>
<Transition StartId="1757" EndId="1645" type="0">
</Transition>
<Transition StartId="1758" EndId="1610" type="0">
</Transition>
<Transition StartId="1759" EndId="1600" type="0">
</Transition>
<Transition StartId="1760" EndId="1635" type="0">
</Transition>
<Transition StartId="1762" EndId="1615" type="0">
</Transition>
<Transition StartId="1763" EndId="1616" type="0">
</Transition>
<Transition StartId="1764" EndId="1765" type="0">
</Transition>
<Transition StartId="1765" EndId="1766" type="0">
</Transition>
<Transition StartId="1766" EndId="1767" type="0">
</Transition>
<Transition StartId="1767" EndId="1651" type="0">
</Transition>
<Transition StartId="1768" EndId="1638" type="0">
</Transition>
<Transition StartId="1770" EndId="1621" type="0">
</Transition>
<Transition StartId="1771" EndId="1622" type="0">
</Transition>
<Transition StartId="1772" EndId="1773" type="0">
</Transition>
<Transition StartId="1773" EndId="1774" type="0">
</Transition>
<Transition StartId="1774" EndId="1775" type="0">
</Transition>
<Transition StartId="1775" EndId="1656" type="0">
</Transition>
<Transition StartId="1776" EndId="1641" type="0">
</Transition>
<Transition StartId="1778" EndId="1779" type="0">
</Transition>
<Transition StartId="1779" EndId="1780" type="3">
</Transition>
<Transition StartId="1779" EndId="1783" type="0">
</Transition>
<Transition StartId="1780" EndId="1781" type="3">
</Transition>
<Transition StartId="1780" EndId="1783" type="0">
</Transition>
<Transition StartId="1781" EndId="1782" type="3">
</Transition>
<Transition StartId="1781" EndId="1783" type="0">
</Transition>
<Transition StartId="1782" EndId="1783" type="0">
</Transition>
<Transition StartId="1782" EndId="1608" type="3">
</Transition>
<Transition StartId="1783" EndId="1784" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1783" EndId="1608" type="0">
</Transition>
<Transition StartId="1784" EndId="1785" type="0">
</Transition>
<Transition StartId="1785" EndId="1778" type="0">
</Transition>
<Transition StartId="1786" EndId="1787" type="0">
</Transition>
<Transition StartId="1787" EndId="1788" type="3">
</Transition>
<Transition StartId="1787" EndId="1791" type="0">
</Transition>
<Transition StartId="1788" EndId="1789" type="3">
</Transition>
<Transition StartId="1788" EndId="1791" type="0">
</Transition>
<Transition StartId="1789" EndId="1790" type="3">
</Transition>
<Transition StartId="1789" EndId="1791" type="0">
</Transition>
<Transition StartId="1790" EndId="1791" type="0">
</Transition>
<Transition StartId="1790" EndId="1614" type="3">
</Transition>
<Transition StartId="1791" EndId="1792" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1791" EndId="1614" type="0">
</Transition>
<Transition StartId="1792" EndId="1793" type="0">
</Transition>
<Transition StartId="1793" EndId="1786" type="0">
</Transition>
<Transition StartId="1794" EndId="1795" type="0">
</Transition>
<Transition StartId="1795" EndId="1796" type="3">
</Transition>
<Transition StartId="1795" EndId="1799" type="0">
</Transition>
<Transition StartId="1796" EndId="1797" type="3">
</Transition>
<Transition StartId="1796" EndId="1799" type="0">
</Transition>
<Transition StartId="1797" EndId="1798" type="3">
</Transition>
<Transition StartId="1797" EndId="1799" type="0">
</Transition>
<Transition StartId="1798" EndId="1799" type="0">
</Transition>
<Transition StartId="1798" EndId="1620" type="3">
</Transition>
<Transition StartId="1799" EndId="1800" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1800" EndId="1801" type="0">
</Transition>
<Transition StartId="1801" EndId="1794" type="0">
</Transition>
<Transition StartId="1802" EndId="1803" type="0">
</Transition>
<Transition StartId="1803" EndId="1804" type="3">
</Transition>
<Transition StartId="1803" EndId="1807" type="0">
</Transition>
<Transition StartId="1804" EndId="1805" type="3">
</Transition>
<Transition StartId="1804" EndId="1807" type="0">
</Transition>
<Transition StartId="1805" EndId="1806" type="3">
</Transition>
<Transition StartId="1805" EndId="1807" type="0">
</Transition>
<Transition StartId="1806" EndId="1807" type="0">
</Transition>
<Transition StartId="1806" EndId="1626" type="3">
</Transition>
<Transition StartId="1807" EndId="1808" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1807" EndId="1810" type="0">
</Transition>
<Transition StartId="1808" EndId="1809" type="0">
</Transition>
<Transition StartId="1809" EndId="1802" type="0">
</Transition>
<Transition StartId="1810" EndId="1626" type="0">
</Transition>
<Transition StartId="1812" EndId="1602" type="0">
</Transition>
<Transition StartId="1813" EndId="1647" type="0">
</Transition>
<Transition StartId="1814" EndId="1654" type="0">
</Transition>
<Transition StartId="1815" EndId="1624" type="0">
</Transition>
<Transition StartId="1816" EndId="1817" type="0">
</Transition>
<Transition StartId="1817" EndId="1631" type="0">
</Transition>
<Transition StartId="1817" EndId="1818" type="1">
<Expression>repeatAction == true</Expression></Transition>
<Transition StartId="1818" EndId="1631" type="5">
</Transition>
<Transition StartId="1818" EndId="1819" type="0">
</Transition>
<Transition StartId="1819" EndId="1334" type="0">
</Transition>
</Transitions>
</Process>

