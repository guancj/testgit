<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="190" top="4" right="290" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="420" top="404" right="520" bottom="436"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="1" name="普通节点">
<Rect left="190" top="84" right="290" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到倒车位置")
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="164" right="290" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到驻车位置")
engine.SetLineText(2,"#L=请确认PDC功能关闭?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="244" right="290" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到倒车位置")
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")
engine.SetLineText(3,"#L=请确认前PDC功能激活?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="324" right="290" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请按下PDC OFF开关")
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")
engine.SetLineText(3,"#L=请确认前PDC功能关闭?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="404" right="290" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到驻车位置")
engine.SetLineText(2,"#L=请确认PDC功能关闭?".."#R=bmpeye")
engine.SetLineText(3,"#L=请确认前PDC功能关闭?".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="普通节点">
<Rect left="420" top="84" right="520" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到倒车位置")
engine.SetLineText(2,"#L=请确认PDC功能激活?".."#R=bmpeye")

#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="普通节点">
<Rect left="420" top="164" right="520" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"请将换挡手柄切换到驻车位置")
engine.SetLineText(2,"请按下PDC OFF开关")
engine.SetLineText(3,"#L=请确认PDC功能关闭?".."#R=bmpeye")

#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="前左雷达">
<Rect left="750" top="264" right="850" bottom="296"/>
<Line1Text Enable="1" Text="请站于前左雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

