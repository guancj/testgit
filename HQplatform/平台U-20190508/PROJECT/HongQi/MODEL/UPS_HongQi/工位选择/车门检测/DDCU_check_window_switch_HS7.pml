<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data="&quot;&quot;"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="190" top="14" right="290" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1060" top="1334" right="1160" bottom="1366"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="按驾驶员门窗点动上升">
<Rect left="190" top="734" right="290" bottom="766"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按驾驶员窗口点动上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="Read_status">
<Rect left="190" top="794" right="290" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="endloop">
<Rect left="190" top="974" right="290" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="909" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="974" right="106" bottom="1006"/>
</Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="794" right="106" bottom="826"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="截取字符串">
<Rect left="190" top="854" right="290" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="912" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="190" top="914" right="290" bottom="946"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="3" name="DEP2056" type="8" flags="97"/>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="按驾驶员门窗连续上升">
<Rect left="190" top="1034" right="290" bottom="1066"/>
<Line1Text Enable="1" Text="司机门检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按驾驶员门窗连续上升（升到顶）"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="914" ActivityType="13" flags="0" name="Read_status">
<Rect left="190" top="1094" right="290" bottom="1126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="endloop">
<Rect left="190" top="1274" right="290" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1274" right="106" bottom="1306"/>
</Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1094" right="106" bottom="1126"/>
</Activity>
<Activity id="918" ActivityType="3" flags="0" name="截取字符串">
<Rect left="190" top="1154" right="290" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="919" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="190" top="1214" right="290" bottom="1246"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="4" name="DEP2001" type="8" flags="97"/>
</Activity>
<Activity id="920" ActivityType="3" flags="0" name="按驾驶员门窗点动下降">
<Rect left="190" top="104" right="290" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按驾驶员门窗点动下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="921" ActivityType="13" flags="0" name="Read_status">
<Rect left="190" top="164" right="290" bottom="196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="922" ActivityType="3" flags="0" name="endloop">
<Rect left="190" top="374" right="290" bottom="406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="923" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="374" right="106" bottom="406"/>
</Activity>
<Activity id="924" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="164" right="106" bottom="196"/>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="截取字符串">
<Rect left="190" top="224" right="290" bottom="256"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="190" top="314" right="290" bottom="346"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="1" name="DEP2002" type="8" flags="97"/>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="按驾驶员门窗连续下降">
<Rect left="190" top="434" right="290" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按驾驶员门窗连续下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="928" ActivityType="13" flags="0" name="Read_status">
<Rect left="190" top="494" right="290" bottom="526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="929" ActivityType="3" flags="0" name="endloop">
<Rect left="190" top="674" right="290" bottom="706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="930" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="674" right="106" bottom="706"/>
</Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="494" right="106" bottom="526"/>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="截取字符串">
<Rect left="190" top="554" right="290" bottom="586"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="933" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="190" top="614" right="290" bottom="646"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="2" name="DEP2003" type="8" flags="97"/>
</Activity>
<Activity id="934" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1274" right="376" bottom="1306"/>
</Activity>
<Activity id="936" ActivityType="3" flags="1" name="按副驾驶门窗点动上升">
<Rect left="460" top="734" right="560" bottom="766"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1" Text="按副驾驶门窗点动上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="937" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="794" right="560" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="974" right="560" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="974" right="436" bottom="1006"/>
</Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="794" right="436" bottom="826"/>
</Activity>
<Activity id="941" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="854" right="560" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="942" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="914" right="560" bottom="946"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="5" name="DEP2004" type="8" flags="97"/>
</Activity>
<Activity id="943" ActivityType="3" flags="0" name="按副驾驶门窗连续上升">
<Rect left="460" top="1034" right="560" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按副驾驶门窗连续上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="944" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="1094" right="560" bottom="1126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="1274" right="560" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="1274" right="436" bottom="1306"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="1094" right="436" bottom="1126"/>
</Activity>
<Activity id="948" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="1154" right="560" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="949" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="1214" right="560" bottom="1246"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="6" name="DEP2005" type="8" flags="97"/>
</Activity>
<Activity id="950" ActivityType="3" flags="0" name="按副驾驶门窗点动下降">
<Rect left="460" top="134" right="560" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按副驾驶门窗点动下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="951" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="194" right="560" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="374" right="560" bottom="406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="953" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="374" right="436" bottom="406"/>
</Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="194" right="436" bottom="226"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="254" right="560" bottom="286"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="956" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="314" right="560" bottom="346"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="7" name="DEP2006" type="8" flags="97"/>
</Activity>
<Activity id="957" ActivityType="3" flags="0" name="按副驾驶门窗连续下降">
<Rect left="460" top="434" right="560" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按副驾驶门窗连续下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="958" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="494" right="560" bottom="526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="674" right="560" bottom="706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="674" right="436" bottom="706"/>
</Activity>
<Activity id="961" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="494" right="436" bottom="526"/>
</Activity>
<Activity id="962" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="554" right="560" bottom="586"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="963" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="614" right="560" bottom="646"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="8" name="DEP2007" type="8" flags="97"/>
</Activity>
<Activity id="964" ActivityType="3" flags="0" name="按左后门窗点动上升">
<Rect left="760" top="734" right="860" bottom="766"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1" Text="按左后门窗点动上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="965" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="794" right="860" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="966" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="974" right="860" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="974" right="736" bottom="1006"/>
</Activity>
<Activity id="968" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="794" right="736" bottom="826"/>
</Activity>
<Activity id="969" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="854" right="860" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="970" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="914" right="860" bottom="946"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="9" name="DEP2008" type="8" flags="97"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="按左后门窗连续上升">
<Rect left="760" top="1034" right="860" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按左后门窗连续上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="972" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="1094" right="860" bottom="1126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="973" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="1274" right="860" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="974" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="1274" right="736" bottom="1306"/>
</Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="1094" right="736" bottom="1126"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="1154" right="860" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="977" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="1214" right="860" bottom="1246"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="10" name="DEP2009" type="8" flags="97"/>
</Activity>
<Activity id="978" ActivityType="3" flags="0" name="按左后门窗点动下降">
<Rect left="760" top="134" right="860" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按左后门窗点动下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="979" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="194" right="860" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="980" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="374" right="860" bottom="406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="981" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="374" right="736" bottom="406"/>
</Activity>
<Activity id="982" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="194" right="736" bottom="226"/>
</Activity>
<Activity id="983" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="254" right="860" bottom="286"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="984" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="314" right="860" bottom="346"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="11" name="DEP2010" type="8" flags="97"/>
</Activity>
<Activity id="985" ActivityType="3" flags="0" name="按左后门窗连续下降">
<Rect left="760" top="434" right="860" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按左后门窗连续下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="986" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="494" right="860" bottom="526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="987" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="674" right="860" bottom="706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="988" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="674" right="736" bottom="706"/>
</Activity>
<Activity id="989" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="494" right="736" bottom="526"/>
</Activity>
<Activity id="990" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="554" right="860" bottom="586"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="991" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="614" right="860" bottom="646"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="12" name="DEP2011" type="8" flags="97"/>
</Activity>
<Activity id="994" ActivityType="3" flags="0" name="按右后门窗点动上升">
<Rect left="1060" top="734" right="1160" bottom="766"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1" Text="按右后门窗点动上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="995" ActivityType="13" flags="0" name="Read_status">
<Rect left="1060" top="794" right="1160" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="996" ActivityType="3" flags="0" name="endloop">
<Rect left="1060" top="974" right="1160" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="997" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="974" right="1036" bottom="1006"/>
</Activity>
<Activity id="998" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="794" right="1036" bottom="826"/>
</Activity>
<Activity id="999" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1060" top="854" right="1160" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1000" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1060" top="914" right="1160" bottom="946"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="13" name="DEP2014" type="8" flags="97"/>
</Activity>
<Activity id="1001" ActivityType="3" flags="0" name="按右后门窗连续上升">
<Rect left="1060" top="1034" right="1160" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按右后门窗连续上升"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="1002" ActivityType="13" flags="0" name="Read_status">
<Rect left="1060" top="1094" right="1160" bottom="1126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1003" ActivityType="3" flags="0" name="endloop">
<Rect left="1060" top="1274" right="1160" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1004" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="1274" right="1036" bottom="1306"/>
</Activity>
<Activity id="1005" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="1094" right="1036" bottom="1126"/>
</Activity>
<Activity id="1006" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1060" top="1154" right="1160" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1007" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1060" top="1214" right="1160" bottom="1246"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="14" name="DEP2015" type="8" flags="97"/>
</Activity>
<Activity id="1008" ActivityType="3" flags="0" name="按右后门窗点动下降">
<Rect left="1060" top="134" right="1160" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按右后门窗点动下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="1009" ActivityType="13" flags="0" name="Read_status">
<Rect left="1060" top="194" right="1160" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1010" ActivityType="3" flags="0" name="endloop">
<Rect left="1060" top="374" right="1160" bottom="406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1011" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="374" right="1036" bottom="406"/>
</Activity>
<Activity id="1012" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="194" right="1036" bottom="226"/>
</Activity>
<Activity id="1013" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1060" top="254" right="1160" bottom="286"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1014" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1060" top="314" right="1160" bottom="346"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="15" name="DEP2013" type="8" flags="97"/>
</Activity>
<Activity id="1015" ActivityType="3" flags="0" name="按右后门窗连续下降">
<Rect left="1060" top="434" right="1160" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="按右后门窗连续下降"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="1016" ActivityType="13" flags="0" name="Read_status">
<Rect left="1060" top="494" right="1160" bottom="526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1017" ActivityType="3" flags="0" name="endloop">
<Rect left="1060" top="674" right="1160" bottom="706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1018" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="674" right="1036" bottom="706"/>
</Activity>
<Activity id="1019" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="494" right="1036" bottom="526"/>
</Activity>
<Activity id="1020" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1060" top="554" right="1160" bottom="586"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1021" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1060" top="614" right="1160" bottom="646"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2803" pbltext="DEP2271" no="16" name="DEP2012" type="8" flags="97"/>
</Activity>
<Activity id="1024" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="134" right="376" bottom="166"/>
</Activity>
<Activity id="1025" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="134" right="646" bottom="166"/>
</Activity>
<Activity id="1026" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="134" right="946" bottom="166"/>
</Activity>
<Activity id="1027" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="1274" right="646" bottom="1306"/>
</Activity>
<Activity id="1028" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1274" right="946" bottom="1306"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="920" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="911" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="908" EndId="913" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="0">
</Transition>
<Transition StartId="910" EndId="5" type="0">
</Transition>
<Transition StartId="911" EndId="912" type="0">
</Transition>
<Transition StartId="912" EndId="908" type="0">
</Transition>
<Transition StartId="913" EndId="914" type="0">
</Transition>
<Transition StartId="914" EndId="918" type="0">
</Transition>
<Transition StartId="915" EndId="916" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="915" EndId="934" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="0">
</Transition>
<Transition StartId="917" EndId="914" type="0">
</Transition>
<Transition StartId="918" EndId="919" type="0">
</Transition>
<Transition StartId="919" EndId="915" type="0">
</Transition>
<Transition StartId="920" EndId="921" type="0">
</Transition>
<Transition StartId="921" EndId="925" type="0">
</Transition>
<Transition StartId="922" EndId="923" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="922" EndId="927" type="0">
</Transition>
<Transition StartId="923" EndId="924" type="0">
</Transition>
<Transition StartId="924" EndId="921" type="0">
</Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="922" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="0">
</Transition>
<Transition StartId="928" EndId="932" type="0">
</Transition>
<Transition StartId="929" EndId="930" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="929" EndId="3" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="928" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="929" type="0">
</Transition>
<Transition StartId="934" EndId="1024" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="941" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="938" EndId="943" type="0">
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
<Transition StartId="945" EndId="1027" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="0">
</Transition>
<Transition StartId="947" EndId="944" type="0">
</Transition>
<Transition StartId="948" EndId="949" type="0">
</Transition>
<Transition StartId="949" EndId="945" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="955" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="952" EndId="957" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="0">
</Transition>
<Transition StartId="954" EndId="951" type="0">
</Transition>
<Transition StartId="955" EndId="956" type="0">
</Transition>
<Transition StartId="956" EndId="952" type="0">
</Transition>
<Transition StartId="957" EndId="958" type="0">
</Transition>
<Transition StartId="958" EndId="962" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="959" EndId="936" type="0">
</Transition>
<Transition StartId="960" EndId="961" type="0">
</Transition>
<Transition StartId="961" EndId="958" type="0">
</Transition>
<Transition StartId="962" EndId="963" type="0">
</Transition>
<Transition StartId="963" EndId="959" type="0">
</Transition>
<Transition StartId="964" EndId="965" type="0">
</Transition>
<Transition StartId="965" EndId="969" type="0">
</Transition>
<Transition StartId="966" EndId="967" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="966" EndId="971" type="0">
</Transition>
<Transition StartId="967" EndId="968" type="0">
</Transition>
<Transition StartId="968" EndId="965" type="0">
</Transition>
<Transition StartId="969" EndId="970" type="0">
</Transition>
<Transition StartId="970" EndId="966" type="0">
</Transition>
<Transition StartId="971" EndId="972" type="0">
</Transition>
<Transition StartId="972" EndId="976" type="0">
</Transition>
<Transition StartId="973" EndId="974" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="973" EndId="1028" type="0">
</Transition>
<Transition StartId="974" EndId="975" type="0">
</Transition>
<Transition StartId="975" EndId="972" type="0">
</Transition>
<Transition StartId="976" EndId="977" type="0">
</Transition>
<Transition StartId="977" EndId="973" type="0">
</Transition>
<Transition StartId="978" EndId="979" type="0">
</Transition>
<Transition StartId="979" EndId="983" type="0">
</Transition>
<Transition StartId="980" EndId="981" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="980" EndId="985" type="0">
</Transition>
<Transition StartId="981" EndId="982" type="0">
</Transition>
<Transition StartId="982" EndId="979" type="0">
</Transition>
<Transition StartId="983" EndId="984" type="0">
</Transition>
<Transition StartId="984" EndId="980" type="0">
</Transition>
<Transition StartId="985" EndId="986" type="0">
</Transition>
<Transition StartId="986" EndId="990" type="0">
</Transition>
<Transition StartId="987" EndId="988" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="987" EndId="964" type="0">
</Transition>
<Transition StartId="988" EndId="989" type="0">
</Transition>
<Transition StartId="989" EndId="986" type="0">
</Transition>
<Transition StartId="990" EndId="991" type="0">
</Transition>
<Transition StartId="991" EndId="987" type="0">
</Transition>
<Transition StartId="994" EndId="995" type="0">
</Transition>
<Transition StartId="995" EndId="999" type="0">
</Transition>
<Transition StartId="996" EndId="997" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="996" EndId="1001" type="0">
</Transition>
<Transition StartId="997" EndId="998" type="0">
</Transition>
<Transition StartId="998" EndId="995" type="0">
</Transition>
<Transition StartId="999" EndId="1000" type="0">
</Transition>
<Transition StartId="1000" EndId="996" type="0">
</Transition>
<Transition StartId="1001" EndId="1002" type="0">
</Transition>
<Transition StartId="1002" EndId="1006" type="0">
</Transition>
<Transition StartId="1003" EndId="1004" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1003" EndId="2" type="0">
</Transition>
<Transition StartId="1004" EndId="1005" type="0">
</Transition>
<Transition StartId="1005" EndId="1002" type="0">
</Transition>
<Transition StartId="1006" EndId="1007" type="0">
</Transition>
<Transition StartId="1007" EndId="1003" type="0">
</Transition>
<Transition StartId="1008" EndId="1009" type="0">
</Transition>
<Transition StartId="1009" EndId="1013" type="0">
</Transition>
<Transition StartId="1010" EndId="1011" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1010" EndId="1015" type="0">
</Transition>
<Transition StartId="1011" EndId="1012" type="0">
</Transition>
<Transition StartId="1012" EndId="1009" type="0">
</Transition>
<Transition StartId="1013" EndId="1014" type="0">
</Transition>
<Transition StartId="1014" EndId="1010" type="0">
</Transition>
<Transition StartId="1015" EndId="1016" type="0">
</Transition>
<Transition StartId="1016" EndId="1020" type="0">
</Transition>
<Transition StartId="1017" EndId="1018" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1017" EndId="994" type="0">
</Transition>
<Transition StartId="1018" EndId="1019" type="0">
</Transition>
<Transition StartId="1019" EndId="1016" type="0">
</Transition>
<Transition StartId="1020" EndId="1021" type="0">
</Transition>
<Transition StartId="1021" EndId="1017" type="0">
</Transition>
<Transition StartId="1024" EndId="950" type="0">
</Transition>
<Transition StartId="1025" EndId="978" type="0">
</Transition>
<Transition StartId="1026" EndId="1008" type="0">
</Transition>
<Transition StartId="1027" EndId="1025" type="0">
</Transition>
<Transition StartId="1028" EndId="1026" type="0">
</Transition>
</Transitions>
</Process>

