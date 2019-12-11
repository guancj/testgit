<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905">
<Parameters>
<Variable id="tcphandle" type="3" dir="0" data="0"/>
<Variable id="vciHandle" type="3" dir="0" data="0"/>
<Variable id="CarType" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="390" top="64" right="490" bottom="96"/>
<Script>engine.SharedVarSet("SockRevCommand",0)</Script><Line2Text Enable="1" Text="A循环"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="390" top="444" right="490" bottom="476"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="9" ActivityType="3" flags="0" name="6个service">
<Rect left="390" top="134" right="490" bottom="166"/>
<Script>local requestData
local recvTel
local a = 0
DID_1 = ""
DID_2 = ""
DID_3 = ""

if (CarType =="H7" ) then
	DID_1 = "\x40\x06"
	DID_2 = "\x40\x00"
	DID_3 = "\x40\x01"
elseif (CarType == "HS7") then
	DID_1 = "\xE0\xD6"
	DID_2 = "\xE0\xD0"
	DID_3 = "\xE0\xD1"
else

end
print("DID_123:"..DID_1..","..DID_2..","..DID_3)


if (engine.LastError == 0) then
	requestData = "\x01"..DID_1.."\x00"
        a = 0 
	repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	a = a + 1
	until(engine.LastError == 0 or a &gt;= 3)
end
	
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

--YYA
if(engine.LastError ~= 0)then
	engine.LastError = 1;
	engine.StatValue = "ECU Negative Response :".."send = 31"..tostring(requestData).."\n"..tostring(recvTel);
        print(tostring(requestData)..tostring(recvTel))
 else
	engine.LastError = 0;
	engine.StatValue = "ECU Positive Response,Read raw target ok"
end        </Script><assessment no="16" name="DEP2337" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="A循环1">
<Rect left="390" top="224" right="490" bottom="256"/>
<Script>

if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
	requestData = "\x03"..DID_1.."\x00"
	tcpPrefix = "\x08\x00\x00\x02\xFF"  
        engine.SetLineText(2,"读取主雷达同步信息")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("SockRevCommand") == 0) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
end

if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
	requestData = "\x03"..DID_1.."\x01"
	tcpPrefix = "\x08\x00\x00\x03\x01" 
        engine.SetLineText(2,"读取从雷达同步信息")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("SockRevCommand") == 0) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
             
end</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="A循环2">
<Rect left="390" top="274" right="490" bottom="306"/>
<Script>if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
	requestData = "\x03"..DID_2.."\x00"
	tcpPrefix = "\x08\x00\x00\x04\x00" 
        engine.SetLineText(2,"主雷达原始目标数据头")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if (engine.LastError == 0 and engine.SharedVarGet("SockRevCommand") == 0) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
end

if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
	requestData = "\x03"..DID_2.."\x01"
        tcpPrefix = "\x08\x00\x00\x04\x40" 
         engine.SetLineText(2,"从雷达原始目标数据头")
	recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);

	if (engine.LastError == 0 and engine.SharedVarGet("SockRevCommand") == 0) then
		actData = recvTel:sub(7,14)
		sendOEM = tcpPrefix..actData
		actData = recvTel:sub(15,22)
		sendOEM = sendOEM..tcpPrefix..actData
		
		err = engine.SockSend(tcphandle,sendOEM)
		if (err ~= 0) then
			print("sendOEM A first message error")
		end
	end
end</Script></Activity>
<Activity id="12" ActivityType="3" flags="1" name="A循环3">
<Rect left="390" top="324" right="490" bottom="356"/>
<Script>-- EcuData  从BSD请求的有效数据
-- internalData  从customer主机传给internal主机数据

if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
initByte = 0
n = 1 
table_n = {}
requestData = "\x03"..DID_3.."\x00"
engine.SetLineText(2,"读取主雷达原始目标")
recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if(engine.LastError == 0 and string.byte(recvTel:sub(5,5)) == 0 and engine.SharedVarGet("SockRevCommand") == 0) then
		print("string.byte(recvTel:sub(6,6)) HEX= "..tostring(LibGeneral.hex2str(recvTel:sub(6,6))))
		for i= 0,7,1 do
		correctBit = bit32.extract(string.byte(recvTel:sub(6,6)),i,1)    --第6个字节是目标数据状态， 8bit, 等于0的bit需要处理。  
			if(correctBit == 0) then
					table_n[n] = i										--table_n[n] 表，存储bit = 0 的位置    eg: byte6 = 0xAB table_n[1] = 2, table_n[2] = 4, table_n[3] = 6      bit246 = 0(0xAB = 10101011)
					n = n + 1
			end
		end
		
		n = 1

		while (table_n[n] ~= nil and engine.SharedVarGet("SockRevCommand") == 0) do					--循环取table_n[n] 里的值， 直到取到nil
			tcpPrefix = "\x08\x00\x00\x04"
                        print("table_n"..tostring(n).."="..tostring(table_n[n]))
			tcpPrefix = tcpPrefix..string.char(table_n[n] + 1)
			pos = table_n[n]*6 + 7             --ECU 响应数据中， 7个字节之前是固定数据, 从第7个字节开始是需要的数据 ，  48个字节数据，每6个一分。 
			ValidHexData = recvTel:sub(pos,pos+5)       --byte6中  bit0=0, 则table_n[1] = 0,  截取7-12 一共6个字节数据。 bit2=0, 则table_n[2] = 
			print("Master ValidHexData = "..tostring(LibGeneral.hex2str(ValidHexData)))
			fbyte0 = LibGeneral.RawtargetExtractData(ValidHexData,1,0,7,1,7,nil)
			fbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,1,7,1,0,1,nil)
			fbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,2,0,5,1,5,fbyte1)
			fbyte2 = LibGeneral.RawtargetExtractData(ValidHexData,2,5,2,6,2,nil)
			fbyte3 = LibGeneral.RawtargetExtractData(ValidHexData,2,7,1,0,1,nil)
			fbyte3 = LibGeneral.RawtargetExtractData(ValidHexData,3,0,7,1,7,fbyte3)
			fbyte4 = LibGeneral.RawtargetExtractData(ValidHexData,3,7,1,7,1,nil)
			fbyte5 = LibGeneral.RawtargetExtractData(ValidHexData,4,0,8,0,8,nil)
			fbyte6 = LibGeneral.RawtargetExtractData(ValidHexData,5,0,3,0,3,nil)
			fbyte7 = 0x00	
			sendOEM1 = tcpPrefix..string.char(fbyte0)..string.char(fbyte1)..string.char(fbyte2)..string.char(fbyte3)..string.char(fbyte4)..string.char(fbyte5)..string.char(fbyte6)..string.char(fbyte7)
			
			sbyte0 = 0x01
			sbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,5,3,5,1,5,nil)
			sbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,6,0,2,6,2,sbyte1)
			sbyte2 = LibGeneral.RawtargetExtractData(ValidHexData,6,2,1,0,1,nil)
			sbyte3 = 0x00
			sbyte4 = LibGeneral.RawtargetExtractData(ValidHexData,6,3,5,0,5,nil)
			sbyte5 = 0x00
			sbyte6 = 0x00
			sbyte7 = 0x00
			sendOEM2 = tcpPrefix..string.char(sbyte0)..string.char(sbyte1)..string.char(sbyte2)..string.char(sbyte3)..string.char(sbyte4)..string.char(sbyte5)..string.char(sbyte6)..string.char(sbyte7)	
			sendOEM = sendOEM1..sendOEM2
			sendOEMHEX =LibGeneral.hex2str(sendOEM)
			print("A3 Master sendOEM = "..tostring(sendOEMHEX))
			if (engine.SharedVarGet("SockRevCommand") == 0) then
				err = engine.SockSend(tcphandle,sendOEM)
				if (err ~= 0) then
					print("SendOEM A RawtargetData")
				end
			end
			n = n + 1
		end
	end
end


--Slave
if (engine.SharedVarGet("SockRevCommand") == 0) then
	sendOEM = ""
initByte = 0
n = 1 
table_n = {}
requestData = "\x03"..DID_3.."\x01"

engine.SetLineText(2,"读取从雷达原始目标")
recvTel = LibGeneral.ECU_DataExchange(vciHandle, 0x31, 0x71, requestData);
	if(engine.LastError == 0 and string.byte(recvTel:sub(5,5)) == 1 and engine.SharedVarGet("SockRevCommand") == 0) then
		print("SLAVE string.byte(recvTel:sub(6,6)) HEX= "..tostring(LibGeneral.hex2str(recvTel:sub(6,6))))
		for i= 0,7,1 do
		correctBit = bit32.extract(string.byte(recvTel:sub(6,6)),i,1)
			if(correctBit == 0) then
					table_n[n] = i
					n = n + 1
			end
		end
		
		n = 1

		while (table_n[n] ~= nil and engine.SharedVarGet("SockRevCommand") == 0) do
			tcpPrefix = "\x08\x00\x00\x04" 
			tcpPrefix = tcpPrefix..string.char(table_n[n] + 1 + 0x40)
			pos = table_n[n]*6 + 7
			ValidHexData = recvTel:sub(pos,pos+5)
			print("SLAVE ValidHexData = "..tostring(LibGeneral.hex2str(ValidHexData)))
			fbyte0 = LibGeneral.RawtargetExtractData(ValidHexData,1,0,7,1,7,nil)
			fbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,1,7,1,0,1,nil)
			fbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,2,0,5,1,5,fbyte1)
			fbyte2 = LibGeneral.RawtargetExtractData(ValidHexData,2,5,2,6,2,nil)
			fbyte3 = LibGeneral.RawtargetExtractData(ValidHexData,2,7,1,0,1,nil)
			fbyte3 = LibGeneral.RawtargetExtractData(ValidHexData,3,0,7,1,7,fbyte3)
			fbyte4 = LibGeneral.RawtargetExtractData(ValidHexData,3,7,1,7,1,nil)
			fbyte5 = LibGeneral.RawtargetExtractData(ValidHexData,4,0,8,0,8,nil)
			fbyte6 = LibGeneral.RawtargetExtractData(ValidHexData,5,0,3,0,3,nil)
			fbyte7 = 0x00	
			sendOEM1 = tcpPrefix..string.char(fbyte0)..string.char(fbyte1)..string.char(fbyte2)..string.char(fbyte3)..string.char(fbyte4)..string.char(fbyte5)..string.char(fbyte6)..string.char(fbyte7)
			
			sbyte0 = 0x01
			sbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,5,3,5,1,5,nil)
			sbyte1 = LibGeneral.RawtargetExtractData(ValidHexData,6,0,2,6,2,sbyte1)
			sbyte2 = LibGeneral.RawtargetExtractData(ValidHexData,6,2,1,0,1,nil)
			sbyte3 = 0x00
			sbyte4 = LibGeneral.RawtargetExtractData(ValidHexData,6,3,5,0,5,nil)
			sbyte5 = 0x00
			sbyte6 = 0x00
			sbyte7 = 0x00
			sendOEM2 = tcpPrefix..string.char(sbyte0)..string.char(sbyte1)..string.char(sbyte2)..string.char(sbyte3)..string.char(sbyte4)..string.char(sbyte5)..string.char(sbyte6)..string.char(sbyte7)	
			sendOEM = sendOEM1..sendOEM2
                        sendOEMHEX =LibGeneral.hex2str(sendOEM)
			print("A3 SLAVE sendOEM = "..tostring(sendOEMHEX))
			if (engine.SharedVarGet("SockRevCommand") == 0) then
				err = engine.SockSend(tcphandle,sendOEM)
				if (err ~= 0) then
					print("SendOEM A RawtargetData")
				end
			end
			n = n + 1
		end
	end
end


</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="退F">
<Rect left="650" top="134" right="750" bottom="166"/>
<Script>--ECU 3次 Negative，退到F点
engine.SockClose(tcphandle)
</Script></Activity>
<Activity id="18" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="444" right="716" bottom="476"/>
</Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="224" right="556" bottom="256"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="9" EndId="17" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="19" type="1">
<Expression>engine.SharedVarGet("SockRevCommand") == 0</Expression></Transition>
<Transition StartId="12" EndId="2" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="0">
</Transition>
<Transition StartId="19" EndId="10" type="0">
</Transition>
</Transitions>
</Process>

