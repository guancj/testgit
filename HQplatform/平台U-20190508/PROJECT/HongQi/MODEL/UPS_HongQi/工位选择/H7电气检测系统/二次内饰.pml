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
<Rect left="240" top="74" right="340" bottom="106"/>
<Script>DString_C131_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN
VMTLOC = "TR2"

print("二次内饰H7_CarType:"..DString_C131_Car_Type)
print("二次内饰H7_VIN:"..DString_Write_VIN)</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="2784" right="400" bottom="2816"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="9" ActivityType="5" flags="0" name="C131_AFS">
<Rect left="410" top="764" right="510" bottom="796"/>
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
<Activity id="11" ActivityType="5" flags="0" name="C131_LDW">
<Rect left="410" top="824" right="510" bottom="856"/>
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
<Activity id="13" ActivityType="5" flags="0" name="C131_cluster">
<Rect left="410" top="934" right="510" bottom="966"/>
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
<Activity id="14" ActivityType="5" flags="0" name="C131_EPB">
<Rect left="410" top="1324" right="510" bottom="1356"/>
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
<Activity id="15" ActivityType="5" flags="0" name="C131_EHPS">
<Rect left="410" top="1044" right="510" bottom="1076"/>
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
<Activity id="16" ActivityType="5" flags="0" name="C131_ESP">
<Rect left="410" top="1104" right="510" bottom="1136"/>
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
<Activity id="17" ActivityType="5" flags="0" name="C131_PDC">
<Rect left="410" top="1164" right="510" bottom="1196"/>
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
<Activity id="18" ActivityType="5" flags="0" name="C131_AT">
<Rect left="410" top="1224" right="510" bottom="1256"/>
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
<Activity id="19" ActivityType="5" flags="0" name="C131_DSCU">
<Rect left="410" top="1274" right="510" bottom="1306"/>
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
<Activity id="20" ActivityType="5" flags="0" name="C131_DDCU">
<Rect left="410" top="1394" right="510" bottom="1426"/>
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
<Activity id="23" ActivityType="5" flags="0" name="C131_PDCU">
<Rect left="410" top="1564" right="510" bottom="1596"/>
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
<Activity id="28" ActivityType="5" flags="0" name="C131_BCM2error">
<Rect left="410" top="1804" right="510" bottom="1836"/>
<SubProcesses>
<SubProcess id="C131_BCM2">
<Parameters>
<Parameter id="C131_BCM2_Brake_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Rear_Fog_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Reverse_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_License_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HM_Brake_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Turn_Lamps_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_Truck_Lamps_Execute_Flag" value="true"/>
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
<Activity id="33" ActivityType="5" flags="0" name="sdm">
<Rect left="410" top="1504" right="510" bottom="1536"/>
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
<Activity id="34" ActivityType="5" flags="0" name="rldcu">
<Rect left="410" top="1454" right="510" bottom="1486"/>
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
<Activity id="35" ActivityType="5" flags="0" name="BCM1">
<Rect left="410" top="1864" right="510" bottom="1896"/>
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
<Activity id="39" ActivityType="5" flags="0" name="C131_ARMREST">
<Rect left="410" top="1684" right="510" bottom="1716"/>
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
<Activity id="42" ActivityType="5" flags="0" name="RRDCU">
<Rect left="410" top="1754" right="510" bottom="1786"/>
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
<Activity id="47" ActivityType="5" flags="0" name="peps">
<Rect left="410" top="2554" right="510" bottom="2586"/>
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
<Activity id="53" ActivityType="5" flags="1" name="C131_EMS">
<Rect left="410" top="714" right="510" bottom="746"/>
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
<Activity id="54" ActivityType="5" flags="0" name="C131_DCT">
<Rect left="410" top="984" right="510" bottom="1016"/>
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
<Activity id="55" ActivityType="5" flags="0" name="c131_gateway">
<Rect left="410" top="1624" right="510" bottom="1656"/>
<SubProcesses>
<SubProcess id="C131_GATEWAY">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="C131_GATEWAY_Voltage_Of_Piles_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_Voltage_Generate_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_Current_Generate_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_Heating_Check_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST "/>
<Parameter id="C131_GATEWAY_Current_Range_Execute_Flag" value="false"/>
<Parameter id="DString_C131_HorLConfig" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_EID_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_WD_Execute_Flag" value="true"/>
<Parameter id="C131_GATEWAY_EBS_Check_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_BattConfig" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_DVDConfig" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="C131_GATEWAY_Batt_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="514" right="366" bottom="546"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="564" right="366" bottom="596"/>
</Activity>
<Activity id="62" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="714" right="366" bottom="746"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="764" right="366" bottom="796"/>
</Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="824" right="366" bottom="856"/>
</Activity>
<Activity id="67" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="874" right="366" bottom="906"/>
</Activity>
<Activity id="71" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="934" right="366" bottom="966"/>
</Activity>
<Activity id="73" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="984" right="366" bottom="1016"/>
</Activity>
<Activity id="75" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1044" right="366" bottom="1076"/>
</Activity>
<Activity id="76" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1104" right="366" bottom="1136"/>
</Activity>
<Activity id="81" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1164" right="366" bottom="1196"/>
</Activity>
<Activity id="83" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1224" right="366" bottom="1256"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1274" right="366" bottom="1306"/>
</Activity>
<Activity id="86" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1394" right="366" bottom="1426"/>
</Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1454" right="366" bottom="1486"/>
</Activity>
<Activity id="92" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1504" right="366" bottom="1536"/>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1564" right="366" bottom="1596"/>
</Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1624" right="366" bottom="1656"/>
</Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1684" right="366" bottom="1716"/>
</Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1754" right="366" bottom="1786"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1804" right="366" bottom="1836"/>
</Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2554" right="366" bottom="2586"/>
</Activity>
<Activity id="117" ActivityType="5" flags="0" name="immo_escl">
<Rect left="410" top="354" right="510" bottom="386"/>
<SubProcesses>
<SubProcess id="IMMO_ESCL">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="118" ActivityType="5" flags="0" name="immo_ems">
<Rect left="410" top="404" right="510" bottom="436"/>
<SubProcesses>
<SubProcess id="IMMO_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="540" top="2704" right="640" bottom="2736"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>if (0 == engine.TestResult) then
  engine.DialogBackColor = "Green";
else
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end
</Script></Activity>
<Activity id="123" ActivityType="5" flags="0" name="c131_sas">
<Rect left="410" top="874" right="510" bottom="906"/>
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
<Activity id="125" ActivityType="5" flags="0" name="c131_ACC">
<Rect left="410" top="564" right="510" bottom="596"/>
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
<Activity id="132" ActivityType="5" flags="0" name="c131_PLGM">
<Rect left="410" top="1914" right="510" bottom="1946"/>
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
<Activity id="133" ActivityType="5" flags="0" name="c131_SCM">
<Rect left="410" top="1974" right="510" bottom="2006"/>
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
<Activity id="134" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1914" right="366" bottom="1946"/>
</Activity>
<Activity id="135" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1974" right="366" bottom="2006"/>
</Activity>
<Activity id="145" ActivityType="5" flags="0" name="C131_4WD">
<Rect left="410" top="2034" right="510" bottom="2066"/>
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
<Activity id="146" ActivityType="5" flags="0" name="C131_MCU">
<Rect left="410" top="2094" right="510" bottom="2126"/>
<SubProcesses>
<SubProcess id="C131_MCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_MCU"/>
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
<Parameter id="C131_MCU_SPEC_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="147" ActivityType="5" flags="0" name="C131_Charger">
<Rect left="410" top="2144" right="510" bottom="2176"/>
<SubProcesses>
<SubProcess id="C131_Charger">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_Charger_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_SN_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_EID_Execute_Flag" value="true"/>
<Parameter id="C131_Charger_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="148" ActivityType="5" flags="0" name="C131_OilPump">
<Rect left="410" top="2204" right="510" bottom="2236"/>
<SubProcesses>
<SubProcess id="C131_OilPump">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_OilPump_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_SN_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_EID_Execute_Flag" value="true"/>
<Parameter id="C131_OilPump_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_OilPump_SpeedControl_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="149" ActivityType="5" flags="0" name="C131_BMS">
<Rect left="410" top="2254" right="510" bottom="2286"/>
<SubProcesses>
<SubProcess id="C131_BMS">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_BMS_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_EID_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_BMS_OpenAllRelay_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_LVBatteryVoltage_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_SlaveSoftwareVersion_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_BatteryStatus_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_BatteryPackVoltage_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_ModuleTempMax_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_ModuleTempMin_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CellVoltageMin_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CellVoltageMax_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_BatteryPackCurrent_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CheckMainPositiveRelay_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CheckMainNegativeRelay_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CheckPreChargeRelay_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CheckFANRelayControl_Execute_Flag" value="true"/>
<Parameter id="C131_BMS_CheckFANPWMControl_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="150" ActivityType="5" flags="0" name="C131_DCDC">
<Rect left="410" top="2314" right="510" bottom="2346"/>
<SubProcesses>
<SubProcess id="C131_DCDC">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_DCDC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DCDC_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_MCU_CheckDCDC_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="151" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="410" top="2374" right="510" bottom="2406"/>
<SubProcesses>
<SubProcess id="C131_HCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_HCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="C131_HCU_PowerOff_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_ReO_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_IGBT_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_MG_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_HN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Read_BMS_Info_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Open_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Close_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SPEC_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="152" ActivityType="5" flags="0" name="C131_BSD">
<Rect left="410" top="2424" right="510" bottom="2456"/>
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
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2034" right="366" bottom="2066"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2094" right="366" bottom="2126"/>
</Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2144" right="366" bottom="2176"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2204" right="366" bottom="2236"/>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2254" right="366" bottom="2286"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2314" right="366" bottom="2346"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2374" right="366" bottom="2406"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2424" right="366" bottom="2456"/>
</Activity>
<Activity id="161" ActivityType="5" flags="0" name="immo_hcu">
<Rect left="410" top="464" right="510" bottom="496"/>
<SubProcesses>
<SubProcess id="IMMO_HCU">
<Parameters>
<Parameter id="read_value1" value="read_value1"/>
<Parameter id="read_value2" value="read_value2"/>
<Parameter id="read_value3" value="read_value3"/>
<Parameter id="read_value4" value="read_value4"/>
<Parameter id="read_value5" value="read_value5"/>
<Parameter id="read_value6" value="read_value6"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="354" right="366" bottom="386"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="404" right="366" bottom="436"/>
</Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="464" right="366" bottom="496"/>
</Activity>
<Activity id="165" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="300" top="2614" right="400" bottom="2646"/>
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
<Activity id="168" ActivityType="5" flags="0" name="C131_TBOX">
<Rect left="410" top="2494" right="510" bottom="2526"/>
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
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Type"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="2494" right="366" bottom="2526"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1864" right="366" bottom="1896"/>
</Activity>
<Activity id="176" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="1324" right="366" bottom="1356"/>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="634" right="366" bottom="666"/>
</Activity>
<Activity id="188" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="410" top="514" right="510" bottom="546"/>
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
<Activity id="189" ActivityType="5" flags="0" name="AC">
<Rect left="410" top="634" right="510" bottom="666"/>
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
<Activity id="190" ActivityType="5" flags="0" name="读配置文件">
<Rect left="240" top="134" right="340" bottom="166"/>
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
<Activity id="191" ActivityType="3" flags="0" name="打印变量">
<Rect left="240" top="194" right="340" bottom="226"/>
<Script>print("#DString_C131_VariCoding_EMS:"..DString_C131_VariCoding_EMS)
print("#DString_C131_Partnumber_EMS:"..DString_C131_Partnumber_EMS)
print("#DString_C131_Engine_Displacement:"..DString_C131_Engine_Displacement)
print("#DString_C131_Car_Tpye:"..DString_C131_Car_Type)
print("#DString_C131_Configinfo_EMS:"..DString_C131_Configinfo_EMS)

</Script></Activity>
<Activity id="192" ActivityType="3" flags="0" name="请下电">
<Rect left="410" top="194" right="510" bottom="226"/>
<Line1Text Enable="1" Text="请确保下电"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="等待30秒">
<Rect left="410" top="244" right="510" bottom="276"/>
<Line1Text Enable="1" Text="30秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=30,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="请上电">
<Rect left="410" top="294" right="510" bottom="326"/>
<Line1Text Enable="1" Text="请上电，开始检测"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="195" ActivityType="5" flags="0" name="C131_BCM1_Over">
<Rect left="630" top="2614" right="730" bottom="2646"/>
<SubProcesses>
<SubProcess id="C131_BCM1_Over">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="190" type="0">
</Transition>
<Transition StartId="9" EndId="64" type="0">
</Transition>
<Transition StartId="11" EndId="66" type="0">
</Transition>
<Transition StartId="13" EndId="71" type="0">
</Transition>
<Transition StartId="14" EndId="176" type="0">
</Transition>
<Transition StartId="15" EndId="75" type="0">
</Transition>
<Transition StartId="16" EndId="76" type="0">
</Transition>
<Transition StartId="17" EndId="81" type="0">
</Transition>
<Transition StartId="18" EndId="83" type="0">
</Transition>
<Transition StartId="19" EndId="85" type="0">
</Transition>
<Transition StartId="20" EndId="86" type="0">
</Transition>
<Transition StartId="23" EndId="94" type="0">
</Transition>
<Transition StartId="28" EndId="100" type="0">
</Transition>
<Transition StartId="33" EndId="92" type="0">
</Transition>
<Transition StartId="34" EndId="89" type="0">
</Transition>
<Transition StartId="35" EndId="175" type="0">
</Transition>
<Transition StartId="39" EndId="98" type="0">
</Transition>
<Transition StartId="42" EndId="99" type="0">
</Transition>
<Transition StartId="47" EndId="106" type="0">
</Transition>
<Transition StartId="53" EndId="62" type="0">
</Transition>
<Transition StartId="54" EndId="73" type="0">
</Transition>
<Transition StartId="55" EndId="96" type="0">
</Transition>
<Transition StartId="58" EndId="125" type="1">
<Expression>DString_C131_Partnumber_ACC ~=""</Expression></Transition>
<Transition StartId="58" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="187" type="0">
</Transition>
<Transition StartId="60" EndId="189" type="1">
<Expression>DString_C131_Partnumber_AC ~=""</Expression></Transition>
<Transition StartId="62" EndId="9" type="1">
<Expression>DString_C131_Partnumber_AFS ~=""</Expression></Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="11" type="1">
<Expression>DString_C131_Partnumber_LDW ~=""</Expression></Transition>
<Transition StartId="64" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="66" EndId="123" type="1">
<Expression>DString_C131_Partnumber_SAS ~=""</Expression></Transition>
<Transition StartId="67" EndId="13" type="1">
<Expression>DString_C131_Partnumber_IC ~=""</Expression></Transition>
<Transition StartId="67" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="73" type="0">
</Transition>
<Transition StartId="71" EndId="54" type="1">
<Expression>DString_C131_Partnumber_DCT ~=""</Expression></Transition>
<Transition StartId="73" EndId="75" type="0">
</Transition>
<Transition StartId="73" EndId="15" type="1">
<Expression>DString_C131_Partnumber_EHPS ~=""</Expression></Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="75" EndId="16" type="1">
<Expression>DString_C131_Partnumber_ESP ~=""</Expression></Transition>
<Transition StartId="76" EndId="17" type="1">
<Expression>DString_C131_Partnumber_PDC~=""</Expression></Transition>
<Transition StartId="76" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="83" type="0">
</Transition>
<Transition StartId="81" EndId="18" type="1">
<Expression>DString_C131_Partnumber_AT~=""</Expression></Transition>
<Transition StartId="83" EndId="19" type="1">
<Expression>DString_C131_Partnumber_DSCU~=""</Expression></Transition>
<Transition StartId="83" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="176" type="0">
</Transition>
<Transition StartId="85" EndId="14" type="1">
<Expression>DString_C131_Partnumber_EPB ~=""</Expression></Transition>
<Transition StartId="86" EndId="34" type="1">
<Expression>DString_C131_Partnumber_RLDCU~=""</Expression></Transition>
<Transition StartId="86" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="33" type="1">
<Expression>DString_C131_Partnumber_SDM ~=""</Expression></Transition>
<Transition StartId="89" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="23" type="1">
<Expression>DString_C131_Partnumber_PDCU ~=""</Expression></Transition>
<Transition StartId="92" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="55" type="1">
<Expression>DString_C131_Partnumber_GATEWAY ~=""</Expression></Transition>
<Transition StartId="94" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="39" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~=""</Expression></Transition>
<Transition StartId="96" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="42" type="1">
<Expression>DString_C131_Partnumber_RRDCU ~=""</Expression></Transition>
<Transition StartId="98" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="99" EndId="28" type="1">
<Expression>DString_C131_Partnumber_BCM2 ~=""</Expression></Transition>
<Transition StartId="100" EndId="175" type="0">
</Transition>
<Transition StartId="100" EndId="35" type="1">
<Expression>DString_C131_Partnumber_BCM1 ~=""</Expression></Transition>
<Transition StartId="106" EndId="165" type="0">
</Transition>
<Transition StartId="117" EndId="162" type="0">
</Transition>
<Transition StartId="118" EndId="163" type="0">
</Transition>
<Transition StartId="123" EndId="67" type="0">
</Transition>
<Transition StartId="125" EndId="60" type="0">
</Transition>
<Transition StartId="132" EndId="134" type="0">
</Transition>
<Transition StartId="133" EndId="135" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="134" EndId="133" type="1">
<Expression>DString_C131_Partnumber_SCM ~= "" and  DString_C131_Partnumber_SCM~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="135" EndId="153" type="0">
</Transition>
<Transition StartId="135" EndId="145" type="1">
<Expression>DString_C131_Partnumber_FWD ~= "" and  DString_C131_Partnumber_FWD ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="145" EndId="153" type="0">
</Transition>
<Transition StartId="146" EndId="154" type="0">
</Transition>
<Transition StartId="147" EndId="155" type="0">
</Transition>
<Transition StartId="148" EndId="156" type="0">
</Transition>
<Transition StartId="149" EndId="157" type="0">
</Transition>
<Transition StartId="150" EndId="158" type="0">
</Transition>
<Transition StartId="151" EndId="159" type="0">
</Transition>
<Transition StartId="152" EndId="160" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="153" EndId="146" type="1">
<Expression>DString_C131_Partnumber_MCU ~= "" and  DString_C131_Partnumber_MCU~="MCU00_partnumber"</Expression></Transition>
<Transition StartId="154" EndId="155" type="0">
</Transition>
<Transition StartId="154" EndId="147" type="1">
<Expression>DString_C131_Partnumber_Charger ~= "" and  DString_C131_Partnumber_Charger~="CHG00_partnumber"</Expression></Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="155" EndId="148" type="1">
<Expression>DString_C131_Partnumber_Oilpump ~= "" and  DString_C131_Partnumber_Oilpump~="OLP00_partnumber"</Expression></Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="156" EndId="149" type="1">
<Expression>DString_C131_Partnumber_BMS ~= "" and  DString_C131_Partnumber_BMS~="BMS00_partnumber" and DString_C131_Car_Tpye=="CH1MM21"</Expression></Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="150" type="1">
<Expression>DString_C131_Partnumber_DCDC ~= "" and  DString_C131_Partnumber_DCDC ~="DCDC0_partnumber"</Expression></Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="158" EndId="151" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and  DString_C131_Partnumber_HCU ~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="159" EndId="152" type="1">
<Expression>DString_C131_Partnumber_BSD ~= "" and  DString_C131_Partnumber_BSD ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="160" EndId="169" type="0">
</Transition>
<Transition StartId="160" EndId="168" type="1">
<Expression>DString_C131_Partnumber_TBOX ~= "" and  DString_C131_Partnumber_TBOX ~="TBOX0_partnumber"</Expression></Transition>
<Transition StartId="161" EndId="164" type="0">
</Transition>
<Transition StartId="162" EndId="163" type="0">
</Transition>
<Transition StartId="162" EndId="118" type="1">
<Expression>DString_C131_Partnumber_HCU == "" or DString_C131_Partnumber_HCU == nil</Expression></Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="163" EndId="161" type="1">
<Expression>DString_C131_Partnumber_HCU ~= "" and DString_C131_Partnumber_HCU ~= nil</Expression></Transition>
<Transition StartId="164" EndId="58" type="0">
</Transition>
<Transition StartId="164" EndId="188" type="1">
<Expression>DString_C131_Partnumber_DVD ~= "" and  DString_C131_Partnumber_DVD ~= nil</Expression></Transition>
<Transition StartId="165" EndId="1" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="106" type="0">
</Transition>
<Transition StartId="169" EndId="47" type="1">
<Expression>DString_C131_Partnumber_PEPS ~=""</Expression></Transition>
<Transition StartId="175" EndId="134" type="0">
</Transition>
<Transition StartId="175" EndId="132" type="1">
<Expression>DString_C131_Partnumber_PLGM ~= "" and  DString_C131_Partnumber_PLGM~="PLGM0_partnumber"</Expression></Transition>
<Transition StartId="176" EndId="20" type="1">
<Expression>DString_C131_Partnumber_DDCU~=""</Expression></Transition>
<Transition StartId="176" EndId="86" type="0">
</Transition>
<Transition StartId="187" EndId="53" type="1">
<Expression>DString_C131_Partnumber_EMS ~=""</Expression></Transition>
<Transition StartId="187" EndId="62" type="0">
</Transition>
<Transition StartId="188" EndId="58" type="0">
</Transition>
<Transition StartId="189" EndId="187" type="0">
</Transition>
<Transition StartId="190" EndId="191" type="0">
</Transition>
<Transition StartId="191" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="117" type="0">
</Transition>
</Transitions>
</Process>

