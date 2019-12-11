<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="CarType" type="8" dir="1" data=""/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="64" right="530" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="270" top="424" right="370" bottom="456"/>
<Script>#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="430" top="124" right="530" bottom="156"/>
<TitleText Enable="1" Text="IVI(车载娱乐)"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="通讯">
<Rect left="430" top="174" right="530" bottom="206"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="174" right="370" bottom="206"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script> CarType = ""
#PRESSBUTTON</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="结束通讯">
<Rect left="270" top="124" right="370" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="306" ActivityType="3" flags="1" name="读车型">
<Rect left="430" top="424" right="530" bottom="456"/>
<Line2Text Enable="1" Text="读车型"/>
<Script>#COMM 0x22 0xF1 0xA0

if(@0==0x62)then
        CarType = engine.GetResponseString(3,-1)
        engine.SetLineText(3,CarType);
        print("IVI CarTye:"..CarType)
else
	CarType = ""
end

if (LibGeneral.CarTNC_All(CarType)) then
else
	CarType = ""
end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="89" type="0">
</Transition>
<Transition StartId="6" EndId="306" type="0">
</Transition>
<Transition StartId="89" EndId="208" type="0">
</Transition>
<Transition StartId="89" EndId="2" type="5">
</Transition>
<Transition StartId="208" EndId="3" type="0">
</Transition>
<Transition StartId="306" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

