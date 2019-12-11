<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1126" pbltext="DEP119">
<Parameters>
<Variable id="DString_C131_handleswic_PEPS" type="8" dir="0" data="DString_C131_handleswic_PEPS"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="240" top="54" right="340" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="500" top="1004" right="600" bottom="1036"/>
<Script>engine.Delay(1000)</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="240" top="124" right="340" bottom="156"/>
<TitleText Enable="1" Text="左后门检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = true   --左侧车门恒流源切换:前门切换
engine.current_switch_control_B = false    --左侧车门恒流源切换:前门（低频切换）
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="init">
<Rect left="240" top="194" right="340" bottom="226"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>engine.println("前门低频扬声器电阻检测:"..tostring(engine.df_door_bass_speaker))
engine.println("前门低频扬声器电阻检测值的类型:"..type(engine.df_door_bass_speaker))
val_val = math.abs(engine.dr_door_bass_speaker/engine.constant_current_output);
--val_val=tostring(val_val);
--val_val = math.abs(engine.df_door_bass_speaker);</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="endloop">
<Rect left="240" top="414" right="340" bottom="446"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="414" right="146" bottom="446"/>
</Activity>
<Activity id="845" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="240" top="264" right="340" bottom="296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="8"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="val_val"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="13" name="DEP2293" type="8" flags="97"/>
</Activity>
<Activity id="846" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="194" right="146" bottom="226"/>
</Activity>
<Activity id="847" ActivityType="3" flags="0" name="IntAssign">
<Rect left="180" top="334" right="280" bottom="366"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="848" ActivityType="3" flags="0" name="IntAssign">
<Rect left="310" top="334" right="410" bottom="366"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="850" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="80" top="504" right="180" bottom="536"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#PRESSBUTTON</Script></Activity>
<Activity id="852" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="240" top="644" right="340" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="门把手传感器"/>
<Line3Text Enable="1" Text="触摸门把手传感器"/>
<Line4Text Enable="1"/>
<Script>--engine.current_switch_control_B = false    --左侧车门恒流源切换:前门（高频切换）
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="855" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="504" right="306" bottom="536"/>
</Activity>
<Activity id="881" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="240" top="764" right="340" bottom="796"/>
<Script>val_val =math.abs(engine.dr_door_handle)   --后门把手动作检测
val = math.abs((val_val - val_val_int)*1000);
--val=tostring(val);
</Script></Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="240" top="1004" right="340" bottom="1036"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="939" ActivityType="3" flags="0" name="IntAssign">
<Rect left="180" top="914" right="280" bottom="946"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="941" ActivityType="3" flags="0" name="IntAssign">
<Rect left="310" top="914" right="410" bottom="946"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="942" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="240" top="834" right="340" bottom="866"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="UpperLimit" value="60"/>
<Parameter id="LowerLimit" value="30"/>
<Parameter id="MeasValue" value="val"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="34" name="DEP2292" type="8" flags="97"/>
</Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="764" right="176" bottom="796"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="普通节点">
<Rect left="240" top="704" right="340" bottom="736"/>
<Script>Pram_1 = nil;
--val_val_int =math.abs(engine.df_door_handle)
val_val_int =math.abs(engine.dr_door_handle);

</Script></Activity>
<Activity id="977" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="1004" right="176" bottom="1036"/>
</Activity>
<Activity id="978" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="574" right="566" bottom="606"/>
</Activity>
<Activity id="979" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="574" right="306" bottom="606"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="845" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="7" EndId="855" type="0">
</Transition>
<Transition StartId="8" EndId="846" type="0">
</Transition>
<Transition StartId="845" EndId="847" type="3">
</Transition>
<Transition StartId="845" EndId="848" type="4">
</Transition>
<Transition StartId="846" EndId="5" type="0">
</Transition>
<Transition StartId="847" EndId="7" type="0">
</Transition>
<Transition StartId="848" EndId="7" type="0">
</Transition>
<Transition StartId="850" EndId="8" type="0">
</Transition>
<Transition StartId="850" EndId="979" type="5">
</Transition>
<Transition StartId="852" EndId="976" type="0">
</Transition>
<Transition StartId="855" EndId="979" type="0">
</Transition>
<Transition StartId="855" EndId="850" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="881" EndId="942" type="0">
</Transition>
<Transition StartId="938" EndId="977" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="938" EndId="2" type="0">
</Transition>
<Transition StartId="939" EndId="938" type="0">
</Transition>
<Transition StartId="941" EndId="938" type="0">
</Transition>
<Transition StartId="942" EndId="941" type="4">
</Transition>
<Transition StartId="942" EndId="939" type="3">
</Transition>
<Transition StartId="975" EndId="881" type="0">
</Transition>
<Transition StartId="976" EndId="881" type="0">
</Transition>
<Transition StartId="977" EndId="975" type="0">
</Transition>
<Transition StartId="978" EndId="2" type="0">
</Transition>
<Transition StartId="979" EndId="852" type="1">
<Expression>DString_C131_handleswic_PEPS == "1"</Expression></Transition>
<Transition StartId="979" EndId="978" type="0">
</Transition>
</Transitions>
</Process>

