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
<Rect left="137" top="49" right="237" bottom="81"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="1" name="结束节点">
<Rect left="653" top="288" right="753" bottom="320"/>
<Script>date=os.date("%Y%m%d_%H%M%S");

engine.WorkPlace="BMS"
engine.SaveResultXml("");</Script></End>
<Activities>
<Activity id="119" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="654" top="176" right="754" bottom="208"/>
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

engine.println("OilPump_partnumber="..OilPump_partnumber)</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="连接OBD">
<Rect left="253" top="48" right="353" bottom="80"/>
<Line1Text Enable="1" Text="请连接OBD"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonRText Enable="1" Text="确认连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="设置工位">
<Rect left="535" top="50" right="635" bottom="82"/>
<Script>VMTLOC = "BMS"
engine.WorkPlace="BMS"</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="Title">
<Rect left="653" top="50" right="753" bottom="82"/>
<TitleText Enable="1" Text="一汽红旗 - 电池检测"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="169" ActivityType="5" flags="0" name="C131_HCU_BMS">
<Rect left="654" top="122" right="754" bottom="154"/>
<SubProcesses>
<SubProcess id="C131_HCU_BMS">
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
<Parameter id="C131_HCU_Read_BMS_Info_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Open_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Close_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_SPEC_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" value="true"/>
<Parameter id="C131_HCU_ActiveTransport_Execute_Flag" value="false"/>
<Parameter id="C131_HCU_InactiveTransport_Execute_Flag" value="false"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="spec_data" value="spec_data"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="170" ActivityType="5" flags="0" name="扫码_FLASH">
<Rect left="406" top="49" right="506" bottom="81"/>
<SubProcesses>
<SubProcess id="Scan_KNR_Flash">
<Parameters>
<Parameter id="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="171" ActivityType="5" flags="0" name="C131_HCU_BMS_OLD">
<Rect left="532" top="121" right="632" bottom="153"/>
<SubProcesses>
<SubProcess id="C131_HCU_BMS_OLD">
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
</Activities>
<Transitions>
<Transition StartId="0" EndId="126" type="0">
</Transition>
<Transition StartId="119" EndId="1" type="0">
</Transition>
<Transition StartId="126" EndId="170" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="0">
</Transition>
<Transition StartId="129" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="119" type="0">
</Transition>
<Transition StartId="170" EndId="128" type="0">
</Transition>
<Transition StartId="171" EndId="119" type="0">
</Transition>
</Transitions>
</Process>

