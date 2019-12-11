<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="260" top="24" right="360" bottom="56"/>
<Script></Script><Line2Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="820" top="1244" right="920" bottom="1276"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="214" right="746" bottom="246"/>
</Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="844" top="214" right="876" bottom="246"/>
</Activity>
<Activity id="247" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="214" right="1016" bottom="246"/>
</Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="214" right="1166" bottom="246"/>
</Activity>
<Activity id="249" ActivityType="4" flags="0" name="路由节点">
<Rect left="1264" top="214" right="1296" bottom="246"/>
</Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="214" right="326" bottom="246"/>
</Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="1384" top="214" right="1416" bottom="246"/>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="434" right="1266" bottom="466"/>
</Activity>
<Activity id="253" ActivityType="4" flags="0" name="路由节点">
<Rect left="1094" top="434" right="1126" bottom="466"/>
</Activity>
<Activity id="254" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="434" right="986" bottom="466"/>
</Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="434" right="816" bottom="466"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="434" right="666" bottom="466"/>
</Activity>
<Activity id="257" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="434" right="506" bottom="466"/>
</Activity>
<Activity id="258" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="434" right="316" bottom="466"/>
</Activity>
<Activity id="259" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="434" right="156" bottom="466"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="644" right="316" bottom="676"/>
</Activity>
<Activity id="261" ActivityType="4" flags="0" name="路由节点">
<Rect left="454" top="644" right="486" bottom="676"/>
</Activity>
<Activity id="262" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="644" right="656" bottom="676"/>
</Activity>
<Activity id="263" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="644" right="836" bottom="676"/>
</Activity>
<Activity id="264" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="644" right="996" bottom="676"/>
</Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="644" right="1156" bottom="676"/>
</Activity>
<Activity id="266" ActivityType="4" flags="0" name="路由节点">
<Rect left="1274" top="644" right="1306" bottom="676"/>
</Activity>
<Activity id="267" ActivityType="4" flags="0" name="路由节点">
<Rect left="1434" top="644" right="1466" bottom="676"/>
</Activity>
<Activity id="268" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="874" right="1316" bottom="906"/>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="874" right="1136" bottom="906"/>
</Activity>
<Activity id="270" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="874" right="956" bottom="906"/>
</Activity>
<Activity id="271" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="874" right="776" bottom="906"/>
</Activity>
<Activity id="272" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="874" right="616" bottom="906"/>
</Activity>
<Activity id="273" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="874" right="466" bottom="906"/>
</Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="874" right="316" bottom="906"/>
</Activity>
<Activity id="275" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="874" right="156" bottom="906"/>
</Activity>
<Activity id="276" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="1094" right="326" bottom="1126"/>
</Activity>
<Activity id="278" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="1094" right="506" bottom="1126"/>
</Activity>
<Activity id="279" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1094" right="676" bottom="1126"/>
</Activity>
<Activity id="280" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="1094" right="886" bottom="1126"/>
</Activity>
<Activity id="288" ActivityType="3" flags="0" name="变量设置">
<Rect left="260" top="94" right="360" bottom="126"/>
<Script>DString_C079_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN

print("parCarType:"..DString_C079_Car_Type)
print("parVIN:"..DString_Write_VIN)</Script></Activity>
<Activity id="289" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="260" top="154" right="360" bottom="186"/>
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
<Activity id="290" ActivityType="5" flags="0" name="GW_FIN">
<Rect left="390" top="294" right="490" bottom="326"/>
<SubProcesses>
<SubProcess id="GW_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="GW_partnumber"/>
<Parameter id="DString_VariCoding" value="GW_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="291" ActivityType="5" flags="0" name="EMS_FIN">
<Rect left="680" top="294" right="780" bottom="326"/>
<SubProcesses>
<SubProcess id="EMS_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="EMS_partnumber"/>
<Parameter id="DString_VariCoding" value="EMS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="292" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="214" right="456" bottom="246"/>
</Activity>
<Activity id="293" ActivityType="5" flags="0" name="AT_FIN">
<Rect left="810" top="294" right="910" bottom="326"/>
<SubProcesses>
<SubProcess id="AT_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="AT_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="294" ActivityType="5" flags="0" name="EGSM_FIN">
<Rect left="950" top="294" right="1050" bottom="326"/>
<SubProcesses>
<SubProcess id="EGSM_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="EGSM_partnumber"/>
<Parameter id="DString_VariCoding" value="EGSM_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="295" ActivityType="5" flags="0" name="ACM_FIN">
<Rect left="1100" top="294" right="1200" bottom="326"/>
<SubProcesses>
<SubProcess id="ACM_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ACM_partnumber"/>
<Parameter id="DString_VariCoding" value="ACM_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="296" ActivityType="5" flags="0" name="ACU_FIN">
<Rect left="1230" top="294" right="1330" bottom="326"/>
<SubProcesses>
<SubProcess id="ACU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ACU_partnumber"/>
<Parameter id="DString_VariCoding" value="ACU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="297" ActivityType="5" flags="0" name="ESP_FIN">
<Rect left="260" top="294" right="360" bottom="326"/>
<SubProcesses>
<SubProcess id="ESP_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ESP_partnumber"/>
<Parameter id="DString_VariCoding" value="ESP_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="298" ActivityType="4" flags="0" name="路由节点">
<Rect left="1384" top="434" right="1416" bottom="466"/>
</Activity>
<Activity id="299" ActivityType="5" flags="0" name="SAS_FIN">
<Rect left="1350" top="514" right="1450" bottom="546"/>
<SubProcesses>
<SubProcess id="SAS_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="SAS_partnumber"/>
<Parameter id="DString_VariCoding" value="SAS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="300" ActivityType="5" flags="0" name="EPS_FIN">
<Rect left="1200" top="514" right="1300" bottom="546"/>
<SubProcesses>
<SubProcess id="EPS_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="EPS_partnumber"/>
<Parameter id="DString_VariCoding" value="EPS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="301" ActivityType="5" flags="0" name="TOD_FIN">
<Rect left="1060" top="514" right="1160" bottom="546"/>
<SubProcesses>
<SubProcess id="TOD_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="TOD_partnumber"/>
<Parameter id="DString_VariCoding" value="TOD_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="302" ActivityType="5" flags="0" name="AirS_FIN">
<Rect left="920" top="514" right="1020" bottom="546"/>
<SubProcesses>
<SubProcess id="AirS_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="AirS_partnumber"/>
<Parameter id="DString_VariCoding" value="AirS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="303" ActivityType="5" flags="0" name="DMSCU_FIN">
<Rect left="750" top="514" right="850" bottom="546"/>
<SubProcesses>
<SubProcess id="DMSCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="DMS_partnumber"/>
<Parameter id="DString_VariCoding" value="DMS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="304" ActivityType="5" flags="0" name="PDC_FIN">
<Rect left="600" top="514" right="700" bottom="546"/>
<SubProcesses>
<SubProcess id="PDC_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="PDC_partnumber"/>
<Parameter id="DString_VariCoding" value="PDC_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="305" ActivityType="5" flags="0" name="AVM_FIN">
<Rect left="440" top="514" right="540" bottom="546"/>
<SubProcesses>
<SubProcess id="AVM_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="AVM_partnumber"/>
<Parameter id="DString_VariCoding" value="AVM_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="306" ActivityType="5" flags="1" name="IFC_FIN">
<Rect left="250" top="514" right="350" bottom="546"/>
<SubProcesses>
<SubProcess id="IFC_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="IFC_partnumber"/>
<Parameter id="DString_VariCoding" value="IFC_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="307" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="644" right="156" bottom="676"/>
</Activity>
<Activity id="308" ActivityType="5" flags="0" name="ADV_FIN">
<Rect left="90" top="744" right="190" bottom="776"/>
<SubProcesses>
<SubProcess id="ADV_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ADV_partnumber"/>
<Parameter id="DString_VariCoding" value="ADV_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="309" ActivityType="5" flags="0" name="BSD_FIN">
<Rect left="250" top="744" right="350" bottom="776"/>
<SubProcesses>
<SubProcess id="BSD_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="BSD_partnumber"/>
<Parameter id="DString_VariCoding" value="BSD_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="310" ActivityType="5" flags="0" name="DDCU_FIN">
<Rect left="420" top="744" right="520" bottom="776"/>
<SubProcesses>
<SubProcess id="DDCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="DDCU_partnumber"/>
<Parameter id="DString_VariCoding" value="DDCU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="311" ActivityType="5" flags="0" name="PDCU_FIN">
<Rect left="590" top="744" right="690" bottom="776"/>
<SubProcesses>
<SubProcess id="PDCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="PDCU_partnumber"/>
<Parameter id="DString_VariCoding" value="PDCU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="312" ActivityType="5" flags="0" name="RLDCU_FIN">
<Rect left="770" top="744" right="870" bottom="776"/>
<SubProcesses>
<SubProcess id="RLDCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="RLDCU_partnumber"/>
<Parameter id="DString_VariCoding" value="RLDCU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="313" ActivityType="5" flags="0" name="RRDCU_FIN">
<Rect left="930" top="744" right="1030" bottom="776"/>
<SubProcesses>
<SubProcess id="RRDCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="RRDCU_partnumber"/>
<Parameter id="DString_VariCoding" value="RRDCU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="314" ActivityType="5" flags="0" name="DSCU_FIN">
<Rect left="1090" top="744" right="1190" bottom="776"/>
<SubProcesses>
<SubProcess id="DSCU_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="DSCU_partnumber"/>
<Parameter id="DString_VariCoding" value="DSCU_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="315" ActivityType="5" flags="0" name="SCM_FIN">
<Rect left="1240" top="744" right="1340" bottom="776"/>
<SubProcesses>
<SubProcess id="SCM_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="SCM_partnumber"/>
<Parameter id="DString_VariCoding" value="SCM_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="316" ActivityType="4" flags="0" name="路由节点">
<Rect left="1434" top="874" right="1466" bottom="906"/>
</Activity>
<Activity id="317" ActivityType="5" flags="0" name="T-BOX_FIN">
<Rect left="1400" top="964" right="1500" bottom="996"/>
<SubProcesses>
<SubProcess id="T-BOX_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="TBOX_partnumber"/>
<Parameter id="DString_VariCoding" value="TBOX_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="318" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="1094" right="156" bottom="1126"/>
</Activity>
<Activity id="319" ActivityType="5" flags="0" name="AC_FIN">
<Rect left="1250" top="964" right="1350" bottom="996"/>
<SubProcesses>
<SubProcess id="AC_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="AC_partnumber"/>
<Parameter id="DString_VariCoding" value="AC_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="320" ActivityType="5" flags="0" name="BCM1_FIN">
<Rect left="1070" top="964" right="1170" bottom="996"/>
<SubProcesses>
<SubProcess id="BCM1_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="BCM1_partnumber"/>
<Parameter id="DString_VariCoding" value="BCM1_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="321" ActivityType="5" flags="0" name="BCM2_FIN">
<Rect left="890" top="964" right="990" bottom="996"/>
<SubProcesses>
<SubProcess id="BCM2_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="BCM2_partnumber"/>
<Parameter id="DString_VariCoding" value="BCM2_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="322" ActivityType="5" flags="0" name="PEPS_FIN">
<Rect left="710" top="964" right="810" bottom="996"/>
<SubProcesses>
<SubProcess id="PEPS_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="PEPS_partnumber"/>
<Parameter id="DString_VariCoding" value="PEPS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="323" ActivityType="5" flags="0" name="PLGM_FIN">
<Rect left="550" top="964" right="650" bottom="996"/>
<SubProcesses>
<SubProcess id="PLGM_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="PLGM_partnumber"/>
<Parameter id="DString_VariCoding" value="PLGM_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="324" ActivityType="5" flags="0" name="ACP_F_FIN">
<Rect left="400" top="964" right="500" bottom="996"/>
<SubProcesses>
<SubProcess id="ACP_F_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ACPF_partnumber"/>
<Parameter id="DString_VariCoding" value="ACPF_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="325" ActivityType="5" flags="0" name="ACP_R_FIN">
<Rect left="250" top="964" right="350" bottom="996"/>
<SubProcesses>
<SubProcess id="ACP_R_FIN">
<Parameters>
<Parameter id="DString_Partnumber" value="ACPR_partnumber"/>
<Parameter id="DString_VariCoding" value="ACPR_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="327" ActivityType="5" flags="0" name="IVI_FIN">
<Rect left="90" top="1204" right="190" bottom="1236"/>
<SubProcesses>
<SubProcess id="IVI_FIN">
<Parameters>
<Parameter id="DString_VariCoding" value="IVI_varicoding1"/>
<Parameter id="DString_VariCoding1" value="IVI_varicoding2"/>
<Parameter id="DString_Partnumber" value="IVI_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="328" ActivityType="5" flags="0" name="DVR_FIN">
<Rect left="260" top="1204" right="360" bottom="1236"/>
<SubProcesses>
<SubProcess id="DVR_FIN">
<Parameters>
<Parameter id="DString_VariCoding" value="DVR_varicoding"/>
<Parameter id="DString_Partnumber" value="DVR_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="329" ActivityType="5" flags="0" name="SCCU_FIN">
<Rect left="440" top="1204" right="540" bottom="1236"/>
<SubProcesses>
<SubProcess id="SCCU_FIN">
<Parameters>
<Parameter id="DString_VariCoding" value="SCCU_varicoding"/>
<Parameter id="DString_Partnumber" value="SCCU_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="330" ActivityType="5" flags="0" name="ALS_FIN">
<Rect left="610" top="1204" right="710" bottom="1236"/>
<SubProcesses>
<SubProcess id="ALS_FIN">
<Parameters>
<Parameter id="DString_VariCoding" value="ALS_varicoding"/>
<Parameter id="DString_Partnumber" value="ALS_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="331" ActivityType="5" flags="0" name="HS7_Read_All_ECU_DTC">
<Rect left="820" top="1164" right="920" bottom="1196"/>
<SubProcesses>
<SubProcess id="HS7_Read_All_ECU_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="332" ActivityType="5" flags="0" name="GW_EBS_FIN">
<Rect left="540" top="294" right="640" bottom="326"/>
<SubProcesses>
<SubProcess id="GW_EBS_FIN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="333" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="214" right="606" bottom="246"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="288" type="0">
</Transition>
<Transition StartId="244" EndId="291" type="1">
<Expression>EMS_partnumber ~= "" and EMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="244" EndId="245" type="0">
</Transition>
<Transition StartId="245" EndId="293" type="1">
<Expression>AT_partnumber ~= "" and AT_partnumber ~= nil</Expression></Transition>
<Transition StartId="245" EndId="247" type="0">
</Transition>
<Transition StartId="247" EndId="294" type="1">
<Expression>EGSM_partnumber ~= "" and  EGSM_partnumber ~= nil</Expression></Transition>
<Transition StartId="247" EndId="248" type="0">
</Transition>
<Transition StartId="248" EndId="295" type="1">
<Expression>ACM_partnumber ~= "" and ACM_partnumber ~= nil</Expression></Transition>
<Transition StartId="248" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="296" type="1">
<Expression>ACU_partnumber ~= "" and ACU_partnumber ~= nil</Expression></Transition>
<Transition StartId="249" EndId="251" type="0">
</Transition>
<Transition StartId="250" EndId="297" type="1">
<Expression>ESP_partnumber ~= "" and ESP_partnumber ~= nil</Expression></Transition>
<Transition StartId="250" EndId="292" type="0">
</Transition>
<Transition StartId="251" EndId="298" type="0">
</Transition>
<Transition StartId="252" EndId="300" type="1">
<Expression>EPS_partnumber ~= "" and EPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="301" type="1">
<Expression>TOD_partnumber ~= "" and TOD_partnumber ~= nil</Expression></Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="302" type="1">
<Expression>AirS_partnumber ~= "" and AirS_partnumber ~= nil</Expression></Transition>
<Transition StartId="254" EndId="255" type="0">
</Transition>
<Transition StartId="255" EndId="303" type="1">
<Expression>DMS_partnumber ~= "" and DMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="304" type="1">
<Expression>PDC_partnumber ~= "" and PDC_partnumber ~= nil</Expression></Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="305" type="1">
<Expression>AVM_partnumber ~= "" and AVM_partnumber ~= nil</Expression></Transition>
<Transition StartId="257" EndId="258" type="0">
</Transition>
<Transition StartId="258" EndId="306" type="1">
<Expression>IFC_partnumber ~= "" and IFC_partnumber ~= nil</Expression></Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="307" type="0">
</Transition>
<Transition StartId="260" EndId="309" type="1">
<Expression>BSD_partnumber ~= "" and BSD_partnumber ~= nil</Expression></Transition>
<Transition StartId="260" EndId="261" type="0">
</Transition>
<Transition StartId="261" EndId="310" type="1">
<Expression>DDCU_partnumber ~= "" and DDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="261" EndId="262" type="0">
</Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="262" EndId="311" type="1">
<Expression>PDCU_partnumber ~= "" and PDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="263" EndId="312" type="1">
<Expression>RLDCU_partnumber ~= "" and RLDCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="313" type="1">
<Expression>RRDCU_partnumber ~= "" and RRDCU_partnumber ~= nil </Expression></Transition>
<Transition StartId="264" EndId="265" type="0">
</Transition>
<Transition StartId="265" EndId="314" type="1">
<Expression>DSCU_partnumber ~= "" and DSCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="265" EndId="266" type="0">
</Transition>
<Transition StartId="266" EndId="315" type="1">
<Expression>SCM_partnumber ~= "" and SCM_partnumber ~= nil </Expression></Transition>
<Transition StartId="266" EndId="267" type="0">
</Transition>
<Transition StartId="267" EndId="316" type="0">
</Transition>
<Transition StartId="268" EndId="319" type="1">
<Expression>AC_partnumber ~= "" and AC_partnumber ~= nil</Expression></Transition>
<Transition StartId="268" EndId="269" type="0">
</Transition>
<Transition StartId="269" EndId="320" type="1">
<Expression>BCM1_partnumber ~= "" and BCM1_partnumber ~= nil</Expression></Transition>
<Transition StartId="269" EndId="270" type="0">
</Transition>
<Transition StartId="270" EndId="321" type="1">
<Expression>BCM2_partnumber ~= "" and BCM2_partnumber ~= nil</Expression></Transition>
<Transition StartId="270" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="322" type="1">
<Expression>PEPS_partnumber ~= "" and PEPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="272" EndId="323" type="1">
<Expression>PLGM_partnumber ~= "" and PLGM_partnumber ~= nil</Expression></Transition>
<Transition StartId="272" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="324" type="1">
<Expression>ACPF_partnumber ~= "" and ACPF_partnumber ~= nil</Expression></Transition>
<Transition StartId="273" EndId="274" type="0">
</Transition>
<Transition StartId="274" EndId="325" type="1">
<Expression>ACPR_partnumber ~= "" and ACPR_partnumber ~= nil</Expression></Transition>
<Transition StartId="274" EndId="275" type="0">
</Transition>
<Transition StartId="275" EndId="318" type="0">
</Transition>
<Transition StartId="276" EndId="328" type="1">
<Expression>DVR_partnumber ~= "" and DVR_partnumber ~= nil</Expression></Transition>
<Transition StartId="276" EndId="278" type="0">
</Transition>
<Transition StartId="278" EndId="329" type="1">
<Expression>SCCU_partnumber ~= "" and SCCU_partnumber ~= nil</Expression></Transition>
<Transition StartId="278" EndId="279" type="0">
</Transition>
<Transition StartId="279" EndId="330" type="1">
<Expression>ALS_partnumber ~= "" and ALS_partnumber ~= nil</Expression></Transition>
<Transition StartId="279" EndId="280" type="0">
</Transition>
<Transition StartId="280" EndId="331" type="0">
</Transition>
<Transition StartId="288" EndId="289" type="0">
</Transition>
<Transition StartId="289" EndId="250" type="0">
</Transition>
<Transition StartId="290" EndId="333" type="0">
</Transition>
<Transition StartId="291" EndId="245" type="0">
</Transition>
<Transition StartId="292" EndId="290" type="1">
<Expression>GW_partnumber ~= ""</Expression></Transition>
<Transition StartId="292" EndId="333" type="0">
</Transition>
<Transition StartId="293" EndId="247" type="0">
</Transition>
<Transition StartId="294" EndId="248" type="0">
</Transition>
<Transition StartId="295" EndId="249" type="0">
</Transition>
<Transition StartId="296" EndId="251" type="0">
</Transition>
<Transition StartId="297" EndId="292" type="0">
</Transition>
<Transition StartId="298" EndId="299" type="1">
<Expression>SAS_partnumber ~= "" and SAS_partnumber ~= nil</Expression></Transition>
<Transition StartId="298" EndId="252" type="0">
</Transition>
<Transition StartId="299" EndId="252" type="0">
</Transition>
<Transition StartId="300" EndId="253" type="0">
</Transition>
<Transition StartId="301" EndId="254" type="0">
</Transition>
<Transition StartId="302" EndId="255" type="0">
</Transition>
<Transition StartId="303" EndId="256" type="0">
</Transition>
<Transition StartId="304" EndId="257" type="0">
</Transition>
<Transition StartId="305" EndId="258" type="0">
</Transition>
<Transition StartId="306" EndId="259" type="0">
</Transition>
<Transition StartId="307" EndId="260" type="0">
</Transition>
<Transition StartId="307" EndId="308" type="1">
<Expression>ADV_partnumber ~= "" and ADV_partnumber ~=  nil</Expression></Transition>
<Transition StartId="308" EndId="260" type="0">
</Transition>
<Transition StartId="309" EndId="261" type="0">
</Transition>
<Transition StartId="310" EndId="262" type="0">
</Transition>
<Transition StartId="311" EndId="263" type="0">
</Transition>
<Transition StartId="312" EndId="264" type="0">
</Transition>
<Transition StartId="313" EndId="265" type="0">
</Transition>
<Transition StartId="314" EndId="266" type="0">
</Transition>
<Transition StartId="315" EndId="267" type="0">
</Transition>
<Transition StartId="316" EndId="317" type="1">
<Expression>TBOX_partnumber ~= "" and TBOX_partnumber ~= nil</Expression></Transition>
<Transition StartId="316" EndId="268" type="0">
</Transition>
<Transition StartId="317" EndId="268" type="0">
</Transition>
<Transition StartId="318" EndId="327" type="1">
<Expression>IVI_partnumber ~= "" and IVI_partnumber ~= nil</Expression></Transition>
<Transition StartId="318" EndId="276" type="0">
</Transition>
<Transition StartId="319" EndId="269" type="0">
</Transition>
<Transition StartId="320" EndId="270" type="0">
</Transition>
<Transition StartId="321" EndId="271" type="0">
</Transition>
<Transition StartId="322" EndId="272" type="0">
</Transition>
<Transition StartId="323" EndId="273" type="0">
</Transition>
<Transition StartId="324" EndId="274" type="0">
</Transition>
<Transition StartId="325" EndId="275" type="0">
</Transition>
<Transition StartId="327" EndId="276" type="0">
</Transition>
<Transition StartId="328" EndId="278" type="0">
</Transition>
<Transition StartId="329" EndId="279" type="0">
</Transition>
<Transition StartId="330" EndId="280" type="0">
</Transition>
<Transition StartId="331" EndId="2" type="0">
</Transition>
<Transition StartId="332" EndId="244" type="0">
</Transition>
<Transition StartId="333" EndId="244" type="0">
</Transition>
<Transition StartId="333" EndId="332" type="1">
<Expression>GW_partnumber ~= ""</Expression></Transition>
</Transitions>
</Process>

