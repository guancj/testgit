<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data=""/>
<Variable id="AirS_Result" type="3" dir="1" data="1"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="164" right="330" bottom="196"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1070" top="284" right="1170" bottom="316"/>
<Script>print("AirS_Result = "..tostring(AirS_Result));</Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="FWE_51_TestReadiness">
<Rect left="230" top="284" right="330" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_51_TestReadiness">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="5" ActivityType="5" flags="0" name="FWE_52_TurnOverMeasure">
<Rect left="370" top="284" right="470" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_52_TurnOverMeasure">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="FWE_07_ChassisSetup_ALL">
<Rect left="650" top="284" right="750" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_07_ChassisSetup_ALL">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="1" name="FWE_ChassisSetupBefore">
<Rect left="510" top="284" right="610" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_ChassisSetupBefore">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="AirSFlag" value="AirSFlag"/>
<Parameter id="vciHandle" ret="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="退出">
<Rect left="230" top="404" right="330" bottom="436"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="退出">
<Rect left="370" top="404" right="470" bottom="436"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="退出">
<Rect left="510" top="404" right="610" bottom="436"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="19" ActivityType="5" flags="0" name="FWE_10_RequestResultSpur">
<Rect left="790" top="284" right="890" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_10_RequestResultSpur">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="true"/>
<Parameter id="EvalResult_RL" ret="aSpurResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSpurResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSpurResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="FWE_11_RequestResultSturz">
<Rect left="930" top="284" right="1030" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_11_RequestResultSturz">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="true"/>
<Parameter id="EvalResult_RL" ret="aSturzResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSturzResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSturzResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="退出">
<Rect left="650" top="404" right="750" bottom="436"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="退出">
<Rect left="790" top="404" right="890" bottom="436"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="3" EndId="12" type="0">
</Transition>
<Transition StartId="5" EndId="16" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="9" EndId="19" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="9" EndId="21" type="0">
</Transition>
<Transition StartId="11" EndId="17" type="0">
</Transition>
<Transition StartId="11" EndId="9" type="1">
<Expression>AirSFlag == false and isOK == true</Expression></Transition>
<Transition StartId="19" EndId="20" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="19" EndId="22" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="1">
<Expression>isOK == true</Expression></Transition>
</Transitions>
</Process>

