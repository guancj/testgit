<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1234" pbltext="DEP1987">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7A2" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C2" description="CANId"/>
<Variable id="val_val_3" type="5" data="0" description="val_val_3"/>
<Variable id="val_val_2" type="5" data="0" description="val_val_2"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="655" top="30" right="755" bottom="62"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="670" top="1334" right="770" bottom="1366"/>
<Script>--关闭电流
engine.constant_current_output= 0
engine.constant_current_source_A = false
engine.constant_current_source_C = false
engine.constant_current_source_B=false
engine.constant_current_source_D=false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="气囊3">
<Rect left="655" top="92" right="755" bottom="124"/>
<TitleText Enable="1" Text="安全气囊模块（Airbag）"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="安全气囊3"/>
<Script>engine.ecu_CAN_control_2 = false</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="初始化节点">
<Rect left="656" top="157" right="756" bottom="189"/>
<Script>engine.constant_current_output=32767
engine.constant_current_source_A=true
engine.constant_current_source_B=false
engine.constant_current_source_C=true
engine.constant_current_source_D=false
#DELAY  200</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="init">
<Rect left="656" top="225" right="756" bottom="257"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="890" ActivityType="3" flags="0" name="endloop">
<Rect left="659" top="425" right="759" bottom="457"/>
<Script></Script></Activity>
<Activity id="891" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="424" right="616" bottom="456"/>
</Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="284" right="616" bottom="316"/>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="电阻值计算">
<Rect left="658" top="281" right="758" bottom="313"/>
<Script>val_val = math.abs(engine.passenger_front_airbag/engine.constant_current_output);
--val_val=tostring(val_val);
engine.println(type(val_val));</Script></Activity>
<Activity id="895" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="659" top="354" right="759" bottom="386"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="4"/>
<Parameter id="LowerLimit" value="1"/>
<Parameter id="MeasValue" value="val_val"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;Ω&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1 "/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP2000" type="8" flags="97"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="init">
<Rect left="658" top="641" right="758" bottom="673"/>
<Script>Pram_2 = nil;</Script></Activity>
<Activity id="897" ActivityType="3" flags="0" name="endloop">
<Rect left="661" top="841" right="761" bottom="873"/>
<Script></Script></Activity>
<Activity id="898" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="838" right="626" bottom="870"/>
</Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="589" top="699" right="621" bottom="731"/>
</Activity>
<Activity id="900" ActivityType="3" flags="0" name="电阻值计算">
<Rect left="660" top="704" right="760" bottom="736"/>
<Script>val_val_2= math.abs(engine.passenger_front_airbag2/engine.constant_current_output);
--val_val_2=tostring(val_val_2);</Script></Activity>
<Activity id="901" ActivityType="13" flags="1" name="Tolerance_view_Float_A">
<Rect left="660" top="774" right="760" bottom="806"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="4"/>
<Parameter id="LowerLimit" value="1"/>
<Parameter id="MeasValue" value="val_val_2"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;Ω&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1998" type="8" flags="97"/>
</Activity>
<Activity id="902" ActivityType="3" flags="0" name="初始化节点">
<Rect left="655" top="567" right="755" bottom="599"/>
<Script>engine.constant_current_source_A=true
engine.constant_current_source_B=false
engine.constant_current_source_C=true
engine.constant_current_source_D=true</Script></Activity>
<Activity id="903" ActivityType="3" flags="0" name="气囊4">
<Rect left="659" top="495" right="759" bottom="527"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="安全气囊4"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="904" ActivityType="3" flags="0" name="init">
<Rect left="670" top="974" right="770" bottom="1006"/>
<Script>Pram_3 = nil;</Script></Activity>
<Activity id="905" ActivityType="3" flags="0" name="endloop">
<Rect left="670" top="1154" right="770" bottom="1186"/>
<Script></Script></Activity>
<Activity id="906" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1154" right="616" bottom="1186"/>
</Activity>
<Activity id="907" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1034" right="616" bottom="1066"/>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="电压采集">
<Rect left="670" top="1034" right="770" bottom="1066"/>
<Script>val_val= math.abs(engine.TPS_v)*2
--val_val=tostring(val_val);</Script></Activity>
<Activity id="909" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="670" top="1094" right="770" bottom="1126"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_3"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="14"/>
<Parameter id="LowerLimit" value="10"/>
<Parameter id="MeasValue" value="val_val"/>
<Parameter id="RightViewText" value="&quot;电压检测&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;mv&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1999" type="8" flags="97"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="定速巡航取消">
<Rect left="660" top="914" right="760" bottom="946"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="定速巡航开到ON挡"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="912" ActivityType="3" flags="0" name="普通节点">
<Rect left="512" top="537" right="612" bottom="569"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="913" ActivityType="3" flags="0" name="清除界面">
<Rect left="670" top="1244" right="770" bottom="1276"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="894" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="1">
<Expression>FinishFlag_1==false</Expression></Transition>
<Transition StartId="890" EndId="903" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="894" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="890" type="0">
</Transition>
<Transition StartId="896" EndId="900" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="897" EndId="911" type="0">
</Transition>
<Transition StartId="898" EndId="899" type="0">
</Transition>
<Transition StartId="899" EndId="900" type="0">
</Transition>
<Transition StartId="900" EndId="901" type="0">
</Transition>
<Transition StartId="901" EndId="897" type="0">
</Transition>
<Transition StartId="902" EndId="896" type="0">
</Transition>
<Transition StartId="903" EndId="912" type="0">
</Transition>
<Transition StartId="904" EndId="908" type="0">
</Transition>
<Transition StartId="905" EndId="906" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="905" EndId="913" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="908" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="0">
</Transition>
<Transition StartId="909" EndId="905" type="0">
</Transition>
<Transition StartId="911" EndId="904" type="0">
</Transition>
<Transition StartId="912" EndId="902" type="0">
</Transition>
<Transition StartId="913" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

