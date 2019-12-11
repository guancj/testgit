<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1601" pbltext="DEP85">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C3" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="340" top="34" right="440" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="340" top="344" right="440" bottom="376"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="340" top="104" right="440" bottom="136"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP86" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="切换诊断模式">
<Rect left="340" top="164" right="440" bottom="196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1083" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="清除DTC">
<Rect left="340" top="224" right="440" bottom="256"/>
<TitleText Enable="1" Text="清EPB DTC"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP87" type="8" flags="97"/>
</Activity>
<Activity id="316" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="340" top="284" right="440" bottom="316"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1492" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="316" type="0">
</Transition>
<Transition StartId="316" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

