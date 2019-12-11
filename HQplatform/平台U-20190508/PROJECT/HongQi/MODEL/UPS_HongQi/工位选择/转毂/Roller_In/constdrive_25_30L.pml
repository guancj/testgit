<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1606" pbltext="DEP1567">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="410" top="54" right="510" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="830" top="1244" right="930" bottom="1276"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车速换算">
<Rect left="410" top="364" right="510" bottom="396"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.0078125
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="怠速5s">
<Rect left="410" top="244" right="510" bottom="276"/>
<Line1Text Enable="1" Text="车速0km/h,怠速状态 持续5s"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="410" top="844" right="510" bottom="876"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1266" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="304" right="626" bottom="336"/>
</Activity>
<Activity id="1267" ActivityType="13" flags="0" name="读取速度">
<Rect left="410" top="304" right="510" bottom="336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1284" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="844" right="626" bottom="876"/>
</Activity>
<Activity id="1285" ActivityType="3" flags="0" name="转速换算">
<Rect left="410" top="544" right="510" bottom="576"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1286" ActivityType="13" flags="0" name="读取转速">
<Rect left="410" top="484" right="510" bottom="516"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1288" ActivityType="3" flags="0" name="水温换算">
<Rect left="410" top="724" right="510" bottom="756"/>
<Script>vehicle_temperature = string.sub(DVciResult_temper,4,5);
vehicle_temperature = LibGeneral.binStr2Int(vehicle_temperature)
vehicle_temperature = vehicle_temperature * 0.75-48
engine.println("### 读取水温 vehicle_temperature ##"..vehicle_temperature);</Script></Activity>
<Activity id="1289" ActivityType="13" flags="0" name="读取水温">
<Rect left="410" top="664" right="510" bottom="696"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult_temper"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1292" ActivityType="3" flags="0" name="转速2500">
<Rect left="410" top="914" right="510" bottom="946"/>
<Line1Text Enable="1" Text="车速0km/h, 转速至2500rpm"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_2 = nil</Script></Activity>
<Activity id="1293" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="410" top="1174" right="510" bottom="1206"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1294" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="984" right="626" bottom="1016"/>
</Activity>
<Activity id="1297" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="1174" right="626" bottom="1206"/>
</Activity>
<Activity id="1298" ActivityType="3" flags="0" name="转速换算">
<Rect left="410" top="1044" right="510" bottom="1076"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1299" ActivityType="13" flags="0" name="读取转速">
<Rect left="410" top="984" right="510" bottom="1016"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1311" ActivityType="3" flags="0" name="车速换算">
<Rect left="830" top="314" right="930" bottom="346"/>
<Script>--vehicle_speed = string.sub(DVciResult_speed,4,5);
--vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
--vehicle_speed = vehicle_speed * 0.0078125
vehicle_speed = ReadSpeed_FL
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1312" ActivityType="3" flags="0" name="保持60km30s">
<Rect left="830" top="194" right="930" bottom="226"/>
<Line1Text Enable="1" Text="保持车速60km/h 持续30s"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1313" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="830" top="454" right="930" bottom="486"/>
<Script></Script></Activity>
<Activity id="1314" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="244" right="1016" bottom="276"/>
</Activity>
<Activity id="1315" ActivityType="13" flags="0" name="读取速度">
<Rect left="1360" top="314" right="1460" bottom="346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1317" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="454" right="1016" bottom="486"/>
</Activity>
<Activity id="1318" ActivityType="3" flags="0" name="车速换算">
<Rect left="830" top="644" right="930" bottom="676"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.0078125
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1319" ActivityType="3" flags="0" name="降速到20km">
<Rect left="830" top="524" right="930" bottom="556"/>
<Line1Text Enable="1" Text="松油门不踩刹车减速到20km/h"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1320" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="830" top="784" right="930" bottom="816"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1321" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="584" right="1006" bottom="616"/>
</Activity>
<Activity id="1322" ActivityType="13" flags="0" name="读取速度">
<Rect left="830" top="584" right="930" bottom="616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1324" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="784" right="1006" bottom="816"/>
</Activity>
<Activity id="1325" ActivityType="3" flags="0" name="车速换算">
<Rect left="830" top="974" right="930" bottom="1006"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.0078125
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1326" ActivityType="3" flags="0" name="挂空挡等车静止">
<Rect left="830" top="854" right="930" bottom="886"/>
<Line1Text Enable="1" Text="挂N档"/>
<Line2Text Enable="1" Text="等车静止"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil
</Script></Activity>
<Activity id="1327" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="830" top="1104" right="930" bottom="1136"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1328" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="914" right="1096" bottom="946"/>
</Activity>
<Activity id="1329" ActivityType="13" flags="0" name="读取速度">
<Rect left="830" top="914" right="930" bottom="946"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1331" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="1104" right="1096" bottom="1136"/>
</Activity>
<Activity id="1335" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="1784" right="476" bottom="1816"/>
</Activity>
<Activity id="1336" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="1784" right="796" bottom="1816"/>
</Activity>
<Activity id="1337" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="194" right="796" bottom="226"/>
</Activity>
<Activity id="1338" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="410" top="114" right="510" bottom="146"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="1339" ActivityType="13" flags="0" name="扩展会话">
<Rect left="410" top="174" right="510" bottom="206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1098" type="8" flags="97"/>
</Activity>
<Activity id="1340" ActivityType="13" flags="1" name="ECU_Close">
<Rect left="830" top="1174" right="930" bottom="1206"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP1507" type="8" flags="97"/>
</Activity>
<Activity id="1341" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="540" top="174" right="640" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1342" ActivityType="3" flags="0" name="车速换算">
<Rect left="410" top="1374" right="510" bottom="1406"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.0078125
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1343" ActivityType="3" flags="0" name="怠速5s">
<Rect left="410" top="1254" right="510" bottom="1286"/>
<Line1Text Enable="1" Text="车速0km/h, 怠速持续5s"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;</Script></Activity>
<Activity id="1344" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="410" top="1694" right="510" bottom="1726"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1345" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1314" right="616" bottom="1346"/>
</Activity>
<Activity id="1346" ActivityType="13" flags="0" name="读取速度">
<Rect left="410" top="1314" right="510" bottom="1346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1348" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1694" right="616" bottom="1726"/>
</Activity>
<Activity id="1349" ActivityType="3" flags="0" name="转速换算">
<Rect left="410" top="1554" right="510" bottom="1586"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1350" ActivityType="13" flags="0" name="读取转速">
<Rect left="410" top="1494" right="510" bottom="1526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1352" ActivityType="13" flags="0" name="车辆速度">
<Rect left="410" top="424" right="510" bottom="456"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="0.0"/>
<Parameter id="LowerLimit" value="0.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="5"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1568" type="8" flags="97"/>
</Activity>
<Activity id="1353" ActivityType="13" flags="0" name="车辆转速">
<Rect left="410" top="604" right="510" bottom="636"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="850"/>
<Parameter id="LowerLimit" value="650"/>
<Parameter id="MeasValue" value="vehicle_Rpm"/>
<Parameter id="RightViewText" value="&quot;转速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="5"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="5" name="DEP1569" type="8" flags="97"/>
</Activity>
<Activity id="1354" ActivityType="13" flags="0" name="车辆水温">
<Rect left="410" top="784" right="510" bottom="816"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_3"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="105"/>
<Parameter id="LowerLimit" value="65"/>
<Parameter id="MeasValue" value="vehicle_temperature"/>
<Parameter id="RightViewText" value="&quot;水温&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="5"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;度&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_3"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1247" type="8" flags="97"/>
</Activity>
<Activity id="1356" ActivityType="13" flags="0" name="车辆转速">
<Rect left="410" top="1104" right="510" bottom="1136"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="2800"/>
<Parameter id="LowerLimit" value="2200"/>
<Parameter id="MeasValue" value="vehicle_Rpm"/>
<Parameter id="RightViewText" value="&quot;转速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="7" name="DEP1570" type="8" flags="97"/>
</Activity>
<Activity id="1357" ActivityType="13" flags="0" name="车辆速度">
<Rect left="410" top="1434" right="510" bottom="1466"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="0.0"/>
<Parameter id="LowerLimit" value="0.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="8" name="DEP1568" type="8" flags="97"/>
</Activity>
<Activity id="1358" ActivityType="13" flags="0" name="车辆转速">
<Rect left="410" top="1624" right="510" bottom="1656"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="950"/>
<Parameter id="LowerLimit" value="650"/>
<Parameter id="MeasValue" value="vehicle_Rpm"/>
<Parameter id="RightViewText" value="&quot;转速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="10" name="DEP1569" type="8" flags="97"/>
</Activity>
<Activity id="1360" ActivityType="13" flags="0" name="车辆速度">
<Rect left="1270" top="394" right="1370" bottom="426"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="65.0"/>
<Parameter id="LowerLimit" value="55.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="30"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="300"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1571" type="8" flags="97"/>
</Activity>
<Activity id="1361" ActivityType="13" flags="0" name="车辆速度">
<Rect left="830" top="714" right="930" bottom="746"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="22.0"/>
<Parameter id="LowerLimit" value="18.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="12" name="DEP1572" type="8" flags="97"/>
</Activity>
<Activity id="1362" ActivityType="13" flags="0" name="车辆速度">
<Rect left="830" top="1034" right="930" bottom="1066"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="0.0"/>
<Parameter id="LowerLimit" value="0.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1363" ActivityType="3" flags="0" name="IDT速度">
<Rect left="830" top="244" right="930" bottom="276"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01


curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
        
tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
tmpFL2 = string.byte(curtRevTel:sub(14,14))
ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor


		


</Script></Activity>
<Activity id="1364" ActivityType="13" flags="0" name="Tolerance_view_Float_Atime">
<Rect left="830" top="374" right="930" bottom="406"/>
<FunctionRef id="Tolerance_view_Float_Atime" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="65.0"/>
<Parameter id="LowerLimit" value="55.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="30"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="300"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1571" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1338" type="0">
</Transition>
<Transition StartId="3" EndId="1352" type="0">
</Transition>
<Transition StartId="48" EndId="1267" type="0">
</Transition>
<Transition StartId="1264" EndId="1284" type="1">
<Expression>FinishFlag_1 ==  false or FinishFlag_2 ==  false or FinishFlag_3 ==  false</Expression></Transition>
<Transition StartId="1264" EndId="1292" type="0">
</Transition>
<Transition StartId="1266" EndId="1267" type="0">
</Transition>
<Transition StartId="1267" EndId="3" type="0">
</Transition>
<Transition StartId="1284" EndId="1266" type="0">
</Transition>
<Transition StartId="1285" EndId="1353" type="0">
</Transition>
<Transition StartId="1286" EndId="1285" type="0">
</Transition>
<Transition StartId="1288" EndId="1354" type="0">
</Transition>
<Transition StartId="1289" EndId="1288" type="0">
</Transition>
<Transition StartId="1292" EndId="1299" type="0">
</Transition>
<Transition StartId="1293" EndId="1297" type="1">
<Expression>FinishFlag_2 ==  false</Expression></Transition>
<Transition StartId="1293" EndId="1343" type="0">
</Transition>
<Transition StartId="1294" EndId="1299" type="0">
</Transition>
<Transition StartId="1297" EndId="1294" type="0">
</Transition>
<Transition StartId="1298" EndId="1356" type="0">
</Transition>
<Transition StartId="1299" EndId="1298" type="0">
</Transition>
<Transition StartId="1311" EndId="1364" type="0">
</Transition>
<Transition StartId="1312" EndId="1363" type="0">
</Transition>
<Transition StartId="1313" EndId="1317" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1313" EndId="1319" type="0">
</Transition>
<Transition StartId="1314" EndId="1363" type="0">
</Transition>
<Transition StartId="1317" EndId="1314" type="0">
</Transition>
<Transition StartId="1318" EndId="1361" type="0">
</Transition>
<Transition StartId="1319" EndId="1322" type="0">
</Transition>
<Transition StartId="1320" EndId="1324" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1320" EndId="1326" type="0">
</Transition>
<Transition StartId="1321" EndId="1322" type="0">
</Transition>
<Transition StartId="1322" EndId="1318" type="0">
</Transition>
<Transition StartId="1324" EndId="1321" type="0">
</Transition>
<Transition StartId="1325" EndId="1362" type="0">
</Transition>
<Transition StartId="1326" EndId="1329" type="0">
</Transition>
<Transition StartId="1327" EndId="1331" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1327" EndId="1340" type="0">
</Transition>
<Transition StartId="1328" EndId="1329" type="0">
</Transition>
<Transition StartId="1329" EndId="1325" type="0">
</Transition>
<Transition StartId="1331" EndId="1328" type="0">
</Transition>
<Transition StartId="1335" EndId="1336" type="0">
</Transition>
<Transition StartId="1336" EndId="1337" type="0">
</Transition>
<Transition StartId="1337" EndId="1312" type="0">
</Transition>
<Transition StartId="1338" EndId="1339" type="0">
</Transition>
<Transition StartId="1339" EndId="48" type="0">
</Transition>
<Transition StartId="1339" EndId="1341" type="4">
</Transition>
<Transition StartId="1340" EndId="2" type="0">
</Transition>
<Transition StartId="1342" EndId="1357" type="0">
</Transition>
<Transition StartId="1343" EndId="1346" type="0">
</Transition>
<Transition StartId="1344" EndId="1348" type="1">
<Expression>FinishFlag_1 ==  false or FinishFlag_2 ==  false</Expression></Transition>
<Transition StartId="1344" EndId="1335" type="0">
</Transition>
<Transition StartId="1345" EndId="1346" type="0">
</Transition>
<Transition StartId="1346" EndId="1342" type="0">
</Transition>
<Transition StartId="1348" EndId="1345" type="0">
</Transition>
<Transition StartId="1349" EndId="1358" type="0">
</Transition>
<Transition StartId="1350" EndId="1349" type="0">
</Transition>
<Transition StartId="1352" EndId="1286" type="0">
</Transition>
<Transition StartId="1353" EndId="1289" type="0">
</Transition>
<Transition StartId="1354" EndId="1264" type="0">
</Transition>
<Transition StartId="1356" EndId="1293" type="0">
</Transition>
<Transition StartId="1357" EndId="1350" type="0">
</Transition>
<Transition StartId="1358" EndId="1344" type="0">
</Transition>
<Transition StartId="1361" EndId="1320" type="0">
</Transition>
<Transition StartId="1362" EndId="1327" type="0">
</Transition>
<Transition StartId="1363" EndId="1311" type="0">
</Transition>
<Transition StartId="1364" EndId="1313" type="0">
</Transition>
</Transitions>
</Process>

