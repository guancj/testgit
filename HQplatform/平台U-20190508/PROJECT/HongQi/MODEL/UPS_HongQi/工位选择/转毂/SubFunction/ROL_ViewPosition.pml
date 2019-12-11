<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="-1"/>
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="posValue" type="3" data="-1" description="IDT 车辆位置字节整数值"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="284" right="470" bottom="316"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_RTS_ViewPos">
<Rect left="740" top="144" right="840" bottom="176"/>
<FunctionRef id="IDT_RTS_ViewPos" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="posValue" ret="posValue"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="设置行驶方向提示">
<Rect left="740" top="234" right="840" bottom="266"/>
<Script>if posValue == 0 then
    engine.SetFooterText("#BMP=moveleft.bmp");
elseif posValue &gt; 0 and posValue &lt; 127 then
    engine.SetFooterText("#BMP=movelittleleft.bmp");
elseif posValue == 127 then
    engine.SetFooterText("#BMP=gostraight.bmp");
elseif posValue &gt;127 and posValue &lt; 255 then
    engine.SetFooterText("#BMP=movelittleright.bmp");
elseif posValue == 255 then
    engine.SetFooterText("#BMP=moveright.bmp");
else
    engine.println("### ROL_ViewPosition posValue not valid, posValue : " .. tostring(posValue));
    engine.SetFooterText("")
end</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="Delay 100ms">
<Rect left="910" top="144" right="1010" bottom="176"/>
<Script>engine.Delay(100);</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="CheckFINISHEDFLAG_ROL_ErrorMonitor">
<Rect left="910" top="234" right="1010" bottom="266"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="清空行驶方向提示">
<Rect left="910" top="314" right="1010" bottom="346"/>
<Script>engine.SetFooterText("")</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="方向图显示判断">
<Rect left="370" top="224" right="470" bottom="256"/>
<Script>local OldposValue = -1 
if (Handl ~= nil) then
	repeat
		local pos = 40; --从1开始计数
		local lastRev = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
		posValue = lastRev:sub(pos,pos):byte()
		if (posValue ~= OldposValue)then
			engine.println("IDT_RTS_ViewPos, posValue : " .. tostring(posValue))
			if posValue == 0 then
			    engine.SetFooterText("#BMP=moveleft.bmp");
			elseif posValue &gt; 0 and posValue &lt; 127 then
			    engine.SetFooterText("#BMP=movelittleleft.bmp");
			elseif posValue == 127 then
			    engine.SetFooterText("#BMP=gostraight.bmp");
			elseif posValue &gt;127 and posValue &lt; 255 then
			    engine.SetFooterText("#BMP=movelittleright.bmp");
			elseif posValue == 255 then
			    engine.SetFooterText("#BMP=moveright.bmp");
			else
			    engine.println("### ROL_ViewPosition posValue not valid, posValue : " .. tostring(posValue));
			    engine.SetFooterText("")
			end
			OldposValue = posValue
		end
	until(engine.UdpHandleVarGet(Handl, "_FINISHFLAG") == true)
        engine.SetFooterText("")
 else
    engine.println("IDT_RTS_ViewPos, input handle is not valid" .. tostring(pHndl))
    posValue = -1
 end
 
 </Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="9" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="3" type="0">
</Transition>
<Transition StartId="6" EndId="5" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="1">
<Expression>finishflag</Expression></Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

