<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="24" right="200" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="650" top="844" right="750" bottom="876"/>
<Script></Script></End>
<Activities>
<Activity id="762" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="100" top="1414" right="200" bottom="1446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x64\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="763" ActivityType="3" flags="0" name="init">
<Rect left="100" top="144" right="200" bottom="176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="766" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="324" right="200" bottom="356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="767" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="324" right="66" bottom="356"/>
</Activity>
<Activity id="768" ActivityType="13" flags="1" name="Tolerance_view_Float_A">
<Rect left="100" top="264" right="200" bottom="296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="1" name="DEP561" type="8" flags="97"/>
</Activity>
<Activity id="769" ActivityType="3" flags="0" name="初始化">
<Rect left="100" top="204" right="200" bottom="236"/>
<Script>DFloat_Mts3Result = math.abs(engine.df_door_i);
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="770" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="204" right="66" bottom="236"/>
</Activity>
<Activity id="771" ActivityType="13" flags="0" name="X_Axis_decrease_adjust">
<Rect left="100" top="444" right="200" bottom="476"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴减少"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="773" ActivityType="3" flags="0" name="init">
<Rect left="100" top="494" right="200" bottom="526"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="777" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="664" right="200" bottom="696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="778" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="664" right="66" bottom="696"/>
</Activity>
<Activity id="779" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="100" top="604" right="200" bottom="636"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="2" name="DEP562" type="8" flags="97"/>
</Activity>
<Activity id="780" ActivityType="3" flags="0" name="初始化">
<Rect left="100" top="544" right="200" bottom="576"/>
<Script>DFloat_Mts3Result = math.abs(engine.df_door_i );
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="781" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="544" right="66" bottom="576"/>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Y_Axis_increase_adjust">
<Rect left="100" top="784" right="200" bottom="816"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴增加"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="783" ActivityType="3" flags="0" name="init">
<Rect left="100" top="854" right="200" bottom="886"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="786" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="1014" right="200" bottom="1046"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="787" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="1014" right="76" bottom="1046"/>
</Activity>
<Activity id="788" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="100" top="964" right="200" bottom="996"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="3" name="DEP563" type="8" flags="97"/>
</Activity>
<Activity id="789" ActivityType="3" flags="0" name="初始化">
<Rect left="100" top="904" right="200" bottom="936"/>
<Script>DFloat_Mts3Result = math.abs(engine.df_door_i );
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="790" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="904" right="76" bottom="936"/>
</Activity>
<Activity id="791" ActivityType="13" flags="0" name="Y_Axis_decrease_adjust">
<Rect left="100" top="1114" right="200" bottom="1146"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴减少"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1202" ActivityType="3" flags="0" name="init">
<Rect left="100" top="1174" right="200" bottom="1206"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1204" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="1354" right="200" bottom="1386"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1205" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="1354" right="76" bottom="1386"/>
</Activity>
<Activity id="1206" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="100" top="1294" right="200" bottom="1326"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="4" name="DEP564" type="8" flags="97"/>
</Activity>
<Activity id="1207" ActivityType="3" flags="0" name="初始化">
<Rect left="100" top="1234" right="200" bottom="1266"/>
<Script>DFloat_Mts3Result =math.abs(engine.df_door_i );
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="1208" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="1234" right="76" bottom="1266"/>
</Activity>
<Activity id="1209" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="1414" right="326" bottom="1446"/>
</Activity>
<Activity id="1210" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="114" right="326" bottom="146"/>
</Activity>
<Activity id="1213" ActivityType="13" flags="0" name="Left mirror fold automaticly">
<Rect left="410" top="114" right="510" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜折叠"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x65\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1215" ActivityType="3" flags="0" name="init">
<Rect left="410" top="174" right="510" bottom="206"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.Delay(1500)</Script></Activity>
<Activity id="1216" ActivityType="13" flags="0" name="Read_status">
<Rect left="410" top="234" right="510" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE3&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1217" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="394" right="510" bottom="426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1218" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="394" right="386" bottom="426"/>
</Activity>
<Activity id="1219" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="234" right="386" bottom="266"/>
</Activity>
<Activity id="1220" ActivityType="3" flags="0" name="截取字符串">
<Rect left="410" top="284" right="510" bottom="316"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1221" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="334" right="510" bottom="366"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="5" name="DEP565" type="8" flags="97"/>
</Activity>
<Activity id="1222" ActivityType="13" flags="0" name="Left mirror open automaticly">
<Rect left="410" top="504" right="510" bottom="536"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜打开"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x65\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1223" ActivityType="3" flags="0" name="init">
<Rect left="410" top="554" right="510" bottom="586"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.Delay(2000)</Script></Activity>
<Activity id="1224" ActivityType="13" flags="0" name="Read_status">
<Rect left="410" top="604" right="510" bottom="636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE3&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1225" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="784" right="510" bottom="816"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1226" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="784" right="386" bottom="816"/>
</Activity>
<Activity id="1227" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="604" right="386" bottom="636"/>
</Activity>
<Activity id="1228" ActivityType="3" flags="0" name="截取字符串">
<Rect left="410" top="664" right="510" bottom="696"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1229" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="724" right="510" bottom="756"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="6" name="DEP566" type="8" flags="97"/>
</Activity>
<Activity id="1230" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="410" top="844" right="510" bottom="876"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x65\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1231" ActivityType="13" flags="0" name="Heating_Start">
<Rect left="410" top="904" right="510" bottom="936"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜开始加热"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x66\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1234" ActivityType="3" flags="0" name="init">
<Rect left="410" top="954" right="510" bottom="986"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1235" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="1194" right="510" bottom="1226"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1236" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1194" right="386" bottom="1226"/>
</Activity>
<Activity id="1239" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1014" right="386" bottom="1046"/>
</Activity>
<Activity id="1240" ActivityType="13" flags="0" name="Read_status">
<Rect left="410" top="1014" right="510" bottom="1046"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE5&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1241" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="1134" right="510" bottom="1166"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="7" name="DEP567" type="8" flags="97"/>
</Activity>
<Activity id="1242" ActivityType="3" flags="0" name="截取字符串">
<Rect left="410" top="1074" right="510" bottom="1106"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1243" ActivityType="13" flags="0" name="Heating_stop">
<Rect left="410" top="1284" right="510" bottom="1316"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜停止加热"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x66\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1244" ActivityType="3" flags="0" name="init">
<Rect left="410" top="1404" right="510" bottom="1436"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.Delay(2000)</Script></Activity>
<Activity id="1245" ActivityType="3" flags="0" name="endloop">
<Rect left="720" top="314" right="820" bottom="346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1246" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="314" right="686" bottom="346"/>
</Activity>
<Activity id="1247" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="114" right="686" bottom="146"/>
</Activity>
<Activity id="1248" ActivityType="13" flags="0" name="Read_status">
<Rect left="720" top="114" right="820" bottom="146"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE5&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="720" top="244" right="820" bottom="276"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2800" pbltext="DEP2498" no="8" name="DEP568" type="8" flags="97"/>
</Activity>
<Activity id="1250" ActivityType="3" flags="0" name="截取字符串">
<Rect left="720" top="174" right="820" bottom="206"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1252" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="1404" right="606" bottom="1436"/>
</Activity>
<Activity id="1253" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="114" right="606" bottom="146"/>
</Activity>
<Activity id="1254" ActivityType="13" flags="0" name="Left mirror adjust_X Axis+">
<Rect left="100" top="84" right="200" bottom="116"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1255" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="100" top="384" right="200" bottom="416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x64\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1256" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="100" top="724" right="200" bottom="756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x64\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1257" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="100" top="1064" right="200" bottom="1096"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x64\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1259" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="410" top="454" right="510" bottom="486"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x65\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1261" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="720" top="374" right="820" bottom="406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x66\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1262" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="310" top="44" right="410" bottom="76"/>
<Line1Text Enable="1" Text="请确认外后视镜开关位置于0位置"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1262" type="0">
</Transition>
<Transition StartId="762" EndId="1209" type="0">
</Transition>
<Transition StartId="763" EndId="769" type="0">
</Transition>
<Transition StartId="766" EndId="767" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="766" EndId="1255" type="0">
</Transition>
<Transition StartId="767" EndId="770" type="0">
</Transition>
<Transition StartId="768" EndId="766" type="0">
</Transition>
<Transition StartId="769" EndId="768" type="0">
</Transition>
<Transition StartId="770" EndId="769" type="0">
</Transition>
<Transition StartId="771" EndId="773" type="0">
</Transition>
<Transition StartId="773" EndId="780" type="0">
</Transition>
<Transition StartId="777" EndId="778" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="777" EndId="1256" type="0">
</Transition>
<Transition StartId="778" EndId="781" type="0">
</Transition>
<Transition StartId="779" EndId="777" type="0">
</Transition>
<Transition StartId="780" EndId="779" type="0">
</Transition>
<Transition StartId="781" EndId="780" type="0">
</Transition>
<Transition StartId="782" EndId="783" type="0">
</Transition>
<Transition StartId="783" EndId="789" type="0">
</Transition>
<Transition StartId="786" EndId="787" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="786" EndId="1257" type="0">
</Transition>
<Transition StartId="787" EndId="790" type="0">
</Transition>
<Transition StartId="788" EndId="786" type="0">
</Transition>
<Transition StartId="789" EndId="788" type="0">
</Transition>
<Transition StartId="790" EndId="789" type="0">
</Transition>
<Transition StartId="791" EndId="1202" type="0">
</Transition>
<Transition StartId="1202" EndId="1207" type="0">
</Transition>
<Transition StartId="1204" EndId="1205" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1204" EndId="762" type="0">
</Transition>
<Transition StartId="1205" EndId="1208" type="0">
</Transition>
<Transition StartId="1206" EndId="1204" type="0">
</Transition>
<Transition StartId="1207" EndId="1206" type="0">
</Transition>
<Transition StartId="1208" EndId="1207" type="0">
</Transition>
<Transition StartId="1209" EndId="1210" type="0">
</Transition>
<Transition StartId="1210" EndId="1213" type="0">
</Transition>
<Transition StartId="1213" EndId="1215" type="0">
</Transition>
<Transition StartId="1215" EndId="1216" type="0">
</Transition>
<Transition StartId="1216" EndId="1220" type="0">
</Transition>
<Transition StartId="1217" EndId="1218" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1217" EndId="1259" type="0">
</Transition>
<Transition StartId="1218" EndId="1219" type="0">
</Transition>
<Transition StartId="1219" EndId="1216" type="0">
</Transition>
<Transition StartId="1220" EndId="1221" type="0">
</Transition>
<Transition StartId="1221" EndId="1217" type="0">
</Transition>
<Transition StartId="1222" EndId="1223" type="0">
</Transition>
<Transition StartId="1223" EndId="1224" type="0">
</Transition>
<Transition StartId="1224" EndId="1228" type="0">
</Transition>
<Transition StartId="1225" EndId="1226" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1225" EndId="1230" type="0">
</Transition>
<Transition StartId="1226" EndId="1227" type="0">
</Transition>
<Transition StartId="1227" EndId="1224" type="0">
</Transition>
<Transition StartId="1228" EndId="1229" type="0">
</Transition>
<Transition StartId="1229" EndId="1225" type="0">
</Transition>
<Transition StartId="1230" EndId="2" type="0">
</Transition>
<Transition StartId="1231" EndId="1234" type="0">
</Transition>
<Transition StartId="1234" EndId="1240" type="0">
</Transition>
<Transition StartId="1235" EndId="1236" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1235" EndId="1243" type="0">
</Transition>
<Transition StartId="1236" EndId="1239" type="0">
</Transition>
<Transition StartId="1239" EndId="1240" type="0">
</Transition>
<Transition StartId="1240" EndId="1242" type="0">
</Transition>
<Transition StartId="1241" EndId="1235" type="0">
</Transition>
<Transition StartId="1242" EndId="1241" type="0">
</Transition>
<Transition StartId="1243" EndId="1244" type="0">
</Transition>
<Transition StartId="1244" EndId="1252" type="0">
</Transition>
<Transition StartId="1245" EndId="1246" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1245" EndId="1261" type="0">
</Transition>
<Transition StartId="1246" EndId="1247" type="0">
</Transition>
<Transition StartId="1247" EndId="1248" type="0">
</Transition>
<Transition StartId="1248" EndId="1250" type="0">
</Transition>
<Transition StartId="1249" EndId="1245" type="0">
</Transition>
<Transition StartId="1250" EndId="1249" type="0">
</Transition>
<Transition StartId="1252" EndId="1253" type="0">
</Transition>
<Transition StartId="1253" EndId="1247" type="0">
</Transition>
<Transition StartId="1254" EndId="763" type="0">
</Transition>
<Transition StartId="1255" EndId="771" type="0">
</Transition>
<Transition StartId="1256" EndId="782" type="0">
</Transition>
<Transition StartId="1257" EndId="791" type="0">
</Transition>
<Transition StartId="1259" EndId="1222" type="0">
</Transition>
<Transition StartId="1262" EndId="1254" type="0">
</Transition>
</Transitions>
</Process>

