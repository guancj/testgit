<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="220" top="4" right="320" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="220" top="764" right="320" bottom="796"/>
<Script></Script></End>
<Activities>
<Activity id="991" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="220" top="694" right="320" bottom="726"/>
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
<Activity id="999" ActivityType="13" flags="0" name="Window_up">
<Rect left="220" top="374" right="320" bottom="406"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
<Activity id="1008" ActivityType="3" flags="0" name="init">
<Rect left="220" top="444" right="320" bottom="476"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1009" ActivityType="3" flags="0" name="endloop">
<Rect left="220" top="634" right="320" bottom="666"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1010" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="634" right="176" bottom="666"/>
</Activity>
<Activity id="1011" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="220" top="574" right="320" bottom="606"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30.0"/>
<Parameter id="LowerLimit" value="1.5"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1012" ActivityType="3" flags="0" name="初始化">
<Rect left="220" top="504" right="320" bottom="536"/>
<Script>DFloat_Mts3Result = (engine.df_door_i)  /1000</Script></Activity>
<Activity id="1013" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="504" right="176" bottom="536"/>
</Activity>
<Activity id="1014" ActivityType="13" flags="0" name="Turn_Light_Off">
<Rect left="220" top="304" right="320" bottom="336"/>
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
<Activity id="1015" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="220" top="244" right="320" bottom="276"/>
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
<Activity id="1016" ActivityType="3" flags="0" name="延时200MS">
<Rect left="220" top="74" right="320" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认玻璃是否下降".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="1017" ActivityType="3" flags="1" name="普通节点">
<Rect left="160" top="154" right="260" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 1</Script><assessment block="4" ptbtext="DEP1657" group="114" pbltext="DEP1658" no="0" type="8" flags="97"/>
</Activity>
<Activity id="1018" ActivityType="3" flags="0" name="普通节点">
<Rect left="290" top="154" right="390" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 0</Script><assessment block="4" ptbtext="DEP1657" group="114" pbltext="DEP1658" no="0" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="991" EndId="2" type="0">
</Transition>
<Transition StartId="999" EndId="1008" type="0">
</Transition>
<Transition StartId="1008" EndId="1012" type="0">
</Transition>
<Transition StartId="1009" EndId="1010" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1009" EndId="991" type="0">
</Transition>
<Transition StartId="1010" EndId="1013" type="0">
</Transition>
<Transition StartId="1011" EndId="1009" type="0">
</Transition>
<Transition StartId="1012" EndId="1011" type="0">
</Transition>
<Transition StartId="1013" EndId="1012" type="0">
</Transition>
<Transition StartId="1014" EndId="999" type="0">
</Transition>
<Transition StartId="1015" EndId="1014" type="0">
</Transition>
<Transition StartId="1016" EndId="1017" type="5">
</Transition>
<Transition StartId="1016" EndId="1018" type="6">
</Transition>
<Transition StartId="1017" EndId="1015" type="0">
</Transition>
<Transition StartId="1018" EndId="1015" type="0">
</Transition>
</Transitions>
</Process>

