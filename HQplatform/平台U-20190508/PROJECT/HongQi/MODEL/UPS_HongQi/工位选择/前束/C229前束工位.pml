<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="524" right="470" bottom="556"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_Init_FWE">
<Rect left="370" top="164" right="470" bottom="196"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;fwe_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="FWEHndl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_Init_SWE">
<Rect left="370" top="224" right="470" bottom="256"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;swe_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="SWEHndl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="5" flags="0" name="FWE_SWE_FAS_Start">
<Rect left="370" top="284" right="470" bottom="316"/>
<SubProcesses>
<SubProcess id="FWE_SWE_FAS_Start">
<Parameters>
<Parameter id="FWEHandl" value="FWEHndl"/>
<Parameter id="FASHandl" value="&quot;&quot;"/>
<Parameter id="SWEHandl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="25" ActivityType="5" flags="1" name="C229_ALSProcess">
<Rect left="370" top="344" right="470" bottom="376"/>
<SubProcesses>
<SubProcess id="C229_ALSProcess">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
</Parameters>
</SubProcess>
<SubProcess id="C229_IDT_Ctrl_Monitor">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="26" ActivityType="13" flags="0" name="FWE断开通讯">
<Rect left="370" top="404" right="470" bottom="436"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="27" ActivityType="13" flags="0" name="SWE断开通讯">
<Rect left="370" top="464" right="470" bottom="496"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="284" right="576" bottom="316"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="25" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="21" EndId="206" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="2" type="0">
</Transition>
<Transition StartId="206" EndId="26" type="0">
</Transition>
</Transitions>
</Process>

