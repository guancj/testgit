<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="80" top="4" right="180" bottom="36"/>
<Script></Script><Line1Text Enable="1" Text="DMSCU功能检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="720" top="544" right="820" bottom="576"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="AUTO模式">
<Rect left="80" top="74" right="180" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将点火开关切换ON挡"/>
<Line3Text Enable="1" Text="确认车辆无故障"/>
<Line4Text Enable="1" Text="请手动选择驾驶模式为“AUTO“模式"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="普通节点">
<Rect left="80" top="154" right="180" bottom="186"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示AUTO图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认AUTO指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="17" name="DEP2120" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="ECO模式">
<Rect left="80" top="234" right="180" bottom="266"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为ECO模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="普通节点">
<Rect left="80" top="314" right="180" bottom="346"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示ECO图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认ECO指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="18" name="DEP2121" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="COMF模式">
<Rect left="80" top="394" right="180" bottom="426"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为COMF模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="普通节点">
<Rect left="80" top="474" right="180" bottom="506"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示COMF图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认COMF指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="19" name="DEP2122" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="SPORT模式">
<Rect left="290" top="74" right="390" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为SPORT模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="普通节点">
<Rect left="290" top="154" right="390" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示SPORT图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认SPORT指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="21" name="DEP2123" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="ALL_ROAD模式">
<Rect left="290" top="234" right="390" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为ALL_ROAD模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="普通节点">
<Rect left="290" top="314" right="390" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示ALL_ROAD图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认ALL_ROAD指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="22" name="DEP2124" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="OFF ROAD模式">
<Rect left="290" top="394" right="390" bottom="426"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为OFF ROAD模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="普通节点">
<Rect left="290" top="474" right="390" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示OFF ROAD图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认OFF ROAD指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="23" name="DEP2125" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="INDIVIDUAL模式">
<Rect left="510" top="74" right="610" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为INDIVIDUAL模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="普通节点">
<Rect left="510" top="154" right="610" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示INDIVIDUAL图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认INDIVIDUAL指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="24" name="DEP2126" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="EV模式">
<Rect left="570" top="234" right="670" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择驾驶模式为EV模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="普通节点">
<Rect left="570" top="294" right="670" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示EV图标".."#R=bmpeye")
engine.SetLineText(2,"#L=确认EV指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="25" name="DEP2127" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="悬架升控制">
<Rect left="510" top="394" right="610" bottom="426"/>
<Line1Text Enable="1" Text="确认四门两盖关闭状态"/>
<Line2Text Enable="1" Text="确认车辆无故障"/>
<Line3Text Enable="1" Text="启动发动机"/>
<Line4Text Enable="1" Text="请手动按下悬架上升开关"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="普通节点">
<Rect left="510" top="474" right="610" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=仪表显示悬架正在上升".."#R=bmpeye")
engine.SetLineText(2,"#L=开关指示灯显示悬架正在上升".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="26" name="DEP2128" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="悬架降控制">
<Rect left="720" top="74" right="820" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动按下悬架下降开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="普通节点">
<Rect left="720" top="154" right="820" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=仪表显示悬架正在下降".."#R=bmpeye")
engine.SetLineText(2,"#L=开关指示灯显示悬架正在下降".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="27" name="DEP2129" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="ESP功能检查">
<Rect left="720" top="234" right="820" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请系上安全带"/>
<Line3Text Enable="1" Text="请手动按下AVH开关"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="普通节点">
<Rect left="720" top="314" right="820" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认开关指示灯点亮".."#R=bmpeye")

#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="28" name="DEP2130" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="ESP功能检查">
<Rect left="720" top="394" right="820" bottom="426"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请系上安全带"/>
<Line3Text Enable="1" Text="请手动按下HDC开关"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   return "";
end</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="普通节点">
<Rect left="720" top="474" right="820" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=确认仪表显示绿色HDC指示灯".."#R=bmpeye")
engine.SetLineText(2,"#L=确认开关指示灯点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
end 
 if(engine.LButtonPressed==true)then
   engine.LastError = 1;
end</Script><assessment block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678" no="29" name="DEP2131" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="20" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

