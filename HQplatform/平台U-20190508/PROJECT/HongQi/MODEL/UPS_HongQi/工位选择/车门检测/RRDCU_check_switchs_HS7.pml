<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="220" top="14" right="320" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="704" right="590" bottom="736"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="按右后门窗点动上升">
<Rect left="760" top="44" right="860" bottom="76"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按右后门窗点动上升"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="965" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="104" right="860" bottom="136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="966" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="284" right="860" bottom="316"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="284" right="976" bottom="316"/>
</Activity>
<Activity id="968" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="104" right="976" bottom="136"/>
</Activity>
<Activity id="969" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="164" right="860" bottom="196"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="970" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="224" right="860" bottom="256"/>
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
<assessment block="1" ptbtext="DEP164" group="2808" pbltext="DEP2276" no="3" name="DEP2039" type="8" flags="97"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="按右后门窗连续上升">
<Rect left="760" top="344" right="860" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按右后门窗连续上升（升到顶）"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="972" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="404" right="860" bottom="436"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="973" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="584" right="860" bottom="616"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="974" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="584" right="976" bottom="616"/>
</Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="404" right="976" bottom="436"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="464" right="860" bottom="496"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="977" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="524" right="860" bottom="556"/>
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
<assessment block="1" ptbtext="DEP164" group="2808" pbltext="DEP2276" no="4" name="DEP2040" type="8" flags="97"/>
</Activity>
<Activity id="978" ActivityType="3" flags="0" name="按右后门窗点动下降">
<Rect left="220" top="74" right="320" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按右后门窗点动下降"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="979" ActivityType="13" flags="0" name="Read_status">
<Rect left="220" top="134" right="320" bottom="166"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="980" ActivityType="3" flags="0" name="endloop">
<Rect left="220" top="314" right="320" bottom="346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="981" ActivityType="4" flags="0" name="路由节点">
<Rect left="134" top="314" right="166" bottom="346"/>
</Activity>
<Activity id="982" ActivityType="4" flags="0" name="路由节点">
<Rect left="134" top="134" right="166" bottom="166"/>
</Activity>
<Activity id="983" ActivityType="3" flags="0" name="截取字符串">
<Rect left="220" top="194" right="320" bottom="226"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="984" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="220" top="254" right="320" bottom="286"/>
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
<assessment block="1" ptbtext="DEP164" group="2808" pbltext="DEP2276" no="1" name="DEP2041" type="8" flags="97"/>
</Activity>
<Activity id="985" ActivityType="3" flags="0" name="按右后门窗连续下降">
<Rect left="220" top="374" right="320" bottom="406"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按右后门窗连续下降"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 =nil;</Script></Activity>
<Activity id="986" ActivityType="13" flags="0" name="Read_status">
<Rect left="220" top="434" right="320" bottom="466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="987" ActivityType="3" flags="0" name="endloop">
<Rect left="220" top="614" right="320" bottom="646"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="988" ActivityType="4" flags="0" name="路由节点">
<Rect left="134" top="614" right="166" bottom="646"/>
</Activity>
<Activity id="989" ActivityType="4" flags="0" name="路由节点">
<Rect left="134" top="434" right="166" bottom="466"/>
</Activity>
<Activity id="990" ActivityType="3" flags="0" name="截取字符串">
<Rect left="220" top="494" right="320" bottom="526"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="991" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="220" top="554" right="320" bottom="586"/>
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
<assessment block="1" ptbtext="DEP164" group="2808" pbltext="DEP2276" no="2" name="DEP2042" type="8" flags="97"/>
</Activity>
<Activity id="992" ActivityType="3" flags="0" name="将玻璃上升">
<Rect left="760" top="644" right="860" bottom="676"/>
<TitleText Enable="1" Text="HS7车门检测"/>
<Line1Text Enable="1" Text="请将右后玻璃升到顶"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>--engine.SetLineText(1,"#L=请将右后玻璃升到顶".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="978" type="0">
</Transition>
<Transition StartId="3" EndId="965" type="0">
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
<Transition StartId="973" EndId="992" type="0">
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
<Transition StartId="987" EndId="3" type="0">
</Transition>
<Transition StartId="988" EndId="989" type="0">
</Transition>
<Transition StartId="989" EndId="986" type="0">
</Transition>
<Transition StartId="990" EndId="991" type="0">
</Transition>
<Transition StartId="991" EndId="987" type="0">
</Transition>
<Transition StartId="992" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

