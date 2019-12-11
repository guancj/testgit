<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1604" pbltext="DEP1529">
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
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="190" top="74" right="290" bottom="106"/>
<Script>repeatAction = false
--YYA
tmpBrakeForce_RL = 0
tmpBrakeForce_FL = 0
tmpBrakeForce_RR = 0
tmpBrakeForce_FR = 0</Script><TitleText Enable="1" Text="ESP阀门检测"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="2290" top="3874" right="2390" bottom="3906"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="642" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="190" top="204" right="290" bottom="236"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="643" ActivityType="13" flags="0" name="扩展会话">
<Rect left="190" top="264" right="290" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="644" ActivityType="3" flags="1" name="释放制动踏板开关">
<Rect left="190" top="454" right="290" bottom="486"/>
<Script>DVciResult = string.sub(DVciResult1,5,5);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 制动开关 FD01 ##"..DVciResult);</Script></Activity>
<Activity id="1269" ActivityType="3" flags="0" name="InitTest">
<Rect left="190" top="324" right="290" bottom="356"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1270" ActivityType="13" flags="0" name="释放踏板状态比对">
<Rect left="190" top="524" right="290" bottom="556"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="TextCmp" value="&quot;00&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;释放刹车&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1506" type="8" flags="97"/>
</Activity>
<Activity id="1271" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="190" top="594" right="290" bottom="626"/>
<Script></Script></Activity>
<Activity id="1272" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="454" right="376" bottom="486"/>
</Activity>
<Activity id="1273" ActivityType="13" flags="0" name="制动开关">
<Rect left="190" top="384" right="290" bottom="416"/>
<Line1Text Enable="1" Text="释放刹车"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xFD\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1276" ActivityType="3" flags="0" name="安全算法">
<Rect left="190" top="654" right="290" bottom="686"/>
<Script>DVciResult = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,'\x01')

m0 = string.sub(DVciResult,3,3)
s0 = LibGeneral.binStr2Int(m0)

m1 = string.sub(DVciResult,4,4)
s1 = LibGeneral.binStr2Int(m1)

m2 = string.sub(DVciResult,5,5)
s2 = LibGeneral.binStr2Int(m2)

m3 = string.sub(DVciResult,6,6)
s3 = LibGeneral.binStr2Int(m3)

seed=bit32.lshift(s0,24)+bit32.lshift(s1,16)+bit32.lshift(s2,8)+s3;
key=bit32.bxor(bit32.lshift(bit32.bxor(bit32.rshift(seed,3),seed),4),seed);

key0=bit32.rshift(bit32.band(key,bit32.lshift(0xff,24)),24);
key1=bit32.rshift(bit32.band(key,bit32.lshift(0xff,16)),16);
key2=bit32.rshift(bit32.band(key,bit32.lshift(0xff,8)),8);
key3=bit32.rshift(bit32.band(key,bit32.lshift(0xff,0)),0);
engine.println(string.format("%02x%02x%02x%02x",key0,key1,key2,key3));
--return key0,key1,key2,key3;
ESP_Key = string.format("%02x%02x%02x%02x",key0,key1,key2,key3)
ESP_KeyHEX = LibGeneral.str2hex(ESP_Key)
ESP_Key_HEX = "\x02"..ESP_KeyHEX

DVciResult = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,ESP_Key_HEX)</Script></Activity>
<Activity id="1277" ActivityType="4" flags="0" name="路由节点">
<Rect left="3764" top="2364" right="3796" bottom="2396"/>
</Activity>
<Activity id="1278" ActivityType="3" flags="0" name="检测系统状态评估">
<Rect left="190" top="774" right="290" bottom="806"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 FD02 ##"..DVciResult);</Script></Activity>
<Activity id="1279" ActivityType="13" flags="0" name="Status_Check_view_String">
<Rect left="190" top="824" right="290" bottom="856"/>
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
<assessment no="5" name="DEP1515" type="8" flags="97"/>
</Activity>
<Activity id="1280" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="190" top="884" right="290" bottom="916"/>
<Script></Script></Activity>
<Activity id="1281" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="774" right="416" bottom="806"/>
</Activity>
<Activity id="1282" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="190" top="714" right="290" bottom="746"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xFD\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1283" ActivityType="13" flags="0" name="禁用速度限制和阀组继电器关闭">
<Rect left="190" top="944" right="290" bottom="976"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xFF\xA0\x03\x00\x60\x00\x00\x00\x60\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1510" type="8" flags="97"/>
</Activity>
<Activity id="1285" ActivityType="5" flags="0" name="速度检查">
<Rect left="190" top="1064" right="290" bottom="1096"/>
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
<Activity id="1291" ActivityType="3" flags="0" name="Read_Time">
<Rect left="190" top="1184" right="290" bottom="1216"/>
<Script>engine.DialogBackColor = -1;
--DFlag_Ventilpruefung_aktiv = 1;
DTimeF = os.clock();

</Script></Activity>
<Activity id="1292" ActivityType="3" flags="0" name="ValveTest">
<Rect left="190" top="1234" right="290" bottom="1266"/>
<TitleText Enable="1" Text="ESP 测试"/>
<Script>VAufbauMin = 500.0;
HAufbauMin = 400.0;
VHAbbauMax = 200.0;
--DTime_Ventilpruefung_Start = 1;
DTime_Ventilpruefung_Start = 1;
engine.println("##### ESP VALVE")</Script></Activity>
<Activity id="1557" ActivityType="5" flags="0" name="毂静止">
<Rect left="3320" top="3174" right="3420" bottom="3206"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="withEngine" value="false"/>
<Parameter id="driveEngine" value="false"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1558" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="3510" top="3194" right="3610" bottom="3226"/>
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
<Activity id="1582" ActivityType="5" flags="0" name="全毂5km/h">
<Rect left="190" top="1004" right="290" bottom="1036"/>
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
<Activity id="1584" ActivityType="3" flags="0" name="毂速度不正确">
<Rect left="320" top="1064" right="420" bottom="1096"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false
print("四毂速度检查不正确")</Script><assessment no="7" name="DEP1530" type="8" flags="97"/>
</Activity>
<Activity id="1585" ActivityType="3" flags="0" name="获取阻滞力">
<Rect left="190" top="1124" right="290" bottom="1156"/>
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
<Activity id="1587" ActivityType="3" flags="0" name="IDT错误">
<Rect left="30" top="1004" right="130" bottom="1036"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false</Script><assessment no="117" name="DEP1563" type="8" flags="97"/>
</Activity>
<Activity id="1590" ActivityType="5" flags="0" name="读档位">
<Rect left="190" top="144" right="290" bottom="176"/>
<SubProcesses>
<SubProcess id="C131_ATcheckN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1602" ActivityType="3" flags="0" name="Pump motor on">
<Rect left="190" top="1304" right="290" bottom="1336"/>
<Script>local req = '\x01\xF0\x03\xFF\xFF\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="8" name="DEP1531" type="8" flags="97"/>
</Activity>
<Activity id="1603" ActivityType="3" flags="0" name="RL FR EV on">
<Rect left="190" top="1374" right="290" bottom="1406"/>
<Script>local req = '\x01\xF0\x03\x00\x00\x00\x00\xFF\xFF\x00\x34\x00\x00\xFF\xFF\x00\x3C\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="10" name="DEP1533" type="8" flags="97"/>
</Activity>
<Activity id="1604" ActivityType="3" flags="0" name="USV1 HSV1 on">
<Rect left="190" top="1434" right="290" bottom="1466"/>
<Script>local req = '\x01\xF0\x03\x00\x28\x00\x4E\xFF\xFF\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="11" name="DEP1534" type="8" flags="97"/>
</Activity>
<Activity id="1605" ActivityType="3" flags="0" name="预增压RL">
<Rect left="190" top="1544" right="290" bottom="1576"/>
<Script>local req = '\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x0E\xFF\xFF\x00\x3C\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)

engine.Delay(500)
</Script><assessment no="9" name="DEP1532" type="8" flags="97"/>
</Activity>
<Activity id="1608" ActivityType="3" flags="0" name="循环增压RL">
<Rect left="190" top="1714" right="290" bottom="1746"/>
<Script>--local req = '\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x3C\x00\x00\x00\x00'
local req = '\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x05\xFF\xFF\x00\x3C\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script></Activity>
<Activity id="1610" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="190" top="1814" right="290" bottom="1846"/>
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
engine.StatValue = "BrakeForce_RL Cycle = "..tostring(tmpBrakeForce_RL)</Script><assessment no="135" name="DEP2338" type="8" flags="97"/>
</Activity>
<Activity id="1611" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="190" top="1874" right="290" bottom="1906"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="24" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1612" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="190" top="1934" right="290" bottom="1966"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end
engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="25" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1613" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="190" top="1994" right="290" bottom="2026"/>
<Script>if(BrakeForce_RL &gt; 1600.0) then
        LoopBrake = 1
        engine.LastError = 1
elseif(BrakeForce_RL &lt; 800.0) then  
	engine.LastError = 1
else
	LoopBrake = 1
         engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="13" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1614" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="190" top="2064" right="290" bottom="2096"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="26" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1615" ActivityType="3" flags="0" name="左后制动力不合格">
<Rect left="340" top="1994" right="440" bottom="2026"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel
print("RL valve NOK time:"..ncount)</Script></Activity>
<Activity id="1616" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1714" right="406" bottom="1746"/>
</Activity>
<Activity id="1620" ActivityType="3" flags="0" name="HSV1 off">
<Rect left="190" top="2134" right="290" bottom="2166"/>
<Script>local req = '\x01\xF0\x03\x00\x00\x00\x00\x00\x00\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)</Script><assessment no="14" name="DEP1537" type="8" flags="97"/>
</Activity>
<Activity id="1622" ActivityType="3" flags="0" name="泄压RL">
<Rect left="190" top="2194" right="290" bottom="2226"/>
<Script>local req = '\x01\xF0\x03\xFF\xFF\x00\x3E\x00\x00\x00\x00\x00\x19\x00\x00\x00\x3E\x00\x00\x00\x00'
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,req)
</Script><assessment no="15" name="DEP1538" type="8" flags="97"/>
</Activity>
<Activity id="1623" ActivityType="3" flags="0" name="延时2秒">
<Rect left="190" top="2254" right="290" bottom="2286"/>
<Script>engine.Delay(2000)
oldRevTel = ""

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;

ncount = 0</Script></Activity>
<Activity id="1624" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="190" top="2374" right="290" bottom="2406"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1626" ActivityType="3" flags="0" name="变量初始化">
<Rect left="190" top="1494" right="290" bottom="1526"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1631" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="190" top="2434" right="290" bottom="2466"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="120" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1632" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="190" top="2494" right="290" bottom="2526"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="121" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1633" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="190" top="2554" right="290" bottom="2586"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="70" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1634" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="190" top="2624" right="290" bottom="2656"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="71" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1635" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="350" top="2434" right="450" bottom="2466"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1636" ActivityType="13" flags="0" name="USV1 off RL FR EV off">
<Rect left="740" top="1334" right="840" bottom="1366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x4E\x00\x00\x00\x34\x00\x00\x00\x00\x00\x3C\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1539" type="8" flags="97"/>
</Activity>
<Activity id="1637" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="2624" right="556" bottom="2656"/>
</Activity>
<Activity id="1638" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="1334" right="556" bottom="1366"/>
</Activity>
<Activity id="1639" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="2314" right="416" bottom="2346"/>
</Activity>
<Activity id="1640" ActivityType="13" flags="0" name="USV2 HSV2 and RR FL EV on">
<Rect left="740" top="1394" right="840" bottom="1426"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x28\x00\x50\xFF\xFF\x00\x54\x00\x00\xFF\xFF\x00\x38\xFF\xFF\x00\x30&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP1540" type="8" flags="97"/>
</Activity>
<Activity id="1641" ActivityType="13" flags="0" name="预增压RR">
<Rect left="740" top="1504" right="840" bottom="1536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x0E\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP1541" type="8" flags="97"/>
</Activity>
<Activity id="1642" ActivityType="3" flags="0" name="延时140ms">
<Rect left="740" top="1564" right="840" bottom="1596"/>
<Script>engine.Delay(500)


oldRevTel = ""</Script></Activity>
<Activity id="1643" ActivityType="13" flags="0" name="ESP增压RR">
<Rect left="950" top="1654" right="1050" bottom="1686"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x02\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1644" ActivityType="3" flags="0" name="变量初始化">
<Rect left="740" top="1444" right="840" bottom="1476"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1646" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="740" top="1834" right="840" bottom="1866"/>
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

</Script><assessment no="136" name="DEP2341" type="8" flags="97"/>
</Activity>
<Activity id="1647" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="740" top="1884" right="840" bottom="1916"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="20" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1648" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="740" top="1934" right="840" bottom="1966"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="21" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1649" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="740" top="1994" right="840" bottom="2026"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="22" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1650" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="740" top="2054" right="840" bottom="2086"/>
<Script>if(BrakeForce_RR &gt; 1600.0) then
        LoopBrake = 1
        engine.LastError = 1
elseif(BrakeForce_RR &lt; 800.0) then
	engine.LastError = 1
else
	LoopBrake = 1
        engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="23" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1651" ActivityType="3" flags="0" name="右后制动力不合格">
<Rect left="890" top="2054" right="990" bottom="2086"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("RR valve NOK time:"..ncount)</Script></Activity>
<Activity id="1652" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="1724" right="956" bottom="1756"/>
</Activity>
<Activity id="1653" ActivityType="13" flags="0" name="HSV2 off">
<Rect left="740" top="2114" right="840" bottom="2146"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="41" name="DEP895" type="8" flags="97"/>
</Activity>
<Activity id="1654" ActivityType="13" flags="0" name="泄压RR">
<Rect left="740" top="2174" right="840" bottom="2206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\xFF\xFF\x00\x3A\x00\x00\x00\x00\x00\x19\x00\x00\x00\x3A\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="37" name="DEP895" type="8" flags="97"/>
</Activity>
<Activity id="1655" ActivityType="3" flags="0" name="延时2秒">
<Rect left="740" top="2234" right="840" bottom="2266"/>
<Script>engine.Delay(2000)
oldRevTel = ""

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;

ncount = 0</Script></Activity>
<Activity id="1657" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="740" top="2354" right="840" bottom="2386"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1658" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="740" top="2414" right="840" bottom="2446"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="72" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1659" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="740" top="2474" right="840" bottom="2506"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="73" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1660" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="740" top="2534" right="840" bottom="2566"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="74" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1661" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="740" top="2604" right="840" bottom="2636"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="75" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1662" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="920" top="2414" right="1020" bottom="2446"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1663" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="2294" right="986" bottom="2326"/>
</Activity>
<Activity id="1664" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="2604" right="1136" bottom="2636"/>
</Activity>
<Activity id="1665" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="1334" right="1136" bottom="1366"/>
</Activity>
<Activity id="1666" ActivityType="13" flags="0" name="USV2 off">
<Rect left="1370" top="1334" right="1470" bottom="1366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x50\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="76" name="DEP1546" type="8" flags="97"/>
</Activity>
<Activity id="1667" ActivityType="13" flags="0" name="USV2 HSV2 on">
<Rect left="1370" top="1384" right="1470" bottom="1416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x28\x00\x50\xFF\xFF\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="77" name="DEP1547" type="8" flags="97"/>
</Activity>
<Activity id="1668" ActivityType="13" flags="0" name="预增压FL">
<Rect left="1370" top="1494" right="1470" bottom="1526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x0e\xFF\xFF\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="78" name="DEP1548" type="8" flags="97"/>
</Activity>
<Activity id="1669" ActivityType="3" flags="0" name="延时140ms">
<Rect left="1370" top="1544" right="1470" bottom="1576"/>
<Script>engine.Delay(500)

oldRevTel = ""</Script></Activity>
<Activity id="1670" ActivityType="13" flags="0" name="ESP增压FL">
<Rect left="1560" top="1644" right="1660" bottom="1676"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1671" ActivityType="3" flags="0" name="变量初始化">
<Rect left="1370" top="1434" right="1470" bottom="1466"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1673" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1370" top="1814" right="1470" bottom="1846"/>
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
</Script><assessment no="137" name="DEP2339" type="8" flags="97"/>
</Activity>
<Activity id="1674" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1370" top="1874" right="1470" bottom="1906"/>
<Script>if(BrakeForce_FL &gt; 2800.0) then
        LoopBrake = 1
        engine.LastError = 1
elseif(BrakeForce_FL &lt; 1600.0) then
	engine.LastError = 1
else
	LoopBrake = 1
        engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="80" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1675" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1370" top="1924" right="1470" bottom="1956"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="81" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1676" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1370" top="1974" right="1470" bottom="2006"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="82" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1677" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1370" top="2024" right="1470" bottom="2056"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="83" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1678" ActivityType="3" flags="0" name="左前制动力不合格">
<Rect left="1540" top="1874" right="1640" bottom="1906"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("FL valve NOK time:"..ncount)</Script></Activity>
<Activity id="1679" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="1704" right="1606" bottom="1736"/>
</Activity>
<Activity id="1680" ActivityType="13" flags="0" name="HSV2 off">
<Rect left="1370" top="2084" right="1470" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x54\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="84" name="DEP1546" type="8" flags="97"/>
</Activity>
<Activity id="1681" ActivityType="13" flags="0" name="泄压FL">
<Rect left="1370" top="2144" right="1470" bottom="2176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\xFF\xFF\x00\x32\x00\x00\x00\x00\x00\x19\x00\x00\x00\x32\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="85" name="DEP1550" type="8" flags="97"/>
</Activity>
<Activity id="1682" ActivityType="3" flags="0" name="延时2秒">
<Rect left="1370" top="2204" right="1470" bottom="2236"/>
<Script>engine.Delay(2000)
oldRevTel = ""

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;

ncount = 0</Script></Activity>
<Activity id="1684" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1370" top="2324" right="1470" bottom="2356"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1685" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1370" top="2394" right="1470" bottom="2426"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="86" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1686" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1370" top="2454" right="1470" bottom="2486"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="87" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1687" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1370" top="2524" right="1470" bottom="2556"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="88" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1688" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1370" top="2594" right="1470" bottom="2626"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="89" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1689" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="1540" top="2394" right="1640" bottom="2426"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1690" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="2264" right="1606" bottom="2296"/>
</Activity>
<Activity id="1691" ActivityType="4" flags="0" name="路由节点">
<Rect left="1714" top="2594" right="1746" bottom="2626"/>
</Activity>
<Activity id="1692" ActivityType="4" flags="0" name="路由节点">
<Rect left="1714" top="1344" right="1746" bottom="1376"/>
</Activity>
<Activity id="1694" ActivityType="13" flags="0" name="USV 2 RR FL EV off">
<Rect left="1930" top="1344" right="2030" bottom="1376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x50\x00\x00\x00\x38\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="90" name="DEP1551" type="8" flags="97"/>
</Activity>
<Activity id="1695" ActivityType="13" flags="0" name="USV1 HSV1 RL FR EV on">
<Rect left="1930" top="1394" right="2030" bottom="1426"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x28\x00\x4E\xFF\xFF\x00\x52\x00\x00\xFF\xFF\x00\x3C\xFF\xFF\x00\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="91" name="DEP1552" type="8" flags="97"/>
</Activity>
<Activity id="1696" ActivityType="3" flags="0" name="变量初始化">
<Rect left="1930" top="1444" right="2030" bottom="1476"/>
<Script>ncount = 0
LoopBrake = 0

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1697" ActivityType="13" flags="0" name="预增压FR">
<Rect left="1930" top="1504" right="2030" bottom="1536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x34\x00\x00\x00\x00\x00\x0e\xFF\xFF\x00\x34\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="92" name="DEP1553" type="8" flags="97"/>
</Activity>
<Activity id="1698" ActivityType="3" flags="0" name="延时140ms">
<Rect left="1930" top="1564" right="2030" bottom="1596"/>
<Script>engine.Delay(500)

oldRevTel = ""</Script></Activity>
<Activity id="1699" ActivityType="13" flags="0" name="ESP增压FR">
<Rect left="2270" top="1684" right="2370" bottom="1716"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x34\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x34\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1701" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1930" top="1834" right="2030" bottom="1866"/>
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
engine.StatValue = "BrakeForce_FR Cycle = "..tostring(tmpBrakeForce_FR)</Script><assessment no="138" name="DEP2340" type="8" flags="97"/>
</Activity>
<Activity id="1702" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1930" top="1894" right="2030" bottom="1926"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="130" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1703" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1930" top="1944" right="2030" bottom="1976"/>
<Script>if(BrakeForce_FR &gt; 2800.0) then
        LoopBrake = 1
        engine.LastError = 1
elseif(BrakeForce_FR &lt; 1600.0) then
	engine.LastError = 1
else
	LoopBrake = 1
        engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="131" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1704" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1930" top="1994" right="2030" bottom="2026"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="132" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1705" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1930" top="2044" right="2030" bottom="2076"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="133" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1706" ActivityType="3" flags="0" name="右前制动力不合格">
<Rect left="2070" top="1944" right="2170" bottom="1976"/>
<Script>ncount = ncount + 1
oldRevTel = curtRevTel

print("FR valve NOK time:"..ncount)</Script></Activity>
<Activity id="1707" ActivityType="4" flags="0" name="路由节点">
<Rect left="2104" top="1724" right="2136" bottom="1756"/>
</Activity>
<Activity id="1709" ActivityType="13" flags="0" name="泄压FR">
<Rect left="1930" top="2164" right="2030" bottom="2196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x00\xFF\xFF\x00\x36\x00\x19\x00\x00\x00\x36\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="99" name="DEP1555" type="8" flags="97"/>
</Activity>
<Activity id="1711" ActivityType="3" flags="0" name="延时2秒">
<Rect left="1930" top="2224" right="2030" bottom="2256"/>
<Script>engine.Delay(2000)
oldRevTel = ""

BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;

ncount = 0</Script></Activity>
<Activity id="1713" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1930" top="2334" right="2030" bottom="2366"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

</Script></Activity>
<Activity id="1714" ActivityType="3" flags="0" name="评估左前制动力">
<Rect left="1930" top="2404" right="2030" bottom="2436"/>
<Script>if(BrakeForce_FL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FL)</Script><assessment no="100" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1715" ActivityType="3" flags="0" name="评估右前制动力">
<Rect left="1930" top="2464" right="2030" bottom="2496"/>
<Script>if(BrakeForce_FR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_FR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_FR)</Script><assessment no="101" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1716" ActivityType="3" flags="0" name="评估左后制动力">
<Rect left="1930" top="2534" right="2030" bottom="2566"/>
<Script>if(BrakeForce_RL &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RL &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RL)</Script><assessment no="102" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1717" ActivityType="3" flags="0" name="评估右后制动力">
<Rect left="1930" top="2624" right="2030" bottom="2656"/>
<Script>if(BrakeForce_RR &gt; 200.0) then
	engine.LastError = 1
elseif(BrakeForce_RR &lt; -500.0) then
	engine.LastError = 1
else
	engine.LastError = 0
end

engine.StatValue = tostring(BrakeForce_RR)</Script><assessment no="103" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1718" ActivityType="3" flags="0" name="泄压不合格">
<Rect left="2120" top="2404" right="2220" bottom="2436"/>
<Script>engine.Delay(200)
oldRevTel = curtRevTel</Script></Activity>
<Activity id="1719" ActivityType="4" flags="0" name="路由节点">
<Rect left="2324" top="2624" right="2356" bottom="2656"/>
</Activity>
<Activity id="1720" ActivityType="4" flags="0" name="路由节点">
<Rect left="2154" top="2274" right="2186" bottom="2306"/>
</Activity>
<Activity id="1721" ActivityType="13" flags="0" name="USV1 off">
<Rect left="2290" top="2684" right="2390" bottom="2716"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x4E\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="104" name="DEP1556" type="8" flags="97"/>
</Activity>
<Activity id="1722" ActivityType="13" flags="0" name="All USV`s and HSV`s off">
<Rect left="2290" top="2744" right="2390" bottom="2776"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x4E\x00\x00\x00\x50\x00\x00\x00\x00\x00\x52\x00\x00\x00\x54&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="105" name="DEP1557" type="8" flags="97"/>
</Activity>
<Activity id="1723" ActivityType="3" flags="0" name="DlgMultiLineSet">
<Rect left="2290" top="2804" right="2390" bottom="2836"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(300)</Script></Activity>
<Activity id="1724" ActivityType="13" flags="0" name="All EV off">
<Rect left="2290" top="2864" right="2390" bottom="2896"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x34\x00\x00\x00\x00\x00\x38\x00\x00\x00\x3C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="106" name="DEP1558" type="8" flags="97"/>
</Activity>
<Activity id="1725" ActivityType="13" flags="0" name="All AV off">
<Rect left="2290" top="2924" right="2390" bottom="2956"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x32\x00\x00\x00\x36\x00\x00\x00\x00\x00\x3A\x00\x00\x00\x3E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="107" name="DEP1559" type="8" flags="97"/>
</Activity>
<Activity id="1726" ActivityType="13" flags="0" name="Pump motor off">
<Rect left="2290" top="3044" right="2390" bottom="3076"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xC8\x00\x00\x22\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="108" name="DEP1560" type="8" flags="97"/>
</Activity>
<Activity id="1727" ActivityType="3" flags="0" name="延时3秒">
<Rect left="2290" top="2984" right="2390" bottom="3016"/>
<Script>engine.Delay(3000)</Script></Activity>
<Activity id="1728" ActivityType="13" flags="0" name="HSV1 off">
<Rect left="1930" top="2094" right="2030" bottom="2126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="98" name="DEP1537" type="8" flags="97"/>
</Activity>
<Activity id="1729" ActivityType="13" flags="0" name="All EV off">
<Rect left="2290" top="3184" right="2390" bottom="3216"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x34\x00\x00\x00\x00\x00\x38\x00\x00\x00\x3C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="109" name="DEP1558" type="8" flags="97"/>
</Activity>
<Activity id="1730" ActivityType="13" flags="0" name="All AV off">
<Rect left="2290" top="3244" right="2390" bottom="3276"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x32\x00\x00\x00\x36\x00\x00\x00\x00\x00\x3A\x00\x00\x00\x3E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="110" name="DEP1559" type="8" flags="97"/>
</Activity>
<Activity id="1731" ActivityType="13" flags="0" name="Pump motor off">
<Rect left="2290" top="3304" right="2390" bottom="3336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xC8\x00\x00\x22\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="111" name="DEP1560" type="8" flags="97"/>
</Activity>
<Activity id="1732" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="2290" top="3534" right="2390" bottom="3566"/>
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
<Activity id="1733" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="2290" top="3464" right="2390" bottom="3496"/>
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
<Activity id="1734" ActivityType="3" flags="0" name="IDT错误">
<Rect left="2430" top="3464" right="2530" bottom="3496"/>
<Script>isOK = false
engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
</Script><assessment no="119" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="1737" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2290" top="3794" right="2390" bottom="3826"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1738" ActivityType="3" flags="0" name="获取制动力">
<Rect left="190" top="1764" right="290" bottom="1796"/>
<Script>engine.Delay(250)

local curtRevTelHex = ""

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
<Activity id="1739" ActivityType="3" flags="0" name="获取制动力">
<Rect left="740" top="1774" right="840" bottom="1806"/>
<Script>engine.Delay(250)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1740" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="1754" right="1470" bottom="1786"/>
<Script>engine.Delay(300)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1741" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1930" top="1774" right="2030" bottom="1806"/>
<Script>engine.Delay(300)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1742" ActivityType="3" flags="0" name="获取制动力">
<Rect left="190" top="2314" right="290" bottom="2346"/>
<Script>engine.Delay(100)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1743" ActivityType="3" flags="0" name="获取制动力">
<Rect left="740" top="2294" right="840" bottom="2326"/>
<Script>engine.Delay(100)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1744" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="2264" right="1470" bottom="2296"/>
<Script>engine.Delay(100)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1745" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1930" top="2274" right="2030" bottom="2306"/>
<Script>engine.Delay(100)

curtRevTel = ""
local curtRevTelHex = ""

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
<Activity id="1746" ActivityType="3" flags="0" name="延时4秒">
<Rect left="2290" top="3124" right="2390" bottom="3156"/>
<Script>engine.Delay(4000)</Script></Activity>
<Activity id="1747" ActivityType="3" flags="0" name="获取制动力">
<Rect left="190" top="1604" right="290" bottom="1636"/>
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
<Activity id="1748" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="190" top="1654" right="290" bottom="1686"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1749" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="1654" right="126" bottom="1686"/>
</Activity>
<Activity id="1750" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="1874" right="126" bottom="1906"/>
</Activity>
<Activity id="1751" ActivityType="3" flags="0" name="获取制动力">
<Rect left="740" top="1614" right="840" bottom="1646"/>
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
<Activity id="1752" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="740" top="1664" right="840" bottom="1696"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1753" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1664" right="676" bottom="1696"/>
</Activity>
<Activity id="1754" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1884" right="676" bottom="1916"/>
</Activity>
<Activity id="1755" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="1654" right="1286" bottom="1686"/>
</Activity>
<Activity id="1756" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="1874" right="1286" bottom="1906"/>
</Activity>
<Activity id="1757" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1370" top="1594" right="1470" bottom="1626"/>
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
<Activity id="1758" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1370" top="1654" right="1470" bottom="1686"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1759" ActivityType="4" flags="0" name="路由节点">
<Rect left="1824" top="1674" right="1856" bottom="1706"/>
</Activity>
<Activity id="1760" ActivityType="4" flags="0" name="路由节点">
<Rect left="1824" top="1894" right="1856" bottom="1926"/>
</Activity>
<Activity id="1761" ActivityType="3" flags="0" name="获取制动力">
<Rect left="1930" top="1614" right="2030" bottom="1646"/>
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
<Activity id="1762" ActivityType="3" flags="0" name="去掉阻滞力">
<Rect left="1930" top="1674" right="2030" bottom="1706"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

print("140msBrakeForce_FL:"..BrakeForce_FL)
print("140msBrakeForce_FR:"..BrakeForce_FR)
print("140msBrakeForce_RL:"..BrakeForce_RL)
print("140msBrakeForce_RR:"..BrakeForce_RR)</Script></Activity>
<Activity id="1763" ActivityType="13" flags="0" name="ESP增压RR">
<Rect left="740" top="1724" right="840" bottom="1756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x05\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1764" ActivityType="13" flags="0" name="ESP增压FL">
<Rect left="1370" top="1704" right="1470" bottom="1736"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1765" ActivityType="13" flags="0" name="ESP增压FR">
<Rect left="1930" top="1724" right="2030" bottom="1756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x34\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x34\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1766" ActivityType="3" flags="0" name="左后最终不合格">
<Rect left="340" top="2064" right="440" bottom="2096"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1767" ActivityType="3" flags="0" name="右后最终不合格">
<Rect left="890" top="2114" right="990" bottom="2146"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1768" ActivityType="3" flags="0" name="左前最终不合格">
<Rect left="1540" top="1924" right="1640" bottom="1956"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1769" ActivityType="3" flags="0" name="右前最终不合格">
<Rect left="2070" top="1994" right="2170" bottom="2026"/>
<Script>repeatAction = true</Script></Activity>
<Activity id="1772" ActivityType="3" flags="0" name="重做">
<Rect left="2610" top="3534" right="2710" bottom="3566"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="阀门检测不合格"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="是否重做？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>repeatAction  = false
#PRESSBUTTON</Script></Activity>
<Activity id="1773" ActivityType="4" flags="0" name="路由节点">
<Rect left="2644" top="1004" right="2676" bottom="1036"/>
</Activity>
<Activity id="1774" ActivityType="13" flags="0" name="激活速度限制和阀组继电器关闭">
<Rect left="2290" top="3594" right="2390" bottom="3626"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xFF\xA0\x03\x00\x00\x00\x00\x00\x60\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP2229" type="8" flags="97"/>
</Activity>
<Activity id="1775" ActivityType="13" flags="0" name="ESP增压RR-原">
<Rect left="610" top="1724" right="710" bottom="1756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1590" type="0">
</Transition>
<Transition StartId="642" EndId="643" type="0">
</Transition>
<Transition StartId="643" EndId="1269" type="3">
</Transition>
<Transition StartId="644" EndId="1270" type="0">
</Transition>
<Transition StartId="1269" EndId="1273" type="0">
</Transition>
<Transition StartId="1270" EndId="1271" type="0">
</Transition>
<Transition StartId="1271" EndId="1272" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1271" EndId="1276" type="0">
</Transition>
<Transition StartId="1272" EndId="1273" type="0">
</Transition>
<Transition StartId="1273" EndId="644" type="0">
</Transition>
<Transition StartId="1276" EndId="1282" type="0">
</Transition>
<Transition StartId="1278" EndId="1279" type="0">
</Transition>
<Transition StartId="1279" EndId="1280" type="0">
</Transition>
<Transition StartId="1280" EndId="1281" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1280" EndId="1283" type="0">
</Transition>
<Transition StartId="1281" EndId="1282" type="0">
</Transition>
<Transition StartId="1282" EndId="1278" type="0">
</Transition>
<Transition StartId="1283" EndId="1582" type="0">
</Transition>
<Transition StartId="1285" EndId="1585" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="1285" EndId="1584" type="0">
</Transition>
<Transition StartId="1291" EndId="1292" type="0">
</Transition>
<Transition StartId="1292" EndId="1602" type="0">
</Transition>
<Transition StartId="1557" EndId="1558" type="0">
</Transition>
<Transition StartId="1582" EndId="1587" type="0">
</Transition>
<Transition StartId="1582" EndId="1285" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1585" EndId="1291" type="0">
</Transition>
<Transition StartId="1590" EndId="642" type="0">
</Transition>
<Transition StartId="1602" EndId="1603" type="0">
</Transition>
<Transition StartId="1603" EndId="1604" type="0">
</Transition>
<Transition StartId="1604" EndId="1626" type="0">
</Transition>
<Transition StartId="1605" EndId="1747" type="0">
</Transition>
<Transition StartId="1608" EndId="1738" type="0">
</Transition>
<Transition StartId="1610" EndId="1611" type="0">
</Transition>
<Transition StartId="1611" EndId="1612" type="0">
</Transition>
<Transition StartId="1612" EndId="1613" type="0">
</Transition>
<Transition StartId="1613" EndId="1614" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1613" EndId="1615" type="0">
</Transition>
<Transition StartId="1613" EndId="1766" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1614" EndId="1620" type="0">
</Transition>
<Transition StartId="1615" EndId="1616" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1615" EndId="1766" type="0">
</Transition>
<Transition StartId="1616" EndId="1608" type="0">
</Transition>
<Transition StartId="1620" EndId="1622" type="0">
</Transition>
<Transition StartId="1622" EndId="1623" type="0">
</Transition>
<Transition StartId="1623" EndId="1742" type="0">
</Transition>
<Transition StartId="1624" EndId="1631" type="0">
</Transition>
<Transition StartId="1626" EndId="1605" type="0">
</Transition>
<Transition StartId="1631" EndId="1632" type="3">
</Transition>
<Transition StartId="1631" EndId="1635" type="0">
</Transition>
<Transition StartId="1632" EndId="1633" type="3">
</Transition>
<Transition StartId="1632" EndId="1635" type="0">
</Transition>
<Transition StartId="1633" EndId="1634" type="3">
</Transition>
<Transition StartId="1633" EndId="1635" type="0">
</Transition>
<Transition StartId="1634" EndId="1635" type="0">
</Transition>
<Transition StartId="1634" EndId="1637" type="3">
</Transition>
<Transition StartId="1635" EndId="1639" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1635" EndId="1637" type="0">
</Transition>
<Transition StartId="1636" EndId="1640" type="0">
</Transition>
<Transition StartId="1637" EndId="1638" type="0">
</Transition>
<Transition StartId="1638" EndId="1636" type="0">
</Transition>
<Transition StartId="1639" EndId="1742" type="0">
</Transition>
<Transition StartId="1640" EndId="1644" type="0">
</Transition>
<Transition StartId="1641" EndId="1642" type="0">
</Transition>
<Transition StartId="1642" EndId="1751" type="0">
</Transition>
<Transition StartId="1644" EndId="1641" type="0">
</Transition>
<Transition StartId="1646" EndId="1647" type="0">
</Transition>
<Transition StartId="1647" EndId="1648" type="0">
</Transition>
<Transition StartId="1648" EndId="1649" type="0">
</Transition>
<Transition StartId="1649" EndId="1650" type="0">
</Transition>
<Transition StartId="1650" EndId="1653" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1650" EndId="1651" type="0">
</Transition>
<Transition StartId="1650" EndId="1767" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1651" EndId="1652" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1651" EndId="1767" type="0">
</Transition>
<Transition StartId="1652" EndId="1763" type="0">
</Transition>
<Transition StartId="1653" EndId="1654" type="0">
</Transition>
<Transition StartId="1654" EndId="1655" type="0">
</Transition>
<Transition StartId="1655" EndId="1743" type="0">
</Transition>
<Transition StartId="1657" EndId="1658" type="0">
</Transition>
<Transition StartId="1658" EndId="1659" type="3">
</Transition>
<Transition StartId="1658" EndId="1662" type="0">
</Transition>
<Transition StartId="1659" EndId="1660" type="3">
</Transition>
<Transition StartId="1659" EndId="1662" type="0">
</Transition>
<Transition StartId="1660" EndId="1661" type="3">
</Transition>
<Transition StartId="1660" EndId="1662" type="0">
</Transition>
<Transition StartId="1661" EndId="1662" type="0">
</Transition>
<Transition StartId="1661" EndId="1664" type="3">
</Transition>
<Transition StartId="1662" EndId="1663" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1662" EndId="1664" type="0">
</Transition>
<Transition StartId="1663" EndId="1743" type="0">
</Transition>
<Transition StartId="1664" EndId="1665" type="0">
</Transition>
<Transition StartId="1665" EndId="1666" type="0">
</Transition>
<Transition StartId="1666" EndId="1667" type="0">
</Transition>
<Transition StartId="1667" EndId="1671" type="0">
</Transition>
<Transition StartId="1668" EndId="1669" type="0">
</Transition>
<Transition StartId="1669" EndId="1757" type="0">
</Transition>
<Transition StartId="1671" EndId="1668" type="0">
</Transition>
<Transition StartId="1673" EndId="1674" type="0">
</Transition>
<Transition StartId="1674" EndId="1675" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1674" EndId="1678" type="0">
</Transition>
<Transition StartId="1674" EndId="1768" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1675" EndId="1676" type="0">
</Transition>
<Transition StartId="1676" EndId="1677" type="0">
</Transition>
<Transition StartId="1677" EndId="1680" type="0">
</Transition>
<Transition StartId="1678" EndId="1768" type="0">
</Transition>
<Transition StartId="1678" EndId="1679" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1679" EndId="1764" type="0">
</Transition>
<Transition StartId="1680" EndId="1681" type="0">
</Transition>
<Transition StartId="1681" EndId="1682" type="0">
</Transition>
<Transition StartId="1682" EndId="1744" type="0">
</Transition>
<Transition StartId="1684" EndId="1685" type="0">
</Transition>
<Transition StartId="1685" EndId="1686" type="3">
</Transition>
<Transition StartId="1685" EndId="1689" type="0">
</Transition>
<Transition StartId="1686" EndId="1687" type="3">
</Transition>
<Transition StartId="1686" EndId="1689" type="0">
</Transition>
<Transition StartId="1687" EndId="1688" type="3">
</Transition>
<Transition StartId="1687" EndId="1689" type="0">
</Transition>
<Transition StartId="1688" EndId="1689" type="0">
</Transition>
<Transition StartId="1688" EndId="1691" type="3">
</Transition>
<Transition StartId="1689" EndId="1690" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1689" EndId="1691" type="0">
</Transition>
<Transition StartId="1690" EndId="1744" type="0">
</Transition>
<Transition StartId="1691" EndId="1692" type="0">
</Transition>
<Transition StartId="1692" EndId="1694" type="0">
</Transition>
<Transition StartId="1694" EndId="1695" type="0">
</Transition>
<Transition StartId="1695" EndId="1696" type="0">
</Transition>
<Transition StartId="1696" EndId="1697" type="0">
</Transition>
<Transition StartId="1697" EndId="1698" type="0">
</Transition>
<Transition StartId="1698" EndId="1761" type="0">
</Transition>
<Transition StartId="1701" EndId="1702" type="0">
</Transition>
<Transition StartId="1702" EndId="1703" type="0">
</Transition>
<Transition StartId="1703" EndId="1704" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 0</Expression></Transition>
<Transition StartId="1703" EndId="1706" type="0">
</Transition>
<Transition StartId="1703" EndId="1769" type="1">
<Expression>LoopBrake == 1 and engine.LastError == 1</Expression></Transition>
<Transition StartId="1704" EndId="1705" type="0">
</Transition>
<Transition StartId="1705" EndId="1728" type="0">
</Transition>
<Transition StartId="1706" EndId="1769" type="0">
</Transition>
<Transition StartId="1706" EndId="1707" type="1">
<Expression>ncount &lt; 6</Expression></Transition>
<Transition StartId="1707" EndId="1765" type="0">
</Transition>
<Transition StartId="1709" EndId="1711" type="0">
</Transition>
<Transition StartId="1711" EndId="1745" type="0">
</Transition>
<Transition StartId="1713" EndId="1714" type="0">
</Transition>
<Transition StartId="1714" EndId="1715" type="3">
</Transition>
<Transition StartId="1714" EndId="1718" type="0">
</Transition>
<Transition StartId="1715" EndId="1716" type="3">
</Transition>
<Transition StartId="1715" EndId="1718" type="0">
</Transition>
<Transition StartId="1716" EndId="1717" type="3">
</Transition>
<Transition StartId="1716" EndId="1718" type="0">
</Transition>
<Transition StartId="1717" EndId="1718" type="0">
</Transition>
<Transition StartId="1717" EndId="1719" type="3">
</Transition>
<Transition StartId="1718" EndId="1719" type="0">
</Transition>
<Transition StartId="1718" EndId="1720" type="1">
<Expression>ncount &lt; 10</Expression></Transition>
<Transition StartId="1719" EndId="1721" type="0">
</Transition>
<Transition StartId="1720" EndId="1745" type="0">
</Transition>
<Transition StartId="1721" EndId="1722" type="0">
</Transition>
<Transition StartId="1722" EndId="1723" type="0">
</Transition>
<Transition StartId="1723" EndId="1724" type="0">
</Transition>
<Transition StartId="1724" EndId="1725" type="0">
</Transition>
<Transition StartId="1725" EndId="1727" type="0">
</Transition>
<Transition StartId="1726" EndId="1746" type="0">
</Transition>
<Transition StartId="1727" EndId="1726" type="0">
</Transition>
<Transition StartId="1728" EndId="1709" type="0">
</Transition>
<Transition StartId="1729" EndId="1730" type="0">
</Transition>
<Transition StartId="1730" EndId="1731" type="0">
</Transition>
<Transition StartId="1731" EndId="1733" type="0">
</Transition>
<Transition StartId="1732" EndId="1774" type="0">
</Transition>
<Transition StartId="1732" EndId="1772" type="1">
<Expression>repeatAction == true</Expression></Transition>
<Transition StartId="1733" EndId="1732" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1733" EndId="1734" type="0">
</Transition>
<Transition StartId="1737" EndId="2" type="0">
</Transition>
<Transition StartId="1738" EndId="1610" type="0">
</Transition>
<Transition StartId="1739" EndId="1646" type="0">
</Transition>
<Transition StartId="1740" EndId="1673" type="0">
</Transition>
<Transition StartId="1741" EndId="1701" type="0">
</Transition>
<Transition StartId="1742" EndId="1624" type="0">
</Transition>
<Transition StartId="1743" EndId="1657" type="0">
</Transition>
<Transition StartId="1744" EndId="1684" type="0">
</Transition>
<Transition StartId="1745" EndId="1713" type="0">
</Transition>
<Transition StartId="1746" EndId="1729" type="0">
</Transition>
<Transition StartId="1747" EndId="1748" type="0">
</Transition>
<Transition StartId="1748" EndId="1749" type="0">
</Transition>
<Transition StartId="1749" EndId="1750" type="0">
</Transition>
<Transition StartId="1750" EndId="1611" type="0">
</Transition>
<Transition StartId="1751" EndId="1752" type="0">
</Transition>
<Transition StartId="1752" EndId="1753" type="0">
</Transition>
<Transition StartId="1753" EndId="1754" type="0">
</Transition>
<Transition StartId="1754" EndId="1647" type="0">
</Transition>
<Transition StartId="1755" EndId="1756" type="0">
</Transition>
<Transition StartId="1756" EndId="1674" type="0">
</Transition>
<Transition StartId="1757" EndId="1758" type="0">
</Transition>
<Transition StartId="1758" EndId="1755" type="0">
</Transition>
<Transition StartId="1759" EndId="1760" type="0">
</Transition>
<Transition StartId="1760" EndId="1702" type="0">
</Transition>
<Transition StartId="1761" EndId="1762" type="0">
</Transition>
<Transition StartId="1762" EndId="1759" type="0">
</Transition>
<Transition StartId="1763" EndId="1739" type="0">
</Transition>
<Transition StartId="1764" EndId="1740" type="0">
</Transition>
<Transition StartId="1765" EndId="1741" type="0">
</Transition>
<Transition StartId="1766" EndId="1614" type="0">
</Transition>
<Transition StartId="1767" EndId="1653" type="0">
</Transition>
<Transition StartId="1768" EndId="1675" type="0">
</Transition>
<Transition StartId="1769" EndId="1704" type="0">
</Transition>
<Transition StartId="1772" EndId="1773" type="0">
</Transition>
<Transition StartId="1772" EndId="1774" type="5">
</Transition>
<Transition StartId="1773" EndId="1582" type="0">
</Transition>
<Transition StartId="1774" EndId="1737" type="0">
</Transition>
</Transitions>
</Process>

