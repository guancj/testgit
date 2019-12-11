<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1052" pbltext="DEP858">
<Parameters>
<Variable id="vciHandl_hcu" type="3" dir="1" data="vciHandl_hcu" description="vciHandl_hcu"/>
<Variable id="CommErr" type="3" dir="1" data="0"/>
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
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="128" right="228" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="1" name="结束节点">
<Rect left="129" top="167" right="229" bottom="199"/>
<Script>engine.println("HCU通讯标志位CommErr="..CommErr);</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="HCU通讯">
<Rect top="106" right="100" bottom="138"/>
<Script>vciHandl_hcu = engine.EcuOpen()
engine.println("第二通讯vciHandl_hcu="..vciHandl_hcu)</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="连接ECU">
<Rect left="129" top="60" right="229" bottom="92"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>vciHandl_hcu = engine.EcuOpen()
engine.println("第二通讯vciHandl_hcu="..vciHandl_hcu)</Script></Activity>
<Activity id="5" ActivityType="3" flags="1" name="通讯">
<Rect left="129" top="108" right="229" bottom="140"/>
<Script>engine.SetRequestByte(0,0x22)
engine.SetRequestByte(1,0xF1)
engine.SetRequestByte(2,0x87)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

CommErr=0;
if(@0 == 0x62)then
     CommErr=0;
     engine.LastError = 0;
else
     engine.LastError = 1;
     CommErr=1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="通讯失败">
<Rect left="242" top="108" right="342" bottom="140"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="结束通讯">
<Rect left="242" top="58" right="342" bottom="90"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="2" type="3">
</Transition>
<Transition StartId="5" EndId="6" type="4">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="5">
</Transition>
<Transition StartId="7" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

