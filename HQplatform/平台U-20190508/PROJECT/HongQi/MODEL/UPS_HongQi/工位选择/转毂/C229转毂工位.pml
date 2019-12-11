<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="510" top="104" right="610" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="510" top="464" right="610" bottom="496"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_转毂通讯初始化">
<Rect left="510" top="164" right="610" bottom="196"/>
<Line2Text Enable="1" Text="IDT建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_abs1&quot;"/>
<Parameter id="iniKey" value="&quot;abs_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="开始IDT">
<Rect left="510" top="224" right="610" bottom="256"/>
<SubProcesses>
<SubProcess id="RTS_01_Start">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="199" ActivityType="5" flags="1" name="ROL_ViewPosition">
<Rect left="510" top="284" right="610" bottom="316"/>
<SubProcesses>
<SubProcess id="ROL_ViewPosition">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ErrorMonitor">
<Parameters>
<Parameter id="AutoMode" value="true"/>
<Parameter id="Error" value="true"/>
<Parameter id="Emergency" value="true"/>
<Parameter id="Ready" value="true"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="C229_ROL_Process">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="200" ActivityType="13" flags="0" name="ROL断开通讯">
<Rect left="510" top="344" right="610" bottom="376"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="199" type="0">
</Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

