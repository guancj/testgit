<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1506" pbltext="DEP101">
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
<Variable id="CAN_SND_ID" type="3" data="0x729" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72F" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="422" top="40" right="522" bottom="72"/>
<Script>engine.Delay(1000)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="1204" right="480" bottom="1236"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="安全访问">
<Rect left="422" top="200" right="522" bottom="232"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,'\x01')

if (engine.LastError == 0) then
Intseed1 = string.byte(recvTel:sub(3,3))
Intseed2 = string.byte(recvTel:sub(4,4))
	if( ((Intseed1==0x00)and(Intseed2==0x00)) or ((Intseed1==0xff)and(Intseed2==0xff)) )then
		engine.LastError = -1
	 --end
	else
		 seed=bit32.lshift(Intseed1,8)+Intseed2;
		 
		 tmp_seed=bit32.band(seed*20077,0xffff);
		 tmp_seed=bit32.band(tmp_seed+12345,0xffff);
		 key=bit32.bxor(tmp_seed,0xA5A5);
		 
		key0=bit32.rshift(bit32.band(key,0xff00),8);
		key1=bit32.band(key,0x00ff);
		engine.println(string.format("%02x%02x",key0,key1));
                
                request = "\x02" .. string.char(key0)..string.char(key1)
		recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,request)
       end   
end


</Script><assessment no="3" name="DEP1436" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="422" top="88" right="522" bottom="120"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP102" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="扩展会话">
<Rect left="422" top="144" right="522" bottom="176"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="2" name="DEP1102" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="2EF1A0">
<Rect left="422" top="256" right="522" bottom="288"/>
<Script>request = "f1a000ffffffffffffffffffffffffffffff"
request = LibGeneral.str2hex(request)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="2EFD27">
<Rect left="422" top="312" right="522" bottom="344"/>
<Script>request = "fd27262b0b0017001f0026002e003618e8"
request = LibGeneral.str2hex(request)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)</Script><assessment no="4" name="DEP1437" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="标定">
<Rect left="420" top="374" right="520" bottom="406"/>
<Script>request = "\x01\xF0\x03"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="5" name="DEP1438" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="读ACC系统状态">
<Rect left="420" top="434" right="520" bottom="466"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xFD\x30")

if (engine.LastError == 0) then
	staByte1 = recvTel:sub(4,4):byte()
	staByte = recvTel:sub(5,5):byte() 
		
else

end 
 </Script><assessment no="6" name="DEP1439" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="写VIN码">
<Rect left="380" top="494" right="480" bottom="526"/>
<Script>request = engine.VIN
request = "\xF1\x90" .. request

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)</Script><assessment no="7" name="DEP423" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="读工厂未校准角度">
<Rect left="520" top="494" right="620" bottom="526"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xFD\x1A")

if (engine.LastError == 0x00) then
	FangleValue = recvTel:sub(4,4):byte() 
        if (FangleValue &gt; 127) then
		FangleValue = FangleValue - 256;
	end
        FangleValue = FangleValue* 0.0625
         print("水平角度:"..FangleValue)
	engine.LastError = 1
        engine.StatValue =  FangleValue        
         engine.SetLineText(2,"水平角度:"..FangleValue)
         
end</Script><assessment no="15" name="DEP1442" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="busy">
<Rect left="230" top="494" right="330" bottom="526"/>
<Script>engine.Delay(500)</Script></Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="434" right="296" bottom="466"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="重新执行标定流程">
<Rect left="850" top="494" right="950" bottom="526"/>
<Line1Text Enable="1" Text="ACC标定失败是否重新标定"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="16" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="1144" right="916" bottom="1176"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="标定失败">
<Rect left="680" top="494" right="780" bottom="526"/>
<Script></Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="写时间">
<Rect left="380" top="564" right="480" bottom="596"/>
<Script>date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println("LDW编程时间:"..date);

request = string.char(tonumber(date:sub(1,2),16)) .. string.char(tonumber(date:sub(3,4),16)) .. string.char(tonumber(date:sub(5,6),16)) .. string.char(tonumber(date:sub(7,8),16))
request = "\xF1\x9D"..request
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)


</Script><assessment no="8" name="DEP1440" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="13" flags="0" name="清除故障码">
<Rect left="380" top="614" right="480" bottom="646"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP103" type="8" flags="97"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="扩展会话">
<Rect left="50" top="694" right="150" bottom="726"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="12" name="DEP1102" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="读故障码">
<Rect left="380" top="1074" right="480" bottom="1106"/>
<Script>engine.Delay(300)
</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="读垂直未校准角度">
<Rect left="520" top="564" right="620" bottom="596"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xFD\x06")

if (engine.LastError == 0x00) then
	FangleValue = recvTel:sub(4,4):byte()
        if (FangleValue &gt; 127) then
		FangleValue = FangleValue - 256;
	end
        FangleValue = FangleValue* 0.0625
        print("垂直角度:"..FangleValue)
        engine.LastError = 1  
        engine.StatValue =  FangleValue  
        engine.SetLineText(3,"垂直角度:"..FangleValue)
        engine.SetLineText(2,"")
        engine.SetLineText(3,"")
end

</Script><assessment no="16" name="DEP1443" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="380" top="674" right="480" bottom="706"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="10" name="DEP1441" type="8" flags="97"/>
</Activity>
<Activity id="100" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="380" top="814" right="480" bottom="846"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP102" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="380" top="1144" right="480" bottom="1176"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP1441" type="8" flags="97"/>
</Activity>
<Activity id="102" ActivityType="5" flags="1" name="PEPSPoweroffAndON">
<Rect left="380" top="734" right="480" bottom="766"/>
<SubProcesses>
<SubProcess id="PEPSPoweroff">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="103" ActivityType="13" flags="0" name="读故障码">
<Rect left="180" top="1074" right="280" bottom="1106"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x01"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP104" type="8" flags="97"/>
</Activity>
<Activity id="104" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="180" top="1144" right="280" bottom="1176"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_ACC&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP1904" type="8" flags="97"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="统计">
<Rect left="520" top="664" right="620" bottom="696"/>
<Script>engine.StatValue = "安装角度错误"
engine.LastError = 1</Script><assessment no="20" name="DEP1842" type="8" flags="97"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="读工厂未校准角度">
<Rect left="380" top="944" right="480" bottom="976"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xFD\x1A")

if (engine.LastError == 0x00) then
	FangleValue = recvTel:sub(4,4):byte() 
        if (FangleValue &gt; 127) then
		FangleValue = FangleValue - 256;
	end
        FangleValue = FangleValue* 0.0625
         print("水平角度:"..FangleValue)
	engine.LastError = 0
        engine.StatValue =  FangleValue        
         engine.SetLineText(2,"水平角度:"..FangleValue)
         
end</Script><assessment no="15" name="DEP1442" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="读垂直未校准角度">
<Rect left="380" top="1014" right="480" bottom="1046"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xFD\x06")

if (engine.LastError == 0x00) then
	FangleValue = recvTel:sub(4,4):byte()
        if (FangleValue &gt; 127) then
		FangleValue = FangleValue - 256;
	end
        FangleValue = FangleValue* 0.0625
        print("垂直角度:"..FangleValue)
        engine.LastError = 0
        engine.StatValue =  FangleValue  
        engine.SetLineText(3,"垂直角度:"..FangleValue)
        engine.SetLineText(2,"")
        engine.SetLineText(3,"")
end

</Script><assessment no="16" name="DEP1443" type="8" flags="97"/>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="扩展会话">
<Rect left="380" top="874" right="480" bottom="906"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="12" name="DEP1102" type="8" flags="97"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="Wait">
<Rect left="250" top="794" right="350" bottom="826"/>
<Script>engine.Delay(1000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="3">
</Transition>
<Transition StartId="5" EndId="3" type="3">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="1">
<Expression>staByte == 0x03</Expression></Transition>
<Transition StartId="10" EndId="12" type="1">
<Expression>staByte == 0x02</Expression></Transition>
<Transition StartId="10" EndId="13" type="1">
<Expression>staByte == 0x04</Expression></Transition>
<Transition StartId="10" EndId="15" type="1">
<Expression>(staByte == 0x01 and staByte1 == 0x00) or staByte == 0x00</Expression></Transition>
<Transition StartId="10" EndId="18" type="0">
</Transition>
<Transition StartId="11" EndId="20" type="0">
</Transition>
<Transition StartId="12" EndId="98" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="10" type="0">
</Transition>
<Transition StartId="15" EndId="7" type="6">
</Transition>
<Transition StartId="15" EndId="16" type="5">
</Transition>
<Transition StartId="16" EndId="101" type="0">
</Transition>
<Transition StartId="18" EndId="16" type="0">
</Transition>
<Transition StartId="20" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="99" type="0">
</Transition>
<Transition StartId="97" EndId="103" type="0">
</Transition>
<Transition StartId="98" EndId="106" type="0">
</Transition>
<Transition StartId="99" EndId="102" type="0">
</Transition>
<Transition StartId="100" EndId="111" type="0">
</Transition>
<Transition StartId="101" EndId="2" type="0">
</Transition>
<Transition StartId="102" EndId="112" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="101" type="0">
</Transition>
<Transition StartId="106" EndId="101" type="0">
</Transition>
<Transition StartId="109" EndId="110" type="0">
</Transition>
<Transition StartId="110" EndId="97" type="0">
</Transition>
<Transition StartId="111" EndId="109" type="0">
</Transition>
<Transition StartId="112" EndId="100" type="0">
</Transition>
</Transitions>
</Process>

