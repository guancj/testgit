<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="64" right="590" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="354" right="590" bottom="386"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="等待">
<Rect left="490" top="194" right="590" bottom="226"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>Timeused = os.clock() - engine.SharedVarGet("BSDTimestart_shared");
RunningTime = string.format("%d",Timeused)
--engine.SetLineText(0,"BSD需上电180秒后才可执行检测，当前已运行时间:"..tostring(RunningTime).."秒");
engine.SetLineText(0,"程序已运行时间:"..tostring(RunningTime).."秒");
engine.SetLineText(1,"期间请勿断电");
engine.SetLineText(2,"请继续等待或者点击确定强行检测！");
engine.Delay(200)
</Script></Activity>
<Activity id="125" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="254" right="776" bottom="286"/>
</Activity>
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="194" right="776" bottom="226"/>
</Activity>
<Activity id="1472" ActivityType="3" flags="0" name="BSD统计开始检测时间间隔">
<Rect left="490" top="264" right="590" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.StatValue =  "BSD TestTime interval = "..tostring(RunningTime);
engine.LastError = 0 ;
engine.DialogBackColor = -1;
print("BSD TestTime interval = "..tostring(RunningTime))</Script><assessment block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905" no="15" name="DEP2336" type="8" flags="97"/>
</Activity>
<Activity id="1473" ActivityType="3" flags="0" name="初始化颜色">
<Rect left="490" top="134" right="590" bottom="166"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1473" type="0">
</Transition>
<Transition StartId="3" EndId="126" type="0">
</Transition>
<Transition StartId="3" EndId="1472" type="1">
<Expression>engine.RButtonPressed == true or Timeused &gt;= 181</Expression></Transition>
<Transition StartId="125" EndId="3" type="0">
</Transition>
<Transition StartId="126" EndId="125" type="0">
</Transition>
<Transition StartId="1472" EndId="2" type="0">
</Transition>
<Transition StartId="1473" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

