<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1602" pbltext="DEP63">
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
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="34" right="460" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="车辆电子稳定系统 (ESP)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="360" top="584" right="460" bottom="616"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="360" top="114" right="460" bottom="146"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="360" top="194" right="460" bottom="226"/>
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
<Activity id="307" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="520" top="194" right="620" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1238" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="360" top="504" right="460" bottom="536"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1240" ActivityType="13" flags="0" name="读故障码">
<Rect left="360" top="254" right="460" bottom="286"/>
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
<assessment no="10" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="1241" ActivityType="3" flags="0" name="数据处理">
<Rect left="360" top="324" right="460" bottom="356"/>
<Script>dtc = LibGeneral.hex2str(recvTel:sub(4))

print("ESP DTC:"..dtc)</Script></Activity>
<Activity id="1242" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="360" top="384" right="460" bottom="416"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1243" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="360" top="444" right="460" bottom="476"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_ESP&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1575" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="1240" type="0">
</Transition>
<Transition StartId="4" EndId="307" type="4">
</Transition>
<Transition StartId="1238" EndId="2" type="0">
</Transition>
<Transition StartId="1240" EndId="1241" type="0">
</Transition>
<Transition StartId="1241" EndId="1242" type="0">
</Transition>
<Transition StartId="1242" EndId="1243" type="0">
</Transition>
<Transition StartId="1243" EndId="1238" type="0">
</Transition>
</Transitions>
</Process>

