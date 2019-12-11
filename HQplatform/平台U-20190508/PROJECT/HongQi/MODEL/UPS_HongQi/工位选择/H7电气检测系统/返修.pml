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
<Rect left="120" top="4" right="220" bottom="36"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="520" top="1004" right="620" bottom="1036"/>
<Script></Script></End>
<Activities>
<Activity id="12" ActivityType="5" flags="0" name="读配置码">
<Rect left="120" top="184" right="220" bottom="216"/>
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
<Activity id="33" ActivityType="3" flags="0" name="Title">
<Rect left="380" top="254" right="480" bottom="286"/>
<TitleText Enable="1" Text="一汽红旗-返修线"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="设置工位">
<Rect left="250" top="254" right="350" bottom="286"/>
<Script>VMTLOC="REP"
engine.WorkPlace="REP"

print("DString_C131_VariCoding_SDM:"..DString_C131_VariCoding_SDM)
print("DString_C131_VariCoding_SDM:"..DString_C131_VariCoding_SDM)</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="连接OBD">
<Rect left="120" top="124" right="220" bottom="156"/>
<Line1Text Enable="1" Text="请连接OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON


DString_C131_Car_Tpye = engine.CarType
DString_Write_VIN = engine.VIN

print("parCarType:"..DString_C131_Car_Tpye)
print("parVIN:"..DString_Write_VIN)</Script></Activity>
<Activity id="156" ActivityType="5" flags="0" name="单独控制器返修">
<Rect left="520" top="524" right="620" bottom="556"/>
<SubProcesses>
<SubProcess id="ECU_Repair">
<Parameters>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Partnumber_EMS" value="DString_C131_Partnumber_EMS"/>
<Parameter id="DString_C131_VariCoding_EMS" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_ConfigInfo_EMS" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="DString_C131_Partnumber_AT" value="DString_C131_Partnumber_AT"/>
<Parameter id="DString_C131_VariCoding_AT" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber_DCT" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_C131_VariCoding_DCT" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber_EPB" value="DString_C131_Partnumber_EPB"/>
<Parameter id="DString_C131_VariCoding_EPB" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_VariCoding_SAS" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber_EHPS" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="DString_C131_VariCoding_EHPS" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber_AFS" value="DString_C131_Partnumber_AFS"/>
<Parameter id="DString_C131_VariCoding_AFS" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_VariCoding_AC" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Partnumber_SDM" value="DString_C131_Partnumber_SDM"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber_LDW" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding_LDW" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_C131_Partnumber_ACC" value="DString_C131_Partnumber_ACC"/>
<Parameter id="DString_C131_VariCoding_ACC" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_VariCoding_BCM1" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_VariCoding_IC" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber_BCM2" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="DString_C131_VariCoding_BCM2" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="DString_C131_VariCoding_ARMREST" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_VariCoding_PEPS" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="DString_C131_Partnumber_PDC" value="DString_C131_Partnumber_PDC"/>
<Parameter id="DString_C131_VariCoding_PDC" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber_GATEWAY" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_C131_HorlConfig_GATEWAY" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_GATEWAY" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_VariCoding_DDCU" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_VariCoding_PDCU" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_VariCoding_RLDCU" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_VariCoding_RRDCU" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber_DSCU" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_VariCoding_DSCU" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber_PLGM" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="DString_C131_VariCoding_PLGM" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber_SCM" value="DString_C131_Partnumber_SCM"/>
<Parameter id="DString_C131_VariCoding_SCM" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="DString_C131_Partnumber_MCU" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding_MCU" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_C131_Partnumber_Charger" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding_Charger" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_C131_Partnumber_Oilpump" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding_Oilpump" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_C131_Partnumber_DCDC" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding_DCDC" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_C131_Partnumber_HCU" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding_HCU" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_C131_Partnumber_BSD" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding_BSD" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_C131_Partnumber_FWD" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding_FWD" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_C131_Partnumber_BMS" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding_BMS" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_C131_Model_Name" value="DString_C131_Model_Name"/>
<Parameter id="DString_C131_BattConfig_GATEWAY" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_ESP" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_C131_Partnumber_ESP" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_DVDConfig_GATEWAY" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="spec_data" value="spec_data"/>
<Parameter id="DString_C131_Partnumber_TBOX" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_TBOX" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_C131_Partnumber_DVD" value="DString_C131_Partnumber_DVD"/>
<Parameter id="DString_C131_VariCoding_DVD" value="DString_C131_VariCoding_DVD"/>
<Parameter id="DString_C131_Partnumber_PLGM1" value="DString_C131_Partnumber_PLGM1"/>
<Parameter id="DString_C131_VariCoding_PLGM1" value="DString_C131_VariCoding_PLGM1"/>
<Parameter id="DString_C131_VariCoding_GW0101"/>
<Parameter id="DString_C131_VariCoding_GW0116"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="157" ActivityType="5" flags="0" name="返修类型选择">
<Rect left="520" top="254" right="620" bottom="286"/>
<SubProcesses>
<SubProcess id="Repair_List">
<Parameters>
<Parameter id="Repair_Selection" ret="Repair_Selection"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="161" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="180" top="384" right="280" bottom="416"/>
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
<Parameter id="AB000_partnumber" value="DString_C131_Partnumber_SDM"/>
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
<Parameter id="DVD00_partnumber" value="DString_C131_Partnumber_DVD"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="163" ActivityType="5" flags="0" name="c131_dtc_clear_all">
<Rect left="310" top="384" right="410" bottom="416"/>
<SubProcesses>
<SubProcess id="C131_DTC_Clear_All">
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
<Parameter id="AB000_partnumber" value="DString_C131_Partnumber_SDM"/>
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
<Parameter id="DVD00_partnumber" value="DString_C131_Partnumber_DVD"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="164" ActivityType="5" flags="0" name="immobilizer_key1">
<Rect left="310" top="454" right="410" bottom="486"/>
<SubProcesses>
<SubProcess id="Immobilizer_Key1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="165" ActivityType="5" flags="0" name="immobilizer_key2">
<Rect left="180" top="454" right="280" bottom="486"/>
<SubProcesses>
<SubProcess id="Immobilizer_Key2">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="rematch_firkey" value="rematch_firkey"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="166" ActivityType="5" flags="0" name="immo_escl">
<Rect left="310" top="564" right="410" bottom="596"/>
<SubProcesses>
<SubProcess id="IMMO_ESCL">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="168" ActivityType="5" flags="0" name="immo_hcu">
<Rect left="310" top="514" right="410" bottom="546"/>
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
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="169" ActivityType="5" flags="0" name="c131_dtc_clear_all">
<Rect left="310" top="334" right="410" bottom="366"/>
<SubProcesses>
<SubProcess id="C131_DTC_Clear_All">
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
<Parameter id="AB000_partnumber" value="DString_C131_Partnumber_SDM"/>
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
<Parameter id="DVD00_partnumber" value="DVD00_partnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="172" ActivityType="5" flags="0" name="单独控制器读ECU信息">
<Rect left="750" top="564" right="850" bottom="596"/>
<SubProcesses>
<SubProcess id="Read_ECU_Infor">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="&quot;RIN&quot;"/>
<Parameter id="DString_C131_Partnumber_EMS" value="DString_C131_Partnumber_EMS"/>
<Parameter id="DString_C131_VariCoding_EMS" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_ConfigInfo_EMS" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="DString_C131_Partnumber_AT" value="DString_C131_Partnumber_AT"/>
<Parameter id="DString_C131_VariCoding_AT" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber_DCT" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_C131_VariCoding_DCT" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber_EPB" value="DString_C131_Partnumber_EPB"/>
<Parameter id="DString_C131_VariCoding_EPB" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_VariCoding_SAS" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber_EHPS" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="DString_C131_VariCoding_EHPS" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber_ESP" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_VariCoding_ESP" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_C131_Partnumber_AFS" value="DString_C131_Partnumber_AFS"/>
<Parameter id="DString_C131_VariCoding_AFS" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_VariCoding_AC" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Partnumber_SDM" value="DString_C131_Partnumber_SDM"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber_LDW" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding_LDW" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_C131_Partnumber_ACC" value="DString_C131_Partnumber_ACC"/>
<Parameter id="DString_C131_VariCoding_ACC" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_VariCoding_BCM1" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_VariCoding_IC" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber_BCM2" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="DString_C131_VariCoding_BCM2" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="DString_C131_VariCoding_ARMREST" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_VariCoding_PEPS" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="DString_C131_Partnumber_PDC" value="DString_C131_Partnumber_PDC"/>
<Parameter id="DString_C131_VariCoding_PDC" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber_GATEWAY" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_C131_HorLConfig_GATEWAY" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_GATEWAY" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_VariCoding_DDCU" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_VariCoding_PDCU" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_VariCoding_RLDCU" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_VariCoding_RRDCU" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber_DSCU" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_VariCoding_DSCU" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber_PLGM" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="DString_C131_VariCoding_PLGM" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber_SCM" value="DString_C131_Partnumber_SCM"/>
<Parameter id="DString_C131_VariCoding_SCM" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="DString_C131_Partnumber_MCU" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding_MCU" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_C131_Partnumber_Charger" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding_Charger" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_C131_Partnumber_Oilpump" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding_Oilpump" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_C131_Partnumber_DCDC" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding_DCDC" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_C131_Partnumber_HCU" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding_HCU" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_C131_Partnumber_BSD" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding_BSD" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_C131_Partnumber_FWD" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding_FWD" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_C131_Partnumber_BMS" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding_BMS" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_C131_BattConfig_GATEWAY" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_DVDConfig_GATEWAY" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_TBOX" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_TBOX" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_C131_Partnumber_DVD" value="DString_C131_Partnumber_DVD"/>
<Parameter id="DString_C131_VariCoding_DVD" value="DString_C131_VariCoding_DVD"/>
<Parameter id="DString_C131_Partnumber_PLGM1" value="DString_C131_Partnumber_PLGM1"/>
<Parameter id="DString_C131_VariCoding_PLGM1" value="DString_C131_VariCoding_PLGM1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="175" ActivityType="5" flags="0" name="读所有控制器信息">
<Rect left="750" top="624" right="850" bottom="656"/>
<SubProcesses>
<SubProcess id="Read_All_ECU_Infor">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="&quot;RIN&quot;"/>
<Parameter id="DString_C131_Partnumber_EMS" value="DString_C131_Partnumber_EMS"/>
<Parameter id="DString_C131_VariCoding_EMS" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_ConfigInfo_EMS" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="DString_C131_Partnumber_AT" value="DString_C131_Partnumber_AT"/>
<Parameter id="DString_C131_VariCoding_AT" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber_DCT" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_C131_VariCoding_DCT" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber_EPB" value="DString_C131_Partnumber_EPB"/>
<Parameter id="DString_C131_VariCoding_EPB" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_VariCoding_SAS" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber_EHPS" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="DString_C131_VariCoding_EHPS" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber_ESP" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_VariCoding_ESP" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_C131_Partnumber_AFS" value="DString_C131_Partnumber_AFS"/>
<Parameter id="DString_C131_VariCoding_AFS" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_VariCoding_AC" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="DString_C131_Partnumber_SDM" value="DString_C131_Partnumber_SDM"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber_LDW" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding_LDW" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_C131_Partnumber_ACC" value="DString_C131_Partnumber_ACC"/>
<Parameter id="DString_C131_VariCoding_ACC" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_VariCoding_BCM1" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_VariCoding_IC" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber_BCM2" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="DString_C131_VariCoding_BCM2" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="DString_C131_VariCoding_ARMREST" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_VariCoding_PEPS" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="DString_C131_Partnumber_PDC" value="DString_C131_Partnumber_PDC"/>
<Parameter id="DString_C131_VariCoding_PDC" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber_GATEWAY" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_C131_HorlConfig_GATEWAY" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_GATEWAY" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_VariCoding_DDCU" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_VariCoding_PDCU" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_VariCoding_RLDCU" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_VariCoding_RRDCU" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber_DSCU" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_VariCoding_DSCU" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber_PLGM" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="DString_C131_VariCoding_PLGM" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber_SCM" value="DString_C131_Partnumber_SCM"/>
<Parameter id="DString_C131_VariCoding_SCM" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Partnumber_MCU" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding_MCU" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_C131_Partnumber_Charger" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding_Charger" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_C131_Partnumber_Oilpump" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding_Oilpump" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_C131_Partnumber_DCDC" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding_DCDC" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_C131_Partnumber_HCU" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding_HCU" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_C131_Partnumber_BSD" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding_BSD" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_C131_Partnumber_FWD" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding_FWD" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_C131_Partnumber_BMS" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding_BMS" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_C131_BattConfig_GATEWAY" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_DVDCoding_GATEWAY" value="DString_C131_DVDCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_TBOX" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_TBOX" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_C131_Partnumber_DVD" value="DString_C131_Partnumber_DVD"/>
<Parameter id="DString_C131_VariCoding_DVD" value="DString_C131_VariCoding_DVD"/>
<Parameter id="DString_C131_Partnumber_PLGM1" value="DString_C131_Partnumber_PLGM1"/>
<Parameter id="DString_C131_VariCoding_PLGM1" value="DString_C131_VariCoding_PLGM1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="177" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="750" top="394" right="850" bottom="426"/>
<SubProcesses>
<SubProcess id="C131_HCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_HCU_OEM_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SN_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SVP_Execute_Flag" value="false"/>
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
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="179" ActivityType="5" flags="0" name="C131_HCU">
<Rect left="750" top="454" right="850" bottom="486"/>
<SubProcesses>
<SubProcess id="C131_HCU">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_HCU_OEM_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SN_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_SVP_Execute_Flag" value="false"/>
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
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="180" ActivityType="5" flags="0" name="写所有控制器配置码">
<Rect left="750" top="684" right="850" bottom="716"/>
<SubProcesses>
<SubProcess id="Write_All_ECU_Config">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Partnumber_EMS" value="DString_C131_Partnumber_EMS"/>
<Parameter id="DString_C131_VariCoding_EMS" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_ConfigInfo_EMS" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="DString_C131_Partnumber_AT" value="DString_C131_Partnumber_AT"/>
<Parameter id="DString_C131_VariCoding_AT" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber_DCT" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_C131_VariCoding_DCT" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber_EPB" value="DString_C131_Partnumber_EPB"/>
<Parameter id="DString_C131_VariCoding_EPB" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_VariCoding_SAS" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber_EHPS" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="DString_C131_VariCoding_EHPS" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber_ESP" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_VariCoding_ESP" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_C131_Partnumber_AFS" value="DString_C131_Partnumber_AFS"/>
<Parameter id="DString_C131_VariCoding_AFS" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_VariCoding_AC" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="DString_C131_Partnumber_SDM" value="DString_C131_Partnumber_SDM"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber_LDW" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding_LDW" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_C131_Partnumber_ACC" value="DString_C131_Partnumber_ACC"/>
<Parameter id="DString_C131_VariCoding_ACC" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_VariCoding_BCM1" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_VariCoding_IC" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber_BCM2" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="DString_C131_VariCoding_BCM2" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="DString_C131_VariCoding_ARMREST" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_VariCoding_PEPS" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="DString_C131_Partnumber_PDC" value="DString_C131_Partnumber_PDC"/>
<Parameter id="DString_C131_VariCoding_PDC" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber_GATEWAY" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_C131_HorLConfig_GATEWAY" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_GATEWAY" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_VariCoding_DDCU" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_VariCoding_PDCU" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_VariCoding_RLDCU" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_VariCoding_RRDCU" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber_DSCU" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_VariCoding_DSCU" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber_PLGM" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="DString_C131_VariCoding_PLGM" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber_SCM" value="DString_C131_Partnumber_SCM"/>
<Parameter id="DString_C131_VariCoding_SCM" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Partnumber_MCU" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding_MCU" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_C131_Partnumber_Charger" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding_Charger" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_C131_Partnumber_Oilpump" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding_Oilpump" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_C131_Partnumber_DCDC" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding_DCDC" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_C131_Partnumber_HCU" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding_HCU" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_C131_Partnumber_BSD" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding_BSD" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_C131_Partnumber_FWD" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding_FWD" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_C131_Partnumber_BMS" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding_BMS" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_C131_BattConfig_GATEWAY" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_TBOX" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_TBOX" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_C131_DVDConfig_GATEWAY" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_DVD" value="DString_C131_VariCoding_DVD"/>
<Parameter id="DString_C131_Partnumber_DVD" value="DString_C131_Partnumber_DVD"/>
<Parameter id="DString_C131_Partnumber_PLGM1" value="DString_C131_Partnumber_PLGM1"/>
<Parameter id="DString_C131_VariCoding_PLGM1" value="DString_C131_VariCoding_PLGM1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="181" ActivityType="5" flags="0" name="immo_ems">
<Rect left="750" top="344" right="850" bottom="376"/>
<SubProcesses>
<SubProcess id="IMMO_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="182" ActivityType="13" flags="0" name="deal_xml_file">
<Rect left="120" top="254" right="220" bottom="286"/>
<FunctionRef id="Deal_xml_file">
<Parameters>
<Parameter id="filename" value="DString_Write_VIN"/>
<Parameter id="spec_data" ret="spec_data"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="183" ActivityType="5" flags="0" name="C131_HCU_C0_SelfLearning">
<Rect left="310" top="624" right="410" bottom="656"/>
<SubProcesses>
<SubProcess id="C131_HCU_C0_SelfLearning">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="184" ActivityType="5" flags="0" name="C131_HCU_DCT_SelfLearning">
<Rect left="310" top="674" right="410" bottom="706"/>
<SubProcesses>
<SubProcess id="C131_HCU_DCT_SelfLearning">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="185" ActivityType="5" flags="0" name="C131_HCU_Flash">
<Rect left="880" top="514" right="980" bottom="546"/>
<SubProcesses>
<SubProcess id="C131_HCU_Flash">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="Stop_Flag" value="Stop_Flag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="187" ActivityType="5" flags="0" name="C131_EMS_Friction_Segment_Adapation">
<Rect left="310" top="724" right="410" bottom="756"/>
<SubProcesses>
<SubProcess id="C131_EMS_Friction_Segment_Adapation">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="192" ActivityType="5" flags="0" name="C131_HCU_Flash_F1">
<Rect left="750" top="514" right="850" bottom="546"/>
<SubProcesses>
<SubProcess id="C131_HCU_Flash_F1">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="Stop_Flag" value="Stop_Flag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="194" ActivityType="5" flags="0" name="c131_dtc_read_all">
<Rect left="310" top="824" right="410" bottom="856"/>
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
<Parameter id="AB000_partnumber" value="DString_C131_Partnumber_SDM"/>
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
<Parameter id="VMTLOC" value="&quot;NO_REP&quot;"/>
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
<Parameter id="DVD00_partnumber" value="DString_C131_Partnumber_DVD"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="Title">
<Rect left="120" top="64" right="220" bottom="96"/>
<TitleText Enable="1" Text="一汽红旗-返修线"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="196" ActivityType="5" flags="0" name="C131_EMS_DVE_Learn_Repair">
<Rect left="310" top="774" right="410" bottom="806"/>
<SubProcesses>
<SubProcess id="C131_EMS_DVE_Learn_Repair">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="198" ActivityType="5" flags="0" name="BSDtest">
<Rect left="750" top="294" right="850" bottom="326"/>
<SubProcesses>
<SubProcess id="BSDtest">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="199" ActivityType="5" flags="0" name="H7_BSD_写入LED结果">
<Rect left="750" top="254" right="850" bottom="286"/>
<SubProcesses>
<SubProcess id="H7_BSD_写入LED结果">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="200" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="520" top="864" right="620" bottom="896"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="201" ActivityType="3" flags="1" name="上传统计打印结果">
<Rect left="520" top="934" right="620" bottom="966"/>
<Script>
engine.SaveResultXml();

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="195" type="0">
</Transition>
<Transition StartId="12" EndId="182" type="0">
</Transition>
<Transition StartId="33" EndId="157" type="0">
</Transition>
<Transition StartId="78" EndId="33" type="0">
</Transition>
<Transition StartId="104" EndId="12" type="0">
</Transition>
<Transition StartId="156" EndId="200" type="0">
</Transition>
<Transition StartId="157" EndId="156" type="1">
<Expression>Repair_Selection=="单独控制器返修"</Expression></Transition>
<Transition StartId="157" EndId="169" type="1">
<Expression>Repair_Selection=="清所有DTC"</Expression></Transition>
<Transition StartId="157" EndId="194" type="1">
<Expression>Repair_Selection=="读所有DTC"</Expression></Transition>
<Transition StartId="157" EndId="164" type="1">
<Expression>Repair_Selection=="匹配遥控钥匙"</Expression></Transition>
<Transition StartId="157" EndId="166" type="1">
<Expression>Repair_Selection=="PEPS 匹配 ESCL"</Expression></Transition>
<Transition StartId="157" EndId="181" type="1">
<Expression>Repair_Selection=="PEPS 匹配 EMS"</Expression></Transition>
<Transition StartId="157" EndId="168" type="1">
<Expression>Repair_Selection=="PEPS 匹配 HCU"</Expression></Transition>
<Transition StartId="157" EndId="172" type="1">
<Expression>Repair_Selection=="单独控制器读ECU信息"</Expression></Transition>
<Transition StartId="157" EndId="175" type="1">
<Expression>Repair_Selection=="读所有控制器信息" </Expression></Transition>
<Transition StartId="157" EndId="177" type="1">
<Expression>Repair_Selection=="HCU 激活车辆运输模式"</Expression></Transition>
<Transition StartId="157" EndId="179" type="1">
<Expression>Repair_Selection=="HCU 取消车辆运输模式"</Expression></Transition>
<Transition StartId="157" EndId="180" type="1">
<Expression>Repair_Selection=="写所有控制器配置码" </Expression></Transition>
<Transition StartId="157" EndId="183" type="1">
<Expression>Repair_Selection=="HCU C0自学习"</Expression></Transition>
<Transition StartId="157" EndId="184" type="1">
<Expression>Repair_Selection=="DCT 双离合器自学习"</Expression></Transition>
<Transition StartId="157" EndId="192" type="1">
<Expression>Repair_Selection=="HCU Flash"</Expression></Transition>
<Transition StartId="157" EndId="187" type="1">
<Expression>Repair_Selection=="EMS 摩擦力及分段自学习"</Expression></Transition>
<Transition StartId="157" EndId="163" type="1">
<Expression>Repair_Selection=="清除后再读所有DTC"</Expression></Transition>
<Transition StartId="157" EndId="196" type="1">
<Expression>Repair_Selection=="EMS 电子节气门自学习"</Expression></Transition>
<Transition StartId="157" EndId="198" type="1">
<Expression>Repair_Selection=="BSD测试"</Expression></Transition>
<Transition StartId="157" EndId="199" type="1">
<Expression>Repair_Selection =="BSD 写入LED结果"</Expression></Transition>
<Transition StartId="161" EndId="200" type="0">
</Transition>
<Transition StartId="163" EndId="161" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="200" type="0">
</Transition>
<Transition StartId="166" EndId="200" type="0">
</Transition>
<Transition StartId="168" EndId="200" type="0">
</Transition>
<Transition StartId="169" EndId="200" type="0">
</Transition>
<Transition StartId="172" EndId="200" type="0">
</Transition>
<Transition StartId="175" EndId="200" type="0">
</Transition>
<Transition StartId="177" EndId="200" type="0">
</Transition>
<Transition StartId="179" EndId="200" type="0">
</Transition>
<Transition StartId="180" EndId="200" type="0">
</Transition>
<Transition StartId="181" EndId="200" type="0">
</Transition>
<Transition StartId="182" EndId="78" type="0">
</Transition>
<Transition StartId="183" EndId="200" type="0">
</Transition>
<Transition StartId="184" EndId="200" type="0">
</Transition>
<Transition StartId="187" EndId="200" type="0">
</Transition>
<Transition StartId="192" EndId="200" type="0">
</Transition>
<Transition StartId="194" EndId="200" type="0">
</Transition>
<Transition StartId="195" EndId="104" type="0">
</Transition>
<Transition StartId="196" EndId="200" type="0">
</Transition>
<Transition StartId="198" EndId="200" type="0">
</Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="1" type="0">
</Transition>
</Transitions>
</Process>

