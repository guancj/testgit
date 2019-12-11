<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1505" pbltext="DEP79">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="56" right="330" bottom="88"/>
<Script></Script><TitleText Enable="1" Text="SAS 标定"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="1204" right="530" bottom="1236"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="230" top="120" right="330" bottom="152"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SAS 建立连接"/>
<Line3Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="读故障码判断是否未标定故障">
<Rect left="230" top="184" right="330" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SAS 标定前读故障码"/>
<Line3Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x19,0x59,"\x02\xFF")

DTClen = string.len(recvTel)

print("DTClen:"..DTClen)
if (engine.LastError == 0 and DTClen &gt; 3) then

	DTCS = string.sub(recvTel,4,-1)

	if (#DTCS == 4) then
		DTCS = string.sub(DTCS,1,3)
		strDTC = LibGeneral.hex2str(DTCS)
		if (strDTC == "51F500") then
			missCali = 1
		else
			missCali = 0
		end
	else
		missCali = 0        
		print("Have other DTC")
	end
elseif (engine.LastError == 0 and DTClen == 3) then
	missCali = 1
else

end
</Script><assessment no="2" name="DEP1423" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="读取SAS状态">
<Rect left="230" top="264" right="330" bottom="296"/>
<Line2Text Enable="1" Text="读取SAS状态"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x03")
ValidByte = recvTel:sub(4,4)
ValidByte = string.byte(ValidByte)

</Script><assessment no="4" name="DEP1424" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="清除故障码">
<Rect left="374" top="240" right="474" bottom="272"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")
engine.Delay(2000)</Script><assessment no="3" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="408" top="184" right="440" bottom="216"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="扩展会话">
<Rect left="230" top="336" right="330" bottom="368"/>
<Line2Text Enable="1" Text="扩展会话"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="5" name="DEP1089" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="扩展会话">
<Rect left="430" top="336" right="530" bottom="368"/>
<Line2Text Enable="1" Text="扩展会话"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1089" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="230" top="392" right="330" bottom="424"/>
<Line2Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x6C8A9B7D"/>
</Parameters>
</FunctionRef>
<assessment no="7" name="DEP1426" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="430" top="392" right="530" bottom="424"/>
<Line2Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x6C8A9B7D"/>
</Parameters>
</FunctionRef>
<assessment no="8" name="DEP1426" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="解除SAS标定">
<Rect left="230" top="448" right="330" bottom="480"/>
<Line2Text Enable="1" Text="解除SAS标定"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x00\x05&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1425" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="等待250ms后读标定状态">
<Rect left="230" top="504" right="330" bottom="536"/>
<Script>engine.Delay(250)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x03")
ValidByte = recvTel:sub(4,4)
ValidByte = string.byte(ValidByte)
</Script><assessment no="10" name="DEP1427" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="13" flags="0" name="读取角度">
<Rect left="430" top="504" right="530" bottom="536"/>
<Line2Text Enable="1" Text="读取角度"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xD1\x01&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1428" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="SAS标定过程错误">
<Rect left="120" top="614" right="220" bottom="646"/>
<Script></Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="角度比对">
<Rect left="430" top="560" right="530" bottom="592"/>
<Script>recvTel = recvTel:sub(4,5)
resolution = 0.04375
Normal = recvTel:byte(1) * 256 + recvTel:byte(2)

if (Normal &gt; 32767) then
	angleValue = (32767 - Normal) * 0.04375
else
	angleValue = Normal * 0.04375
end    

print("角度:"..angleValue)
if (angleValue &gt; -10 and angleValue &lt; 10) then
	engine.LastError = 0
         engine.StatValue = tostring(angleValue);
         engine.StatUpper = tostring(10);
	engine.StatLower = tostring(-10);
	print(" check the angle value is ok")
else
	engine.LastError = 1
         engine.StatValue = tostring(angleValue);
         engine.StatUpper = tostring(10);
	engine.StatLower = tostring(-10);
        print("check the angle value NOK  @Dpin")
end
 </Script><assessment no="12" name="DEP1429" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="读取角速度">
<Rect left="430" top="616" right="530" bottom="648"/>
<Line2Text Enable="1" Text="读取角速度"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xD1\x02&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP1430" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="角速度比对">
<Rect left="430" top="672" right="530" bottom="704"/>
<Script>recvTel = recvTel:sub(4,5)
resolution = 0.04375
Normal = recvTel:byte(1) * 256 + recvTel:byte(2)

if (Normal &gt; 32767) then
	angleValue = (32767 - Normal) * 0.04375
else
	angleValue = Normal * 0.04375
end    

print("角速度:"..angleValue)
if (angleValue &gt; -2 and angleValue &lt; 2) then
	engine.LastError = 0
        engine.StatValue = tostring(angleValue);
         engine.StatUpper = tostring(2);
	engine.StatLower = tostring(-2);
	print(" check the wheel speed value is ok")
else
	engine.LastError = 1
        engine.StatValue = tostring(angleValue);
         engine.StatUpper = tostring(2);
	engine.StatLower = tostring(-2);
        print("check the wheel speed NOK  @Dpin")
end
 </Script><assessment no="14" name="DEP1431" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="SAS角度标定">
<Rect left="430" top="728" right="530" bottom="760"/>
<Line2Text Enable="1" Text="角度标定"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x00\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP1432" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="等待500ms">
<Rect left="430" top="776" right="530" bottom="808"/>
<Script>engine.Delay(500)</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="读取SAS状态">
<Rect left="430" top="832" right="530" bottom="864"/>
<Strategy TotalTime="25" NokTime="0" RetryTimeOut="5" DelayTime="200"/>
<Line2Text Enable="1" Text="读取SAS状态"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x03")
ValidByte = recvTel:sub(4,4)
ValidByte = string.byte(ValidByte)

if(ValidByte == 0x00) then
	engine.LastError = 0
else	
	engine.LastError = 1
end</Script><assessment no="16" name="DEP1427" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="13" flags="0" name="清除故障码">
<Rect left="430" top="888" right="530" bottom="920"/>
<Line2Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="等1s并复位ECU">
<Rect left="430" top="954" right="530" bottom="986"/>
<Line2Text Enable="1" Text="ECU 复位"/>
<Script>engine.Delay(1000)
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x11,0x51,"\x01")
engine.Delay(1000)</Script><assessment no="18" name="DEP1433" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="430" top="1134" right="530" bottom="1166"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="清除故障码">
<Rect left="120" top="554" right="220" bottom="586"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")
engine.Delay(2000)</Script><assessment no="21" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="307" ActivityType="13" flags="1" name="读故障码">
<Rect left="430" top="1004" right="530" bottom="1036"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读故障码"/>
<Line3Text Enable="1"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0xFF"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP82" type="8" flags="97"/>
</Activity>
<Activity id="308" ActivityType="13" flags="0" name="故障码信息">
<Rect left="430" top="1064" right="530" bottom="1096"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_SAS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP1576" type="8" flags="97"/>
</Activity>
<Activity id="309" ActivityType="3" flags="0" name="NOK">
<Rect left="1010" top="904" right="1110" bottom="936"/>
<Script>engine.LastError = 1</Script><assessment no="24" name="DEP1900" type="8" flags="97"/>
</Activity>
<Activity id="310" ActivityType="3" flags="0" name="重试">
<Rect left="790" top="884" right="890" bottom="916"/>
<Line2Text Enable="1" Text="SAS 标定失败"/>
<Line4Text Enable="1" Text="重试？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="311" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="334" right="856" bottom="366"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="1">
<Expression>missCali == 1</Expression></Transition>
<Transition StartId="5" EndId="8" type="1">
<Expression>missCali == 0</Expression></Transition>
<Transition StartId="7" EndId="10" type="1">
<Expression>ValidByte == 0x00</Expression></Transition>
<Transition StartId="7" EndId="11" type="1">
<Expression>ValidByte == 0x01</Expression></Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="5" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="11" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="16" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="1">
<Expression>ValidByte == 0x01</Expression></Transition>
<Transition StartId="15" EndId="29" type="1">
<Expression>ValidByte == 0x00</Expression></Transition>
<Transition StartId="16" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="3">
</Transition>
<Transition StartId="23" EndId="310" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="307" type="0">
</Transition>
<Transition StartId="27" EndId="2" type="0">
</Transition>
<Transition StartId="29" EndId="17" type="0">
</Transition>
<Transition StartId="307" EndId="308" type="0">
</Transition>
<Transition StartId="308" EndId="27" type="0">
</Transition>
<Transition StartId="310" EndId="311" type="6">
</Transition>
<Transition StartId="310" EndId="24" type="0">
</Transition>
<Transition StartId="311" EndId="9" type="0">
</Transition>
</Transitions>
</Process>

