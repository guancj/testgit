<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="4" right="200" bottom="36"/>
<Script>Pram_1 = nil </Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1100" top="864" right="1200" bottom="896"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="Turn_Light_On">
<Rect left="100" top="64" right="200" bottom="96"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="转向灯开启"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x82\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="873" ActivityType="13" flags="0" name="Turn_Light_Off">
<Rect left="100" top="254" right="200" bottom="286"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x82\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时200MS">
<Rect left="250" top="374" right="350" bottom="406"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="881" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="100" top="424" right="200" bottom="456"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x82\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="890" ActivityType="3" flags="0" name="Check the door lights">
<Rect left="100" top="494" right="200" bottom="526"/>
<Script>Pram_1 = nil </Script></Activity>
<Activity id="891" ActivityType="13" flags="0" name="Door_Light_On">
<Rect left="100" top="554" right="200" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="门灯检测"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3D\x07&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="892" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="624" right="200" bottom="656"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="893" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="694" right="200" bottom="726"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="25" name="DEP776" type="8" flags="97"/>
</Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="764" right="76" bottom="796"/>
</Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="554" right="76" bottom="586"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="764" right="200" bottom="796"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="250" top="194" right="350" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x82\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="转向灯开启检查">
<Rect left="100" top="134" right="200" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测倒车镜上转向灯是否亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="900" ActivityType="3" flags="0" name="转向灯关闭检查">
<Rect left="100" top="314" right="200" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测倒车镜上转向灯是否关闭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="901" ActivityType="3" flags="0" name="检测成功">
<Rect left="250" top="134" right="350" bottom="166"/>
<Script></Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="23" name="DEP774" type="8" flags="97"/>
</Activity>
<Activity id="902" ActivityType="3" flags="0" name="检测失败">
<Rect left="100" top="194" right="200" bottom="226"/>
<Script></Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="23" name="DEP774" type="8" flags="97"/>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="检测成功">
<Rect left="250" top="314" right="350" bottom="346"/>
<Script></Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="24" name="DEP775" type="8" flags="97"/>
</Activity>
<Activity id="904" ActivityType="3" flags="0" name="检测失败">
<Rect left="100" top="374" right="200" bottom="406"/>
<Script></Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="24" name="DEP775" type="8" flags="97"/>
</Activity>
<Activity id="905" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="800" top="444" right="900" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃下降"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="906" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="800" top="804" right="900" bottom="836"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="907" ActivityType="13" flags="0" name="Window_up">
<Rect left="1100" top="444" right="1200" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="978" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="1100" top="804" right="1200" bottom="836"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1224" ActivityType="3" flags="0" name="init">
<Rect left="800" top="504" right="900" bottom="536"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1232" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="564" right="900" bottom="596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1243" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="744" right="900" bottom="776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1244" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="744" right="776" bottom="776"/>
</Activity>
<Activity id="1245" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="564" right="776" bottom="596"/>
</Activity>
<Activity id="1246" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="624" right="900" bottom="656"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1247" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="684" right="900" bottom="716"/>
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
<Rect left="1100" top="504" right="1200" bottom="536"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Read_status">
<Rect left="1100" top="564" right="1200" bottom="596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1250" ActivityType="3" flags="0" name="endloop">
<Rect left="1100" top="744" right="1200" bottom="776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="744" right="1076" bottom="776"/>
</Activity>
<Activity id="1252" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="564" right="1076" bottom="596"/>
</Activity>
<Activity id="1253" ActivityType="3" flags="1" name="截取字符串">
<Rect left="1100" top="624" right="1200" bottom="656"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1254" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1100" top="684" right="1200" bottom="716"/>
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
<Activity id="1255" ActivityType="13" flags="0" name="Window_up">
<Rect left="800" top="864" right="900" bottom="896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1256" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="950" top="864" right="1050" bottom="896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车窗上升中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  3000</Script></Activity>
<Activity id="1257" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="370" top="484" right="470" bottom="516"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="1259" ActivityType="3" flags="0" name="init">
<Rect left="370" top="544" right="470" bottom="576"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1260" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="804" right="470" bottom="836"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1261" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="804" right="586" bottom="836"/>
</Activity>
<Activity id="1262" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="604" right="586" bottom="636"/>
</Activity>
<Activity id="1263" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="370" top="864" right="470" bottom="896"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="截取字符串">
<Rect left="370" top="664" right="470" bottom="696"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1265" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="734" right="470" bottom="766"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="15" name="DEP2528" type="8" flags="97"/>
</Activity>
<Activity id="1270" ActivityType="13" flags="0" name="Door_Light">
<Rect left="370" top="604" right="470" bottom="636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3D\x07&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="899" type="0">
</Transition>
<Transition StartId="873" EndId="900" type="0">
</Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="881" EndId="890" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="893" EndId="896" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="891" type="0">
</Transition>
<Transition StartId="896" EndId="894" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="896" EndId="1257" type="0">
</Transition>
<Transition StartId="898" EndId="873" type="0">
</Transition>
<Transition StartId="898" EndId="903" type="0">
</Transition>
<Transition StartId="899" EndId="901" type="6">
</Transition>
<Transition StartId="899" EndId="902" type="5">
</Transition>
<Transition StartId="900" EndId="903" type="6">
</Transition>
<Transition StartId="900" EndId="904" type="5">
</Transition>
<Transition StartId="901" EndId="898" type="0">
</Transition>
<Transition StartId="902" EndId="898" type="0">
</Transition>
<Transition StartId="903" EndId="880" type="0">
</Transition>
<Transition StartId="904" EndId="880" type="0">
</Transition>
<Transition StartId="905" EndId="1224" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="1248" type="0">
</Transition>
<Transition StartId="978" EndId="2" type="0">
</Transition>
<Transition StartId="1224" EndId="1232" type="0">
</Transition>
<Transition StartId="1232" EndId="1246" type="0">
</Transition>
<Transition StartId="1243" EndId="1244" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1243" EndId="906" type="0">
</Transition>
<Transition StartId="1244" EndId="1245" type="0">
</Transition>
<Transition StartId="1245" EndId="1232" type="0">
</Transition>
<Transition StartId="1246" EndId="1247" type="0">
</Transition>
<Transition StartId="1247" EndId="1243" type="0">
</Transition>
<Transition StartId="1248" EndId="1249" type="0">
</Transition>
<Transition StartId="1249" EndId="1253" type="0">
</Transition>
<Transition StartId="1250" EndId="1251" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1251" EndId="1252" type="0">
</Transition>
<Transition StartId="1252" EndId="1249" type="0">
</Transition>
<Transition StartId="1253" EndId="1254" type="0">
</Transition>
<Transition StartId="1254" EndId="1250" type="0">
</Transition>
<Transition StartId="1255" EndId="1256" type="0">
</Transition>
<Transition StartId="1256" EndId="978" type="0">
</Transition>
<Transition StartId="1257" EndId="1259" type="0">
</Transition>
<Transition StartId="1259" EndId="1270" type="0">
</Transition>
<Transition StartId="1260" EndId="1261" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1260" EndId="1263" type="0">
</Transition>
<Transition StartId="1261" EndId="1262" type="0">
</Transition>
<Transition StartId="1262" EndId="1270" type="0">
</Transition>
<Transition StartId="1263" EndId="1255" type="0">
</Transition>
<Transition StartId="1264" EndId="1265" type="0">
</Transition>
<Transition StartId="1265" EndId="1260" type="0">
</Transition>
<Transition StartId="1270" EndId="1264" type="0">
</Transition>
</Transitions>
</Process>

