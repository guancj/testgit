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
<Rect left="420" top="44" right="520" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="930" top="1234" right="1030" bottom="1266"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="420" top="94" right="520" bottom="126"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="水温比对">
<Rect left="420" top="264" right="520" bottom="296"/>
<Script>recTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x03\x00")
wtrTemperature = string.byte(recTel:sub(4,4))
wtrTemperature = wtrTemperature * 0.75-48
print("发动机水温:"..wtrTemperature)</Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="车辆水温比对">
<Rect left="420" top="324" right="520" bottom="356"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="105"/>
<Parameter id="LowerLimit" value="65"/>
<Parameter id="MeasValue" value="wtrTemperature"/>
<Parameter id="RightViewText" value="&quot;水温&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="3"/>
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;度&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1355" ActivityType="3" flags="0" name="循环初始化">
<Rect left="420" top="204" right="520" bottom="236"/>
<Line2Text Enable="1" Text="读发动机水温65度以上"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1356" ActivityType="3" flags="0" name="普通节点">
<Rect left="560" top="264" right="660" bottom="296"/>
<Script>engine.Delay(100)</Script></Activity>
<Activity id="1357" ActivityType="3" flags="0" name="转速2500">
<Rect left="420" top="384" right="520" bottom="416"/>
<Line1Text Enable="1" Text="车速0km/h, 转速至2500rpm"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1358" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="420" top="614" right="520" bottom="646"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1359" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="444" right="676" bottom="476"/>
</Activity>
<Activity id="1360" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="614" right="676" bottom="646"/>
</Activity>
<Activity id="1361" ActivityType="3" flags="0" name="转速换算">
<Rect left="420" top="504" right="520" bottom="536"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1362" ActivityType="13" flags="0" name="读取转速">
<Rect left="420" top="444" right="520" bottom="476"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x02\x10&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1363" ActivityType="13" flags="0" name="车辆转速">
<Rect left="420" top="554" right="520" bottom="586"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
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
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP1570" type="8" flags="97"/>
</Activity>
<Activity id="1364" ActivityType="3" flags="0" name="车速换算">
<Rect left="420" top="794" right="520" bottom="826"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.01
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1365" ActivityType="3" flags="0" name="怠速5s">
<Rect left="420" top="674" right="520" bottom="706"/>
<Line1Text Enable="1" Text="车速0km/h, 怠速持续5s"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;</Script></Activity>
<Activity id="1366" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="420" top="1114" right="520" bottom="1146"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1367" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="734" right="656" bottom="766"/>
</Activity>
<Activity id="1368" ActivityType="13" flags="0" name="读取速度">
<Rect left="420" top="734" right="520" bottom="766"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x02\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1369" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="1114" right="656" bottom="1146"/>
</Activity>
<Activity id="1370" ActivityType="3" flags="0" name="转速换算">
<Rect left="420" top="974" right="520" bottom="1006"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1371" ActivityType="13" flags="0" name="读取转速">
<Rect left="420" top="914" right="520" bottom="946"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x02\x10&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1372" ActivityType="13" flags="0" name="车辆速度">
<Rect left="420" top="854" right="520" bottom="886"/>
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
</Activity>
<Activity id="1373" ActivityType="13" flags="0" name="车辆转速">
<Rect left="420" top="1044" right="520" bottom="1076"/>
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
</Activity>
<Activity id="1374" ActivityType="3" flags="0" name="车速换算">
<Rect left="930" top="244" right="1030" bottom="276"/>
<Script>--vehicle_speed = string.sub(DVciResult_speed,4,5);
--vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
--vehicle_speed = vehicle_speed * 0.0078125
vehicle_speed = ReadSpeed_FL
</Script></Activity>
<Activity id="1375" ActivityType="3" flags="0" name="保持60km30s">
<Rect left="930" top="124" right="1030" bottom="156"/>
<Line1Text Enable="1" Text="保持车速60km/h 持续30s"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil

curtRevTel = ""
oldRevTel = ""</Script></Activity>
<Activity id="1376" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="930" top="384" right="1030" bottom="416"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1377" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="174" right="1146" bottom="206"/>
</Activity>
<Activity id="1378" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="384" right="1146" bottom="416"/>
</Activity>
<Activity id="1379" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="124" right="806" bottom="156"/>
</Activity>
<Activity id="1380" ActivityType="13" flags="0" name="车辆速度">
<Rect left="930" top="314" right="1030" bottom="346"/>
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
<Parameter id="TimeOut" value="600"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1571" type="8" flags="97"/>
</Activity>
<Activity id="1381" ActivityType="3" flags="0" name="IDT速度">
<Rect left="930" top="174" right="1030" bottom="206"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local factor = 0.01


curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")       
tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
tmpFL2 = string.byte(curtRevTel:sub(14,14))
ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor
curtRevTel = ReadSpeed_FL

if (curtRevTel ~= oldRevTel) then

	engine.println("IDT 读取车速 vehicle_speed ##"..curtRevTel)

	oldRevTel = curtRevTel

end
		


</Script></Activity>
<Activity id="1382" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="1164" right="806" bottom="1196"/>
</Activity>
<Activity id="1383" ActivityType="4" flags="0" name="路由节点">
<Rect left="454" top="1164" right="486" bottom="1196"/>
</Activity>
<Activity id="1391" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="930" top="1154" right="1030" bottom="1186"/>
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
</Activity>
<Activity id="1402" ActivityType="3" flags="0" name="车速换算">
<Rect left="930" top="584" right="1030" bottom="616"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.01
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1403" ActivityType="3" flags="0" name="降速到20km">
<Rect left="930" top="464" right="1030" bottom="496"/>
<Line1Text Enable="1" Text="松油门不踩刹车减速到20km/h"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1404" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="930" top="724" right="1030" bottom="756"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1405" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="524" right="1136" bottom="556"/>
</Activity>
<Activity id="1406" ActivityType="13" flags="0" name="读取速度">
<Rect left="930" top="524" right="1030" bottom="556"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x02\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1407" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="724" right="1136" bottom="756"/>
</Activity>
<Activity id="1408" ActivityType="13" flags="0" name="车辆速度">
<Rect left="930" top="654" right="1030" bottom="686"/>
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
<assessment no="15" name="DEP1572" type="8" flags="97"/>
</Activity>
<Activity id="1409" ActivityType="3" flags="0" name="车速换算">
<Rect left="930" top="924" right="1030" bottom="956"/>
<Script>vehicle_speed = string.sub(DVciResult_speed,4,5);
vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
vehicle_speed = vehicle_speed * 0.01
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1410" ActivityType="3" flags="0" name="挂空挡等车静止">
<Rect left="930" top="804" right="1030" bottom="836"/>
<Line1Text Enable="1" Text="挂N档"/>
<Line2Text Enable="1" Text="等车静止"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil
</Script></Activity>
<Activity id="1411" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="930" top="1054" right="1030" bottom="1086"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1412" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="864" right="1226" bottom="896"/>
</Activity>
<Activity id="1413" ActivityType="13" flags="0" name="读取速度">
<Rect left="930" top="864" right="1030" bottom="896"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x02\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult_speed"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1414" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="1054" right="1226" bottom="1086"/>
</Activity>
<Activity id="1415" ActivityType="13" flags="0" name="车辆速度">
<Rect left="930" top="984" right="1030" bottom="1016"/>
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
<Activity id="1416" ActivityType="3" flags="0" name="清DTC">
<Rect left="420" top="144" right="520" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP144" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1416" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="1356" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="5" EndId="1357" type="0">
</Transition>
<Transition StartId="1355" EndId="4" type="0">
</Transition>
<Transition StartId="1356" EndId="4" type="0">
</Transition>
<Transition StartId="1357" EndId="1362" type="0">
</Transition>
<Transition StartId="1358" EndId="1360" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1358" EndId="1365" type="0">
</Transition>
<Transition StartId="1359" EndId="1362" type="0">
</Transition>
<Transition StartId="1360" EndId="1359" type="0">
</Transition>
<Transition StartId="1361" EndId="1363" type="0">
</Transition>
<Transition StartId="1362" EndId="1361" type="0">
</Transition>
<Transition StartId="1363" EndId="1358" type="0">
</Transition>
<Transition StartId="1364" EndId="1372" type="0">
</Transition>
<Transition StartId="1365" EndId="1368" type="0">
</Transition>
<Transition StartId="1366" EndId="1369" type="1">
<Expression>FinishFlag_1 ==  false or FinishFlag_2 ==  false</Expression></Transition>
<Transition StartId="1366" EndId="1383" type="0">
</Transition>
<Transition StartId="1367" EndId="1368" type="0">
</Transition>
<Transition StartId="1368" EndId="1364" type="0">
</Transition>
<Transition StartId="1369" EndId="1367" type="0">
</Transition>
<Transition StartId="1370" EndId="1373" type="0">
</Transition>
<Transition StartId="1371" EndId="1370" type="0">
</Transition>
<Transition StartId="1372" EndId="1371" type="0">
</Transition>
<Transition StartId="1373" EndId="1366" type="0">
</Transition>
<Transition StartId="1374" EndId="1380" type="0">
</Transition>
<Transition StartId="1375" EndId="1381" type="0">
</Transition>
<Transition StartId="1376" EndId="1378" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1376" EndId="1403" type="0">
</Transition>
<Transition StartId="1377" EndId="1381" type="0">
</Transition>
<Transition StartId="1378" EndId="1377" type="0">
</Transition>
<Transition StartId="1379" EndId="1375" type="0">
</Transition>
<Transition StartId="1380" EndId="1376" type="0">
</Transition>
<Transition StartId="1381" EndId="1374" type="0">
</Transition>
<Transition StartId="1382" EndId="1379" type="0">
</Transition>
<Transition StartId="1383" EndId="1382" type="0">
</Transition>
<Transition StartId="1391" EndId="2" type="0">
</Transition>
<Transition StartId="1402" EndId="1408" type="0">
</Transition>
<Transition StartId="1403" EndId="1406" type="0">
</Transition>
<Transition StartId="1404" EndId="1407" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1404" EndId="1410" type="0">
</Transition>
<Transition StartId="1405" EndId="1406" type="0">
</Transition>
<Transition StartId="1406" EndId="1402" type="0">
</Transition>
<Transition StartId="1407" EndId="1405" type="0">
</Transition>
<Transition StartId="1408" EndId="1404" type="0">
</Transition>
<Transition StartId="1409" EndId="1415" type="0">
</Transition>
<Transition StartId="1410" EndId="1413" type="0">
</Transition>
<Transition StartId="1411" EndId="1414" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1411" EndId="1391" type="0">
</Transition>
<Transition StartId="1412" EndId="1413" type="0">
</Transition>
<Transition StartId="1413" EndId="1409" type="0">
</Transition>
<Transition StartId="1414" EndId="1412" type="0">
</Transition>
<Transition StartId="1415" EndId="1411" type="0">
</Transition>
<Transition StartId="1416" EndId="1355" type="0">
</Transition>
</Transitions>
</Process>

