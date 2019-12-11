<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="400" top="84" right="500" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="400" top="464" right="500" bottom="496"/>
<Script></Script></End>
<Activities>
<Activity id="197" ActivityType="13" flags="0" name="IDT_转毂通讯初始化">
<Rect left="400" top="144" right="500" bottom="176"/>
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
<Activity id="198" ActivityType="5" flags="1" name="Roller_In_Test">
<Rect left="400" top="294" right="500" bottom="326"/>
<SubProcesses>
<SubProcess id="Roller_In_Test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ViewPosition">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ErrorMonitor">
<Parameters>
<Parameter id="AutoMode" value="true"/>
<Parameter id="Error" value="true"/>
<Parameter id="Emergency" value="true"/>
<Parameter id="Ready" value="false"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="199" ActivityType="5" flags="0" name="开始IDT">
<Rect left="400" top="204" right="500" bottom="236"/>
<SubProcesses>
<SubProcess id="RTS_01_Start">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="202" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="204" right="646" bottom="236"/>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="ROL断开通讯">
<Rect left="400" top="384" right="500" bottom="416"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="199" type="0">
</Transition>
<Transition StartId="198" EndId="206" type="0">
</Transition>
<Transition StartId="199" EndId="198" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="199" EndId="202" type="0">
</Transition>
<Transition StartId="202" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

