<?xml version="1.0" encoding="utf-8" ?>
<Process id="ReadError" flags="1">
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="157" top="28" right="257" bottom="60"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="161" top="193" right="261" bottom="225"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" name="普通节点">
<Rect left="159" top="107" right="259" bottom="139"/>
<Script>while(true) do
errStr = engine.DopplerCalibrationErrorInfo()

if (errStr ~= "" and errStr ~= nil) then
print("errStr:"..errStr)

end
end </Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

