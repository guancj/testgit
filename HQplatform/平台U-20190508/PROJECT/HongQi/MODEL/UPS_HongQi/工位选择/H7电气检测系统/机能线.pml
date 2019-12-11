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
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="340" top="54" right="440" bottom="86"/>
<Script>DString_C131_Car_Tpye = engine.CarType
DString_Write_VIN = engine.VIN
VMTLOC = "FUN"

print("机能线H7车型:"..DString_C131_Car_Tpye)
print("机能线H7_VIN:"..DString_Write_VIN)</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="340" top="2774" right="440" bottom="2806"/>
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
<Activity id="2" ActivityType="5" flags="0" name="C131_AFS">
<Rect left="420" top="754" right="520" bottom="786"/>
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
<Parameter id="C131_AFS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_AFS_WD_Execute_Flag" value="false"/>
<Parameter id="C131_AFS_VIN_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="3" ActivityType="5" flags="0" name="c131_pdc">
<Rect left="420" top="534" right="520" bottom="566"/>
<SubProcesses>
<SubProcess id="C131_PDC">
<Parameters>
<Parameter id="C131_PDC_System_Self_Checking_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Function_Activation_Check_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Sensor_Data_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_Read_Switch_Data_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PDC"/>
<Parameter id="C131_PDC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_EID_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="5" ActivityType="5" flags="0" name="ECU读配置文件">
<Rect left="340" top="124" right="440" bottom="156"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
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
<Parameter id="EMS00_configinfo" ret="DString_C131_ConfigInfo_EMS"/>
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
<Parameter id="GW000_horlconfig" ret="DString_C131_Horlconfig_GATEWAY"/>
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
<Parameter id="AC000_partnumber"/>
<Parameter id="BCM10_varicoding" ret="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="PLGM0_partnumber" ret="DString_C131_Partnumber_PLGM"/>
<Parameter id="PLGM0_varicoding" ret="DString_C131_VariCoding_PLGM"/>
<Parameter id="SCM00_partnumber" ret="DString_C131_Partnumber_SCM"/>
<Parameter id="SCM00_varicoding" ret="DString_C131_VariCoding_SCM"/>
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
<Activity id="7" ActivityType="5" flags="0" name="c131_ldw">
<Rect left="420" top="814" right="520" bottom="846"/>
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
<Parameter id="C131_LDW_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_LDW_EID_Execute_Flag" value="false"/>
<Parameter id="C131_LDW_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="5" flags="0" name="c131_armrest">
<Rect left="420" top="874" right="520" bottom="906"/>
<SubProcesses>
<SubProcess id="C131_ARMREST">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="C131_ARMREST_Panel_Switch_Execute_Flag" value="false"/>
<Parameter id="DString_C131_dif_config" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_ARMREST_RR_Backrest_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RL_Backrest_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RR_Massaging_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_RL_Masaging_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ARMREST_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_EID_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_WD_Execute_Flag" value="false"/>
<Parameter id="C131_ARMREST_HN_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="c131_bcm1">
<Rect left="420" top="934" right="520" bottom="966"/>
<SubProcesses>
<SubProcess id="C131_BCM1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="C131_BCM1_Lamp_Combination_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Wiper_Washer_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Truck_Release_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Tand_Lid_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_All_Inner_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Hazard_Function_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Interior_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Reading_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Engine_Lid_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Beam_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Front_Fog_Lamp_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_Wipers_Check_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_HN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM1_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_EID_Execute_Flag" value="false"/>
<Parameter id="C131_BCM1_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_BCM1_Charger_Lid_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="10" ActivityType="5" flags="0" name="c131_bcm2">
<Rect left="420" top="994" right="520" bottom="1026"/>
<SubProcesses>
<SubProcess id="C131_BCM2">
<Parameters>
<Parameter id="C131_BCM2_Brake_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Rear_Fog_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Reverse_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_License_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_HM_Brake_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Turn_Lamps_Execute_Flag" value="false"/>
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
<Parameter id="C131_BCM2_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_EID_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_BCM2_Position_Lamps_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="0" name="c131_at">
<Rect left="420" top="1054" right="520" bottom="1086"/>
<SubProcesses>
<SubProcess id="C131_AT">
<Parameters>
<Parameter id="C131_AT_Shift_L_Position_Execute_Flag" value="false"/>
<Parameter id="C131_AT_Tip_Mode_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_AT_Vehicle_Speed_Execute_Flag" value="false"/>
<Parameter id="C131_AT_Oil_Temperature_Execute_Flag" value="false"/>
<Parameter id="C131_AT_Shift_Solenoid_Execute_Flag" value="false"/>
<Parameter id="C131_AT_Linear_Solenoid_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_AT"/>
<Parameter id="C131_AT_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_AT_HN_Execute_Flag" value="true"/>
<Parameter id="C131_AT_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_AT_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AT_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AT_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_AT_EID_Execute_Flag" value="false"/>
<Parameter id="C131_AT_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="5" flags="0" name="c131_cluster">
<Rect left="420" top="1114" right="520" bottom="1146"/>
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
<Parameter id="C131_Cluster_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_EID_Execute_Flag" value="false"/>
<Parameter id="C131_Cluster_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="13" ActivityType="5" flags="0" name="C131_DCT">
<Rect left="420" top="1184" right="520" bottom="1216"/>
<SubProcesses>
<SubProcess id="C131_DCT">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCT_Shift_Lock_Relay_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_Shift_LV_Signal_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="&quot;FUN&quot;"/>
<Parameter id="C131_DCT_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_DCT_SPEC_Execute_Flag" value="C131_DCT_SPEC_Execute_Flag"/>
<Parameter id="C131_DCT_Oimpump_Speed_IO_Execute_Flag" value="false"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="14" ActivityType="5" flags="0" name="c131_dscu">
<Rect left="420" top="1244" right="520" bottom="1276"/>
<SubProcesses>
<SubProcess id="C131_DSCU">
<Parameters>
<Parameter id="C131_DSCU_Driver_Seat_Swch_Execute_Flag" value="false"/>
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
<Parameter id="C131_DSCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DSCU_WD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="5" flags="0" name="c131_ddcu">
<Rect left="420" top="1304" right="520" bottom="1336"/>
<SubProcesses>
<SubProcess id="C131_DDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="C131_PDCU_Window_Initialization_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_Mirror_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Turn_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_Mirror_Meantime_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_DDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DDCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_WD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="16" ActivityType="5" flags="0" name="c131_pdcu">
<Rect left="420" top="1364" right="520" bottom="1396"/>
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
<Parameter id="C131_PDCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_WD_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_Mirror_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Turn_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_DDCU_Check_Central_Lock_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Window_Initialization_Execute_Flag" value="false"/>
<Parameter id="C131_PDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="17" ActivityType="5" flags="0" name="c131_rldcu">
<Rect left="420" top="1424" right="520" bottom="1456"/>
<SubProcesses>
<SubProcess id="C131_RLDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="C131_RLDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Door_Lock_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Window_Initialization_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_RLDCU_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="18" ActivityType="5" flags="0" name="c131_rrdcu">
<Rect left="420" top="1474" right="520" bottom="1506"/>
<SubProcesses>
<SubProcess id="C131_RRDCU">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="C131_RRDCU_Check_The_Door_Lights_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Door_Window_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Door_Lock_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_The_Switches_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_Central_Lock_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Check_Mechanical_Key_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Window_Initialization_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_Window_Learning_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_RRDCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_RRDCU_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="19" ActivityType="5" flags="0" name="c131_sdm">
<Rect left="420" top="1534" right="520" bottom="1566"/>
<SubProcesses>
<SubProcess id="C131_SDM">
<Parameters>
<Parameter id="C131_SDM_Warning_Lamp_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_Seat_Belt_Check_Execute_Flag" value="false"/>
<Parameter id="C131_SDM_SBR_Switch_Check_Execute_Flag" value="false"/>
<Parameter id="C131_SDM_Resistance_Check_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_SDM"/>
<Parameter id="C131_SDM_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_HN_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_SN_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_SDM_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_SDM_EID_Execute_Flag" value="false"/>
<Parameter id="C131_SDM_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="Write_VariCoding" value="Write_VariCoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="c131_esp">
<Rect left="420" top="1594" right="520" bottom="1626"/>
<SubProcesses>
<SubProcess id="C131_ESP">
<Parameters>
<Parameter id="C131_ESP_Brake_Light_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_ESP_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_ESP_EID_Execute_Flag" value="false"/>
<Parameter id="C131_ESP_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="21" ActivityType="5" flags="0" name="c131_peps">
<Rect left="430" top="1654" right="530" bottom="1686"/>
<SubProcesses>
<SubProcess id="C131_PEPS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="C131_PEPS_Smart_Lock_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_Smart_Start_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_PEPS_Smart_Unlock_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_CID_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_WD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="22" ActivityType="5" flags="0" name="c131_epb">
<Rect left="430" top="1714" right="530" bottom="1746"/>
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
<Parameter id="C131_EPB_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_EPB_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EPB_WD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="&quot;FUNCTION&quot;"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="23" ActivityType="5" flags="0" name="c131_ac">
<Rect left="430" top="1774" right="530" bottom="1806"/>
<SubProcesses>
<SubProcess id="C131_AC">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_AC"/>
<Parameter id="C131_AC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_AC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_AC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AC_Funtion_Line_Execute_Flag" value="true"/>
<Parameter id="C131_AC_HVP_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_AC_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_AC_EID_Execute_Flag" value="false"/>
<Parameter id="C131_AC_WD_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="24" ActivityType="5" flags="0" name="c131_ehps">
<Rect left="430" top="1844" right="530" bottom="1876"/>
<SubProcesses>
<SubProcess id="C131_EHPS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="C131_EHPS_Motor_Speed_Ctrl_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EHPS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_EHPS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EHPS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="25" ActivityType="5" flags="0" name="c131_gateway">
<Rect left="440" top="1904" right="540" bottom="1936"/>
<SubProcesses>
<SubProcess id="C131_GATEWAY">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="C131_GATEWAY_Voltage_Of_Piles_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_Voltage_Generate_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_Current_Generate_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_Heating_Check_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST "/>
<Parameter id="C131_GATEWAY_Current_Range_Execute_Flag" value="false"/>
<Parameter id="DString_C131_HorLConfig" value="DString_C131_Horlconfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_EID_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_EBS_Check_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_BattConfig" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_DVDConfig" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_Batt_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="26" ActivityType="5" flags="0" name="c131_sas">
<Rect left="430" top="1954" right="530" bottom="1986"/>
<SubProcesses>
<SubProcess id="C131_SAS">
<Parameters>
<Parameter id="C131_SAS_Funciton_Check_Execute_Flag" value="true"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_SAS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_SAS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_SAS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_SAS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="27" ActivityType="5" flags="0" name="c131_ems">
<Rect left="430" top="304" right="530" bottom="336"/>
<SubProcesses>
<SubProcess id="C131_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Engine_Displacement" value="DString_C131_Engine_Displacement"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_ConfigInfo" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="28" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="584" right="406" bottom="616"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="754" right="406" bottom="786"/>
</Activity>
<Activity id="33" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="934" right="406" bottom="966"/>
</Activity>
<Activity id="34" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="874" right="406" bottom="906"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="814" right="406" bottom="846"/>
</Activity>
<Activity id="39" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1054" right="406" bottom="1086"/>
</Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1114" right="406" bottom="1146"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1184" right="406" bottom="1216"/>
</Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="994" right="406" bottom="1026"/>
</Activity>
<Activity id="47" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1364" right="406" bottom="1396"/>
</Activity>
<Activity id="48" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1424" right="406" bottom="1456"/>
</Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1304" right="406" bottom="1336"/>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1244" right="406" bottom="1276"/>
</Activity>
<Activity id="55" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1654" right="406" bottom="1686"/>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1594" right="406" bottom="1626"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1534" right="406" bottom="1566"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1474" right="406" bottom="1506"/>
</Activity>
<Activity id="63" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1904" right="406" bottom="1936"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1844" right="406" bottom="1876"/>
</Activity>
<Activity id="65" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1774" right="406" bottom="1806"/>
</Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1714" right="406" bottom="1746"/>
</Activity>
<Activity id="71" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2014" right="406" bottom="2046"/>
</Activity>
<Activity id="73" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="1954" right="406" bottom="1986"/>
</Activity>
<Activity id="78" ActivityType="5" flags="0" name="c131_acc">
<Rect left="420" top="584" right="520" bottom="616"/>
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
<Parameter id="C131_ACC_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_ACC_EID_Execute_Flag" value="false"/>
<Parameter id="C131_ACC_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="&quot;FUN&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="700" top="2764" right="800" bottom="2796"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if (0 == engine.TestResult) then
  engine.DialogBackColor = "Green";
else
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end
</Script></Activity>
<Activity id="88" ActivityType="5" flags="0" name="C131_4WD">
<Rect left="430" top="2134" right="530" bottom="2166"/>
<SubProcesses>
<SubProcess id="C131_4WD">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_4WD_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_SN_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_4WD_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_4WD_EID_Execute_Flag" value="false"/>
<Parameter id="C131_4WD_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_4WD_PowerOff_Execute_Flag" value="false"/>
<Parameter id="C131_4WD_ReO_Execute_Flag" value="false"/>
<Parameter id="C131_4WD_IGBT_Execute_Flag" value="false"/>
<Parameter id="C131_4WD_MG_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="89" ActivityType="5" flags="0" name="C131_MCU">
<Rect left="430" top="2194" right="530" bottom="2226"/>
<SubProcesses>
<SubProcess id="C131_MCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_MCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_MCU_PowerOff_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_ReO_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_IGBT_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_MG_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_SPEC_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="90" ActivityType="5" flags="0" name="C131_Charger">
<Rect left="430" top="2244" right="530" bottom="2276"/>
<SubProcesses>
<SubProcess id="C131_Charger">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_Charger_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_SN_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_Charger_EID_Execute_Flag" value="false"/>
<Parameter id="C131_Charger_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="91" ActivityType="5" flags="0" name="C131_OilPump">
<Rect left="430" top="2304" right="530" bottom="2336"/>
<SubProcesses>
<SubProcess id="C131_OilPump">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_OilPump_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_SN_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_OilPump_EID_Execute_Flag" value="false"/>
<Parameter id="C131_OilPump_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_OilPump_SpeedControl_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="92" ActivityType="5" flags="0" name="C131_BMS">
<Rect left="430" top="2354" right="530" bottom="2386"/>
<SubProcesses>
<SubProcess id="C131_BMS">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_BMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_BMS_OpenAllRelay_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_LVBatteryVoltage_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_SlaveSoftwareVersion_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_BatteryStatus_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_BatteryPackVoltage_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_ModuleTempMax_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_ModuleTempMin_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CellVoltageMin_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CellVoltageMax_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_BatteryPackCurrent_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CheckMainPositiveRelay_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CheckMainNegativeRelay_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CheckPreChargeRelay_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CheckFANRelayControl_Execute_Flag" value="false"/>
<Parameter id="C131_BMS_CheckFANPWMControl_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="93" ActivityType="5" flags="0" name="C131_DCDC">
<Rect left="430" top="2414" right="530" bottom="2446"/>
<SubProcesses>
<SubProcess id="C131_DCDC">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCDC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DCDC_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DCDC_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_MCU_CheckDCDC_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="94" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="430" top="2474" right="530" bottom="2506"/>
<SubProcesses>
<SubProcess id="C131_HCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_HCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_HCU_PowerOff_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_ReO_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_IGBT_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_MG_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_HN_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Read_BMS_Info_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Open_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Close_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SPEC_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="95" ActivityType="5" flags="0" name="C131_BSD">
<Rect left="430" top="2524" right="530" bottom="2556"/>
<SubProcesses>
<SubProcess id="C131_BSD">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_MCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_MCU_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_EID_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_MCU_PowerOff_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_ReO_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_IGBT_Execute_Flag" value="false"/>
<Parameter id="C131_MCU_MG_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2194" right="406" bottom="2226"/>
</Activity>
<Activity id="97" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2244" right="406" bottom="2276"/>
</Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2304" right="406" bottom="2336"/>
</Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2354" right="406" bottom="2386"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2414" right="406" bottom="2446"/>
</Activity>
<Activity id="101" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2474" right="406" bottom="2506"/>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2534" right="406" bottom="2566"/>
</Activity>
<Activity id="103" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2654" right="406" bottom="2686"/>
</Activity>
<Activity id="104" ActivityType="5" flags="0" name="c131_PLGM">
<Rect left="430" top="2014" right="530" bottom="2046"/>
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
<Parameter id="C131_PLGM_EID_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_WD_Execute_Flag" value="false"/>
<Parameter id="C131_PLGM_VIN_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
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
<Activity id="105" ActivityType="5" flags="0" name="c131_SCM">
<Rect left="430" top="2074" right="530" bottom="2106"/>
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
<Parameter id="C131_SCM_EID_Execute_Flag" value="false"/>
<Parameter id="C131_SCM_WD_Execute_Flag" value="false"/>
<Parameter id="C131_SCM_VIN_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_SCM_AD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2074" right="406" bottom="2106"/>
</Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2134" right="406" bottom="2166"/>
</Activity>
<Activity id="108" ActivityType="5" flags="0" name="HCU自学习">
<Rect left="540" top="354" right="640" bottom="386"/>
<SubProcesses>
<SubProcess id="C131_HCU_C0_SelfLearning">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="109" ActivityType="5" flags="0" name="DCT自学习">
<Rect left="540" top="414" right="640" bottom="446"/>
<SubProcesses>
<SubProcess id="C131_HCU_DCT_SelfLearning">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="414" right="406" bottom="446"/>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="364" right="406" bottom="396"/>
</Activity>
<Activity id="114" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="534" right="406" bottom="566"/>
</Activity>
<Activity id="115" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="340" top="2704" right="440" bottom="2736"/>
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
<Parameter id="GW000_partnumber" value="DString_C131_Partnumber_GW"/>
<Parameter id="DDCU0_partnumber" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="PDCU0_partnumber" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="RLDCU_partnumber" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="RRDCU_partnumber" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DSCU0_partnumber" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
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
<Activity id="116" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="304" right="406" bottom="336"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="请启动发动机">
<Rect left="340" top="244" right="440" bottom="276"/>
<Line1Text Enable="1" Text="请启动发动机？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="119" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="474" right="406" bottom="506"/>
</Activity>
<Activity id="120" ActivityType="5" flags="0" name="C131_EMS_Friction_Segment_Adapation">
<Rect left="420" top="474" right="520" bottom="506"/>
<SubProcesses>
<SubProcess id="C131_EMS_Friction_Segment_Adapation">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="121" ActivityType="5" flags="0" name="C131_TBOX">
<Rect left="430" top="2594" right="530" bottom="2626"/>
<SubProcesses>
<SubProcess id="C131_TBOX">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_TBOX_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SN_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_EID_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="2594" right="406" bottom="2626"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="普通节点">
<Rect left="340" top="184" right="440" bottom="216"/>
<Script>engine.println("DString_C131_Car_Tpye:"..DString_C131_Car_Tpye);</Script></Activity>
<Activity id="125" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="420" top="664" right="520" bottom="696"/>
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
<Parameter id="C131_DVD_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DVD_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DVD_HVP_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="664" right="406" bottom="696"/>
</Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="354" right="796" bottom="386"/>
</Activity>
<Activity id="189" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="414" right="796" bottom="446"/>
</Activity>
<Activity id="190" ActivityType="5" flags="0" name="C131_EMS6_20">
<Rect left="240" top="304" right="340" bottom="336"/>
<SubProcesses>
<SubProcess id="C131_EMS6_20">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="191" ActivityType="5" flags="0" name="C131_GATEWAY_19">
<Rect left="220" top="1904" right="320" bottom="1936"/>
<SubProcesses>
<SubProcess id="C131_GATEWAY_19">
<Parameters>
<Parameter id="C131_GATEWAY_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_EID_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_VariCoding0101" value="DString_C131_VariCoding_GW0101"/>
<Parameter id="DString_C131_VariCoding0116" value="DString_C131_VariCoding_GW0116"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Type" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_GATEWAY_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_RCOD_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="5" type="0">
</Transition>
<Transition StartId="2" EndId="35" type="0">
</Transition>
<Transition StartId="3" EndId="28" type="0">
</Transition>
<Transition StartId="5" EndId="123" type="0">
</Transition>
<Transition StartId="7" EndId="34" type="0">
</Transition>
<Transition StartId="8" EndId="33" type="0">
</Transition>
<Transition StartId="9" EndId="42" type="0">
</Transition>
<Transition StartId="10" EndId="39" type="0">
</Transition>
<Transition StartId="11" EndId="40" type="0">
</Transition>
<Transition StartId="12" EndId="41" type="0">
</Transition>
<Transition StartId="13" EndId="50" type="0">
</Transition>
<Transition StartId="14" EndId="49" type="0">
</Transition>
<Transition StartId="15" EndId="47" type="0">
</Transition>
<Transition StartId="16" EndId="48" type="0">
</Transition>
<Transition StartId="17" EndId="58" type="0">
</Transition>
<Transition StartId="18" EndId="57" type="0">
</Transition>
<Transition StartId="19" EndId="56" type="0">
</Transition>
<Transition StartId="20" EndId="55" type="0">
</Transition>
<Transition StartId="21" EndId="66" type="0">
</Transition>
<Transition StartId="22" EndId="65" type="0">
</Transition>
<Transition StartId="23" EndId="64" type="0">
</Transition>
<Transition StartId="24" EndId="63" type="0">
</Transition>
<Transition StartId="25" EndId="73" type="0">
</Transition>
<Transition StartId="26" EndId="71" type="0">
</Transition>
<Transition StartId="27" EndId="111" type="0">
</Transition>
<Transition StartId="28" EndId="78" type="1">
<Expression>DString_C131_Partnumber_ACC ~=""</Expression></Transition>
<Transition StartId="28" EndId="187" type="0">
</Transition>
<Transition StartId="30" EndId="2" type="1">
<Expression>DString_C131_Partnumber_AFS ~=""</Expression></Transition>
<Transition StartId="30" EndId="35" type="0">
</Transition>
<Transition StartId="33" EndId="9" type="1">
<Expression>DString_C131_Partnumber_BCM1 ~=""</Expression></Transition>
<Transition StartId="33" EndId="42" type="0">
</Transition>
<Transition StartId="34" EndId="8" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~=""</Expression></Transition>
<Transition StartId="34" EndId="33" type="0">
</Transition>
<Transition StartId="35" EndId="7" type="1">
<Expression>DString_C131_Partnumber_LDW ~=""</Expression></Transition>
<Transition StartId="35" EndId="34" type="0">
</Transition>
<Transition StartId="39" EndId="11" type="1">
<Expression>DString_C131_Partnumber_AT~=""</Expression></Transition>
<Transition StartId="39" EndId="40" type="0">
</Transition>
<Transition StartId="40" EndId="12" type="1">
<Expression>DString_C131_Partnumber_IC ~=""</Expression></Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="13" type="1">
<Expression>DString_C131_Partnumber_DCT ~=""</Expression></Transition>
<Transition StartId="41" EndId="50" type="0">
</Transition>
<Transition StartId="42" EndId="10" type="1">
<Expression>DString_C131_Partnumber_BCM2 ~=""</Expression></Transition>
<Transition StartId="42" EndId="39" type="0">
</Transition>
<Transition StartId="47" EndId="16" type="1">
<Expression>DString_C131_Partnumber_PDCU ~=""</Expression></Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="17" type="1">
<Expression>DString_C131_Partnumber_RLDCU ~=""</Expression></Transition>
<Transition StartId="48" EndId="58" type="0">
</Transition>
<Transition StartId="49" EndId="15" type="1">
<Expression>DString_C131_Partnumber_DDCU ~=""</Expression></Transition>
<Transition StartId="49" EndId="47" type="0">
</Transition>
<Transition StartId="50" EndId="14" type="1">
<Expression>DString_C131_Partnumber_DSCU ~=""</Expression></Transition>
<Transition StartId="50" EndId="49" type="0">
</Transition>
<Transition StartId="55" EndId="21" type="1">
<Expression>DString_C131_Partnumber_PEPS ~=""</Expression></Transition>
<Transition StartId="55" EndId="66" type="0">
</Transition>
<Transition StartId="56" EndId="20" type="1">
<Expression>DString_C131_Partnumber_ESP ~=""</Expression></Transition>
<Transition StartId="56" EndId="55" type="0">
</Transition>
<Transition StartId="57" EndId="19" type="1">
<Expression>DString_C131_Partnumber_SDM ~=""</Expression></Transition>
<Transition StartId="57" EndId="56" type="0">
</Transition>
<Transition StartId="58" EndId="18" type="1">
<Expression>DString_C131_Partnumber_RRDCU ~=""</Expression></Transition>
<Transition StartId="58" EndId="57" type="0">
</Transition>
<Transition StartId="63" EndId="25" type="1">
<Expression>DString_C131_Partnumber_GATEWAY ~="" and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="63" EndId="73" type="0">
</Transition>
<Transition StartId="63" EndId="191" type="1">
<Expression>DString_C131_Partnumber_GATEWAY ~="" and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="64" EndId="24" type="1">
<Expression>DString_C131_Partnumber_EHPS ~=""</Expression></Transition>
<Transition StartId="64" EndId="63" type="0">
</Transition>
<Transition StartId="65" EndId="23" type="1">
<Expression>DString_C131_Partnumber_AC ~=""</Expression></Transition>
<Transition StartId="65" EndId="64" type="0">
</Transition>
<Transition StartId="66" EndId="22" type="1">
<Expression>DString_C131_Partnumber_EPB ~=""</Expression></Transition>
<Transition StartId="66" EndId="65" type="0">
</Transition>
<Transition StartId="71" EndId="104" type="1">
<Expression>DString_C131_Partnumber_PLGM ~= "" and  DString_C131_Partnumber_PLGM~="PLGM0_partnumber"</Expression></Transition>
<Transition StartId="71" EndId="106" type="0">
</Transition>
<Transition StartId="73" EndId="26" type="1">
<Expression>DString_C131_Partnumber_SAS ~=""</Expression></Transition>
<Transition StartId="73" EndId="71" type="0">
</Transition>
<Transition StartId="78" EndId="187" type="0">
</Transition>
<Transition StartId="80" EndId="1" type="0">
</Transition>
<Transition StartId="88" EndId="96" type="0">
</Transition>
<Transition StartId="89" EndId="97" type="0">
</Transition>
<Transition StartId="90" EndId="98" type="0">
</Transition>
<Transition StartId="91" EndId="99" type="0">
</Transition>
<Transition StartId="92" EndId="100" type="0">
</Transition>
<Transition StartId="93" EndId="101" type="0">
</Transition>
<Transition StartId="94" EndId="102" type="0">
</Transition>
<Transition StartId="95" EndId="122" type="0">
</Transition>
<Transition StartId="96" EndId="89" type="1">
<Expression>DString_C131_Partnumber_MCU ~= "" and  DString_C131_Partnumber_MCU~="MCU00_partnumber"</Expression></Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="90" type="1">
<Expression>DString_C131_Partnumber_Charger ~= "" and  DString_C131_Partnumber_Charger ~="CHG00_partnumber"</Expression></Transition>
<Transition StartId="97" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="91" type="1">
<Expression>DString_C131_Partnumber_Oilpump ~= "" and  DString_C131_Partnumber_Oilpump~="OLP00_partnumber"</Expression></Transition>
<Transition StartId="98" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="92" type="1">
<Expression>DString_C131_Partnumber_BMS ~= "" and  DString_C131_Partnumber_BMS~="BMS00_partnumber" and DString_C131_Car_Tpye=="CH1MM21"</Expression></Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="93" type="1">
<Expression>DString_C131_Partnumber_DCDC ~= "" and  DString_C131_Partnumber_DCDC ~="DCDC0_partnumber"</Expression></Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="94" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="101" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="95" type="1">
<Expression>DString_C131_Partnumber_BSD ~= "" and  DString_C131_Partnumber_BSD ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="102" EndId="122" type="0">
</Transition>
<Transition StartId="103" EndId="115" type="0">
</Transition>
<Transition StartId="104" EndId="106" type="0">
</Transition>
<Transition StartId="105" EndId="107" type="0">
</Transition>
<Transition StartId="106" EndId="105" type="1">
<Expression>DString_C131_Partnumber_SCM ~= "" and  DString_C131_Partnumber_SCM~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="88" type="1">
<Expression>DString_C131_Partnumber_FWD ~= "" and  DString_C131_Partnumber_FWD ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="107" EndId="96" type="0">
</Transition>
<Transition StartId="108" EndId="110" type="0">
</Transition>
<Transition StartId="109" EndId="119" type="0">
</Transition>
<Transition StartId="110" EndId="119" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="0">
</Transition>
<Transition StartId="114" EndId="28" type="0">
</Transition>
<Transition StartId="114" EndId="3" type="1">
<Expression>DString_C131_Partnumber_PDC ~=""</Expression></Transition>
<Transition StartId="115" EndId="1" type="0">
</Transition>
<Transition StartId="116" EndId="27" type="1">
<Expression>DString_C131_Partnumber_EMS ~="" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="116" EndId="111" type="0">
</Transition>
<Transition StartId="116" EndId="190" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="118" EndId="116" type="0">
</Transition>
<Transition StartId="119" EndId="114" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="1">
<Expression>DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1MM41" </Expression></Transition>
<Transition StartId="120" EndId="114" type="0">
</Transition>
<Transition StartId="121" EndId="103" type="0">
</Transition>
<Transition StartId="122" EndId="121" type="1">
<Expression>DString_C131_Partnumber_TBOX ~= "" and  DString_C131_Partnumber_TBOX ~="TBOX0_partnumber"</Expression></Transition>
<Transition StartId="122" EndId="103" type="0">
</Transition>
<Transition StartId="123" EndId="118" type="0">
</Transition>
<Transition StartId="125" EndId="30" type="0">
</Transition>
<Transition StartId="187" EndId="125" type="1">
<Expression>DString_C131_Partnumber_DVD ~= "" and  DString_C131_Partnumber_DVD ~="DVD00_partnumber"</Expression></Transition>
<Transition StartId="187" EndId="30" type="0">
</Transition>
<Transition StartId="188" EndId="108" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="189" EndId="109" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="190" EndId="111" type="0">
</Transition>
<Transition StartId="191" EndId="73" type="0">
</Transition>
</Transitions>
</Process>

