<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="14" right="200" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1100" top="734" right="1200" bottom="766"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="Check_Mirror_Function_Switch_State">
<Rect left="100" top="84" right="200" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="后视镜功能切换L位置"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="892" ActivityType="3" flags="1" name="L">
<Rect left="100" top="144" right="200" bottom="176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="893" ActivityType="13" flags="0" name="Read_status">
<Rect left="100" top="204" right="200" bottom="236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="404" right="200" bottom="436"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="404" right="76" bottom="436"/>
</Activity>
<Activity id="896" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="204" right="76" bottom="236"/>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="264" right="200" bottom="296"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="324" right="200" bottom="356"/>
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
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="1" name="DEP1926" type="8" flags="97"/>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="0">
<Rect left="100" top="464" right="200" bottom="496"/>
<Line3Text Enable="1" Text="后视镜功能切换O位置"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="901" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="744" right="200" bottom="776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="902" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="744" right="76" bottom="776"/>
</Activity>
<Activity id="903" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="534" right="76" bottom="566"/>
</Activity>
<Activity id="904" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="604" right="200" bottom="636"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="905" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="664" right="200" bottom="696"/>
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
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="2" name="DEP1927" type="8" flags="97"/>
</Activity>
<Activity id="906" ActivityType="3" flags="0" name="R">
<Rect left="320" top="84" right="420" bottom="116"/>
<Line3Text Enable="1" Text="后视镜功能切换R位置"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="907" ActivityType="13" flags="0" name="Read_status">
<Rect left="320" top="154" right="420" bottom="186"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="endloop">
<Rect left="320" top="364" right="420" bottom="396"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="909" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="364" right="296" bottom="396"/>
</Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="154" right="296" bottom="186"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="截取字符串">
<Rect left="320" top="224" right="420" bottom="256"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="912" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="320" top="284" right="420" bottom="316"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="3" name="DEP1928" type="8" flags="97"/>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="H">
<Rect left="320" top="414" right="420" bottom="446"/>
<Line3Text Enable="1" Text="后视镜功能切换加热位置"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="914" ActivityType="13" flags="0" name="Read_status">
<Rect left="320" top="474" right="420" bottom="506"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="endloop">
<Rect left="320" top="664" right="420" bottom="696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="664" right="296" bottom="696"/>
</Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="474" right="296" bottom="506"/>
</Activity>
<Activity id="918" ActivityType="3" flags="0" name="截取字符串">
<Rect left="320" top="534" right="420" bottom="566"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="919" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="320" top="594" right="420" bottom="626"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="4" name="DEP1930" type="8" flags="97"/>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="F">
<Rect left="580" top="74" right="680" bottom="106"/>
<Line3Text Enable="1" Text="后视镜功能切换折叠位置"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="928" ActivityType="13" flags="0" name="Read_status">
<Rect left="580" top="134" right="680" bottom="166"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="929" ActivityType="3" flags="0" name="endloop">
<Rect left="580" top="314" right="680" bottom="346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="930" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="314" right="556" bottom="346"/>
</Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="134" right="556" bottom="166"/>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="截取字符串">
<Rect left="580" top="194" right="680" bottom="226"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="933" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="580" top="254" right="680" bottom="286"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="6" name="DEP1931" type="8" flags="97"/>
</Activity>
<Activity id="934" ActivityType="13" flags="0" name="Read_status">
<Rect left="100" top="534" right="200" bottom="566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="935" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="744" right="256" bottom="776"/>
</Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="84" right="256" bottom="116"/>
</Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="74" right="496" bottom="106"/>
</Activity>
<Activity id="938" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="674" right="496" bottom="706"/>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="Rearview Mirror Direction Adjust Switch State">
<Rect left="580" top="674" right="680" bottom="706"/>
<Line3Text Enable="1" Text="后视镜方向调整左方向按键按下"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="940" ActivityType="3" flags="0" name="L">
<Rect left="580" top="734" right="680" bottom="766"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Read_status">
<Rect left="850" top="84" right="950" bottom="116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="endloop">
<Rect left="850" top="284" right="950" bottom="316"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="284" right="816" bottom="316"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="84" right="816" bottom="116"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="截取字符串">
<Rect left="850" top="144" right="950" bottom="176"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="946" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="850" top="214" right="950" bottom="246"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="7" name="DEP1932" type="8" flags="97"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="734" right="736" bottom="766"/>
</Activity>
<Activity id="948" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="84" right="736" bottom="116"/>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="R">
<Rect left="850" top="354" right="950" bottom="386"/>
<Line3Text Enable="1" Text="后视镜方向调整右方向按键按下"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="950" ActivityType="13" flags="0" name="Read_status">
<Rect left="850" top="434" right="950" bottom="466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="951" ActivityType="3" flags="0" name="endloop">
<Rect left="850" top="654" right="950" bottom="686"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="952" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="654" right="816" bottom="686"/>
</Activity>
<Activity id="953" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="434" right="816" bottom="466"/>
</Activity>
<Activity id="954" ActivityType="3" flags="0" name="截取字符串">
<Rect left="850" top="514" right="950" bottom="546"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="955" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="850" top="584" right="950" bottom="616"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="8" name="DEP1933" type="8" flags="97"/>
</Activity>
<Activity id="956" ActivityType="3" flags="0" name="U">
<Rect left="850" top="744" right="950" bottom="776"/>
<Line3Text Enable="1" Text="后视镜方向调整上方向按键按下"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="957" ActivityType="13" flags="0" name="Read_status">
<Rect left="1100" top="84" right="1200" bottom="116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="958" ActivityType="3" flags="0" name="endloop">
<Rect left="1100" top="304" right="1200" bottom="336"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="959" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="304" right="1066" bottom="336"/>
</Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="84" right="1066" bottom="116"/>
</Activity>
<Activity id="961" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1100" top="164" right="1200" bottom="196"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="962" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1100" top="234" right="1200" bottom="266"/>
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
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="9" name="DEP1934" type="8" flags="97"/>
</Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="744" right="1006" bottom="776"/>
</Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="84" right="1006" bottom="116"/>
</Activity>
<Activity id="965" ActivityType="3" flags="0" name="D">
<Rect left="1100" top="374" right="1200" bottom="406"/>
<Line3Text Enable="1" Text="后视镜方向调整下方向按键按下"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="966" ActivityType="13" flags="0" name="Read_status">
<Rect left="1100" top="434" right="1200" bottom="466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="967" ActivityType="3" flags="0" name="endloop">
<Rect left="1100" top="654" right="1200" bottom="686"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="968" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="654" right="1076" bottom="686"/>
</Activity>
<Activity id="969" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="434" right="1076" bottom="466"/>
</Activity>
<Activity id="970" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1100" top="514" right="1200" bottom="546"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="971" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1100" top="584" right="1200" bottom="616"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="10" name="DEP1935" type="8" flags="97"/>
</Activity>
<Activity id="972" ActivityType="3" flags="0" name="0">
<Rect left="580" top="374" right="680" bottom="406"/>
<Line3Text Enable="1" Text="后视镜功能切换O位置"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="973" ActivityType="13" flags="0" name="Read_status">
<Rect left="580" top="434" right="680" bottom="466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="974" ActivityType="3" flags="0" name="截取字符串">
<Rect left="580" top="494" right="680" bottom="526"/>
<Script>
MeasValue0 = string.byte(DVciResult,4)</Script></Activity>
<Activity id="975" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="580" top="554" right="680" bottom="586"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue0"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2802" pbltext="DEP2273" no="2" name="DEP1927" type="8" flags="97"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="endloop">
<Rect left="580" top="614" right="680" bottom="646"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="977" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="434" right="556" bottom="466"/>
</Activity>
<Activity id="978" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="614" right="556" bottom="646"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="893" EndId="897" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="894" EndId="899" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="0">
</Transition>
<Transition StartId="896" EndId="893" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="898" EndId="894" type="0">
</Transition>
<Transition StartId="899" EndId="934" type="0">
</Transition>
<Transition StartId="901" EndId="902" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="901" EndId="935" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="0">
</Transition>
<Transition StartId="903" EndId="934" type="0">
</Transition>
<Transition StartId="904" EndId="905" type="0">
</Transition>
<Transition StartId="905" EndId="901" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="911" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="908" EndId="913" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="0">
</Transition>
<Transition StartId="910" EndId="907" type="0">
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
<Transition StartId="915" EndId="938" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="0">
</Transition>
<Transition StartId="917" EndId="914" type="0">
</Transition>
<Transition StartId="918" EndId="919" type="0">
</Transition>
<Transition StartId="919" EndId="915" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="0">
</Transition>
<Transition StartId="928" EndId="932" type="0">
</Transition>
<Transition StartId="929" EndId="930" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="929" EndId="972" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="928" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="929" type="0">
</Transition>
<Transition StartId="934" EndId="904" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="0">
</Transition>
<Transition StartId="936" EndId="906" type="0">
</Transition>
<Transition StartId="937" EndId="927" type="0">
</Transition>
<Transition StartId="938" EndId="937" type="0">
</Transition>
<Transition StartId="939" EndId="940" type="0">
</Transition>
<Transition StartId="940" EndId="947" type="0">
</Transition>
<Transition StartId="941" EndId="945" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="942" EndId="949" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="941" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="942" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="944" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="0">
</Transition>
<Transition StartId="950" EndId="954" type="0">
</Transition>
<Transition StartId="951" EndId="952" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="951" EndId="956" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="0">
</Transition>
<Transition StartId="953" EndId="950" type="0">
</Transition>
<Transition StartId="954" EndId="955" type="0">
</Transition>
<Transition StartId="955" EndId="951" type="0">
</Transition>
<Transition StartId="956" EndId="963" type="0">
</Transition>
<Transition StartId="957" EndId="961" type="0">
</Transition>
<Transition StartId="958" EndId="959" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="958" EndId="965" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="0">
</Transition>
<Transition StartId="960" EndId="957" type="0">
</Transition>
<Transition StartId="961" EndId="962" type="0">
</Transition>
<Transition StartId="962" EndId="958" type="0">
</Transition>
<Transition StartId="963" EndId="964" type="0">
</Transition>
<Transition StartId="964" EndId="960" type="0">
</Transition>
<Transition StartId="965" EndId="966" type="0">
</Transition>
<Transition StartId="966" EndId="970" type="0">
</Transition>
<Transition StartId="967" EndId="968" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="967" EndId="2" type="0">
</Transition>
<Transition StartId="968" EndId="969" type="0">
</Transition>
<Transition StartId="969" EndId="966" type="0">
</Transition>
<Transition StartId="970" EndId="971" type="0">
</Transition>
<Transition StartId="971" EndId="967" type="0">
</Transition>
<Transition StartId="972" EndId="973" type="0">
</Transition>
<Transition StartId="973" EndId="974" type="0">
</Transition>
<Transition StartId="974" EndId="975" type="0">
</Transition>
<Transition StartId="975" EndId="976" type="0">
</Transition>
<Transition StartId="976" EndId="939" type="0">
</Transition>
<Transition StartId="976" EndId="978" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="977" EndId="973" type="0">
</Transition>
<Transition StartId="978" EndId="977" type="0">
</Transition>
</Transitions>
</Process>

