<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="150" top="64" right="250" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="900" top="224" right="1000" bottom="256"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="FWE_51_TestReadiness">
<Rect left="150" top="154" right="250" bottom="186"/>
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
<Rect left="330" top="154" right="430" bottom="186"/>
<SubProcesses>
<SubProcess id="FWE_52_TurnOverMeasure">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="1" name="FWE_07_ChassisSetup_ALL">
<Rect left="630" top="154" right="730" bottom="186"/>
<SubProcesses>
<SubProcess id="FWE_07_ChassisSetup_ALL">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="0" name="FWE_ChassisSetupBefore">
<Rect left="490" top="154" right="590" bottom="186"/>
<SubProcesses>
<SubProcess id="FWE_ChassisSetupBefore">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="退出">
<Rect left="150" top="214" right="250" bottom="246"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="退出">
<Rect left="330" top="224" right="430" bottom="256"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="退出">
<Rect left="490" top="224" right="590" bottom="256"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="19" ActivityType="5" flags="0" name="FWE_10_RequestResultSpur">
<Rect left="760" top="154" right="860" bottom="186"/>
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
<Rect left="900" top="154" right="1000" bottom="186"/>
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
<Rect left="630" top="224" right="730" bottom="256"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="退出">
<Rect left="760" top="224" right="860" bottom="256"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
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
<Transition StartId="11" EndId="9" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="11" EndId="17" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="19" EndId="22" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="1">
<Expression>isOK == true</Expression></Transition>
</Transitions>
</Process>

