<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="ACCLDWflag" type="11" dir="0" data=""/>
<Variable id="AFSPartnumber" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" top="14" right="310" bottom="46"/>
<Script>DString_Car_Tpye = engine.CarType
print("DString_Car_Tpye:"..DString_Car_Tpye)
engine.SharedVarSet("_ProcessOK",0)</Script><TitleText Enable="1" Text="前束工位检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="774" right="310" bottom="806"/>
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
<assessment no="1" name="DEP1285" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="IDT_Init_SWE">
<Rect left="210" top="294" right="310" bottom="326"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;swe_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="SWEHndl"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1287" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="5" flags="0" name="FWE_SWE_FAS_Start">
<Rect left="210" top="374" right="310" bottom="406"/>
<SubProcesses>
<SubProcess id="FWE_SWE_FAS_Start">
<Parameters>
<Parameter id="FWEHandl" value="FWEHndl"/>
<Parameter id="SWEHandl" value="SWEHndl"/>
<Parameter id="FASHandl" value="FASHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="26" ActivityType="5" flags="0" name="ALS_Process">
<Rect left="210" top="454" right="310" bottom="486"/>
<SubProcesses>
<SubProcess id="IDT_Ctrl_Monitor">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="FASHndl" value="FASHndl"/>
</Parameters>
</SubProcess>
<SubProcess id="H7_ALS_Process">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="FASHndl" value="FASHndl"/>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="ACCLDWflag" value="ACCLDWflag"/>
<Parameter id="AFSPartnumber" value="AFSPartnumber"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="27" ActivityType="13" flags="0" name="IDT_Init_FAS">
<Rect left="210" top="214" right="310" bottom="246"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_fas1&quot;"/>
<Parameter id="iniKey" value="&quot;fas_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="FASHndl"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1286" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="374" right="456" bottom="406"/>
</Activity>
<Activity id="204" ActivityType="13" flags="0" name="FWE断开通讯">
<Rect left="210" top="534" right="310" bottom="566"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="205" ActivityType="13" flags="0" name="SWE断开通讯">
<Rect left="210" top="614" right="310" bottom="646"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="FAS断开通讯">
<Rect left="210" top="694" right="310" bottom="726"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FASHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="207" ActivityType="5" flags="0" name="获取车辆编码零件号">
<Rect left="210" top="74" right="310" bottom="106"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_Car_Tpye"/>
<Parameter id="Model_Variant"/>
<Parameter id="Engine_Type"/>
<Parameter id="Engine_Displacement"/>
<Parameter id="Design_serialNumber"/>
<Parameter id="Engine_Cylinder"/>
<Parameter id="Transmission_Type"/>
<Parameter id="COC_Speaker"/>
<Parameter id="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker"/>
<Parameter id="EMS00_partnumber"/>
<Parameter id="EMS00_varicoding"/>
<Parameter id="EMS00_configinfo"/>
<Parameter id="AT000_partnumber"/>
<Parameter id="AT000_varicoding"/>
<Parameter id="DCT00_partnumber"/>
<Parameter id="DCT00_varicoding"/>
<Parameter id="EPB00_partnumber"/>
<Parameter id="SAS00_partnumber"/>
<Parameter id="SAS00_varicoding"/>
<Parameter id="EPB00_varicoding"/>
<Parameter id="EHPS0_partnumber"/>
<Parameter id="EHPS0_varicoding"/>
<Parameter id="ESP00_partnumber"/>
<Parameter id="ESP00_varicoding"/>
<Parameter id="AFS00_partnumber" ret="AFSPartnumberr"/>
<Parameter id="AFS00_varicoding"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="AC000_varicoding"/>
<Parameter id="AB000_partnumber"/>
<Parameter id="AB000_varicoding"/>
<Parameter id="LDW00_partnumber"/>
<Parameter id="LDW00_varicoding"/>
<Parameter id="ACC00_partnumber"/>
<Parameter id="ACC00_varicoding"/>
<Parameter id="BCM10_partnumber"/>
<Parameter id="IC000_partnumber"/>
<Parameter id="IC000_varicoding"/>
<Parameter id="BCM20_partnumber"/>
<Parameter id="BCM20_varicoding"/>
<Parameter id="RMArm_partnumber"/>
<Parameter id="RMArm_varicoding"/>
<Parameter id="RMArm_dif_config"/>
<Parameter id="PEPS0_partnumber"/>
<Parameter id="PEPS0_varicoding"/>
<Parameter id="PEPS0_handleswic"/>
<Parameter id="PDC00_partnumber"/>
<Parameter id="PDC00_varicoding"/>
<Parameter id="GW000_partnumber"/>
<Parameter id="GW000_horlconfig"/>
<Parameter id="GW000_varicoding"/>
<Parameter id="DDCU0_partnumber"/>
<Parameter id="DDCU0_varicoding"/>
<Parameter id="PDCU0_partnumber"/>
<Parameter id="PDCU0_varicoding"/>
<Parameter id="RLDCU_partnumber"/>
<Parameter id="RLDCU_varicoding"/>
<Parameter id="RRDCU_partnumber"/>
<Parameter id="RRDCU_varicoding"/>
<Parameter id="DSCU0_partnumber"/>
<Parameter id="DSCU0_varicoding"/>
<Parameter id="BCM10_varicoding"/>
<Parameter id="DString_Write_VIN" value="engine.VIN"/>
<Parameter id="PLGM0_partnumber"/>
<Parameter id="PLGM0_varicoding"/>
<Parameter id="SCM00_partnumber"/>
<Parameter id="SCM00_varicoding"/>
<Parameter id="AC000_auto_swing"/>
<Parameter id="MCU00_partnumber"/>
<Parameter id="MCU00_varicoding"/>
<Parameter id="CHG00_partnumber"/>
<Parameter id="CHG00_varicoding"/>
<Parameter id="OLP00_partnumber"/>
<Parameter id="OLP00_varicoding"/>
<Parameter id="DCDC0_partnumber"/>
<Parameter id="DCDC0_varicoding"/>
<Parameter id="HCU00_partnumber"/>
<Parameter id="HCU00_varicoding"/>
<Parameter id="BSD00_partnumber"/>
<Parameter id="BSD00_varicoding"/>
<Parameter id="FWD00_partnumber"/>
<Parameter id="FWD00_varicoding"/>
<Parameter id="BMS00_partnumber"/>
<Parameter id="BMS00_varicoding"/>
<Parameter id="Model_Name"/>
<Parameter id="GW000_battconfig"/>
<Parameter id="GW000_dvdconfig"/>
<Parameter id="TBOX0_partnumber"/>
<Parameter id="TBOX0_varicoding"/>
<Parameter id="DVD00_partnumber"/>
<Parameter id="DVD00_varicoding"/>
<Parameter id="PLGM1_partnumber"/>
<Parameter id="PLGM1_varicoding"/>
<Parameter id="GW000_0101config"/>
<Parameter id="GW000_0116config"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="207" type="0">
</Transition>
<Transition StartId="3" EndId="27" type="0">
</Transition>
<Transition StartId="20" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="26" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="24" EndId="203" type="0">
</Transition>
<Transition StartId="26" EndId="204" type="0">
</Transition>
<Transition StartId="27" EndId="20" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="2" type="0">
</Transition>
<Transition StartId="207" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

