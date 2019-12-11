<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="4" right="200" bottom="36"/>
<Script>Pram_1 = nil </Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="780" top="1474" right="880" bottom="1506"/>
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
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="司机门转向灯开启"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x62\x03\x01&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="873" ActivityType="13" flags="0" name="Turn_Light_Off">
<Rect left="100" top="364" right="200" bottom="396"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&quot;\xCF\x62\x03\x00&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时200MS">
<Rect left="100" top="434" right="200" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="检测倒车镜上转向灯是否关闭"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认转向灯关闭".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="881" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="100" top="554" right="200" bottom="586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x62\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="890" ActivityType="3" flags="0" name="Check the door lights">
<Rect left="100" top="624" right="200" bottom="656"/>
<Script>Pram_1 = nil </Script></Activity>
<Activity id="891" ActivityType="13" flags="0" name="Turn_Light_On">
<Rect left="100" top="684" right="200" bottom="716"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="门灯检测"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3C\xE7&quot;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="892" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="754" right="200" bottom="786"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="893" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="824" right="200" bottom="856"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;灯光状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="3" name="DEP571" type="8" flags="97"/>
</Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="884" right="76" bottom="916"/>
</Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="684" right="76" bottom="716"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="普通节点">
<Rect left="40" top="494" right="140" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 1</Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="2" name="DEP570" type="8" flags="97"/>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="普通节点">
<Rect left="170" top="494" right="270" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 0</Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="2" name="DEP570" type="8" flags="97"/>
</Activity>
<Activity id="898" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="100" top="304" right="200" bottom="336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x62\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="延时200MS">
<Rect left="100" top="144" right="200" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="检测倒车镜上转向灯是否亮"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认转向灯开启".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="900" ActivityType="3" flags="0" name="普通节点">
<Rect left="40" top="214" right="140" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 1</Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="1" name="DEP569" type="8" flags="97"/>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="普通节点">
<Rect left="170" top="214" right="270" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 0</Script><assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="1" name="DEP569" type="8" flags="97"/>
</Activity>
<Activity id="902" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="884" right="200" bottom="916"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1223" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="780" top="1414" right="880" bottom="1446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1255" ActivityType="13" flags="0" name="Window_up">
<Rect left="480" top="1474" right="580" bottom="1506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1256" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="630" top="1474" right="730" bottom="1506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车窗上升中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="1257" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="100" top="954" right="200" bottom="986"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="1259" ActivityType="3" flags="0" name="init">
<Rect left="100" top="1014" right="200" bottom="1046"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1260" ActivityType="3" flags="0" name="endloop">
<Rect left="100" top="1274" right="200" bottom="1306"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1261" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="1274" right="326" bottom="1306"/>
</Activity>
<Activity id="1262" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="1074" right="326" bottom="1106"/>
</Activity>
<Activity id="1263" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="100" top="1334" right="200" bottom="1366"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="截取字符串">
<Rect left="100" top="1134" right="200" bottom="1166"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1265" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="100" top="1204" right="200" bottom="1236"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="14" name="DEP572" type="8" flags="97"/>
</Activity>
<Activity id="1270" ActivityType="13" flags="0" name="Turn_Light_On">
<Rect left="100" top="1074" right="200" bottom="1106"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x3C\xE7&quot;"/>
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
<Transition StartId="873" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="896" type="5">
</Transition>
<Transition StartId="880" EndId="897" type="6">
</Transition>
<Transition StartId="881" EndId="890" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="893" EndId="902" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="891" type="0">
</Transition>
<Transition StartId="896" EndId="881" type="0">
</Transition>
<Transition StartId="897" EndId="881" type="0">
</Transition>
<Transition StartId="898" EndId="873" type="0">
</Transition>
<Transition StartId="899" EndId="900" type="5">
</Transition>
<Transition StartId="899" EndId="901" type="6">
</Transition>
<Transition StartId="900" EndId="898" type="0">
</Transition>
<Transition StartId="901" EndId="898" type="0">
</Transition>
<Transition StartId="902" EndId="894" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="902" EndId="1257" type="0">
</Transition>
<Transition StartId="1223" EndId="2" type="0">
</Transition>
<Transition StartId="1255" EndId="1256" type="0">
</Transition>
<Transition StartId="1256" EndId="1223" type="0">
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

