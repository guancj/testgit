<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="120" top="84" right="220" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="4640" top="444" right="4740" bottom="476"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="GW">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x780" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x788" description="CAN的接收ID"/>
</Variables>
<Rect left="400" top="164" right="500" bottom="196"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="36" ActivityType="13" flags="0" name="清故障码">
<Rect left="400" top="234" right="500" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="37" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="400" top="304" right="500" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="38" ActivityType="3" flags="1" name="EMS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Rect left="520" top="164" right="620" bottom="196"/>
<TitleText Enable="1" Text="发动机 (EMS)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="39" ActivityType="13" flags="0" name="清故障码">
<Rect left="520" top="234" right="620" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="40" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="520" top="304" right="620" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="84" right="586" bottom="116"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="AT">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Rect left="650" top="164" right="750" bottom="196"/>
<TitleText Enable="1" Text="变速箱(AT)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="43" ActivityType="13" flags="0" name="清故障码">
<Rect left="650" top="234" right="750" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="44" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="650" top="304" right="750" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="84" right="716" bottom="116"/>
</Activity>
<Activity id="46" ActivityType="5" flags="0" name="Get_Vehicle_Data_HS7">
<Rect left="400" top="84" right="500" bottom="116"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data_HS7">
<Parameters>
<Parameter id="DString_Car_Tpye" value="DString_Car_Type"/>
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
<Activity id="47" ActivityType="3" flags="0" name="EGSM">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7D0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7D8" description="CAN的接收ID"/>
</Variables>
<Rect left="780" top="164" right="880" bottom="196"/>
<TitleText Enable="1" Text="电子换挡器(EGSM)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="48" ActivityType="13" flags="0" name="清故障码">
<Rect left="780" top="234" right="880" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="49" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="780" top="304" right="880" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="84" right="846" bottom="116"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="ACM">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7D1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7D9" description="CAN的接收ID"/>
</Variables>
<Rect left="910" top="164" right="1010" bottom="196"/>
<TitleText Enable="1" Text="电子执行器(ACM)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="52" ActivityType="13" flags="0" name="清故障码">
<Rect left="910" top="234" right="1010" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="53" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="910" top="304" right="1010" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="84" right="976" bottom="116"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="ACU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x720" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x728" description="CAN的接收ID"/>
</Variables>
<Rect left="1030" top="164" right="1130" bottom="196"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="56" ActivityType="13" flags="0" name="清故障码">
<Rect left="1030" top="234" right="1130" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1030" top="304" right="1130" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="84" right="1096" bottom="116"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="ESP">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AC" description="CAN的接收ID"/>
</Variables>
<Rect left="1150" top="164" right="1250" bottom="196"/>
<TitleText Enable="1" Text="车身电子稳定系统(ESP)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="60" ActivityType="13" flags="0" name="清故障码">
<Rect left="1150" top="234" right="1250" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="61" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1150" top="304" right="1250" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="62" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="84" right="1216" bottom="116"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="SAS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CAN的接收ID"/>
</Variables>
<Rect left="1270" top="164" right="1370" bottom="196"/>
<TitleText Enable="1" Text="转向角传感器(SAS)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="68" ActivityType="13" flags="0" name="清故障码">
<Rect left="1270" top="234" right="1370" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="69" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1270" top="304" right="1370" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="70" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="84" right="1336" bottom="116"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="EPS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A2" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AA" description="CAN的接收ID"/>
</Variables>
<Rect left="1390" top="164" right="1490" bottom="196"/>
<TitleText Enable="1" Text="电子助力转向(EPS)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="72" ActivityType="13" flags="0" name="清故障码">
<Rect left="1390" top="234" right="1490" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="73" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1390" top="304" right="1490" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="84" right="1456" bottom="116"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="TOD">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7D4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7DC" description="CAN的接收ID"/>
</Variables>
<Rect left="1510" top="164" right="1610" bottom="196"/>
<TitleText Enable="1" Text="四驱(TOD)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="76" ActivityType="13" flags="0" name="清故障码">
<Rect left="1510" top="234" right="1610" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="77" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1510" top="304" right="1610" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="1544" top="84" right="1576" bottom="116"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="AirSuspension">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AB" description="CAN的接收ID"/>
</Variables>
<Rect left="1630" top="164" right="1730" bottom="196"/>
<TitleText Enable="1" Text="空气悬架(AirSuspension)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="80" ActivityType="13" flags="0" name="清故障码">
<Rect left="1630" top="234" right="1730" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="81" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1630" top="304" right="1730" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="1664" top="84" right="1696" bottom="116"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="DMSCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A6" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AE" description="CAN的接收ID"/>
</Variables>
<Rect left="1750" top="164" right="1850" bottom="196"/>
<TitleText Enable="1" Text="驾驶模式选择(DMSCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="84" ActivityType="13" flags="0" name="清故障码">
<Rect left="1750" top="234" right="1850" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="85" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1750" top="304" right="1850" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="86" ActivityType="4" flags="0" name="路由节点">
<Rect left="1784" top="84" right="1816" bottom="116"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="PDC">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A6" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AE" description="CAN的接收ID"/>
</Variables>
<Rect left="1870" top="164" right="1970" bottom="196"/>
<TitleText Enable="1" Text="驻车雷达控制单元(PDC)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="88" ActivityType="13" flags="0" name="清故障码">
<Rect left="1870" top="234" right="1970" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="89" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1870" top="304" right="1970" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="1904" top="84" right="1936" bottom="116"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="AVM">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x726" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72E" description="CAN的接收ID"/>
</Variables>
<Rect left="1990" top="164" right="2090" bottom="196"/>
<TitleText Enable="1" Text="全景可视(AVM)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="92" ActivityType="13" flags="0" name="清故障码">
<Rect left="1990" top="234" right="2090" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="93" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1990" top="304" right="2090" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="2024" top="84" right="2056" bottom="116"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="IFC">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x722" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72A" description="CAN的接收ID"/>
</Variables>
<Rect left="2110" top="164" right="2210" bottom="196"/>
<TitleText Enable="1" Text="智能前摄像头(IFC)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="96" ActivityType="13" flags="0" name="清故障码">
<Rect left="2110" top="234" right="2210" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="97" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2110" top="304" right="2210" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="84" right="2176" bottom="116"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="ADV">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A5" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AD" description="CAN的接收ID"/>
</Variables>
<Rect left="2230" top="164" right="2330" bottom="196"/>
<TitleText Enable="1" Text="自动驾驶(ADV)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="100" ActivityType="13" flags="0" name="清故障码">
<Rect left="2230" top="234" right="2330" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="101" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2230" top="304" right="2330" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="2264" top="84" right="2296" bottom="116"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="BSD">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Rect left="2350" top="164" right="2450" bottom="196"/>
<TitleText Enable="1" Text="并线辅助(BSD)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="104" ActivityType="13" flags="0" name="清故障码">
<Rect left="2350" top="234" right="2450" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="105" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2350" top="304" right="2450" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="2384" top="84" right="2416" bottom="116"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="PDCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x755" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75D" description="CAN的接收ID"/>
</Variables>
<Rect left="2470" top="164" right="2570" bottom="196"/>
<TitleText Enable="1" Text="副驾驶侧车门(PDCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="108" ActivityType="13" flags="0" name="清故障码">
<Rect left="2470" top="234" right="2570" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="109" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2470" top="304" right="2570" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="2504" top="84" right="2536" bottom="116"/>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="DDCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x754" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75C" description="CAN的接收ID"/>
</Variables>
<Rect left="2590" top="164" right="2690" bottom="196"/>
<TitleText Enable="1" Text="驾驶员侧车门(DDCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="112" ActivityType="13" flags="0" name="清故障码">
<Rect left="2590" top="234" right="2690" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="113" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2590" top="304" right="2690" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="114" ActivityType="4" flags="0" name="路由节点">
<Rect left="2624" top="84" right="2656" bottom="116"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="RLDCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x756" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75E" description="CAN的接收ID"/>
</Variables>
<Rect left="2710" top="164" right="2810" bottom="196"/>
<TitleText Enable="1" Text="左后车门(RLDCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="116" ActivityType="13" flags="0" name="清故障码">
<Rect left="2710" top="234" right="2810" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="117" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2710" top="304" right="2810" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="118" ActivityType="4" flags="0" name="路由节点">
<Rect left="2744" top="84" right="2776" bottom="116"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="RRDCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x757" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75F" description="CAN的接收ID"/>
</Variables>
<Rect left="2830" top="164" right="2930" bottom="196"/>
<TitleText Enable="1" Text="右后车门(RRDCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="120" ActivityType="13" flags="0" name="清故障码">
<Rect left="2830" top="234" right="2930" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="121" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2830" top="304" right="2930" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="2864" top="84" right="2896" bottom="116"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="DSCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x760" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x768" description="CAN的接收ID"/>
</Variables>
<Rect left="2960" top="164" right="3060" bottom="196"/>
<TitleText Enable="1" Text="座椅(DSCU)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="124" ActivityType="13" flags="0" name="清故障码">
<Rect left="2960" top="234" right="3060" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="125" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="2960" top="304" right="3060" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="2994" top="84" right="3026" bottom="116"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="SCM">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x753" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Rect left="3080" top="164" right="3180" bottom="196"/>
<TitleText Enable="1" Text="转向柱(SCM)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="128" ActivityType="13" flags="0" name="清故障码">
<Rect left="3080" top="234" right="3180" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="129" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3080" top="304" right="3180" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="130" ActivityType="4" flags="0" name="路由节点">
<Rect left="3114" top="84" right="3146" bottom="116"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="T-BOX-TBD">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Rect left="3200" top="164" right="3300" bottom="196"/>
<TitleText Enable="1" Text="车联网系统(T-BOX-TBD)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="132" ActivityType="13" flags="0" name="清故障码">
<Rect left="3200" top="234" right="3300" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="133" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3200" top="304" right="3300" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="134" ActivityType="4" flags="0" name="路由节点">
<Rect left="3234" top="84" right="3266" bottom="116"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="AC">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x740" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x748" description="CAN的接收ID"/>
</Variables>
<Rect left="3320" top="164" right="3420" bottom="196"/>
<TitleText Enable="1" Text="空调(AC)"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="136" ActivityType="13" flags="0" name="清故障码">
<Rect left="3320" top="234" right="3420" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="137" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3320" top="304" right="3420" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="138" ActivityType="4" flags="0" name="路由节点">
<Rect left="3354" top="84" right="3386" bottom="116"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="BCM1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Rect left="3440" top="164" right="3540" bottom="196"/>
<TitleText Enable="1" Text="车身控制器1(BCM1)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="140" ActivityType="13" flags="0" name="清故障码">
<Rect left="3440" top="234" right="3540" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="141" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3440" top="304" right="3540" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="3474" top="84" right="3506" bottom="116"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="BCM2">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x751" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x759" description="CAN的接收ID"/>
</Variables>
<Rect left="3560" top="164" right="3660" bottom="196"/>
<TitleText Enable="1" Text="车身控制器2(BCM2)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="144" ActivityType="13" flags="0" name="清故障码">
<Rect left="3560" top="234" right="3660" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="145" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3560" top="304" right="3660" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="3594" top="84" right="3626" bottom="116"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="PEPS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Rect left="3680" top="164" right="3780" bottom="196"/>
<TitleText Enable="1" Text="智能进入与启动控制单元(PEPS)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="148" ActivityType="13" flags="0" name="清故障码">
<Rect left="3680" top="234" right="3780" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="149" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3680" top="304" right="3780" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="3714" top="84" right="3746" bottom="116"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="PLGM">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x76C" description="CAN的接收ID"/>
</Variables>
<Rect left="3800" top="164" right="3900" bottom="196"/>
<TitleText Enable="1" Text="行李箱(PLGM)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="152" ActivityType="13" flags="0" name="清故障码">
<Rect left="3800" top="234" right="3900" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="153" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3800" top="304" right="3900" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="3834" top="84" right="3866" bottom="116"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="ACP_F">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x742" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74A" description="CAN的接收ID"/>
</Variables>
<Rect left="3920" top="164" right="4020" bottom="196"/>
<TitleText Enable="1" Text="前中控开关(ACP_F)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()
engine.Delay(100)</Script></Activity>
<Activity id="156" ActivityType="13" flags="0" name="清故障码">
<Rect left="3920" top="234" right="4020" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="157" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="3920" top="304" right="4020" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="3954" top="84" right="3986" bottom="116"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="ACP_R">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x743" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74B" description="CAN的接收ID"/>
</Variables>
<Rect left="4040" top="164" right="4140" bottom="196"/>
<TitleText Enable="1" Text="后中控开关(ACP_R)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="160" ActivityType="13" flags="0" name="清故障码">
<Rect left="4040" top="234" right="4140" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="161" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4040" top="304" right="4140" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="4074" top="84" right="4106" bottom="116"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="IVI">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x780" description="CAN的接收ID"/>
</Variables>
<Rect left="4160" top="164" right="4260" bottom="196"/>
<TitleText Enable="1" Text="车载娱乐(IVI)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="164" ActivityType="13" flags="0" name="清故障码">
<Rect left="4160" top="234" right="4260" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="165" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4160" top="304" right="4260" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="4194" top="84" right="4226" bottom="116"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="DVR">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x775" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77D" description="CAN的接收ID"/>
</Variables>
<Rect left="4280" top="164" right="4380" bottom="196"/>
<TitleText Enable="1" Text="行车记录仪(DVR)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="168" ActivityType="13" flags="0" name="清故障码">
<Rect left="4280" top="234" right="4380" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="169" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4280" top="304" right="4380" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="170" ActivityType="4" flags="0" name="路由节点">
<Rect left="4314" top="84" right="4346" bottom="116"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="SCCU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x762" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x76A" description="CAN的接收ID"/>
</Variables>
<Rect left="4400" top="164" right="4500" bottom="196"/>
<TitleText Enable="1" Text="座椅环境控制器(SCCU)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="172" ActivityType="13" flags="0" name="清故障码">
<Rect left="4400" top="234" right="4500" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="173" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4400" top="304" right="4500" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="4434" top="84" right="4466" bottom="116"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="ALS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x730" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CAN的接收ID"/>
</Variables>
<Rect left="4520" top="164" right="4620" bottom="196"/>
<TitleText Enable="1" Text="大灯(ALS)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="176" ActivityType="13" flags="0" name="清故障码">
<Rect left="4520" top="234" right="4620" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="177" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4520" top="304" right="4620" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="4554" top="84" right="4586" bottom="116"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="AFS">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x730" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CAN的接收ID"/>
</Variables>
<Rect left="4640" top="164" right="4740" bottom="196"/>
<TitleText Enable="1" Text="大灯(AFS)"/>
<Line2Text Enable="1"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="184" ActivityType="13" flags="0" name="清故障码">
<Rect left="4640" top="234" right="4740" bottom="266"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="185" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="4640" top="304" right="4740" bottom="336"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="186" ActivityType="4" flags="0" name="路由节点">
<Rect left="4674" top="84" right="4706" bottom="116"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="车型设置">
<Rect left="260" top="84" right="360" bottom="116"/>
<Script>DString_Car_Type = engine.CarType
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="188" type="0">
</Transition>
<Transition StartId="3" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="41" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="0">
</Transition>
<Transition StartId="40" EndId="45" type="0">
</Transition>
<Transition StartId="41" EndId="38" type="1">
<Expression>EMS_partnumber ~= ""</Expression></Transition>
<Transition StartId="41" EndId="45" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="50" type="0">
</Transition>
<Transition StartId="45" EndId="42" type="1">
<Expression>AT_partnumber ~= ""</Expression></Transition>
<Transition StartId="45" EndId="50" type="0">
</Transition>
<Transition StartId="46" EndId="3" type="1">
<Expression>GW_partnumber ~= ""</Expression></Transition>
<Transition StartId="46" EndId="41" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="54" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="1">
<Expression>EGSM_partnumber ~= ""</Expression></Transition>
<Transition StartId="50" EndId="54" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="58" type="0">
</Transition>
<Transition StartId="54" EndId="51" type="1">
<Expression>ACM_partnumber ~= ""</Expression></Transition>
<Transition StartId="54" EndId="58" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="62" type="0">
</Transition>
<Transition StartId="58" EndId="55" type="1">
<Expression>ACU_partnumber ~= ""</Expression></Transition>
<Transition StartId="58" EndId="62" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="70" type="0">
</Transition>
<Transition StartId="62" EndId="59" type="1">
<Expression>ESP_partnumber ~= ""</Expression></Transition>
<Transition StartId="62" EndId="70" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="74" type="0">
</Transition>
<Transition StartId="70" EndId="67" type="1">
<Expression>SAS_partnumber ~= ""</Expression></Transition>
<Transition StartId="70" EndId="74" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="78" type="0">
</Transition>
<Transition StartId="74" EndId="71" type="1">
<Expression>EPS_partnumber ~= ""</Expression></Transition>
<Transition StartId="74" EndId="78" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="77" type="0">
</Transition>
<Transition StartId="77" EndId="82" type="0">
</Transition>
<Transition StartId="78" EndId="75" type="1">
<Expression>TOD_partnumber ~= ""</Expression></Transition>
<Transition StartId="78" EndId="82" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="86" type="0">
</Transition>
<Transition StartId="82" EndId="79" type="1">
<Expression>AirSuspension_partnumber ~= ""</Expression></Transition>
<Transition StartId="82" EndId="86" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="90" type="0">
</Transition>
<Transition StartId="86" EndId="83" type="1">
<Expression>DMSCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="86" EndId="90" type="0">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="94" type="0">
</Transition>
<Transition StartId="90" EndId="87" type="1">
<Expression>PDC_partnumber ~= ""</Expression></Transition>
<Transition StartId="90" EndId="94" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="98" type="0">
</Transition>
<Transition StartId="94" EndId="91" type="1">
<Expression>AVM_partnumber ~= ""</Expression></Transition>
<Transition StartId="94" EndId="98" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="102" type="0">
</Transition>
<Transition StartId="98" EndId="95" type="1">
<Expression>IFC_partnumber ~= ""</Expression></Transition>
<Transition StartId="98" EndId="102" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="106" type="0">
</Transition>
<Transition StartId="102" EndId="99" type="1">
<Expression>ADV_partnumber ~= ""</Expression></Transition>
<Transition StartId="102" EndId="106" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="110" type="0">
</Transition>
<Transition StartId="106" EndId="103" type="1">
<Expression>BSD_partnumber ~= ""</Expression></Transition>
<Transition StartId="106" EndId="110" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="0">
</Transition>
<Transition StartId="109" EndId="114" type="0">
</Transition>
<Transition StartId="110" EndId="107" type="1">
<Expression>PDCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="110" EndId="114" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="118" type="0">
</Transition>
<Transition StartId="114" EndId="111" type="1">
<Expression>DDCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="114" EndId="118" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="122" type="0">
</Transition>
<Transition StartId="118" EndId="115" type="1">
<Expression>RLDCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="118" EndId="122" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="126" type="0">
</Transition>
<Transition StartId="122" EndId="119" type="1">
<Expression>RRDCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="122" EndId="126" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="130" type="0">
</Transition>
<Transition StartId="126" EndId="123" type="1">
<Expression>DSCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="126" EndId="130" type="0">
</Transition>
<Transition StartId="127" EndId="128" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="0">
</Transition>
<Transition StartId="129" EndId="134" type="0">
</Transition>
<Transition StartId="130" EndId="127" type="1">
<Expression>SCN_partnumber ~= ""</Expression></Transition>
<Transition StartId="130" EndId="134" type="0">
</Transition>
<Transition StartId="131" EndId="132" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="0">
</Transition>
<Transition StartId="133" EndId="138" type="0">
</Transition>
<Transition StartId="134" EndId="131" type="1">
<Expression>TBOX_partnumber ~= ""</Expression></Transition>
<Transition StartId="134" EndId="138" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="142" type="0">
</Transition>
<Transition StartId="138" EndId="135" type="1">
<Expression>AC_partnumber ~= ""</Expression></Transition>
<Transition StartId="138" EndId="142" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="146" type="0">
</Transition>
<Transition StartId="142" EndId="139" type="1">
<Expression>BCM1_partnumber ~= ""</Expression></Transition>
<Transition StartId="142" EndId="146" type="0">
</Transition>
<Transition StartId="143" EndId="144" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="150" type="0">
</Transition>
<Transition StartId="146" EndId="143" type="1">
<Expression>BCM2_partnumber ~= ""</Expression></Transition>
<Transition StartId="146" EndId="150" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="149" type="0">
</Transition>
<Transition StartId="149" EndId="154" type="0">
</Transition>
<Transition StartId="150" EndId="147" type="1">
<Expression>PEPS_partnumber ~= ""</Expression></Transition>
<Transition StartId="150" EndId="154" type="0">
</Transition>
<Transition StartId="151" EndId="152" type="0">
</Transition>
<Transition StartId="152" EndId="153" type="0">
</Transition>
<Transition StartId="153" EndId="158" type="0">
</Transition>
<Transition StartId="154" EndId="151" type="1">
<Expression>PLGM_partnumber ~= ""</Expression></Transition>
<Transition StartId="154" EndId="158" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="157" EndId="162" type="0">
</Transition>
<Transition StartId="158" EndId="155" type="1">
<Expression>ACP_F_partnumber ~= ""</Expression></Transition>
<Transition StartId="158" EndId="162" type="0">
</Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="166" type="0">
</Transition>
<Transition StartId="162" EndId="159" type="1">
<Expression>ACP_R_partnumber ~= ""</Expression></Transition>
<Transition StartId="162" EndId="166" type="0">
</Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="170" type="0">
</Transition>
<Transition StartId="166" EndId="163" type="1">
<Expression>IVI_partnumber ~= ""</Expression></Transition>
<Transition StartId="166" EndId="170" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="174" type="0">
</Transition>
<Transition StartId="170" EndId="167" type="1">
<Expression>DVR_partnumber ~= ""</Expression></Transition>
<Transition StartId="170" EndId="174" type="0">
</Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="178" type="0">
</Transition>
<Transition StartId="174" EndId="171" type="1">
<Expression>SCCU_partnumber ~= ""</Expression></Transition>
<Transition StartId="174" EndId="178" type="0">
</Transition>
<Transition StartId="175" EndId="176" type="0">
</Transition>
<Transition StartId="176" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="186" type="0">
</Transition>
<Transition StartId="178" EndId="175" type="1">
<Expression>ALS_partnumber ~= ""</Expression></Transition>
<Transition StartId="178" EndId="186" type="0">
</Transition>
<Transition StartId="183" EndId="184" type="0">
</Transition>
<Transition StartId="184" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="2" type="0">
</Transition>
<Transition StartId="186" EndId="183" type="1">
<Expression>ALS_partnumber ~= ""</Expression></Transition>
<Transition StartId="188" EndId="46" type="0">
</Transition>
</Transitions>
</Process>

