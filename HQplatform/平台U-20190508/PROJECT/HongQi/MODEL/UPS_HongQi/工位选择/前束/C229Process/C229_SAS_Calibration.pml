<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="650" top="104" right="750" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="650" top="764" right="750" bottom="796"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="1" name="扩展会话">
<Rect left="650" top="224" right="750" bottom="256"/>
<TitleText Enable="1" Text="SAS 转角传感器标定"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="EcuOpen">
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
<Variable id="CAN_RCV_ID" type="3" data="0x7AA" description="CAN的接收ID"/>
<Variable id="CAN_SND_ID" type="3" data="0x7A2" description="CAN的发送ID"/>
</Variables>
<Rect left="650" top="164" right="750" bottom="196"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script></Activity>
<Activity id="6" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="164" right="436" bottom="196"/>
</Activity>
<Activity id="7" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="224" right="436" bottom="256"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="通讯失败">
<Rect left="510" top="224" right="610" bottom="256"/>
<Line1Text Enable="1" Text="SAS控制器连接失败！"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="79" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="284" right="576" bottom="316"/>
</Activity>
<Activity id="86" ActivityType="13" flags="0" name="安全访问">
<Rect left="650" top="344" right="750" bottom="376"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xA8CB7ADC"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="88" ActivityType="13" flags="0" name="解除标定">
<Rect left="650" top="404" right="750" bottom="436"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="解除标定"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xDF\x90&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="90" ActivityType="13" flags="0" name="标定">
<Rect left="650" top="464" right="750" bottom="496"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="开始标定"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xDF\x91&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="91" ActivityType="13" flags="0" name="清除故障码">
<Rect left="650" top="524" right="750" bottom="556"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Activity id="92" ActivityType="13" flags="0" name="读取故障码故障码">
<Rect left="650" top="584" right="750" bottom="616"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="SAS"/>
<Line2Text Enable="1" Text="读取故障码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x19"/>
<Parameter id="resTitle" value="0x59"/>
<Parameter id="sendTel" value="&apos;\x02\09&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="93" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="644" right="436" bottom="676"/>
</Activity>
<Activity id="94" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="650" top="644" right="750" bottom="676"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="78" type="0">
</Transition>
<Transition StartId="3" EndId="86" type="3">
</Transition>
<Transition StartId="4" EndId="3" type="3">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="93" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="78" EndId="7" type="5">
</Transition>
<Transition StartId="79" EndId="3" type="0">
</Transition>
<Transition StartId="86" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="91" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="94" type="0">
</Transition>
<Transition StartId="93" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

