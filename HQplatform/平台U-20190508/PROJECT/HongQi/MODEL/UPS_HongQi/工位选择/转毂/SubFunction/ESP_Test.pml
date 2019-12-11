<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="50" top="84" right="150" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="50" top="724" right="150" bottom="756"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" name="ECU_Open">
<Rect left="50" top="164" right="150" bottom="196"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="304" ActivityType="13" name="ECU_DataExchange">
<Rect left="50" top="244" right="150" bottom="276"/>
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
<Activity id="305" ActivityType="13" name="UDS_ReadDTCByStatusMask">
<Rect left="50" top="564" right="150" bottom="596"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x08"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="306" ActivityType="13" name="UDS_DTCFilterStatisticList">
<Rect left="50" top="644" right="150" bottom="676"/>
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
<Activity id="308" ActivityType="13" name="ECU_DataExchange">
<Rect left="50" top="324" right="150" bottom="356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x27"/>
<Parameter id="resTitle" value="0x67"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="313" ActivityType="13" name="ECU_DataExchange">
<Rect left="50" top="484" right="150" bottom="516"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x27"/>
<Parameter id="resTitle" value="0x67"/>
<Parameter id="sendTel" value="ESP_Key_HEX"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="314" ActivityType="3" name="安全算法">
<Rect left="50" top="404" right="150" bottom="436"/>
<Script>	m0 = string.sub(DVciResult,3,3)
	s0 = LibGeneral.binStr2Int(m0)

	m1 = string.sub(DVciResult,4,4)
	s1 = LibGeneral.binStr2Int(m1)

	m2 = string.sub(DVciResult,5,5)
	s2 = LibGeneral.binStr2Int(m2)

	m3 = string.sub(DVciResult,6,6)
	s3 = LibGeneral.binStr2Int(m3)
	
        seed=bit32.lshift(s0,24)+bit32.lshift(s1,16)+bit32.lshift(s2,8)+s3;
	key=bit32.bxor(bit32.lshift(bit32.bxor(bit32.rshift(seed,3),seed),4),seed);

	key0=bit32.rshift(bit32.band(key,bit32.lshift(0xff,24)),24);
	key1=bit32.rshift(bit32.band(key,bit32.lshift(0xff,16)),16);
	key2=bit32.rshift(bit32.band(key,bit32.lshift(0xff,8)),8);
	key3=bit32.rshift(bit32.band(key,bit32.lshift(0xff,0)),0);
        engine.println(string.format("%02x%02x%02x%02x",key0,key1,key2,key3));
	--return key0,key1,key2,key3;
        ESP_Key = string.format("%02x%02x%02x%02x",key0,key1,key2,key3)
        ESP_KeyHEX = LibGeneral.str2hex(ESP_Key)
        ESP_Key_HEX = "\x02"..ESP_KeyHEX;</Script></Activity>
<Activity id="1554" ActivityType="3" name="普通节点">
<Rect left="240" top="214" right="340" bottom="246"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="304" type="0">
</Transition>
<Transition StartId="304" EndId="308" type="0">
</Transition>
<Transition StartId="305" EndId="306" type="0">
</Transition>
<Transition StartId="306" EndId="2" type="0">
</Transition>
<Transition StartId="308" EndId="314" type="0">
</Transition>
<Transition StartId="313" EndId="305" type="0">
</Transition>
<Transition StartId="314" EndId="313" type="0">
</Transition>
</Transitions>
</Process>

