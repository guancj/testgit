<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="4" right="200" bottom="36"/>
<Script>Pram_1 = nil </Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="824" right="590" bottom="856"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="Lock_Door">
<Rect left="100" top="64" right="200" bottom="96"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="副司机门上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x80\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时200MS">
<Rect left="100" top="364" right="200" bottom="396"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="881" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="100" top="424" right="200" bottom="456"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x80\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="882" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="314" right="200" bottom="346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="886" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="314" right="76" bottom="346"/>
</Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="134" right="76" bottom="166"/>
</Activity>
<Activity id="891" ActivityType="13" flags="0" name="Read_DoorLock_State">
<Rect left="100" top="554" right="200" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="门灯检测"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3D\x06&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="892" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="624" right="200" bottom="656"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="734" right="76" bottom="766"/>
</Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="554" right="76" bottom="586"/>
</Activity>
<Activity id="896" ActivityType="13" flags="0" name="Read_DoorLock_State">
<Rect left="100" top="134" right="200" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="门灯检测"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3D\x06&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="194" right="200" bottom="226"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="254" right="200" bottom="286"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;门灯状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="27" name="DEP1968" type="8" flags="97"/>
</Activity>
<Activity id="899" ActivityType="13" flags="0" name="UNLock_Door">
<Rect left="100" top="494" right="200" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="副司机门上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x80\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="900" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="674" right="200" bottom="706"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;门灯状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="28" name="DEP1969" type="8" flags="97"/>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="734" right="200" bottom="766"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="902" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="100" top="794" right="200" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x80\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="320" top="544" right="420" bottom="576"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1247" ActivityType="3" flags="0" name="init">
<Rect left="320" top="614" right="420" bottom="646"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1248" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="824" right="296" bottom="856"/>
</Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="320" top="734" right="420" bottom="766"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="100" name="DEP2531" type="8" flags="97"/>
</Activity>
<Activity id="1250" ActivityType="3" flags="1" name="初始化">
<Rect left="320" top="674" right="420" bottom="706"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="674" right="296" bottom="706"/>
</Activity>
<Activity id="1252" ActivityType="3" flags="0" name="endloop">
<Rect left="320" top="824" right="420" bottom="856"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="896" type="0">
</Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="881" EndId="899" type="0">
</Transition>
<Transition StartId="882" EndId="886" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="882" EndId="880" type="0">
</Transition>
<Transition StartId="886" EndId="889" type="0">
</Transition>
<Transition StartId="889" EndId="896" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="900" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="891" type="0">
</Transition>
<Transition StartId="896" EndId="897" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="898" EndId="882" type="0">
</Transition>
<Transition StartId="899" EndId="891" type="0">
</Transition>
<Transition StartId="900" EndId="901" type="0">
</Transition>
<Transition StartId="901" EndId="894" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="901" EndId="902" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="0">
</Transition>
<Transition StartId="903" EndId="1247" type="0">
</Transition>
<Transition StartId="1247" EndId="1250" type="0">
</Transition>
<Transition StartId="1248" EndId="1251" type="0">
</Transition>
<Transition StartId="1249" EndId="1252" type="0">
</Transition>
<Transition StartId="1250" EndId="1249" type="0">
</Transition>
<Transition StartId="1251" EndId="1250" type="0">
</Transition>
<Transition StartId="1252" EndId="1248" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1252" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

