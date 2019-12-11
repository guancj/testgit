<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="260" top="34" right="360" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="260" top="634" right="360" bottom="666"/>
<Script>engine.current_switch_control_A = false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="高频检测">
<Rect left="260" top="104" right="360" bottom="136"/>
<Line2Text Enable="1" Text="高频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = true   --后门
engine.current_switch_control_B = false    --高频
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="952" ActivityType="3" flags="0" name="init">
<Rect left="260" top="164" right="360" bottom="196"/>
<Script>--val_val = math.abs(engine.df_door_tweeter_speaker / engine.constant_current_output);
--val_val = math.abs(engine.df_door_tweeter_speaker);
val_val = math.abs(engine.dr_door_bass_speaker / engine.constant_current_output);
val_val=tonumber(val_val)</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="endloop">
<Rect left="260" top="304" right="360" bottom="336"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="304" right="236" bottom="336"/>
</Activity>
<Activity id="955" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="260" top="234" right="360" bottom="266"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="13" name="DEP2293" type="8" flags="97"/>
</Activity>
<Activity id="956" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="164" right="236" bottom="196"/>
</Activity>
<Activity id="978" ActivityType="3" flags="0" name="触摸门把手传感器">
<Rect left="260" top="384" right="360" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="门把手传感器"/>
<Line3Text Enable="1" Text="触摸门把手传感器"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
val_val_int =math.abs(engine.dr_door_handle);</Script></Activity>
<Activity id="979" ActivityType="3" flags="0" name="Proximity_and_Crash_Sensor">
<Rect left="260" top="444" right="360" bottom="476"/>
<Script>val_val =math.abs(engine.dr_door_handle)   --左后门把手动作检测
val = math.abs((val_val - val_val_int)*1000)
</Script></Activity>
<Activity id="980" ActivityType="3" flags="0" name="endloop">
<Rect left="260" top="564" right="360" bottom="596"/>
<Script></Script></Activity>
<Activity id="983" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="260" top="504" right="360" bottom="536"/>
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
<Activity id="984" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="444" right="236" bottom="476"/>
</Activity>
<Activity id="986" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="564" right="236" bottom="596"/>
</Activity>
<Activity id="987" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="304" right="446" bottom="336"/>
</Activity>
<Activity id="988" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="634" right="446" bottom="666"/>
</Activity>
<Activity id="989" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="334" right="406" bottom="366"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="952" type="0">
</Transition>
<Transition StartId="952" EndId="955" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="953" EndId="987" type="0">
</Transition>
<Transition StartId="954" EndId="956" type="0">
</Transition>
<Transition StartId="955" EndId="953" type="0">
</Transition>
<Transition StartId="956" EndId="952" type="0">
</Transition>
<Transition StartId="978" EndId="979" type="0">
</Transition>
<Transition StartId="979" EndId="983" type="0">
</Transition>
<Transition StartId="980" EndId="986" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="980" EndId="2" type="0">
</Transition>
<Transition StartId="983" EndId="980" type="0">
</Transition>
<Transition StartId="984" EndId="979" type="0">
</Transition>
<Transition StartId="986" EndId="984" type="0">
</Transition>
<Transition StartId="987" EndId="988" type="0">
</Transition>
<Transition StartId="988" EndId="2" type="0">
</Transition>
<Transition StartId="989" EndId="978" type="1">
<Expression>LibGeneral.CarTNC_HS7_PEPS_IN(engine.CarType)</Expression></Transition>
</Transitions>
</Process>

