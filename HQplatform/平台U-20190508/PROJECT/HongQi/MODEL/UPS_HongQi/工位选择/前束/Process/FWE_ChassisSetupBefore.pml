<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data="false"/>
<Variable id="vciHandle" type="3" dir="1" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="614" top="64" right="714" bottom="96"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="614" top="656" right="714" bottom="688"/>
<Script>print("vciHandle after adjust = "..tostring(vciHandle))</Script></End>
<Activities>
<Activity id="14" ActivityType="5" flags="0" name="FWE_81_TransfertSteeringWheelAngle">
<Rect left="614" top="136" right="714" bottom="168"/>
<SubProcesses>
<SubProcess id="FWE_81_TransfertSteeringWheelAngle">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="ExecStep" value="1"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="5" flags="0" name="FWE_10_RequestResultSpur">
<Rect left="614" top="304" right="714" bottom="336"/>
<SubProcesses>
<SubProcess id="FWE_10_RequestResultSpur">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="false"/>
<Parameter id="EvalResult_RL" ret="aSpurResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSpurResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSpurResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="16" ActivityType="5" flags="0" name="FWE_11_RequestResultSturz">
<Rect left="614" top="360" right="714" bottom="392"/>
<SubProcesses>
<SubProcess id="FWE_11_RequestResultSturz">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="false"/>
<Parameter id="EvalResult_RL" ret="aSturzResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSturzResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSturzResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="17" ActivityType="5" flags="0" name="FWE_31_WheelHousing">
<Rect left="614" top="424" right="714" bottom="456"/>
<SubProcesses>
<SubProcess id="FWE_31_WheelHousing">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="ExecStep" value="&quot;Static&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="FWE_81_TransfertSteeringWheelAngle">
<Rect left="614" top="536" right="714" bottom="568"/>
<SubProcesses>
<SubProcess id="FWE_81_TransfertSteeringWheelAngle">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="ExecStep" value="2"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="RearAxleFlag">
<Rect left="614" top="600" right="714" bottom="632"/>
<Script>if (aSpurResult_RL == 1 and aSpurResult_RR == 1 and aSpurResult_RA == 1 and aSturzResult_RL == 1 and aSturzResult_RR == 1 and aSturzResult_RA == 1) then
	RearAxleFlag = false
        print("RearAxleFlag false")   --后轴不需要调整
 else
	RearAxleFlag = true
        print("RearAxleFlag true")        
 end
 
 engine.SharedVarSet("RearAxleFlag",RearAxleFlag)</Script></Activity>
<Activity id="73" ActivityType="5" flags="0" name="FWE_28_TransversePositions">
<Rect left="614" top="192" right="714" bottom="224"/>
<SubProcesses>
<SubProcess id="FWE_28_TransversePositions">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="74" ActivityType="5" flags="0" name="FWE_09_WheelWeight">
<Rect left="614" top="248" right="714" bottom="280"/>
<SubProcesses>
<SubProcess id="FWE_09_WheelWeight">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="75" ActivityType="5" flags="0" name="FWE_53_WheelCenter">
<Rect left="614" top="480" right="714" bottom="512"/>
<SubProcesses>
<SubProcess id="FWE_53_WheelCenter">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="76" ActivityType="5" flags="0" name="空气悬架标定_基础设置">
<Rect left="750" top="364" right="850" bottom="396"/>
<SubProcesses>
<SubProcess id="空气悬架标定_基础设置">
<Parameters>
<Parameter id="vciHandle" value="0" ret="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="73" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="15" EndId="16" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="16" EndId="76" type="1">
<Expression>AirSFlag == true and isOK == true</Expression></Transition>
<Transition StartId="16" EndId="17" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="17" EndId="75" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="20" EndId="72" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="72" EndId="2" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="74" EndId="15" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="75" EndId="20" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="76" EndId="17" type="0">
</Transition>
</Transitions>
</Process>

