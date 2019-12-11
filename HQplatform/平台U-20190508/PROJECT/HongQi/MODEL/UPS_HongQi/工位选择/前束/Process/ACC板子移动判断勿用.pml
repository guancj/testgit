<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="ACCLDWflag" type="11" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="400" top="64" right="500" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="540" top="64" right="640" bottom="96"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="FAS_67_ACCSetting">
<Rect left="400" top="154" right="500" bottom="186"/>
<SubProcesses>
<SubProcess id="FAS_67_ACCSetting">
<Parameters>
<Parameter id="FASHndl" value="FASHndl"/>
<Parameter id="Type" value="&quot;Start&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="退出">
<Rect left="400" top="244" right="500" bottom="276"/>
<Script>engine.println(" &lt;FAS_67_ACCsetting&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="2" type="0">
</Transition>
<Transition StartId="1" EndId="3" type="1">
<Expression>ACCLDWflag == true</Expression></Transition>
<Transition StartId="3" EndId="41" type="0">
</Transition>
<Transition StartId="3" EndId="2" type="1">
<Expression>isOK == true </Expression></Transition>
</Transitions>
</Process>

