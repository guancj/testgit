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
<Rect left="53" right="153" bottom="32"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="1" name="结束节点">
<Rect left="578" top="269" right="678" bottom="301"/>
<Script>date=os.date("%Y%m%d_%H%M%S");
engine.WorkPlace="FLS";
engine.SaveResultXml("");</Script></End>
<Activities>
<Activity id="12" ActivityType="5" flags="0" name="读配置码">
<Rect left="54" top="151" right="154" bottom="183"/>
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
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="Title">
<Rect left="314" top="153" right="414" bottom="185"/>
<TitleText Enable="1" Text="一汽红旗 - FLASH刷写"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="设置工位">
<Rect left="181" top="154" right="281" bottom="186"/>
<Script>VMTLOC="FLS"
engine.WorkPlace="FLS"</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="连接OBD">
<Rect left="54" top="53" right="154" bottom="85"/>
<Line1Text Enable="1" Text="请连接OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="131" ActivityType="5" flags="0" name="扫码">
<Rect left="53" top="102" right="153" bottom="134"/>
<SubProcesses>
<SubProcess id="Scan_KNR">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" ret="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" ret="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="451" top="268" right="551" bottom="300"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if (0 == engine.TestResult) then
  engine.DialogBackColor = "Green";
#DELAY 2000
else
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
#DELAY 2000
end
</Script></Activity>
<Activity id="182" ActivityType="13" flags="0" name="deal_xml_file">
<Rect left="54" top="203" right="154" bottom="235"/>
<FunctionRef id="Deal_xml_file">
<Parameters>
<Parameter id="filename" value="DString_Write_VIN"/>
<Parameter id="spec_data" ret="spec_data"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="189" ActivityType="5" flags="0" name="C131_HCU_Flash_Check">
<Rect left="286" top="269" right="386" bottom="301"/>
<SubProcesses>
<SubProcess id="C131_HCU_Flash_Check">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="C131_HCU_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_EID_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
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
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="190" ActivityType="5" flags="0" name="C131_HCU_Flash_F1">
<Rect left="286" top="209" right="386" bottom="241"/>
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
<Activity id="191" ActivityType="5" flags="0" name="刷写选择">
<Rect left="446" top="153" right="546" bottom="185"/>
<SubProcesses>
<SubProcess id="Flash_Select">
<Parameters>
<Parameter id="Repair_Selection" ret="Repair_Selection"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="192" ActivityType="5" flags="0" name="扫码_FLASH">
<Rect left="182" top="103" right="282" bottom="135"/>
<SubProcesses>
<SubProcess id="Scan_KNR_Flash">
<Parameters>
<Parameter id="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="193" ActivityType="5" flags="0" name="C131_HCU_Flash_7DF">
<Rect left="288" top="331" right="388" bottom="363"/>
<SubProcesses>
<SubProcess id="C131_HCU_Flash_7DF">
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
<Activity id="194" ActivityType="5" flags="0" name="C131_HCU_Flash">
<Rect left="287" top="391" right="387" bottom="423"/>
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
<Activity id="195" ActivityType="3" flags="0" name="设置共享变量">
<Rect left="166" top="392" right="266" bottom="424"/>
<Script>Stop_Flag="stop_flag";
engine.SharedVarSet(Stop_Flag,0);
engine.println("设置共享变量，Stop_Flag="..engine.SharedVarGet(Stop_Flag));</Script></Activity>
<Activity id="218" ActivityType="5" flags="0" name="Force_Power_On">
<Rect left="45" top="331" right="145" bottom="363"/>
<SubProcesses>
<SubProcess id="Force_Power_On">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="更换转接线">
<Rect left="165" top="332" right="265" bottom="364"/>
<Line1Text Enable="1" Text="请更换转接线"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="104" type="0">
</Transition>
<Transition StartId="12" EndId="182" type="0">
</Transition>
<Transition StartId="33" EndId="191" type="0">
</Transition>
<Transition StartId="78" EndId="33" type="0">
</Transition>
<Transition StartId="104" EndId="192" type="0">
</Transition>
<Transition StartId="160" EndId="1" type="0">
</Transition>
<Transition StartId="189" EndId="160" type="0">
</Transition>
<Transition StartId="190" EndId="160" type="0">
</Transition>
<Transition StartId="191" EndId="189" type="1">
<Expression>Repair_Selection=="刷写检查"</Expression></Transition>
<Transition StartId="191" EndId="190" type="1">
<Expression>Repair_Selection=="FLASH单独刷写"</Expression></Transition>
<Transition StartId="191" EndId="218" type="1">
<Expression>Repair_Selection=="FALSH台架刷写"</Expression></Transition>
<Transition StartId="192" EndId="78" type="0">
</Transition>
<Transition StartId="193" EndId="160" type="0">
</Transition>
<Transition StartId="194" EndId="160" type="0">
</Transition>
<Transition StartId="195" EndId="194" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="193" type="0">
</Transition>
</Transitions>
</Process>

