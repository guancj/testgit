<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" top="54" right="310" bottom="86"/>
<Script>engine.SharedVarSet("_ProcessOK",0)

print("###AirSFlag:"..tostring(AirSFlag))</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="684" right="310" bottom="716"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_Init_FWE">
<Rect left="210" top="134" right="310" bottom="166"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;fwe_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="FWEHndl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="IDT_Init_SWE">
<Rect left="210" top="214" right="310" bottom="246"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;swe_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="SWEHndl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="24" ActivityType="5" flags="0" name="FWE_SWE_FAS_Start">
<Rect left="210" top="284" right="310" bottom="316"/>
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
<Activity id="26" ActivityType="13" flags="0" name="FWE断开通讯">
<Rect left="210" top="444" right="310" bottom="476"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="205" ActivityType="13" flags="0" name="SWE断开通讯">
<Rect left="210" top="524" right="310" bottom="556"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="FAS断开通讯">
<Rect left="210" top="604" right="310" bottom="636"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FASHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="207" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="284" right="456" bottom="316"/>
</Activity>
<Activity id="208" ActivityType="5" flags="1" name="HS7_ALS_Process">
<Rect left="210" top="364" right="310" bottom="396"/>
<SubProcesses>
<SubProcess id="HS7_ALS_Process">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="AFSPartnumber" value="AFSPartnumber"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
<Parameter id="AirSFlag" value="AirSFlag"/>
</Parameters>
</SubProcess>
<SubProcess id="HS7_IDT_Ctrl_Monitor">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="208" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="24" EndId="207" type="0">
</Transition>
<Transition StartId="26" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="2" type="0">
</Transition>
<Transition StartId="207" EndId="26" type="0">
</Transition>
<Transition StartId="208" EndId="26" type="0">
</Transition>
</Transitions>
</Process>

