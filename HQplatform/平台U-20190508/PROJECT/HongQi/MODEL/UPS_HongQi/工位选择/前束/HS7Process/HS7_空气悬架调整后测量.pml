<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="40" top="174" right="140" bottom="206"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="660" top="174" right="760" bottom="206"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="1" name="FWE_51_TestReadiness">
<Rect left="200" top="174" right="300" bottom="206"/>
<SubProcesses>
<SubProcess id="FWE_51_TestReadiness">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="FWE_52_TurnOverMeasure">
<Rect left="360" top="174" right="460" bottom="206"/>
<SubProcesses>
<SubProcess id="FWE_52_TurnOverMeasure">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="6" ActivityType="5" flags="0" name="FWE_ChassisSetupBefore">
<Rect left="900" top="234" right="1000" bottom="266"/>
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
<Rect left="200" top="244" right="300" bottom="276"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="退出">
<Rect left="360" top="244" right="460" bottom="276"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="退出">
<Rect left="520" top="244" right="620" bottom="276"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)
isOK = false;</Script></Activity>
<Activity id="18" ActivityType="5" flags="0" name="FWE_空气悬架调整后底盘调整前">
<Rect left="520" top="174" right="620" bottom="206"/>
<SubProcesses>
<SubProcess id="FWE_空气悬架调整后底盘调整前">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="104" right="286" bottom="136"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="19" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="3" EndId="12" type="0">
</Transition>
<Transition StartId="4" EndId="13" type="0">
</Transition>
<Transition StartId="4" EndId="18" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="18" EndId="17" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="19" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

