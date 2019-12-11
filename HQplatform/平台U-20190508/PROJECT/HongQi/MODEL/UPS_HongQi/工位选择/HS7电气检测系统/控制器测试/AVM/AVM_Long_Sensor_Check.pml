<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="150" top="4" right="250" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="150" top="574" right="250" bottom="606"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="普通节点">
<Rect left="150" top="64" right="250" bottom="96"/>
<Line1Text Enable="1" Text="AVM长传感器检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="32" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="150" top="134" right="250" bottom="166"/>
<Line2Text Enable="1" Text="请站于左AVM前约30cm处"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x2A\xD1&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="普通节点">
<Rect left="150" top="204" right="250" bottom="236"/>
<Script>value = tonumber(LibGeneral.hex2str(string.sub(result,4,-1)),16)</Script></Activity>
<Activity id="34" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="150" top="284" right="250" bottom="316"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="value"/>
<Parameter id="RightViewText" value="&quot;LRU_L Distance&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="25" name="DEP2140" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="150" top="354" right="250" bottom="386"/>
<Line2Text Enable="1" Text="请站于右AVM前约30cm处"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x2A\xD2&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="普通节点">
<Rect left="150" top="424" right="250" bottom="456"/>
<Script>value = tonumber(LibGeneral.hex2str(string.sub(result,4,-1)),16)</Script></Activity>
<Activity id="37" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="150" top="504" right="250" bottom="536"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="50"/>
<Parameter id="LowerLimit" value="20"/>
<Parameter id="MeasValue" value="value"/>
<Parameter id="RightViewText" value="&quot;LRU_R Distance&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="26" name="DEP2141" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="284" right="116" bottom="316"/>
</Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="134" right="116" bottom="166"/>
</Activity>
<Activity id="44" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="354" right="116" bottom="386"/>
</Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="504" right="116" bottom="536"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="34" EndId="38" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="45" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="37" EndId="2" type="0">
</Transition>
<Transition StartId="38" EndId="42" type="0">
</Transition>
<Transition StartId="42" EndId="32" type="0">
</Transition>
<Transition StartId="44" EndId="35" type="0">
</Transition>
<Transition StartId="45" EndId="44" type="0">
</Transition>
</Transitions>
</Process>

