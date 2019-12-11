<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="ObdHandle" type="8" dir="1" data="-1"/>
<Variable id="BuslogPath" type="8" dir="0" data="&quot;&quot;"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="320" top="24" right="420" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="319" top="2484" right="419" bottom="2516"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="变量设置">
<Rect left="320" top="84" right="420" bottom="116"/>
<Script>DString_C079_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN

print("一次内饰HS7车型:"..DString_C079_Car_Type)
print("一次内饰HS7-VIN:"..DString_Write_VIN)</Script></Activity>
<Activity id="144" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="320" top="144" right="420" bottom="176"/>
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
<Rect left="319" top="544" right="419" bottom="576"/>
<SubProcesses>
<SubProcess id="GW_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="GW_partnumber"/>
<Parameter id="DString_VariCoding" value="GW_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="208" ActivityType="5" flags="0" name="EMS_Common">
<Rect left="319" top="604" right="419" bottom="636"/>
<SubProcesses>
<SubProcess id="EMS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="EMS_partnumber"/>
<Parameter id="DString_VariCoding" value="EMS_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="209" ActivityType="5" flags="0" name="AT_Common">
<Rect left="319" top="664" right="419" bottom="696"/>
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
<Activity id="211" ActivityType="5" flags="0" name="ACM_Common">
<Rect left="319" top="724" right="419" bottom="756"/>
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
<Rect left="319" top="794" right="419" bottom="826"/>
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
<Rect left="319" top="874" right="419" bottom="906"/>
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
<Rect left="319" top="934" right="419" bottom="966"/>
<SubProcesses>
<SubProcess id="SAS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="SAS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="HS7_SAS_VIN_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="216" ActivityType="5" flags="0" name="TOD_Common">
<Rect left="319" top="1004" right="419" bottom="1036"/>
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
<Activity id="217" ActivityType="5" flags="0" name="AirS_Common">
<Rect left="319" top="1064" right="419" bottom="1096"/>
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
<Rect left="319" top="1134" right="419" bottom="1166"/>
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
<Rect left="319" top="1274" right="419" bottom="1306"/>
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
<Rect left="319" top="1344" right="419" bottom="1376"/>
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
<Rect left="319" top="1414" right="419" bottom="1446"/>
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
<Activity id="229" ActivityType="5" flags="0" name="SCM_Common">
<Rect left="319" top="1484" right="419" bottom="1516"/>
<SubProcesses>
<SubProcess id="SCM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="SCM_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="230" ActivityType="5" flags="0" name="T-BOX_Common">
<Rect left="319" top="1624" right="419" bottom="1656"/>
<SubProcesses>
<SubProcess id="T-BOX_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="TBOX_partnumber"/>
<Parameter id="DString_VariCoding" value="TBOX_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="231" ActivityType="5" flags="0" name="AC_Common">
<Rect left="319" top="1694" right="419" bottom="1726"/>
<SubProcesses>
<SubProcess id="AC_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="AC_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="232" ActivityType="5" flags="0" name="BCM1_Commo">
<Rect left="319" top="1764" right="419" bottom="1796"/>
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
<Activity id="233" ActivityType="5" flags="0" name="BCM2_Common">
<Rect left="319" top="1844" right="419" bottom="1876"/>
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
<Rect left="319" top="2014" right="419" bottom="2046"/>
<SubProcesses>
<SubProcess id="PEPS_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PEPS_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="235" ActivityType="5" flags="0" name="PLGM_Common">
<Rect left="319" top="2084" right="419" bottom="2116"/>
<SubProcesses>
<SubProcess id="PLGM_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PLGM_partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="240" ActivityType="5" flags="0" name="IVI_Common">
<Rect left="319" top="2154" right="419" bottom="2186"/>
<SubProcesses>
<SubProcess id="IVI_Common">
<Parameters>
<Parameter id="DString_VariCoding" value="IVI_varicoding1"/>
<Parameter id="DString_VariCoding1" value="IVI_varicoding2"/>
<Parameter id="DString_Partnumber" value="IVI_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="DVR_Common">
<Rect left="319" top="2224" right="419" bottom="2256"/>
<SubProcesses>
<SubProcess id="DVR_Common">
<Parameters>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Partnumber" value="DVR_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="243" ActivityType="5" flags="0" name="ALS_Common">
<Rect left="319" top="2284" right="419" bottom="2316"/>
<SubProcesses>
<SubProcess id="ALS_Common">
<Parameters>
<Parameter id="DString_VariCoding" value="ALS_varicoding"/>
<Parameter id="DString_Partnumber" value="ALS_partnumber"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="544" right="495" bottom="576"/>
</Activity>
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="604" right="495" bottom="636"/>
</Activity>
<Activity id="247" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="664" right="495" bottom="696"/>
</Activity>
<Activity id="249" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="724" right="495" bottom="756"/>
</Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="794" right="495" bottom="826"/>
</Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="874" right="495" bottom="906"/>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="934" right="495" bottom="966"/>
</Activity>
<Activity id="254" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1004" right="495" bottom="1036"/>
</Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1064" right="495" bottom="1096"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1134" right="495" bottom="1166"/>
</Activity>
<Activity id="257" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1204" right="495" bottom="1236"/>
</Activity>
<Activity id="258" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1274" right="495" bottom="1306"/>
</Activity>
<Activity id="259" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1344" right="495" bottom="1376"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1414" right="495" bottom="1446"/>
</Activity>
<Activity id="267" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1484" right="495" bottom="1516"/>
</Activity>
<Activity id="268" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1624" right="495" bottom="1656"/>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1694" right="495" bottom="1726"/>
</Activity>
<Activity id="270" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1764" right="495" bottom="1796"/>
</Activity>
<Activity id="271" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1844" right="495" bottom="1876"/>
</Activity>
<Activity id="272" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="2014" right="495" bottom="2046"/>
</Activity>
<Activity id="273" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="2084" right="495" bottom="2116"/>
</Activity>
<Activity id="277" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="2154" right="495" bottom="2186"/>
</Activity>
<Activity id="278" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="2224" right="495" bottom="2256"/>
</Activity>
<Activity id="280" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="2284" right="495" bottom="2316"/>
</Activity>
<Activity id="284" ActivityType="3" flags="0" name="变量打印">
<Rect left="320" top="194" right="420" bottom="226"/>
<Script></Script></Activity>
<Activity id="286" ActivityType="5" flags="0" name="PDC_Common">
<Rect left="319" top="1204" right="419" bottom="1236"/>
<SubProcesses>
<SubProcess id="PDC_Common">
<Parameters>
<Parameter id="DString_Partnumber" value="PDC_partnumber"/>
<Parameter id="DString_VariCoding" value="PDC_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="289" ActivityType="5" flags="0" name="HS7_Read_TR1_ECU_DTC">
<Rect left="319" top="2354" right="419" bottom="2386"/>
<SubProcesses>
<SubProcess id="HS7_Read_TR1_ECU_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="290" ActivityType="5" flags="0" name="匹配第一把钥匙">
<Rect left="320" top="314" right="420" bottom="346"/>
<SubProcesses>
<SubProcess id="HS7_Immobilizer_Key1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="291" ActivityType="5" flags="0" name="匹配第二把钥匙">
<Rect left="320" top="364" right="420" bottom="396"/>
<SubProcesses>
<SubProcess id="HS7_Immobilizer_Key2">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="rematch_firkey" value="rematch_firkey"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="292" ActivityType="5" flags="0" name="PEPS_Force_Power_ON">
<Rect left="320" top="414" right="420" bottom="446"/>
<SubProcesses>
<SubProcess id="PEPS_Force_Power_ON">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="293" ActivityType="5" flags="0" name="PEPS_Force_Power_OFF">
<Rect left="319" top="2414" right="419" bottom="2446"/>
<SubProcesses>
<SubProcess id="PEPS_Force_Power_OFF">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="294" ActivityType="5" flags="0" name="子流程节点">
<Rect left="60" top="1004" right="160" bottom="1036"/>
<SubProcesses>
</SubProcesses>
</Activity>
<Activity id="295" ActivityType="3" flags="0" name="进行钥匙匹配">
<Rect left="320" top="254" right="420" bottom="286"/>
<Line1Text Enable="1" Text="是否进行钥匙匹配？"/>
<ButtonLText Enable="1" Text="放弃匹配"/>
<ButtonRText Enable="1" Text="确认匹配"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="296" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="254" right="536" bottom="286"/>
</Activity>
<Activity id="297" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="414" right="536" bottom="446"/>
</Activity>
<Activity id="298" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="321" top="482" right="421" bottom="514"/>
<Line2Text Enable="1" Text="正在打开应用中，请稍等"/>
<FunctionRef id="Buslog_Open" model="LibGeneral">
<Parameters>
<Parameter id="iProtocolType" value="4"/>
<Parameter id="iBaudrate" value="500000"/>
<Parameter id="iCanSId" value="0"/>
<Parameter id="iCanRId" value="0"/>
<Parameter id="saveFileName" value="BuslogPath"/>
<Parameter id="isFilled" value="false"/>
<Parameter id="FilterID" value="0"/>
<Parameter id="iPort" value="1"/>
<Parameter id="iObdHandle" value="0" ret="ObdHandle"/>
<Parameter id="result" value="0"/>
</Parameters>
</FunctionRef>
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
<Transition StartId="211" EndId="249" type="0">
</Transition>
<Transition StartId="212" EndId="250" type="0">
</Transition>
<Transition StartId="213" EndId="251" type="0">
</Transition>
<Transition StartId="214" EndId="252" type="0">
</Transition>
<Transition StartId="216" EndId="254" type="0">
</Transition>
<Transition StartId="217" EndId="255" type="0">
</Transition>
<Transition StartId="218" EndId="256" type="0">
</Transition>
<Transition StartId="220" EndId="258" type="0">
</Transition>
<Transition StartId="221" EndId="259" type="0">
</Transition>
<Transition StartId="222" EndId="260" type="0">
</Transition>
<Transition StartId="229" EndId="267" type="0">
</Transition>
<Transition StartId="230" EndId="268" type="0">
</Transition>
<Transition StartId="231" EndId="269" type="0">
</Transition>
<Transition StartId="232" EndId="270" type="0">
</Transition>
<Transition StartId="233" EndId="271" type="0">
</Transition>
<Transition StartId="234" EndId="272" type="0">
</Transition>
<Transition StartId="235" EndId="273" type="0">
</Transition>
<Transition StartId="240" EndId="277" type="0">
</Transition>
<Transition StartId="241" EndId="278" type="0">
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
<Transition StartId="247" EndId="211" type="1">
<Expression>ACM_partnumber ~= "" and ACM_partnumber ~= nil</Expression></Transition>
<Transition StartId="247" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="212" type="1">
<Expression>ACU_partnumber ~= "" and ACU_partnumber ~= nil</Expression></Transition>
<Transition StartId="249" EndId="250" type="0">
</Transition>
<Transition StartId="250" EndId="213" type="1">
<Expression>ESP_partnumber ~= "" and ESP_partnumber ~= nil</Expression></Transition>
<Transition StartId="250" EndId="251" type="0">
</Transition>
<Transition StartId="251" EndId="214" type="1">
<Expression>SAS_partnumber ~= "" and SAS_partnumber ~= nil</Expression></Transition>
<Transition StartId="251" EndId="252" type="0">
</Transition>
<Transition StartId="252" EndId="216" type="1">
<Expression>TOD_partnumber ~= "" and TOD_partnumber ~= nil</Expression></Transition>
<Transition StartId="252" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="217" type="1">
<Expression>AirS_partnumber ~= "" and AirS_partnumber ~= nil</Expression></Transition>
<Transition StartId="254" EndId="255" type="0">
</Transition>
<Transition StartId="255" EndId="218" type="1">
<Expression>DMS_partnumber ~= "" and DMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="220" type="1">
<Expression>AVM_partnumber ~= "" and AVM_partnumber ~= nil</Expression></Transition>
<Transition StartId="257" EndId="258" type="0">
</Transition>
<Transition StartId="258" EndId="221" type="1">
<Expression>IFC_partnumber ~= "" and IFC_partnumber ~= nil</Expression></Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="222" type="1">
<Expression>ADV_partnumber ~= "" and ADV_partnumber ~=  nil</Expression></Transition>
<Transition StartId="259" EndId="260" type="0">
</Transition>
<Transition StartId="260" EndId="267" type="0">
</Transition>
<Transition StartId="260" EndId="229" type="1">
<Expression>SCM_partnumber ~= "" and SCM_partnumber ~= nil </Expression></Transition>
<Transition StartId="267" EndId="230" type="1">
<Expression>TBOX_partnumber ~= "" and TBOX_partnumber ~= nil</Expression></Transition>
<Transition StartId="267" EndId="268" type="0">
</Transition>
<Transition StartId="268" EndId="231" type="1">
<Expression>AC_partnumber ~= "" and AC_partnumber ~= nil</Expression></Transition>
<Transition StartId="268" EndId="269" type="0">
</Transition>
<Transition StartId="269" EndId="232" type="1">
<Expression>BCM1_partnumber ~= "" and BCM1_partnumber ~= nil</Expression></Transition>
<Transition StartId="269" EndId="270" type="0">
</Transition>
<Transition StartId="270" EndId="233" type="1">
<Expression>BCM2_partnumber ~= "" and BCM2_partnumber ~= nil</Expression></Transition>
<Transition StartId="270" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="234" type="1">
<Expression>PEPS_partnumber ~= "" and PEPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="272" EndId="235" type="1">
<Expression>PLGM_partnumber ~= "" and PLGM_partnumber ~= nil</Expression></Transition>
<Transition StartId="272" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="277" type="0">
</Transition>
<Transition StartId="273" EndId="240" type="1">
<Expression>IVI_partnumber ~= "" and IVI_partnumber ~= nil</Expression></Transition>
<Transition StartId="277" EndId="241" type="1">
<Expression>DVR_partnumber ~= "" and DVR_partnumber ~= nil</Expression></Transition>
<Transition StartId="277" EndId="278" type="0">
</Transition>
<Transition StartId="278" EndId="243" type="1">
<Expression>ALS_partnumber ~= "" and ALS_partnumber ~= nil</Expression></Transition>
<Transition StartId="278" EndId="280" type="0">
</Transition>
<Transition StartId="280" EndId="289" type="0">
</Transition>
<Transition StartId="284" EndId="295" type="0">
</Transition>
<Transition StartId="286" EndId="257" type="0">
</Transition>
<Transition StartId="289" EndId="293" type="0">
</Transition>
<Transition StartId="290" EndId="291" type="0">
</Transition>
<Transition StartId="291" EndId="292" type="0">
</Transition>
<Transition StartId="292" EndId="298" type="0">
</Transition>
<Transition StartId="293" EndId="2" type="0">
</Transition>
<Transition StartId="294" EndId="286" type="1">
<Expression>PDC_partnumber ~= "" and PDC_partnumber ~= nil</Expression></Transition>
<Transition StartId="295" EndId="296" type="5">
</Transition>
<Transition StartId="295" EndId="290" type="0">
</Transition>
<Transition StartId="296" EndId="297" type="0">
</Transition>
<Transition StartId="297" EndId="292" type="0">
</Transition>
<Transition StartId="298" EndId="164" type="1">
<Expression>GW_partnumber ~= ""</Expression></Transition>
<Transition StartId="298" EndId="244" type="0">
</Transition>
</Transitions>
</Process>

