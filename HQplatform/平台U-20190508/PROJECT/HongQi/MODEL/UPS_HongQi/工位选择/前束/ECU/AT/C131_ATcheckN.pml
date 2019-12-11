<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1509" pbltext="DEP31">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="302" top="64" right="402" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="434" right="400" bottom="466"/>
<Script>
if( vciHandle == nil or vciHandle &lt; 0) then 

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
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="302" top="120" right="402" bottom="152"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="扩展会话">
<Rect left="400" top="234" right="500" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x02&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="AT 挂 N 档">
<Rect left="400" top="304" right="500" bottom="336"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请挂N档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x01\x19')

	Gears = string.byte(recvTel:sub(4,4))

until (Gears==0x02)
</Script><assessment no="3" name="DEP506" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="234" right="650" bottom="266"/>
<Line2Text Enable="1" Text="AT ECU Communication NOK"/>
<Script></Script></Activity>
<Activity id="18" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="364" right="616" bottom="396"/>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="300" top="364" right="400" bottom="396"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="SecAce_General_AT">
<Rect left="550" top="114" right="650" bottom="146"/>
<FunctionRef id="SecAce_General_AT">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xB1CEE0B1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="3" flags="1" name="DCT 挂 N档">
<Rect left="200" top="304" right="300" bottom="336"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到N"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x01\x23')
if(@0==0x62)then
if(@3==0x03)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=3;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP474" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="1120" top="144" right="1220" bottom="176"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="31" ActivityType="13" flags="0" name="扩展会话">
<Rect left="1120" top="204" right="1220" bottom="236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x02&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="AT 挂 N 档">
<Rect left="1120" top="314" right="1220" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请挂N档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x01\x19')

	Gears = string.byte(recvTel:sub(4,4))

until (Gears==0x02)
</Script><assessment no="3" name="DEP506" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="NOK">
<Rect left="1360" top="244" right="1460" bottom="276"/>
<Line2Text Enable="1" Text="AT ECU Communication NOK"/>
<Script></Script></Activity>
<Activity id="34" ActivityType="4" flags="0" name="路由节点">
<Rect left="1394" top="394" right="1426" bottom="426"/>
</Activity>
<Activity id="35" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1120" top="394" right="1220" bottom="426"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="13" flags="0" name="SecAce_General_AT">
<Rect left="970" top="244" right="1070" bottom="276"/>
<FunctionRef id="SecAce_General_AT">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xB1CEE0B1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="38" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="184" right="366" bottom="216"/>
</Activity>
<Activity id="39" ActivityType="13" flags="0" name="扩展会话">
<Rect left="200" top="234" right="300" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="NOK">
<Rect left="50" top="234" right="150" bottom="266"/>
<Line2Text Enable="1" Text="DCT ECU Communication NOK"/>
<Script></Script></Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="364" right="116" bottom="396"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="17" type="0">
</Transition>
<Transition StartId="3" EndId="38" type="3">
</Transition>
<Transition StartId="4" EndId="6" type="3">
</Transition>
<Transition StartId="4" EndId="17" type="0">
</Transition>
<Transition StartId="6" EndId="19" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="2" type="0">
</Transition>
<Transition StartId="20" EndId="6" type="3">
</Transition>
<Transition StartId="20" EndId="17" type="0">
</Transition>
<Transition StartId="21" EndId="19" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="3">
</Transition>
<Transition StartId="30" EndId="33" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="3">
</Transition>
<Transition StartId="31" EndId="33" type="0">
</Transition>
<Transition StartId="32" EndId="35" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="36" EndId="32" type="3">
</Transition>
<Transition StartId="36" EndId="33" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="1">
<Expression>engine.CarType == "CNDA01A" or engine.CarType == "CH1PM20" or engine.CarType == "CH1PM30"</Expression></Transition>
<Transition StartId="38" EndId="4" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="0">
</Transition>
<Transition StartId="39" EndId="21" type="3">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="19" type="0">
</Transition>
</Transitions>
</Process>

