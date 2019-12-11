<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="4" right="330" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="814" right="330" bottom="846"/>
<Script>engine.power_switch_9V = false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="司机侧碰撞传感器">
<Rect left="230" top="64" right="330" bottom="96"/>
<Line2Text Enable="1" Text="碰撞传感器检测"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.power_switch_9V = true</Script></Activity>
<Activity id="943" ActivityType="3" flags="0" name="crash_sensor_i">
<Rect left="230" top="124" right="330" bottom="156"/>
<Script>
DFloat_Mts3Result = math.abs(engine.crash_sensor_i);
DFloat_Mts3Result=tonumber(DFloat_Mts3Result);</Script></Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="230" top="244" right="330" bottom="276"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="244" right="206" bottom="276"/>
</Activity>
<Activity id="946" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="230" top="184" right="330" bottom="216"/>
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
<Parameter id="TimeOut" value="45"/>
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
<Rect left="174" top="124" right="206" bottom="156"/>
</Activity>
<Activity id="951" ActivityType="3" flags="0" name="中高频检测">
<Rect left="230" top="304" right="330" bottom="336"/>
<Line2Text Enable="1" Text="中高频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = false
engine.current_switch_control_B = false    --左侧车门恒流源切换:前门（高频切换）
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="952" ActivityType="3" flags="0" name="init">
<Rect left="230" top="364" right="330" bottom="396"/>
<Script>val_val = math.abs(engine.df_door_tweeter_speaker / engine.constant_current_output);
val_val=tonumber(val_val)
--val_val = math.abs(engine.df_door_tweeter_speaker);</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="endloop">
<Rect left="230" top="504" right="330" bottom="536"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="504" right="206" bottom="536"/>
</Activity>
<Activity id="955" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="230" top="434" right="330" bottom="466"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="31" name="DEP2284" type="8" flags="97"/>
</Activity>
<Activity id="956" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="364" right="206" bottom="396"/>
</Activity>
<Activity id="957" ActivityType="3" flags="1" name="Proximity_and_Crash_Sensor">
<Rect left="230" top="624" right="330" bottom="656"/>
<Script>val_val =math.abs(engine.df_door_handle)   --左前门把手动作检测
val = math.abs((val_val - val_val_int)*1000);
val = tonumber(val);
</Script></Activity>
<Activity id="958" ActivityType="3" flags="0" name="endloop">
<Rect left="230" top="744" right="330" bottom="776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="961" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="230" top="684" right="330" bottom="716"/>
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
<Rect left="174" top="624" right="206" bottom="656"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="门把手传感器">
<Rect left="230" top="564" right="330" bottom="596"/>
<Line1Text Enable="1" Text="司机门检测(DDCU)"/>
<Line2Text Enable="1" Text="门把手传感器"/>
<Line3Text Enable="1" Text="触摸门把手传感器"/>
<Script>Pram_1 = nil;
val_val_int =math.abs(engine.df_door_handle)</Script></Activity>
<Activity id="977" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="744" right="206" bottom="776"/>
</Activity>
<Activity id="978" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="504" right="436" bottom="536"/>
</Activity>
<Activity id="979" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="814" right="436" bottom="846"/>
</Activity>
<Activity id="980" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="524" right="376" bottom="556"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="943" type="0">
</Transition>
<Transition StartId="943" EndId="946" type="0">
</Transition>
<Transition StartId="944" EndId="945" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="944" EndId="951" type="0">
</Transition>
<Transition StartId="945" EndId="947" type="0">
</Transition>
<Transition StartId="946" EndId="944" type="0">
</Transition>
<Transition StartId="947" EndId="943" type="0">
</Transition>
<Transition StartId="951" EndId="952" type="0">
</Transition>
<Transition StartId="952" EndId="955" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="953" EndId="978" type="0">
</Transition>
<Transition StartId="954" EndId="956" type="0">
</Transition>
<Transition StartId="955" EndId="953" type="0">
</Transition>
<Transition StartId="956" EndId="952" type="0">
</Transition>
<Transition StartId="957" EndId="961" type="0">
</Transition>
<Transition StartId="958" EndId="977" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="958" EndId="2" type="0">
</Transition>
<Transition StartId="961" EndId="958" type="0">
</Transition>
<Transition StartId="975" EndId="957" type="0">
</Transition>
<Transition StartId="976" EndId="957" type="0">
</Transition>
<Transition StartId="977" EndId="975" type="0">
</Transition>
<Transition StartId="978" EndId="979" type="0">
</Transition>
<Transition StartId="979" EndId="2" type="0">
</Transition>
<Transition StartId="980" EndId="976" type="1">
<Expression>LibGeneral.CarTNC_HS7_PEPS_IN(engine.CarType)</Expression></Transition>
</Transitions>
</Process>

