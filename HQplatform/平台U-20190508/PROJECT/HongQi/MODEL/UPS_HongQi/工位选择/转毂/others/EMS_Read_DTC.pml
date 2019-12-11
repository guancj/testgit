<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1113" pbltext="DEP142">
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
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="450" top="24" right="550" bottom="56"/>
<Script></Script><TitleText Enable="1" Text="发动机检测 (EMS)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="450" top="604" right="550" bottom="636"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="450" top="114" right="550" bottom="146"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="450" top="194" right="550" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="UDS_ReadDTCByStatusMask">
<Rect left="920" top="294" right="1020" bottom="326"/>
<TitleText Enable="1" Text="EMS 读取DTC"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x0C"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="306" ActivityType="13" flags="0" name="UDS_DTCFilterStatisticList">
<Rect left="920" top="374" right="1020" bottom="406"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="true"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="307" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="610" top="194" right="710" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="309" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="450" top="524" right="550" bottom="556"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="310" ActivityType="13" flags="0" name="读故障码">
<Rect left="450" top="254" right="550" bottom="286"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x19"/>
<Parameter id="resTitle" value="0x59"/>
<Parameter id="sendTel" value="&apos;\x02\x09&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="100" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="1241" ActivityType="3" flags="0" name="数据处理">
<Rect left="450" top="324" right="550" bottom="356"/>
<Script>dtc = LibGeneral.hex2str(recvTel:sub(4))

print("EMS DTC:"..dtc)</Script></Activity>
<Activity id="1242" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="450" top="384" right="550" bottom="416"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1243" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="450" top="444" right="550" bottom="476"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EMS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="101" name="DEP2057" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="310" type="0">
</Transition>
<Transition StartId="4" EndId="307" type="4">
</Transition>
<Transition StartId="5" EndId="306" type="0">
</Transition>
<Transition StartId="309" EndId="2" type="0">
</Transition>
<Transition StartId="310" EndId="1241" type="0">
</Transition>
<Transition StartId="1241" EndId="1242" type="0">
</Transition>
<Transition StartId="1242" EndId="1243" type="0">
</Transition>
<Transition StartId="1243" EndId="309" type="0">
</Transition>
</Transitions>
</Process>

