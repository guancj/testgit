<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987">
<Parameters>
<Variable id="DString_C131_handleswic_PEPS" type="8" dir="0" data=""/>
</Parameters>
<Variables>
<Variable id="crash" type="11" data="" description="crash"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="24" right="400" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="670" top="944" right="770" bottom="976"/>
<Script>engine.current_switch_control_A = false
engine.current_switch_control_B = false</Script><TitleText Enable="1"/>
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
<Rect left="300" top="94" right="400" bottom="126"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "FAW C131 DOOR-"..Dstring.."--"..tostring(KNR)
engine.SetTitleText(DString_ScreenTitle)
engine.constant_current_output = 32767
engine.current_switch_control_A = true   --左侧车门恒流源切换:前门切换</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="低频扬声器">
<Rect left="300" top="154" right="400" bottom="186"/>
<Line1Text Enable="1" Text="右后门(RPDCU)"/>
<Line2Text Enable="1" Text="低频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.current_switch_control_B = true    --左侧车门恒流源切换:前门（低频切换）
Pram_1 = nil;</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="init">
<Rect left="300" top="224" right="400" bottom="256"/>
<Script>val_val = math.abs(engine.pr_door_bass_speaker / engine.constant_current_output);
--val_val=tostring(val_val)</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="endloop">
<Rect left="310" top="434" right="410" bottom="466"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="434" right="256" bottom="466"/>
</Activity>
<Activity id="845" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="300" top="284" right="400" bottom="316"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="42" name="DEP2282" type="8" flags="97"/>
</Activity>
<Activity id="846" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="224" right="256" bottom="256"/>
</Activity>
<Activity id="847" ActivityType="3" flags="0" name="IntAssign">
<Rect left="380" top="364" right="480" bottom="396"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="849" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="180" top="504" right="280" bottom="536"/>
<Line1Text Enable="1" Text="插头是否正确连接？"/>
<Line2Text Enable="1" Text="重试一次？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.current_switch_control_B = false </Script></Activity>
<Activity id="851" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="504" right="136" bottom="536"/>
</Activity>
<Activity id="933" ActivityType="3" flags="0" name="IntAssign">
<Rect left="260" top="364" right="360" bottom="396"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="935" ActivityType="3" flags="0" name="触摸门把手传感器">
<Rect left="310" top="634" right="410" bottom="666"/>
<Line1Text Enable="1" Text="右后门(RPDCU)"/>
<Line2Text Enable="1" Text="触摸门把手传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.println("crash:"..DString_C131_handleswic_PEPS); 
engine.current_switch_control_B = false
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val_int =math.abs(engine.pr_door_handle)--读取传感器默认值</Script></Activity>
<Activity id="936" ActivityType="3" flags="0" name="高低音频切换">
<Rect left="310" top="564" right="410" bottom="596"/>
<Script>--if(DString_C131_handleswic_PEPS==1)then
--	crash=true;
--else
--        crash=false;
--end
--engine.println("crash:"..crash); </Script></Activity>
<Activity id="937" ActivityType="3" flags="0" name="普通节点">
<Rect left="310" top="704" right="410" bottom="736"/>
<Script>val_val =math.abs(engine.pr_door_handle)   --右前门把手动作检测

val = math.abs((val_val - val_val_int)*1000)
--val=tostring(val)</Script></Activity>
<Activity id="938" ActivityType="3" flags="0" name="endloop">
<Rect left="320" top="944" right="420" bottom="976"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="939" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="310" top="774" right="410" bottom="806"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="43" name="DEP2291" type="8" flags="97"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="IntAssign">
<Rect left="260" top="844" right="360" bottom="876"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="941" ActivityType="3" flags="0" name="IntAssign">
<Rect left="390" top="844" right="490" bottom="876"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="942" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="944" right="236" bottom="976"/>
</Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="704" right="236" bottom="736"/>
</Activity>
<Activity id="944" ActivityType="3" flags="0" name="普通节点">
<Rect left="70" top="154" right="170" bottom="186"/>
<Script>engine.Delay(500);</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="845" type="0">
</Transition>
<Transition StartId="7" EndId="844" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="7" EndId="936" type="0">
</Transition>
<Transition StartId="844" EndId="846" type="0">
</Transition>
<Transition StartId="845" EndId="847" type="3">
</Transition>
<Transition StartId="845" EndId="933" type="4">
</Transition>
<Transition StartId="846" EndId="5" type="0">
</Transition>
<Transition StartId="847" EndId="7" type="0">
</Transition>
<Transition StartId="849" EndId="851" type="6">
</Transition>
<Transition StartId="851" EndId="944" type="0">
</Transition>
<Transition StartId="933" EndId="7" type="0">
</Transition>
<Transition StartId="935" EndId="937" type="0">
</Transition>
<Transition StartId="936" EndId="935" type="1">
<Expression>DString_C131_handleswic_PEPS=="1"</Expression></Transition>
<Transition StartId="936" EndId="2" type="0">
</Transition>
<Transition StartId="937" EndId="939" type="0">
</Transition>
<Transition StartId="938" EndId="942" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="938" EndId="2" type="0">
</Transition>
<Transition StartId="939" EndId="940" type="3">
</Transition>
<Transition StartId="939" EndId="941" type="4">
</Transition>
<Transition StartId="940" EndId="938" type="0">
</Transition>
<Transition StartId="941" EndId="938" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="0">
</Transition>
<Transition StartId="943" EndId="937" type="0">
</Transition>
</Transitions>
</Process>

