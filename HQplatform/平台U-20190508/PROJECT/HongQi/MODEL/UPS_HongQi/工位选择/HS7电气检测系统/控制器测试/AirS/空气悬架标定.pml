<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3011" pbltext="DEP1663">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="vciHandle" type="3" dir="0" data="0"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AB" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="400" top="64" right="500" bottom="96"/>
<Script></Script><TitleText Enable="1" Text="空气悬架标定"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="400" top="2304" right="500" bottom="2336"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
	--[[if(engine.LastError ~= 0) then
	engine.StatValue = "ECU Close fail ";	
	end --]]

end</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="400" top="134" right="500" bottom="166"/>
<Line3Text Enable="1" Text="ECUOpen"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="400" top="244" right="500" bottom="276"/>
<Line3Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xA8DC7AED"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1860" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="扩展会话">
<Rect left="400" top="184" right="500" bottom="216"/>
<Line3Text Enable="1" Text="扩展会话"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="1" name="DEP1664" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="ReadHeightMeasure">
<Rect left="400" top="434" right="500" bottom="466"/>
<Line3Text Enable="1" Text="读取高度测量"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x18\x01")

if (engine.LastError == 0) then
	HeightCalib_FL = recvTel:sub(55,55)
        HeightCalib_FR = recvTel:sub(56,56)
	HeightCalib_RL = recvTel:sub(57,57)
        HeightCalib_RR = recvTel:sub(58,58)	        
else

end</Script><assessment no="18" name="DEP1861" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="StartHSC">
<Rect left="400" top="504" right="500" bottom="536"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="StartHSC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x70")

if (engine.LastError == 0) then
	statu = recvTel:sub(5,5)
        statu = string.byte(statu)
        if (statu == 0) then
		print("StartHSC OK！")
        else
		engine.LastError = -1
		print("ECU Abort @Dpin")
        end
else
	print("ECU Negative Response! @Dpin")
end        
</Script><assessment no="19" name="DEP1862" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="LoopCheckHSCStartStatus">
<Rect left="400" top="634" right="500" bottom="666"/>
<Line1Text Enable="1" Text="开始标定高度传感器"/>
<Line2Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x70")
MeasInt = string.byte(recvTel:sub(5,5))

</Script><assessment no="20" name="DEP1863" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="HeigSensCalibFL_Start00">
<Rect left="400" top="754" right="500" bottom="786"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="左前角标定"/>
<Script>request = "\x01\xDF\x72\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script><assessment no="22" name="DEP1865" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="CurrentStorHeightFL">
<Rect left="400" top="814" right="500" bottom="846"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x72")

</Script><assessment no="23" name="DEP1866" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="ValidateHeightFL10">
<Rect left="400" top="864" right="500" bottom="896"/>
<Script>WheelCenter_FL = engine.SharedVarGet("HeiFL")
print("空气悬架标定左前高度:"..WheelCenter_FL)
HValue = math.floor(WheelCenter_FL + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))


request = "\x01\xDF\x72\x10"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script><assessment no="24" name="DEP1867" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="PreStoreHeightFL20">
<Rect left="400" top="934" right="500" bottom="966"/>
<Script>WheelCenter_FL = engine.SharedVarGet("HeiFL")
HValue = math.floor(WheelCenter_FL + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))

request = "\x01\xDF\x72\x20"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="25" name="DEP1868" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="HeigSensCalibFR_Start00">
<Rect left="400" top="994" right="500" bottom="1026"/>
<Line2Text Enable="1" Text="右前角标定"/>
<Script>request = "\x01\xDF\x73\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script><assessment no="26" name="DEP1869" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="CurrentStorHeightFR">
<Rect left="400" top="1064" right="500" bottom="1096"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x73")

</Script><assessment no="27" name="DEP1870" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="ValidateHeightFR10">
<Rect left="400" top="1114" right="500" bottom="1146"/>
<Script>WheelCenter_FR = engine.SharedVarGet("HeiFR")
print("空气悬架标定右前高度:"..WheelCenter_FR)
HValue = math.floor(WheelCenter_FR + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))

request = "\x01\xDF\x73\x10"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script><assessment no="28" name="DEP1871" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="PreStoreHeightFR20">
<Rect left="400" top="1174" right="500" bottom="1206"/>
<Script>WheelCenter_FR = engine.SharedVarGet("HeiFR")
HValue = math.floor(WheelCenter_FR + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))


request = "\x01\xDF\x73\x20"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="29" name="DEP1872" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="HeigSensCalibRL_Start00">
<Rect left="400" top="1224" right="500" bottom="1256"/>
<Line2Text Enable="1" Text="左后角标定"/>
<Script>request = "\x01\xDF\x74\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script><assessment no="30" name="DEP1873" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="CurrentStorHeightRL">
<Rect left="400" top="1294" right="500" bottom="1326"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x74")

</Script><assessment no="31" name="DEP1874" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="ValidateHeightRL10">
<Rect left="400" top="1344" right="500" bottom="1376"/>
<Script>WheelCenter_RL = engine.SharedVarGet("HeiRL")
print("空气悬架标定左后高度:"..WheelCenter_RL)
HValue = math.floor(WheelCenter_RL + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))


request = "\x01\xDF\x74\x10"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script><assessment no="32" name="DEP1875" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="PreStoreHeightRL20">
<Rect left="400" top="1404" right="500" bottom="1436"/>
<Script>WheelCenter_RL = engine.SharedVarGet("HeiRL")
HValue = math.floor(WheelCenter_RL + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))

request = "\x01\xDF\x74\x20"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="33" name="DEP1876" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="1" name="HeigSensCalibRR_Start00">
<Rect left="400" top="1464" right="500" bottom="1496"/>
<Line2Text Enable="1" Text="右后角标定"/>
<Script>request = "\x01\xDF\x75\x00\x00\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
</Script><assessment no="34" name="DEP1877" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="CurrentStorHeightRR">
<Rect left="400" top="1534" right="500" bottom="1566"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x75")

</Script><assessment no="35" name="DEP1878" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="ValidateHeightRR10">
<Rect left="400" top="1584" right="500" bottom="1616"/>
<Script>WheelCenter_RR = engine.SharedVarGet("HeiRR")
print("空气悬架标定右后高度:"..WheelCenter_RR)
HValue = math.floor(WheelCenter_RR + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))

request = "\x01\xDF\x75\x10"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

</Script><assessment no="36" name="DEP1879" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="PreStoreHeightRR20">
<Rect left="400" top="1644" right="500" bottom="1676"/>
<Script>WheelCenter_RR = engine.SharedVarGet("HeiRR")
HValue = math.floor(WheelCenter_RR + 0.5)
strV = string.char(bit32.extract(HValue,8,8)) .. string.char(bit32.extract(HValue,0,8))

request = "\x01\xDF\x75\x20"..strV
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="37" name="DEP1880" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="Finish_HSC">
<Rect left="400" top="1694" right="500" bottom="1726"/>
<Line2Text Enable="1" Text="空气悬架高度标定完成"/>
<Script>request = "\x01\xDF\x76\x00"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

if (engine.LastError == 0) then
	recvTel = recvTel:sub(6,6)
	--recvTel:byte()
	recvTel=string.byte(recvTel)
	 if (recvTel == 0x0F) then
		engine.LastError = 0                
         else
		engine.LastError = 1
         end
        
 end</Script><assessment no="38" name="DEP1881" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="获取HSC状态">
<Rect left="400" top="1914" right="500" bottom="1946"/>
<Line2Text Enable="1" Text="获取标定状态"/>
<Script>
request = "\x03\xDF\x76"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5))


</Script></Activity>
<Activity id="46" ActivityType="3" flags="0" name="清除故障码">
<Rect left="400" top="364" right="500" bottom="396"/>
<Line3Text Enable="1" Text="清除故障码"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script><assessment no="17" name="DEP1665" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="694" right="500" bottom="726"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="180"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1864" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="初始化变量">
<Rect left="400" top="574" right="500" bottom="606"/>
<TitleText Enable="1" Text="初始化变量"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="延时">
<Rect left="230" top="634" right="330" bottom="666"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="2254" right="766" bottom="2286"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="ECU通讯失败">
<Rect left="570" top="364" right="670" bottom="396"/>
<TitleText Enable="1" Text="ECU通讯失败"/>
<Script>print("!!!ECU通讯失败")
engine.DialogBackColor = "Red";
engine.Delay(1000)</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="HSC_FL失败">
<Rect left="560" top="834" right="660" bottom="866"/>
<TitleText Enable="1" Text="左前标定失败"/>
<Script>print("!!!左前标定失败")
engine.DialogBackColor = "Red";
engine.Delay(1000)</Script></Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="364" right="766" bottom="396"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="834" right="766" bottom="866"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="HSC_FR失败">
<Rect left="560" top="1094" right="660" bottom="1126"/>
<TitleText Enable="1" Text="右前标定失败"/>
<Script>print("!!!右前标定失败")
engine.DialogBackColor = "Red";
engine.Delay(1000)</Script></Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="1094" right="766" bottom="1126"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="HSC_RL失败">
<Rect left="570" top="1334" right="670" bottom="1366"/>
<TitleText Enable="1" Text="左后标定失败"/>
<Script>print("!!!左后标定失败")
engine.DialogBackColor = "Red";
engine.Delay(1000)</Script></Activity>
<Activity id="62" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="1334" right="766" bottom="1366"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="HSC_RR失败">
<Rect left="570" top="1554" right="670" bottom="1586"/>
<TitleText Enable="1" Text="右后标定失败"/>
<Script>print("!!!右后标定失败")
engine.DialogBackColor = "Red";
engine.Delay(1000)</Script></Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="1554" right="766" bottom="1586"/>
</Activity>
<Activity id="65" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="1984" right="500" bottom="2016"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="120"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="40" name="DEP1883" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="初始化变量">
<Rect left="400" top="1844" right="500" bottom="1876"/>
<Script>Pram_2=nil</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="延时">
<Rect left="260" top="1984" right="360" bottom="2016"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="读故障码">
<Rect left="240" top="274" right="340" bottom="306"/>
<TitleText Enable="1" Text="读取故障码"/>
<Script>request = "\x02\x08"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x19,0x59,request)</Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="存储高度值到ROM">
<Rect left="400" top="1764" right="500" bottom="1796"/>
<Script>request = "\x01\xDF\x76\x30"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
if (engine.LastError == 0) then		
	recvTel = recvTel:sub(6,6)
	recvTel=string.byte(recvTel)

	if (recvTel ~= 0x1F) then
		engine.LastError = -1
        else
		engine.LastError = 0
	end	

end</Script><assessment no="39" name="DEP1882" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="13" flags="0" name="读故障码">
<Rect left="400" top="2124" right="500" bottom="2156"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x08"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="41" name="DEP1848" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="400" top="2184" right="500" bottom="2216"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_AirS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="60" name="DEP1913" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="清除故障码">
<Rect left="400" top="2044" right="500" bottom="2076"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script><assessment no="46" name="DEP1665" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="400" top="304" right="500" bottom="336"/>
<Line3Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xA8DC7AED"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1860" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="通讯失败">
<Rect left="240" top="184" right="340" bottom="216"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="183" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="240" top="134" right="340" bottom="166"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="2244" right="306" bottom="2276"/>
</Activity>
<Activity id="215" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="400" top="2234" right="500" bottom="2266"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="844" top="64" right="876" bottom="96"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="标定值写入过程">
<Rect left="810" top="754" right="910" bottom="786"/>
<Script>if( vciHandle == nil or vciHandle &lt;=0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
end        

print("vciHandle HS7 AirS="..tostring(vciHandle))</Script><assessment no="1" name="DEP1664" type="8" flags="97"/>
</Activity>
<Activity id="218" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="970" top="754" right="1070" bottom="786"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="216" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="4" EndId="69" type="3">
</Transition>
<Transition StartId="4" EndId="74" type="0">
</Transition>
<Transition StartId="6" EndId="4" type="0">
</Transition>
<Transition StartId="6" EndId="54" type="0">
</Transition>
<Transition StartId="6" EndId="75" type="4">
</Transition>
<Transition StartId="7" EndId="8" type="3">
</Transition>
<Transition StartId="7" EndId="54" type="0">
</Transition>
<Transition StartId="8" EndId="48" type="3">
</Transition>
<Transition StartId="8" EndId="54" type="0">
</Transition>
<Transition StartId="9" EndId="47" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="3">
</Transition>
<Transition StartId="28" EndId="55" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="3">
</Transition>
<Transition StartId="29" EndId="55" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="3">
</Transition>
<Transition StartId="30" EndId="55" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="3">
</Transition>
<Transition StartId="31" EndId="55" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="3">
</Transition>
<Transition StartId="32" EndId="59" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="3">
</Transition>
<Transition StartId="33" EndId="59" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="3">
</Transition>
<Transition StartId="34" EndId="59" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="3">
</Transition>
<Transition StartId="35" EndId="59" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="3">
</Transition>
<Transition StartId="36" EndId="61" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="3">
</Transition>
<Transition StartId="37" EndId="61" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="3">
</Transition>
<Transition StartId="38" EndId="61" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="3">
</Transition>
<Transition StartId="39" EndId="61" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="3">
</Transition>
<Transition StartId="40" EndId="63" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="3">
</Transition>
<Transition StartId="41" EndId="63" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="3">
</Transition>
<Transition StartId="42" EndId="63" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="3">
</Transition>
<Transition StartId="43" EndId="63" type="0">
</Transition>
<Transition StartId="44" EndId="70" type="0">
</Transition>
<Transition StartId="45" EndId="65" type="0">
</Transition>
<Transition StartId="46" EndId="7" type="3">
</Transition>
<Transition StartId="46" EndId="54" type="0">
</Transition>
<Transition StartId="47" EndId="51" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="47" EndId="28" type="0">
</Transition>
<Transition StartId="48" EndId="9" type="0">
</Transition>
<Transition StartId="51" EndId="9" type="0">
</Transition>
<Transition StartId="53" EndId="2" type="0">
</Transition>
<Transition StartId="54" EndId="57" type="0">
</Transition>
<Transition StartId="55" EndId="58" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="60" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="62" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="53" type="0">
</Transition>
<Transition StartId="65" EndId="67" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="65" EndId="73" type="0">
</Transition>
<Transition StartId="66" EndId="45" type="0">
</Transition>
<Transition StartId="67" EndId="45" type="0">
</Transition>
<Transition StartId="69" EndId="46" type="0">
</Transition>
<Transition StartId="70" EndId="66" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="215" type="0">
</Transition>
<Transition StartId="73" EndId="71" type="0">
</Transition>
<Transition StartId="74" EndId="69" type="3">
</Transition>
<Transition StartId="74" EndId="54" type="0">
</Transition>
<Transition StartId="75" EndId="183" type="0">
</Transition>
<Transition StartId="75" EndId="214" type="5">
</Transition>
<Transition StartId="183" EndId="3" type="0">
</Transition>
<Transition StartId="214" EndId="215" type="0">
</Transition>
<Transition StartId="215" EndId="2" type="0">
</Transition>
<Transition StartId="216" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="28" type="0">
</Transition>
<Transition StartId="217" EndId="218" type="4">
</Transition>
</Transitions>
</Process>

