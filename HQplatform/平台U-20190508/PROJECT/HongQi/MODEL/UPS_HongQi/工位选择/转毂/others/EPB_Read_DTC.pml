<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1601" pbltext="DEP85">
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
<Variable id="CAN_RCV_ID" type="3" data="0x7C3" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="380" top="74" right="480" bottom="106"/>
<Script></Script><TitleText Enable="1" Text="电子驻车(EPB)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="684" right="480" bottom="716"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="380" top="154" right="480" bottom="186"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="切换诊断模式">
<Rect left="380" top="234" right="480" bottom="266"/>
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
<Rect left="380" top="614" right="480" bottom="646"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1236" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="550" top="234" right="650" bottom="266"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1238" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="380" top="294" right="480" bottom="326"/>
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
<Activity id="1240" ActivityType="13" flags="0" name="读故障码">
<Rect left="380" top="364" right="480" bottom="396"/>
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
<assessment no="20" name="DEP88" type="8" flags="97"/>
</Activity>
<Activity id="1241" ActivityType="3" flags="0" name="数据处理">
<Rect left="380" top="434" right="480" bottom="466"/>
<Script>dtc = LibGeneral.hex2str(recvTel:sub(4))

print("EPB DTC:"..dtc)</Script></Activity>
<Activity id="1242" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="380" top="494" right="480" bottom="526"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1243" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="380" top="554" right="480" bottom="586"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EPB&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1582" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="1238" type="0">
</Transition>
<Transition StartId="4" EndId="1236" type="4">
</Transition>
<Transition StartId="307" EndId="2" type="0">
</Transition>
<Transition StartId="1238" EndId="1240" type="0">
</Transition>
<Transition StartId="1240" EndId="1241" type="0">
</Transition>
<Transition StartId="1241" EndId="1242" type="0">
</Transition>
<Transition StartId="1242" EndId="1243" type="0">
</Transition>
<Transition StartId="1243" EndId="307" type="0">
</Transition>
</Transitions>
</Process>

