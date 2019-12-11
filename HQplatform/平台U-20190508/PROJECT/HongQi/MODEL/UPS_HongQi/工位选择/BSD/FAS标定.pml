<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="PosStation" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="124" right="460" bottom="156"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="360" top="544" right="460" bottom="576"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="1" name="IDT_通讯初始化">
<Rect left="360" top="254" right="460" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="IDT建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_bsd1&quot;"/>
<Parameter id="iniKey" value="&quot;bsd_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="198" ActivityType="5" flags="0" name="IDT_Service_01">
<Rect left="360" top="314" right="460" bottom="346"/>
<SubProcesses>
<SubProcess id="IDT_Service_01">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="199" ActivityType="5" flags="0" name="BSD_Process">
<Rect left="360" top="374" right="460" bottom="406"/>
<SubProcesses>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="FAS_Process">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="FAScalibration" value="FAScalibration"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="功能设置">
<Rect left="360" top="194" right="460" bottom="226"/>
<Script>print("CarType ="..tostring(engine.CarType));

if (PosStation == "H7BSD") then
	FAScalibration = 4;
elseif (PosStation == "H7Back" or PosStation == "BackShow" ) then
	FAScalibration = 5;
elseif (PosStation == "IFC") then
	FAScalibration = 2;
elseif (PosStation == "IFC_BSD") then
	FAScalibration = 3;
else
	print("CarType ="..tostring(engine.CarType));
end

if (engine.CarType == "DAPNHACC0000" or engine.CarType == "DAPNHACC0001")then
	FAScalibration = 5;
        print("CarType ="..tostring(engine.CarType)..";HS7 Only RV FAScalibration = "..tostring(FAScalibration));
elseif (engine.CarType == "DAPMHACC0000" or engine.CarType == "DAPMHACC0001"or engine.CarType == "DAPMHACC0003" or engine.CarType == "DAPMHACC0002")then
	FAScalibration = 6;
        print("CarType ="..tostring(engine.CarType)..";HS7  RV and IFC FAScalibration = "..tostring(FAScalibration));     
        
end        

print("FAScalibration = "..tostring(FAScalibration))</Script></Activity>
<Activity id="201" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="314" right="566" bottom="346"/>
</Activity>
<Activity id="202" ActivityType="13" flags="0" name="BBK断开通讯">
<Rect left="360" top="454" right="460" bottom="486"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="功能设置">
<Rect left="620" top="194" right="720" bottom="226"/>
<Script>if (PosStation == "H7BSD") then
	FAScalibration = 4
elseif (PosStation == "H7Back") then
	FAScalibration = 5
elseif (PosStation == "IFC") then
	FAScalibration = 2
elseif (PosStation == "IFC_BSD") then
	FAScalibration = 3
else
end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="200" type="0">
</Transition>
<Transition StartId="3" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="199" type="0">
</Transition>
<Transition StartId="198" EndId="201" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="199" EndId="202" type="0">
</Transition>
<Transition StartId="200" EndId="3" type="0">
</Transition>
<Transition StartId="201" EndId="202" type="0">
</Transition>
<Transition StartId="202" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

