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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="270" top="84" right="370" bottom="116"/>
<Script>engine.KNR  = "";</Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="270" top="574" right="370" bottom="606"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" name="ECU_Open">
<Rect left="270" top="164" right="370" bottom="196"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" name="ECU_DataExchange">
<Rect left="270" top="244" right="370" bottom="276"/>
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
<Activity id="305" ActivityType="13" name="ECU_DataExchange">
<Rect left="270" top="324" right="370" bottom="356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\xA0&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="309" ActivityType="3" name="普通节点">
<Rect left="270" top="404" right="370" bottom="436"/>
<Script>engine.KNR =  string.sub(DVciResult,4,10)
print("KNR###"..tostring(engine.KNR))
print("VIN###"..tostring(engine.VIN))</Script></Activity>
<Activity id="310" ActivityType="13" name="ECU_DataExchange">
<Rect left="420" top="324" right="520" bottom="356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\xA1&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="311" ActivityType="13" name="ECU_Close">
<Rect left="270" top="494" right="370" bottom="526"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="312" ActivityType="13" name="ECU_Close">
<Rect left="430" top="164" right="530" bottom="196"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="312" type="4">
</Transition>
<Transition StartId="4" EndId="305" type="0">
</Transition>
<Transition StartId="4" EndId="312" type="4">
</Transition>
<Transition StartId="305" EndId="310" type="1">
<Expression>engine.LastError ~= 0 or string.sub(DVciResult,4,5)~="CH"</Expression></Transition>
<Transition StartId="305" EndId="309" type="0">
</Transition>
<Transition StartId="309" EndId="311" type="0">
</Transition>
<Transition StartId="310" EndId="309" type="0">
</Transition>
<Transition StartId="311" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

