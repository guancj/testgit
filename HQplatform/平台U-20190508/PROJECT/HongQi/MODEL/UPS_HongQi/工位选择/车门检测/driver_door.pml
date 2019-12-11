<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1125" pbltext="DEP551">
<Parameters>
<Variable id="DString_C131_Driver_Door_Speaker" type="8" dir="0" data=""/>
<Variable id="DString_C131_handleswic_PEPS" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="625" top="5" right="725" bottom="37"/>
<Script>engine.println("传入door_speaker值类型="..type(DString_C131_Driver_Door_Speaker))
engine.println("传入door_speaker="..DString_C131_Driver_Door_Speaker)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="760" top="1994" right="860" bottom="2026"/>
<Script>engine.power_switch_9V = false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="1" name="DlgMultiInit">
<Rect left="626" top="76" right="726" bottom="108"/>
<TitleText Enable="1" Text="FAW C131 左侧车门检测"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "FAW C131 DOOR-"..Dstring.."--"..tostring(KNR)
engine.SetTitleText(DString_ScreenTitle)</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="320" top="74" right="420" bottom="106"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = false   --左侧车门恒流源切换:前门切换
engine.current_switch_control_B = true    --左侧车门恒流源切换:低频切换
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="init">
<Rect left="325" top="169" right="425" bottom="201"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>--engine.println("前门低频扬声器电阻检测:"..tostring(engine.df_door_bass_speaker))
--engine.println("前门低频扬声器电阻检测值的类型:"..type(engine.df_door_bass_speaker))
val_val=math.abs(engine.df_door_bass_speaker/engine.constant_current_output);
val_val=tonumber(val_val);
--val_val = math.abs(engine.df_door_bass_speaker);</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="endloop">
<Rect left="323" top="467" right="423" bottom="499"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="212" top="469" right="244" bottom="501"/>
</Activity>
<Activity id="845" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="324" top="267" right="424" bottom="299"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="32" name="DEP1946" type="8" flags="97"/>
</Activity>
<Activity id="846" ActivityType="4" flags="0" name="路由节点">
<Rect left="213" top="168" right="245" bottom="200"/>
</Activity>
<Activity id="847" ActivityType="3" flags="0" name="IntAssign">
<Rect left="264" top="350" right="364" bottom="382"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="849" ActivityType="3" flags="0" name="IntAssign">
<Rect left="391" top="349" right="491" bottom="381"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="850" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="219" top="546" right="319" bottom="578"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="851" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="544" right="146" bottom="576"/>
</Activity>
<Activity id="854" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="320" top="615" right="420" bottom="647"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="中高频扬声器"/>
<Script>engine.current_switch_control_B = false    --左侧车门恒流源切换:前门（高频切换）
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="855" ActivityType="3" flags="0" name="init">
<Rect left="320" top="684" right="420" bottom="716"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="中高频扬声器"/>
<Script>val_val = math.abs(engine.df_door_tweeter_speaker/engine.constant_current_output);
val_val = tonumber(val_val);
--val_val = math.abs(engine.df_door_tweeter_speaker);</Script></Activity>
<Activity id="856" ActivityType="3" flags="0" name="endloop">
<Rect left="318" top="986" right="418" bottom="1018"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="857" ActivityType="4" flags="0" name="路由节点">
<Rect left="209" top="981" right="241" bottom="1013"/>
</Activity>
<Activity id="858" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="319" top="786" right="419" bottom="818"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="31" name="DEP2284" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="4" flags="0" name="路由节点">
<Rect left="208" top="684" right="240" bottom="716"/>
</Activity>
<Activity id="860" ActivityType="3" flags="0" name="IntAssign">
<Rect left="259" top="869" right="359" bottom="901"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="IntAssign">
<Rect left="386" top="868" right="486" bottom="900"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="862" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="231" top="1067" right="331" bottom="1099"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#PRESSBUTTON</Script></Activity>
<Activity id="863" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="1063" right="126" bottom="1095"/>
</Activity>
<Activity id="878" ActivityType="4" flags="0" name="路由节点">
<Rect left="355" top="547" right="387" bottom="579"/>
</Activity>
<Activity id="879" ActivityType="4" flags="0" name="路由节点">
<Rect left="358" top="1068" right="390" bottom="1100"/>
</Activity>
<Activity id="937" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="610" top="1184" right="710" bottom="1216"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="门把手传感器"/>
<Line3Text Enable="1" Text="触摸门把手传感器"/>
<Script>val_val =math.abs(engine.df_door_handle)   --左前门把手动作检测
val = math.abs((val_val - val_val_int)*1000);
val = tonumber(val);
</Script></Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="610" top="1464" right="710" bottom="1496"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="940" ActivityType="3" flags="0" name="IntAssign">
<Rect left="550" top="1354" right="650" bottom="1386"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="941" ActivityType="3" flags="0" name="IntAssign">
<Rect left="680" top="1354" right="780" bottom="1386"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="942" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="610" top="1544" right="710" bottom="1576"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="碰撞传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(300)
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.power_switch_9V = true</Script></Activity>
<Activity id="943" ActivityType="3" flags="0" name="init">
<Rect left="610" top="1604" right="710" bottom="1636"/>
<Script>DFloat_Mts3Result = math.abs(engine.crash_sensor_i);
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)</Script></Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="610" top="1814" right="710" bottom="1846"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="1814" right="556" bottom="1846"/>
</Activity>
<Activity id="946" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="610" top="1664" right="710" bottom="1696"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="UpperLimit" value="9000"/>
<Parameter id="LowerLimit" value="1000"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="30" name="DEP2283" type="8" flags="97"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="1604" right="556" bottom="1636"/>
</Activity>
<Activity id="948" ActivityType="3" flags="0" name="IntAssign">
<Rect left="550" top="1724" right="650" bottom="1756"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="949" ActivityType="3" flags="0" name="IntAssign">
<Rect left="680" top="1724" right="780" bottom="1756"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="953" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1124" right="366" bottom="1156"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="1040" top="74" right="1140" bottom="106"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="中高频扬声器"/>
<Script>engine.current_switch_control_B = false</Script></Activity>
<Activity id="956" ActivityType="3" flags="0" name="init">
<Rect left="1040" top="144" right="1140" bottom="176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val = math.abs(engine.df_door_tweeter_speaker/engine.constant_current_output);
val_val=tonumber(val_val);</Script></Activity>
<Activity id="957" ActivityType="3" flags="0" name="endloop">
<Rect left="1040" top="444" right="1140" bottom="476"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="958" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="444" right="996" bottom="476"/>
</Activity>
<Activity id="959" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1040" top="244" right="1140" bottom="276"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="8.0"/>
<Parameter id="LowerLimit" value="2.0"/>
<Parameter id="MeasValue" value="val_val"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="4"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="32" name="DEP1946" type="8" flags="97"/>
</Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="144" right="996" bottom="176"/>
</Activity>
<Activity id="961" ActivityType="3" flags="0" name="IntAssign">
<Rect left="980" top="334" right="1080" bottom="366"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="962" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1140" top="334" right="1240" bottom="366"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="963" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="950" top="524" right="1050" bottom="556"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="524" right="886" bottom="556"/>
</Activity>
<Activity id="965" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="144" right="886" bottom="176"/>
</Activity>
<Activity id="966" ActivityType="4" flags="0" name="路由节点">
<Rect left="1084" top="524" right="1116" bottom="556"/>
</Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="1084" top="584" right="1116" bottom="616"/>
</Activity>
<Activity id="969" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="764" right="776" bottom="796"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="普通节点">
<Rect left="80" top="164" right="180" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="973" ActivityType="3" flags="0" name="普通节点">
<Rect left="60" top="684" right="160" bottom="716"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="974" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="610" top="1274" right="710" bottom="1306"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="33" name="DEP2288" type="8" flags="97"/>
</Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="1254" right="956" bottom="1286"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="普通节点">
<Rect left="610" top="1104" right="710" bottom="1136"/>
<Script>Pram_1 = nil;
val_val_int =math.abs(engine.df_door_handle)</Script></Activity>
<Activity id="977" ActivityType="3" flags="0" name="bsd_led">
<Rect left="940" top="1544" right="1040" bottom="1576"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="碰撞传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(300)
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="978" ActivityType="3" flags="0" name="init">
<Rect left="940" top="1604" right="1040" bottom="1636"/>
<Script>DFloat_Mts3Result = math.abs(engine.bsd_led_v / 200);
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)</Script></Activity>
<Activity id="979" ActivityType="3" flags="0" name="endloop">
<Rect left="940" top="1814" right="1040" bottom="1846"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="980" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="1814" right="1166" bottom="1846"/>
</Activity>
<Activity id="981" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="940" top="1664" right="1040" bottom="1696"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="UpperLimit" value="9000"/>
<Parameter id="LowerLimit" value="1000"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="30" name="DEP2283" type="8" flags="97"/>
</Activity>
<Activity id="982" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="1604" right="1166" bottom="1636"/>
</Activity>
<Activity id="983" ActivityType="3" flags="0" name="IntAssign">
<Rect left="880" top="1724" right="980" bottom="1756"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="984" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1010" top="1724" right="1110" bottom="1756"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="985" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="1814" right="786" bottom="1846"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>DString_C131_Driver_Door_Speaker == "1"</Expression></Transition>
<Transition StartId="3" EndId="955" type="1">
<Expression>DString_C131_Driver_Door_Speaker == "2"</Expression></Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="845" type="0">
</Transition>
<Transition StartId="7" EndId="844" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="7" EndId="878" type="0">
</Transition>
<Transition StartId="844" EndId="846" type="0">
</Transition>
<Transition StartId="845" EndId="847" type="3">
</Transition>
<Transition StartId="845" EndId="849" type="4">
</Transition>
<Transition StartId="846" EndId="6" type="0">
</Transition>
<Transition StartId="847" EndId="7" type="0">
</Transition>
<Transition StartId="849" EndId="7" type="0">
</Transition>
<Transition StartId="850" EndId="851" type="0">
</Transition>
<Transition StartId="850" EndId="854" type="5">
</Transition>
<Transition StartId="851" EndId="971" type="0">
</Transition>
<Transition StartId="854" EndId="855" type="0">
</Transition>
<Transition StartId="855" EndId="858" type="0">
</Transition>
<Transition StartId="856" EndId="857" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="856" EndId="879" type="0">
</Transition>
<Transition StartId="857" EndId="859" type="0">
</Transition>
<Transition StartId="858" EndId="860" type="3">
</Transition>
<Transition StartId="858" EndId="861" type="4">
</Transition>
<Transition StartId="859" EndId="855" type="0">
</Transition>
<Transition StartId="860" EndId="856" type="0">
</Transition>
<Transition StartId="861" EndId="856" type="0">
</Transition>
<Transition StartId="862" EndId="863" type="0">
</Transition>
<Transition StartId="862" EndId="953" type="5">
</Transition>
<Transition StartId="863" EndId="973" type="0">
</Transition>
<Transition StartId="878" EndId="854" type="0">
</Transition>
<Transition StartId="878" EndId="850" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="879" EndId="953" type="0">
</Transition>
<Transition StartId="879" EndId="862" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="937" EndId="974" type="0">
</Transition>
<Transition StartId="938" EndId="942" type="0">
</Transition>
<Transition StartId="938" EndId="975" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="940" EndId="938" type="0">
</Transition>
<Transition StartId="941" EndId="938" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="0">
</Transition>
<Transition StartId="943" EndId="946" type="0">
</Transition>
<Transition StartId="944" EndId="945" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="944" EndId="2" type="0">
</Transition>
<Transition StartId="945" EndId="947" type="0">
</Transition>
<Transition StartId="946" EndId="948" type="3">
</Transition>
<Transition StartId="946" EndId="949" type="4">
</Transition>
<Transition StartId="947" EndId="943" type="0">
</Transition>
<Transition StartId="948" EndId="944" type="0">
</Transition>
<Transition StartId="949" EndId="944" type="0">
</Transition>
<Transition StartId="953" EndId="976" type="1">
<Expression>DString_C131_handleswic_PEPS == "1"</Expression></Transition>
<Transition StartId="953" EndId="942" type="0">
</Transition>
<Transition StartId="955" EndId="956" type="0">
</Transition>
<Transition StartId="956" EndId="959" type="0">
</Transition>
<Transition StartId="957" EndId="958" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="957" EndId="966" type="0">
</Transition>
<Transition StartId="958" EndId="960" type="0">
</Transition>
<Transition StartId="959" EndId="961" type="3">
</Transition>
<Transition StartId="959" EndId="962" type="4">
</Transition>
<Transition StartId="960" EndId="956" type="0">
</Transition>
<Transition StartId="961" EndId="957" type="0">
</Transition>
<Transition StartId="962" EndId="957" type="0">
</Transition>
<Transition StartId="963" EndId="964" type="0">
</Transition>
<Transition StartId="963" EndId="967" type="5">
</Transition>
<Transition StartId="964" EndId="965" type="0">
</Transition>
<Transition StartId="965" EndId="960" type="0">
</Transition>
<Transition StartId="966" EndId="967" type="0">
</Transition>
<Transition StartId="966" EndId="963" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="967" EndId="969" type="0">
</Transition>
<Transition StartId="969" EndId="976" type="0">
</Transition>
<Transition StartId="971" EndId="846" type="0">
</Transition>
<Transition StartId="973" EndId="859" type="0">
</Transition>
<Transition StartId="974" EndId="941" type="4">
</Transition>
<Transition StartId="974" EndId="940" type="3">
</Transition>
<Transition StartId="975" EndId="937" type="0">
</Transition>
<Transition StartId="976" EndId="937" type="0">
</Transition>
<Transition StartId="977" EndId="978" type="0">
</Transition>
<Transition StartId="978" EndId="981" type="0">
</Transition>
<Transition StartId="979" EndId="980" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="979" EndId="2" type="0">
</Transition>
<Transition StartId="980" EndId="982" type="0">
</Transition>
<Transition StartId="981" EndId="983" type="3">
</Transition>
<Transition StartId="981" EndId="984" type="4">
</Transition>
<Transition StartId="982" EndId="978" type="0">
</Transition>
<Transition StartId="983" EndId="979" type="0">
</Transition>
<Transition StartId="984" EndId="979" type="0">
</Transition>
<Transition StartId="985" EndId="977" type="1">
<Expression>LibGeneral.H7_BSD(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

