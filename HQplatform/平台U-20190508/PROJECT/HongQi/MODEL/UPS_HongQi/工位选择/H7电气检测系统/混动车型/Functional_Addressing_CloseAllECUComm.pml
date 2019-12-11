<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Stop_Flag" type="8" dir="0" data="Stop_Flag"/>
</Parameters>
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
<Variable id="P3Max" type="3" data="2000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7DF" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7FF" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="55" top="58" right="155" bottom="90"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="56" top="299" right="156" bottom="331"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="通讯">
<Rect left="55" top="121" right="155" bottom="153"/>
<Script>
vciHandl1 = engine.EcuOpen()
engine.println("vciHandl1="..vciHandl1)
engine.println("功能寻址开始，断总线ECU通讯，Stop_Flag="..engine.SharedVarGet(Stop_Flag))</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="10 03">
<Rect left="190" top="120" right="290" bottom="152"/>
<Script>engine.SetRequestByte(0,0x10)
engine.SetRequestByte(1,0x03)
engine.EcuComm(vciHandl1,-1)</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="85 02">
<Rect left="190" top="181" right="290" bottom="213"/>
<Line1Text Enable="1" Text="停止故障码记录"/>
<Script>engine.SetRequestByte(0,0x85)
engine.SetRequestByte(1,0x02)
engine.EcuComm(vciHandl1,-1)</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="28 03 03">
<Rect left="189" top="243" right="289" bottom="275"/>
<Line1Text Enable="1" Text="停止通讯"/>
<Script>engine.SetRequestByte(0,0x28)
engine.SetRequestByte(1,0x03)
engine.SetRequestByte(2,0x03)
engine.EcuComm(vciHandl1,-1)</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="结束通讯">
<Rect left="190" top="299" right="290" bottom="331"/>
<Script>engine.EcuClose(vciHandl1)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

