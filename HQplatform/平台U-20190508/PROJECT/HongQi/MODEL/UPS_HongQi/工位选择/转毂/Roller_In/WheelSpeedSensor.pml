<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1603" pbltext="DEP1508">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="isOK" type="3" dir="1" data="0"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CANId"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 轮速传感器检测&quot;"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
<Variable id="Speed_FL" type="5" data="0.0" description="左前轮的速度"/>
<Variable id="Speed_FR" type="5" data="0.0" description="右前轮的速度"/>
<Variable id="Speed_RL" type="5" data="0.0" description="左后轮的速度"/>
<Variable id="Speed_RR" type="5" data="0.0" description="右后轮的速度"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="24" right="330" bottom="56"/>
<Script></Script><TitleText Enable="1" Text="轮速传感器检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="挂空挡，释放刹车"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="3184" right="330" bottom="3216"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="13" ActivityType="5" flags="0" name="速度检查">
<Rect left="230" top="1804" right="330" bottom="1836"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="3.0"/>
<Parameter id="Target_FR" value="6.0"/>
<Parameter id="Target_RL" value="9.0"/>
<Parameter id="Target_RR" value="12.0"/>
<Parameter id="DlgText" value="&quot;3/6/9/12速度设置&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="16" ActivityType="5" flags="0" name="36912速度">
<Rect left="560" top="54" right="660" bottom="86"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="withEngine" value="true"/>
<Parameter id="driveEngine" value="true"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="3.0"/>
<Parameter id="speedFR" value="6.0"/>
<Parameter id="speedRL" value="9.0"/>
<Parameter id="speedRR" value="12.0"/>
<Parameter id="torqueFL" value="3000"/>
<Parameter id="torqueFR" value="3000"/>
<Parameter id="torqueRL" value="3000"/>
<Parameter id="torqueRR" value="3000"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="等待">
<Rect left="230" top="1904" right="330" bottom="1936"/>
<Script>engine.Delay(3000)</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="缓慢踩刹车">
<Rect left="230" top="2924" right="330" bottom="2956"/>
<Line1Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="22" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="230" top="184" right="330" bottom="216"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="13" flags="0" name="切换诊断模式">
<Rect left="230" top="234" right="330" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="305" ActivityType="13" flags="0" name="22 F182">
<Rect left="230" top="414" right="330" bottom="446"/>
<TitleText Enable="1" Text="轮速传感器测试"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取数据信息区域版本"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x82&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="306" ActivityType="13" flags="0" name="禁用速度限制和阀组继电器关闭">
<Rect left="230" top="344" right="330" bottom="376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xFF\xA0\x03\x00\x60\x00\x00\x00\x60\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1510" type="8" flags="97"/>
</Activity>
<Activity id="1227" ActivityType="13" flags="0" name="22 F187">
<Rect left="230" top="514" right="330" bottom="546"/>
<Line2Text Enable="1" Text="读取零件号"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1228" ActivityType="13" flags="0" name="22 F190">
<Rect left="230" top="614" right="330" bottom="646"/>
<Line2Text Enable="1" Text="读取VIN码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x90&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1229" ActivityType="3" flags="0" name="F182 统计">
<Rect left="230" top="464" right="330" bottom="496"/>
<Script>DString_F182 = string.sub(DVciResult,4,-1);
engine.println("###String_F182##"..tostring(DString_F182));
engine.StatValue = tostring(DString_F182);</Script><assessment no="5" name="DEP1511" type="8" flags="97"/>
</Activity>
<Activity id="1230" ActivityType="3" flags="0" name="F187 统计">
<Rect left="230" top="564" right="330" bottom="596"/>
<Script>DString_F187 = string.sub(DVciResult,4,-1);
engine.println("###DString_F187##"..tostring(DString_F187));
engine.StatValue = tostring(DString_F187);</Script><assessment no="6" name="DEP1512" type="8" flags="97"/>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="F190统计">
<Rect left="230" top="664" right="330" bottom="696"/>
<Script>DString_F190 = string.sub(DVciResult,4,-1);
engine.println("###DString_F190##"..tostring(DString_F190));
engine.StatValue = tostring(DString_F190);</Script><assessment no="7" name="DEP272" type="8" flags="97"/>
</Activity>
<Activity id="1232" ActivityType="13" flags="0" name="22 F194">
<Rect left="230" top="714" right="330" bottom="746"/>
<Line2Text Enable="1" Text="读取软件版本"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x94&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1233" ActivityType="3" flags="0" name="F190统计">
<Rect left="230" top="764" right="330" bottom="796"/>
<Script>DString_F194 = string.sub(DVciResult,4,-1);
engine.println("### DString_F194 ##"..tostring(DString_F194));
engine.StatValue = tostring(DString_F194);</Script><assessment no="9" name="DEP270" type="8" flags="97"/>
</Activity>
<Activity id="1234" ActivityType="13" flags="0" name="22 F195">
<Rect left="230" top="814" right="330" bottom="846"/>
<Line2Text Enable="1" Text="读取软件号"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x95&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1235" ActivityType="3" flags="0" name="F195统计">
<Rect left="230" top="864" right="330" bottom="896"/>
<Script>DString_F195 = string.sub(DVciResult,4,-1);
engine.println("### DString_F195 ##"..tostring(DString_F195));
engine.StatValue = tostring(DString_F195);</Script><assessment no="10" name="DEP269" type="8" flags="97"/>
</Activity>
<Activity id="1236" ActivityType="13" flags="0" name="22 F19D">
<Rect left="230" top="914" right="330" bottom="946"/>
<Line2Text Enable="1" Text="读取控制器初始化日期"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x9D&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1237" ActivityType="3" flags="0" name="F19D统计">
<Rect left="230" top="964" right="330" bottom="996"/>
<Script>DString_F19D = string.sub(DVciResult,4,-1);
DString_F19D = LibGeneral.hex2str(DString_F19D)
engine.println("### DString_F19D ##"..tostring(DString_F19D));
engine.StatValue = tostring(DString_F19D);</Script><assessment no="11" name="DEP1513" type="8" flags="97"/>
</Activity>
<Activity id="1241" ActivityType="13" flags="0" name="抽真空加注过程比对">
<Rect left="40" top="1224" right="140" bottom="1256"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;AA&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;抽真空加注字节&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP1514" type="8" flags="97"/>
</Activity>
<Activity id="1244" ActivityType="13" flags="0" name="读取抽真空加注过程字节">
<Rect left="230" top="1044" right="330" bottom="1076"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xFD\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP1514" type="8" flags="97"/>
</Activity>
<Activity id="1247" ActivityType="3" flags="0" name="检测系统状态评估">
<Rect left="230" top="1504" right="330" bottom="1536"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 FD02 ##"..DVciResult);</Script></Activity>
<Activity id="1248" ActivityType="3" flags="0" name="InitTest">
<Rect left="230" top="1364" right="330" bottom="1396"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1249" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="230" top="1574" right="330" bottom="1606"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;01&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;检测系统状态评估&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP1515" type="8" flags="97"/>
</Activity>
<Activity id="1250" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="230" top="1634" right="330" bottom="1666"/>
<Script></Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="1524" right="436" bottom="1556"/>
</Activity>
<Activity id="1252" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="230" top="1434" right="330" bottom="1466"/>
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
<Activity id="1256" ActivityType="13" flags="0" name="轮速传感器测试">
<Rect left="230" top="1964" right="330" bottom="1996"/>
<TitleText Enable="1" Text="轮速传感器测试"/>
<Line1Text Enable="1" Text="基础设置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x05\x01\x2C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP1518" type="8" flags="97"/>
</Activity>
<Activity id="1262" ActivityType="3" flags="0" name="轮速测试结果评估">
<Rect left="230" top="2124" right="330" bottom="2156"/>
<Script>DVciResult = string.sub(DVciResult_wws,5,5);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 读取轮速 3103F005 ##"..DVciResult);</Script></Activity>
<Activity id="1263" ActivityType="3" flags="0" name="InitTest">
<Rect left="230" top="2014" right="330" bottom="2046"/>
<Script>engine.Delay(300)
Pram_1 = nil;</Script></Activity>
<Activity id="1264" ActivityType="13" flags="0" name="Status_Check_view_String">
<Rect left="230" top="2174" right="330" bottom="2206"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;01&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;读取轮速测试结果&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP1519" type="8" flags="105"/>
</Activity>
<Activity id="1265" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="230" top="2234" right="330" bottom="2266"/>
<Script></Script></Activity>
<Activity id="1266" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2124" right="406" bottom="2156"/>
</Activity>
<Activity id="1267" ActivityType="13" flags="0" name="读取速度">
<Rect left="230" top="2064" right="330" bottom="2096"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x03\xF0\x05&apos;"/>
<Parameter id="recvTel" ret="DVciResult_wws"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1281" ActivityType="3" flags="0" name="基础调整结束后截取速度">
<Rect left="230" top="2294" right="330" bottom="2326"/>
<Script>--FL
recvbufFL_Max = string.sub(DVciResult_wws,6,7);
SpeedFL_Max = LibGeneral.binStr2Int(recvbufFL_Max)
SpeedFL_Max = SpeedFL_Max * 3.6 / 64
recvbufFL_Min = string.sub(DVciResult_wws,8,9);
SpeedFL_Min = LibGeneral.binStr2Int(recvbufFL_Min)
SpeedFL_Min = SpeedFL_Min * 3.6 /64
print("FL Wheel sensor Max:"..SpeedFL_Max)
print("FL Wheel sensor Min:"..SpeedFL_Min)
--FR
recvbufFR_Max = string.sub(DVciResult_wws,10,11);
SpeedFR_Max = LibGeneral.binStr2Int(recvbufFR_Max)
SpeedFR_Max = SpeedFR_Max * 3.6 /64
recvbufFR_Min = string.sub(DVciResult_wws,12,13);
SpeedFR_Min = LibGeneral.binStr2Int(recvbufFR_Min)
SpeedFR_Min = SpeedFR_Min * 3.6 / 64
print("FR Wheel sensor Max:"..SpeedFR_Max)
print("FR Wheel sensor Min:"..SpeedFR_Min)
--RL
recvbufRL_Max = string.sub(DVciResult_wws,14,15);
SpeedRL_Max = LibGeneral.binStr2Int(recvbufRL_Max)
SpeedRL_Max = SpeedRL_Max * 3.6 / 64
recvbufRL_Min = string.sub(DVciResult_wws,16,17);
SpeedRL_Min = LibGeneral.binStr2Int(recvbufRL_Min)
SpeedRL_Min = SpeedRL_Min * 3.6 / 64
print("RL Wheel sensor Max:"..SpeedRL_Max)
print("RL Wheel sensor Min:"..SpeedRL_Min)
--RR
recvbufRR_Max = string.sub(DVciResult_wws,18,19);
SpeedRR_Max = LibGeneral.binStr2Int(recvbufRR_Max)
SpeedRR_Max = SpeedRR_Max * 3.6 / 64
recvbufRR_Min = string.sub(DVciResult_wws,20,21);
SpeedRR_Min = LibGeneral.binStr2Int(recvbufRR_Min)
SpeedRR_Min = SpeedRR_Min * 3.6 / 64
print("RR Wheel sensor Max:"..SpeedRR_Max)
print("RR Wheel sensor Min:"..SpeedRR_Min)

Pram_1 = nil
Pram_2 = nil
Pram_3 = nil
Pram_4 = nil
Pram_5 = nil
Pram_6 = nil
Pram_7 = nil
Pram_8 = nil</Script></Activity>
<Activity id="1291" ActivityType="3" flags="0" name="空挡确认">
<Rect left="690" top="54" right="790" bottom="86"/>
<TitleText Enable="1" Text="轮速传感器检测"/>
<Line3Text Enable="1" Text="挂空挡，释放刹车"/>
<Line4Text Enable="1" Text="请点击确定"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1292" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="230" top="2854" right="330" bottom="2886"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1293" ActivityType="13" flags="0" name="左前最大速度">
<Rect left="800" top="2264" right="900" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="3.3"/>
<Parameter id="LowerLimit" value="2.7"/>
<Parameter id="MeasValue" value="SpeedFL_Max"/>
<Parameter id="RightViewText" value="&quot;左前最大速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP1521" type="8" flags="97"/>
</Activity>
<Activity id="1294" ActivityType="13" flags="0" name="左前最小速度">
<Rect left="800" top="2324" right="900" bottom="2356"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="3.3"/>
<Parameter id="LowerLimit" value="2.7"/>
<Parameter id="MeasValue" value="SpeedFL_Min"/>
<Parameter id="RightViewText" value="&quot;左前最小速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1520" type="8" flags="97"/>
</Activity>
<Activity id="1295" ActivityType="13" flags="0" name="右前最大速度">
<Rect left="800" top="2384" right="900" bottom="2416"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="6.6"/>
<Parameter id="LowerLimit" value="5.4"/>
<Parameter id="MeasValue" value="SpeedFR_Max"/>
<Parameter id="RightViewText" value="&quot;右前最大速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1523" type="8" flags="97"/>
</Activity>
<Activity id="1296" ActivityType="13" flags="0" name="右前最小速度">
<Rect left="800" top="2444" right="900" bottom="2476"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="6.6"/>
<Parameter id="LowerLimit" value="5.4"/>
<Parameter id="MeasValue" value="SpeedFR_Min"/>
<Parameter id="RightViewText" value="&quot;右前最小速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP1522" type="8" flags="97"/>
</Activity>
<Activity id="1297" ActivityType="13" flags="0" name="左后最大速度">
<Rect left="790" top="2524" right="890" bottom="2556"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="9.9"/>
<Parameter id="LowerLimit" value="8.1"/>
<Parameter id="MeasValue" value="SpeedRL_Max"/>
<Parameter id="RightViewText" value="&quot;左后最大速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP1525" type="8" flags="97"/>
</Activity>
<Activity id="1298" ActivityType="13" flags="0" name="左后最小速度">
<Rect left="790" top="2584" right="890" bottom="2616"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="9.9"/>
<Parameter id="LowerLimit" value="8.1"/>
<Parameter id="MeasValue" value="SpeedRL_Min"/>
<Parameter id="RightViewText" value="&quot;左后最小速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP1524" type="8" flags="97"/>
</Activity>
<Activity id="1299" ActivityType="13" flags="0" name="右后最大速度">
<Rect left="790" top="2644" right="890" bottom="2676"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="13.2"/>
<Parameter id="LowerLimit" value="10.8"/>
<Parameter id="MeasValue" value="SpeedRR_Max"/>
<Parameter id="RightViewText" value="&quot;右后最大速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP1527" type="8" flags="97"/>
</Activity>
<Activity id="1300" ActivityType="13" flags="0" name="右后最小速度">
<Rect left="790" top="2704" right="890" bottom="2736"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="13.2"/>
<Parameter id="LowerLimit" value="10.8"/>
<Parameter id="MeasValue" value="SpeedRR_Min"/>
<Parameter id="RightViewText" value="&quot;右后最小速度&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP1526" type="8" flags="97"/>
</Activity>
<Activity id="1301" ActivityType="5" flags="0" name="四轮轮速控制">
<Rect left="230" top="1694" right="330" bottom="1726"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="3.0"/>
<Parameter id="speedFR" value="6.0"/>
<Parameter id="speedRL" value="9.0"/>
<Parameter id="speedRR" value="12.0"/>
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
<Activity id="1302" ActivityType="3" flags="0" name="毂静止检查">
<Rect left="230" top="74" right="330" bottom="106"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01
engine.LastError = 1
repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	
        
	if (curtRevTel ~= oldRevTel) then
		print("4毂速度获取报文:"..LibGeneral.hex2str(curtRevTel))
		oldRevTel = curtRevTel	
        
		tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
		tmpFL2 = string.byte(curtRevTel:sub(14,14))
		tmpFR1 = string.byte(curtRevTel:sub(15,15)) 
		tmpFR2 = string.byte(curtRevTel:sub(16,16))

		tmpRL1 = string.byte(curtRevTel:sub(17,17)) 
		tmpRL2 = string.byte(curtRevTel:sub(18,18))
		tmpRR1 = string.byte(curtRevTel:sub(19,19)) 
		tmpRR2 = string.byte(curtRevTel:sub(20,20))

		ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor
		ReadSpeed_FR = LibIDT.idthilo2signed(tmpFR1,tmpFR2) * factor
		ReadSpeed_RL = LibIDT.idthilo2signed(tmpRL1,tmpRL2) * factor
		ReadSpeed_RR = LibIDT.idthilo2signed(tmpRR1,tmpRR2) * factor
                
                engine.SetLineText(0,"左前:"..ReadSpeed_FL)
		engine.SetLineText(1,"右前:"..ReadSpeed_FR)
		engine.SetLineText(2,"左后:"..ReadSpeed_RL)
		engine.SetLineText(3,"右后:"..ReadSpeed_RR)
	end	
        
	if (ReadSpeed_FL == 0 and ReadSpeed_FR == 0 and ReadSpeed_RL == 0 and ReadSpeed_RR == 0) then
		brk = 1
                engine.LastError = 0
	end
	TimeDiff = os.difftime(os.time(),TimeStart)
		
until (brk == 1 or TimeDiff &gt; 10)

if (TimeDiff &gt; 10) then
	Result = 1
        print ("10s内 毂速并没有降为0!!")
end</Script><assessment no="1" name="DEP1509" type="8" flags="97"/>
</Activity>
<Activity id="1303" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="230" top="2994" right="330" bottom="3026"/>
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
<Activity id="1304" ActivityType="3" flags="0" name="检查毂速为0">
<Rect left="230" top="3114" right="330" bottom="3146"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01
engine.LastError = 1
repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	
        
	if (curtRevTel ~= oldRevTel) then
		print("4毂速度获取报文:"..LibGeneral.hex2str(curtRevTel))
		oldRevTel = curtRevTel	
        
		tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
		tmpFL2 = string.byte(curtRevTel:sub(14,14))
		tmpFR1 = string.byte(curtRevTel:sub(15,15)) 
		tmpFR2 = string.byte(curtRevTel:sub(16,16))

		tmpRL1 = string.byte(curtRevTel:sub(17,17)) 
		tmpRL2 = string.byte(curtRevTel:sub(18,18))
		tmpRR1 = string.byte(curtRevTel:sub(19,19)) 
		tmpRR2 = string.byte(curtRevTel:sub(20,20))

		ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor
		ReadSpeed_FR = LibIDT.idthilo2signed(tmpFR1,tmpFR2) * factor
		ReadSpeed_RL = LibIDT.idthilo2signed(tmpRL1,tmpRL2) * factor
		ReadSpeed_RR = LibIDT.idthilo2signed(tmpRR1,tmpRR2) * factor
	end	
        
	if (ReadSpeed_FL == 0 and ReadSpeed_FR == 0 and ReadSpeed_RL == 0 and ReadSpeed_RR == 0) then
		brk = 1
                engine.LastError = 0
	end
	TimeDiff = os.difftime(os.time(),TimeStart)
		
until (brk == 1 or TimeDiff &gt; 10)

if (TimeDiff &gt; 10) then
	Result = 1
        print ("10s内 毂速并没有降为0!!")
end</Script><assessment no="28" name="DEP1509" type="8" flags="97"/>
</Activity>
<Activity id="1305" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="490" top="234" right="590" bottom="266"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1307" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="410" top="1634" right="510" bottom="1666"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1308" ActivityType="3" flags="0" name="统计IDT错误">
<Rect left="410" top="1694" right="510" bottom="1726"/>
<Script>isOK = 3

engine.LastError = 1
engine.StatValue = "Wheel speed sensor check service failure."
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script><assessment no="15" name="DEP1516" type="8" flags="97"/>
</Activity>
<Activity id="1309" ActivityType="3" flags="0" name="统计四轮轮速控制">
<Rect left="230" top="1754" right="330" bottom="1786"/>
<Script>engine.LastError = 0
engine.StatValue = "Wheel speed sensor check service Successful."</Script><assessment no="15" name="DEP1516" type="8" flags="97"/>
</Activity>
<Activity id="1310" ActivityType="3" flags="0" name="统计IDT错误">
<Rect left="410" top="1804" right="510" bottom="1836"/>
<Script>isOK = 3
engine.LastError = 1
engine.StatValue = "Wheel speed sensor 3,6,9,12km check  failure."
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script><assessment no="16" name="DEP1517" type="8" flags="97"/>
</Activity>
<Activity id="1311" ActivityType="3" flags="0" name="统计四轮轮速检查">
<Rect left="230" top="1854" right="330" bottom="1886"/>
<Script>engine.LastError = 0
engine.StatValue = "Wheel speed sensor 3,6,9,12km check  successful."</Script><assessment no="16" name="DEP1517" type="8" flags="97"/>
</Activity>
<Activity id="1312" ActivityType="3" flags="0" name="统计IDT错误">
<Rect left="370" top="2994" right="470" bottom="3026"/>
<Script>isOK = 3
engine.LastError = 1
engine.StatValue = "Wheel speed sensor check  stop Roll  service failure"
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script><assessment no="27" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="1313" ActivityType="3" flags="0" name="统计毂停止">
<Rect left="230" top="3054" right="330" bottom="3086"/>
<Script>engine.LastError = 0
engine.StatValue = "Wheel speed sensor check  stop Roll service successful"</Script><assessment no="27" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="1314" ActivityType="13" flags="0" name="左前最大速度">
<Rect left="230" top="2354" right="330" bottom="2386"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedFL_Max"/>
<Parameter id="Utg" value="2.7"/>
<Parameter id="Otg" value="3.3"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP1521" type="8" flags="105"/>
</Activity>
<Activity id="1316" ActivityType="13" flags="0" name="左前最大速度">
<Rect left="230" top="2414" right="330" bottom="2446"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedFL_Min"/>
<Parameter id="Utg" value="2.7"/>
<Parameter id="Otg" value="3.3"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1520" type="8" flags="105"/>
</Activity>
<Activity id="1317" ActivityType="13" flags="0" name="右前最大速度">
<Rect left="230" top="2474" right="330" bottom="2506"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedFR_Max"/>
<Parameter id="Utg" value="5.4"/>
<Parameter id="Otg" value="6.6"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1523" type="8" flags="105"/>
</Activity>
<Activity id="1318" ActivityType="13" flags="0" name="右前最小速度">
<Rect left="230" top="2534" right="330" bottom="2566"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedFR_Min"/>
<Parameter id="Utg" value="5.4"/>
<Parameter id="Otg" value="6.6"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP1522" type="8" flags="105"/>
</Activity>
<Activity id="1319" ActivityType="13" flags="0" name="左后最大速度">
<Rect left="230" top="2594" right="330" bottom="2626"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedRL_Max"/>
<Parameter id="Utg" value="8.1"/>
<Parameter id="Otg" value="9.9"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP1525" type="8" flags="105"/>
</Activity>
<Activity id="1320" ActivityType="13" flags="0" name="左后最小速度">
<Rect left="230" top="2654" right="330" bottom="2686"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedRL_Min"/>
<Parameter id="Utg" value="8.1"/>
<Parameter id="Otg" value="9.9"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP1524" type="8" flags="105"/>
</Activity>
<Activity id="1321" ActivityType="13" flags="0" name="右后最大速度">
<Rect left="230" top="2714" right="330" bottom="2746"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedRR_Max"/>
<Parameter id="Utg" value="10.8"/>
<Parameter id="Otg" value="13.2"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP1527" type="8" flags="105"/>
</Activity>
<Activity id="1323" ActivityType="13" flags="0" name="右后最小速度">
<Rect left="230" top="2774" right="330" bottom="2806"/>
<FunctionRef id="FloatToleranceCheck" model="LibGeneral">
<Parameters>
<Parameter id="ActualValue" value="SpeedRR_Max"/>
<Parameter id="Utg" value="10.8"/>
<Parameter id="Otg" value="13.2"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP1526" type="8" flags="105"/>
</Activity>
<Activity id="1324" ActivityType="5" flags="0" name="读档位">
<Rect left="230" top="124" right="330" bottom="156"/>
<SubProcesses>
<SubProcess id="C131_ATcheckN">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1302" type="0">
</Transition>
<Transition StartId="13" EndId="1311" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="13" EndId="1310" type="0">
</Transition>
<Transition StartId="18" EndId="1256" type="0">
</Transition>
<Transition StartId="20" EndId="1303" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="1305" type="4">
</Transition>
<Transition StartId="23" EndId="306" type="0">
</Transition>
<Transition StartId="305" EndId="1229" type="0">
</Transition>
<Transition StartId="306" EndId="305" type="0">
</Transition>
<Transition StartId="1227" EndId="1230" type="0">
</Transition>
<Transition StartId="1228" EndId="1231" type="0">
</Transition>
<Transition StartId="1229" EndId="1227" type="0">
</Transition>
<Transition StartId="1230" EndId="1228" type="0">
</Transition>
<Transition StartId="1231" EndId="1232" type="0">
</Transition>
<Transition StartId="1232" EndId="1233" type="0">
</Transition>
<Transition StartId="1233" EndId="1234" type="0">
</Transition>
<Transition StartId="1234" EndId="1235" type="0">
</Transition>
<Transition StartId="1235" EndId="1236" type="0">
</Transition>
<Transition StartId="1236" EndId="1237" type="0">
</Transition>
<Transition StartId="1237" EndId="1244" type="0">
</Transition>
<Transition StartId="1244" EndId="1248" type="0">
</Transition>
<Transition StartId="1247" EndId="1249" type="0">
</Transition>
<Transition StartId="1248" EndId="1252" type="0">
</Transition>
<Transition StartId="1249" EndId="1250" type="0">
</Transition>
<Transition StartId="1250" EndId="1251" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1250" EndId="1307" type="4">
</Transition>
<Transition StartId="1250" EndId="1301" type="0">
</Transition>
<Transition StartId="1251" EndId="1252" type="0">
</Transition>
<Transition StartId="1252" EndId="1247" type="0">
</Transition>
<Transition StartId="1256" EndId="1263" type="0">
</Transition>
<Transition StartId="1262" EndId="1264" type="0">
</Transition>
<Transition StartId="1263" EndId="1267" type="0">
</Transition>
<Transition StartId="1264" EndId="1265" type="0">
</Transition>
<Transition StartId="1265" EndId="1266" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1265" EndId="1281" type="0">
</Transition>
<Transition StartId="1266" EndId="1267" type="0">
</Transition>
<Transition StartId="1267" EndId="1262" type="0">
</Transition>
<Transition StartId="1281" EndId="1314" type="0">
</Transition>
<Transition StartId="1292" EndId="20" type="0">
</Transition>
<Transition StartId="1293" EndId="1294" type="0">
</Transition>
<Transition StartId="1294" EndId="1295" type="0">
</Transition>
<Transition StartId="1295" EndId="1296" type="0">
</Transition>
<Transition StartId="1297" EndId="1298" type="0">
</Transition>
<Transition StartId="1298" EndId="1299" type="0">
</Transition>
<Transition StartId="1299" EndId="1300" type="0">
</Transition>
<Transition StartId="1301" EndId="1309" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1301" EndId="1308" type="0">
</Transition>
<Transition StartId="1302" EndId="1324" type="0">
</Transition>
<Transition StartId="1303" EndId="1313" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1303" EndId="1312" type="0">
</Transition>
<Transition StartId="1304" EndId="2" type="0">
</Transition>
<Transition StartId="1309" EndId="13" type="0">
</Transition>
<Transition StartId="1311" EndId="18" type="0">
</Transition>
<Transition StartId="1313" EndId="1304" type="0">
</Transition>
<Transition StartId="1314" EndId="1316" type="0">
</Transition>
<Transition StartId="1316" EndId="1317" type="0">
</Transition>
<Transition StartId="1317" EndId="1318" type="0">
</Transition>
<Transition StartId="1318" EndId="1319" type="0">
</Transition>
<Transition StartId="1319" EndId="1320" type="0">
</Transition>
<Transition StartId="1320" EndId="1321" type="0">
</Transition>
<Transition StartId="1321" EndId="1323" type="0">
</Transition>
<Transition StartId="1323" EndId="1292" type="0">
</Transition>
<Transition StartId="1324" EndId="22" type="0">
</Transition>
</Transitions>
</Process>

