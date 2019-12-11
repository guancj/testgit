<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="650" top="94" right="750" bottom="126"/>
<Script>CarType = engine.SharedVarGet("vehicleID")

print("HongQiVehicle:"..CarType)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="650" top="464" right="750" bottom="496"/>
<Script></Script></End>
<Activities>
<Activity id="123" ActivityType="5" flags="1" name="BSDprocessHS7">
<Rect left="650" top="384" right="750" bottom="416"/>
<SubProcesses>
<SubProcess id="BSDprocessHS7">
<Parameters>
<Parameter id="isOK"/>
<Parameter id="CarType" value="CarType"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="等待">
<Rect left="650" top="234" right="750" bottom="266"/>
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
<Rect left="874" top="294" right="906" bottom="326"/>
</Activity>
<Activity id="1471" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="234" right="906" bottom="266"/>
</Activity>
<Activity id="1472" ActivityType="3" flags="0" name="BSD统计开始检测时间间隔">
<Rect left="650" top="304" right="750" bottom="336"/>
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
<Rect left="650" top="174" right="750" bottom="206"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="1474" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="234" right="576" bottom="266"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1474" type="0">
</Transition>
<Transition StartId="123" EndId="2" type="0">
</Transition>
<Transition StartId="124" EndId="1471" type="0">
</Transition>
<Transition StartId="124" EndId="1472" type="1">
<Expression>engine.RButtonPressed == true or Timeused &gt;= 181</Expression></Transition>
<Transition StartId="125" EndId="124" type="0">
</Transition>
<Transition StartId="1471" EndId="125" type="0">
</Transition>
<Transition StartId="1473" EndId="124" type="0">
</Transition>
<Transition StartId="1474" EndId="123" type="0">
</Transition>
</Transitions>
</Process>

