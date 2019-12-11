<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="180" right="280" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="180" top="834" right="280" bottom="866"/>
<Script>engine.power_switch_9V = false</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="右前门碰撞传感器">
<Rect left="180" top="64" right="280" bottom="96"/>
<Line2Text Enable="1" Text="碰撞传感器检测"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
engine.power_switch_9V = true</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="crash_sensor_i">
<Rect left="180" top="124" right="280" bottom="156"/>
<Script>
DFloat_Mts3Result = math.abs(engine.crash_sensor_i);
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )</Script></Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="180" top="244" right="280" bottom="276"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="244" right="136" bottom="276"/>
</Activity>
<Activity id="946" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="180" top="184" right="280" bottom="216"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="35" name="DEP2277" type="8" flags="97"/>
</Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="124" right="136" bottom="156"/>
</Activity>
<Activity id="948" ActivityType="3" flags="0" name="中高频检测">
<Rect left="180" top="304" right="280" bottom="336"/>
<Line2Text Enable="1" Text="中高频扬声器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.constant_current_output = 32767
engine.current_switch_control_A = false    -- 前后门切换 ：前门
engine.current_switch_control_B = false    --高低频切换 : 高频
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="952" ActivityType="3" flags="0" name="init">
<Rect left="180" top="364" right="280" bottom="396"/>
<Script>val_val = math.abs(engine.pf_door_tweeter_speaker / engine.constant_current_output);
--val_val=tostring(val_val)
--val_val = math.abs(engine.df_door_tweeter_speaker);</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="endloop">
<Rect left="180" top="504" right="280" bottom="536"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="504" right="136" bottom="536"/>
</Activity>
<Activity id="955" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="180" top="434" right="280" bottom="466"/>
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
<assessment block="1" ptbtext="DEP164" group="2905" pbltext="DEP1987" no="36" name="DEP2278" type="8" flags="97"/>
</Activity>
<Activity id="956" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="364" right="136" bottom="396"/>
</Activity>
<Activity id="957" ActivityType="3" flags="0" name="触摸车门把手传感器">
<Rect left="180" top="584" right="280" bottom="616"/>
<Line1Text Enable="1" Text="乘客门检测(PDCU)"/>
<Line2Text Enable="1" Text="触摸车门把手传感器"/>
<Script>Pram_1 = nil;
val_val_int =math.abs(engine.pf_door_handle)
engine.println("*****val_val_int*****"..val_val_int)</Script></Activity>
<Activity id="958" ActivityType="3" flags="0" name="endloop">
<Rect left="180" top="774" right="280" bottom="806"/>
<Script></Script></Activity>
<Activity id="959" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="180" top="714" right="280" bottom="746"/>
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
<Activity id="962" ActivityType="3" flags="0" name="普通节点">
<Rect left="180" top="644" right="280" bottom="676"/>
<Script>val_val =math.abs(engine.pf_door_handle)   --右前门把手动作检测
engine.println("*****val_val*****"..val_val)
val = math.abs((val_val - val_val_int)*1000)
engine.println("*****val*****"..val)</Script></Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="774" right="126" bottom="806"/>
</Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="644" right="126" bottom="676"/>
</Activity>
<Activity id="966" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="504" right="476" bottom="536"/>
</Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="834" right="476" bottom="866"/>
</Activity>
<Activity id="968" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="534" right="336" bottom="566"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="946" type="0">
</Transition>
<Transition StartId="944" EndId="945" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="944" EndId="948" type="0">
</Transition>
<Transition StartId="945" EndId="947" type="0">
</Transition>
<Transition StartId="946" EndId="944" type="0">
</Transition>
<Transition StartId="947" EndId="4" type="0">
</Transition>
<Transition StartId="948" EndId="952" type="0">
</Transition>
<Transition StartId="952" EndId="955" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="953" EndId="966" type="0">
</Transition>
<Transition StartId="954" EndId="956" type="0">
</Transition>
<Transition StartId="955" EndId="953" type="0">
</Transition>
<Transition StartId="956" EndId="952" type="0">
</Transition>
<Transition StartId="957" EndId="962" type="0">
</Transition>
<Transition StartId="958" EndId="2" type="0">
</Transition>
<Transition StartId="958" EndId="963" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="959" EndId="958" type="0">
</Transition>
<Transition StartId="962" EndId="959" type="0">
</Transition>
<Transition StartId="963" EndId="964" type="0">
</Transition>
<Transition StartId="964" EndId="962" type="0">
</Transition>
<Transition StartId="966" EndId="967" type="0">
</Transition>
<Transition StartId="967" EndId="2" type="0">
</Transition>
<Transition StartId="968" EndId="957" type="1">
<Expression>LibGeneral.CarTNC_HS7_PEPS_IN(engine.CarType)</Expression></Transition>
</Transitions>
</Process>

