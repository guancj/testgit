<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="140" top="24" right="240" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="900" top="1924" right="1000" bottom="1956"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="84" right="240" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="门灯检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x43&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="930" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="314" right="240" bottom="346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="314" right="116" bottom="346"/>
</Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="84" right="116" bottom="116"/>
</Activity>
<Activity id="933" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="164" right="240" bottom="196"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="934" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="234" right="240" bottom="266"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="30" name="DEP2038" type="8" flags="97"/>
</Activity>
<Activity id="936" ActivityType="13" flags="0" name="锁右后车门">
<Rect left="140" top="824" right="240" bottom="856"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="右后车门自动锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xC0\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="937" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="894" right="240" bottom="926"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x42&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="1114" right="240" bottom="1146"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="1114" right="86" bottom="1146"/>
</Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="894" right="86" bottom="926"/>
</Activity>
<Activity id="941" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="974" right="240" bottom="1006"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="942" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="1044" right="240" bottom="1076"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="31" name="DEP786" type="8" flags="97"/>
</Activity>
<Activity id="943" ActivityType="13" flags="0" name="右后车门解锁">
<Rect left="140" top="1234" right="240" bottom="1266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="右后车门自动解锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xC0\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="1294" right="240" bottom="1326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x42&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="1524" right="240" bottom="1556"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="1524" right="86" bottom="1556"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="1294" right="86" bottom="1326"/>
</Activity>
<Activity id="948" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="1364" right="240" bottom="1396"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="949" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="1444" right="240" bottom="1476"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="32" name="DEP787" type="8" flags="97"/>
</Activity>
<Activity id="950" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="140" top="1584" right="240" bottom="1616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xC0\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="951" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="140" top="1174" right="240" bottom="1206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xC0\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="952" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="490" top="1224" right="590" bottom="1256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃下降"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="953" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="490" top="1584" right="590" bottom="1616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="954" ActivityType="13" flags="1" name="Window_up">
<Rect left="490" top="1644" right="590" bottom="1676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="978" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="790" top="1584" right="890" bottom="1616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1224" ActivityType="3" flags="0" name="init">
<Rect left="490" top="1284" right="590" bottom="1316"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1232" ActivityType="13" flags="0" name="Read_status">
<Rect left="490" top="1344" right="590" bottom="1376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x41&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1243" ActivityType="3" flags="0" name="endloop">
<Rect left="490" top="1524" right="590" bottom="1556"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1244" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1524" right="466" bottom="1556"/>
</Activity>
<Activity id="1245" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1344" right="466" bottom="1376"/>
</Activity>
<Activity id="1246" ActivityType="3" flags="0" name="截取字符串">
<Rect left="490" top="1404" right="590" bottom="1436"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1247" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="490" top="1464" right="590" bottom="1496"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????01??&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1248" ActivityType="3" flags="0" name="init">
<Rect left="790" top="1284" right="890" bottom="1316"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Read_status">
<Rect left="790" top="1344" right="890" bottom="1376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x41&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1250" ActivityType="3" flags="0" name="endloop">
<Rect left="790" top="1524" right="890" bottom="1556"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1524" right="1016" bottom="1556"/>
</Activity>
<Activity id="1252" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="1534" right="756" bottom="1566"/>
</Activity>
<Activity id="1253" ActivityType="3" flags="0" name="截取字符串">
<Rect left="790" top="1404" right="890" bottom="1436"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1254" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="790" top="1464" right="890" bottom="1496"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????01??&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1255" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="640" top="1644" right="740" bottom="1676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车窗上升中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  3000</Script></Activity>
<Activity id="1256" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="140" top="404" right="240" bottom="436"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="1258" ActivityType="3" flags="0" name="init">
<Rect left="140" top="464" right="240" bottom="496"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1260" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="704" right="240" bottom="736"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1261" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="704" right="396" bottom="736"/>
</Activity>
<Activity id="1262" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="524" right="396" bottom="556"/>
</Activity>
<Activity id="1263" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="140" top="764" right="240" bottom="796"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="584" right="240" bottom="616"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1265" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="644" right="240" bottom="676"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????0&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="16" name="DEP2529" type="8" flags="97"/>
</Activity>
<Activity id="1280" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="524" right="240" bottom="556"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x43&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1281" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="140" top="1644" right="240" bottom="1676"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1301" ActivityType="3" flags="0" name="init">
<Rect left="140" top="1714" right="240" bottom="1746"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1302" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1914" right="106" bottom="1946"/>
</Activity>
<Activity id="1303" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="140" top="1844" right="240" bottom="1876"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="100"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="102" name="DEP2531" type="8" flags="97"/>
</Activity>
<Activity id="1304" ActivityType="3" flags="0" name="初始化">
<Rect left="140" top="1774" right="240" bottom="1806"/>
<Script>DFloat_Mts3Result=math.abs(engine.pr_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1305" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1774" right="106" bottom="1806"/>
</Activity>
<Activity id="1306" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="1914" right="240" bottom="1946"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="933" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="930" EndId="1256" type="0">
</Transition>
<Transition StartId="931" EndId="932" type="0">
</Transition>
<Transition StartId="932" EndId="3" type="0">
</Transition>
<Transition StartId="933" EndId="934" type="0">
</Transition>
<Transition StartId="934" EndId="930" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="941" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="938" EndId="951" type="0">
</Transition>
<Transition StartId="939" EndId="940" type="0">
</Transition>
<Transition StartId="940" EndId="937" type="0">
</Transition>
<Transition StartId="941" EndId="942" type="0">
</Transition>
<Transition StartId="942" EndId="938" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="948" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="945" EndId="950" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="0">
</Transition>
<Transition StartId="947" EndId="944" type="0">
</Transition>
<Transition StartId="948" EndId="949" type="0">
</Transition>
<Transition StartId="949" EndId="945" type="0">
</Transition>
<Transition StartId="950" EndId="1281" type="0">
</Transition>
<Transition StartId="951" EndId="943" type="0">
</Transition>
<Transition StartId="954" EndId="1255" type="0">
</Transition>
<Transition StartId="978" EndId="2" type="0">
</Transition>
<Transition StartId="1255" EndId="978" type="0">
</Transition>
<Transition StartId="1256" EndId="1258" type="0">
</Transition>
<Transition StartId="1258" EndId="1280" type="0">
</Transition>
<Transition StartId="1260" EndId="1263" type="0">
</Transition>
<Transition StartId="1260" EndId="1261" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1261" EndId="1262" type="0">
</Transition>
<Transition StartId="1262" EndId="1280" type="0">
</Transition>
<Transition StartId="1263" EndId="936" type="0">
</Transition>
<Transition StartId="1264" EndId="1265" type="0">
</Transition>
<Transition StartId="1265" EndId="1260" type="0">
</Transition>
<Transition StartId="1280" EndId="1264" type="0">
</Transition>
<Transition StartId="1281" EndId="1301" type="0">
</Transition>
<Transition StartId="1301" EndId="1304" type="0">
</Transition>
<Transition StartId="1302" EndId="1305" type="0">
</Transition>
<Transition StartId="1303" EndId="1306" type="0">
</Transition>
<Transition StartId="1304" EndId="1303" type="0">
</Transition>
<Transition StartId="1305" EndId="1304" type="0">
</Transition>
<Transition StartId="1306" EndId="1302" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
</Transitions>
</Process>

