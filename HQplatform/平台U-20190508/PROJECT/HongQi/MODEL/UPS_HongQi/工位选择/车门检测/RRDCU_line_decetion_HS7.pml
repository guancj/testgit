<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="14" right="400" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="664" right="400" bottom="696"/>
<Script>engine.current_switch_control_A = false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="高频检测">
<Rect left="300" top="84" right="400" bottom="116"/>
<Line2Text Enable="1" Text="高频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = true   --后门
engine.current_switch_control_B = false    --高频
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="init">
<Rect left="300" top="144" right="400" bottom="176"/>
<Script>--val_val = math.abs(engine.df_door_tweeter_speaker / engine.constant_current_output);
--val_val = math.abs(engine.df_door_tweeter_speaker);
val_val = math.abs(engine.pr_door_bass_speaker / engine.constant_current_output);
--val_val=tostring(val_val)
</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="endloop">
<Rect left="300" top="284" right="400" bottom="316"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="234" top="284" right="266" bottom="316"/>
</Activity>
<Activity id="955" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="300" top="214" right="400" bottom="246"/>
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
<Parameter id="TimeOut" value="45"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="37" name="DEP2279" type="8" flags="97"/>
</Activity>
<Activity id="956" ActivityType="4" flags="0" name="路由节点">
<Rect left="234" top="144" right="266" bottom="176"/>
</Activity>
<Activity id="957" ActivityType="3" flags="0" name="普通节点">
<Rect left="1040" top="324" right="1140" bottom="356"/>
<Line1Text Enable="1" Text="右后门(RPDCU)"/>
<Line2Text Enable="1" Text="触摸门把手传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val_int =math.abs(engine.pr_door_handle)  --读取传感器默认值</Script></Activity>
<Activity id="958" ActivityType="3" flags="0" name="普通节点">
<Rect left="1040" top="414" right="1140" bottom="446"/>
<Script>val_val =math.abs(engine.pr_door_handle)   --左前门把手动作检测

val = math.abs((val_val - val_val_int)*1000)
--val=tostring(val)</Script></Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="1040" top="654" right="1140" bottom="686"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="960" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1040" top="474" right="1140" bottom="506"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="26" name="DEP2243" type="8" flags="97"/>
</Activity>
<Activity id="961" ActivityType="3" flags="0" name="IntAssign">
<Rect left="980" top="534" right="1080" bottom="566"/>
<Script>DInt_Speaker_Check_Again  = 0</Script></Activity>
<Activity id="962" ActivityType="3" flags="0" name="IntAssign">
<Rect left="1130" top="534" right="1230" bottom="566"/>
<Script>DInt_Speaker_Check_Again  = 1</Script></Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="654" right="986" bottom="686"/>
</Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="414" right="986" bottom="446"/>
</Activity>
<Activity id="965" ActivityType="3" flags="0" name="触摸门把手传感器">
<Rect left="300" top="364" right="400" bottom="396"/>
<Line1Text Enable="1" Text="右后门(RPDCU)"/>
<Line2Text Enable="1" Text="触摸门把手传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val_int =math.abs(engine.pr_door_handle)--读取传感器默认值</Script></Activity>
<Activity id="966" ActivityType="3" flags="0" name="普通节点">
<Rect left="300" top="434" right="400" bottom="466"/>
<Script>val_val =math.abs(engine.pr_door_handle)   --右后门把手动作检测

val = math.abs((val_val - val_val_int)*1000)</Script></Activity>
<Activity id="967" ActivityType="3" flags="0" name="endloop">
<Rect left="300" top="594" right="400" bottom="626"/>
<Script></Script></Activity>
<Activity id="968" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="300" top="504" right="400" bottom="536"/>
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
<Activity id="971" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="594" right="256" bottom="626"/>
</Activity>
<Activity id="972" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="434" right="256" bottom="466"/>
</Activity>
<Activity id="973" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="284" right="556" bottom="316"/>
</Activity>
<Activity id="974" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="664" right="556" bottom="696"/>
</Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="314" right="446" bottom="346"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="955" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="953" EndId="973" type="0">
</Transition>
<Transition StartId="954" EndId="956" type="0">
</Transition>
<Transition StartId="955" EndId="953" type="0">
</Transition>
<Transition StartId="956" EndId="4" type="0">
</Transition>
<Transition StartId="957" EndId="958" type="0">
</Transition>
<Transition StartId="958" EndId="960" type="0">
</Transition>
<Transition StartId="959" EndId="963" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="960" EndId="961" type="3">
</Transition>
<Transition StartId="960" EndId="962" type="4">
</Transition>
<Transition StartId="961" EndId="959" type="0">
</Transition>
<Transition StartId="962" EndId="959" type="0">
</Transition>
<Transition StartId="963" EndId="964" type="0">
</Transition>
<Transition StartId="964" EndId="958" type="0">
</Transition>
<Transition StartId="965" EndId="966" type="0">
</Transition>
<Transition StartId="966" EndId="968" type="0">
</Transition>
<Transition StartId="967" EndId="971" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="967" EndId="2" type="0">
</Transition>
<Transition StartId="968" EndId="967" type="0">
</Transition>
<Transition StartId="971" EndId="972" type="0">
</Transition>
<Transition StartId="972" EndId="966" type="0">
</Transition>
<Transition StartId="973" EndId="974" type="0">
</Transition>
<Transition StartId="974" EndId="2" type="0">
</Transition>
<Transition StartId="975" EndId="965" type="1">
<Expression>LibGeneral.CarTNC_HS7_PEPS_IN(engine.CarType)</Expression></Transition>
</Transitions>
</Process>

