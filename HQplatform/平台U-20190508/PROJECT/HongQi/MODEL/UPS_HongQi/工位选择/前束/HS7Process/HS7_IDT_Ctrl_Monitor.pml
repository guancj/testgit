<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="182" top="48" right="282" bottom="80"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="182" top="224" right="282" bottom="256"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="1" name="FWE_ErrorMonitor">
<Rect left="182" top="136" right="282" bottom="168"/>
<SubProcesses>
<SubProcess id="FWE_ErrorMonitor">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
</Parameters>
</SubProcess>
<SubProcess id="SWE_ErrorMonitor">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

