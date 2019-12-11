<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905">
<Parameters>
<Variable id="isOK" type="8" dir="1" data=""/>
<Variable id="CarType" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="24" right="470" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="2494" right="470" bottom="2526"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="95" ActivityType="13" flags="0" name="GetComd12orX1">
<Rect left="370" top="804" right="470" bottom="836"/>
<FunctionRef id="GetComd12orX1" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F200010436&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F201010436&quot;"/>
<Parameter id="x1Command" value="&quot;08000003F20000043600000000&quot;"/>
<Parameter id="x2Command" value="&quot;08000003F20100043600000000&quot;"/>
<Parameter id="nextStep" ret="nextStep"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="Sock close">
<Rect left="370" top="2354" right="470" bottom="2386"/>
<Script>engine.SockClose(tcphandle)</Script></Activity>
<Activity id="119" ActivityType="13" flags="0" name="扩展会话">
<Rect left="370" top="504" right="470" bottom="536"/>
<Line1Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1112" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="13" flags="0" name="BSD_SecurityAlgorithm">
<Rect left="370" top="574" right="470" bottom="606"/>
<Line1Text Enable="1" Text="安全访问"/>
<FunctionRef id="BSD_SecurityAlgorithm" model="LibGeneral">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="secMASK"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP872" type="8" flags="97"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="openTcp">
<Rect left="370" top="444" right="470" bottom="476"/>
<Script>--local rHost = "TCP:192.168.0.178:4001"
local rHost = "TCP:10.134.184.56:4001"
print("&lt;rHost&gt; :" .. tostring(rHost))
tcphandle = nil
tcphandle = engine.SockOpen(rHost,"",-1)

if (tcphandle == nil) then
	engine.LastError = 1
else
	engine.LastError = 0 
end
engine.Delay(500)

</Script><assessment no="2" name="DEP1906" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="13" flags="0" name="command1415">
<Rect left="370" top="934" right="470" bottom="966"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F200020436&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F201020436&quot;"/>
<Parameter id="recvTime" value="10000"/>
<Parameter id="returnResult" ret="returnResult"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="Step4">
<Rect left="660" top="804" right="760" bottom="836"/>
<Script></Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="多普勒检测结果信息">
<Rect left="1060" top="854" right="1160" bottom="886"/>
<Script>if (engine.DopplerIsCalibrationEnded() == true) then
	print("Calibration over!")
	engine.SharedVarSet("LoopBFin",true)
end

resultStr = engine.DopplerCalibrationEndedInfo()
if(resultStr == true) then
	print("resultOK")
else
	print("resultNOK")
end

engine.Delay(2000)

dValueS0Az = 0 
dValueS0EL = 0
dValueS1Az = 0
dValueS1EL = 0

while (dValueS0Az == 0 or dValueS0EL == 0 or dValueS1Az == 0 or dValueS1EL == 0) do
engine.Delay(500)

staS0Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLAzAngleOffset")
staS0EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLELOffsetAngle")
staS1Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLAzAngleOffset")
staS1EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLELOffsetAngle")
staLED = engine.DopplerGetLimitResultStatusValue("Sensor0Diag_error_HAL00_bu1_led_fault")

dValueS0Az = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLAzAngleOffset")
dValueS0EL = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLELOffsetAngle")
dValueS1Az = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLAzAngleOffset")
dValueS1EL = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLELOffsetAngle")

print("staS0Az:"..tostring(staS0Az))
print("staS0EL:"..tostring(staS0EL))
print("staS1Az:"..tostring(staS1Az))
print("staS1EL:"..tostring(staS1EL))
print("staLED:"..tostring(staLED))


print("dValueS0Az:"..tostring(dValueS0Az))
print("dValueS0EL:"..tostring(dValueS0EL))
print("dValueS1Az:"..tostring(dValueS1Az))
print("dValueS1EL:"..tostring(dValueS1EL))
end



if (tostring(staS0Az) == "1" and tostring(staS0EL) == "1" and tostring(staS1Az) == "1" and tostring(staS1EL) == "1" and tostring(staLED) == "1" ) then
	BSDret = 2
	engine.DialogBackColor = "Green";
        engine.SetLineText(1,"标定流程OK")
        engine.Delay(3000)
        engine.DialogBackColor = -1
else
	BSDret = 3
end

engine.SharedVarSet("BSDret",BSDret)
engine.SharedVarSet("S0Az",dValueS0Az)
engine.SharedVarSet("S0EL",dValueS0EL)
engine.SharedVarSet("S1Az",dValueS1Az)
engine.SharedVarSet("S1EL",dValueS1EL)
engine.SharedVarSet("LED",staLED)

if (staS0Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0Az = dValueS0Az - dValueS0Az%0.01
	if (Dis_dValueS0Az &gt; 0 )then
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
elseif (staS1Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1Az = dValueS1Az - dValueS1Az%0.01
	if (Dis_dValueS1Az &gt; 0 )then	
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
 elseif (staS0EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0EL = dValueS0EL - dValueS0EL%0.01
	if (Dis_dValueS0EL &gt; 0 )then	
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
        end
 elseif (staS1EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1EL = dValueS1EL - dValueS1EL%0.01
	if (Dis_dValueS1EL &gt; 0 )then	
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
          end
elseif(staLED == 0) then
	engine.DialogBackColor = "Red"
        print("后视镜LED NG")
        engine.Delay(5000)
        engine.DialogBackColor = -1
else
	
end

</Script></Activity>
<Activity id="139" ActivityType="3" flags="0" name="netCAN失败">
<Rect left="610" top="444" right="710" bottom="476"/>
<Script>engine.SetLineText(2,"netCAN 连接失败")
engine.SetLineText(3,"退出")
isOK = false
engine.SharedVarSet("BSDret",3)
engine.Delay(2000)
engine.LastError = 1;</Script><assessment no="21" name="DEP1906" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="扩展会话失败">
<Rect left="610" top="504" right="710" bottom="536"/>
<Script>engine.SetLineText(2,"扩展会话失败")
engine.SetLineText(3,"退出")
engine.SharedVarSet("BSDret",3)
isOK = false
engine.Delay(2000)
engine.LastError = 1;</Script><assessment no="25" name="DEP1112" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="安全访问失败">
<Rect left="610" top="574" right="710" bottom="606"/>
<Script>engine.SetLineText(2,"安全访问失败")
engine.SetLineText(3,"退出")
engine.SharedVarSet("BSDret",3)
isOK = false
engine.Delay(2000)
engine.LastError = 1;</Script><assessment no="26" name="DEP872" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="系统流程失败">
<Rect left="610" top="644" right="710" bottom="676"/>
<Script>engine.SetLineText(2,"系统流程失败")
engine.SetLineText(3,"退出")
engine.SharedVarSet("BSDret",3)
isOK = false
engine.Delay(2000)
engine.LastError = 1;</Script><assessment no="27" name="DEP2515" type="8" flags="97"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="A循环失败">
<Rect left="610" top="704" right="710" bottom="736"/>
<Script>engine.SetLineText(2,"A循环失败")
engine.SetLineText(3,"退出")
engine.SharedVarSet("BSDret",3)
isOK = false
engine.Delay(2000)
engine.LastError = 1;</Script><assessment no="28" name="DEP2516" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="5" flags="0" name="SystemFlowchart">
<Rect left="370" top="644" right="470" bottom="676"/>
<SubProcesses>
<SubProcess id="SystemFlowchart">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="CarType" value="CarType"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="147" ActivityType="5" flags="0" name="RawtargetFlowchart">
<Rect left="370" top="704" right="470" bottom="736"/>
<SubProcesses>
<SubProcess id="RawtargetFlowchart">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="CarType" value="CarType"/>
</Parameters>
</SubProcess>
<SubProcess id="LoopSockRevCommand">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="returnResult" ret="isOK"/>
<Parameter id="CarType" value="CarType"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="148" ActivityType="5" flags="0" name="UDTTestFlowchart">
<Rect left="370" top="1064" right="470" bottom="1096"/>
<SubProcesses>
<SubProcess id="UDTTestFlowchart">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="CarType" value="CarType"/>
</Parameters>
</SubProcess>
<SubProcess id="LoopRecvResult">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="ECU_OpenH7">
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
<Variable id="CAN_SND_ID" type="3" data="0x72B" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x731" description="CAN的接收ID"/>
</Variables>
<Rect left="370" top="314" right="470" bottom="346"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script><assessment no="1" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="ECU_OpenHS7">
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Rect left="240" top="314" right="340" bottom="346"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script><assessment no="1" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="安全MASK区分">
<Rect left="370" top="234" right="470" bottom="266"/>
<Script>if(CarType == "H7") then
	secMASK = 0xD3F102E4
elseif(CarType == "HS7") then
	secMASK = 0xDB0FAD20

end</Script></Activity>
<Activity id="152" ActivityType="3" flags="0" name="WriteResult">
<Rect left="370" top="1414" right="470" bottom="1446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="标定结果写入BSD"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel ="";
BSDret = engine.SharedVarGet("BSDret")

if (CarType == "H7") then
	resultSend = "\x01\x40\x08"..string.char(BSDret)
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,resultSend)
elseif (CarType == "HS7") then
	resultSend = "\x01\xE0\xD8"..string.char(BSDret)
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,resultSend)
else
end


resultSend = LibGeneral.hex2str(resultSend)
recvTel = LibGeneral.hex2str(recvTel)
engine.StatValue = resultSend .. "    ," ..recvTel</Script><assessment no="12" name="DEP2236" type="8" flags="97"/>
</Activity>
<Activity id="153" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1564" right="470" bottom="1596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x00\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="154" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1624" right="470" bottom="1656"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x00\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="155" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1684" right="470" bottom="1716"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x01\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="156" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1734" right="470" bottom="1766"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x01\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="157" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1794" right="470" bottom="1826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="158" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1844" right="470" bottom="1876"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="159" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1894" right="470" bottom="1926"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x04\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="160" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="1944" right="470" bottom="1976"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x04\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="161" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="2004" right="470" bottom="2036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x05\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="162" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="2054" right="470" bottom="2086"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x05\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="163" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="2114" right="470" bottom="2146"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x06\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="164" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="2164" right="470" bottom="2196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x02\x40\x06\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="165" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="2224" right="470" bottom="2256"/>
<Line2Text Enable="1" Text="清除故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP871" type="8" flags="97"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="统计主雷达水平角度">
<Rect left="1060" top="914" right="1160" bottom="946"/>
<Script>if (staS0Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0Az
else
	engine.LastError = 1
        engine.StatValue = dValueS0Az	
end
</Script><assessment no="6" name="DEP1908" type="8" flags="97"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="统计从雷达水平角度">
<Rect left="1060" top="964" right="1160" bottom="996"/>
<Script>if (staS1Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1Az
else
	engine.LastError = 1
        engine.StatValue = dValueS1Az
end
</Script><assessment no="7" name="DEP1909" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="统计主雷达垂直角度">
<Rect left="1060" top="1024" right="1160" bottom="1056"/>
<Script>if (staS0EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0EL
else
	engine.LastError = 1
        engine.StatValue = dValueS0EL
end
</Script><assessment no="8" name="DEP1910" type="8" flags="97"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="统计从雷达垂直角度">
<Rect left="1060" top="1084" right="1160" bottom="1116"/>
<Script>if (staS1EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1EL
else
	engine.LastError = 1
        engine.StatValue = dValueS1EL
end
</Script><assessment no="9" name="DEP1911" type="8" flags="97"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="统计LED">
<Rect left="1060" top="1144" right="1160" bottom="1176"/>
<Script>if (staLED == 1) then
	engine.LastError = 0
        engine.StatValue = staLED
else
	engine.LastError = 1
        engine.StatValue = staLED
end
</Script><assessment no="10" name="DEP1912" type="8" flags="97"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="远程控制开启">
<Rect left="370" top="94" right="470" bottom="126"/>
<TitleText Enable="1" Text="BSD标定"/>
<Script>engine.SetLineText(2,"开始远程控制初始化")
engine.DopplerInitCalibration("10.134.244.204","3000","10.134.184.9","3001")

if(engine.DopplerStartCalibration()) then
	 engine.LastError = 0
	print("------start calibration ok")
else
	 engine.LastError = 1
	print("------start calibration failed")
end

</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="远程控制完成">
<Rect left="370" top="154" right="470" bottom="186"/>
<Line1Text Enable="1" Text="远程控制开始"/>
<Script>isStarted = false

if(engine.DopplerIsCalibrationStarted()) then
	engine.SetLineText(2,"远程控制初始化完成")
        engine.Delay(1000)
         engine.LastError = 0
        print("already started")
        isStarted = true
 else
	engine.SetLineText(2,"远程控制初始化失败")
        engine.Delay(1000)
        engine.LastError = 1
	print("not start")
 end</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="远程控制失败">
<Rect left="530" top="154" right="630" bottom="186"/>
<Script>isOK = false
engine.SharedVarSet("BSDret",3)
engine.LastError = 1;</Script><assessment no="75" name="DEP2534" type="8" flags="97"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="close">
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Rect left="880" top="734" right="980" bottom="766"/>
<Script>engine.SockClose(tcphandle)
engine.EcuClose(vciHandle)</Script></Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="584" right="846" bottom="616"/>
</Activity>
<Activity id="180" ActivityType="3" flags="0" name="ECU Close">
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Rect left="370" top="2414" right="470" bottom="2446"/>
<Script>engine.EcuClose(vciHandle)</Script></Activity>
<Activity id="182" ActivityType="3" flags="0" name="结束OBD">
<Rect left="370" top="2284" right="470" bottom="2316"/>
<Script>engine.DopplerStopCalibration()</Script></Activity>
<Activity id="183" ActivityType="3" flags="0" name="初始化结果变量">
<Rect left="660" top="864" right="760" bottom="896"/>
<Script>staS0Az = -3
staS0EL = -3
staS1Az = -3
staS1EL = -3
staLED = -3
dValueS0Az = -3 
dValueS0EL = -3
dValueS1Az = -3
dValueS1EL = -3</Script></Activity>
<Activity id="184" ActivityType="3" flags="0" name="延时2S">
<Rect left="660" top="924" right="760" bottom="956"/>
<Script>engine.Delay(2000)</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="统计主雷达水平角度">
<Rect left="660" top="974" right="760" bottom="1006"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS0Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLAzAngleOffset")
	print("staS0Az:"..tostring(staS0Az))
until(staS0Az ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS0Az = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLAzAngleOffset")
	print("dValueS0Az:"..tostring(dValueS0Az))
until(dValueS0Az ~= -3 or nCount == 5)

if (staS0Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0Az
else
	engine.LastError = 1
        engine.StatValue = dValueS0Az
end
</Script><assessment no="6" name="DEP1908" type="8" flags="97"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="统计从雷达水平角度">
<Rect left="660" top="1034" right="760" bottom="1066"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS1Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLAzAngleOffset")
	print("staS1Az:"..tostring(staS1Az))
until(staS1Az ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS1Az = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLAzAngleOffset")
	print("dValueS1Az:"..tostring(dValueS1Az))
until(dValueS1Az ~= -3 or nCount == 5)


if (staS1Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1Az
else
	engine.LastError = 1
        engine.StatValue = dValueS1Az
end
</Script><assessment no="7" name="DEP1909" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="统计主雷达垂直角度">
<Rect left="660" top="1094" right="760" bottom="1126"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS0EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLELOffsetAngle")
	print("staS0EL:"..tostring(staS0EL))
until(staS0EL ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS0EL = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLELOffsetAngle")
	print("dValueS0EL:"..tostring(dValueS0EL))
until(dValueS0EL ~= -3 or nCount == 5)


if (staS0EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0EL
else
	engine.LastError = 1
        engine.StatValue = dValueS0EL
end
</Script><assessment no="8" name="DEP1910" type="8" flags="97"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="统计从雷达垂直角度">
<Rect left="660" top="1164" right="760" bottom="1196"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS1EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLELOffsetAngle")
	print("staS1EL:"..tostring(staS1EL))
until(staS1EL ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS1EL = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLELOffsetAngle")
	print("dValueS1EL:"..tostring(dValueS1EL))
until(dValueS1EL ~= -3 or nCount == 5)


if (staS1EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1EL
else
	engine.LastError = 1
        engine.StatValue = dValueS1EL
end
</Script><assessment no="9" name="DEP1911" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="统计LED检测结果">
<Rect left="660" top="1224" right="760" bottom="1256"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staLED = engine.DopplerGetLimitResultStatusValue("Sensor0Diag_error_HAL00_bu1_led_fault")
	print("staLED:"..tostring(staLED))
until(staLED ~= -3 or nCount == 5)



if (staLED == 1) then
	engine.LastError = 0
        engine.StatValue = "OK"..";GetLimitResult = "..tostring(staLED)
else
	engine.LastError = 1
        engine.StatValue = "NOK"..";GetLimitResult = "..tostring(staLED)
end
</Script><assessment no="10" name="DEP1912" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="统计检测总结果">
<Rect left="660" top="1284" right="760" bottom="1316"/>
<Script>if (tostring(staS0Az) == "1" and tostring(staS0EL) == "1" and tostring(staS1Az) == "1" and tostring(staS1EL) == "1" and tostring(staLED) == "1" ) then
	BSDret = 2
	engine.DialogBackColor = "Green";
        engine.SetLineText(1,"标定流程OK")
        engine.Delay(3000)
        engine.DialogBackColor = -1
else
	BSDret = 3
end</Script></Activity>
<Activity id="192" ActivityType="3" flags="0" name="存储结果数据">
<Rect left="660" top="1354" right="760" bottom="1386"/>
<Script>dValueS0Az = dValueS0Az - dValueS0Az % 0.01
dValueS0EL = dValueS0EL - dValueS0EL % 0.01
dValueS1Az = dValueS1Az - dValueS1Az % 0.01
dValueS1EL = dValueS1EL - dValueS1EL % 0.01



engine.SharedVarSet("BSDret",BSDret)
engine.SharedVarSet("S0Az",dValueS0Az)
engine.SharedVarSet("S0EL",dValueS0EL)
engine.SharedVarSet("S1Az",dValueS1Az)
engine.SharedVarSet("S1EL",dValueS1EL)
engine.SharedVarSet("LED",staLED)
</Script></Activity>
<Activity id="193" ActivityType="3" flags="1" name="不合格调整显示">
<Rect left="660" top="1414" right="760" bottom="1446"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>if (staS0Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0Az = dValueS0Az - dValueS0Az%0.01
	if (Dis_dValueS0Az &gt; 0 )then
		engine.SetLineText(0,"主水平NG:"..Dis_dValueS0Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(0,"主水平NG:"..Dis_dValueS0Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
elseif (staS1Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1Az = dValueS1Az - dValueS1Az%0.01
	if (Dis_dValueS1Az &gt; 0 )then	
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
 elseif (staS0EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0EL = dValueS0EL - dValueS0EL%0.01
	if (Dis_dValueS0EL &gt; 0 )then	
		engine.SetLineText(2,"主垂直NG:"..Dis_dValueS0EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(2,"主垂直NG:"..Dis_dValueS0EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
        end
 elseif (staS1EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1EL = dValueS1EL - dValueS1EL%0.01
	if (Dis_dValueS1EL &gt; 0 )then	
		engine.SetLineText(3,"从垂直NG:"..Dis_dValueS1EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(3,"从垂直NG:"..Dis_dValueS1EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
          end
elseif(staLED == 0) then
	engine.DialogBackColor = "Red"
        print("后视镜LED NG")
        engine.SetLineText(3,"后视镜LED检测不合格")
        engine.Delay(5000)
        engine.DialogBackColor = -1
else
	
end

</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="写入测量值">
<Rect left="370" top="1494" right="470" bottom="1526"/>
<Script>MAzValue = engine.SharedVarGet("S0Az")
MElValue = engine.SharedVarGet("S0EL")

SAzValue = engine.SharedVarGet("S1Az")
SElValue = engine.SharedVarGet("S1EL")


value1 = (MAzValue + 327.68) * 100
print("value1:"..value1)
byte1 = string.char(value1 / 0x100)
byte2 = string.char(bit32.band(value1,0xff))

value1 = (MElValue + 327.68) * 100
print("value2:"..value1)
byte3 = string.char(value1 / 0x100)
byte4 = string.char(bit32.band(value1,0xff))

value1 = (SAzValue + 327.68) * 100
print("value3:"..value1)
byte5 = string.char(value1 / 0x100)
byte6 = string.char(bit32.band(value1,0xff))

value1 = (SElValue + 327.68) * 100
print("value4:"..value1)
byte7 = string.char(value1 / 0x100)
byte8 = string.char(bit32.band(value1,0xff))

resultSend = "\x2A\x91"..byte1..byte2 ..byte3..byte4..byte5..byte6..byte7..byte8 


LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,resultSend)</Script><assessment no="13" name="DEP2319" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1494" right="316" bottom="1526"/>
</Activity>
<Activity id="196" ActivityType="13" flags="0" name="读故障码">
<Rect left="530" top="2224" right="630" bottom="2256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x09"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP887" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="530" top="2304" right="630" bottom="2336"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="3000"/>
<Parameter id="section" value="&quot;C079_BSD&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP887" type="8" flags="97"/>
</Activity>
<Activity id="198" ActivityType="13" flags="0" name="读故障码">
<Rect left="880" top="584" right="980" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x09"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP887" type="8" flags="97"/>
</Activity>
<Activity id="199" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="880" top="664" right="980" bottom="696"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="3000"/>
<Parameter id="section" value="&quot;C079_BSD&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP887" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="171" type="0">
</Transition>
<Transition StartId="95" EndId="122" type="1">
<Expression>nextStep == "step2"</Expression></Transition>
<Transition StartId="95" EndId="123" type="0">
</Transition>
<Transition StartId="116" EndId="180" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="3">
</Transition>
<Transition StartId="119" EndId="142" type="0">
</Transition>
<Transition StartId="120" EndId="146" type="3">
</Transition>
<Transition StartId="120" EndId="143" type="0">
</Transition>
<Transition StartId="121" EndId="119" type="3">
</Transition>
<Transition StartId="121" EndId="139" type="0">
</Transition>
<Transition StartId="122" EndId="148" type="0">
</Transition>
<Transition StartId="123" EndId="183" type="0">
</Transition>
<Transition StartId="124" EndId="166" type="0">
</Transition>
<Transition StartId="139" EndId="178" type="0">
</Transition>
<Transition StartId="142" EndId="178" type="0">
</Transition>
<Transition StartId="143" EndId="178" type="0">
</Transition>
<Transition StartId="144" EndId="178" type="0">
</Transition>
<Transition StartId="145" EndId="178" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="146" EndId="144" type="0">
</Transition>
<Transition StartId="147" EndId="95" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="147" EndId="145" type="0">
</Transition>
<Transition StartId="148" EndId="152" type="0">
</Transition>
<Transition StartId="149" EndId="121" type="3">
</Transition>
<Transition StartId="150" EndId="121" type="3">
</Transition>
<Transition StartId="151" EndId="150" type="1">
<Expression>CarType == "HS7"</Expression></Transition>
<Transition StartId="151" EndId="149" type="1">
<Expression>CarType == "H7"</Expression></Transition>
<Transition StartId="152" EndId="194" type="1">
<Expression>CarType == "HS7"</Expression></Transition>
<Transition StartId="152" EndId="195" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="162" type="0">
</Transition>
<Transition StartId="162" EndId="163" type="0">
</Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="196" type="0">
</Transition>
<Transition StartId="166" EndId="167" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="171" EndId="172" type="3">
</Transition>
<Transition StartId="171" EndId="173" type="0">
</Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="172" EndId="151" type="3">
</Transition>
<Transition StartId="178" EndId="198" type="0">
</Transition>
<Transition StartId="180" EndId="2" type="0">
</Transition>
<Transition StartId="182" EndId="116" type="0">
</Transition>
<Transition StartId="183" EndId="184" type="0">
</Transition>
<Transition StartId="184" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="186" type="0">
</Transition>
<Transition StartId="186" EndId="187" type="0">
</Transition>
<Transition StartId="187" EndId="188" type="0">
</Transition>
<Transition StartId="188" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="193" type="1">
<Expression>BSDret == 3</Expression></Transition>
<Transition StartId="192" EndId="152" type="0">
</Transition>
<Transition StartId="193" EndId="152" type="0">
</Transition>
<Transition StartId="194" EndId="153" type="0">
</Transition>
<Transition StartId="195" EndId="153" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="182" type="0">
</Transition>
<Transition StartId="198" EndId="199" type="0">
</Transition>
<Transition StartId="199" EndId="176" type="0">
</Transition>
</Transitions>
</Process>

