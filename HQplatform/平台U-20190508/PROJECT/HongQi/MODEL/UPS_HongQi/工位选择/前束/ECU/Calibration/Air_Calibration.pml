<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="物理通道"/>
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
<Variable id="CAN_RCV_ID" type="3" data="0x7AB" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="398" top="8" right="498" bottom="40"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="638" top="272" right="738" bottom="304"/>
<Script>engine.Delay(2000)</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="398" top="64" right="498" bottom="96"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="398" top="168" right="498" bottom="200"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandl"/>
<Parameter id="MASK" value="0xA8DC7AED"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="读故障码">
<Rect left="62" top="144" right="162" bottom="176"/>
<Script></Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="ReadHeightMeasure">
<Rect left="398" top="280" right="498" bottom="312"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x18\x01")

if (engine.LastError == 0) then
	HeightCalib_FL = recvTel:sub(55,55)
        HeightCalib_FR = recvTel:sub(56,56)
	HeightCalib_RL = recvTel:sub(57,57)
        HeightCalib_RR = recvTel:sub(58,58)	        
else

end</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="StartHSC">
<Rect left="398" top="344" right="498" bottom="376"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x70")

if (engine.LastError == 0) then
	statu = recvTel:sub(4,4)
        if (statu == 0) then
		print("StartHSC OK！")
        else
		engine.LastError = -1
		print("ECU Abort @Dpin")
        end
else
	print("ECU Negative Response! @Dpin")
end        
</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="LoopCheckHSCStartStatus">
<Rect left="398" top="400" right="498" bottom="432"/>
<Script>Pram_1 = nil

repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x70")

	MeasInt = string.byte(recvTel:sub(4,4)) 
	FinishFlag,Pram_1 = LibGeneral.Status_Check_view_8bit(Pram_1,1,"00000000",0,0,MeasInt,"",1,1,0,10)  --参数保存表,显示行,期望比对值,保留0,读服务的Err,待比对值,右边显示内容,比对类型(OK,NOK,OK计时,NOK计时),OKcount,NOKcount,TimeOut,
	engine.Delay(50)																			--返回值FinishFlag(true 完成退出 false未完成),PramOut(表为下次比对准备)																			
until(FinishFlag_1 == true)</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="HeigSensCalibFL_Start00">
<Rect left="398" top="456" right="498" bottom="488"/>
<Script>request = "\x01\xDF\x72\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="CurrentStorHeightFL">
<Rect left="398" top="520" right="498" bottom="552"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x72")

</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="ValidateHeightFL10">
<Rect left="398" top="576" right="498" bottom="608"/>
<Script>request = "\x01\xDF\x72\x10"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="PreStoreHeightFL20">
<Rect left="398" top="632" right="498" bottom="664"/>
<Script>request = "\x01\xDF\x72\x20"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="扩展会话">
<Rect left="398" top="112" right="498" bottom="144"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandl,0x10,0x50,"\x03")</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="写标定">
<Rect left="398" top="224" right="498" bottom="256"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandl,0x2e,0x6e,"\xF1\xA1\x03\x03\x00\x00")

if (engine.LastError == 0)   then
engine.Delay(100)

recvTel = LibGeneral.ECU_DataExchange(vciHandl,0x2e,0x6e,"\xF1\xA1\x03\x03\x00\x00")

	if (engine.LastError == 0 ) then
		recvTel = recvTel:sub(4,7)
		recvTel = hexstr(recvTel)
		if (recvTel ~= "03030000") then
			engine.LastError = -1
                        print("check write code is NOK!")
		end
        else
		print ("Read code error!")
	end
end</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="HeigSensCalibFR_Start00">
<Rect left="590" top="456" right="690" bottom="488"/>
<Script>request = "\x01\xDF\x73\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script></Activity>
<Activity id="29" ActivityType="3" flags="1" name="CurrentStorHeightFR">
<Rect left="590" top="520" right="690" bottom="552"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x73")

</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="ValidateHeightFR10">
<Rect left="590" top="576" right="690" bottom="608"/>
<Script>request = "\x01\xDF\x73\x10"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="PreStoreHeightFR20">
<Rect left="590" top="632" right="690" bottom="664"/>
<Script>request = "\x01\xDF\x73\x20"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="HeigSensCalibRL_Start00">
<Rect left="790" top="456" right="890" bottom="488"/>
<Script>request = "\x01\xDF\x74\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="CurrentStorHeightRL">
<Rect left="790" top="520" right="890" bottom="552"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x74")

</Script></Activity>
<Activity id="34" ActivityType="3" flags="0" name="ValidateHeightRL10">
<Rect left="790" top="576" right="890" bottom="608"/>
<Script>request = "\x01\xDF\x74\x10"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="PreStoreHeightRL20">
<Rect left="790" top="632" right="890" bottom="664"/>
<Script>request = "\x01\xDF\x74\x20"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="HeigSensCalibRR_Start00">
<Rect left="998" top="456" right="1098" bottom="488"/>
<Script>request = "\x01\xDF\x74\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="CurrentStorHeightRR">
<Rect left="998" top="520" right="1098" bottom="552"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x74")

</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="ValidateHeightRR10">
<Rect left="998" top="576" right="1098" bottom="608"/>
<Script>request = "\x01\xDF\x74\x10"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="PreStoreHeightRR20">
<Rect left="998" top="632" right="1098" bottom="664"/>
<Script>request = "\x01\xDF\x74\x20"..HeightCalib_FL
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="普通节点">
<Rect left="854" top="200" right="954" bottom="232"/>
<Script>request = "\x01\xDF\x76\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

if (engine.LastError == 0) then
	recvTel = recvTel:sub(6,6)
	recvTel:byte(1,1)
	
        if (recvTel == 0x0F) then
		request = "\x01\xDF\x76\x30"
		recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)		
		recvTel = recvTel:sub(6,6)
		recvTel:byte(1,1)
                
                if (recvTel ~= 0x1F) then
			engine.LastError = -1		
                end	
        end
end</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="普通节点">
<Rect left="854" top="264" right="954" bottom="296"/>
<Script>request = "\x03\xDF\x76"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

if (engine.LastError == 0) then
	recvTel = recvTel:sub(6,6)
	recvTel:byte(1,1)
	
        if (recvTel == 0x01) then
		request = "\x01\xDF\x76"
		recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)		
		recvTel = recvTel:sub(6,6)
		recvTel:byte(1,1)
                
                if (recvTel ~= 0x00) then
			engine.LastError = -1		
                end	
        end
end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="25" type="0">
</Transition>
<Transition StartId="5" EndId="27" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="28" type="0">
</Transition>
<Transition StartId="25" EndId="5" type="0">
</Transition>
<Transition StartId="27" EndId="7" type="3">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
</Transitions>
</Process>

