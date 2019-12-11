<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="CommErr" type="8" dir="1" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x774" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x794" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="108" top="77" right="208" bottom="109"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="107" top="310" right="207" bottom="342"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="连接ECU">
<Rect left="107" top="146" right="207" bottom="178"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="通讯">
<Rect left="106" top="224" right="206" bottom="256"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="通讯失败">
<Rect left="227" top="225" right="327" bottom="257"/>
<Line1Text Enable="1" Text="TBOX 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="结束通讯">
<Rect left="227" top="146" right="327" bottom="178"/>
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

