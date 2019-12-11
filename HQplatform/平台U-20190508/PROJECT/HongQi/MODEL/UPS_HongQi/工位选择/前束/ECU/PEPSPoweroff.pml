<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1507" pbltext="DEP91">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="318" top="76" right="418" bottom="108"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="514" right="420" bottom="546"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="7" ActivityType="3" flags="0" name="清空显示">
<Rect left="320" top="334" right="420" bottom="366"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(3000)</Script></Activity>
<Activity id="16" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="320" top="124" right="420" bottom="156"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="扩展会话">
<Rect left="320" top="174" right="420" bottom="206"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="2" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="13" flags="0" name="安全访问">
<Rect left="320" top="224" right="420" bottom="256"/>
<Line2Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1444" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="强制下电">
<Rect left="320" top="284" right="420" bottom="316"/>
<Line2Text Enable="1" Text="强制下电"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2f"/>
<Parameter id="resTitle" value="0x6f"/>
<Parameter id="sendTel" value="&apos;\x01\x41\x03\x00&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1445" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="320" top="444" right="420" bottom="476"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1447" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="强制上电">
<Rect left="320" top="384" right="420" bottom="416"/>
<Line2Text Enable="1" Text="强制上电"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2f"/>
<Parameter id="resTitle" value="0x6f"/>
<Parameter id="sendTel" value="&apos;\x01\x41\x03\x02&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="5" name="DEP1446" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="16" type="0">
</Transition>
<Transition StartId="7" EndId="21" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="3">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="7" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="0">
</Transition>
<Transition StartId="21" EndId="20" type="0">
</Transition>
</Transitions>
</Process>

