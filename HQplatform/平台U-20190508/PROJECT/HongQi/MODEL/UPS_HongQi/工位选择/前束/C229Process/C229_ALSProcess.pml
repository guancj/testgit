<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="494" right="470" bottom="526"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="SWE_22_VehicleID">
<Rect left="370" top="224" right="470" bottom="256"/>
<SubProcesses>
<SubProcess id="SWE_22_VehicleID">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="FWE_22_VehicleID">
<Rect left="370" top="164" right="470" bottom="196"/>
<SubProcesses>
<SubProcess id="FWE_22_VehicleID">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="206" ActivityType="5" flags="1" name="C229_TestProcess">
<Rect left="370" top="284" right="470" bottom="316"/>
<SubProcesses>
<SubProcess id="C229_TestProcess">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="FWEisOK"/>
<Parameter id="AirSFlag" value="false"/>
<Parameter id="AirS_Result" value="1"/>
</Parameters>
</SubProcess>
<SubProcess id="C229_SWE_Process">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="SWEisOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="退出">
<Rect left="510" top="164" right="610" bottom="196"/>
<Script>engine.println(" &lt;FWE_22&gt; : Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="退出">
<Rect left="510" top="224" right="610" bottom="256"/>
<Script>engine.println(" &lt;SWE_22&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="209" ActivityType="3" flags="0" name="完成">
<Rect left="370" top="434" right="470" bottom="466"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.SharedVarSet("_ProcessOK",1)
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true) 
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true) </Script></Activity>
<Activity id="210" ActivityType="5" flags="0" name="FWE_05_BasicState">
<Rect left="370" top="374" right="470" bottom="406"/>
<SubProcesses>
<SubProcess id="FWE_05_BasicState">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="退出">
<Rect left="510" top="374" right="610" bottom="406"/>
<Script>engine.println(" &lt;FAS_61_LDWstop&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="30" type="0">
</Transition>
<Transition StartId="3" EndId="206" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="3" EndId="208" type="0">
</Transition>
<Transition StartId="30" EndId="3" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="30" EndId="207" type="0">
</Transition>
<Transition StartId="206" EndId="210" type="0">
</Transition>
<Transition StartId="209" EndId="2" type="0">
</Transition>
<Transition StartId="210" EndId="209" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="210" EndId="211" type="0">
</Transition>
</Transitions>
</Process>

