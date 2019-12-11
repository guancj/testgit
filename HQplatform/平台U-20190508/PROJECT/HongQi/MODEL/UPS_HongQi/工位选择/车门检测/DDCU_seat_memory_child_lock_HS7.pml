<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="880" top="14" right="980" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1130" top="494" right="1230" bottom="526"/>
<Script></Script></End>
<Activities>
<Activity id="933" ActivityType="3" flags="0" name="打开儿童座椅开关">
<Rect left="880" top="74" right="980" bottom="106"/>
<Line2Text Enable="1" Text="按下车窗禁止开关(手动)"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="934" ActivityType="13" flags="0" name="Read_status">
<Rect left="880" top="154" right="980" bottom="186"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3C\xED&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="394" right="980" bottom="426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="394" right="856" bottom="426"/>
</Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="154" right="856" bottom="186"/>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="截取字符串">
<Rect left="880" top="234" right="980" bottom="266"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="939" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="880" top="314" right="980" bottom="346"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="8" name="DEP2016" type="8" flags="97"/>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="关闭儿童座椅开关">
<Rect left="1130" top="74" right="1230" bottom="106"/>
<Line2Text Enable="1" Text="关闭车窗禁止开关(手动)"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="943" ActivityType="13" flags="0" name="Read_status">
<Rect left="1130" top="154" right="1230" bottom="186"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3C\xED&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="1130" top="394" right="1230" bottom="426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="1074" top="394" right="1106" bottom="426"/>
</Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="1074" top="154" right="1106" bottom="186"/>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1130" top="234" right="1230" bottom="266"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1130" top="314" right="1230" bottom="346"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="9" name="DEP2017" type="8" flags="97"/>
</Activity>
<Activity id="949" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="394" right="1026" bottom="426"/>
</Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="74" right="1026" bottom="106"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="934" type="0">
</Transition>
<Transition StartId="934" EndId="938" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="935" EndId="949" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="934" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="935" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="0">
</Transition>
<Transition StartId="943" EndId="947" type="0">
</Transition>
<Transition StartId="944" EndId="945" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="944" EndId="2" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="943" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="944" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="0">
</Transition>
<Transition StartId="950" EndId="942" type="0">
</Transition>
</Transitions>
</Process>

