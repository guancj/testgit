<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="614" top="64" right="714" bottom="96"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="614" top="656" right="714" bottom="688"/>
<Script></Script></End>
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
<Rect left="940" top="434" right="1040" bottom="466"/>
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
<Rect left="610" top="254" right="710" bottom="286"/>
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
<Activity id="76" ActivityType="3" flags="0" name="退出">
<Rect left="830" top="354" right="930" bottom="386"/>
<Script>engine.println(" IDT SERVICE NOK")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="退出">
<Rect left="1080" top="194" right="1180" bottom="226"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="退出">
<Rect left="1090" top="254" right="1190" bottom="286"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="79" ActivityType="5" flags="0" name="FWE_31_WheelHousing_forAirs">
<Rect left="610" top="424" right="710" bottom="456"/>
<SubProcesses>
<SubProcess id="FWE_31_WheelHousing_forAirs">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="ExecStep" value="&quot;Static&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="80" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="254" right="576" bottom="286"/>
</Activity>
<Activity id="81" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="534" right="566" bottom="566"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="80" type="0">
</Transition>
<Transition StartId="14" EndId="73" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="14" EndId="76" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="15" EndId="76" type="0">
</Transition>
<Transition StartId="16" EndId="79" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="16" EndId="76" type="0">
</Transition>
<Transition StartId="20" EndId="72" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="20" EndId="76" type="0">
</Transition>
<Transition StartId="72" EndId="2" type="0">
</Transition>
<Transition StartId="72" EndId="76" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="73" EndId="76" type="0">
</Transition>
<Transition StartId="74" EndId="15" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="74" EndId="76" type="0">
</Transition>
<Transition StartId="75" EndId="81" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="79" EndId="75" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="79" EndId="76" type="0">
</Transition>
<Transition StartId="80" EndId="15" type="0">
</Transition>
<Transition StartId="81" EndId="72" type="0">
</Transition>
</Transitions>
</Process>

