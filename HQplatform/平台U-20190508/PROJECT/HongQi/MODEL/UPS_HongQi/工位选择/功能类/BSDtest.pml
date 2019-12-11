<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="580" top="74" right="680" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="580" top="494" right="680" bottom="526"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="ECU_OpenH7">
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
<Variable id="CAN_SND_ID" type="3" data="0x72B" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x731" description="CAN的接收ID"/>
</Variables>
<Rect left="580" top="134" right="680" bottom="166"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="150" ActivityType="13" flags="0" name="扩展会话">
<Rect left="580" top="194" right="680" bottom="226"/>
<Line1Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="151" ActivityType="13" flags="0" name="BSD_SecurityAlgorithm">
<Rect left="580" top="254" right="680" bottom="286"/>
<Line1Text Enable="1" Text="安全访问"/>
<FunctionRef id="BSD_SecurityAlgorithm" model="LibGeneral">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xD3F102E4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="152" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="580" top="314" right="680" bottom="346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x40\x08\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="153" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="580" top="374" right="680" bottom="406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x40\x07\x00\x59\x04\x00\x01\x00\x00\x00&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="154" ActivityType="3" flags="0" name="普通节点">
<Rect left="580" top="424" right="680" bottom="456"/>
<Script>recvTel = LibGeneral.hex2str(recvTel)

print("RecvTel:"..recvTel)</Script></Activity>
<Activity id="155" ActivityType="3" flags="0" name="普通节点">
<Rect left="370" top="194" right="470" bottom="226"/>
<Script>BrakeForce_FL = 2000

engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")


engine.Delay(50000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="152" type="0">
</Transition>
<Transition StartId="152" EndId="153" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

