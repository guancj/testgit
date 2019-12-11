<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Repair_Selection" type="8" dir="1" data=""/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x4D8" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x6C3" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="351" top="76" right="451" bottom="108"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="351" top="254" right="451" bottom="286"/>
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
<Activity id="2" ActivityType="3" flags="1" name="选择类型">
<Rect left="351" top="165" right="451" bottom="197"/>
<Line1Text Enable="1" Text="选择车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
engine.ListAddString("FLASH单独刷写",false);
engine.ListAddString("FALSH台架刷写",false);
engine.ListAddString("刷写检查",false);

#INPUT  Repair_Selection
engine.SetLineText(3,Repair_Selection);
engine.SelectLayout(0);
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="1" type="0">
</Transition>
</Transitions>
</Process>

