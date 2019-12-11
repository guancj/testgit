<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1503" pbltext="DEP1">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x79F" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7BF" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="310" top="40" right="410" bottom="72"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="310" top="904" right="410" bottom="936"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
end</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="310" top="96" right="410" bottom="128"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP24" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="比对零件号">
<Rect left="310" top="160" right="410" bottom="192"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xF1\x87")

DString_C131_Partnumber = "3711085-MD"
if (engine.LastError == 0) then
	readPartNum = recvTel:sub(4,13)
	engine.SetLineText(3,readPartNum);
	engine.println("读到零件号:"..readPartNum);
	
	if (readPartNum==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..readPartNum.."  "..DString_C131_Partnumber);
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..readPartNum.."  "..DString_C131_Partnumber);
	end
engine.StatValue=readPartNum;
engine.StatPoint=DString_C131_Partnumber;
engine.SetLineText(3,"");
else
	engine.LastError = 1;
	engine.println("读AFS零件 service Negtive @Dpin")
end</Script><assessment no="2" name="DEP214" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="扩展会话">
<Rect left="310" top="216" right="410" bottom="248"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="3" name="DEP1079" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="310" top="272" right="410" bottom="304"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x7D9BAC8E"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP3" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="比对配置码">
<Rect left="980" top="234" right="1080" bottom="266"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x00")


engine.println("配置码标准值:"..DString_C131_VariCoding);
--[[
if(engine.LastError == 0)then
	DString_Read_Config_Code_From_ECU=hexstr(recvTel:sub(4,4));
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.StatValue= DString_Read_Config_Code_From_ECU;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end --]]
</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="复位ECU">
<Rect left="930" top="344" right="1030" bottom="376"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x11,0x51,"\x01")
engine.Delay(100)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="保持车辆静止3s">
<Rect left="310" top="440" right="410" bottom="472"/>
<TitleText Enable="1"/>
<Line2Text Enable="1" Text="保持车辆静止"/>
<Script>timeStart = os.clock()

repeat
	engine.Delay(1000)
        currTime = os.clock()
        extime = math.floor(currTime - timeStart)
        engine.SetLineText(2,"等待时间:"..extime)
        
 until (extime &lt;= 3)</Script></Activity>
<Activity id="28" ActivityType="13" flags="0" name="Learn Zero Position">
<Rect left="310" top="654" right="410" bottom="686"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x29\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="7" name="DEP1420" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="读学习状态">
<Rect left="310" top="714" right="410" bottom="746"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x03\x02")

IntStatus = string.byte(recvTel:sub(4,4))
bitValue = bit32.extract(IntStatus,0,1)

if (bitValue == 1) then
	engine.SetLineText(2,"AFS 传感器已学习")
        engine.LastError = 0
end

if (bitValue == 0) then
	engine.SetLineText(2,"AFS 传感器未学习")
        engine.LastError = 1
end</Script><assessment no="8" name="DEP1421" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="AFS标定前存在故障码">
<Rect left="500" top="574" right="600" bottom="606"/>
<Script>engine.SetLineText(2,"AFS标定前存在故障码")
engine.SetLineText(3,"退出")
engine.DialogBackColor = "red";
engine.LastError = 1
engine.Delay(2000) </Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="AFS标定前比对配置码错误">
<Rect left="920" top="174" right="1020" bottom="206"/>
<Script></Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="AFS标定前零件号比对错误">
<Rect left="502" top="160" right="602" bottom="192"/>
<Script>engine.LastError = 1</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="ECU通讯初始化错误">
<Rect left="502" top="96" right="602" bottom="128"/>
<Script></Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="执行标定失败">
<Rect left="500" top="654" right="600" bottom="686"/>
<Script></Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="标定成功">
<Rect left="310" top="784" right="410" bottom="816"/>
<Line2Text Enable="1" Text="AFS 标定成功"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="标定失败">
<Rect left="500" top="714" right="600" bottom="746"/>
<Line2Text Enable="1" Text="AFS 标定失败"/>
<Script>engine.LastError = 1
engine.Delay(3000)</Script></Activity>
<Activity id="38" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="310" top="844" right="410" bottom="876"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1422" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="清除故障码">
<Rect left="310" top="344" right="410" bottom="376"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script><assessment no="5" name="DEP2" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="13" flags="0" name="UDS_ReadDTCByStatusMask">
<Rect left="310" top="504" right="410" bottom="536"/>
<TitleText Enable="1" Text="AFS 标定前读取DTC"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0xFF"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="10" name="DEP131" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="13" flags="0" name="UDS_DTCFilterStatisticList">
<Rect left="310" top="574" right="410" bottom="606"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="true"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_AFS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP1574" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="标定失败">
<Rect left="1100" top="724" right="1200" bottom="756"/>
<Line2Text Enable="1" Text="AFS标定失败"/>
<Line4Text Enable="1" Text="重试标定？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="43" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="720" top="634" right="820" bottom="666"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1422" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="3">
</Transition>
<Transition StartId="3" EndId="33" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="3">
</Transition>
<Transition StartId="5" EndId="32" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="39" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="31" type="0">
</Transition>
<Transition StartId="26" EndId="40" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="3">
</Transition>
<Transition StartId="28" EndId="35" type="0">
</Transition>
<Transition StartId="29" EndId="36" type="3">
</Transition>
<Transition StartId="29" EndId="37" type="0">
</Transition>
<Transition StartId="30" EndId="43" type="0">
</Transition>
<Transition StartId="32" EndId="43" type="0">
</Transition>
<Transition StartId="33" EndId="43" type="0">
</Transition>
<Transition StartId="35" EndId="43" type="0">
</Transition>
<Transition StartId="36" EndId="38" type="0">
</Transition>
<Transition StartId="37" EndId="43" type="0">
</Transition>
<Transition StartId="38" EndId="2" type="0">
</Transition>
<Transition StartId="39" EndId="26" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="3">
</Transition>
<Transition StartId="41" EndId="28" type="3">
</Transition>
<Transition StartId="41" EndId="30" type="0">
</Transition>
</Transitions>
</Process>

