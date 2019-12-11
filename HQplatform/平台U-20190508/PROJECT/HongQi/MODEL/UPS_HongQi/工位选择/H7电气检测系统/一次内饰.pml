<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="ObdHandle" type="8" dir="1" data="-1"/>
<Variable id="BuslogPath" type="8" dir="0" data="&quot;&quot;"/>
</Parameters>
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
<Rect left="130" top="64" right="230" bottom="96"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="429" top="1977" right="529" bottom="2009"/>
<Script></Script></End>
<Activities>
<Activity id="10" ActivityType="5" flags="0" name="C131_AFS">
<Rect left="218" top="235" right="318" bottom="267"/>
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
<Activity id="13" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="790" top="1784" right="890" bottom="1816"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if (0 == engine.TestResult) then
  --OK
  engine.DialogBackColor = "Green";
else
  --NOK
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end
</Script></Activity>
<Activity id="14" ActivityType="5" flags="0" name="C131_AC">
<Rect left="220" top="287" right="320" bottom="319"/>
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
<Rect left="219" top="347" right="319" bottom="379"/>
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
<Activity id="16" ActivityType="5" flags="0" name="C131_cluster">
<Rect left="220" top="403" right="320" bottom="435"/>
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
<Activity id="17" ActivityType="5" flags="0" name="C131_BCM1">
<Rect left="222" top="460" right="322" bottom="492"/>
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
<Parameter id="C131_BCM1_All_Inner_Lamps_Execute_Flag" value="true"/>
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
<Rect left="223" top="516" right="323" bottom="548"/>
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
<Rect left="224" top="635" right="324" bottom="667"/>
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
<Rect left="224" top="575" right="324" bottom="607"/>
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
<Rect left="229" top="697" right="329" bottom="729"/>
<SubProcesses>
<SubProcess id="C131_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Engine_Displacement" value="DString_C131_Engine_Displacement"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="false"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_ConfigInfo" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="23" ActivityType="5" flags="0" name="C131_EHPS">
<Rect left="224" top="811" right="324" bottom="843"/>
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
<Activity id="25" ActivityType="5" flags="0" name="C131_LDW">
<Rect left="222" top="870" right="322" bottom="902"/>
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
<Rect left="222" top="924" right="322" bottom="956"/>
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
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="true"/>
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
<Rect left="225" top="979" right="325" bottom="1011"/>
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
<Rect left="223" top="1038" right="323" bottom="1070"/>
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
<Parameter id="C131_SAS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_SAS_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="29" ActivityType="5" flags="0" name="C131_EPB">
<Rect left="221" top="1103" right="321" bottom="1135"/>
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
<Parameter id="VMTLOC" value="&quot;FIRST_TRIM&quot;"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="C131_PEPS">
<Rect left="223" top="1163" right="323" bottom="1195"/>
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
<Parameter id="C131_PEPS_CID_Execute_Flag" value="true"/>
<Parameter id="C131_PEPS_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_EID_Execute_Flag" value="false"/>
<Parameter id="C131_PEPS_WD_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="34" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="235" right="193" bottom="267"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="289" right="193" bottom="321"/>
</Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="403" right="193" bottom="435"/>
</Activity>
<Activity id="37" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="461" right="193" bottom="493"/>
</Activity>
<Activity id="38" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="517" right="193" bottom="549"/>
</Activity>
<Activity id="39" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="347" right="193" bottom="379"/>
</Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="575" right="193" bottom="607"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="634" right="193" bottom="666"/>
</Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="163" top="697" right="195" bottom="729"/>
</Activity>
<Activity id="43" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="813" right="193" bottom="845"/>
</Activity>
<Activity id="44" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="871" right="193" bottom="903"/>
</Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="926" right="193" bottom="958"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="980" right="193" bottom="1012"/>
</Activity>
<Activity id="47" ActivityType="5" flags="0" name="C131_DCT">
<Rect left="224" top="752" right="324" bottom="784"/>
<SubProcesses>
<SubProcess id="C131_DCT">
<Parameters>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCT_Shift_Lock_Relay_Execute_Flag" value="false"/>
<Parameter id="C131_DCT_Shift_LV_Signal_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="&quot;TR1&quot;"/>
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
<Activity id="48" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="753" right="193" bottom="785"/>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1039" right="193" bottom="1071"/>
</Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1103" right="194" bottom="1135"/>
</Activity>
<Activity id="52" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1164" right="194" bottom="1196"/>
</Activity>
<Activity id="72" ActivityType="5" flags="0" name="immobilizer_key1">
<Rect left="520" top="114" right="620" bottom="146"/>
<SubProcesses>
<SubProcess id="Immobilizer_Key1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="76" ActivityType="5" flags="0" name="immobilizer_key2">
<Rect left="390" top="114" right="490" bottom="146"/>
<SubProcesses>
<SubProcess id="Immobilizer_Key2">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="rematch_firkey" value="rematch_firkey" ret="rematch_firkey"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="80" ActivityType="5" flags="0" name="force_power_on">
<Rect left="130" top="114" right="230" bottom="146"/>
<SubProcesses>
<SubProcess id="Force_Power_On">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="83" ActivityType="5" flags="0" name="force_power_off">
<Rect left="279" top="1977" right="379" bottom="2009"/>
<SubProcesses>
<SubProcess id="Force_Power_Off">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="86" ActivityType="3" flags="0" name="整车上电">
<Rect left="260" top="114" right="360" bottom="146"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="整车上电"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="开始上电"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="87" ActivityType="5" flags="0" name="c131_PLGM">
<Rect left="225" top="1216" right="325" bottom="1248"/>
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
<Rect left="223" top="1281" right="323" bottom="1313"/>
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
<Rect left="162" top="1217" right="194" bottom="1249"/>
</Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1281" right="194" bottom="1313"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="进行钥匙匹配">
<Rect left="650" top="114" right="750" bottom="146"/>
<Line1Text Enable="1" Text="是否进行钥匙匹配？"/>
<ButtonLText Enable="1" Text="放弃匹配"/>
<ButtonRText Enable="1" Text="确认匹配"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="499" top="177" right="531" bottom="209"/>
</Activity>
<Activity id="108" ActivityType="5" flags="0" name="C131_4WD">
<Rect left="225" top="1338" right="325" bottom="1370"/>
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
<Activity id="109" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1752" right="194" bottom="1784"/>
</Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1339" right="193" bottom="1371"/>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1396" right="193" bottom="1428"/>
</Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1454" right="194" bottom="1486"/>
</Activity>
<Activity id="113" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1513" right="194" bottom="1545"/>
</Activity>
<Activity id="114" ActivityType="5" flags="0" name="C131_MCU">
<Rect left="223" top="1395" right="323" bottom="1427"/>
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
<Activity id="115" ActivityType="5" flags="0" name="C131_Charger">
<Rect left="224" top="1455" right="324" bottom="1487"/>
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
<Activity id="116" ActivityType="5" flags="0" name="C131_OilPump">
<Rect left="222" top="1513" right="322" bottom="1545"/>
<SubProcesses>
<SubProcess id="C131_OilPump">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_Oilpump "/>
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
<Activity id="117" ActivityType="5" flags="0" name="C131_BMS">
<Rect left="223" top="1569" right="323" bottom="1601"/>
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
<Activity id="118" ActivityType="5" flags="0" name="C131_DCDC">
<Rect left="222" top="1627" right="322" bottom="1659"/>
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
<Activity id="119" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="225" top="1691" right="325" bottom="1723"/>
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
<Parameter id="C131_HCU_Read_BMS_Info_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Open_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Close_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SPEC_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="120" ActivityType="5" flags="0" name="C131_BSD">
<Rect left="225" top="1751" right="325" bottom="1783"/>
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
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1570" right="193" bottom="1602"/>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1629" right="193" bottom="1661"/>
</Activity>
<Activity id="123" ActivityType="4" flags="0" name="路由节点">
<Rect left="162" top="1692" right="194" bottom="1724"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="整车下电">
<Rect left="429" top="1877" right="529" bottom="1909"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="整车下电"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="下电"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="132" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="119" top="1977" right="219" bottom="2009"/>
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
<Activity id="133" ActivityType="3" flags="0" name="打开双闪">
<Rect left="650" top="64" right="750" bottom="96"/>
<Line1Text Enable="1" Text="请打开双闪"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="134" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1394" right="376" bottom="1426"/>
</Activity>
<Activity id="135" ActivityType="5" flags="0" name="C131_TBOX">
<Rect left="225" top="1814" right="325" bottom="1846"/>
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
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="161" top="1816" right="193" bottom="1848"/>
</Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="423" top="181" right="455" bottom="213"/>
</Activity>
<Activity id="139" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="225" top="1891" right="325" bottom="1923"/>
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
<Parameter id="C131_DVD_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DVD_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_HVP_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="140" ActivityType="4" flags="0" name="路由节点">
<Rect left="160" top="1893" right="192" bottom="1925"/>
</Activity>
<Activity id="142" ActivityType="5" flags="0" name="读配置码">
<Rect left="410" top="64" right="510" bottom="96"/>
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
<Activity id="143" ActivityType="3" flags="0" name="变量设置">
<Rect left="270" top="64" right="370" bottom="96"/>
<Script>DString_C131_Car_Tpye = engine.CarType
DString_Write_VIN = engine.VIN
VMTLOC = "TR1"
print("一次内饰H7车型:"..DString_C131_Car_Tpye)
print("一次内饰H7-VIN:"..DString_Write_VIN)</Script></Activity>
<Activity id="144" ActivityType="5" flags="0" name="C131_EMS6_20">
<Rect left="39" top="697" right="139" bottom="729"/>
<SubProcesses>
<SubProcess id="C131_EMS6_20">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_EMS"/>
<Parameter id="C131_EMS_After_Roller_Check_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_EMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_WD_Execute_Flag" value="true"/>
<Parameter id="C131_EMS_Sensor_Test_Execute_Flag" value="false"/>
<Parameter id="C131_EMS_Actuator_Test_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="145" ActivityType="5" flags="0" name="C131_GATEWAY_19">
<Rect left="39" top="927" right="139" bottom="959"/>
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
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="757" right="495" bottom="789"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="19年型V6不检EMS">
<Rect left="349" top="697" right="449" bottom="729"/>
<Script></Script></Activity>
<Activity id="148" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="127" top="168" right="227" bottom="200"/>
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
<Transition StartId="0" EndId="143" type="0">
</Transition>
<Transition StartId="10" EndId="34" type="0">
</Transition>
<Transition StartId="14" EndId="35" type="0">
</Transition>
<Transition StartId="15" EndId="39" type="0">
</Transition>
<Transition StartId="16" EndId="36" type="0">
</Transition>
<Transition StartId="17" EndId="37" type="0">
</Transition>
<Transition StartId="18" EndId="38" type="0">
</Transition>
<Transition StartId="19" EndId="41" type="0">
</Transition>
<Transition StartId="20" EndId="40" type="0">
</Transition>
<Transition StartId="21" EndId="42" type="0">
</Transition>
<Transition StartId="23" EndId="43" type="0">
</Transition>
<Transition StartId="25" EndId="44" type="0">
</Transition>
<Transition StartId="26" EndId="45" type="0">
</Transition>
<Transition StartId="27" EndId="46" type="0">
</Transition>
<Transition StartId="28" EndId="50" type="0">
</Transition>
<Transition StartId="29" EndId="51" type="0">
</Transition>
<Transition StartId="30" EndId="52" type="0">
</Transition>
<Transition StartId="34" EndId="14" type="1">
<Expression>DString_C131_Partnumber_AC ~="" and DString_C131_Partnumber_AC ~= nil</Expression></Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="15" type="1">
<Expression>DString_C131_Partnumber_AT ~= "" and DString_C131_Partnumber_AT ~= nil</Expression></Transition>
<Transition StartId="35" EndId="39" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="36" EndId="17" type="1">
<Expression>DString_C131_Partnumber_BCM1 ~= ""  and DString_C131_Partnumber_BCM1 ~= nil</Expression></Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="37" EndId="18" type="1">
<Expression>DString_C131_Partnumber_BCM2 ~= "" and DString_C131_Partnumber_BCM2 ~= nil</Expression></Transition>
<Transition StartId="38" EndId="40" type="0">
</Transition>
<Transition StartId="38" EndId="20" type="1">
<Expression>DString_C131_Partnumber_SDM ~= ""  and DString_C131_Partnumber_SDM ~= nil</Expression></Transition>
<Transition StartId="39" EndId="36" type="0">
</Transition>
<Transition StartId="39" EndId="16" type="1">
<Expression>DString_C131_Partnumber_IC ~= "" and DString_C131_Partnumber_IC ~= nil</Expression></Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="40" EndId="19" type="1">
<Expression>DString_C131_Partnumber_ESP ~= ""  and DString_C131_Partnumber_ESP ~= nil</Expression></Transition>
<Transition StartId="41" EndId="42" type="0">
</Transition>
<Transition StartId="41" EndId="21" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and DString_C131_Partnumber_EMS ~= nil and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye) == false and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="41" EndId="144" type="1">
<Expression>DString_C131_Partnumber_EMS ~= "" and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="42" EndId="48" type="0">
</Transition>
<Transition StartId="42" EndId="47" type="1">
<Expression>DString_C131_Partnumber_DCT ~= "" and DString_C131_Partnumber_DCT ~= nil</Expression></Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="43" EndId="25" type="1">
<Expression>DString_C131_Partnumber_LDW ~= ""  and DString_C131_Partnumber_LDW ~= nil</Expression></Transition>
<Transition StartId="44" EndId="26" type="1">
<Expression>DString_C131_Partnumber_GATEWAY~= ""  and DString_C131_Partnumber_GATEWAY~= nil and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="44" EndId="145" type="1">
<Expression>DString_C131_Partnumber_GATEWAY~= "" and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="45" EndId="27" type="1">
<Expression>DString_C131_Partnumber_PDC ~= ""  and DString_C131_Partnumber_PDC ~= nil</Expression></Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="28" type="1">
<Expression>DString_C131_Partnumber_SAS ~= "" and DString_C131_Partnumber_SAS ~= nil</Expression></Transition>
<Transition StartId="46" EndId="50" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="43" type="0">
</Transition>
<Transition StartId="50" EndId="29" type="1">
<Expression>DString_C131_Partnumber_EPB ~= ""  and DString_C131_Partnumber_EPB ~= nil</Expression></Transition>
<Transition StartId="50" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="30" type="1">
<Expression>DString_C131_Partnumber_PEPS ~= ""  and DString_C131_Partnumber_PEPS ~= nil</Expression></Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="89" type="0">
</Transition>
<Transition StartId="52" EndId="87" type="1">
<Expression>DString_C131_Partnumber_PLGM ~= "" and  DString_C131_Partnumber_PLGM~="PLGM0_partnumber"   and DString_C131_Partnumber_PLGM ~= nil</Expression></Transition>
<Transition StartId="72" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="86" type="0">
</Transition>
<Transition StartId="76" EndId="137" type="1">
<Expression>rematch_firkey==1</Expression></Transition>
<Transition StartId="80" EndId="148" type="0">
</Transition>
<Transition StartId="83" EndId="1" type="0">
</Transition>
<Transition StartId="86" EndId="80" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="0">
</Transition>
<Transition StartId="88" EndId="90" type="0">
</Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="89" EndId="88" type="1">
<Expression>DString_C131_Partnumber_SCM ~= "" and  DString_C131_Partnumber_SCM~="SCM00_partnumber"  and DString_C131_Partnumber_SCM ~= nil</Expression></Transition>
<Transition StartId="90" EndId="110" type="0">
</Transition>
<Transition StartId="90" EndId="108" type="1">
<Expression>DString_C131_Partnumber_FWD ~= "" and  DString_C131_Partnumber_FWD ~="FWD00_partnumber"  and DString_C131_Partnumber_FWD ~= nil</Expression></Transition>
<Transition StartId="99" EndId="102" type="5">
</Transition>
<Transition StartId="99" EndId="72" type="0">
</Transition>
<Transition StartId="102" EndId="86" type="0">
</Transition>
<Transition StartId="108" EndId="110" type="0">
</Transition>
<Transition StartId="109" EndId="136" type="0">
</Transition>
<Transition StartId="109" EndId="135" type="1">
<Expression>DString_C131_Partnumber_TBOX ~= "" and  DString_C131_Partnumber_TBOX ~="TBOX0_partnumber"  and DString_C131_Partnumber_TBOX ~= nil</Expression></Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="111" EndId="115" type="1">
<Expression>DString_C131_Partnumber_Charger ~= "" and  DString_C131_Partnumber_Charger ~="CHG00_partnumber"  and DString_C131_Partnumber_Charger ~= nil</Expression></Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="112" EndId="116" type="1">
<Expression>DString_C131_Partnumber_Oilpump ~= "" and  DString_C131_Partnumber_Oilpump~="OLP00_partnumber"  and DString_C131_Partnumber_Oilpump ~= nil</Expression></Transition>
<Transition StartId="113" EndId="121" type="0">
</Transition>
<Transition StartId="113" EndId="117" type="1">
<Expression>DString_C131_Partnumber_BMS ~= "" and  DString_C131_Partnumber_BMS~="BMS00_partnumber" and DString_C131_Car_Tpye~="CH1LM21" and DString_C131_Car_Tpye~="CH1LM11"  and DString_C131_Partnumber_BMS ~= nil</Expression></Transition>
<Transition StartId="115" EndId="112" type="0">
</Transition>
<Transition StartId="116" EndId="113" type="0">
</Transition>
<Transition StartId="117" EndId="121" type="0">
</Transition>
<Transition StartId="118" EndId="122" type="0">
</Transition>
<Transition StartId="119" EndId="123" type="0">
</Transition>
<Transition StartId="120" EndId="109" type="0">
</Transition>
<Transition StartId="121" EndId="122" type="0">
</Transition>
<Transition StartId="121" EndId="118" type="1">
<Expression>DString_C131_Partnumber_DCDC ~= "" and  DString_C131_Partnumber_DCDC ~="DCDC0_partnumber"  and DString_C131_Partnumber_DCDC ~= nil</Expression></Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="122" EndId="119" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"  and DString_C131_Partnumber_HCU ~= nil</Expression></Transition>
<Transition StartId="123" EndId="120" type="1">
<Expression>DString_C131_Partnumber_BSD ~= "" and  DString_C131_Partnumber_BSD ~="BSD00_partnumber"  and DString_C131_Partnumber_BSD ~= nil</Expression></Transition>
<Transition StartId="123" EndId="109" type="0">
</Transition>
<Transition StartId="124" EndId="83" type="0">
</Transition>
<Transition StartId="132" EndId="83" type="0">
</Transition>
<Transition StartId="133" EndId="99" type="0">
</Transition>
<Transition StartId="134" EndId="114" type="1">
<Expression>DString_C131_Partnumber_MCU ~= "" and  DString_C131_Partnumber_MCU~="MCU00_partnumber"</Expression></Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="140" type="0">
</Transition>
<Transition StartId="136" EndId="139" type="1">
<Expression>DString_C131_Partnumber_DVD ~= "" and  DString_C131_Partnumber_DVD ~="DVD00_partnumber"  and DString_C131_Partnumber_DVD ~= nil</Expression></Transition>
<Transition StartId="137" EndId="72" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="132" type="0">
</Transition>
<Transition StartId="142" EndId="133" type="0">
</Transition>
<Transition StartId="143" EndId="142" type="0">
</Transition>
<Transition StartId="144" EndId="42" type="0">
</Transition>
<Transition StartId="145" EndId="45" type="0">
</Transition>
<Transition StartId="146" EndId="23" type="1">
<Expression>DString_C131_Partnumber_EHPS ~= "" and DString_C131_Partnumber_EHPS ~= nil</Expression></Transition>
<Transition StartId="148" EndId="34" type="0">
</Transition>
<Transition StartId="148" EndId="10" type="1">
<Expression>DString_C131_Partnumber_AFS ~="" and DString_C131_Partnumber_AFS ~= nil</Expression></Transition>
</Transitions>
</Process>

