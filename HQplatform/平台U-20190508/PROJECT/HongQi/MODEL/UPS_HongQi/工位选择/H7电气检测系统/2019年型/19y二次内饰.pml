<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="VMTLOC" type="8" dir="0" data="&quot;&quot;"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="200" top="124" right="300" bottom="156"/>
<Script>DString_C131_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN
VMTLOC = "TR2"
print("gcj:"..DString_C131_Car_Type)
print("gcjVIN:"..DString_Write_VIN)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="2584" right="420" bottom="2616"/>
<Script></Script></End>
<Activities>
<Activity id="196" ActivityType="3" flags="0" name="Title">
<Rect left="440" top="384" right="540" bottom="416"/>
<TitleText Enable="1" Text="一汽红旗 - 二次内饰"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="197" ActivityType="5" flags="0" name="读配置文件">
<Rect left="200" top="174" right="300" bottom="206"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="Model_Variant"/>
<Parameter id="Engine_Type"/>
<Parameter id="Engine_Displacement" ret="DString_C131_Engine_Displacement"/>
<Parameter id="Design_serialNumber"/>
<Parameter id="Engine_Cylinder"/>
<Parameter id="Transmission_Type"/>
<Parameter id="COC_Speaker"/>
<Parameter id="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker"/>
<Parameter id="EMS00_partnumber" ret="DString_C131_Partnumber_EMS"/>
<Parameter id="EMS00_varicoding" ret="DString_C131_VariCoding_EMS"/>
<Parameter id="EMS00_configinfo" ret="DString_C131_Configinfo_EMS"/>
<Parameter id="AT000_partnumber" ret="DString_C131_Partnumber_AT"/>
<Parameter id="AT000_varicoding" ret="DString_C131_VariCoding_AT"/>
<Parameter id="DCT00_partnumber" ret="DString_C131_Partnumber_DCT"/>
<Parameter id="DCT00_varicoding" ret="DString_C131_VariCoding_DCT"/>
<Parameter id="EPB00_partnumber" ret="DString_C131_Partnumber_EPB"/>
<Parameter id="SAS00_partnumber" ret="DString_C131_Partnumber_SAS"/>
<Parameter id="SAS00_varicoding" ret="DString_C131_VariCoding_SAS"/>
<Parameter id="EPB00_varicoding" ret="DString_C131_VariCoding_EPB"/>
<Parameter id="EHPS0_partnumber" ret="DString_C131_Partnumber_EHPS"/>
<Parameter id="EHPS0_varicoding" ret="DString_C131_VariCoding_EHPS"/>
<Parameter id="ESP00_partnumber" ret="DString_C131_Partnumber_ESP"/>
<Parameter id="ESP00_varicoding" ret="DString_C131_VariCoding_ESP"/>
<Parameter id="AFS00_partnumber" ret="DString_C131_Partnumber_AFS"/>
<Parameter id="AFS00_varicoding" ret="DString_C131_VariCoding_AFS"/>
<Parameter id="AC000_partnumber" ret="DString_C131_Partnumber_AC"/>
<Parameter id="AC000_varicoding" ret="DString_C131_VariCoding_AC"/>
<Parameter id="AB000_partnumber" ret="DString_C131_Partnumber_SDM"/>
<Parameter id="AB000_varicoding" ret="DString_C131_VariCoding_SDM"/>
<Parameter id="LDW00_partnumber" ret="DString_C131_Partnumber_LDW"/>
<Parameter id="LDW00_varicoding" ret="DString_C131_VariCoding_LDW"/>
<Parameter id="ACC00_partnumber" ret="DString_C131_Partnumber_ACC"/>
<Parameter id="ACC00_varicoding" ret="DString_C131_VariCoding_ACC"/>
<Parameter id="BCM10_partnumber" ret="DString_C131_Partnumber_BCM1"/>
<Parameter id="IC000_partnumber" ret="DString_C131_Partnumber_IC"/>
<Parameter id="IC000_varicoding" ret="DString_C131_VariCoding_IC"/>
<Parameter id="BCM20_partnumber" ret="DString_C131_Partnumber_BCM2"/>
<Parameter id="BCM20_varicoding" ret="DString_C131_VariCoding_BCM2"/>
<Parameter id="RMArm_partnumber" ret="DString_C131_Partnumber_ARMREST"/>
<Parameter id="RMArm_varicoding" ret="DString_C131_VariCoding_ARMREST"/>
<Parameter id="RMArm_dif_config" ret="DString_C131_dif_config_ARMREST"/>
<Parameter id="PEPS0_partnumber" ret="DString_C131_Partnumber_PEPS"/>
<Parameter id="PEPS0_varicoding" ret="DString_C131_VariCoding_PEPS"/>
<Parameter id="PEPS0_handleswic" ret="DString_C131_handleswic_PEPS"/>
<Parameter id="PDC00_partnumber" ret="DString_C131_Partnumber_PDC"/>
<Parameter id="PDC00_varicoding" ret="DString_C131_VariCoding_PDC"/>
<Parameter id="GW000_partnumber" ret="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="GW000_horlconfig" ret="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="GW000_varicoding" ret="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DDCU0_partnumber" ret="DString_C131_Partnumber_DDCU"/>
<Parameter id="DDCU0_varicoding" ret="DString_C131_VariCoding_DDCU"/>
<Parameter id="PDCU0_partnumber" ret="DString_C131_Partnumber_PDCU"/>
<Parameter id="PDCU0_varicoding" ret="DString_C131_VariCoding_PDCU"/>
<Parameter id="RLDCU_partnumber" ret="DString_C131_Partnumber_RLDCU"/>
<Parameter id="RLDCU_varicoding" ret="DString_C131_VariCoding_RLDCU"/>
<Parameter id="RRDCU_partnumber" ret="DString_C131_Partnumber_RRDCU"/>
<Parameter id="RRDCU_varicoding" ret="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DSCU0_partnumber" ret="DString_C131_Partnumber_DSCU"/>
<Parameter id="DSCU0_varicoding" ret="DString_C131_VariCoding_DSCU"/>
<Parameter id="AC000_partnumber" ret="DString_C131_Partnumber_AC"/>
<Parameter id="BCM10_varicoding" ret="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_Write_VIN" value="engine.VIN"/>
<Parameter id="PLGM0_partnumber" ret="DString_C131_Partnumber_PLGM"/>
<Parameter id="PLGM0_varicoding" ret="DString_C131_VariCoding_PLGM"/>
<Parameter id="SCM00_partnumber" ret="DString_C131_Partnumber_SCM"/>
<Parameter id="SCM00_varicoding" ret="DString_C131_VariCoding_SCM"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="AC000_auto_swing" ret="DString_C131_Auto_Swing_AC"/>
<Parameter id="MCU00_partnumber" ret="DString_C131_Partnumber_MCU"/>
<Parameter id="MCU00_varicoding" ret="DString_C131_VariCoding_MCU"/>
<Parameter id="CHG00_partnumber" ret="DString_C131_Partnumber_Charger"/>
<Parameter id="CHG00_varicoding" ret="DString_C131_VariCoding_Charger"/>
<Parameter id="OLP00_partnumber" ret="DString_C131_Partnumber_Oilpump"/>
<Parameter id="OLP00_varicoding" ret="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DCDC0_partnumber" ret="DString_C131_Partnumber_DCDC"/>
<Parameter id="DCDC0_varicoding" ret="DString_C131_VariCoding_DCDC"/>
<Parameter id="HCU00_partnumber" ret="DString_C131_Partnumber_HCU"/>
<Parameter id="HCU00_varicoding" ret="DString_C131_VariCoding_HCU"/>
<Parameter id="BSD00_partnumber" ret="DString_C131_Partnumber_BSD"/>
<Parameter id="BSD00_varicoding" ret="DString_C131_VariCoding_BSD"/>
<Parameter id="FWD00_partnumber" ret="DString_C131_Partnumber_FWD"/>
<Parameter id="FWD00_varicoding" ret="DString_C131_VariCoding_FWD"/>
<Parameter id="BMS00_partnumber" ret="DString_C131_Partnumber_BMS"/>
<Parameter id="BMS00_varicoding" ret="DString_C131_VariCoding_BMS"/>
<Parameter id="Model_Name" ret="DString_C131_Model_Name"/>
<Parameter id="GW000_battconfig" ret="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="GW000_dvdconfig" ret="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="TBOX0_partnumber" ret="DString_C131_Partnumber_TBOX"/>
<Parameter id="TBOX0_varicoding" ret="DString_C131_VariCoding_TBOX"/>
<Parameter id="DVD00_partnumber" ret="DString_C131_Partnumber_DVD"/>
<Parameter id="DVD00_varicoding" ret="DString_C131_VariCoding_DVD"/>
<Parameter id="PLGM1_partnumber" ret="DString_C131_Partnumber_PLGM1"/>
<Parameter id="PLGM1_varicoding" ret="DString_C131_VariCoding_PLGM1"/>
<Parameter id="GW000_0101config" ret="DString_C131_VariCoding_GW0101"/>
<Parameter id="GW000_0116config" ret="DString_C131_VariCoding_GW0116"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="普通节点">
<Rect left="200" top="224" right="300" bottom="256"/>
<Script>print("#DString_C131_VariCoding_EMS:"..DString_C131_VariCoding_EMS)
print("#DString_C131_Partnumber_EMS:"..DString_C131_Partnumber_EMS)
print("#DString_C131_Engine_Displacement:"..DString_C131_Engine_Displacement)
print("#DString_C131_Car_Tpye:"..DString_C131_Car_Type)
print("#DString_C131_Configinfo_EMS:"..DString_C131_Configinfo_EMS)

</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="请下电">
<Rect left="440" top="224" right="540" bottom="256"/>
<Line1Text Enable="1" Text="请确保下电"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="等待30秒">
<Rect left="440" top="274" right="540" bottom="306"/>
<Line1Text Enable="1" Text="30秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(3,"VIN:"..DString_Write_VIN);
for t=30,1,-1 do
engine.SetLineText(1,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="请上电">
<Rect left="440" top="324" right="540" bottom="356"/>
<Line1Text Enable="1" Text="请上电，开始检测"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="202" ActivityType="5" flags="0" name="immo_escl">
<Rect left="440" top="444" right="540" bottom="476"/>
<SubProcesses>
<SubProcess id="IMMO_ESCL">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="203" ActivityType="5" flags="0" name="immo_ems">
<Rect left="440" top="494" right="540" bottom="526"/>
<SubProcesses>
<SubProcess id="IMMO_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="204" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="444" right="386" bottom="476"/>
</Activity>
<Activity id="205" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="494" right="386" bottom="526"/>
</Activity>
<Activity id="210" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="724" right="386" bottom="756"/>
</Activity>
<Activity id="211" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="784" right="386" bottom="816"/>
</Activity>
<Activity id="213" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="844" right="386" bottom="876"/>
</Activity>
<Activity id="215" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="904" right="386" bottom="936"/>
</Activity>
<Activity id="217" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1034" right="386" bottom="1066"/>
</Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1094" right="386" bottom="1126"/>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1154" right="386" bottom="1186"/>
</Activity>
<Activity id="224" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1214" right="386" bottom="1246"/>
</Activity>
<Activity id="226" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1284" right="386" bottom="1316"/>
</Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1354" right="386" bottom="1386"/>
</Activity>
<Activity id="230" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1424" right="386" bottom="1456"/>
</Activity>
<Activity id="232" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1494" right="386" bottom="1526"/>
</Activity>
<Activity id="234" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1564" right="386" bottom="1596"/>
</Activity>
<Activity id="235" ActivityType="5" flags="0" name="BCM1">
<Rect left="440" top="2104" right="540" bottom="2136"/>
<SubProcesses>
<SubProcess id="C131_BCM1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="C131_BCM1_Lamp_Combination_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Wiper_Washer_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Truck_Release_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_Tand_Lid_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_All_Inner_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Hazard_Function_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Interior_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Reading_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Engine_Lid_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_Beam_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_Front_Fog_Lamp_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_Wipers_Check_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_HN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_EID_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_BCM1_Charger_Lid_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="236" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1634" right="386" bottom="1666"/>
</Activity>
<Activity id="237" ActivityType="5" flags="0" name="C131_BCM2">
<Rect left="440" top="2044" right="540" bottom="2076"/>
<SubProcesses>
<SubProcess id="C131_BCM2">
<Parameters>
<Parameter id="C131_BCM2_Brake_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Rear_Fog_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Reverse_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_License_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HM_Brake_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Turn_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Truck_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Rear_Fog_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Roof_Control_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Curtain_Check_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="C131_BCM2_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_EID_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_BCM2_Position_Lamps_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1704" right="386" bottom="1736"/>
</Activity>
<Activity id="239" ActivityType="5" flags="0" name="C131_GATEWAY_19">
<Rect left="440" top="1844" right="540" bottom="1876"/>
<SubProcesses>
<SubProcess id="C131_GATEWAY_19">
<Parameters>
<Parameter id="C131_GATEWAY_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_EID_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_VariCoding0101" value="DString_C131_VariCoding_GW0101"/>
<Parameter id="DString_C131_VariCoding0116" value="DString_C131_VariCoding_GW0116"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Type" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_GATEWAY_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_RCOD_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1774" right="386" bottom="1806"/>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="peps">
<Rect left="440" top="2444" right="540" bottom="2476"/>
<SubProcesses>
<SubProcess id="C131_PEPS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="C131_PEPS_Smart_Lock_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_Smart_Start_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_PEPS_Smart_Unlock_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_CID_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_WD_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="242" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1844" right="386" bottom="1876"/>
</Activity>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1914" right="386" bottom="1946"/>
</Activity>
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1984" right="386" bottom="2016"/>
</Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2044" right="386" bottom="2076"/>
</Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2104" right="386" bottom="2136"/>
</Activity>
<Activity id="251" ActivityType="5" flags="0" name="C131_BSD">
<Rect left="440" top="2374" right="540" bottom="2406"/>
<SubProcesses>
<SubProcess id="C131_BSD">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_MCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_MCU_PowerOff_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_ReO_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_IGBT_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_MG_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2164" right="386" bottom="2196"/>
</Activity>
<Activity id="253" ActivityType="5" flags="0" name="C131_4WD">
<Rect left="440" top="2304" right="540" bottom="2336"/>
<SubProcesses>
<SubProcess id="C131_4WD">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_4WD_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_SN_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_EID_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_4WD_PowerOff_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_ReO_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_IGBT_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_MG_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="254" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2234" right="386" bottom="2266"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2304" right="386" bottom="2336"/>
</Activity>
<Activity id="258" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2374" right="386" bottom="2406"/>
</Activity>
<Activity id="259" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="320" top="2504" right="420" bottom="2536"/>
<SubProcesses>
<SubProcess id="C131_DTC_Read_All">
<Parameters>
<Parameter id="EMS00_partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="AT000_partnumber" value="DString_C131_Partnumber_AT"/>
<Parameter id="DCT00_partnumber" value="DString_C131_Partnumber_DCT"/>
<Parameter id="AC000_partnumber" value="DString_C131_Partnumber_AC"/>
<Parameter id="EPB00_partnumber" value="DString_C131_Partnumber_EPB"/>
<Parameter id="SAS00_partnumber" value="DString_C131_Partnumber_SAS"/>
<Parameter id="EHPS0_partnumber" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="ESP00_partnumber" value="DString_C131_Partnumber_ESP"/>
<Parameter id="AFS00_partnumber" value="DString_C131_Partnumber_AFS"/>
<Parameter id="AB000_partnumber" value="DString_C131_Partnumber_AB"/>
<Parameter id="LDW00_partnumber" value="DString_C131_Partnumber_LDW"/>
<Parameter id="ACC00_partnumber" value="DString_C131_Partnumber_ACC"/>
<Parameter id="BCM10_partnumber" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="IC000_partnumber" value="DString_C131_Partnumber_IC"/>
<Parameter id="BCM20_partnumber" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="RMArm_partnumber" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="PEPS0_partnumber" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="PDC00_partnumber" value="DString_C131_Partnumber_PDC"/>
<Parameter id="GW000_partnumber" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DDCU0_partnumber" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="PDCU0_partnumber" value="DString_C131_Partnumber_PDC"/>
<Parameter id="RLDCU_partnumber" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="RRDCU_partnumber" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DSCU0_partnumber" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="PLGM0_partnumber" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="SCM00_partnumber" value="DString_C131_Partnumber_SCM"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Model_Name" value="DString_C131_Model_Name"/>
<Parameter id="HCU00_partnumber" value="DString_C131_Partnumber_HCU"/>
<Parameter id="MCU00_partnumber" value="DString_C131_Partnumber_MCU"/>
<Parameter id="BSD00_partnumber" value="DString_C131_Partnumber_BSD"/>
<Parameter id="FWD00_partnumber" value="DString_C131_Partnumber_FWD"/>
<Parameter id="BMS00_partnumber" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DCDC0_partnumber" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="Oilpump_partnumber" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="Charger_partnumber" value="DString_C131_Partnumber_Charger"/>
<Parameter id="TBOX0_partnumber" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DVD00_partnumber" value="DVD00_partnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="2444" right="386" bottom="2476"/>
</Activity>
<Activity id="261" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="664" right="386" bottom="696"/>
</Activity>
<Activity id="262" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="964" right="386" bottom="996"/>
</Activity>
<Activity id="264" ActivityType="5" flags="0" name="c131_ACC">
<Rect left="440" top="664" right="540" bottom="696"/>
<SubProcesses>
<SubProcess id="C131_ACC">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_ACC"/>
<Parameter id="C131_ACC_Motor_Speed_Ctrl_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_EID_Execute_Flag" value="true"/>
<Parameter id="C131_ACC_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="265" ActivityType="5" flags="0" name="AC">
<Rect left="440" top="724" right="540" bottom="756"/>
<SubProcesses>
<SubProcess id="C131_AC">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_AC"/>
<Parameter id="C131_AC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_AC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_AC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AC_Funtion_Line_Execute_Flag" value="false"/>
<Parameter id="C131_AC_HVP_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_AC_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_AC_EID_Execute_Flag" value="true"/>
<Parameter id="C131_AC_WD_Execute_Flag" value="true"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="266" ActivityType="5" flags="0" name="C131_EMS6_20">
<Rect left="440" top="784" right="540" bottom="816"/>
<SubProcesses>
<SubProcess id="C131_EMS6_20">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="267" ActivityType="5" flags="0" name="C131_AFS">
<Rect left="440" top="844" right="540" bottom="876"/>
<SubProcesses>
<SubProcess id="C131_AFS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_AFS"/>
<Parameter id="C131_AFS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_WD_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_VIN_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="268" ActivityType="5" flags="0" name="C131_LDW">
<Rect left="440" top="904" right="540" bottom="936"/>
<SubProcesses>
<SubProcess id="C131_LDW">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_LDW_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_HN_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_SN_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_EID_Execute_Flag" value="true"/>
<Parameter id="C131_LDW_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="269" ActivityType="5" flags="0" name="c131_sas">
<Rect left="440" top="964" right="540" bottom="996"/>
<SubProcesses>
<SubProcess id="C131_SAS">
<Parameters>
<Parameter id="C131_SAS_Funciton_Check_Execute_Flag" value="false"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_SAS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="270" ActivityType="5" flags="0" name="C131_cluster">
<Rect left="440" top="1034" right="540" bottom="1066"/>
<SubProcesses>
<SubProcess id="C131_CLUSTER">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_IC"/>
<Parameter id="C131_Cluster_Telltale_Check_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_Buzzer_Check_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_Pointer_Check_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_Backlight_Check_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_HN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_SN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_EID_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="271" ActivityType="5" flags="1" name="C131_DCT">
<Rect left="440" top="1094" right="540" bottom="1126"/>
<SubProcesses>
<SubProcess id="C131_DCT">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCT_Shift_Lock_Relay_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_Shift_LV_Signal_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DCT_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_DCT_SPEC_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_Oimpump_Speed_IO_Execute_Flag" value="true"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="272" ActivityType="5" flags="0" name="C131_EHPS">
<Rect left="440" top="1154" right="540" bottom="1186"/>
<SubProcesses>
<SubProcess id="C131_EHPS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="C131_EHPS_Motor_Speed_Ctrl_Execute_Flag" value="false"/>
<Parameter id="C131_EHPS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="273" ActivityType="5" flags="0" name="C131_ESP">
<Rect left="440" top="1214" right="540" bottom="1246"/>
<SubProcesses>
<SubProcess id="C131_ESP">
<Parameters>
<Parameter id="C131_ESP_Brake_Light_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_ESP_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_EID_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="274" ActivityType="5" flags="0" name="C131_PDC">
<Rect left="440" top="1284" right="540" bottom="1316"/>
<SubProcesses>
<SubProcess id="C131_PDC">
<Parameters>
<Parameter id="C131_PDC_System_Self_Checking_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_Function_Activation_Check_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Sensor_Data_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Switch_Data_Execute_Flag" value="true"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PDC"/>
<Parameter id="C131_PDC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="275" ActivityType="5" flags="0" name="C131_AT">
<Rect left="440" top="1354" right="540" bottom="1386"/>
<SubProcesses>
<SubProcess id="C131_AT">
<Parameters>
<Parameter id="C131_AT_Shift_L_Position_Execute_Flag" value="true"/>
<Parameter id="C131_AT_Tip_Mode_Switch_Execute_Flag" value="true"/>
<Parameter id="C131_AT_Vehicle_Speed_Execute_Flag" value="true"/>
<Parameter id="C131_AT_Oil_Temperature_Execute_Flag" value="true"/>
<Parameter id="C131_AT_Shift_Solenoid_Execute_Flag" value="true"/>
<Parameter id="C131_AT_Linear_Solenoid_Execute_Flag" value="true"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_AT"/>
<Parameter id="C131_AT_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_AT_HN_Execute_Flag" value="true"/>
<Parameter id="C131_AT_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_AT_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AT_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AT_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_AT_EID_Execute_Flag" value="true"/>
<Parameter id="C131_AT_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="276" ActivityType="5" flags="0" name="C131_DSCU">
<Rect left="440" top="1424" right="540" bottom="1456"/>
<SubProcesses>
<SubProcess id="C131_DSCU">
<Parameters>
<Parameter id="C131_DSCU_Driver_Seat_Swch_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_Seat_Up_Down_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_Seat_Forwad_Back_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_Pan_Up_Down_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_Backrest_F_B_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_Seat_Memory_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="C131_DSCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DSCU_WD_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="Car_Type" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="277" ActivityType="5" flags="0" name="C131_EPB">
<Rect left="440" top="1494" right="540" bottom="1526"/>
<SubProcesses>
<SubProcess id="C131_EPB">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EPB"/>
<Parameter id="C131_EPB_Assembly_Check_Execute_Flag" value="false"/>
<Parameter id="C131_EPB_Switch_and_LED_Execute_Flag" value="false"/>
<Parameter id="C131_EPB_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_EID_Execute_Flag" value="true"/>
<Parameter id="C131_EPB_WD_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="278" ActivityType="5" flags="0" name="C131_DDCU">
<Rect left="440" top="1564" right="540" bottom="1596"/>
<SubProcesses>
<SubProcess id="C131_DDCU">
<Parameters>
<Parameter id="C131_PDCU_Window_Initialization_Execute_Flag" value="true"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="C131_DDCU_Check_Mirror_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Turn_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Door_Lights_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_Mirror_Meantime_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_DDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_WD_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="279" ActivityType="5" flags="0" name="rldcu">
<Rect left="440" top="1634" right="540" bottom="1666"/>
<SubProcesses>
<SubProcess id="C131_RLDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="C131_RLDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Door_Lock_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Window_Initialization_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="280" ActivityType="5" flags="0" name="sdm">
<Rect left="440" top="1704" right="540" bottom="1736"/>
<SubProcesses>
<SubProcess id="C131_SDM">
<Parameters>
<Parameter id="C131_SDM_Warning_Lamp_Execute_Flag" value="false"/>
<Parameter id="C131_SDM_Seat_Belt_Check_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_SBR_Switch_Check_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_Resistance_Check_Execute_Flag" value="true"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_SDM"/>
<Parameter id="C131_SDM_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_HN_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_SN_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_EID_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="Write_VariCoding" value="Write_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="281" ActivityType="5" flags="0" name="C131_PDCU">
<Rect left="440" top="1774" right="540" bottom="1806"/>
<SubProcesses>
<SubProcess id="C131_PDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="C131_PDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_WD_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_Check_Mirror_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Turn_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Door_Lights_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_Central_Lock_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Window_Initialization_Execute_Flag" value="true"/>
<Parameter id="C131_PDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="283" ActivityType="5" flags="0" name="C131_ARMREST">
<Rect left="440" top="1914" right="540" bottom="1946"/>
<SubProcesses>
<SubProcess id="C131_ARMREST">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="C131_ARMREST_Panel_Switch_Execute_Flag" value="false"/>
<Parameter id="DString_C131_dif_config" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_ARMREST_RR_Backrest_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RL_Backrest_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RR_Massaging_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RL_Masaging_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_EID_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_WD_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_HN_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="284" ActivityType="5" flags="0" name="RRDCU">
<Rect left="440" top="1984" right="540" bottom="2016"/>
<SubProcesses>
<SubProcess id="C131_RRDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="C131_RRDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Door_Lock_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_Central_Lock_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_Mechanical_Key_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Window_Initialization_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="287" ActivityType="5" flags="0" name="c131_PLGM">
<Rect left="440" top="2164" right="540" bottom="2196"/>
<SubProcesses>
<SubProcess id="C131_PLGM">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="C131_PLGM_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_WD_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_VIN_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_PLGM_Open_With_Button_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_Anti_Pinch_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_Anti_Collsion_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_Open_With_Kick_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_Open_With_Key_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_VariCoding1" value="DString_C131_VariCoding_PLGM1"/>
<Parameter id="DString_C131_Partnumber1" value="DString_C131_Partnumber_PLGM1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="288" ActivityType="5" flags="0" name="c131_SCM">
<Rect left="440" top="2234" right="540" bottom="2266"/>
<SubProcesses>
<SubProcess id="C131_SCM">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_SCM"/>
<Parameter id="C131_SCM_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_HN_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_SN_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_EID_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_WD_Execute_Flag" value="true"/>
<Parameter id="C131_SCM_VIN_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_SCM_AD_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="289" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="440" top="584" right="540" bottom="616"/>
<SubProcesses>
<SubProcess id="C131_DVD">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DVD"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DVD"/>
<Parameter id="C131_DVD_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DVD_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DVD_VIN_Execute_Flag" value="flase"/>
<Parameter id="C131_DVD_HVP_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="290" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="584" right="386" bottom="616"/>
</Activity>
<Activity id="291" ActivityType="5" flags="0" name="C131_EMS">
<Rect left="190" top="784" right="290" bottom="816"/>
<SubProcesses>
<SubProcess id="C131_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Engine_Displacement" value="DString_C131_Engine_Displacement"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_ConfigInfo" value="DString_C131_Configinfo_EMS"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="197" type="0">
</Transition>
<Transition StartId="196" EndId="202" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="199" type="0">
</Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="196" type="0">
</Transition>
<Transition StartId="202" EndId="204" type="0">
</Transition>
<Transition StartId="203" EndId="205" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="204" EndId="203" type="1">
<Expression>DString_C131_Partnumber_EMS ~= ""</Expression></Transition>
<Transition StartId="204" EndId="290" type="0">
</Transition>
<Transition StartId="205" EndId="290" type="0">
</Transition>
<Transition StartId="205" EndId="289" type="1">
<Expression>DString_C131_Partnumber_DVD ~= "" and  DString_C131_Partnumber_DVD ~= nil</Expression></Transition>
<Transition StartId="210" EndId="211" type="0">
</Transition>
<Transition StartId="210" EndId="266" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Type) == true</Expression></Transition>
<Transition StartId="210" EndId="291" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Type) == false</Expression></Transition>
<Transition StartId="211" EndId="213" type="0">
</Transition>
<Transition StartId="211" EndId="267" type="1">
<Expression>DString_C131_Partnumber_AFS ~=""</Expression></Transition>
<Transition StartId="213" EndId="215" type="0">
</Transition>
<Transition StartId="213" EndId="268" type="1">
<Expression>DString_C131_Partnumber_LDW ~=""</Expression></Transition>
<Transition StartId="215" EndId="262" type="0">
</Transition>
<Transition StartId="215" EndId="269" type="1">
<Expression>DString_C131_Partnumber_SAS ~=""</Expression></Transition>
<Transition StartId="217" EndId="218" type="0">
</Transition>
<Transition StartId="217" EndId="271" type="1">
<Expression>DString_C131_Partnumber_DCT ~=""</Expression></Transition>
<Transition StartId="218" EndId="222" type="0">
</Transition>
<Transition StartId="218" EndId="272" type="1">
<Expression>DString_C131_Partnumber_EHPS ~=""</Expression></Transition>
<Transition StartId="222" EndId="224" type="0">
</Transition>
<Transition StartId="222" EndId="273" type="1">
<Expression>DString_C131_Partnumber_ESP ~=""</Expression></Transition>
<Transition StartId="224" EndId="226" type="0">
</Transition>
<Transition StartId="224" EndId="274" type="1">
<Expression>DString_C131_Partnumber_PDC~=""</Expression></Transition>
<Transition StartId="226" EndId="228" type="0">
</Transition>
<Transition StartId="226" EndId="275" type="1">
<Expression>DString_C131_Partnumber_AT~=""</Expression></Transition>
<Transition StartId="228" EndId="230" type="0">
</Transition>
<Transition StartId="228" EndId="276" type="1">
<Expression>DString_C131_Partnumber_DSCU~=""</Expression></Transition>
<Transition StartId="230" EndId="232" type="0">
</Transition>
<Transition StartId="230" EndId="277" type="1">
<Expression>DString_C131_Partnumber_EPB ~=""</Expression></Transition>
<Transition StartId="232" EndId="234" type="0">
</Transition>
<Transition StartId="232" EndId="278" type="1">
<Expression>DString_C131_Partnumber_DDCU~=""</Expression></Transition>
<Transition StartId="234" EndId="236" type="0">
</Transition>
<Transition StartId="234" EndId="279" type="1">
<Expression>DString_C131_Partnumber_RLDCU~=""</Expression></Transition>
<Transition StartId="235" EndId="250" type="0">
</Transition>
<Transition StartId="236" EndId="238" type="0">
</Transition>
<Transition StartId="236" EndId="280" type="1">
<Expression>DString_C131_Partnumber_SDM ~=""</Expression></Transition>
<Transition StartId="237" EndId="248" type="0">
</Transition>
<Transition StartId="238" EndId="240" type="0">
</Transition>
<Transition StartId="238" EndId="281" type="1">
<Expression>DString_C131_Partnumber_PDCU ~=""</Expression></Transition>
<Transition StartId="239" EndId="242" type="0">
</Transition>
<Transition StartId="240" EndId="239" type="1">
<Expression>DString_C131_Partnumber_GATEWAY ~=""</Expression></Transition>
<Transition StartId="240" EndId="242" type="0">
</Transition>
<Transition StartId="241" EndId="260" type="0">
</Transition>
<Transition StartId="242" EndId="244" type="0">
</Transition>
<Transition StartId="242" EndId="283" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~=""</Expression></Transition>
<Transition StartId="244" EndId="246" type="0">
</Transition>
<Transition StartId="244" EndId="284" type="1">
<Expression>DString_C131_Partnumber_RRDCU ~=""</Expression></Transition>
<Transition StartId="246" EndId="248" type="0">
</Transition>
<Transition StartId="246" EndId="237" type="1">
<Expression>DString_C131_Partnumber_BCM2 ~=""</Expression></Transition>
<Transition StartId="248" EndId="250" type="0">
</Transition>
<Transition StartId="248" EndId="235" type="1">
<Expression>DString_C131_Partnumber_BCM1 ~=""</Expression></Transition>
<Transition StartId="250" EndId="252" type="0">
</Transition>
<Transition StartId="250" EndId="287" type="1">
<Expression>DString_C131_Partnumber_PLGM ~= "" and  DString_C131_Partnumber_PLGM~="PLGM0_partnumber"</Expression></Transition>
<Transition StartId="251" EndId="258" type="0">
</Transition>
<Transition StartId="252" EndId="254" type="0">
</Transition>
<Transition StartId="252" EndId="288" type="1">
<Expression>DString_C131_Partnumber_SCM ~= "" and  DString_C131_Partnumber_SCM~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="253" EndId="256" type="0">
</Transition>
<Transition StartId="254" EndId="253" type="1">
<Expression>DString_C131_Partnumber_FWD ~= "" and  DString_C131_Partnumber_FWD ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="254" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="258" type="0">
</Transition>
<Transition StartId="256" EndId="251" type="1">
<Expression>DString_C131_Partnumber_BSD ~= "" and  DString_C131_Partnumber_BSD ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="258" EndId="260" type="0">
</Transition>
<Transition StartId="258" EndId="241" type="1">
<Expression>DString_C131_Partnumber_PEPS ~=""</Expression></Transition>
<Transition StartId="259" EndId="2" type="0">
</Transition>
<Transition StartId="260" EndId="259" type="0">
</Transition>
<Transition StartId="261" EndId="210" type="0">
</Transition>
<Transition StartId="261" EndId="265" type="1">
<Expression>DString_C131_Partnumber_AC ~=""</Expression></Transition>
<Transition StartId="262" EndId="217" type="0">
</Transition>
<Transition StartId="262" EndId="270" type="1">
<Expression>DString_C131_Partnumber_IC ~=""</Expression></Transition>
<Transition StartId="264" EndId="261" type="0">
</Transition>
<Transition StartId="265" EndId="210" type="0">
</Transition>
<Transition StartId="266" EndId="211" type="0">
</Transition>
<Transition StartId="267" EndId="213" type="0">
</Transition>
<Transition StartId="268" EndId="215" type="0">
</Transition>
<Transition StartId="269" EndId="262" type="0">
</Transition>
<Transition StartId="270" EndId="217" type="0">
</Transition>
<Transition StartId="271" EndId="218" type="0">
</Transition>
<Transition StartId="272" EndId="222" type="0">
</Transition>
<Transition StartId="273" EndId="224" type="0">
</Transition>
<Transition StartId="274" EndId="226" type="0">
</Transition>
<Transition StartId="275" EndId="228" type="0">
</Transition>
<Transition StartId="276" EndId="230" type="0">
</Transition>
<Transition StartId="277" EndId="232" type="0">
</Transition>
<Transition StartId="278" EndId="234" type="0">
</Transition>
<Transition StartId="279" EndId="236" type="0">
</Transition>
<Transition StartId="280" EndId="238" type="0">
</Transition>
<Transition StartId="281" EndId="240" type="0">
</Transition>
<Transition StartId="283" EndId="244" type="0">
</Transition>
<Transition StartId="284" EndId="246" type="0">
</Transition>
<Transition StartId="287" EndId="252" type="0">
</Transition>
<Transition StartId="288" EndId="254" type="0">
</Transition>
<Transition StartId="289" EndId="290" type="0">
</Transition>
<Transition StartId="290" EndId="264" type="1">
<Expression>DString_C131_Partnumber_ACC ~=""</Expression></Transition>
<Transition StartId="290" EndId="261" type="0">
</Transition>
<Transition StartId="291" EndId="211" type="0">
</Transition>
</Transitions>
</Process>

