<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="220" top="24" right="320" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="650" top="1364" right="750" bottom="1396"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="变量设置">
<Rect left="220" top="84" right="320" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="变量初始化"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DString_C079_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN

print("机能线HS7车型:"..DString_C079_Car_Type)
print("机能线HS7-VIN:"..DString_Write_VIN)</Script></Activity>
<Activity id="144" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="220" top="144" right="320" bottom="176"/>
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
<Activity id="164" ActivityType="5" flags="0" name="GW_Common">
<Rect left="360" top="334" right="460" bottom="366"/>
<SubProcesses>
<SubProcess id="GW_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="GW_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="208" ActivityType="5" flags="0" name="EMS_Common">
<Rect left="480" top="334" right="580" bottom="366"/>
<SubProcesses>
<SubProcess id="EMS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="EMS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="209" ActivityType="5" flags="0" name="AT_Common">
<Rect left="620" top="334" right="720" bottom="366"/>
<SubProcesses>
<SubProcess id="AT_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="AT_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="210" ActivityType="5" flags="0" name="EGSM_Common">
<Rect left="750" top="334" right="850" bottom="366"/>
<SubProcesses>
<SubProcess id="EGSM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="EGSM_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="211" ActivityType="5" flags="0" name="ACM_Common">
<Rect left="880" top="334" right="980" bottom="366"/>
<SubProcesses>
<SubProcess id="ACM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="ACM_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="212" ActivityType="5" flags="0" name="ACU_Common">
<Rect left="1010" top="334" right="1110" bottom="366"/>
<SubProcesses>
<SubProcess id="ACU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="ACU_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="213" ActivityType="5" flags="0" name="ESP_common">
<Rect left="220" top="334" right="320" bottom="366"/>
<SubProcesses>
<SubProcess id="ESP_common">
<Parameters>
<Parameter id="DString_Partnumber" value="ESP_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="214" ActivityType="5" flags="0" name="SAS_Common">
<Rect left="1140" top="554" right="1240" bottom="586"/>
<SubProcesses>
<SubProcess id="SAS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="SAS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="HS7_SAS_VIN_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="215" ActivityType="5" flags="0" name="EPS_common">
<Rect left="990" top="554" right="1090" bottom="586"/>
<SubProcesses>
<SubProcess id="EPS_common">
<Parameters>
<Parameter id="DString_Partnumber" value="EPS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="216" ActivityType="5" flags="0" name="TOD_Common">
<Rect left="850" top="554" right="950" bottom="586"/>
<SubProcesses>
<SubProcess id="TOD_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="TOD_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="217" ActivityType="5" flags="1" name="AirS_Common">
<Rect left="720" top="554" right="820" bottom="586"/>
<SubProcesses>
<SubProcess id="AirS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="AirS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="218" ActivityType="5" flags="0" name="DMSCU_Common">
<Rect left="610" top="554" right="710" bottom="586"/>
<SubProcesses>
<SubProcess id="DMSCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="DMS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="220" ActivityType="5" flags="0" name="AVM_Common">
<Rect left="340" top="554" right="440" bottom="586"/>
<SubProcesses>
<SubProcess id="AVM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="AVM_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="221" ActivityType="5" flags="0" name="IFC_common">
<Rect left="210" top="824" right="310" bottom="856"/>
<SubProcesses>
<SubProcess id="IFC_common">
<Parameters>
<Parameter id="DString_Partnumber" value="IFC_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="222" ActivityType="5" flags="0" name="ADV_Common">
<Rect left="350" top="824" right="450" bottom="856"/>
<SubProcesses>
<SubProcess id="ADV_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="ADV_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="223" ActivityType="5" flags="0" name="BSD_Common">
<Rect left="490" top="824" right="590" bottom="856"/>
<SubProcesses>
<SubProcess id="BSD_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="BSD_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="224" ActivityType="5" flags="0" name="RRDCU_Common">
<Rect left="990" top="824" right="1090" bottom="856"/>
<SubProcesses>
<SubProcess id="RRDCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="RRDCU_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="225" ActivityType="5" flags="0" name="RLDCU_Common">
<Rect left="860" top="824" right="960" bottom="856"/>
<SubProcesses>
<SubProcess id="RLDCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="RLDCU_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="226" ActivityType="5" flags="0" name="DDCU_Common">
<Rect left="620" top="824" right="720" bottom="856"/>
<SubProcesses>
<SubProcess id="DDCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="DDCU_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="227" ActivityType="5" flags="0" name="PDCU_Common">
<Rect left="740" top="824" right="840" bottom="856"/>
<SubProcesses>
<SubProcess id="PDCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PDCU_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="229" ActivityType="5" flags="0" name="SCM_Common">
<Rect left="990" top="1034" right="1090" bottom="1066"/>
<SubProcesses>
<SubProcess id="SCM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="SCM_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="230" ActivityType="5" flags="0" name="T-BOX_Common">
<Rect left="870" top="1034" right="970" bottom="1066"/>
<SubProcesses>
<SubProcess id="T-BOX_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="TBOX_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="231" ActivityType="5" flags="0" name="AC_Common">
<Rect left="750" top="1034" right="850" bottom="1066"/>
<SubProcesses>
<SubProcess id="AC_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="AC_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="233" ActivityType="5" flags="0" name="BCM2_Common">
<Rect left="500" top="1034" right="600" bottom="1066"/>
<SubProcesses>
<SubProcess id="BCM2_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="BCM2_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="234" ActivityType="5" flags="0" name="PEPS_Common">
<Rect left="380" top="1034" right="480" bottom="1066"/>
<SubProcesses>
<SubProcess id="PEPS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PEPS_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="235" ActivityType="5" flags="0" name="PLGM_Common">
<Rect left="270" top="1034" right="370" bottom="1066"/>
<SubProcesses>
<SubProcess id="PLGM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PLGM_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="240" ActivityType="5" flags="0" name="IVI_Common">
<Rect left="150" top="1304" right="250" bottom="1336"/>
<SubProcesses>
<SubProcess id="IVI_Common">
<Parameters>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_VariCoding1"/>
<Parameter id="DString_Partnumber" value="IVI_partnumber"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="DVR_Common">
<Rect left="270" top="1304" right="370" bottom="1336"/>
<SubProcesses>
<SubProcess id="DVR_Common">
<Parameters>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Partnumber" value="DVR_partnumber"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="242" ActivityType="5" flags="0" name="SCCU_Common">
<Rect left="390" top="1304" right="490" bottom="1336"/>
<SubProcesses>
<SubProcess id="SCCU_Common">
<Parameters>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Partnumber" value="SCCU_partnumber"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="243" ActivityType="5" flags="0" name="ALS_Common">
<Rect left="510" top="1304" right="610" bottom="1336"/>
<SubProcesses>
<SubProcess id="ALS_Common">
<Parameters>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Partnumber" value="ALS_partnumber"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="274" right="546" bottom="306"/>
</Activity>
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="274" right="686" bottom="306"/>
</Activity>
<Activity id="247" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="274" right="816" bottom="306"/>
</Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="274" right="946" bottom="306"/>
</Activity>
<Activity id="249" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="274" right="1076" bottom="306"/>
</Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="274" right="286" bottom="306"/>
</Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="274" right="1206" bottom="306"/>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="504" right="1056" bottom="536"/>
</Activity>
<Activity id="253" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="504" right="916" bottom="536"/>
</Activity>
<Activity id="254" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="504" right="786" bottom="536"/>
</Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="504" right="676" bottom="536"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="504" right="556" bottom="536"/>
</Activity>
<Activity id="257" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="504" right="406" bottom="536"/>
</Activity>
<Activity id="258" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="504" right="276" bottom="536"/>
</Activity>
<Activity id="259" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="754" right="416" bottom="786"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="754" right="556" bottom="786"/>
</Activity>
<Activity id="261" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="754" right="686" bottom="786"/>
</Activity>
<Activity id="262" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="754" right="806" bottom="786"/>
</Activity>
<Activity id="263" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="754" right="926" bottom="786"/>
</Activity>
<Activity id="264" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="754" right="1056" bottom="786"/>
</Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1164" top="754" right="1196" bottom="786"/>
</Activity>
<Activity id="266" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="974" right="1056" bottom="1006"/>
</Activity>
<Activity id="267" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="974" right="936" bottom="1006"/>
</Activity>
<Activity id="268" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="974" right="816" bottom="1006"/>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="974" right="696" bottom="1006"/>
</Activity>
<Activity id="270" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="974" right="566" bottom="1006"/>
</Activity>
<Activity id="271" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="974" right="446" bottom="1006"/>
</Activity>
<Activity id="272" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="974" right="336" bottom="1006"/>
</Activity>
<Activity id="273" ActivityType="4" flags="0" name="路由节点">
<Rect left="184" top="974" right="216" bottom="1006"/>
</Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="974" right="106" bottom="1006"/>
</Activity>
<Activity id="275" ActivityType="4" flags="0" name="路由节点">
<Rect left="184" top="1234" right="216" bottom="1266"/>
</Activity>
<Activity id="277" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="1234" right="336" bottom="1266"/>
</Activity>
<Activity id="278" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="1234" right="456" bottom="1266"/>
</Activity>
<Activity id="279" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="1234" right="576" bottom="1266"/>
</Activity>
<Activity id="280" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="1234" right="716" bottom="1266"/>
</Activity>
<Activity id="281" ActivityType="5" flags="0" name="ACP_F_Common">
<Rect left="150" top="1034" right="250" bottom="1066"/>
<SubProcesses>
<SubProcess id="ACP_F_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="ACPF_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="283" ActivityType="5" flags="0" name="DSCU_Common">
<Rect left="1130" top="1034" right="1230" bottom="1066"/>
<SubProcesses>
<SubProcess id="DSCU_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="DSCU_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="284" ActivityType="3" flags="0" name="普通节点">
<Rect left="220" top="214" right="320" bottom="246"/>
<Script>print("AVMpartnumebr:"..AVM_partnumber)
print("RLDCU_partnumber:"..RLDCU_partnumber)</Script></Activity>
<Activity id="286" ActivityType="5" flags="0" name="PDC_Common">
<Rect left="490" top="554" right="590" bottom="586"/>
<SubProcesses>
<SubProcess id="PDC_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PDC_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="287" ActivityType="5" flags="0" name="ACP_R_Common">
<Rect left="40" top="1304" right="140" bottom="1336"/>
<SubProcesses>
<SubProcess id="ACP_R_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="ACPR_partnumber"/>
<Parameter id="DString_Write_VIN"/>
<Parameter id="DString_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="288" ActivityType="5" flags="0" name="HS7_Read_All_ECU_DTC">
<Rect left="650" top="1304" right="750" bottom="1336"/>
<SubProcesses>
<SubProcess id="HS7_Read_All_ECU_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="290" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="504" right="1206" bottom="536"/>
</Activity>
<Activity id="291" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="754" right="276" bottom="786"/>
</Activity>
<Activity id="292" ActivityType="4" flags="0" name="路由节点">
<Rect left="1164" top="974" right="1196" bottom="1006"/>
</Activity>
<Activity id="293" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1234" right="106" bottom="1266"/>
</Activity>
<Activity id="298" ActivityType="5" flags="0" name="SAS_angleCheck">
<Rect left="1140" top="614" right="1240" bottom="646"/>
<SubProcesses>
<SubProcess id="SAS_angleCheck">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="299" ActivityType="5" flags="0" name="ALS_test">
<Rect left="510" top="1364" right="610" bottom="1396"/>
<SubProcesses>
<SubProcess id="ALS_test">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="302" ActivityType="4" flags="0" name="路由节点">
<Rect left="394" top="274" right="426" bottom="306"/>
</Activity>
<Activity id="303" ActivityType="5" flags="0" name="DSCU_test">
<Rect left="1130" top="1094" right="1230" bottom="1126"/>
<SubProcesses>
<SubProcess id="DSCU_test">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="310" ActivityType="5" flags="0" name="IVI_test">
<Rect left="150" top="1364" right="250" bottom="1396"/>
<SubProcesses>
<SubProcess id="IVI_test">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="311" ActivityType="5" flags="0" name="T-BOX_EOL">
<Rect left="870" top="1094" right="970" bottom="1126"/>
<SubProcesses>
<SubProcess id="T-BOX_EOL">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="316" ActivityType="5" flags="0" name="BCM1_Commo">
<Rect left="630" top="1034" right="730" bottom="1066"/>
<SubProcesses>
<SubProcess id="BCM1_Commo">
<Parameters>
<Parameter id="DString_Partnumber" value="BCM1_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="317" ActivityType="5" flags="0" name="空气悬架完成">
<Rect left="720" top="624" right="820" bottom="656"/>
<SubProcesses>
<SubProcess id="空气悬架标定2">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="318" ActivityType="5" flags="0" name="AVM_Test">
<Rect left="340" top="624" right="440" bottom="656"/>
<SubProcesses>
<SubProcess id="AVM_Test">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="319" ActivityType="5" flags="0" name="PDC_机能线">
<Rect left="490" top="624" right="590" bottom="656"/>
<SubProcesses>
<SubProcess id="PDC_机能线">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="320" ActivityType="5" flags="0" name="ACM_Calibration">
<Rect left="880" top="394" right="980" bottom="426"/>
<SubProcesses>
<SubProcess id="ACM_Calibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="321" ActivityType="5" flags="0" name="ACP_F_test">
<Rect left="150" top="1144" right="250" bottom="1176"/>
<SubProcesses>
<SubProcess id="ACP_F_test">
<Parameters>
<Parameter id="DString_Partnumber" value="ACP_R_TBD_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="322" ActivityType="5" flags="0" name="ACP_R_test">
<Rect left="41" top="1363" right="141" bottom="1395"/>
<SubProcesses>
<SubProcess id="ACP_R_test">
<Parameters>
<Parameter id="DString_Partnumber" value="ACP_R_TBD_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="323" ActivityType="5" flags="0" name="TPMS_WriteID">
<Rect left="380" top="1098" right="480" bottom="1130"/>
<SubProcesses>
<SubProcess id="TPMS_WriteID">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="144" type="0">
</Transition>
<Transition StartId="144" EndId="284" type="0">
</Transition>
<Transition StartId="164" EndId="244" type="0">
</Transition>
<Transition StartId="208" EndId="246" type="0">
</Transition>
<Transition StartId="209" EndId="247" type="0">
</Transition>
<Transition StartId="210" EndId="248" type="0">
</Transition>
<Transition StartId="211" EndId="320" type="0">
</Transition>
<Transition StartId="212" EndId="251" type="0">
</Transition>
<Transition StartId="213" EndId="302" type="0">
</Transition>
<Transition StartId="214" EndId="298" type="0">
</Transition>
<Transition StartId="215" EndId="253" type="0">
</Transition>
<Transition StartId="216" EndId="254" type="0">
</Transition>
<Transition StartId="217" EndId="317" type="0">
</Transition>
<Transition StartId="218" EndId="256" type="0">
</Transition>
<Transition StartId="220" EndId="258" type="0">
</Transition>
<Transition StartId="221" EndId="259" type="0">
</Transition>
<Transition StartId="222" EndId="260" type="0">
</Transition>
<Transition StartId="223" EndId="261" type="0">
</Transition>
<Transition StartId="224" EndId="265" type="0">
</Transition>
<Transition StartId="225" EndId="264" type="0">
</Transition>
<Transition StartId="226" EndId="262" type="0">
</Transition>
<Transition StartId="227" EndId="263" type="0">
</Transition>
<Transition StartId="229" EndId="267" type="0">
</Transition>
<Transition StartId="230" EndId="268" type="0">
</Transition>
<Transition StartId="231" EndId="269" type="0">
</Transition>
<Transition StartId="233" EndId="271" type="0">
</Transition>
<Transition StartId="234" EndId="323" type="0">
</Transition>
<Transition StartId="235" EndId="273" type="0">
</Transition>
<Transition StartId="240" EndId="310" type="0">
</Transition>
<Transition StartId="241" EndId="278" type="0">
</Transition>
<Transition StartId="242" EndId="279" type="0">
</Transition>
<Transition StartId="243" EndId="280" type="0">
</Transition>
<Transition StartId="244" EndId="208" type="1">
<Expression>EMS_partnumber ~= "" and EMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="244" EndId="246" type="0">
</Transition>
<Transition StartId="246" EndId="209" type="1">
<Expression>AT_partnumber ~= "" and AT_partnumber ~= nil</Expression></Transition>
<Transition StartId="246" EndId="247" type="0">
</Transition>
<Transition StartId="247" EndId="210" type="1">
<Expression>EGSM_partnumber ~= "" and  EGSM_partnumber ~= nil</Expression></Transition>
<Transition StartId="247" EndId="248" type="0">
</Transition>
<Transition StartId="248" EndId="211" type="1">
<Expression>ACM_partnumber ~= "" and ACM_partnumber ~= nil</Expression></Transition>
<Transition StartId="248" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="212" type="1">
<Expression>ACU_partnumber ~= "" and ACU_partnumber ~= nil</Expression></Transition>
<Transition StartId="249" EndId="251" type="0">
</Transition>
<Transition StartId="250" EndId="213" type="1">
<Expression>ESP_partnumber ~= "" and ESP_partnumber ~= nil</Expression></Transition>
<Transition StartId="250" EndId="302" type="0">
</Transition>
<Transition StartId="251" EndId="290" type="0">
</Transition>
<Transition StartId="252" EndId="215" type="1">
<Expression>EPS_partnumber ~= "" and EPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="216" type="1">
<Expression>TOD_partnumber ~= "" and TOD_partnumber ~= nil</Expression></Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="217" type="1">
<Expression>AirS_partnumber ~= "" and AirS_partnumber ~= nil</Expression></Transition>
<Transition StartId="254" EndId="255" type="0">
</Transition>
<Transition StartId="255" EndId="218" type="1">
<Expression>DMS_partnumber ~= "" and DMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="286" type="1">
<Expression>PDC_partnumber ~= "" and PDC_partnumber ~= nil</Expression></Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="220" type="1">
<Expression>AVM_partnumber ~= "" and AVM_partnumber ~= nil</Expression></Transition>
<Transition StartId="257" EndId="258" type="0">
</Transition>
<Transition StartId="258" EndId="291" type="0">
</Transition>
<Transition StartId="259" EndId="222" type="1">
<Expression>ADV_partnumber ~= "" and ADV_partnumber ~=  nil</Expression></Transition>
<Transition StartId="259" EndId="260" type="0">
</Transition>
<Transition StartId="260" EndId="223" type="1">
<Expression>BSD_partnumber ~= "" and BSD_partnumber ~= nil</Expression></Transition>
<Transition StartId="260" EndId="261" type="0">
</Transition>
<Transition StartId="261" EndId="226" type="1">
<Expression>DDCU_partnumber ~= "" and DDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="261" EndId="262" type="0">
</Transition>
<Transition StartId="262" EndId="227" type="1">
<Expression>PDCU_partnumber ~= "" and PDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="225" type="1">
<Expression>RLDCU_partnumber ~= "" and RLDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="224" type="1">
<Expression>RRDCU_partnumber ~= "" and RRDCU_partnumber ~= nil </Expression></Transition>
<Transition StartId="264" EndId="265" type="0">
</Transition>
<Transition StartId="265" EndId="292" type="0">
</Transition>
<Transition StartId="266" EndId="229" type="1">
<Expression>SCM_partnumber ~= "" and SCM_partnumber ~= nil </Expression></Transition>
<Transition StartId="266" EndId="267" type="0">
</Transition>
<Transition StartId="267" EndId="230" type="1">
<Expression>TBOX_partnumber ~= "" and TBOX_partnumber ~= nil</Expression></Transition>
<Transition StartId="267" EndId="268" type="0">
</Transition>
<Transition StartId="268" EndId="231" type="1">
<Expression>AC_partnumber ~= "" and AC_partnumber ~= nil</Expression></Transition>
<Transition StartId="268" EndId="269" type="0">
</Transition>
<Transition StartId="269" EndId="316" type="1">
<Expression>BCM1_partnumber ~= "" and BCM1_partnumber ~= nil</Expression></Transition>
<Transition StartId="269" EndId="270" type="0">
</Transition>
<Transition StartId="270" EndId="233" type="1">
<Expression>BCM2_partnumber ~= "" and BCM2_partnumber ~= nil</Expression></Transition>
<Transition StartId="270" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="271" EndId="234" type="1">
<Expression>PEPS_partnumber ~= "" and PEPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="272" EndId="235" type="1">
<Expression>PLGM_partnumber ~= "" and PLGM_partnumber ~= nil</Expression></Transition>
<Transition StartId="272" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="281" type="1">
<Expression>ACPF_partnumber ~= "" and ACPF_partnumber ~= nil</Expression></Transition>
<Transition StartId="273" EndId="274" type="0">
</Transition>
<Transition StartId="274" EndId="293" type="0">
</Transition>
<Transition StartId="275" EndId="240" type="1">
<Expression>IVI_partnumber ~= "" and IVI_partnumber ~= nil</Expression></Transition>
<Transition StartId="275" EndId="277" type="0">
</Transition>
<Transition StartId="277" EndId="241" type="1">
<Expression>DVR_partnumber ~= "" and DVR_partnumber ~= nil</Expression></Transition>
<Transition StartId="277" EndId="278" type="0">
</Transition>
<Transition StartId="278" EndId="242" type="1">
<Expression>SCCU_partnumber ~= "" and SCCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="278" EndId="279" type="0">
</Transition>
<Transition StartId="279" EndId="243" type="1">
<Expression>ALS_partnumber ~= "" and ALS_partnumber ~= nil</Expression></Transition>
<Transition StartId="279" EndId="280" type="0">
</Transition>
<Transition StartId="280" EndId="288" type="0">
</Transition>
<Transition StartId="281" EndId="274" type="0">
</Transition>
<Transition StartId="283" EndId="266" type="0">
</Transition>
<Transition StartId="284" EndId="250" type="0">
</Transition>
<Transition StartId="286" EndId="257" type="0">
</Transition>
<Transition StartId="287" EndId="275" type="0">
</Transition>
<Transition StartId="288" EndId="2" type="0">
</Transition>
<Transition StartId="290" EndId="214" type="1">
<Expression>SAS_partnumber ~= "" and SAS_partnumber ~= nil</Expression></Transition>
<Transition StartId="290" EndId="252" type="0">
</Transition>
<Transition StartId="291" EndId="259" type="0">
</Transition>
<Transition StartId="291" EndId="221" type="1">
<Expression>IFC_partnumber ~= "" and IFC_partnumber ~= nil</Expression></Transition>
<Transition StartId="292" EndId="283" type="1">
<Expression>DSCU_partnumber ~= "" and DSCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="292" EndId="266" type="0">
</Transition>
<Transition StartId="293" EndId="287" type="1">
<Expression>ACPR_partnumber ~= "" and ACPR_partnumber ~= nil</Expression></Transition>
<Transition StartId="293" EndId="275" type="0">
</Transition>
<Transition StartId="298" EndId="252" type="0">
</Transition>
<Transition StartId="302" EndId="164" type="1">
<Expression>GW_partnumber ~= ""</Expression></Transition>
<Transition StartId="302" EndId="244" type="0">
</Transition>
<Transition StartId="310" EndId="277" type="0">
</Transition>
<Transition StartId="316" EndId="270" type="0">
</Transition>
<Transition StartId="317" EndId="255" type="0">
</Transition>
<Transition StartId="320" EndId="249" type="0">
</Transition>
<Transition StartId="323" EndId="235" type="0">
</Transition>
</Transitions>
</Process>

