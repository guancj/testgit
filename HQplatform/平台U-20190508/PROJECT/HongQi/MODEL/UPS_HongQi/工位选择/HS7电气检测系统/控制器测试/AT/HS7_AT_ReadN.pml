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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="170" top="34" right="270" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="170" top="394" right="270" bottom="426"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="170" top="104" right="270" bottom="136"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="扩展会话">
<Rect left="170" top="164" right="270" bottom="196"/>
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
<Activity id="5" ActivityType="3" flags="0" name="AT 挂 N 档">
<Rect left="170" top="274" right="270" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请挂N档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x04\x19')

	Gears = string.byte(recvTel:sub(4,4))

until (Gears==0x02)
</Script></Activity>
<Activity id="7" ActivityType="3" flags="1" name="NOK">
<Rect left="360" top="254" right="460" bottom="286"/>
<Line2Text Enable="1" Text="AT ECU Communication NOK"/>
<Script></Script></Activity>
<Activity id="18" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="170" top="334" right="270" bottom="366"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="334" right="456" bottom="366"/>
</Activity>
<Activity id="230" ActivityType="3" flags="0" name="通讯失败">
<Rect left="320" top="154" right="420" bottom="186"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="231" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="310" top="94" right="410" bottom="126"/>
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
<Transition StartId="3" EndId="4" type="3">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="230" type="4">
</Transition>
<Transition StartId="5" EndId="18" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="21" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="0">
</Transition>
<Transition StartId="21" EndId="18" type="0">
</Transition>
<Transition StartId="230" EndId="231" type="0">
</Transition>
<Transition StartId="230" EndId="18" type="5">
</Transition>
<Transition StartId="231" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

