<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="90" top="24" right="190" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="764" right="420" bottom="796"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="锁主驾车门">
<Rect left="90" top="84" right="190" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="主驾车门自动锁"/>
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
<Parameter id="sendTel" value="&quot;\xCF\x60\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="Read_status">
<Rect left="90" top="134" right="190" bottom="166"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE6&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="endloop">
<Rect left="90" top="294" right="190" bottom="326"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="294" right="66" bottom="326"/>
</Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="134" right="66" bottom="166"/>
</Activity>
<Activity id="918" ActivityType="3" flags="0" name="截取字符串">
<Rect left="90" top="184" right="190" bottom="216"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="919" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="90" top="234" right="190" bottom="266"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="4" name="DEP1924" type="8" flags="97"/>
</Activity>
<Activity id="920" ActivityType="13" flags="0" name="主驾车门解锁">
<Rect left="90" top="434" right="190" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="主驾车门自动解锁"/>
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
<Parameter id="sendTel" value="&quot;\xCF\x60\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="921" ActivityType="13" flags="0" name="Read_status">
<Rect left="90" top="504" right="190" bottom="536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE6&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="922" ActivityType="3" flags="0" name="endloop">
<Rect left="90" top="714" right="190" bottom="746"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="923" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="714" right="66" bottom="746"/>
</Activity>
<Activity id="924" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="504" right="66" bottom="536"/>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="截取字符串">
<Rect left="90" top="564" right="190" bottom="596"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="90" top="634" right="190" bottom="666"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="5" name="DEP1925" type="8" flags="97"/>
</Activity>
<Activity id="927" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="90" top="824" right="190" bottom="856"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x60\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="929" ActivityType="13" flags="0" name="Read_status">
<Rect left="710" top="154" right="810" bottom="186"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE8&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="930" ActivityType="3" flags="0" name="endloop">
<Rect left="710" top="394" right="810" bottom="426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="864" top="394" right="896" bottom="426"/>
</Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="864" top="154" right="896" bottom="186"/>
</Activity>
<Activity id="933" ActivityType="3" flags="0" name="截取字符串">
<Rect left="710" top="234" right="810" bottom="266"/>
<Script>
MeasValue=string.byte(DVciResult,4)</Script></Activity>
<Activity id="934" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="710" top="314" right="810" bottom="346"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="6" name="DEP2149" type="8" flags="97"/>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="按下中央锁开关">
<Rect left="710" top="84" right="810" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动检测"/>
<Line3Text Enable="1" Text="按下中央锁开关"/>
<Line4Text Enable="1"/>
<Script>Pram_1=nil</Script></Activity>
<Activity id="936" ActivityType="13" flags="0" name="Read_status">
<Rect left="710" top="534" right="810" bottom="566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE8&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="937" ActivityType="3" flags="0" name="endloop">
<Rect left="710" top="764" right="810" bottom="796"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="938" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="764" right="906" bottom="796"/>
</Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="534" right="906" bottom="566"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="截取字符串">
<Rect left="710" top="614" right="810" bottom="646"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="710" top="694" right="810" bottom="726"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="7" name="DEP2150" type="8" flags="97"/>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="解除中央锁开关">
<Rect left="710" top="464" right="810" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动检测"/>
<Line3Text Enable="1" Text="解除中央锁开关"/>
<Line4Text Enable="1"/>
<Script>Pram_1=nil</Script></Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="824" right="296" bottom="856"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="84" right="296" bottom="116"/>
</Activity>
<Activity id="945" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="90" top="364" right="190" bottom="396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x60\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1246" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="490" top="414" right="590" bottom="446"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1247" ActivityType="3" flags="0" name="init">
<Rect left="490" top="484" right="590" bottom="516"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1248" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="684" right="456" bottom="716"/>
</Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="490" top="614" right="590" bottom="646"/>
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
<Rect left="490" top="544" right="590" bottom="576"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="544" right="456" bottom="576"/>
</Activity>
<Activity id="1252" ActivityType="3" flags="0" name="endloop">
<Rect left="490" top="684" right="590" bottom="716"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="918" type="0">
</Transition>
<Transition StartId="915" EndId="916" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="915" EndId="945" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="0">
</Transition>
<Transition StartId="917" EndId="10" type="0">
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
<Transition StartId="927" EndId="943" type="0">
</Transition>
<Transition StartId="929" EndId="933" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="930" EndId="942" type="0">
</Transition>
<Transition StartId="931" EndId="932" type="0">
</Transition>
<Transition StartId="932" EndId="929" type="0">
</Transition>
<Transition StartId="933" EndId="934" type="0">
</Transition>
<Transition StartId="934" EndId="930" type="0">
</Transition>
<Transition StartId="935" EndId="929" type="0">
</Transition>
<Transition StartId="936" EndId="940" type="0">
</Transition>
<Transition StartId="937" EndId="938" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="937" EndId="1246" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="936" type="0">
</Transition>
<Transition StartId="940" EndId="941" type="0">
</Transition>
<Transition StartId="941" EndId="937" type="0">
</Transition>
<Transition StartId="942" EndId="936" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="935" type="0">
</Transition>
<Transition StartId="945" EndId="920" type="0">
</Transition>
<Transition StartId="1246" EndId="1247" type="0">
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

