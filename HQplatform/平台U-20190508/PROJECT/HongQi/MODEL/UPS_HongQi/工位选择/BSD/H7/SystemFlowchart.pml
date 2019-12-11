<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905">
<Parameters>
<Variable id="tcphandle" type="3" dir="0" data="0"/>
<Variable id="vciHandle" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="CarType" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="494" top="184" right="594" bottom="216"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="494" top="608" right="594" bottom="640"/>
<Script></Script></End>
<Activities>
<Activity id="82" ActivityType="3" flags="1" name="Command1">
<Rect left="495" top="238" right="595" bottom="270"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="接收命令1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local a = 0
local result 
local err = nil
local sCommand = nil
local strRep
local sDID 

if (CarType == "HS7") then
	sDID = '\x01\xE0\xD8\x01'
elseif (CarType == "H7") then
	sDID = '\x01\x40\x08\x01'

end

err = engine.SockRecv(tcphandle,30000)
if (err == 0) then
	Response = engine.GetResponseString(0,-1)
else
	Response = nil
end

if (Response == nil) then
	err = engine.SockRecv(tcphandle,30000)
       if (err == 0) then
		Response = engine.GetResponseString(0,-1)
	else
		Response = nil
	end
end
		
strRep = LibGeneral.hex2str(Response)
CanID  = strRep:sub(7,10)
CanData = strRep:sub(11,26)
print("command:"..strRep)
if (CanData == "0F59040001000000" and CanID == "03F2")then
	repeat
		recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, sDID);
		a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
	
	if (engine.LastError == 0) then
		if (string.byte(recvTel:sub(5,5)) == 0) then
			result = 0		--nothing error
		else
			result = 3  --ECU Positive response but incorrect result
		end 
	else
		result = 2  --ECU Negative response 3 times
	end	
else
	result = 1   --JY Command Error
end           

if (result == 0 or result == 3) then
	if (result == 0) then
		Data1 = "080000070F1B2B010000000000"   
		Data2 = "080000070F1C2B000001000459"
		Data3 = "080000070F1D2B000001000000"
		Data4 = "080000070F1B2B010000000000"
		sData = Data1..Data2..Data3..Data4
		sData  = LibGeneral.str2hex(sData)
	else
		Data1 = "080000070F1B2B010000000000"   
		Data2 = "080000070F1C2B000000000459"
		Data3 = "080000070F1D2B000000000000"
		Data4 = "080000070F1B2B010000000000"
		sData = Data1..Data2..Data3..Data4
		sData  = LibGeneral.str2hex(sData)	
	end
     --   engine.Delay(1500)
	err = engine.SockSend(tcphandle,sData)
	if (err == 0) then
		returnResult = true
	else 
		returnResult = false
		print("SockSend Error:"..err)
	end
end

if (result == 2 or result == 1) then
	returnResult = false
	print("JY Command error or ECU Negative response")
end

--YYA
if (result ==0 and returnResult == true)then
	engine.LastError = 0;
	engine.StatValue = "ECU Positive Response:"..tostring(LibGeneral.hex2str(recvTel)).."\n".."VMT Send data to Jingyu OK :"..tostring(sData);	
 elseif(result == 1)then
 	engine.LastError = 1;
	engine.StatValue = "JingYu  send Command to VMT Error :"..tostring(strRep);	
 elseif(result == 2)then
 	engine.LastError = 1;
	engine.StatValue = "ECU Negative Response:"..tostring(LibGeneral.hex2str(recvTel));         
 elseif(result == 3)then
 	engine.LastError = 1;
	engine.StatValue = "ECU Positive Response,but Result[5] Error:"..tostring(LibGeneral.hex2str(recvTel)); 
  elseif(returnResult == false)then
 	engine.LastError = 1;
	engine.StatValue = "VMT Send Command to Jingyu Error :"..tostring(sData); 
   else
 	engine.LastError = 1;
	engine.StatValue = "Unknow Error :";        
 end </Script><assessment no="14" name="DEP2335" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="退F">
<Rect left="646" top="296" right="746" bottom="328"/>
<Script>--标识uds ecu交互肯定响应 
--sendTCP NOK
--接收的command  并没有查找到期望的下一个命令</Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="退F">
<Rect left="646" top="240" right="746" bottom="272"/>
<Script>--精钰命令错误
--vmt send tcp data err
--Ecu Negative 3times  </Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="退F">
<Rect left="646" top="352" right="746" bottom="384"/>
<Script></Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="退F">
<Rect left="646" top="408" right="746" bottom="440"/>
<Script></Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="退F">
<Rect left="646" top="464" right="746" bottom="496"/>
<Script></Script></Activity>
<Activity id="95" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="822" top="352" right="922" bottom="384"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="856" top="608" right="888" bottom="640"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="isNOK">
<Rect left="822" top="480" right="922" bottom="512"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>isOK = false
engine.LastError = 1</Script><assessment no="5" name="DEP1907" type="8" flags="97"/>
</Activity>
<Activity id="98" ActivityType="13" flags="0" name="Command23">
<Rect left="494" top="296" right="594" bottom="328"/>
<Line2Text Enable="1" Text="接收命令2与命令3"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F20059040001000000&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F20159040001000000&quot;"/>
<Parameter id="returnResult" ret="returnResult "/>
<Parameter id="recvTime" value="10000"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="99" ActivityType="13" flags="0" name="Command45">
<Rect left="494" top="352" right="594" bottom="384"/>
<Line2Text Enable="1" Text="接收命令4与命令5"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F20000043601000000&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F20100043601000000&quot;"/>
<Parameter id="returnResult" ret="returnResult "/>
<Parameter id="recvTime" value="10000"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="100" ActivityType="13" flags="0" name="Command67">
<Rect left="494" top="408" right="594" bottom="440"/>
<Line2Text Enable="1" Text="接收命令6与命令7"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F200030436&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F201030436&quot;"/>
<Parameter id="returnResult" ret="returnResult "/>
<Parameter id="recvTime" value="10000"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="101" ActivityType="13" flags="0" name="Command89">
<Rect left="494" top="464" right="594" bottom="496"/>
<Line2Text Enable="1" Text="接收命令8与命令9"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F200040436&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F201040436&quot;"/>
<Parameter id="returnResult" ret="returnResult "/>
<Parameter id="recvTime" value="10000"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="isOK">
<Rect left="494" top="528" right="594" bottom="560"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>isOK = true
engine.LastError = 0</Script><assessment no="5" name="DEP1907" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="98" type="1">
<Expression>returnResult == true</Expression></Transition>
<Transition StartId="82" EndId="85" type="0">
</Transition>
<Transition StartId="84" EndId="95" type="0">
</Transition>
<Transition StartId="85" EndId="95" type="0">
</Transition>
<Transition StartId="89" EndId="95" type="0">
</Transition>
<Transition StartId="90" EndId="95" type="0">
</Transition>
<Transition StartId="91" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="97" type="0">
</Transition>
<Transition StartId="96" EndId="2" type="0">
</Transition>
<Transition StartId="97" EndId="96" type="0">
</Transition>
<Transition StartId="98" EndId="99" type="1">
<Expression>returnResult == true</Expression></Transition>
<Transition StartId="98" EndId="84" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="1">
<Expression>returnResult == true</Expression></Transition>
<Transition StartId="99" EndId="89" type="0">
</Transition>
<Transition StartId="100" EndId="90" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="1">
<Expression>returnResult == true</Expression></Transition>
<Transition StartId="101" EndId="102" type="1">
<Expression>returnResult == true</Expression></Transition>
<Transition StartId="101" EndId="91" type="0">
</Transition>
<Transition StartId="102" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

