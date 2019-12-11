<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3013" pbltext="DEP73">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="50" top="34" right="150" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="50" top="344" right="150" bottom="376"/>
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
<Activity id="3" ActivityType="3" flags="0" name="普通节点">
<Rect left="310" top="144" right="410" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请将换挡手柄切换R位置".."#R=bmpeye")
#PRESSBUTTON
--[[
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end]]--</Script><assessment no="33" name="DEP2316" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="普通节点">
<Rect left="310" top="214" right="410" bottom="246"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC功能激活且指示灯亮?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script><assessment no="34" name="DEP2317" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="454" right="870" bottom="486"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC灯亮了么".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="普通节点">
<Rect left="310" top="274" right="410" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请将换挡手柄切换P位置并关闭PDC开关".."#R=bmpeye")
#PRESSBUTTON
--[[
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end]]--</Script><assessment no="35" name="DEP2313" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="534" right="870" bottom="566"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC功能关闭".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="普通节点">
<Rect left="310" top="344" right="410" bottom="376"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC功能关闭且指示灯灭了么".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script><assessment no="36" name="DEP2318" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="普通节点">
<Rect left="50" top="94" right="150" bottom="126"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=按下PDC开关".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工操作点击确认" ;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
 engine.StatValue = "人工操作点击放弃";
end</Script><assessment no="17" name="DEP500" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="1" name="普通节点">
<Rect left="50" top="154" right="150" bottom="186"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC功能激活且指示灯亮?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工操作点击确认" ;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
 engine.StatValue = "人工操作点击放弃";
end</Script><assessment no="18" name="DEP501" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="164" right="870" bottom="196"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC灯亮了么".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="普通节点">
<Rect left="50" top="264" right="150" bottom="296"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC功能关闭且指示灯灭?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工操作点击确认" ;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
 engine.StatValue = "人工操作点击放弃";
end</Script><assessment no="31" name="DEP503" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="374" right="870" bottom="406"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认PDC灯灭了么".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="普通节点">
<Rect left="50" top="204" right="150" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=按下PDC开关".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工操作点击确认" ;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
 engine.StatValue = "人工操作点击放弃";
end</Script><assessment no="19" name="DEP502" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="17" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="2" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="23" type="0">
</Transition>
<Transition StartId="21" EndId="2" type="0">
</Transition>
<Transition StartId="23" EndId="21" type="0">
</Transition>
</Transitions>
</Process>

