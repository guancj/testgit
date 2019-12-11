<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3019" pbltext="DEP113">
<Parameters>
<Variable id="DString_C131_Passenger_Door_Speaker" type="8" dir="0" data=""/>
<Variable id="DString_C131_handleswic_PEPS" type="8" dir="0" data="DString_C131_handleswic_PEPS"/>
</Parameters>
<Variables>
<Variable id="crashpl" type="11" data="" description="crashpl"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="612" top="63" right="712" bottom="95"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="700" top="2654" right="800" bottom="2686"/>
<Script>engine.Delay(2000)</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="613" top="126" right="713" bottom="158"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "FAW C131 DOOR-"..Dstring.."--"..tostring(KNR)
engine.SetTitleText(DString_ScreenTitle)</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="270" top="124" right="370" bottom="156"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = false   --左侧车门恒流源切换:前门切换
engine.current_switch_control_B = true    --左侧车门恒流源切换:前门（低频切换）
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="低频扬声器">
<Rect left="273" top="214" right="373" bottom="246"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Script>val_val = math.abs(engine.pf_door_bass_speaker / engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="843" ActivityType="3" flags="0" name="endloop">
<Rect left="271" top="512" right="371" bottom="544"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="193" top="513" right="225" bottom="545"/>
</Activity>
<Activity id="845" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="272" top="312" right="372" bottom="344"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="38" name="DEP2289" type="8" flags="97"/>
</Activity>
<Activity id="846" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="214" right="226" bottom="246"/>
</Activity>
<Activity id="848" ActivityType="3" flags="0" name="IntAssign">
<Rect left="212" top="395" right="312" bottom="427"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="849" ActivityType="3" flags="0" name="IntAssign">
<Rect left="339" top="394" right="439" bottom="426"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="850" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="170" top="584" right="270" bottom="616"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="852" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="584" right="106" bottom="616"/>
</Activity>
<Activity id="854" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="270" top="654" right="370" bottom="686"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="中频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.current_switch_control_B = false    --左侧车门恒流源切换:前门（低频切换）</Script></Activity>
<Activity id="855" ActivityType="3" flags="0" name="init">
<Rect left="270" top="714" right="370" bottom="746"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="856" ActivityType="3" flags="0" name="endloop">
<Rect left="266" top="1031" right="366" bottom="1063"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="857" ActivityType="4" flags="0" name="路由节点">
<Rect left="222" top="1032" right="254" bottom="1064"/>
</Activity>
<Activity id="858" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="267" top="831" right="367" bottom="863"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="8"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="val_val "/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="39" name="DEP1947" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="774" right="256" bottom="806"/>
</Activity>
<Activity id="860" ActivityType="3" flags="0" name="IntAssign">
<Rect left="207" top="914" right="307" bottom="946"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="IntAssign">
<Rect left="334" top="913" right="434" bottom="945"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="862" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="170" top="1114" right="270" bottom="1146"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="863" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="1114" right="126" bottom="1146"/>
</Activity>
<Activity id="864" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="714" right="126" bottom="746"/>
</Activity>
<Activity id="865" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="270" top="1194" right="370" bottom="1226"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="高频扬声器"/>
<Script></Script></Activity>
<Activity id="866" ActivityType="3" flags="0" name="init">
<Rect left="270" top="1254" right="370" bottom="1286"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="endloop">
<Rect left="269" top="1580" right="369" bottom="1612"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="868" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="1584" right="206" bottom="1616"/>
</Activity>
<Activity id="869" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="270" top="1374" right="370" bottom="1406"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="40" name="DEP2048" type="8" flags="97"/>
</Activity>
<Activity id="870" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="1314" right="206" bottom="1346"/>
</Activity>
<Activity id="871" ActivityType="3" flags="0" name="IntAssign">
<Rect left="210" top="1463" right="310" bottom="1495"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="872" ActivityType="3" flags="0" name="IntAssign">
<Rect left="337" top="1462" right="437" bottom="1494"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="873" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="190" top="1654" right="290" bottom="1686"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="874" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="1654" right="156" bottom="1686"/>
</Activity>
<Activity id="875" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="1254" right="156" bottom="1286"/>
</Activity>
<Activity id="877" ActivityType="3" flags="0" name="IWertKleiner">
<Rect left="272" top="1710" right="372" bottom="1742"/>
<Script>DIntRepeat = 4</Script></Activity>
<Activity id="890" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="1139" top="124" right="1239" bottom="156"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="中频扬声器"/>
<Script></Script></Activity>
<Activity id="891" ActivityType="3" flags="0" name="init">
<Rect left="1138" top="194" right="1238" bottom="226"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val = math.abs(engine.pf_door_bass_speaker / engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="892" ActivityType="3" flags="0" name="endloop">
<Rect left="1137" top="495" right="1237" bottom="527"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="893" ActivityType="4" flags="0" name="路由节点">
<Rect left="1036" top="495" right="1068" bottom="527"/>
</Activity>
<Activity id="894" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1138" top="295" right="1238" bottom="327"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="8"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="38" name="DEP2289" type="8" flags="97"/>
</Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="1036" top="193" right="1068" bottom="225"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1078" top="378" right="1178" bottom="410"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="897" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1205" top="377" right="1305" bottom="409"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="898" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="1050" top="576" right="1150" bottom="608"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="915" top="570" right="947" bottom="602"/>
</Activity>
<Activity id="900" ActivityType="4" flags="0" name="路由节点">
<Rect left="915" top="192" right="947" bottom="224"/>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="1142" top="673" right="1242" bottom="705"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="高频扬声器"/>
<Script></Script></Activity>
<Activity id="902" ActivityType="3" flags="0" name="init">
<Rect left="1142" top="746" right="1242" bottom="778"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val = math.abs(engine.pf_door_tweeter_speaker/ engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="903" ActivityType="3" flags="0" name="endloop">
<Rect left="1140" top="1044" right="1240" bottom="1076"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="904" ActivityType="4" flags="0" name="路由节点">
<Rect left="1042" top="1043" right="1074" bottom="1075"/>
</Activity>
<Activity id="905" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1141" top="844" right="1241" bottom="876"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="8"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="39" name="DEP1947" type="8" flags="97"/>
</Activity>
<Activity id="906" ActivityType="4" flags="0" name="路由节点">
<Rect left="1047" top="745" right="1079" bottom="777"/>
</Activity>
<Activity id="907" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1081" top="927" right="1181" bottom="959"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="908" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1208" top="926" right="1308" bottom="958"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="909" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="1072" top="1122" right="1172" bottom="1154"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="931" top="1122" right="963" bottom="1154"/>
</Activity>
<Activity id="911" ActivityType="4" flags="0" name="路由节点">
<Rect left="931" top="744" right="963" bottom="776"/>
</Activity>
<Activity id="912" ActivityType="3" flags="0" name="IWertKleiner">
<Rect left="1143" top="1174" right="1243" bottom="1206"/>
<Script>DIntRepeat = 4</Script></Activity>
<Activity id="914" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="1774" right="1216" bottom="1806"/>
</Activity>
<Activity id="916" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="684" top="1769" right="784" bottom="1801"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="触摸车门把手传感器"/>
<Script>engine.println("crash:"..DString_C131_handleswic_PEPS); 
Pram_1 = nil;
val_val_int =math.abs(engine.pf_door_handle)</Script></Activity>
<Activity id="917" ActivityType="3" flags="0" name="endloop">
<Rect left="688" top="2074" right="788" bottom="2106"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="918" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="680" top="1904" right="780" bottom="1936"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="41" name="DEP2290" type="8" flags="97"/>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="IntAssign">
<Rect left="630" top="1974" right="730" bottom="2006"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="920" ActivityType="3" flags="0" name="IntAssign">
<Rect left="760" top="1974" right="860" bottom="2006"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="930" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="2654" right="136" bottom="2686"/>
</Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="2654" right="1216" bottom="2686"/>
</Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="584" right="336" bottom="616"/>
</Activity>
<Activity id="933" ActivityType="4" flags="0" name="路由节点">
<Rect left="303" top="1110" right="335" bottom="1142"/>
</Activity>
<Activity id="934" ActivityType="4" flags="0" name="路由节点">
<Rect left="311" top="1658" right="343" bottom="1690"/>
</Activity>
<Activity id="935" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="574" right="1206" bottom="606"/>
</Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="1177" top="1122" right="1209" bottom="1154"/>
</Activity>
<Activity id="937" ActivityType="3" flags="0" name="普通节点">
<Rect left="40" top="214" right="140" bottom="246"/>
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
<Activity id="938" ActivityType="3" flags="0" name="普通节点">
<Rect left="270" top="774" right="370" bottom="806"/>
<Script>val_val = math.abs(engine.pf_door_tweeter_speaker/ engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="939" ActivityType="3" flags="0" name="普通节点">
<Rect left="270" top="1314" right="370" bottom="1346"/>
<Script>val_val = math.abs(engine.pf_door_tweeter_speaker/ engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="940" ActivityType="3" flags="0" name="普通节点">
<Rect left="680" top="1834" right="780" bottom="1866"/>
<Script>val_val =math.abs(engine.pf_door_handle)   --右前门把手动作检测

val = math.abs((val_val - val_val_int)*1000)
--val=tostring(val)</Script></Activity>
<Activity id="941" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="2074" right="586" bottom="2106"/>
</Activity>
<Activity id="942" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="1834" right="586" bottom="1866"/>
</Activity>
<Activity id="943" ActivityType="3" flags="0" name="普通节点">
<Rect left="280" top="1784" right="380" bottom="1816"/>
<Script>--if(DString_C131_handleswic_PEPS==1)then
--	crashpl=true;
--else
--        crashpl=false;
--end
--engine.println("crash:"..DString_C131_handleswic_PEPS); </Script></Activity>
<Activity id="945" ActivityType="3" flags="0" name="普通节点">
<Rect left="610" top="2134" right="710" bottom="2166"/>
<Script>engine.Delay(2000)</Script></Activity>
<Activity id="946" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="350" top="2204" right="450" bottom="2236"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="碰撞传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(300)
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.power_switch_9V = true</Script></Activity>
<Activity id="947" ActivityType="3" flags="0" name="init">
<Rect left="350" top="2264" right="450" bottom="2296"/>
<Script>
DFloat_Mts3Result = math.abs(engine.crash_sensor_i);
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="948" ActivityType="3" flags="0" name="endloop">
<Rect left="350" top="2564" right="450" bottom="2596"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="949" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="2564" right="286" bottom="2596"/>
</Activity>
<Activity id="950" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="350" top="2354" right="450" bottom="2386"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="35" name="DEP2277" type="8" flags="97"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="2264" right="286" bottom="2296"/>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="IntAssign">
<Rect left="290" top="2444" right="390" bottom="2476"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="IntAssign">
<Rect left="420" top="2444" right="520" bottom="2476"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="2204" right="1216" bottom="2236"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="bsd_led">
<Rect left="720" top="2274" right="820" bottom="2306"/>
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
<Rect left="720" top="2334" right="820" bottom="2366"/>
<Script>DFloat_Mts3Result = math.abs(engine.bsd_led_v / 200);
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)</Script></Activity>
<Activity id="979" ActivityType="3" flags="0" name="endloop">
<Rect left="720" top="2544" right="820" bottom="2576"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="980" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="2544" right="986" bottom="2576"/>
</Activity>
<Activity id="981" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="720" top="2394" right="820" bottom="2426"/>
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
<Rect left="954" top="2334" right="986" bottom="2366"/>
</Activity>
<Activity id="983" ActivityType="3" flags="0" name="IntAssign">
<Rect left="660" top="2454" right="760" bottom="2486"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="984" ActivityType="3" flags="0" name="IntAssign">
<Rect left="790" top="2454" right="890" bottom="2486"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="985" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="2564" right="516" bottom="2596"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="1">
<Expression>DString_C131_Passenger_Door_Speaker == "1"</Expression></Transition>
<Transition StartId="3" EndId="890" type="1">
<Expression>DString_C131_Passenger_Door_Speaker == "2"</Expression></Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="845" type="0">
</Transition>
<Transition StartId="843" EndId="844" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="843" EndId="932" type="0">
</Transition>
<Transition StartId="844" EndId="846" type="0">
</Transition>
<Transition StartId="845" EndId="848" type="3">
</Transition>
<Transition StartId="845" EndId="849" type="4">
</Transition>
<Transition StartId="846" EndId="6" type="0">
</Transition>
<Transition StartId="848" EndId="843" type="0">
</Transition>
<Transition StartId="849" EndId="843" type="0">
</Transition>
<Transition StartId="850" EndId="852" type="6">
</Transition>
<Transition StartId="850" EndId="854" type="5">
</Transition>
<Transition StartId="852" EndId="937" type="0">
</Transition>
<Transition StartId="854" EndId="855" type="0">
</Transition>
<Transition StartId="855" EndId="938" type="0">
</Transition>
<Transition StartId="856" EndId="857" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="856" EndId="933" type="0">
</Transition>
<Transition StartId="857" EndId="859" type="0">
</Transition>
<Transition StartId="858" EndId="860" type="3">
</Transition>
<Transition StartId="858" EndId="861" type="4">
</Transition>
<Transition StartId="859" EndId="938" type="0">
</Transition>
<Transition StartId="860" EndId="856" type="0">
</Transition>
<Transition StartId="861" EndId="856" type="0">
</Transition>
<Transition StartId="862" EndId="863" type="6">
</Transition>
<Transition StartId="862" EndId="865" type="5">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="855" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="939" type="0">
</Transition>
<Transition StartId="867" EndId="868" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="867" EndId="934" type="0">
</Transition>
<Transition StartId="868" EndId="870" type="0">
</Transition>
<Transition StartId="869" EndId="871" type="3">
</Transition>
<Transition StartId="869" EndId="872" type="4">
</Transition>
<Transition StartId="870" EndId="939" type="0">
</Transition>
<Transition StartId="871" EndId="867" type="0">
</Transition>
<Transition StartId="872" EndId="867" type="0">
</Transition>
<Transition StartId="873" EndId="874" type="6">
</Transition>
<Transition StartId="873" EndId="877" type="5">
</Transition>
<Transition StartId="874" EndId="875" type="0">
</Transition>
<Transition StartId="875" EndId="866" type="0">
</Transition>
<Transition StartId="877" EndId="943" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="0">
</Transition>
<Transition StartId="891" EndId="894" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="892" EndId="935" type="0">
</Transition>
<Transition StartId="893" EndId="895" type="0">
</Transition>
<Transition StartId="894" EndId="896" type="3">
</Transition>
<Transition StartId="894" EndId="897" type="4">
</Transition>
<Transition StartId="895" EndId="891" type="0">
</Transition>
<Transition StartId="896" EndId="892" type="0">
</Transition>
<Transition StartId="897" EndId="892" type="0">
</Transition>
<Transition StartId="898" EndId="899" type="6">
</Transition>
<Transition StartId="898" EndId="901" type="5">
</Transition>
<Transition StartId="899" EndId="900" type="0">
</Transition>
<Transition StartId="900" EndId="895" type="0">
</Transition>
<Transition StartId="901" EndId="902" type="0">
</Transition>
<Transition StartId="902" EndId="905" type="0">
</Transition>
<Transition StartId="903" EndId="904" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="903" EndId="936" type="0">
</Transition>
<Transition StartId="904" EndId="906" type="0">
</Transition>
<Transition StartId="905" EndId="907" type="3">
</Transition>
<Transition StartId="905" EndId="908" type="4">
</Transition>
<Transition StartId="906" EndId="902" type="0">
</Transition>
<Transition StartId="907" EndId="903" type="0">
</Transition>
<Transition StartId="908" EndId="903" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="6">
</Transition>
<Transition StartId="909" EndId="912" type="5">
</Transition>
<Transition StartId="910" EndId="911" type="0">
</Transition>
<Transition StartId="911" EndId="906" type="0">
</Transition>
<Transition StartId="912" EndId="914" type="0">
</Transition>
<Transition StartId="914" EndId="916" type="1">
<Expression>DString_C131_handleswic_PEPS ==  1</Expression></Transition>
<Transition StartId="914" EndId="954" type="0">
</Transition>
<Transition StartId="916" EndId="940" type="0">
</Transition>
<Transition StartId="917" EndId="945" type="0">
</Transition>
<Transition StartId="917" EndId="941" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="918" EndId="919" type="3">
</Transition>
<Transition StartId="918" EndId="920" type="4">
</Transition>
<Transition StartId="919" EndId="917" type="0">
</Transition>
<Transition StartId="920" EndId="917" type="0">
</Transition>
<Transition StartId="930" EndId="2" type="0">
</Transition>
<Transition StartId="931" EndId="2" type="0">
</Transition>
<Transition StartId="932" EndId="854" type="0">
</Transition>
<Transition StartId="932" EndId="850" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="933" EndId="865" type="0">
</Transition>
<Transition StartId="933" EndId="862" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="934" EndId="877" type="0">
</Transition>
<Transition StartId="934" EndId="873" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="935" EndId="901" type="0">
</Transition>
<Transition StartId="935" EndId="898" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="936" EndId="912" type="0">
</Transition>
<Transition StartId="936" EndId="909" type="1">
<Expression>DInt_Speaker_Check_Again == 1</Expression></Transition>
<Transition StartId="937" EndId="846" type="0">
</Transition>
<Transition StartId="938" EndId="858" type="0">
</Transition>
<Transition StartId="939" EndId="869" type="0">
</Transition>
<Transition StartId="940" EndId="918" type="0">
</Transition>
<Transition StartId="941" EndId="942" type="0">
</Transition>
<Transition StartId="942" EndId="940" type="0">
</Transition>
<Transition StartId="943" EndId="946" type="0">
</Transition>
<Transition StartId="943" EndId="916" type="1">
<Expression>DString_C131_handleswic_PEPS=="1"</Expression></Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="0">
</Transition>
<Transition StartId="947" EndId="950" type="0">
</Transition>
<Transition StartId="948" EndId="949" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="948" EndId="2" type="0">
</Transition>
<Transition StartId="949" EndId="951" type="0">
</Transition>
<Transition StartId="950" EndId="952" type="3">
</Transition>
<Transition StartId="950" EndId="953" type="4">
</Transition>
<Transition StartId="951" EndId="947" type="0">
</Transition>
<Transition StartId="952" EndId="948" type="0">
</Transition>
<Transition StartId="953" EndId="948" type="0">
</Transition>
<Transition StartId="954" EndId="946" type="0">
</Transition>
<Transition StartId="955" EndId="978" type="0">
</Transition>
<Transition StartId="978" EndId="981" type="0">
</Transition>
<Transition StartId="979" EndId="980" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
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
<Transition StartId="985" EndId="955" type="1">
<Expression>LibGeneral.H7_BSD(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

