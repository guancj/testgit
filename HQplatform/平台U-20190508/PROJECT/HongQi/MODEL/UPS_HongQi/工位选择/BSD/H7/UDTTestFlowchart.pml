<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="tcphandle" type="8" dir="0" data=""/>
<Variable id="vciHandle" type="8" dir="0" data=""/>
<Variable id="CarType" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="340" top="44" right="440" bottom="76"/>
<Script></Script><Line2Text Enable="1" Text="B循环"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="340" top="424" right="440" bottom="456"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="普通节点">
<Rect left="340" top="94" right="440" bottom="126"/>
<Script>engine.SharedVarSet("LoopBFin",false)
print("vciHandle:"..vciHandle)

local requestData
local recvTel
local a = 0

if (CarType == "H7") then
	DID_1 = "\x40\x03"
	DID_2 = "\x40\x04"
	DID_3 = "\x40\x05"
	DID_4 = "\x40\x00"
	DID_5 = "\x40\x06"

elseif (CarType == "HS7") then
	DID_1 = "\xE0\xD3"
	DID_2 = "\xE0\xD4"
	DID_3 = "\xE0\xD5"
	DID_4 = "\xE0\xD0"
	DID_5 = "\xE0\xD6"	
end

--if (engine.LastError == 0) then
	requestData = "\x01"..DID_1.."\x00"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
--end
	
if (engine.LastError == 0) then
	requestData = "\x01"..DID_1.."\x01"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end

if (engine.LastError == 0) then
	requestData = "\x01"..DID_2.."\x00"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end

if (engine.LastError == 0) then
	requestData = "\x01"..DID_2.."\x01"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end


if (engine.LastError == 0) then
	requestData = "\x01"..DID_3.."\x00"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end


if (engine.LastError == 0) then
	requestData = "\x01"..DID_3.."\x01"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end

</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="B循环1">
<Rect left="340" top="144" right="440" bottom="176"/>
<Script>if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_5.."\x00"
	tcpPrefix = "\x08\x00\x00\x02\xFF" 
        engine.SetLineText(2,"读取主雷达同步信息") 
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_5.."\x01"
	tcpPrefix = "\x08\x00\x00\x03\x01"
        engine.SetLineText(2,"读取从雷达同步信息")  
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
             
end</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="B循环2">
<Rect left="340" top="194" right="440" bottom="226"/>
<Script>if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_4.."\x00"
	tcpPrefix = "\x08\x00\x00\x04\x00" 
        engine.SetLineText(2,"主雷达原始目标数据头")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 2th message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_4.."\x01"
        tcpPrefix = "\x08\x00\x00\x04\x40" 
        engine.SetLineText(2,"从雷达原始目标数据头")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 2th message error")
		end
	end
end</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="B循环3">
<Rect left="340" top="244" right="440" bottom="276"/>
<Script>
if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_1.."\x00"
	tcpPrefix = "\x08\x00\x00\x07\x00" 
        engine.SetLineText(2,"读取主雷达安装位置")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		actData = recvTel:sub(23,30)
                sendOEM = sendOEM..tcpPrefix..actData
                
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_1.."\x01"
        tcpPrefix = "\x08\x00\x00\x07\x01" 
        engine.SetLineText(2,"读取从雷达安装位置")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		actData = recvTel:sub(23,30)
                sendOEM = sendOEM..tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="B循环4">
<Rect left="340" top="294" right="440" bottom="326"/>
<Script>if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_2.."\x00"
	tcpPrefix = "\x08\x00\x00\x07\x00" 
        engine.SetLineText(2,"读取主雷达软件版本")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		
	       for i = 7,31,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_2.."\x01"
        tcpPrefix = "\x08\x00\x00\x07\x01" 
         engine.SetLineText(2,"读取从雷达软件版本")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
	
               for i = 7,31,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end		
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="B循环5">
<Rect left="80" top="334" right="180" bottom="366"/>
<Script>if (engine.SharedVarGet("LoopBFin") == false) then
	requestData = "\x03\x40\x04\x00"
	tcpPrefix = "\x08\x00\x00\x07\x00" 
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		
	       for i = 7,31,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	requestData = "\x03\x40\x04\x01"
        tcpPrefix = "\x08\x00\x00\x07\x01" 
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
	
               for i = 7,31,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end		
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end</Script></Activity>
<Activity id="9" ActivityType="3" flags="1" name="B循环6">
<Rect left="340" top="364" right="440" bottom="396"/>
<Script>if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_3.."\x00"
	tcpPrefix = "\x08\x00\x00\x07\x00" 
        engine.SetLineText(2,"读取主雷达诊断信息")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
		
	       for i = 7,63,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end

if (engine.SharedVarGet("LoopBFin") == false) then
	sendOEM =""
	requestData = "\x03"..DID_3.."\x01"
        tcpPrefix = "\x08\x00\x00\x07\x01" 
         engine.SetLineText(2,"读取从雷达诊断信息")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("LoopBFin") == false) then
	
               for i = 7,63,8 do
			actData = recvTel:sub(i,i+7)
			sendOEM = sendOEM..tcpPrefix..actData
	       end		
               
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A 3th message error")
		end
	end
end</Script></Activity>
<Activity id="10" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="144" right="616" bottom="176"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="1">
<Expression>engine.SharedVarGet("LoopBFin") == false</Expression></Transition>
<Transition StartId="10" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

