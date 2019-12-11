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
<Rect left="170" top="4" right="270" bottom="36"/>
<Script>DString_C131_Car_Tpye = engine.CarType
DString_Write_VIN = engine.VIN
VMTLOC = "FUN"

print("终检工位H7_CarType:"..DString_C131_Car_Tpye)
print("终H7_VIN:"..DString_Write_VIN)</Script><Line2Text Enable="1"/>
</Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="213" top="2420" right="313" bottom="2452"/>
<Script></Script></End>
<Activities>
<Activity id="10" ActivityType="5" flags="0" name="C131_AFS">
<Rect left="316" top="453" right="416" bottom="485"/>
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
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_AFS_WD_Execute_Flag" value="false"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_AFS_VIN_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="5" flags="0" name="读配置码">
<Rect left="476" top="3" right="576" bottom="35"/>
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
<Parameter id="GW000_horlconfig" ret="DString_C131_HorLConfig_GATEWAY"/>
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
<Activity id="14" ActivityType="5" flags="0" name="C131_AC">
<Rect left="317" top="134" right="417" bottom="166"/>
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
<Activity id="15" ActivityType="5" flags="0" name="C131_AT">
<Rect left="316" top="810" right="416" bottom="842"/>
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
<Activity id="17" ActivityType="5" flags="0" name="C131_BCM1">
<Rect left="316" top="571" right="416" bottom="603"/>
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
<Activity id="18" ActivityType="5" flags="0" name="C131_BCM2">
<Rect left="316" top="629" right="416" bottom="661"/>
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
<Activity id="19" ActivityType="5" flags="0" name="C131_ESP">
<Rect left="318" top="1097" right="418" bottom="1129"/>
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
<Activity id="20" ActivityType="5" flags="0" name="C131_SDM">
<Rect left="321" top="1510" right="421" bottom="1542"/>
<SubProcesses>
<SubProcess id="C131_SDM">
<Parameters>
<Parameter id="C131_SDM_Warning_Lamp_Execute_Flag" value="false"/>
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
<Activity id="21" ActivityType="5" flags="0" name="C131_EMS">
<Rect left="316" top="691" right="416" bottom="723"/>
<SubProcesses>
<SubProcess id="C131_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="false"/>
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
<Activity id="25" ActivityType="5" flags="0" name="C131_LDW">
<Rect left="315" top="510" right="415" bottom="542"/>
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
<Activity id="26" ActivityType="5" flags="0" name="C131_GATEWAY">
<Rect left="318" top="1155" right="418" bottom="1187"/>
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
<Parameter id="DString_C131_HorLConfig" value="DString_C131_HorLConfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_EID_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="false"/>
<Parameter id="C131_GATEWAY_EBS_Check_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_BattConfig" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_DVDConfig" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_Batt_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="27" ActivityType="5" flags="0" name="C131_PDC">
<Rect left="317" top="243" right="417" bottom="275"/>
<SubProcesses>
<SubProcess id="C131_PDC">
<Parameters>
<Parameter id="C131_PDC_System_Self_Checking_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Function_Activation_Check_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Sensor_Data_Execute_Flag" value="false"/>
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
<Activity id="28" ActivityType="5" flags="0" name="C131_SAS">
<Rect left="320" top="1453" right="420" bottom="1485"/>
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
<Parameter id="C131_SAS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_SAS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_SAS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="29" ActivityType="5" flags="0" name="C131_EPB">
<Rect left="319" top="1397" right="419" bottom="1429"/>
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
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="C131_PEPS">
<Rect left="321" top="1681" right="421" bottom="1713"/>
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
<Activity id="33" ActivityType="3" flags="0" name="Title">
<Rect left="758" right="858" bottom="32"/>
<TitleText Enable="1" Text="一汽红旗-终检线"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="34" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="244" right="284" bottom="276"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="512" right="283" bottom="544"/>
</Activity>
<Activity id="37" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="630" right="284" bottom="662"/>
</Activity>
<Activity id="38" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1096" right="283" bottom="1128"/>
</Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1511" right="284" bottom="1543"/>
</Activity>
<Activity id="44" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1154" right="284" bottom="1186"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1452" right="284" bottom="1484"/>
</Activity>
<Activity id="47" ActivityType="5" flags="0" name="C131_DCT">
<Rect left="317" top="925" right="417" bottom="957"/>
<SubProcesses>
<SubProcess id="C131_DCT">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCT_Shift_Lock_Relay_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_Shift_LV_Signal_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DCT_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCT_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_EID_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_DCT_SPEC_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_Oimpump_Speed_IO_Execute_Flag" value="false"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1398" right="283" bottom="1430"/>
</Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1682" right="283" bottom="1714"/>
</Activity>
<Activity id="52" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1567" right="283" bottom="1599"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="设置工位">
<Rect left="622" right="722" bottom="32"/>
<Script>VMTLOC = "FIN"
engine.WorkPlace="FIN"</Script></Activity>
<Activity id="87" ActivityType="5" flags="0" name="c131_PLGM">
<Rect left="319" top="1567" right="419" bottom="1599"/>
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
<Activity id="88" ActivityType="5" flags="0" name="c131_SCM">
<Rect left="320" top="1626" right="420" bottom="1658"/>
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
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1625" right="283" bottom="1657"/>
</Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="134" right="286" bottom="166"/>
</Activity>
<Activity id="108" ActivityType="5" flags="0" name="c131_dscu">
<Rect left="317" top="189" right="417" bottom="221"/>
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
<Parameter id="Car_Type" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="109" ActivityType="4" flags="0" name="路由节点">
<Rect left="253" top="189" right="285" bottom="221"/>
</Activity>
<Activity id="110" ActivityType="5" flags="0" name="c131_ACC">
<Rect left="316" top="306" right="416" bottom="338"/>
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
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="308" right="284" bottom="340"/>
</Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="452" right="284" bottom="484"/>
</Activity>
<Activity id="113" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="570" right="283" bottom="602"/>
</Activity>
<Activity id="114" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="809" right="284" bottom="841"/>
</Activity>
<Activity id="115" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="692" right="284" bottom="724"/>
</Activity>
<Activity id="116" ActivityType="5" flags="0" name="armrestye">
<Rect left="316" top="751" right="416" bottom="783"/>
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
<Parameter id="C131_ARMREST_HN_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="117" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="925" right="284" bottom="957"/>
</Activity>
<Activity id="118" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="750" right="284" bottom="782"/>
</Activity>
<Activity id="119" ActivityType="5" flags="1" name="C131_cluster">
<Rect left="316" top="867" right="416" bottom="899"/>
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
<Activity id="120" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="866" right="284" bottom="898"/>
</Activity>
<Activity id="121" ActivityType="5" flags="0" name="C131_DDCU">
<Rect left="317" top="983" right="417" bottom="1015"/>
<SubProcesses>
<SubProcess id="C131_DDCU">
<Parameters>
<Parameter id="C131_PDCU_Window_Initialization_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DDCU"/>
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
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="982" right="283" bottom="1014"/>
</Activity>
<Activity id="123" ActivityType="5" flags="0" name="C131_EHPS">
<Rect left="319" top="1036" right="419" bottom="1068"/>
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
<Parameter id="C131_EHPS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_EHPS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EHPS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="124" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1036" right="284" bottom="1068"/>
</Activity>
<Activity id="125" ActivityType="5" flags="0" name="C131_PDCU">
<Rect left="319" top="1216" right="419" bottom="1248"/>
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
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1216" right="284" bottom="1248"/>
</Activity>
<Activity id="127" ActivityType="5" flags="0" name="rldcu">
<Rect left="319" top="1277" right="419" bottom="1309"/>
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
<Parameter id="C131_RLDCU_Check_The_Door_Window_Execute_Flag" value="fales"/>
<Parameter id="C131_RLDCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_RLDCU_VIN_Execute_Flag" value="fales"/>
<Parameter id="C131_RLDCU_EID_Execute_Flag" value="fales"/>
<Parameter id="C131_RLDCU_WD_Execute_Flag" value="fales"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="128" ActivityType="5" flags="0" name="RRDCU">
<Rect left="317" top="1335" right="417" bottom="1367"/>
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
<Activity id="129" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1276" right="284" bottom="1308"/>
</Activity>
<Activity id="130" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1335" right="283" bottom="1367"/>
</Activity>
<Activity id="133" ActivityType="5" flags="0" name="C131_4WD">
<Rect left="318" top="1738" right="418" bottom="1770"/>
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
<Activity id="134" ActivityType="5" flags="0" name="C131_MCU">
<Rect left="319" top="1798" right="419" bottom="1830"/>
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
<Activity id="135" ActivityType="5" flags="0" name="C131_Charger">
<Rect left="317" top="1856" right="417" bottom="1888"/>
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
<Activity id="136" ActivityType="5" flags="0" name="C131_OilPump">
<Rect left="316" top="1917" right="416" bottom="1949"/>
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
<Activity id="137" ActivityType="5" flags="0" name="C131_BMS">
<Rect left="314" top="1976" right="414" bottom="2008"/>
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
<Activity id="138" ActivityType="5" flags="0" name="C131_DCDC">
<Rect left="311" top="2033" right="411" bottom="2065"/>
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
<Activity id="139" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="315" top="2094" right="415" bottom="2126"/>
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
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="140" ActivityType="5" flags="0" name="C131_BSD">
<Rect left="313" top="2153" right="413" bottom="2185"/>
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
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="251" top="1798" right="283" bottom="1830"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="250" top="1856" right="282" bottom="1888"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="249" top="1916" right="281" bottom="1948"/>
</Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="248" top="1975" right="280" bottom="2007"/>
</Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="247" top="2034" right="279" bottom="2066"/>
</Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="246" top="2093" right="278" bottom="2125"/>
</Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="247" top="2155" right="279" bottom="2187"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="249" top="2299" right="281" bottom="2331"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="252" top="1737" right="284" bottom="1769"/>
</Activity>
<Activity id="154" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="214" top="2362" right="314" bottom="2394"/>
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
<Activity id="156" ActivityType="5" flags="0" name="C131_TBOX">
<Rect left="311" top="2229" right="411" bottom="2261"/>
<SubProcesses>
<SubProcess id="C131_TBOX">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_TBOX_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SN_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_TBOX_EID_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="248" top="2230" right="280" bottom="2262"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="普通节点">
<Rect left="317" top="84" right="417" bottom="116"/>
<Script>engine.println("DString_C131_Car_Tpye:"..DString_C131_Car_Tpye);</Script></Activity>
<Activity id="160" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="318" top="376" right="418" bottom="408"/>
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
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DVD_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_DVD_HVP_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="253" top="376" right="285" bottom="408"/>
</Activity>
<Activity id="188" ActivityType="5" flags="0" name="C131_EMS6_20">
<Rect left="120" top="694" right="220" bottom="726"/>
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
<Activity id="189" ActivityType="5" flags="0" name="C131_GATEWAY_19">
<Rect left="110" top="1154" right="210" bottom="1186"/>
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
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="12" type="0">
</Transition>
<Transition StartId="10" EndId="35" type="0">
</Transition>
<Transition StartId="12" EndId="78" type="0">
</Transition>
<Transition StartId="14" EndId="109" type="0">
</Transition>
<Transition StartId="15" EndId="120" type="0">
</Transition>
<Transition StartId="17" EndId="37" type="0">
</Transition>
<Transition StartId="18" EndId="115" type="0">
</Transition>
<Transition StartId="19" EndId="44" type="0">
</Transition>
<Transition StartId="20" EndId="52" type="0">
</Transition>
<Transition StartId="21" EndId="118" type="0">
</Transition>
<Transition StartId="25" EndId="113" type="0">
</Transition>
<Transition StartId="26" EndId="126" type="0">
</Transition>
<Transition StartId="27" EndId="111" type="0">
</Transition>
<Transition StartId="28" EndId="40" type="0">
</Transition>
<Transition StartId="29" EndId="46" type="0">
</Transition>
<Transition StartId="30" EndId="152" type="0">
</Transition>
<Transition StartId="33" EndId="158" type="0">
</Transition>
<Transition StartId="34" EndId="111" type="0">
</Transition>
<Transition StartId="34" EndId="27" type="1">
<Expression>DString_C131_Partnumber_PDC ~= ""</Expression></Transition>
<Transition StartId="35" EndId="25" type="1">
<Expression>DString_C131_Partnumber_LDW ~= ""</Expression></Transition>
<Transition StartId="35" EndId="113" type="0">
</Transition>
<Transition StartId="37" EndId="115" type="0">
</Transition>
<Transition StartId="37" EndId="18" type="1">
<Expression>DString_C131_Partnumber_BCM2 ~= ""</Expression></Transition>
<Transition StartId="38" EndId="44" type="0">
</Transition>
<Transition StartId="38" EndId="19" type="1">
<Expression>DString_C131_Partnumber_ESP ~= ""</Expression></Transition>
<Transition StartId="40" EndId="20" type="1">
<Expression>DString_C131_Partnumber_SDM ~= ""</Expression></Transition>
<Transition StartId="40" EndId="52" type="0">
</Transition>
<Transition StartId="44" EndId="26" type="1">
<Expression>DString_C131_Partnumber_GATEWAY~= "" and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="44" EndId="126" type="0">
</Transition>
<Transition StartId="44" EndId="189" type="1">
<Expression>DString_C131_Partnumber_GATEWAY~= "" and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="46" EndId="28" type="1">
<Expression>DString_C131_Partnumber_SAS ~= ""</Expression></Transition>
<Transition StartId="46" EndId="40" type="0">
</Transition>
<Transition StartId="47" EndId="122" type="0">
</Transition>
<Transition StartId="50" EndId="29" type="1">
<Expression>DString_C131_Partnumber_EPB ~= ""</Expression></Transition>
<Transition StartId="50" EndId="46" type="0">
</Transition>
<Transition StartId="51" EndId="30" type="1">
<Expression>DString_C131_Partnumber_PEPS ~= ""</Expression></Transition>
<Transition StartId="51" EndId="152" type="0">
</Transition>
<Transition StartId="52" EndId="87" type="1">
<Expression>DString_C131_Partnumber_PLGM ~= "" and  DString_C131_Partnumber_PLGM~="PLGM0_partnumber"</Expression></Transition>
<Transition StartId="52" EndId="89" type="0">
</Transition>
<Transition StartId="78" EndId="33" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="0">
</Transition>
<Transition StartId="88" EndId="51" type="0">
</Transition>
<Transition StartId="89" EndId="51" type="0">
</Transition>
<Transition StartId="89" EndId="88" type="1">
<Expression>DString_C131_Partnumber_SCM ~= "" and  DString_C131_Partnumber_SCM~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="107" EndId="14" type="1">
<Expression>DString_C131_Partnumber_AC ~=""</Expression></Transition>
<Transition StartId="107" EndId="109" type="0">
</Transition>
<Transition StartId="108" EndId="34" type="0">
</Transition>
<Transition StartId="109" EndId="108" type="1">
<Expression>DString_C131_Partnumber_DSCU ~=""</Expression></Transition>
<Transition StartId="109" EndId="34" type="0">
</Transition>
<Transition StartId="110" EndId="187" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="1">
<Expression>DString_C131_Partnumber_ACC ~=""</Expression></Transition>
<Transition StartId="111" EndId="187" type="0">
</Transition>
<Transition StartId="112" EndId="10" type="1">
<Expression>DString_C131_Partnumber_AFS ~=""</Expression></Transition>
<Transition StartId="112" EndId="35" type="0">
</Transition>
<Transition StartId="113" EndId="17" type="1">
<Expression>DString_C131_Partnumber_BCM1 ~= ""</Expression></Transition>
<Transition StartId="113" EndId="37" type="0">
</Transition>
<Transition StartId="114" EndId="15" type="1">
<Expression>DString_C131_Partnumber_AT ~= ""</Expression></Transition>
<Transition StartId="114" EndId="120" type="0">
</Transition>
<Transition StartId="115" EndId="118" type="0">
</Transition>
<Transition StartId="115" EndId="21" type="1">
<Expression>DString_C131_Partnumber_EMS ~="" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="115" EndId="188" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="116" EndId="114" type="0">
</Transition>
<Transition StartId="117" EndId="47" type="1">
<Expression>DString_C131_Partnumber_DCT ~= ""</Expression></Transition>
<Transition StartId="117" EndId="122" type="0">
</Transition>
<Transition StartId="118" EndId="116" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~=""</Expression></Transition>
<Transition StartId="118" EndId="114" type="0">
</Transition>
<Transition StartId="119" EndId="117" type="0">
</Transition>
<Transition StartId="120" EndId="119" type="1">
<Expression>DString_C131_Partnumber_IC ~=""</Expression></Transition>
<Transition StartId="120" EndId="117" type="0">
</Transition>
<Transition StartId="121" EndId="124" type="0">
</Transition>
<Transition StartId="122" EndId="121" type="1">
<Expression>DString_C131_Partnumber_DDCU~=""</Expression></Transition>
<Transition StartId="122" EndId="124" type="0">
</Transition>
<Transition StartId="123" EndId="38" type="0">
</Transition>
<Transition StartId="124" EndId="123" type="1">
<Expression>DString_C131_Partnumber_EHPS ~=""</Expression></Transition>
<Transition StartId="124" EndId="38" type="0">
</Transition>
<Transition StartId="125" EndId="129" type="0">
</Transition>
<Transition StartId="126" EndId="125" type="1">
<Expression>DString_C131_Partnumber_PDCU ~=""</Expression></Transition>
<Transition StartId="126" EndId="129" type="0">
</Transition>
<Transition StartId="127" EndId="130" type="0">
</Transition>
<Transition StartId="128" EndId="50" type="0">
</Transition>
<Transition StartId="129" EndId="127" type="1">
<Expression>DString_C131_Partnumber_RLDCU~=""</Expression></Transition>
<Transition StartId="129" EndId="130" type="0">
</Transition>
<Transition StartId="130" EndId="128" type="1">
<Expression>DString_C131_Partnumber_RRDCU ~=""</Expression></Transition>
<Transition StartId="130" EndId="50" type="0">
</Transition>
<Transition StartId="133" EndId="141" type="0">
</Transition>
<Transition StartId="134" EndId="142" type="0">
</Transition>
<Transition StartId="135" EndId="143" type="0">
</Transition>
<Transition StartId="136" EndId="144" type="0">
</Transition>
<Transition StartId="137" EndId="145" type="0">
</Transition>
<Transition StartId="138" EndId="146" type="0">
</Transition>
<Transition StartId="139" EndId="147" type="0">
</Transition>
<Transition StartId="140" EndId="157" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="141" EndId="134" type="1">
<Expression>DString_C131_Partnumber_MCU ~= "" and  DString_C131_Partnumber_MCU~="MCU00_partnumber"</Expression></Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="142" EndId="135" type="1">
<Expression>DString_C131_Partnumber_Charger ~= "" and  DString_C131_Partnumber_Charger~="CHG00_partnumber"</Expression></Transition>
<Transition StartId="143" EndId="144" type="0">
</Transition>
<Transition StartId="143" EndId="136" type="1">
<Expression>DString_C131_Partnumber_Oilpump ~= "" and  DString_C131_Partnumber_Oilpump~="OLP00_partnumber"</Expression></Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="144" EndId="137" type="1">
<Expression>DString_C131_Partnumber_BMS ~= "" and  DString_C131_Partnumber_BMS~="BMS00_partnumber" and DString_C131_Car_Tpye=="CH1MM21"</Expression></Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="145" EndId="138" type="1">
<Expression>DString_C131_Partnumber_DCDC ~= "" and  DString_C131_Partnumber_DCDC ~="DCDC0_partnumber"</Expression></Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="146" EndId="139" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="147" EndId="157" type="0">
</Transition>
<Transition StartId="147" EndId="140" type="1">
<Expression>DString_C131_Partnumber_BSD ~= "" and  DString_C131_Partnumber_BSD ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="148" EndId="154" type="0">
</Transition>
<Transition StartId="152" EndId="141" type="0">
</Transition>
<Transition StartId="152" EndId="133" type="1">
<Expression>DString_C131_Partnumber_FWD ~= "" and  DString_C131_Partnumber_FWD ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="154" EndId="1" type="0">
</Transition>
<Transition StartId="156" EndId="148" type="0">
</Transition>
<Transition StartId="157" EndId="156" type="1">
<Expression>DString_C131_Partnumber_TBOX ~= "" and  DString_C131_Partnumber_TBOX ~="TBOX0_partnumber"</Expression></Transition>
<Transition StartId="157" EndId="148" type="0">
</Transition>
<Transition StartId="158" EndId="107" type="0">
</Transition>
<Transition StartId="160" EndId="112" type="0">
</Transition>
<Transition StartId="187" EndId="160" type="1">
<Expression>DString_C131_Partnumber_DVD ~= "" and  DString_C131_Partnumber_DVD ~="DVD00_partnumber"</Expression></Transition>
<Transition StartId="187" EndId="112" type="0">
</Transition>
<Transition StartId="188" EndId="118" type="0">
</Transition>
<Transition StartId="189" EndId="126" type="0">
</Transition>
</Transitions>
</Process>

