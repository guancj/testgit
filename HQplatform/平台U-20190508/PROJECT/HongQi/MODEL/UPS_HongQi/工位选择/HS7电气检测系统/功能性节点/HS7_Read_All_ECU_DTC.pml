<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="14" right="470" bottom="46"/>
<Script>DString_C079_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="2314" right="470" bottom="2346"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="EMS_ReadDTC">
<Rect left="370" top="204" right="470" bottom="236"/>
<SubProcesses>
<SubProcess id="EMS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="7" ActivityType="5" flags="0" name="AT_ReadDTC">
<Rect left="370" top="254" right="470" bottom="286"/>
<SubProcesses>
<SubProcess id="AT_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="5" flags="0" name="EGSM_ReadDTC">
<Rect left="370" top="314" right="470" bottom="346"/>
<SubProcesses>
<SubProcess id="EGSM_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="ACM_ReadDTC">
<Rect left="370" top="364" right="470" bottom="396"/>
<SubProcesses>
<SubProcess id="ACM_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="10" ActivityType="5" flags="0" name="ACU_ReadDTC">
<Rect left="370" top="484" right="470" bottom="516"/>
<SubProcesses>
<SubProcess id="ACU_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="0" name="ESP_ReadDTC">
<Rect left="370" top="424" right="470" bottom="456"/>
<SubProcesses>
<SubProcess id="ESP_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="5" flags="0" name="SAS_ReadDTC">
<Rect left="370" top="534" right="470" bottom="566"/>
<SubProcesses>
<SubProcess id="SAS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="13" ActivityType="5" flags="0" name="EPS_ReadDTC">
<Rect left="370" top="604" right="470" bottom="636"/>
<SubProcesses>
<SubProcess id="EPS_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="14" ActivityType="5" flags="0" name="TOD_ReadDTC">
<Rect left="370" top="664" right="470" bottom="696"/>
<SubProcesses>
<SubProcess id="TOD_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="5" flags="0" name="AirSu_ReadDTC">
<Rect left="370" top="724" right="470" bottom="756"/>
<SubProcesses>
<SubProcess id="AirSu_ReadDTC">
<Parameters>
<Parameter id="Station"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="18" ActivityType="5" flags="0" name="AVM_ReadDTC">
<Rect left="370" top="914" right="470" bottom="946"/>
<SubProcesses>
<SubProcess id="AVM_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="19" ActivityType="5" flags="0" name="IFC_ReadDTC">
<Rect left="370" top="974" right="470" bottom="1006"/>
<SubProcesses>
<SubProcess id="IFC_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="ADV_ReadDTC">
<Rect left="370" top="1034" right="470" bottom="1066"/>
<SubProcesses>
<SubProcess id="ADV_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="21" ActivityType="5" flags="0" name="BSD_ReadDTC">
<Rect left="370" top="1084" right="470" bottom="1116"/>
<SubProcesses>
<SubProcess id="BSD_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="22" ActivityType="5" flags="0" name="PDCU_ReadDTC">
<Rect left="370" top="1134" right="470" bottom="1166"/>
<SubProcesses>
<SubProcess id="PDCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="23" ActivityType="5" flags="0" name="DDCU_ReadDTC">
<Rect left="370" top="1204" right="470" bottom="1236"/>
<SubProcesses>
<SubProcess id="DDCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="24" ActivityType="5" flags="0" name="RLDCU_ReadDTC">
<Rect left="370" top="1264" right="470" bottom="1296"/>
<SubProcesses>
<SubProcess id="RLDCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="25" ActivityType="5" flags="0" name="RRDCU_ReadDTC">
<Rect left="370" top="1324" right="470" bottom="1356"/>
<SubProcesses>
<SubProcess id="RRDCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="26" ActivityType="5" flags="0" name="DSCU_ReadDTC">
<Rect left="370" top="1384" right="470" bottom="1416"/>
<SubProcesses>
<SubProcess id="DSCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="27" ActivityType="5" flags="0" name="SCM_ReadDTC">
<Rect left="370" top="1454" right="470" bottom="1486"/>
<SubProcesses>
<SubProcess id="SCM_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="28" ActivityType="5" flags="0" name="T-BOX_ReadDTC">
<Rect left="370" top="1514" right="470" bottom="1546"/>
<SubProcesses>
<SubProcess id="T-BOX_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="29" ActivityType="5" flags="0" name="AC_ReadDTC">
<Rect left="370" top="1574" right="470" bottom="1606"/>
<SubProcesses>
<SubProcess id="AC_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="BCM1_ReadDTC">
<Rect left="370" top="1634" right="470" bottom="1666"/>
<SubProcesses>
<SubProcess id="BCM1_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="31" ActivityType="5" flags="0" name="BCM2_ReadDTC">
<Rect left="370" top="1704" right="470" bottom="1736"/>
<SubProcesses>
<SubProcess id="BCM2_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="32" ActivityType="5" flags="0" name="PEPS_ReadDTC">
<Rect left="370" top="1764" right="470" bottom="1796"/>
<SubProcesses>
<SubProcess id="PEPS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="33" ActivityType="5" flags="0" name="PLGM_ReadDTC">
<Rect left="370" top="1834" right="470" bottom="1866"/>
<SubProcesses>
<SubProcess id="PLGM_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="34" ActivityType="5" flags="0" name="ACP_F_ReadDTC">
<Rect left="370" top="1894" right="470" bottom="1926"/>
<SubProcesses>
<SubProcess id="ACP_F_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="35" ActivityType="5" flags="0" name="ACP_R_ReadDTC">
<Rect left="370" top="1954" right="470" bottom="1986"/>
<SubProcesses>
<SubProcess id="ACP_R_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="36" ActivityType="5" flags="0" name="IVI_ReadDTC">
<Rect left="370" top="2024" right="470" bottom="2056"/>
<SubProcesses>
<SubProcess id="IVI_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="37" ActivityType="5" flags="0" name="DVR_ReadDTC">
<Rect left="370" top="2094" right="470" bottom="2126"/>
<SubProcesses>
<SubProcess id="DVR_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="38" ActivityType="5" flags="0" name="SCCU_ReadDTC">
<Rect left="370" top="2154" right="470" bottom="2186"/>
<SubProcesses>
<SubProcess id="SCCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="39" ActivityType="5" flags="0" name="ALS_ReadDTC">
<Rect left="370" top="2224" right="470" bottom="2256"/>
<SubProcesses>
<SubProcess id="ALS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="40" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="370" top="64" right="470" bottom="96"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data_HS7">
<Parameters>
<Parameter id="DString_Car_Tpye" value="DString_C079_Car_Type"/>
<Parameter id="Model_Variant"/>
<Parameter id="Engine_Type"/>
<Parameter id="Engine_Displacement"/>
<Parameter id="Design_serialNumber"/>
<Parameter id="Engine_Cylinder"/>
<Parameter id="Transmission_Type"/>
<Parameter id="COC_Speaker"/>
<Parameter id="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker"/>
<Parameter id="GW00_partnumber" ret="GW_partnumber"/>
<Parameter id="GW00_varicoding" ret="GW_varicoding"/>
<Parameter id="EMS00_partnumber" ret="EMS_partnumber"/>
<Parameter id="EMS00_varicoding" ret="EMS_varicoding"/>
<Parameter id="AT00_partnumber" ret="AT_partnumber"/>
<Parameter id="AT00_varicoding" ret="AT_varicoding"/>
<Parameter id="EGSM00_partnumber" ret="EGSM_partnumber"/>
<Parameter id="EGSM00_varicoding" ret="EGSM_varicoding"/>
<Parameter id="ACM00_partnumber" ret="ACM_partnumber"/>
<Parameter id="ACM00_varicoding" ret="ACM_varicoding"/>
<Parameter id="ACU00_partnumber" ret="ACU_partnumber"/>
<Parameter id="ACU00_varicoding" ret="ACU_varicoding"/>
<Parameter id="ESP00_partnumber" ret="ESP_partnumber"/>
<Parameter id="ESP00_varicoding" ret="ESP_varicoding"/>
<Parameter id="SAS00_partnumber" ret="SAS_partnumber"/>
<Parameter id="SAS00_varicoding" ret="SAS_varicoding"/>
<Parameter id="EPS00_partnumber" ret="EPS_partnumber"/>
<Parameter id="EPS00_varicoding" ret="EPS_varicoding"/>
<Parameter id="TOD00_partnumber" ret="TOD_partnumber"/>
<Parameter id="TOD00_varicoding" ret="TOD_varicoding"/>
<Parameter id="AirS00_partnumber" ret="AirS_partnumber"/>
<Parameter id="AirS00_varicoding" ret="AirS_varicoding"/>
<Parameter id="DMS00_partnumber" ret="DMS_partnumber"/>
<Parameter id="DMS00_varicoding" ret="DMS_varicoding"/>
<Parameter id="PDC00_partnumber" ret="PDC_partnumber"/>
<Parameter id="PDC00_varicoding" ret="PDC_varicoding"/>
<Parameter id="AVM00_partnumber" ret="AVM_partnumber"/>
<Parameter id="AVM00_varicoding" ret="AVM_varicoding"/>
<Parameter id="IFC00_partnumber" ret="IFC_partnumber"/>
<Parameter id="IFC00_varicoding" ret="IFC_varicoding"/>
<Parameter id="ADV00_partnumber" ret="ADV_partnumber"/>
<Parameter id="ADV00_varicoding" ret="ADV_varicoding"/>
<Parameter id="BSD00_partnumber" ret="BSD_partnumber"/>
<Parameter id="BSD00_varicoding" ret="BSD_varicoding"/>
<Parameter id="SCM00_partnumber" ret="SCM_partnumber"/>
<Parameter id="SCM00_varicoding" ret="SCM_varicoding"/>
<Parameter id="TBOX00_partnumber" ret="TBOX_partnumber"/>
<Parameter id="TBOX00_varicoding" ret="TBOX_varicoding"/>
<Parameter id="AC00_partnumber" ret="AC_partnumber"/>
<Parameter id="AC00_varicoding" ret="AC_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="IVI00_partnumber" ret="IVI_partnumber"/>
<Parameter id="IVI00_varicoding1" ret="IVI_varicoding1"/>
<Parameter id="IVI00_varicoding2" ret="IVI_varicoding2"/>
<Parameter id="DVR00_partnumber" ret="DVR_partnumber"/>
<Parameter id="DVR00_varicoding" ret="DVR_varicoding"/>
<Parameter id="ALS00_partnumber" ret="ALS_partnumber"/>
<Parameter id="ALS00_varicoding" ret="ALS_varicoding"/>
<Parameter id="DDCU00_partnumber" ret="DDCU_partnumber"/>
<Parameter id="DDCU00_varicoding" ret="DDCU_varicoding"/>
<Parameter id="PDCU00_partnumber" ret="PDCU_partnumber"/>
<Parameter id="PDCU00_varicoding" ret="PDCU_varicoding"/>
<Parameter id="RLDCU00_partnumber" ret="RLDCU_partnumber"/>
<Parameter id="RLDCU00_varicoding" ret="RLDCU_varicoding"/>
<Parameter id="RRDCU00_partnumber" ret="RRDCU_partnumber"/>
<Parameter id="RRDCU00_varicoding" ret="RRDCU_varicoding"/>
<Parameter id="DSCU00_partnumber" ret="DSCU_partnumber"/>
<Parameter id="DSCU00_varicoding" ret="DSCU_varicoding"/>
<Parameter id="BCM100_partnumber" ret="BCM1_partnumber"/>
<Parameter id="BCM100_varicoding" ret="BCM1_varicoding"/>
<Parameter id="BCM200_partnumber" ret="BCM2_partnumber"/>
<Parameter id="BCM200_varicoding" ret="BCM2_varicoding"/>
<Parameter id="PEPS00_partnumber" ret="PEPS_partnumber"/>
<Parameter id="PEPS00_varicoding" ret="PEPS_varicoding"/>
<Parameter id="PLGM00_partnumber" ret="PLGM_partnumber"/>
<Parameter id="PLGM00_varicoding" ret="PLGM_varicoding"/>
<Parameter id="ACPF00_partnumber" ret="ACPF_partnumber"/>
<Parameter id="ACPF00_varicoding" ret="ACPF_varicoding"/>
<Parameter id="SCCU00_partnumber" ret="SCCU_partnumber"/>
<Parameter id="SCCU00_varicoding" ret="SCCU_varicoding"/>
<Parameter id="ACPR00_partnumber" ret="ACPR_partnumber"/>
<Parameter id="ACPR00_varicoding" ret="ACPR_varicoding"/>
<Parameter id="AFS00_partnumber" ret="AFS00_partnumber"/>
<Parameter id="AFS00_varicoding" ret="AFS00_varicoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="145" ActivityType="5" flags="1" name="GW_ReadDTC">
<Rect left="370" top="134" right="470" bottom="166"/>
<SubProcesses>
<SubProcess id="GW_ReadDTC">
<Parameters>
<Parameter id="Station"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="134" right="566" bottom="166"/>
</Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="204" right="566" bottom="236"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="254" right="566" bottom="286"/>
</Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="314" right="566" bottom="346"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="374" right="566" bottom="406"/>
</Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="424" right="566" bottom="456"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="484" right="566" bottom="516"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="534" right="566" bottom="566"/>
</Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="604" right="566" bottom="636"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="664" right="566" bottom="696"/>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="724" right="566" bottom="756"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="844" right="566" bottom="876"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="914" right="566" bottom="946"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="974" right="566" bottom="1006"/>
</Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1034" right="566" bottom="1066"/>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1084" right="566" bottom="1116"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1134" right="566" bottom="1166"/>
</Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1204" right="566" bottom="1236"/>
</Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1264" right="566" bottom="1296"/>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1324" right="566" bottom="1356"/>
</Activity>
<Activity id="167" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1384" right="566" bottom="1416"/>
</Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1454" right="566" bottom="1486"/>
</Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1514" right="566" bottom="1546"/>
</Activity>
<Activity id="170" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1574" right="566" bottom="1606"/>
</Activity>
<Activity id="171" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1634" right="566" bottom="1666"/>
</Activity>
<Activity id="172" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1704" right="566" bottom="1736"/>
</Activity>
<Activity id="173" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1764" right="566" bottom="1796"/>
</Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1834" right="566" bottom="1866"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1894" right="566" bottom="1926"/>
</Activity>
<Activity id="176" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1954" right="566" bottom="1986"/>
</Activity>
<Activity id="177" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="2024" right="566" bottom="2056"/>
</Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="2094" right="566" bottom="2126"/>
</Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="2154" right="566" bottom="2186"/>
</Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="2224" right="566" bottom="2256"/>
</Activity>
<Activity id="181" ActivityType="5" flags="0" name="PDC_ReadDTC">
<Rect left="370" top="844" right="470" bottom="876"/>
<SubProcesses>
<SubProcess id="PDC_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="182" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="784" right="566" bottom="816"/>
</Activity>
<Activity id="183" ActivityType="5" flags="0" name="DMSCU_ReadDTC">
<Rect left="370" top="784" right="470" bottom="816"/>
<SubProcesses>
<SubProcess id="DMSCU_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="40" type="0">
</Transition>
<Transition StartId="3" EndId="147" type="0">
</Transition>
<Transition StartId="7" EndId="148" type="0">
</Transition>
<Transition StartId="8" EndId="149" type="0">
</Transition>
<Transition StartId="9" EndId="150" type="0">
</Transition>
<Transition StartId="10" EndId="152" type="0">
</Transition>
<Transition StartId="11" EndId="151" type="0">
</Transition>
<Transition StartId="12" EndId="153" type="0">
</Transition>
<Transition StartId="13" EndId="155" type="0">
</Transition>
<Transition StartId="14" EndId="156" type="0">
</Transition>
<Transition StartId="15" EndId="157" type="0">
</Transition>
<Transition StartId="18" EndId="159" type="0">
</Transition>
<Transition StartId="19" EndId="160" type="0">
</Transition>
<Transition StartId="20" EndId="161" type="0">
</Transition>
<Transition StartId="21" EndId="162" type="0">
</Transition>
<Transition StartId="22" EndId="163" type="0">
</Transition>
<Transition StartId="23" EndId="164" type="0">
</Transition>
<Transition StartId="24" EndId="165" type="0">
</Transition>
<Transition StartId="25" EndId="166" type="0">
</Transition>
<Transition StartId="26" EndId="167" type="0">
</Transition>
<Transition StartId="27" EndId="168" type="0">
</Transition>
<Transition StartId="28" EndId="169" type="0">
</Transition>
<Transition StartId="29" EndId="170" type="0">
</Transition>
<Transition StartId="30" EndId="171" type="0">
</Transition>
<Transition StartId="31" EndId="172" type="0">
</Transition>
<Transition StartId="32" EndId="173" type="0">
</Transition>
<Transition StartId="33" EndId="174" type="0">
</Transition>
<Transition StartId="34" EndId="175" type="0">
</Transition>
<Transition StartId="35" EndId="176" type="0">
</Transition>
<Transition StartId="36" EndId="177" type="0">
</Transition>
<Transition StartId="37" EndId="178" type="0">
</Transition>
<Transition StartId="38" EndId="179" type="0">
</Transition>
<Transition StartId="39" EndId="2" type="0">
</Transition>
<Transition StartId="40" EndId="146" type="0">
</Transition>
<Transition StartId="40" EndId="145" type="1">
<Expression>GW_partnumber ~= "" and GW_partnumber~= nil</Expression></Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="146" EndId="3" type="1">
<Expression>EMS_partnumber ~= "" and EMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="147" EndId="7" type="1">
<Expression>AT_partnumber ~= "" and AT_partnumber ~= nil</Expression></Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="8" type="1">
<Expression>EGSM_partnumber ~= "" and  EGSM_partnumber ~= nil</Expression></Transition>
<Transition StartId="148" EndId="149" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="149" EndId="9" type="1">
<Expression>ACM_partnumber ~= "" and ACM_partnumber ~= nil</Expression></Transition>
<Transition StartId="150" EndId="11" type="1">
<Expression>ESP_partnumber ~= "" and ESP_partnumber ~= nil</Expression></Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="152" type="0">
</Transition>
<Transition StartId="151" EndId="10" type="1">
<Expression>ACU_partnumber ~= "" and ACU_partnumber ~= nil</Expression></Transition>
<Transition StartId="152" EndId="153" type="0">
</Transition>
<Transition StartId="152" EndId="12" type="1">
<Expression>SAS_partnumber ~= "" and SAS_partnumber ~= nil</Expression></Transition>
<Transition StartId="153" EndId="155" type="0">
</Transition>
<Transition StartId="153" EndId="13" type="1">
<Expression>EPS_partnumber ~= "" and EPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="155" EndId="14" type="1">
<Expression>TOD_partnumber ~= "" and TOD_partnumber ~= nil</Expression></Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="156" EndId="15" type="1">
<Expression>AirS_partnumber ~= "" and AirS_partnumber ~= nil</Expression></Transition>
<Transition StartId="157" EndId="182" type="0">
</Transition>
<Transition StartId="157" EndId="183" type="1">
<Expression>DMS_partnumber ~= "" and DMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="158" EndId="18" type="1">
<Expression>AVM_partnumber ~= "" and AVM_partnumber ~= nil</Expression></Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="159" EndId="19" type="1">
<Expression>IFC_partnumber ~= "" and IFC_partnumber ~= nil</Expression></Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="160" EndId="20" type="1">
<Expression>ADV_partnumber ~= "" and ADV_partnumber ~=  nil</Expression></Transition>
<Transition StartId="161" EndId="162" type="0">
</Transition>
<Transition StartId="161" EndId="21" type="1">
<Expression>BSD_partnumber ~= "" and BSD_partnumber ~= nil</Expression></Transition>
<Transition StartId="162" EndId="163" type="0">
</Transition>
<Transition StartId="162" EndId="22" type="1">
<Expression>PDCU_partnumber ~= "" and PDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="163" EndId="23" type="1">
<Expression>DDCU_partnumber ~= "" and DDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="164" EndId="24" type="1">
<Expression>RLDCU_partnumber ~= "" and RLDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="165" EndId="166" type="0">
</Transition>
<Transition StartId="165" EndId="25" type="1">
<Expression>RRDCU_partnumber ~= "" and RRDCU_partnumber ~= nil </Expression></Transition>
<Transition StartId="166" EndId="167" type="0">
</Transition>
<Transition StartId="166" EndId="26" type="1">
<Expression>DSCU_partnumber ~= "" and DSCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="167" EndId="27" type="1">
<Expression>SCM_partnumber ~= "" and SCM_partnumber ~= nil </Expression></Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="168" EndId="28" type="1">
<Expression>TBOX_partnumber ~= "" and TBOX_partnumber ~= nil</Expression></Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="169" EndId="29" type="1">
<Expression>AC_partnumber ~= "" and AC_partnumber ~= nil</Expression></Transition>
<Transition StartId="170" EndId="171" type="0">
</Transition>
<Transition StartId="170" EndId="30" type="1">
<Expression>BCM1_partnumber ~= "" and BCM1_partnumber ~= nil</Expression></Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="171" EndId="31" type="1">
<Expression>BCM2_partnumber ~= "" and BCM2_partnumber ~= nil</Expression></Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="172" EndId="32" type="1">
<Expression>PEPS_partnumber ~= "" and PEPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="173" EndId="174" type="0">
</Transition>
<Transition StartId="173" EndId="33" type="1">
<Expression>PLGM_partnumber ~= "" and PLGM_partnumber ~= nil</Expression></Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="174" EndId="34" type="1">
<Expression>ACPF_partnumber ~= "" and ACPF_partnumber ~= nil</Expression></Transition>
<Transition StartId="175" EndId="176" type="0">
</Transition>
<Transition StartId="175" EndId="35" type="1">
<Expression>ACPR_partnumber ~= "" and ACPR_partnumber ~= nil</Expression></Transition>
<Transition StartId="176" EndId="177" type="0">
</Transition>
<Transition StartId="176" EndId="36" type="1">
<Expression>IVI_partnumber ~= "" and IVI_partnumber ~= nil</Expression></Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="177" EndId="37" type="1">
<Expression>DVR_partnumber ~= "" and DVR_partnumber ~= nil</Expression></Transition>
<Transition StartId="178" EndId="179" type="0">
</Transition>
<Transition StartId="178" EndId="38" type="1">
<Expression>SCCU_partnumber ~= "" and SCCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="179" EndId="180" type="0">
</Transition>
<Transition StartId="179" EndId="39" type="1">
<Expression>ALS_partnumber ~= "" and ALS_partnumber ~= nil</Expression></Transition>
<Transition StartId="180" EndId="2" type="0">
</Transition>
<Transition StartId="181" EndId="158" type="0">
</Transition>
<Transition StartId="182" EndId="181" type="1">
<Expression>PDC_partnumber ~= "" and PDC_partnumber ~= nil</Expression></Transition>
<Transition StartId="182" EndId="158" type="0">
</Transition>
<Transition StartId="183" EndId="182" type="0">
</Transition>
</Transitions>
</Process>

