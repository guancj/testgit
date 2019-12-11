<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="140" top="24" right="240" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="820" top="1694" right="920" bottom="1726"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="84" right="240" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="门灯检测"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x23&apos;"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="10" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="936" ActivityType="13" flags="0" name="锁左后车门">
<Rect left="140" top="844" right="240" bottom="876"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车门自动锁"/>
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
<Parameter id="sendTel" value="&quot;\xCF\xA0\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="937" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="914" right="240" bottom="946"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x22&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="1154" right="240" bottom="1186"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="1154" right="116" bottom="1186"/>
</Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="914" right="116" bottom="946"/>
</Activity>
<Activity id="941" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="994" right="240" bottom="1026"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="942" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="1074" right="240" bottom="1106"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="12" name="DEP602" type="8" flags="97"/>
</Activity>
<Activity id="943" ActivityType="13" flags="0" name="左后车门解锁">
<Rect left="140" top="1284" right="240" bottom="1316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车门自动解锁"/>
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
<Parameter id="sendTel" value="&quot;\xCF\xA0\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="1344" right="240" bottom="1376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x22&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="1574" right="240" bottom="1606"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="1574" right="116" bottom="1606"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="1344" right="116" bottom="1376"/>
</Activity>
<Activity id="948" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="1414" right="240" bottom="1446"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="949" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="1494" right="240" bottom="1526"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="13" name="DEP603" type="8" flags="97"/>
</Activity>
<Activity id="950" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="140" top="1644" right="240" bottom="1676"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xA0\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="951" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="140" top="1224" right="240" bottom="1256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\xA0\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="978" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="610" top="1474" right="710" bottom="1506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xA1\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1255" ActivityType="13" flags="0" name="Window_up">
<Rect left="490" top="1714" right="590" bottom="1746"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xA1\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1256" ActivityType="3" flags="1" name="延时2000MS">
<Rect left="640" top="1714" right="740" bottom="1746"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车窗上升中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="1258" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="140" top="384" right="240" bottom="416"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="1259" ActivityType="3" flags="0" name="init">
<Rect left="140" top="444" right="240" bottom="476"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1260" ActivityType="3" flags="0" name="endloop">
<Rect left="140" top="704" right="240" bottom="736"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1261" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="704" right="326" bottom="736"/>
</Activity>
<Activity id="1262" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="504" right="326" bottom="536"/>
</Activity>
<Activity id="1263" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="140" top="764" right="240" bottom="796"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="截取字符串">
<Rect left="140" top="564" right="240" bottom="596"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1266" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="140" top="634" right="240" bottom="666"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="11" name="DEP599" type="8" flags="97"/>
</Activity>
<Activity id="1269" ActivityType="13" flags="0" name="Read_status">
<Rect left="140" top="504" right="240" bottom="536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x23&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1300" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="390" top="1344" right="490" bottom="1376"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1301" ActivityType="3" flags="0" name="init">
<Rect left="390" top="1414" right="490" bottom="1446"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1302" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="1614" right="356" bottom="1646"/>
</Activity>
<Activity id="1303" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="390" top="1544" right="490" bottom="1576"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="101" name="DEP2531" type="8" flags="97"/>
</Activity>
<Activity id="1304" ActivityType="3" flags="0" name="初始化">
<Rect left="390" top="1474" right="490" bottom="1506"/>
<Script>DFloat_Mts3Result=math.abs(engine.dr_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1305" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="1474" right="356" bottom="1506"/>
</Activity>
<Activity id="1306" ActivityType="3" flags="0" name="endloop">
<Rect left="390" top="1614" right="490" bottom="1646"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="933" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="930" EndId="1258" type="0">
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
<Transition StartId="950" EndId="1300" type="0">
</Transition>
<Transition StartId="951" EndId="943" type="0">
</Transition>
<Transition StartId="978" EndId="2" type="0">
</Transition>
<Transition StartId="1255" EndId="1256" type="0">
</Transition>
<Transition StartId="1256" EndId="978" type="0">
</Transition>
<Transition StartId="1258" EndId="1259" type="0">
</Transition>
<Transition StartId="1259" EndId="1269" type="0">
</Transition>
<Transition StartId="1260" EndId="1261" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1260" EndId="1263" type="0">
</Transition>
<Transition StartId="1261" EndId="1262" type="0">
</Transition>
<Transition StartId="1262" EndId="1269" type="0">
</Transition>
<Transition StartId="1263" EndId="936" type="0">
</Transition>
<Transition StartId="1264" EndId="1266" type="0">
</Transition>
<Transition StartId="1266" EndId="1260" type="0">
</Transition>
<Transition StartId="1269" EndId="1264" type="0">
</Transition>
<Transition StartId="1300" EndId="1301" type="0">
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
<Transition StartId="1306" EndId="1255" type="0">
</Transition>
</Transitions>
</Process>

