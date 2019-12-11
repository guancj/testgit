<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="157" top="28" right="257" bottom="60"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="158" top="200" right="258" bottom="232"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="1" name="循环读信息">
<Rect left="158" top="112" right="258" bottom="144"/>
<Script>--for i=0,5 do

while(engine.SharedVarGet("LoopBFin") == false) do
errStr = engine.DopplerIsCalibrationError()

if (errStr == true) then
	print("error!!!!!!")
end

engine.Delay(1000)
end </Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

