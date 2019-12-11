<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="104" right="590" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="524" right="590" bottom="556"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
	--[[if(engine.LastError ~= 0) then
	engine.StatValue = "ECU Close fail ";	
	end --]]

end
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="结果确认">
<Rect left="490" top="164" right="590" bottom="196"/>
<TitleText Enable="1" Text="BSD 写入LED结果"/>
<Line1Text Enable="1" Text="请确认BSD安装角度是否在合格范围"/>
<Line2Text Enable="1" Text="确认后视镜LED亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "yellow"
engine.SetLineText(2,"#L=" .. "可以吗?" .. "#R=BMPEYE");
#PRESSBUTTON
if (engine.LButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "可以吗?" .. "#R=BMPNOK");
engine.ShowMessage();
engine.LastError = 1;
engine.StatValue = "NOK";

elseif (engine.RButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "可以吗?" .. "#R=BMPOK");
engine.ShowMessage();
engine.LastError = 0;
engine.StatValue = "OK";

end;
engine.DialogBackColor = -1;</Script><assessment no="20" name="DEP2375" type="8" flags="97"/>
</Activity>
<Activity id="1418" ActivityType="3" flags="0" name="ECU_OpenH7">
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
<Variable id="CAN_SND_ID" type="3" data="0x72B" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x731" description="CAN的接收ID"/>
</Variables>
<Rect left="490" top="224" right="590" bottom="256"/>
<Script>vciHandle = LibGeneral.ECU_Open()</Script><assessment no="1" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="1419" ActivityType="13" flags="0" name="扩展会话">
<Rect left="490" top="284" right="590" bottom="316"/>
<Line1Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1112" type="8" flags="97"/>
</Activity>
<Activity id="1420" ActivityType="13" flags="0" name="BSD_SecurityAlgorithm">
<Rect left="490" top="344" right="590" bottom="376"/>
<Line1Text Enable="1" Text="安全访问"/>
<FunctionRef id="BSD_SecurityAlgorithm" model="LibGeneral">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xD3F102E4"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP872" type="8" flags="97"/>
</Activity>
<Activity id="1421" ActivityType="3" flags="1" name="WriteResult">
<Rect left="490" top="404" right="590" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="标定结果写入BSD"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>	resultSend = "\x01\x40\x08\x02"
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,resultSend)
resultSend = LibGeneral.hex2str(resultSend)
recvTel = LibGeneral.hex2str(recvTel)
engine.StatValue = resultSend .. "    ," ..recvTel</Script><assessment no="12" name="DEP2236" type="8" flags="97"/>
</Activity>
<Activity id="1422" ActivityType="3" flags="0" name="退出">
<Rect left="640" top="164" right="740" bottom="196"/>
<Script></Script></Activity>
<Activity id="1423" ActivityType="3" flags="0" name="ECU Close">
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Rect left="490" top="464" right="590" bottom="496"/>
<Script>engine.EcuClose(vciHandle)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1418" type="0">
</Transition>
<Transition StartId="3" EndId="1422" type="4">
</Transition>
<Transition StartId="1418" EndId="1419" type="0">
</Transition>
<Transition StartId="1419" EndId="1420" type="0">
</Transition>
<Transition StartId="1420" EndId="1421" type="0">
</Transition>
<Transition StartId="1421" EndId="1423" type="0">
</Transition>
<Transition StartId="1423" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

