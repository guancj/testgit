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
<Rect left="350" top="74" right="450" bottom="106"/>
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
<Activity id="2" ActivityType="3" flags="0" name="选择类型">
<Rect left="351" top="165" right="451" bottom="197"/>
<Line1Text Enable="1" Text="选择车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
engine.ListAddString("单独控制器返修",false);
engine.ListAddString("清所有DTC",false);
engine.ListAddString("读所有DTC",false);
engine.ListAddString("清除后再读所有DTC",false);
engine.ListAddString("匹配遥控钥匙",false);
engine.ListAddString("PEPS 匹配 EMS",false);
engine.ListAddString("PEPS 匹配 ESCL",false);
engine.ListAddString("PEPS 匹配 HCU",false);
engine.ListAddString("HCU C0自学习",false);
engine.ListAddString("DCT 双离合器自学习",false);
engine.ListAddString("EMS 摩擦力及分段自学习",false);
engine.ListAddString("EMS 电子节气门自学习",false);
engine.ListAddString("HCU 激活车辆运输模式",false);
engine.ListAddString("HCU 取消车辆运输模式",false);
engine.ListAddString("HCU Flash",false);
engine.ListAddString("单独控制器读ECU信息",false);
engine.ListAddString("读所有控制器信息",false);
engine.ListAddString("写所有控制器配置码",false);
engine.ListAddString("BSD测试",false);
engine.ListAddString("BSD 写入LED结果",false);


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

