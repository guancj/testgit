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
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="2700" top="3754" right="2800" bottom="3786"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="124" right="290" bottom="156"/>
<TitleText Enable="1" Text="ESP阀门检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("##### ROL ABS/ESP Valve Test")
PruefungIO = 0;</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="2150" top="3374" right="2250" bottom="3406"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="FR">
<Rect left="2150" top="2154" right="2250" bottom="2186"/>
<Script>BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="Druckaufbau">
<Rect left="2150" top="2224" right="2250" bottom="2256"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;
DFlag_Soll = 0;
DTime_Ventilpruefung = DTime_Ventilpruefung_Start;
engine.println("####DTime_Ventilpruefung####"..tostring(DTime_Ventilpruefung));</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="Pruefung">
<Rect left="2150" top="2564" right="2250" bottom="2596"/>
<Script></Script></Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="2184" top="2644" right="2216" bottom="2676"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="2150" top="2704" right="2250" bottom="2736"/>
<Script>engine.Delay(40);</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="2150" top="3224" right="2250" bottom="3256"/>
<Script>engine.println("##### ToleranceTest Druckaufbau FR (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
--DFloat = DTime_Ventilpruefung;
--DFloat = DFloat*0.5;
DCounter = DCounter+1;
engine.Delay(90);</Script></Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="2444" top="3224" right="2476" bottom="3256"/>
</Activity>
<Activity id="47" ActivityType="4" flags="0" name="路由节点">
<Rect left="2444" top="2564" right="2476" bottom="2596"/>
</Activity>
<Activity id="48" ActivityType="4" flags="0" name="路由节点">
<Rect left="2094" top="2704" right="2126" bottom="2736"/>
</Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="2094" top="3234" right="2126" bottom="3266"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="Druckabbau">
<Rect left="2150" top="3444" right="2250" bottom="3476"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="MsWait">
<Rect left="2150" top="3594" right="2250" bottom="3626"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="Pruefung">
<Rect left="2150" top="3674" right="2250" bottom="3706"/>
<Script></Script></Activity>
<Activity id="55" ActivityType="4" flags="0" name="路由节点">
<Rect left="2184" top="3754" right="2216" bottom="3786"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="2150" top="3814" right="2250" bottom="3846"/>
<Script></Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="2150" top="4334" right="2250" bottom="4366"/>
<Script>engine.println("##### ToleranceTest Druckaufbau FR (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
--DFloat = DTime_Ventilpruefung;
--DFloat = DFloat*0.5;
DCounter = DCounter+1;
engine.Delay(50);</Script></Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="2444" top="4334" right="2476" bottom="4366"/>
</Activity>
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="2444" top="3674" right="2476" bottom="3706"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="2150" top="4414" right="2250" bottom="4446"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="71" ActivityType="4" flags="0" name="路由节点">
<Rect left="2094" top="3824" right="2126" bottom="3856"/>
</Activity>
<Activity id="72" ActivityType="4" flags="0" name="路由节点">
<Rect left="2094" top="4344" right="2126" bottom="4376"/>
</Activity>
<Activity id="120" ActivityType="4" flags="0" name="路由节点">
<Rect left="2564" top="4414" right="2596" bottom="4446"/>
</Activity>
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="2564" top="2154" right="2596" bottom="2186"/>
</Activity>
<Activity id="220" ActivityType="3" flags="0" name="DlgMultiLineSet">
<Rect left="2700" top="2294" right="2800" bottom="2326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="低压存储器的清空"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(300)</Script></Activity>
<Activity id="234" ActivityType="3" flags="0" name="ValveActivationTime">
<Rect left="2700" top="3044" right="2800" bottom="3076"/>
<Script>DTimeF = os.clock() - DTimeF;
engine.println("##### 2. mal alle Ventile und Aktuatoren AUS")</Script></Activity>
<Activity id="235" ActivityType="13" flags="0" name="FloatToleranceCheck">
<Rect left="2700" top="3124" right="2800" bottom="3156"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="DTimeF"/>
<Parameter id="Utg" value="0.0"/>
<Parameter id="Otg" value="90.0"/>
</Parameters>
</FunctionRef>
<assessment no="112" name="DEP1561" type="8" flags="97"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="TestResult_IntValueComparison">
<Rect left="2700" top="3204" right="2800" bottom="3236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>if( PruefungIO == 8 ) then 
	engine.LastError = 0;
        engine.StatValue="PruefungIO"..tostring(PruefungIO)
        engine.DialogBackColor ="green";
        engine.SetTitleText("电子稳定程序测试合格");
elseif (PruefungIO == -1) then
	engine.LastError = 1;
        engine.StatValue="PruefungIO"..tostring(PruefungIO)
        engine.DialogBackColor ="red";
        engine.SetTitleText("无 ABS/ESP测试"); 
else
	engine.LastError = 1;
        engine.StatValue="PruefungIO"..tostring(PruefungIO)
        engine.DialogBackColor ="red";
        engine.SetTitleText("电子稳定程序测试不合格"); 
end;
</Script><assessment no="113" name="DEP1562" type="8" flags="97"/>
</Activity>
<Activity id="238" ActivityType="3" flags="0" name="StoppingVehicle">
<Rect left="2700" top="3284" right="2800" bottom="3316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车辆停止"/>
<Line3Text Enable="1" Text="踩刹车直到停车"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.println("##### Stopping vehicle")
engine.Delay(1000)
 engine.DialogBackColor =-1;</Script></Activity>
<Activity id="240" ActivityType="3" flags="0" name="DTC_Read_Delete">
<Rect left="3010" top="3664" right="3110" bottom="3696"/>
<TitleText Enable="1" Text="读取/显示ABS故障存储器"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor =-1;</Script></Activity>
<Activity id="640" ActivityType="3" flags="0" name="挂N档">
<Rect left="510" top="164" right="610" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请挂空档"/>
<Line3Text Enable="1" Text="然后按确定"/>
<Line4Text Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(2,"#L=" .. "可以吗" .. "#R=BMPEYE");
#PRESSBUTTON</Script></Activity>
<Activity id="641" ActivityType="3" flags="0" name="测量块完整">
<Rect left="190" top="174" right="290" bottom="206"/>
<Script>engine.LastError = 1
engine.StatValue = "Test block incomplete"</Script></Activity>
<Activity id="642" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="190" top="284" right="290" bottom="316"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="643" ActivityType="13" flags="0" name="扩展会话">
<Rect left="190" top="344" right="290" bottom="376"/>
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
<Activity id="644" ActivityType="3" flags="0" name="释放制动踏板开关">
<Rect left="190" top="524" right="290" bottom="556"/>
<Script>DVciResult = string.sub(DVciResult1,5,5);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 制动开关 FD01 ##"..DVciResult);</Script></Activity>
<Activity id="1269" ActivityType="3" flags="0" name="InitTest">
<Rect left="190" top="404" right="290" bottom="436"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1270" ActivityType="13" flags="0" name="释放踏板状态比对">
<Rect left="190" top="584" right="290" bottom="616"/>
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
<Rect left="190" top="644" right="290" bottom="676"/>
<Script></Script></Activity>
<Activity id="1272" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="564" right="366" bottom="596"/>
</Activity>
<Activity id="1273" ActivityType="13" flags="0" name="制动开关">
<Rect left="190" top="464" right="290" bottom="496"/>
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
<Rect left="190" top="704" right="290" bottom="736"/>
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
<Rect left="190" top="824" right="290" bottom="856"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 FD02 ##"..DVciResult);</Script></Activity>
<Activity id="1279" ActivityType="13" flags="0" name="Status_Check_view_String">
<Rect left="190" top="884" right="290" bottom="916"/>
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
<Rect left="190" top="944" right="290" bottom="976"/>
<Script></Script></Activity>
<Activity id="1281" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="874" right="376" bottom="906"/>
</Activity>
<Activity id="1282" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="190" top="764" right="290" bottom="796"/>
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
<Rect left="190" top="1004" right="290" bottom="1036"/>
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
<Rect left="190" top="1134" right="290" bottom="1166"/>
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
<Activity id="1287" ActivityType="3" flags="0" name="阻滞力检测">
<Rect left="950" top="1504" right="1050" bottom="1536"/>
<Script>DragForceSum_FL = DragForceSum_FL + math.abs(DragForce_FL);
DragForceSum_FR = DragForceSum_FR + math.abs(DragForce_FR);
DragForceSum_RL = DragForceSum_RL + math.abs(DragForce_RL);
DragForceSum_RR = DragForceSum_RR + math.abs(DragForce_RR);
count = count + 1;
engine.println("##### BaseForce : " .. DragForce_FL .. " / " .. DragForce_FR .. " / " .. DragForce_RL .. " / " .. DragForce_RR .."\n");</Script></Activity>
<Activity id="1288" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="1504" right="1166" bottom="1536"/>
</Activity>
<Activity id="1289" ActivityType="13" flags="0" name="获取阻滞力">
<Rect left="950" top="1424" right="1050" bottom="1456"/>
<TitleText Enable="1" Text="基础阻滞力"/>
<Line1Text Enable="1" Text="左前：&amp;DragForce_FL N"/>
<Line2Text Enable="1" Text="右前：&amp;DragForce_FR N"/>
<Line3Text Enable="1" Text="左后：&amp;DragForce_RL N"/>
<Line4Text Enable="1" Text="右后：&amp;DragForce_RR N"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="DragForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="DragForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="DragForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="DragForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceHand"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceFoot"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1290" ActivityType="3" flags="0" name="求平均值">
<Rect left="950" top="1584" right="1050" bottom="1616"/>
<Script>DragForce_FL = DragForceSum_FL / 10;
DragForce_FR = DragForceSum_FR / 10;
DragForce_RL = DragForceSum_RL / 10;
DragForce_RR = DragForceSum_RR / 10;


engine.println("##### DragForce_FL : " .. DragForce_FL .. "\n");
engine.println("##### DragForce_FR : " .. DragForce_FR .. "\n");
engine.println("##### DragForce_RL : " .. DragForce_RL .. "\n");
engine.println("##### DragForce_RR : " .. DragForce_RR .. "\n");</Script></Activity>
<Activity id="1291" ActivityType="3" flags="0" name="Read_Time">
<Rect left="190" top="1254" right="290" bottom="1286"/>
<Script>engine.DialogBackColor = -1;
--DFlag_Ventilpruefung_aktiv = 1;
DTimeF = os.clock();</Script></Activity>
<Activity id="1292" ActivityType="3" flags="0" name="ValveTest">
<Rect left="190" top="1304" right="290" bottom="1336"/>
<TitleText Enable="1" Text="ESP 测试"/>
<Script>VAufbauMin = 500.0;
HAufbauMin = 400.0;
VHAbbauMax = 200.0;
--DTime_Ventilpruefung_Start = 1;
DTime_Ventilpruefung_Start = 1;
engine.println("##### ESP VALVE")</Script></Activity>
<Activity id="1294" ActivityType="13" flags="0" name="Pump motor on">
<Rect left="190" top="1354" right="290" bottom="1386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\xFF\xFF\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="8" name="DEP1531" type="8" flags="97"/>
</Activity>
<Activity id="1306" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="190" top="3364" right="290" bottom="3396"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1307" ActivityType="3" flags="0" name="RL">
<Rect left="190" top="2154" right="290" bottom="2186"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1308" ActivityType="3" flags="0" name="Druckaufbau">
<Rect left="190" top="2234" right="290" bottom="2266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;
DFlag_Soll = 0;
--DTime_Ventilpruefung = DTime_Ventilpruefung_Start;
--engine.println("####DTime_Ventilpruefung####"..tostring(DTime_Ventilpruefung));</Script></Activity>
<Activity id="1311" ActivityType="3" flags="0" name="Pruefung">
<Rect left="190" top="2554" right="290" bottom="2586"/>
<Script></Script></Activity>
<Activity id="1313" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="2614" right="256" bottom="2646"/>
</Activity>
<Activity id="1314" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="190" top="2694" right="290" bottom="2726"/>
<Script></Script></Activity>
<Activity id="1316" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="190" top="2844" right="290" bottom="2876"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;


DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1317" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="190" top="2924" right="290" bottom="2956"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1318" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="2924" right="440" bottom="2956"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1319" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="190" top="3004" right="290" bottom="3036"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1320" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="3004" right="440" bottom="3036"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1321" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="190" top="3074" right="290" bottom="3106"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="800.0"/>
<Parameter id="Otg" value="2400.0"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1322" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="3074" right="440" bottom="3106"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1323" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="190" top="3144" right="290" bottom="3176"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1324" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="3144" right="440" bottom="3176"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1325" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="190" top="3214" right="290" bottom="3246"/>
<Script>engine.println("##### ToleranceTest Druckaufbau RL (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
DCounter = DCounter+1;
engine.Delay(130);</Script></Activity>
<Activity id="1326" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="3214" right="626" bottom="3246"/>
</Activity>
<Activity id="1327" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="2554" right="626" bottom="2586"/>
</Activity>
<Activity id="1328" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="2694" right="116" bottom="2726"/>
</Activity>
<Activity id="1329" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="3204" right="116" bottom="3236"/>
</Activity>
<Activity id="1330" ActivityType="3" flags="0" name="Druckabbau">
<Rect left="190" top="3434" right="290" bottom="3466"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1332" ActivityType="3" flags="0" name="MsWait">
<Rect left="190" top="3584" right="290" bottom="3616"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="1333" ActivityType="3" flags="0" name="Pruefung">
<Rect left="190" top="3664" right="290" bottom="3696"/>
<Script></Script></Activity>
<Activity id="1334" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="3744" right="256" bottom="3776"/>
</Activity>
<Activity id="1335" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="190" top="3804" right="290" bottom="3836"/>
<Script></Script></Activity>
<Activity id="1337" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="190" top="3954" right="290" bottom="3986"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1346" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="190" top="4324" right="290" bottom="4356"/>
<Script>engine.println("##### ToleranceTest Druckaufbau RL (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
--DFloat = DTime_Ventilpruefung;
--DFloat = DFloat*0.5;
DCounter = DCounter+1;
engine.Delay(50);</Script></Activity>
<Activity id="1347" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="4324" right="626" bottom="4356"/>
</Activity>
<Activity id="1348" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="3664" right="626" bottom="3696"/>
</Activity>
<Activity id="1349" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="190" top="4404" right="290" bottom="4436"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1350" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="3804" right="156" bottom="3836"/>
</Activity>
<Activity id="1351" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="4324" right="156" bottom="4356"/>
</Activity>
<Activity id="1352" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="4404" right="776" bottom="4436"/>
</Activity>
<Activity id="1353" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="2154" right="776" bottom="2186"/>
</Activity>
<Activity id="1354" ActivityType="13" flags="0" name="预增压RL">
<Rect left="190" top="2414" right="290" bottom="2446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x0e\xFF\xFF\x00\x3C\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1532" type="8" flags="97"/>
</Activity>
<Activity id="1355" ActivityType="13" flags="0" name="增压RL">
<Rect left="430" top="2834" right="530" bottom="2866"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x02\xFF\xFF\x00\x3C\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1356" ActivityType="13" flags="0" name="获取制动力">
<Rect left="190" top="2774" right="290" bottom="2806"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1359" ActivityType="13" flags="0" name="HSV1 off">
<Rect left="190" top="3294" right="290" bottom="3326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x00\x00\x00\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP1537" type="8" flags="97"/>
</Activity>
<Activity id="1360" ActivityType="13" flags="0" name="泄压RL">
<Rect left="190" top="3504" right="290" bottom="3536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\xFF\xFF\x00\x3E\x00\x00\x00\x00\x00\x19\x00\x00\x00\x3E\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP1538" type="8" flags="97"/>
</Activity>
<Activity id="1361" ActivityType="13" flags="0" name="获取制动力">
<Rect left="190" top="3874" right="290" bottom="3906"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1362" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="190" top="4024" right="290" bottom="4056"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="27" type="8" flags="97"/>
</Activity>
<Activity id="1363" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="4024" right="440" bottom="4056"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1364" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="190" top="4104" right="290" bottom="4136"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="28" type="8" flags="97"/>
</Activity>
<Activity id="1365" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="4104" right="440" bottom="4136"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1366" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="190" top="4174" right="290" bottom="4206"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="70" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1367" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="4174" right="440" bottom="4206"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1368" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="190" top="4244" right="290" bottom="4276"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="71" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1369" ActivityType="3" flags="0" name="IntClear">
<Rect left="340" top="4244" right="440" bottom="4276"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1370" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="850" top="3354" right="950" bottom="3386"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1371" ActivityType="3" flags="0" name="RR">
<Rect left="850" top="2154" right="950" bottom="2186"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1372" ActivityType="3" flags="0" name="Druckaufbau">
<Rect left="850" top="2224" right="950" bottom="2256"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;
DFlag_Soll = 0;
DTime_Ventilpruefung = DTime_Ventilpruefung_Start;
engine.println("####DTime_Ventilpruefung####"..tostring(DTime_Ventilpruefung));</Script></Activity>
<Activity id="1375" ActivityType="3" flags="0" name="Pruefung">
<Rect left="850" top="2544" right="950" bottom="2576"/>
<Script></Script></Activity>
<Activity id="1377" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="2614" right="916" bottom="2646"/>
</Activity>
<Activity id="1378" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="850" top="2684" right="950" bottom="2716"/>
<Script></Script></Activity>
<Activity id="1389" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="850" top="3204" right="950" bottom="3236"/>
<Script>engine.println("##### ToleranceTest Druckaufbau RR (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
DCounter = DCounter+1;
engine.Delay(130);</Script></Activity>
<Activity id="1390" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="3204" right="1316" bottom="3236"/>
</Activity>
<Activity id="1391" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="2544" right="1316" bottom="2576"/>
</Activity>
<Activity id="1392" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="2684" right="836" bottom="2716"/>
</Activity>
<Activity id="1393" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="3204" right="836" bottom="3236"/>
</Activity>
<Activity id="1394" ActivityType="3" flags="0" name="Druckabbau">
<Rect left="850" top="3424" right="950" bottom="3456"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1396" ActivityType="3" flags="0" name="MsWait">
<Rect left="850" top="3574" right="950" bottom="3606"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="1397" ActivityType="3" flags="0" name="Pruefung">
<Rect left="850" top="3654" right="950" bottom="3686"/>
<Script></Script></Activity>
<Activity id="1398" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="3734" right="946" bottom="3766"/>
</Activity>
<Activity id="1399" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="850" top="3794" right="950" bottom="3826"/>
<Script></Script></Activity>
<Activity id="1410" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="860" top="4314" right="960" bottom="4346"/>
<Script>engine.println("##### ToleranceTest Druckaufbau RR (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
DCounter = DCounter+1;
engine.Delay(50);</Script></Activity>
<Activity id="1411" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="4314" right="1316" bottom="4346"/>
</Activity>
<Activity id="1412" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="3654" right="1316" bottom="3686"/>
</Activity>
<Activity id="1413" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="850" top="4394" right="950" bottom="4426"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1414" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="3794" right="846" bottom="3826"/>
</Activity>
<Activity id="1415" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="4314" right="846" bottom="4346"/>
</Activity>
<Activity id="1416" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="4394" right="1406" bottom="4426"/>
</Activity>
<Activity id="1417" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="2154" right="1406" bottom="2186"/>
</Activity>
<Activity id="1418" ActivityType="13" flags="0" name="RL FR EV on">
<Rect left="190" top="2294" right="290" bottom="2326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x00\xFF\xFF\x00\x34\x00\x00\xFF\xFF\x00\x3C\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="10" name="DEP1533" type="8" flags="97"/>
</Activity>
<Activity id="1419" ActivityType="13" flags="0" name="USV1 HSV1 on">
<Rect left="190" top="2354" right="290" bottom="2386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x28\x00\x4E\xFF\xFF\x00\x52\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1534" type="8" flags="97"/>
</Activity>
<Activity id="1420" ActivityType="13" flags="0" name="预增压RR">
<Rect left="850" top="2414" right="950" bottom="2446"/>
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
<Activity id="1421" ActivityType="13" flags="0" name="USV1 off RL FR EV off">
<Rect left="850" top="2284" right="950" bottom="2316"/>
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
<Activity id="1422" ActivityType="13" flags="0" name="USV2 HSV2 and RR FL EV on">
<Rect left="850" top="2344" right="950" bottom="2376"/>
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
<Activity id="1423" ActivityType="13" flags="0" name="增压RR">
<Rect left="990" top="2744" right="1090" bottom="2776"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x02\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1424" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="850" top="2834" right="950" bottom="2866"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;


DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1425" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="850" top="2914" right="950" bottom="2946"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1426" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="2914" right="1100" bottom="2946"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1427" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="850" top="2994" right="950" bottom="3026"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1428" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="2994" right="1100" bottom="3026"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1429" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="850" top="3064" right="950" bottom="3096"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1430" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="3064" right="1100" bottom="3096"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1431" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="850" top="3134" right="950" bottom="3166"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="800.0"/>
<Parameter id="Otg" value="2400.0"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1432" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="3134" right="1100" bottom="3166"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1433" ActivityType="13" flags="0" name="获取制动力">
<Rect left="850" top="2764" right="950" bottom="2796"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1434" ActivityType="13" flags="0" name="HSV2 off">
<Rect left="850" top="3274" right="950" bottom="3306"/>
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
<Activity id="1436" ActivityType="13" flags="0" name="泄压RR">
<Rect left="850" top="3494" right="950" bottom="3526"/>
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
<Activity id="1437" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="850" top="3954" right="950" bottom="3986"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1438" ActivityType="13" flags="0" name="获取制动力">
<Rect left="850" top="3874" right="950" bottom="3906"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1439" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="850" top="4034" right="950" bottom="4066"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="72" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1440" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="4034" right="1100" bottom="4066"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1441" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="850" top="4114" right="950" bottom="4146"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="73" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1442" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="4114" right="1100" bottom="4146"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1443" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="850" top="4184" right="950" bottom="4216"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="74" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1444" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="4184" right="1100" bottom="4216"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1445" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="850" top="4254" right="950" bottom="4286"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="75" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1446" ActivityType="3" flags="0" name="IntClear">
<Rect left="1000" top="4254" right="1100" bottom="4286"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1447" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="1560" top="3364" right="1660" bottom="3396"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1448" ActivityType="3" flags="0" name="FL">
<Rect left="1560" top="2154" right="1660" bottom="2186"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>BrakeForce_FL = 0.0;
BrakeForce_FR = 0.0;
BrakeForce_RL = 0.0;
BrakeForce_RR = 0.0;</Script></Activity>
<Activity id="1449" ActivityType="3" flags="0" name="Druckaufbau">
<Rect left="1560" top="2204" right="1660" bottom="2236"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;
DFlag_Soll = 0;
DTime_Ventilpruefung = DTime_Ventilpruefung_Start;
engine.println("####DTime_Ventilpruefung####"..tostring(DTime_Ventilpruefung));</Script></Activity>
<Activity id="1452" ActivityType="3" flags="0" name="Pruefung">
<Rect left="1560" top="2554" right="1660" bottom="2586"/>
<Script></Script></Activity>
<Activity id="1454" ActivityType="4" flags="0" name="路由节点">
<Rect left="1624" top="2634" right="1656" bottom="2666"/>
</Activity>
<Activity id="1455" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="1560" top="2694" right="1660" bottom="2726"/>
<Script>engine.Delay(40);</Script></Activity>
<Activity id="1466" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="1560" top="3214" right="1660" bottom="3246"/>
<Script>engine.println("##### ToleranceTest Druckaufbau FL (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
DCounter = DCounter+1;
engine.Delay(90);</Script></Activity>
<Activity id="1467" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="3214" right="1956" bottom="3246"/>
</Activity>
<Activity id="1468" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="2554" right="1956" bottom="2586"/>
</Activity>
<Activity id="1469" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="2694" right="1526" bottom="2726"/>
</Activity>
<Activity id="1470" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="3214" right="1526" bottom="3246"/>
</Activity>
<Activity id="1471" ActivityType="3" flags="0" name="Druckabbau">
<Rect left="1560" top="3434" right="1660" bottom="3466"/>
<Script>DCounter = 0;
DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1473" ActivityType="3" flags="0" name="MsWait">
<Rect left="1560" top="3584" right="1660" bottom="3616"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="1474" ActivityType="3" flags="0" name="Pruefung">
<Rect left="1560" top="3664" right="1660" bottom="3696"/>
<Script></Script></Activity>
<Activity id="1475" ActivityType="4" flags="0" name="路由节点">
<Rect left="1624" top="3744" right="1656" bottom="3776"/>
</Activity>
<Activity id="1476" ActivityType="3" flags="0" name="Read_BrakeForces">
<Rect left="1560" top="3804" right="1660" bottom="3836"/>
<Script></Script></Activity>
<Activity id="1487" ActivityType="3" flags="0" name="SetProcessVariables">
<Rect left="1560" top="4324" right="1660" bottom="4356"/>
<Script>engine.println("##### ToleranceTest Druckaufbau FL (OK == 1)"..tostring(DFlag_Trigger_Bremskraft))
DCounter = DCounter+1;
engine.Delay(50);</Script></Activity>
<Activity id="1488" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="4324" right="1956" bottom="4356"/>
</Activity>
<Activity id="1489" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="3664" right="1956" bottom="3696"/>
</Activity>
<Activity id="1490" ActivityType="3" flags="0" name="IntInc_PruefungIO_plus_1">
<Rect left="1560" top="4404" right="1660" bottom="4436"/>
<Script>if (DFlag_Trigger_Bremskraft == 1) then
PruefungIO = PruefungIO + 1;
engine.println("### PruefungIO ###"..tostring(PruefungIO));
else
engine.println("### PruefungIO ###"..tostring(PruefungIO));
engine.println("### DCounter ###"..tostring(DCounter));
end</Script></Activity>
<Activity id="1491" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="3804" right="1526" bottom="3836"/>
</Activity>
<Activity id="1492" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="4324" right="1526" bottom="4356"/>
</Activity>
<Activity id="1493" ActivityType="4" flags="0" name="路由节点">
<Rect left="2034" top="4404" right="2066" bottom="4436"/>
</Activity>
<Activity id="1494" ActivityType="4" flags="0" name="路由节点">
<Rect left="2034" top="2154" right="2066" bottom="2186"/>
</Activity>
<Activity id="1495" ActivityType="13" flags="0" name="HSV2 off">
<Rect left="1560" top="2264" right="1660" bottom="2296"/>
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
<Activity id="1496" ActivityType="13" flags="0" name="USV2 HSV2 on">
<Rect left="1560" top="2334" right="1660" bottom="2366"/>
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
<Activity id="1497" ActivityType="13" flags="0" name="预增压FL">
<Rect left="1560" top="2404" right="1660" bottom="2436"/>
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
<Activity id="1499" ActivityType="13" flags="0" name="增压FL">
<Rect left="1700" top="2754" right="1800" bottom="2786"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x04\xFF\xFF\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1500" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1560" top="2844" right="1660" bottom="2876"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;


DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1501" ActivityType="13" flags="0" name="获取制动力">
<Rect left="1560" top="2774" right="1660" bottom="2806"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1502" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="1560" top="2914" right="1660" bottom="2946"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="1600.0"/>
<Parameter id="Otg" value="2400.0"/>
</Parameters>
</FunctionRef>
<assessment no="80" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1503" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="2914" right="1810" bottom="2946"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1504" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="1560" top="2994" right="1660" bottom="3026"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="81" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1505" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="2994" right="1810" bottom="3026"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1506" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="1560" top="3064" right="1660" bottom="3096"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="82" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1507" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="3064" right="1810" bottom="3096"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1508" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="1560" top="3134" right="1660" bottom="3166"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="83" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1509" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="3134" right="1810" bottom="3166"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1510" ActivityType="13" flags="0" name="HSV2 off">
<Rect left="1560" top="3284" right="1660" bottom="3316"/>
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
<Activity id="1511" ActivityType="13" flags="0" name="泄压FL">
<Rect left="1560" top="3514" right="1660" bottom="3546"/>
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
<Activity id="1512" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="1560" top="3954" right="1660" bottom="3986"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1513" ActivityType="13" flags="0" name="获取制动力">
<Rect left="1560" top="3874" right="1660" bottom="3906"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1514" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="1560" top="4024" right="1660" bottom="4056"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="86" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1515" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="4024" right="1810" bottom="4056"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1516" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="1560" top="4104" right="1660" bottom="4136"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="87" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1517" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="4104" right="1810" bottom="4136"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1518" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="1560" top="4174" right="1660" bottom="4206"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="88" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1519" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="4174" right="1810" bottom="4206"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1520" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="1560" top="4244" right="1660" bottom="4276"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="89" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1521" ActivityType="3" flags="0" name="IntClear">
<Rect left="1710" top="4244" right="1810" bottom="4276"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1522" ActivityType="13" flags="0" name="USV 2 RR FL EV off">
<Rect left="2150" top="2304" right="2250" bottom="2336"/>
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
<Activity id="1523" ActivityType="13" flags="0" name="USV1 HSV1 RL FR EV on">
<Rect left="2150" top="2374" right="2250" bottom="2406"/>
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
<Activity id="1525" ActivityType="13" flags="0" name="增压FR">
<Rect left="2330" top="2764" right="2430" bottom="2796"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x34\x00\x00\x00\x00\x00\x04\xFF\xFF\x00\x34\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1526" ActivityType="13" flags="0" name="预增压FR">
<Rect left="2150" top="2444" right="2250" bottom="2476"/>
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
<Activity id="1527" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="2150" top="2844" right="2250" bottom="2876"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;


DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1528" ActivityType="13" flags="0" name="获取制动力">
<Rect left="2150" top="2774" right="2250" bottom="2806"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1529" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="2150" top="2924" right="2250" bottom="2956"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="94" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1530" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="2924" right="2400" bottom="2956"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1531" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="2150" top="3004" right="2250" bottom="3036"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="1600.0"/>
<Parameter id="Otg" value="2400.0"/>
</Parameters>
</FunctionRef>
<assessment no="95" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1532" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="3004" right="2400" bottom="3036"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1533" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="2150" top="3074" right="2250" bottom="3106"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="96" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1534" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="3074" right="2400" bottom="3106"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1535" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="2150" top="3144" right="2250" bottom="3176"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="97" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1536" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="3144" right="2400" bottom="3176"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1537" ActivityType="13" flags="0" name="HSV1 off">
<Rect left="2150" top="3294" right="2250" bottom="3326"/>
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
<Activity id="1538" ActivityType="13" flags="0" name="泄压FR">
<Rect left="2150" top="3524" right="2250" bottom="3556"/>
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
<Activity id="1539" ActivityType="3" flags="0" name="TestBrakeForces">
<Rect left="2150" top="3964" right="2250" bottom="3996"/>
<Script>BrakeForce_FL  = BrakeForce_FL - DragForce_FL;
BrakeForce_FR  = BrakeForce_FR - DragForce_FR;
BrakeForce_RL  = BrakeForce_RL - DragForce_RL;
BrakeForce_RR  = BrakeForce_RR - DragForce_RR;

DFlag_Trigger_Bremskraft = 1;</Script></Activity>
<Activity id="1540" ActivityType="13" flags="0" name="获取制动力">
<Rect left="2150" top="3884" right="2250" bottom="3916"/>
<Line1Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line4Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1541" ActivityType="13" flags="0" name="FL_FloatToleranceCheck">
<Rect left="2150" top="4044" right="2250" bottom="4076"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="100" name="DEP1543" type="8" flags="97"/>
</Activity>
<Activity id="1542" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="4044" right="2400" bottom="4076"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1543" ActivityType="13" flags="0" name="FR_FloatToleranceCheck">
<Rect left="2150" top="4124" right="2250" bottom="4156"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_FR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="101" name="DEP1544" type="8" flags="97"/>
</Activity>
<Activity id="1544" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="4124" right="2400" bottom="4156"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1545" ActivityType="13" flags="0" name="RL_FloatToleranceCheck">
<Rect left="2150" top="4194" right="2250" bottom="4226"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RL"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="102" name="DEP1536" type="8" flags="97"/>
</Activity>
<Activity id="1546" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="4194" right="2400" bottom="4226"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1547" ActivityType="13" flags="0" name="RR_FloatToleranceCheck">
<Rect left="2150" top="4264" right="2250" bottom="4296"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="BrakeForce_RR"/>
<Parameter id="Utg" value="-500.0"/>
<Parameter id="Otg" value="200.0"/>
</Parameters>
</FunctionRef>
<assessment no="103" name="DEP1545" type="8" flags="97"/>
</Activity>
<Activity id="1548" ActivityType="3" flags="0" name="IntClear">
<Rect left="2300" top="4264" right="2400" bottom="4296"/>
<Script>DFlag_Trigger_Bremskraft = 0;</Script></Activity>
<Activity id="1549" ActivityType="13" flags="0" name="USV1 off">
<Rect left="2700" top="2154" right="2800" bottom="2186"/>
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
<Activity id="1550" ActivityType="13" flags="0" name="All USV`s and HSV`s off">
<Rect left="2700" top="2224" right="2800" bottom="2256"/>
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
<Activity id="1551" ActivityType="13" flags="0" name="All EV off">
<Rect left="2700" top="2374" right="2800" bottom="2406"/>
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
<Activity id="1552" ActivityType="13" flags="0" name="All AV off">
<Rect left="2700" top="2454" right="2800" bottom="2486"/>
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
<Activity id="1553" ActivityType="13" flags="0" name="Pump motor off">
<Rect left="2700" top="2534" right="2800" bottom="2566"/>
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
<Activity id="1554" ActivityType="13" flags="0" name="All EV off">
<Rect left="2700" top="2754" right="2800" bottom="2786"/>
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
<Activity id="1555" ActivityType="13" flags="0" name="All AV off">
<Rect left="2700" top="2874" right="2800" bottom="2906"/>
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
<Activity id="1556" ActivityType="13" flags="0" name="Pump motor off">
<Rect left="2700" top="2954" right="2800" bottom="2986"/>
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
<Activity id="1559" ActivityType="3" flags="0" name="测量块完整">
<Rect left="2700" top="3694" right="2800" bottom="3726"/>
<Script>engine.LastError = 0
engine.StatValue = "Test block complete"</Script><assessment no="115" name="DEP1562" type="8" flags="97"/>
</Activity>
<Activity id="1561" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="2700" top="3424" right="2800" bottom="3456"/>
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
<Activity id="1562" ActivityType="13" flags="0" name="UDS_ReadDTCByStatusMask">
<Rect left="2700" top="3494" right="2800" bottom="3526"/>
<Line1Text Enable="1" Text="读取/显示ABS故障存储器"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x08"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1563" ActivityType="13" flags="0" name="UDS_DTCFilterStatisticList">
<Rect left="2700" top="3554" right="2800" bottom="3586"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="true"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="114" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="1564" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2700" top="3624" right="2800" bottom="3656"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="116" name="DEP1507" type="8" flags="97"/>
</Activity>
<Activity id="1569" ActivityType="3" flags="0" name="等待4s">
<Rect left="2700" top="2634" right="2800" bottom="2666"/>
<Script>local timeTmp = 4;
local LineNr = 1;
Text = "请等待"
Timeout = 4;

while(timeTmp &gt; 0) do 

engine.SetLineText(LineNr,"#L=bmpbar,0,"..tostring(Timeout)..","..tostring(0)..","..tostring(timeTmp).."#R="..tostring(Text));
timeTmp = timeTmp - 1 ;
engine.ShowMessage();
engine.Delay(1000);

end;


engine.SetLineText(LineNr,"");</Script></Activity>
<Activity id="1578" ActivityType="13" flags="0" name="ESP增压RL">
<Rect left="330" top="2694" right="430" bottom="2726"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x3C\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x3C\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1579" ActivityType="13" flags="0" name="ESP增压RR">
<Rect left="1000" top="2684" right="1100" bottom="2716"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x38\x00\x00\x00\x00\x00\x03\xFF\xFF\x00\x38\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1580" ActivityType="13" flags="0" name="ESP增压FL">
<Rect left="1700" top="2694" right="1800" bottom="2726"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x04\xFF\xFF\x00\x30\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1581" ActivityType="13" flags="0" name="ESP增压FR">
<Rect left="2300" top="2704" right="2400" bottom="2736"/>
<FunctionRef id="ECU_DataExchange_esp" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x03\x00\x00\x00\x34\x00\x00\x00\x00\x00\x04\xFF\xFF\x00\x34\x00\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1582" ActivityType="5" flags="0" name="全毂5km/h">
<Rect left="190" top="1074" right="290" bottom="1106"/>
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
<Activity id="1583" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="2700" top="3354" right="2800" bottom="3386"/>
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
<Activity id="1584" ActivityType="3" flags="0" name="毂速度不正确">
<Rect left="320" top="1134" right="420" bottom="1166"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false
print("四毂速度检查不正确")</Script><assessment no="7" name="DEP1530" type="8" flags="97"/>
</Activity>
<Activity id="1585" ActivityType="3" flags="0" name="获取阻滞力">
<Rect left="190" top="1194" right="290" bottom="1226"/>
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
<Rect left="320" top="1074" right="420" bottom="1106"/>
<Script>engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
isOK = false</Script><assessment no="117" name="DEP1563" type="8" flags="97"/>
</Activity>
<Activity id="1588" ActivityType="3" flags="0" name="IDT错误">
<Rect left="2880" top="3354" right="2980" bottom="3386"/>
<Script>isOK = false
engine.LastError = 1
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)
</Script><assessment no="118" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="1589" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="340" top="344" right="440" bottom="376"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1590" ActivityType="5" flags="0" name="读档位">
<Rect left="190" top="224" right="290" bottom="256"/>
<SubProcesses>
<SubProcess id="C131_ATcheckN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1592" ActivityType="3" flags="0" name="阀门检测">
<Rect left="2940" top="3114" right="3040" bottom="3146"/>
<Line1Text Enable="1" Text="阀门检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1593" ActivityType="4" flags="0" name="路由节点">
<Rect left="2894" top="144" right="2926" bottom="176"/>
</Activity>
<Activity id="1594" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="2940" top="3024" right="3040" bottom="3056"/>
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
<Activity id="1595" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="2940" top="2954" right="3040" bottom="2986"/>
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
<Activity id="1596" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2940" top="2884" right="3040" bottom="2916"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="116" name="DEP1507" type="8" flags="97"/>
</Activity>
<Activity id="1597" ActivityType="3" flags="0" name="延时300ms">
<Rect left="190" top="2474" right="290" bottom="2506"/>
<Script>engine.Delay(300)</Script></Activity>
<Activity id="1598" ActivityType="3" flags="0" name="延时300ms">
<Rect left="850" top="2474" right="950" bottom="2506"/>
<Script>engine.Delay(300)</Script></Activity>
<Activity id="1600" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1560" top="2474" right="1660" bottom="2506"/>
<Script>engine.Delay(300)</Script></Activity>
<Activity id="1601" ActivityType="3" flags="0" name="延时300ms">
<Rect left="2150" top="2504" right="2250" bottom="2536"/>
<Script>engine.Delay(300)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="641" type="0">
</Transition>
<Transition StartId="14" EndId="50" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="1522" type="0">
</Transition>
<Transition StartId="29" EndId="31" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 5)</Expression></Transition>
<Transition StartId="29" EndId="48" type="0">
</Transition>
<Transition StartId="31" EndId="1581" type="0">
</Transition>
<Transition StartId="32" EndId="1528" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="29" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="1537" type="0">
</Transition>
<Transition StartId="50" EndId="1538" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="55" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 10)</Expression></Transition>
<Transition StartId="53" EndId="71" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="1540" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="53" type="0">
</Transition>
<Transition StartId="70" EndId="120" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="70" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="1549" type="0">
</Transition>
<Transition StartId="220" EndId="1551" type="0">
</Transition>
<Transition StartId="234" EndId="235" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="3">
</Transition>
<Transition StartId="237" EndId="1592" type="0">
</Transition>
<Transition StartId="238" EndId="1583" type="0">
</Transition>
<Transition StartId="641" EndId="1590" type="0">
</Transition>
<Transition StartId="642" EndId="643" type="0">
</Transition>
<Transition StartId="643" EndId="1269" type="3">
</Transition>
<Transition StartId="643" EndId="1589" type="0">
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
<Transition StartId="1287" EndId="1288" type="1">
<Expression>count &lt; 10</Expression></Transition>
<Transition StartId="1288" EndId="1289" type="0">
</Transition>
<Transition StartId="1289" EndId="1287" type="0">
</Transition>
<Transition StartId="1291" EndId="1292" type="0">
</Transition>
<Transition StartId="1292" EndId="1294" type="0">
</Transition>
<Transition StartId="1294" EndId="1307" type="0">
</Transition>
<Transition StartId="1306" EndId="1330" type="0">
</Transition>
<Transition StartId="1307" EndId="1308" type="0">
</Transition>
<Transition StartId="1308" EndId="1418" type="0">
</Transition>
<Transition StartId="1311" EndId="1313" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 5)</Expression></Transition>
<Transition StartId="1311" EndId="1328" type="0">
</Transition>
<Transition StartId="1313" EndId="1578" type="0">
</Transition>
<Transition StartId="1314" EndId="1356" type="0">
</Transition>
<Transition StartId="1316" EndId="1317" type="0">
</Transition>
<Transition StartId="1317" EndId="1318" type="4">
</Transition>
<Transition StartId="1317" EndId="1319" type="0">
</Transition>
<Transition StartId="1318" EndId="1319" type="0">
</Transition>
<Transition StartId="1319" EndId="1320" type="4">
</Transition>
<Transition StartId="1319" EndId="1321" type="0">
</Transition>
<Transition StartId="1320" EndId="1321" type="0">
</Transition>
<Transition StartId="1321" EndId="1322" type="4">
</Transition>
<Transition StartId="1321" EndId="1323" type="0">
</Transition>
<Transition StartId="1322" EndId="1323" type="0">
</Transition>
<Transition StartId="1323" EndId="1324" type="4">
</Transition>
<Transition StartId="1323" EndId="1325" type="0">
</Transition>
<Transition StartId="1324" EndId="1325" type="0">
</Transition>
<Transition StartId="1325" EndId="1326" type="0">
</Transition>
<Transition StartId="1326" EndId="1327" type="0">
</Transition>
<Transition StartId="1327" EndId="1311" type="0">
</Transition>
<Transition StartId="1328" EndId="1329" type="0">
</Transition>
<Transition StartId="1329" EndId="1359" type="0">
</Transition>
<Transition StartId="1330" EndId="1360" type="0">
</Transition>
<Transition StartId="1332" EndId="1333" type="0">
</Transition>
<Transition StartId="1333" EndId="1334" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 10)</Expression></Transition>
<Transition StartId="1333" EndId="1350" type="0">
</Transition>
<Transition StartId="1334" EndId="1335" type="0">
</Transition>
<Transition StartId="1335" EndId="1361" type="0">
</Transition>
<Transition StartId="1337" EndId="1362" type="0">
</Transition>
<Transition StartId="1346" EndId="1347" type="0">
</Transition>
<Transition StartId="1347" EndId="1348" type="0">
</Transition>
<Transition StartId="1348" EndId="1333" type="0">
</Transition>
<Transition StartId="1349" EndId="1352" type="0">
</Transition>
<Transition StartId="1350" EndId="1351" type="0">
</Transition>
<Transition StartId="1351" EndId="1349" type="0">
</Transition>
<Transition StartId="1352" EndId="1353" type="0">
</Transition>
<Transition StartId="1353" EndId="1371" type="0">
</Transition>
<Transition StartId="1354" EndId="1597" type="0">
</Transition>
<Transition StartId="1356" EndId="1316" type="0">
</Transition>
<Transition StartId="1359" EndId="1306" type="0">
</Transition>
<Transition StartId="1360" EndId="1332" type="0">
</Transition>
<Transition StartId="1361" EndId="1337" type="0">
</Transition>
<Transition StartId="1362" EndId="1363" type="4">
</Transition>
<Transition StartId="1362" EndId="1364" type="0">
</Transition>
<Transition StartId="1363" EndId="1364" type="0">
</Transition>
<Transition StartId="1364" EndId="1365" type="4">
</Transition>
<Transition StartId="1364" EndId="1366" type="0">
</Transition>
<Transition StartId="1365" EndId="1366" type="0">
</Transition>
<Transition StartId="1366" EndId="1367" type="4">
</Transition>
<Transition StartId="1366" EndId="1368" type="0">
</Transition>
<Transition StartId="1367" EndId="1368" type="0">
</Transition>
<Transition StartId="1368" EndId="1369" type="4">
</Transition>
<Transition StartId="1368" EndId="1346" type="0">
</Transition>
<Transition StartId="1369" EndId="1346" type="0">
</Transition>
<Transition StartId="1370" EndId="1394" type="0">
</Transition>
<Transition StartId="1371" EndId="1372" type="0">
</Transition>
<Transition StartId="1372" EndId="1421" type="0">
</Transition>
<Transition StartId="1375" EndId="1377" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 5)</Expression></Transition>
<Transition StartId="1375" EndId="1392" type="0">
</Transition>
<Transition StartId="1377" EndId="1579" type="0">
</Transition>
<Transition StartId="1378" EndId="1433" type="0">
</Transition>
<Transition StartId="1389" EndId="1390" type="0">
</Transition>
<Transition StartId="1390" EndId="1391" type="0">
</Transition>
<Transition StartId="1391" EndId="1375" type="0">
</Transition>
<Transition StartId="1392" EndId="1393" type="0">
</Transition>
<Transition StartId="1393" EndId="1434" type="0">
</Transition>
<Transition StartId="1394" EndId="1436" type="0">
</Transition>
<Transition StartId="1396" EndId="1397" type="0">
</Transition>
<Transition StartId="1397" EndId="1398" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 10)</Expression></Transition>
<Transition StartId="1397" EndId="1414" type="0">
</Transition>
<Transition StartId="1398" EndId="1399" type="0">
</Transition>
<Transition StartId="1399" EndId="1438" type="0">
</Transition>
<Transition StartId="1410" EndId="1411" type="0">
</Transition>
<Transition StartId="1411" EndId="1412" type="0">
</Transition>
<Transition StartId="1412" EndId="1397" type="0">
</Transition>
<Transition StartId="1413" EndId="1416" type="0">
</Transition>
<Transition StartId="1414" EndId="1415" type="0">
</Transition>
<Transition StartId="1415" EndId="1413" type="0">
</Transition>
<Transition StartId="1416" EndId="1417" type="0">
</Transition>
<Transition StartId="1417" EndId="1448" type="0">
</Transition>
<Transition StartId="1418" EndId="1419" type="0">
</Transition>
<Transition StartId="1419" EndId="1354" type="0">
</Transition>
<Transition StartId="1420" EndId="1598" type="0">
</Transition>
<Transition StartId="1421" EndId="1422" type="0">
</Transition>
<Transition StartId="1422" EndId="1420" type="0">
</Transition>
<Transition StartId="1424" EndId="1425" type="0">
</Transition>
<Transition StartId="1425" EndId="1426" type="4">
</Transition>
<Transition StartId="1425" EndId="1427" type="0">
</Transition>
<Transition StartId="1426" EndId="1427" type="0">
</Transition>
<Transition StartId="1427" EndId="1428" type="4">
</Transition>
<Transition StartId="1427" EndId="1429" type="0">
</Transition>
<Transition StartId="1428" EndId="1429" type="0">
</Transition>
<Transition StartId="1429" EndId="1430" type="4">
</Transition>
<Transition StartId="1429" EndId="1431" type="0">
</Transition>
<Transition StartId="1430" EndId="1431" type="0">
</Transition>
<Transition StartId="1431" EndId="1432" type="4">
</Transition>
<Transition StartId="1431" EndId="1389" type="0">
</Transition>
<Transition StartId="1432" EndId="1389" type="0">
</Transition>
<Transition StartId="1433" EndId="1424" type="0">
</Transition>
<Transition StartId="1434" EndId="1370" type="0">
</Transition>
<Transition StartId="1436" EndId="1396" type="0">
</Transition>
<Transition StartId="1437" EndId="1439" type="0">
</Transition>
<Transition StartId="1438" EndId="1437" type="0">
</Transition>
<Transition StartId="1439" EndId="1440" type="4">
</Transition>
<Transition StartId="1439" EndId="1441" type="0">
</Transition>
<Transition StartId="1440" EndId="1441" type="0">
</Transition>
<Transition StartId="1441" EndId="1442" type="4">
</Transition>
<Transition StartId="1441" EndId="1443" type="0">
</Transition>
<Transition StartId="1442" EndId="1443" type="0">
</Transition>
<Transition StartId="1443" EndId="1444" type="4">
</Transition>
<Transition StartId="1443" EndId="1445" type="0">
</Transition>
<Transition StartId="1444" EndId="1445" type="0">
</Transition>
<Transition StartId="1445" EndId="1446" type="4">
</Transition>
<Transition StartId="1445" EndId="1410" type="0">
</Transition>
<Transition StartId="1446" EndId="1410" type="0">
</Transition>
<Transition StartId="1447" EndId="1471" type="0">
</Transition>
<Transition StartId="1448" EndId="1449" type="0">
</Transition>
<Transition StartId="1449" EndId="1495" type="0">
</Transition>
<Transition StartId="1452" EndId="1454" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 5)</Expression></Transition>
<Transition StartId="1452" EndId="1469" type="0">
</Transition>
<Transition StartId="1454" EndId="1580" type="0">
</Transition>
<Transition StartId="1455" EndId="1501" type="0">
</Transition>
<Transition StartId="1466" EndId="1467" type="0">
</Transition>
<Transition StartId="1467" EndId="1468" type="0">
</Transition>
<Transition StartId="1468" EndId="1452" type="0">
</Transition>
<Transition StartId="1469" EndId="1470" type="0">
</Transition>
<Transition StartId="1470" EndId="1510" type="0">
</Transition>
<Transition StartId="1471" EndId="1511" type="0">
</Transition>
<Transition StartId="1473" EndId="1474" type="0">
</Transition>
<Transition StartId="1474" EndId="1475" type="1">
<Expression>(DFlag_Trigger_Bremskraft ~= 1) and (DCounter &lt; 10)</Expression></Transition>
<Transition StartId="1474" EndId="1491" type="0">
</Transition>
<Transition StartId="1475" EndId="1476" type="0">
</Transition>
<Transition StartId="1476" EndId="1513" type="0">
</Transition>
<Transition StartId="1487" EndId="1488" type="0">
</Transition>
<Transition StartId="1488" EndId="1489" type="0">
</Transition>
<Transition StartId="1489" EndId="1474" type="0">
</Transition>
<Transition StartId="1490" EndId="1493" type="0">
</Transition>
<Transition StartId="1491" EndId="1492" type="0">
</Transition>
<Transition StartId="1492" EndId="1490" type="0">
</Transition>
<Transition StartId="1493" EndId="1494" type="0">
</Transition>
<Transition StartId="1494" EndId="23" type="0">
</Transition>
<Transition StartId="1495" EndId="1496" type="0">
</Transition>
<Transition StartId="1496" EndId="1497" type="0">
</Transition>
<Transition StartId="1497" EndId="1600" type="0">
</Transition>
<Transition StartId="1500" EndId="1502" type="0">
</Transition>
<Transition StartId="1501" EndId="1500" type="0">
</Transition>
<Transition StartId="1502" EndId="1503" type="4">
</Transition>
<Transition StartId="1502" EndId="1504" type="0">
</Transition>
<Transition StartId="1503" EndId="1504" type="0">
</Transition>
<Transition StartId="1504" EndId="1505" type="4">
</Transition>
<Transition StartId="1504" EndId="1506" type="0">
</Transition>
<Transition StartId="1505" EndId="1506" type="0">
</Transition>
<Transition StartId="1506" EndId="1507" type="4">
</Transition>
<Transition StartId="1506" EndId="1508" type="0">
</Transition>
<Transition StartId="1507" EndId="1508" type="0">
</Transition>
<Transition StartId="1508" EndId="1509" type="4">
</Transition>
<Transition StartId="1508" EndId="1466" type="0">
</Transition>
<Transition StartId="1509" EndId="1466" type="0">
</Transition>
<Transition StartId="1510" EndId="1447" type="0">
</Transition>
<Transition StartId="1511" EndId="1473" type="0">
</Transition>
<Transition StartId="1512" EndId="1514" type="0">
</Transition>
<Transition StartId="1513" EndId="1512" type="0">
</Transition>
<Transition StartId="1514" EndId="1515" type="4">
</Transition>
<Transition StartId="1514" EndId="1516" type="0">
</Transition>
<Transition StartId="1515" EndId="1516" type="0">
</Transition>
<Transition StartId="1516" EndId="1517" type="4">
</Transition>
<Transition StartId="1516" EndId="1518" type="0">
</Transition>
<Transition StartId="1517" EndId="1518" type="0">
</Transition>
<Transition StartId="1518" EndId="1519" type="4">
</Transition>
<Transition StartId="1518" EndId="1520" type="0">
</Transition>
<Transition StartId="1519" EndId="1520" type="0">
</Transition>
<Transition StartId="1520" EndId="1521" type="4">
</Transition>
<Transition StartId="1520" EndId="1487" type="0">
</Transition>
<Transition StartId="1521" EndId="1487" type="0">
</Transition>
<Transition StartId="1522" EndId="1523" type="0">
</Transition>
<Transition StartId="1523" EndId="1526" type="0">
</Transition>
<Transition StartId="1526" EndId="1601" type="0">
</Transition>
<Transition StartId="1527" EndId="1529" type="0">
</Transition>
<Transition StartId="1528" EndId="1527" type="0">
</Transition>
<Transition StartId="1529" EndId="1530" type="4">
</Transition>
<Transition StartId="1529" EndId="1531" type="0">
</Transition>
<Transition StartId="1530" EndId="1531" type="0">
</Transition>
<Transition StartId="1531" EndId="1532" type="4">
</Transition>
<Transition StartId="1531" EndId="1533" type="0">
</Transition>
<Transition StartId="1532" EndId="1533" type="0">
</Transition>
<Transition StartId="1533" EndId="1534" type="4">
</Transition>
<Transition StartId="1533" EndId="1535" type="0">
</Transition>
<Transition StartId="1534" EndId="1535" type="0">
</Transition>
<Transition StartId="1535" EndId="1536" type="4">
</Transition>
<Transition StartId="1535" EndId="45" type="0">
</Transition>
<Transition StartId="1536" EndId="45" type="0">
</Transition>
<Transition StartId="1537" EndId="14" type="0">
</Transition>
<Transition StartId="1538" EndId="52" type="0">
</Transition>
<Transition StartId="1539" EndId="1541" type="0">
</Transition>
<Transition StartId="1540" EndId="1539" type="0">
</Transition>
<Transition StartId="1541" EndId="1542" type="4">
</Transition>
<Transition StartId="1541" EndId="1543" type="0">
</Transition>
<Transition StartId="1542" EndId="1543" type="0">
</Transition>
<Transition StartId="1543" EndId="1544" type="4">
</Transition>
<Transition StartId="1543" EndId="1545" type="0">
</Transition>
<Transition StartId="1544" EndId="1545" type="0">
</Transition>
<Transition StartId="1545" EndId="1546" type="4">
</Transition>
<Transition StartId="1545" EndId="1547" type="0">
</Transition>
<Transition StartId="1546" EndId="1547" type="0">
</Transition>
<Transition StartId="1547" EndId="1548" type="4">
</Transition>
<Transition StartId="1547" EndId="67" type="0">
</Transition>
<Transition StartId="1548" EndId="67" type="0">
</Transition>
<Transition StartId="1549" EndId="1550" type="0">
</Transition>
<Transition StartId="1550" EndId="220" type="0">
</Transition>
<Transition StartId="1551" EndId="1552" type="0">
</Transition>
<Transition StartId="1552" EndId="1553" type="0">
</Transition>
<Transition StartId="1553" EndId="1569" type="0">
</Transition>
<Transition StartId="1554" EndId="1555" type="0">
</Transition>
<Transition StartId="1555" EndId="1556" type="0">
</Transition>
<Transition StartId="1556" EndId="234" type="0">
</Transition>
<Transition StartId="1557" EndId="1558" type="0">
</Transition>
<Transition StartId="1559" EndId="2" type="0">
</Transition>
<Transition StartId="1561" EndId="1562" type="0">
</Transition>
<Transition StartId="1562" EndId="1563" type="0">
</Transition>
<Transition StartId="1563" EndId="1564" type="0">
</Transition>
<Transition StartId="1564" EndId="1559" type="0">
</Transition>
<Transition StartId="1569" EndId="1554" type="0">
</Transition>
<Transition StartId="1578" EndId="1314" type="0">
</Transition>
<Transition StartId="1579" EndId="1378" type="0">
</Transition>
<Transition StartId="1580" EndId="1455" type="0">
</Transition>
<Transition StartId="1581" EndId="32" type="0">
</Transition>
<Transition StartId="1582" EndId="1587" type="0">
</Transition>
<Transition StartId="1582" EndId="1285" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1583" EndId="1561" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1583" EndId="1588" type="0">
</Transition>
<Transition StartId="1585" EndId="1291" type="0">
</Transition>
<Transition StartId="1590" EndId="642" type="0">
</Transition>
<Transition StartId="1592" EndId="238" type="0">
</Transition>
<Transition StartId="1592" EndId="1594" type="0">
</Transition>
<Transition StartId="1593" EndId="3" type="0">
</Transition>
<Transition StartId="1594" EndId="1595" type="0">
</Transition>
<Transition StartId="1595" EndId="1596" type="0">
</Transition>
<Transition StartId="1596" EndId="1593" type="6">
</Transition>
<Transition StartId="1597" EndId="1311" type="0">
</Transition>
<Transition StartId="1598" EndId="1375" type="0">
</Transition>
<Transition StartId="1600" EndId="1452" type="0">
</Transition>
<Transition StartId="1601" EndId="29" type="0">
</Transition>
</Transitions>
</Process>

