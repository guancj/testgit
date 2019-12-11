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
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="14" right="470" bottom="46"/>
<Script>DString_C079_Car_Type = engine.CarType
DString_Write_VIN = engine.VIN</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="500" top="1924" right="600" bottom="1956"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="EMS_ReadDTC">
<Rect left="370" top="214" right="470" bottom="246"/>
<SubProcesses>
<SubProcess id="EMS_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="7" ActivityType="5" flags="0" name="AT_ReadDTC">
<Rect left="370" top="254" right="470" bottom="286"/>
<SubProcesses>
<SubProcess id="AT_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="ACM_ReadDTC">
<Rect left="370" top="314" right="470" bottom="346"/>
<SubProcesses>
<SubProcess id="ACM_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="10" ActivityType="5" flags="0" name="ACU_ReadDTC">
<Rect left="370" top="374" right="470" bottom="406"/>
<SubProcesses>
<SubProcess id="ACU_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="0" name="ESP_ReadDTC">
<Rect left="370" top="444" right="470" bottom="476"/>
<SubProcesses>
<SubProcess id="ESP_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="5" flags="0" name="SAS_ReadDTC">
<Rect left="370" top="504" right="470" bottom="536"/>
<SubProcesses>
<SubProcess id="SAS_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="14" ActivityType="5" flags="0" name="TOD_ReadDTC">
<Rect left="370" top="574" right="470" bottom="606"/>
<SubProcesses>
<SubProcess id="TOD_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="5" flags="0" name="AirSu_ReadDTC">
<Rect left="370" top="644" right="470" bottom="676"/>
<SubProcesses>
<SubProcess id="AirSu_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="18" ActivityType="5" flags="0" name="AVM_ReadDTC">
<Rect left="370" top="854" right="470" bottom="886"/>
<SubProcesses>
<SubProcess id="AVM_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="19" ActivityType="5" flags="0" name="IFC_ReadDTC">
<Rect left="370" top="914" right="470" bottom="946"/>
<SubProcesses>
<SubProcess id="IFC_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="ADV_ReadDTC">
<Rect left="370" top="974" right="470" bottom="1006"/>
<SubProcesses>
<SubProcess id="ADV_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="21" ActivityType="5" flags="0" name="BSD_ReadDTC">
<Rect left="270" top="1034" right="370" bottom="1066"/>
<SubProcesses>
<SubProcess id="BSD_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="27" ActivityType="5" flags="0" name="SCM_ReadDTC">
<Rect left="370" top="1104" right="470" bottom="1136"/>
<SubProcesses>
<SubProcess id="SCM_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="28" ActivityType="5" flags="0" name="T-BOX_ReadDTC">
<Rect left="370" top="1184" right="470" bottom="1216"/>
<SubProcesses>
<SubProcess id="T-BOX_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="29" ActivityType="5" flags="0" name="AC_ReadDTC">
<Rect left="370" top="1264" right="470" bottom="1296"/>
<SubProcesses>
<SubProcess id="AC_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="BCM1_ReadDTC">
<Rect left="370" top="1334" right="470" bottom="1366"/>
<SubProcesses>
<SubProcess id="BCM1_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="31" ActivityType="5" flags="0" name="BCM2_ReadDTC">
<Rect left="370" top="1404" right="470" bottom="1436"/>
<SubProcesses>
<SubProcess id="BCM2_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="32" ActivityType="5" flags="0" name="PEPS_ReadDTC">
<Rect left="370" top="1464" right="470" bottom="1496"/>
<SubProcesses>
<SubProcess id="PEPS_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="33" ActivityType="5" flags="0" name="PLGM_ReadDTC">
<Rect left="370" top="1534" right="470" bottom="1566"/>
<SubProcesses>
<SubProcess id="PLGM_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="36" ActivityType="5" flags="0" name="IVI_ReadDTC">
<Rect left="370" top="1684" right="470" bottom="1716"/>
<SubProcesses>
<SubProcess id="IVI_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="37" ActivityType="5" flags="0" name="DVR_ReadDTC">
<Rect left="370" top="1764" right="470" bottom="1796"/>
<SubProcesses>
<SubProcess id="DVR_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="39" ActivityType="5" flags="0" name="ALS_ReadDTC">
<Rect left="370" top="1864" right="470" bottom="1896"/>
<SubProcesses>
<SubProcess id="ALS_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="40" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="370" top="114" right="470" bottom="146"/>
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
<Activity id="145" ActivityType="5" flags="0" name="GW_ReadDTC">
<Rect left="370" top="164" right="470" bottom="196"/>
<SubProcesses>
<SubProcess id="GW_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="164" right="566" bottom="196"/>
</Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="214" right="566" bottom="246"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="254" right="566" bottom="286"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="314" right="566" bottom="346"/>
</Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="374" right="566" bottom="406"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="444" right="566" bottom="476"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="504" right="566" bottom="536"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="574" right="566" bottom="606"/>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="644" right="566" bottom="676"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="784" right="566" bottom="816"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="854" right="566" bottom="886"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="914" right="566" bottom="946"/>
</Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="974" right="566" bottom="1006"/>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1034" right="566" bottom="1066"/>
</Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1104" right="566" bottom="1136"/>
</Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1184" right="566" bottom="1216"/>
</Activity>
<Activity id="170" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1264" right="566" bottom="1296"/>
</Activity>
<Activity id="171" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1334" right="566" bottom="1366"/>
</Activity>
<Activity id="172" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1404" right="566" bottom="1436"/>
</Activity>
<Activity id="173" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1464" right="566" bottom="1496"/>
</Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1534" right="566" bottom="1566"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1594" right="566" bottom="1626"/>
</Activity>
<Activity id="177" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1684" right="566" bottom="1716"/>
</Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1764" right="566" bottom="1796"/>
</Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1864" right="566" bottom="1896"/>
</Activity>
<Activity id="181" ActivityType="5" flags="0" name="PDC_ReadDTC">
<Rect left="370" top="784" right="470" bottom="816"/>
<SubProcesses>
<SubProcess id="PDC_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="182" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="714" right="566" bottom="746"/>
</Activity>
<Activity id="183" ActivityType="5" flags="0" name="DMSCU_ReadDTC">
<Rect left="370" top="714" right="470" bottom="746"/>
<SubProcesses>
<SubProcess id="DMSCU_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="工位设置">
<Rect left="370" top="64" right="470" bottom="96"/>
<Script>Station = "TR1"</Script></Activity>
<Activity id="185" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="214" right="336" bottom="246"/>
</Activity>
<Activity id="186" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="314" right="336" bottom="346"/>
</Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="784" right="336" bottom="816"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="184" type="0">
</Transition>
<Transition StartId="7" EndId="148" type="0">
</Transition>
<Transition StartId="10" EndId="151" type="0">
</Transition>
<Transition StartId="11" EndId="152" type="0">
</Transition>
<Transition StartId="12" EndId="153" type="0">
</Transition>
<Transition StartId="14" EndId="156" type="0">
</Transition>
<Transition StartId="15" EndId="157" type="0">
</Transition>
<Transition StartId="18" EndId="159" type="0">
</Transition>
<Transition StartId="19" EndId="160" type="0">
</Transition>
<Transition StartId="20" EndId="161" type="0">
</Transition>
<Transition StartId="27" EndId="168" type="0">
</Transition>
<Transition StartId="28" EndId="169" type="0">
</Transition>
<Transition StartId="29" EndId="170" type="0">
</Transition>
<Transition StartId="30" EndId="171" type="0">
</Transition>
<Transition StartId="31" EndId="172" type="0">
</Transition>
<Transition StartId="32" EndId="173" type="0">
</Transition>
<Transition StartId="33" EndId="174" type="0">
</Transition>
<Transition StartId="36" EndId="177" type="0">
</Transition>
<Transition StartId="37" EndId="178" type="0">
</Transition>
<Transition StartId="39" EndId="179" type="0">
</Transition>
<Transition StartId="40" EndId="146" type="0">
</Transition>
<Transition StartId="40" EndId="145" type="1">
<Expression>GW_partnumber ~= "" and GW_partnumber~= nil</Expression></Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="147" EndId="7" type="1">
<Expression>AT_partnumber ~= "" and AT_partnumber ~= nil</Expression></Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="10" type="1">
<Expression>ACU_partnumber ~= "" and ACU_partnumber ~= nil</Expression></Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="152" type="0">
</Transition>
<Transition StartId="151" EndId="11" type="1">
<Expression>ESP_partnumber ~= "" and ESP_partnumber ~= nil</Expression></Transition>
<Transition StartId="152" EndId="153" type="0">
</Transition>
<Transition StartId="152" EndId="12" type="1">
<Expression>SAS_partnumber ~= "" and SAS_partnumber ~= nil</Expression></Transition>
<Transition StartId="153" EndId="14" type="1">
<Expression>TOD_partnumber ~= "" and TOD_partnumber ~= nil</Expression></Transition>
<Transition StartId="153" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="156" EndId="15" type="1">
<Expression>AirS_partnumber ~= "" and AirS_partnumber ~= nil</Expression></Transition>
<Transition StartId="157" EndId="182" type="0">
</Transition>
<Transition StartId="157" EndId="183" type="1">
<Expression>DMS_partnumber ~= "" and DMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="158" EndId="18" type="1">
<Expression>AVM_partnumber ~= "" and AVM_partnumber ~= nil</Expression></Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="159" EndId="19" type="1">
<Expression>IFC_partnumber ~= "" and IFC_partnumber ~= nil</Expression></Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="160" EndId="20" type="1">
<Expression>ADV_partnumber ~= "" and ADV_partnumber ~=  nil</Expression></Transition>
<Transition StartId="161" EndId="162" type="0">
</Transition>
<Transition StartId="162" EndId="27" type="1">
<Expression>SCM_partnumber ~= "" and SCM_partnumber ~= nil </Expression></Transition>
<Transition StartId="162" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="168" EndId="28" type="1">
<Expression>TBOX_partnumber ~= "" and TBOX_partnumber ~= nil</Expression></Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="169" EndId="29" type="1">
<Expression>AC_partnumber ~= "" and AC_partnumber ~= nil</Expression></Transition>
<Transition StartId="170" EndId="171" type="0">
</Transition>
<Transition StartId="170" EndId="30" type="1">
<Expression>BCM1_partnumber ~= "" and BCM1_partnumber ~= nil</Expression></Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="171" EndId="31" type="1">
<Expression>BCM2_partnumber ~= "" and BCM2_partnumber ~= nil</Expression></Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="172" EndId="32" type="1">
<Expression>PEPS_partnumber ~= "" and PEPS_partnumber ~= nil</Expression></Transition>
<Transition StartId="173" EndId="174" type="0">
</Transition>
<Transition StartId="173" EndId="33" type="1">
<Expression>PLGM_partnumber ~= "" and PLGM_partnumber ~= nil</Expression></Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="175" EndId="36" type="1">
<Expression>IVI_partnumber ~= "" and IVI_partnumber ~= nil</Expression></Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="177" EndId="37" type="1">
<Expression>DVR_partnumber ~= "" and DVR_partnumber ~= nil</Expression></Transition>
<Transition StartId="178" EndId="179" type="0">
</Transition>
<Transition StartId="178" EndId="39" type="1">
<Expression>ALS_partnumber ~= "" and ALS_partnumber ~= nil</Expression></Transition>
<Transition StartId="179" EndId="2" type="0">
</Transition>
<Transition StartId="181" EndId="158" type="0">
</Transition>
<Transition StartId="182" EndId="158" type="0">
</Transition>
<Transition StartId="183" EndId="182" type="0">
</Transition>
<Transition StartId="184" EndId="40" type="0">
</Transition>
<Transition StartId="185" EndId="3" type="1">
<Expression>EMS_partnumber ~= "" and EMS_partnumber ~= nil</Expression></Transition>
<Transition StartId="186" EndId="9" type="1">
<Expression>ACM_partnumber ~= "" and ACM_partnumber ~= nil</Expression></Transition>
<Transition StartId="188" EndId="181" type="1">
<Expression>PDC_partnumber ~= "" and PDC_partnumber ~= nil</Expression></Transition>
</Transitions>
</Process>

