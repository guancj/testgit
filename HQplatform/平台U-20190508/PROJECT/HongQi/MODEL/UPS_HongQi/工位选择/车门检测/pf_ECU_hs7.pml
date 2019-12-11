<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="12" ptbtext="DEP1768" group="112" pbltext="DEP1767">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x755" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75D" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="530" top="4" right="630" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="610" top="6864" right="710" bottom="6896"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="乘客门检测（PDCU）">
<Rect left="530" top="74" right="630" bottom="106"/>
<TitleText Enable="1" Text="乘客门检测（PDCU）"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="530" top="144" right="630" bottom="176"/>
<Line1Text Enable="1" Text="乘客门检测（PDCU）"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="530" top="214" right="630" bottom="246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="220" top="294" right="320" bottom="326"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="220" top="144" right="320" bottom="176"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="134" top="294" right="166" bottom="326"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="530" top="374" right="630" bottom="406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="530" top="434" right="630" bottom="466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x11"/>
<Parameter id="resTitle" value="0x51"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="530" top="514" right="630" bottom="546"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="360" top="584" right="460" bottom="616"/>
<Line1Text Enable="1" Text="乘客门检测（PDCU）"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="16" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="360" top="654" right="460" bottom="686"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="重试？">
<Rect left="190" top="724" right="290" bottom="756"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="18" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="190" top="584" right="290" bottom="616"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="530" top="294" right="630" bottom="326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="360" top="724" right="460" bottom="756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="360" top="804" right="460" bottom="836"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="比对零件号">
<Rect left="660" top="804" right="760" bottom="836"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
len = string.len(DString_C131_Partnumber)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
	end
else
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end
engine.println("######## C131 DDCU PartNumber Read From ECU:"..StringRes);</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="读硬件号">
<Rect left="810" top="864" right="910" bottom="896"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="延时700MS">
<Rect left="660" top="864" right="760" bottom="896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="203" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="810" top="924" right="910" bottom="956"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="延时300MS">
<Rect left="660" top="924" right="760" bottom="956"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="读软件号">
<Rect left="810" top="994" right="910" bottom="1026"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="延时300MS">
<Rect left="660" top="994" right="760" bottom="1026"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="810" top="1074" right="910" bottom="1106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
		if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="4.10";            
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.10"; 
	elseif(DString_C131_Car_Tpye == "CH1AM31")then
		StandValue="2.10"; 
	elseif(DString_C131_Car_Tpye == "CH1AM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM26")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM27")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM41")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM42")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM40")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM46")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM47")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM48")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM35")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM32" or DString_C131_Car_Tpye == "CH1CM33")then
		StandValue="1.00"; 
	elseif(DString_C131_Car_Tpye == "CH1MM41")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM30")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM23")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM43")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM44")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1DM16")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1DM17")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1FM30")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1FM20")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM34")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1NM11")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM30" or DString_C131_Car_Tpye == "CH1CM31")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1JM12")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1LM13")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1LM23")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1MM21")then
		StandValue="3.00"; 
	else
		StandValue="2.00";           
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end              
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end


                                                          


</Script></Activity>
<Activity id="209" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="1074" right="770" bottom="1106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="370" top="1074" right="470" bottom="1106"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，副驾驶门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="211" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="530" top="584" right="630" bottom="616"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="2"/>
<Parameter id="Text" value="&quot;ECU重置，请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="705" ActivityType="3" flags="0" name="init">
<Rect left="370" top="1134" right="470" bottom="1166"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="706" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="370" top="1244" right="470" bottom="1276"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x23&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="707" ActivityType="3" flags="0" name="截取字符串">
<Rect left="370" top="1304" right="470" bottom="1336"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="708" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="1444" right="470" bottom="1476"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="709" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="1444" right="336" bottom="1476"/>
</Activity>
<Activity id="710" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="1194" right="336" bottom="1226"/>
</Activity>
<Activity id="711" ActivityType="3" flags="0" name="TemplateTestLoop_Light_Off">
<Rect left="750" top="1444" right="850" bottom="1476"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="712" ActivityType="3" flags="0" name="init">
<Rect left="750" top="1504" right="850" bottom="1536"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="713" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="750" top="1634" right="850" bottom="1666"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x23&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="714" ActivityType="3" flags="0" name="endloop">
<Rect left="750" top="1844" right="850" bottom="1876"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="715" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1844" right="946" bottom="1876"/>
</Activity>
<Activity id="716" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1574" right="946" bottom="1606"/>
</Activity>
<Activity id="719" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="750" top="1904" right="850" bottom="1936"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="720" ActivityType="3" flags="0" name="副驾驶门灯关闭电压">
<Rect left="290" top="1904" right="390" bottom="1936"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="721" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="1374" right="470" bottom="1406"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="截取字符串">
<Rect left="750" top="1704" right="850" bottom="1736"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="723" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="750" top="1764" right="850" bottom="1796"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态查询&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="744" ActivityType="3" flags="0" name="Mirror_fold_automaticlly">
<Rect left="800" top="2294" right="900" bottom="2326"/>
<Line1Text Enable="1" Text="请确认外后视镜是打开状态"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="745" ActivityType="13" flags="1" name="Fold_automaticlly">
<Rect left="800" top="2364" right="900" bottom="2396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜折叠"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x85\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="800" top="2434" right="900" bottom="2466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="748" ActivityType="3" flags="0" name="init">
<Rect left="800" top="2504" right="900" bottom="2536"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="749" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="2624" right="900" bottom="2656"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="750" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="2814" right="900" bottom="2846"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="751" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="2814" right="756" bottom="2846"/>
</Activity>
<Activity id="752" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="2564" right="756" bottom="2596"/>
</Activity>
<Activity id="753" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="2694" right="900" bottom="2726"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="754" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="2744" right="900" bottom="2776"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="755" ActivityType="13" flags="0" name="Open_automaticlly">
<Rect left="1040" top="2374" right="1140" bottom="2406"/>
<Line3Text Enable="1" Text="乘客门倒车镜展开"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x85\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="756" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="1040" top="2444" right="1140" bottom="2476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="757" ActivityType="3" flags="0" name="init">
<Rect left="1040" top="2514" right="1140" bottom="2546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="758" ActivityType="13" flags="0" name="Read_status">
<Rect left="1040" top="2634" right="1140" bottom="2666"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="759" ActivityType="3" flags="0" name="endloop">
<Rect left="1040" top="2834" right="1140" bottom="2866"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="760" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="2834" right="1206" bottom="2866"/>
</Activity>
<Activity id="761" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="2574" right="1206" bottom="2606"/>
</Activity>
<Activity id="762" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1040" top="2694" right="1140" bottom="2726"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="763" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1040" top="2754" right="1140" bottom="2786"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="764" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="724" right="136" bottom="756"/>
</Activity>
<Activity id="765" ActivityType="3" flags="0" name="乘客门倒车镜X轴增加">
<Rect left="290" top="2884" right="390" bottom="2916"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="766" ActivityType="4" flags="0" name="路由节点">
<Rect left="1074" top="2884" right="1106" bottom="2916"/>
</Activity>
<Activity id="767" ActivityType="13" flags="0" name="X_Axis_increase_adjust">
<Rect left="290" top="3014" right="390" bottom="3046"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="769" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="290" top="3324" right="390" bottom="3356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="770" ActivityType="3" flags="0" name="乘客门倒车镜X轴减少">
<Rect left="490" top="2944" right="590" bottom="2976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="771" ActivityType="13" flags="0" name="X_Axis_decrease_adjust">
<Rect left="490" top="3064" right="590" bottom="3096"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="774" ActivityType="3" flags="0" name="乘客门倒车镜Y轴增加">
<Rect left="680" top="2944" right="780" bottom="2976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="775" ActivityType="13" flags="0" name="Y_Axis_increase_adjust">
<Rect left="680" top="3054" right="780" bottom="3086"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="778" ActivityType="3" flags="0" name="乘客门倒车镜Y轴减少">
<Rect left="860" top="2944" right="960" bottom="2976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="779" ActivityType="13" flags="0" name="Y_Axis_decrease_adjust">
<Rect left="860" top="3064" right="960" bottom="3096"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="782" ActivityType="3" flags="0" name="乘客门倒车镜开始加热">
<Rect left="290" top="3454" right="390" bottom="3486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜开始加热"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="783" ActivityType="13" flags="0" name="Heating_Start">
<Rect left="290" top="3554" right="390" bottom="3586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x86\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="786" ActivityType="13" flags="0" name="Heating_ReturnControlToECU">
<Rect left="290" top="3934" right="390" bottom="3966"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0E\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="789" ActivityType="3" flags="0" name="乘客门转向灯开启">
<Rect left="910" top="3474" right="1010" bottom="3506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门转向灯开启"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="790" ActivityType="13" flags="0" name="Turn_light_on">
<Rect left="910" top="3604" right="1010" bottom="3636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x82\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="792" ActivityType="13" flags="0" name="Turn_light_off">
<Rect left="910" top="3924" right="1010" bottom="3956"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x82\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="794" ActivityType="3" flags="0" name="Check_the_door_lock">
<Rect left="290" top="4084" right="390" bottom="4116"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门自动上锁"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="795" ActivityType="13" flags="0" name="Lock_Door">
<Rect left="290" top="4194" right="390" bottom="4226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x80\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="796" ActivityType="3" flags="0" name="init">
<Rect left="290" top="4264" right="390" bottom="4296"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="797" ActivityType="13" flags="0" name="Read_status">
<Rect left="290" top="4384" right="390" bottom="4416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x22&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="798" ActivityType="3" flags="0" name="endloop">
<Rect left="290" top="4594" right="390" bottom="4626"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="799" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="4594" right="276" bottom="4626"/>
</Activity>
<Activity id="800" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="4324" right="276" bottom="4356"/>
</Activity>
<Activity id="801" ActivityType="3" flags="0" name="截取字符串">
<Rect left="290" top="4454" right="390" bottom="4486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="802" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="290" top="4524" right="390" bottom="4556"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="803" ActivityType="3" flags="0" name="Check_the_door_Unlock">
<Rect left="530" top="4084" right="630" bottom="4116"/>
<Line3Text Enable="1" Text="乘客门自动解锁"/>
<Script></Script></Activity>
<Activity id="804" ActivityType="13" flags="0" name="Unlock_Door">
<Rect left="530" top="4194" right="630" bottom="4226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x80\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="805" ActivityType="3" flags="0" name="init">
<Rect left="530" top="4264" right="630" bottom="4296"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="806" ActivityType="13" flags="0" name="Read_status">
<Rect left="530" top="4384" right="630" bottom="4416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x22&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="807" ActivityType="3" flags="0" name="endloop">
<Rect left="530" top="4594" right="630" bottom="4626"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="808" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="4594" right="506" bottom="4626"/>
</Activity>
<Activity id="809" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="4334" right="506" bottom="4366"/>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="截取字符串">
<Rect left="530" top="4454" right="630" bottom="4486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="811" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="530" top="4524" right="630" bottom="4556"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="812" ActivityType="13" flags="0" name="Door_lock_ReturnControlToECU">
<Rect left="530" top="4664" right="630" bottom="4696"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x80\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="813" ActivityType="3" flags="0" name="Check_the_door_window">
<Rect left="780" top="4794" right="880" bottom="4826"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门玻璃降"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="814" ActivityType="3" flags="0" name="延时500MS">
<Rect left="780" top="4664" right="880" bottom="4696"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="815" ActivityType="13" flags="0" name="Window_down">
<Rect left="780" top="4864" right="880" bottom="4896"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="817" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="780" top="5174" right="880" bottom="5206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x09\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="819" ActivityType="13" flags="0" name="Window_up">
<Rect left="1000" top="4734" right="1100" bottom="4766"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门玻璃升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="821" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="1000" top="5054" right="1100" bottom="5086"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x09\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="822" ActivityType="13" flags="0" name="Window_ReturnControlToECU">
<Rect left="1000" top="5124" right="1100" bottom="5156"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x81\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="823" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="1000" top="5244" right="1100" bottom="5276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="824" ActivityType="3" flags="0" name="Windows_Switch_Check">
<Rect left="330" top="5244" right="430" bottom="5276"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="825" ActivityType="3" flags="0" name="init">
<Rect left="330" top="5314" right="430" bottom="5346"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="826" ActivityType="13" flags="0" name="Read_status">
<Rect left="330" top="5434" right="430" bottom="5466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="827" ActivityType="3" flags="0" name="endloop">
<Rect left="330" top="5644" right="430" bottom="5676"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="828" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="5644" right="296" bottom="5676"/>
</Activity>
<Activity id="829" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="5374" right="296" bottom="5406"/>
</Activity>
<Activity id="830" ActivityType="3" flags="0" name="截取字符串">
<Rect left="330" top="5504" right="430" bottom="5536"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="831" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="330" top="5564" right="430" bottom="5596"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="832" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="330" top="5704" right="430" bottom="5736"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="833" ActivityType="3" flags="0" name="init">
<Rect left="330" top="5764" right="430" bottom="5796"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="834" ActivityType="13" flags="0" name="Read_status">
<Rect left="330" top="5894" right="430" bottom="5926"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="835" ActivityType="3" flags="0" name="endloop">
<Rect left="330" top="6104" right="430" bottom="6136"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="836" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="6104" right="306" bottom="6136"/>
</Activity>
<Activity id="837" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="5834" right="306" bottom="5866"/>
</Activity>
<Activity id="838" ActivityType="3" flags="0" name="截取字符串">
<Rect left="330" top="5964" right="430" bottom="5996"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="839" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="330" top="6024" right="430" bottom="6056"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="840" ActivityType="3" flags="0" name="init">
<Rect left="610" top="5314" right="710" bottom="5346"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="841" ActivityType="13" flags="0" name="Read_status">
<Rect left="610" top="5434" right="710" bottom="5466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="842" ActivityType="3" flags="0" name="endloop">
<Rect left="610" top="5634" right="710" bottom="5666"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="843" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="5634" right="796" bottom="5666"/>
</Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="5374" right="796" bottom="5406"/>
</Activity>
<Activity id="845" ActivityType="3" flags="0" name="截取字符串">
<Rect left="610" top="5494" right="710" bottom="5526"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="846" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="610" top="5554" right="710" bottom="5586"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="847" ActivityType="3" flags="0" name="init">
<Rect left="610" top="5714" right="710" bottom="5746"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="848" ActivityType="13" flags="0" name="Read_status">
<Rect left="610" top="5854" right="710" bottom="5886"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x08&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="849" ActivityType="3" flags="0" name="endloop">
<Rect left="610" top="6064" right="710" bottom="6096"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="850" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="6064" right="806" bottom="6096"/>
</Activity>
<Activity id="851" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="5774" right="806" bottom="5806"/>
</Activity>
<Activity id="852" ActivityType="3" flags="0" name="截取字符串">
<Rect left="610" top="5924" right="710" bottom="5956"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="853" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="610" top="5984" right="710" bottom="6016"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="855" ActivityType="3" flags="0" name="手动开启门锁">
<Rect left="610" top="6134" right="710" bottom="6166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="856" ActivityType="3" flags="0" name="延时700MS">
<Rect left="810" top="804" right="910" bottom="836"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="857" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="370" top="1194" right="470" bottom="1226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="858" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="750" top="1574" right="850" bottom="1606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="290" top="1964" right="390" bottom="1996"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="860" ActivityType="3" flags="0" name="init">
<Rect left="290" top="2034" right="390" bottom="2066"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="endloop">
<Rect left="290" top="2224" right="390" bottom="2256"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="862" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="2224" right="276" bottom="2256"/>
</Activity>
<Activity id="863" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="290" top="2164" right="390" bottom="2196"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="20000.0"/>
<Parameter id="LowerLimit" value="-20000.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="初始化">
<Rect left="290" top="2094" right="390" bottom="2126"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="865" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="2084" right="276" bottom="2116"/>
</Activity>
<Activity id="866" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="2294" right="356" bottom="2326"/>
</Activity>
<Activity id="867" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="620" top="2294" right="720" bottom="2326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="868" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="800" top="2564" right="900" bottom="2596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="869" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="1040" top="2574" right="1140" bottom="2606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="init">
<Rect left="290" top="3074" right="390" bottom="3106"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="871" ActivityType="3" flags="0" name="endloop">
<Rect left="290" top="3264" right="390" bottom="3296"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="872" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="3264" right="276" bottom="3296"/>
</Activity>
<Activity id="873" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="290" top="3204" right="390" bottom="3236"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400.0"/>
<Parameter id="LowerLimit" value="50.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="874" ActivityType="3" flags="0" name="初始化">
<Rect left="290" top="3134" right="390" bottom="3166"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="875" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="3134" right="276" bottom="3166"/>
</Activity>
<Activity id="876" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="290" top="2944" right="390" bottom="2976"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="877" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="490" top="3004" right="590" bottom="3036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="878" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="860" top="3004" right="960" bottom="3036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="879" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="680" top="3004" right="780" bottom="3036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="init">
<Rect left="490" top="3124" right="590" bottom="3156"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="endloop">
<Rect left="490" top="3314" right="590" bottom="3346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="882" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="3314" right="476" bottom="3346"/>
</Activity>
<Activity id="883" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="490" top="3254" right="590" bottom="3286"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400.0"/>
<Parameter id="LowerLimit" value="50.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="初始化">
<Rect left="490" top="3184" right="590" bottom="3216"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="885" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="3184" right="476" bottom="3216"/>
</Activity>
<Activity id="886" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="490" top="3364" right="590" bottom="3396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="887" ActivityType="3" flags="0" name="init">
<Rect left="680" top="3124" right="780" bottom="3156"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="888" ActivityType="3" flags="0" name="endloop">
<Rect left="680" top="3314" right="780" bottom="3346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="3314" right="656" bottom="3346"/>
</Activity>
<Activity id="890" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="680" top="3254" right="780" bottom="3286"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400.0"/>
<Parameter id="LowerLimit" value="50.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="891" ActivityType="3" flags="0" name="初始化">
<Rect left="680" top="3184" right="780" bottom="3216"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="3184" right="656" bottom="3216"/>
</Activity>
<Activity id="893" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="680" top="3364" right="780" bottom="3396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="init">
<Rect left="860" top="3124" right="960" bottom="3156"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="895" ActivityType="3" flags="0" name="endloop">
<Rect left="860" top="3314" right="960" bottom="3346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="896" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="3314" right="846" bottom="3346"/>
</Activity>
<Activity id="897" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="860" top="3254" right="960" bottom="3286"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400.0"/>
<Parameter id="LowerLimit" value="50.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="898" ActivityType="3" flags="0" name="初始化">
<Rect left="860" top="3184" right="960" bottom="3216"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="3184" right="846" bottom="3216"/>
</Activity>
<Activity id="900" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="860" top="3364" right="960" bottom="3396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="init">
<Rect left="290" top="3624" right="390" bottom="3656"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="902" ActivityType="3" flags="0" name="endloop">
<Rect left="290" top="3814" right="390" bottom="3846"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="903" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="3814" right="276" bottom="3846"/>
</Activity>
<Activity id="904" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="290" top="3754" right="390" bottom="3786"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="3500.0"/>
<Parameter id="LowerLimit" value="900.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="905" ActivityType="3" flags="0" name="初始化">
<Rect left="290" top="3684" right="390" bottom="3716"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="906" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="3684" right="276" bottom="3716"/>
</Activity>
<Activity id="907" ActivityType="13" flags="0" name="Heating_Stop">
<Rect left="290" top="3874" right="390" bottom="3906"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x86\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="600" top="3584" right="700" bottom="3616"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="909" ActivityType="3" flags="0" name="init">
<Rect left="600" top="3654" right="700" bottom="3686"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="910" ActivityType="3" flags="0" name="endloop">
<Rect left="600" top="3844" right="700" bottom="3876"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="911" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="3844" right="546" bottom="3876"/>
</Activity>
<Activity id="912" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="600" top="3784" right="700" bottom="3816"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="20000.0"/>
<Parameter id="LowerLimit" value="-20000.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="初始化">
<Rect left="600" top="3714" right="700" bottom="3746"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="914" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="3714" right="546" bottom="3746"/>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="init">
<Rect left="910" top="3674" right="1010" bottom="3706"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="916" ActivityType="3" flags="0" name="endloop">
<Rect left="910" top="3864" right="1010" bottom="3896"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="3864" right="886" bottom="3896"/>
</Activity>
<Activity id="918" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="910" top="3804" right="1010" bottom="3836"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="80.0"/>
<Parameter id="LowerLimit" value="20.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="初始化">
<Rect left="910" top="3734" right="1010" bottom="3766"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="920" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="3734" right="886" bottom="3766"/>
</Activity>
<Activity id="921" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="290" top="3504" right="390" bottom="3536"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="922" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="910" top="3534" right="1010" bottom="3566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="923" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="290" top="4144" right="390" bottom="4176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="924" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="530" top="4134" right="630" bottom="4166"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="925" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="290" top="4324" right="390" bottom="4356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="926" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="530" top="4334" right="630" bottom="4366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="init">
<Rect left="780" top="4924" right="880" bottom="4956"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="endloop">
<Rect left="780" top="5114" right="880" bottom="5146"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="929" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="5114" right="766" bottom="5146"/>
</Activity>
<Activity id="930" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="780" top="5054" right="880" bottom="5086"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30.0"/>
<Parameter id="LowerLimit" value="2.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="931" ActivityType="3" flags="0" name="初始化">
<Rect left="780" top="4984" right="880" bottom="5016"/>
<Script>DFloat_Mts3Result = (engine.pf_door_i)  /1000</Script></Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="4984" right="766" bottom="5016"/>
</Activity>
<Activity id="933" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="780" top="4724" right="880" bottom="4756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="934" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="1000" top="4674" right="1100" bottom="4706"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="init">
<Rect left="1000" top="4804" right="1100" bottom="4836"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="936" ActivityType="3" flags="0" name="endloop">
<Rect left="1000" top="4994" right="1100" bottom="5026"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="4994" right="976" bottom="5026"/>
</Activity>
<Activity id="938" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1000" top="4934" right="1100" bottom="4966"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30.0"/>
<Parameter id="LowerLimit" value="1.5"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="8"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="初始化">
<Rect left="1000" top="4864" right="1100" bottom="4896"/>
<Script>DFloat_Mts3Result = (engine.pf_door_i)  /1000</Script></Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="4864" right="976" bottom="4896"/>
</Activity>
<Activity id="941" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="330" top="5374" right="430" bottom="5406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="942" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="610" top="5374" right="710" bottom="5406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="943" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="330" top="5834" right="430" bottom="5866"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="610" top="5774" right="710" bottom="5806"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="init">
<Rect left="610" top="6204" right="710" bottom="6236"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="946" ActivityType="3" flags="0" name="endloop">
<Rect left="610" top="6394" right="710" bottom="6426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="6394" right="576" bottom="6426"/>
</Activity>
<Activity id="948" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="610" top="6334" right="710" bottom="6366"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600.0"/>
<Parameter id="LowerLimit" value="200.0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3600"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="初始化">
<Rect left="610" top="6264" right="710" bottom="6296"/>
<Script>DFloat_Mts3Result = engine.pf_door_i </Script></Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="6264" right="576" bottom="6296"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="6594" right="676" bottom="6626"/>
</Activity>
<Activity id="1193" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="720" top="6594" right="820" bottom="6626"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11B3-00,B11B4-00,B11CF-00,B11D0-00,B11D1-00,B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1194" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="610" top="6724" right="710" bottom="6756"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DDCU&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1195" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="610" top="6664" right="710" bottom="6696"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2201-00,U2202-00,U2203-00,U2206-00,U2207-00,U0141-00,U1008-00,U0200-00,U0201-00,U0202-00,U0208-00,U0146-00,U2204-00,U2205-00,U220D-00,B11D3-00,B11C8-00,B11C9-00,B11CA-00,B11CB-00,B11D2-00,B11D7-00,B11D9-00,}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1196" ActivityType="3" flags="0" name="读DTC">
<Rect left="610" top="6524" right="710" bottom="6556"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes); </Script></Activity>
<Activity id="1197" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="610" top="6794" right="710" bottom="6826"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1198" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="610" top="6454" right="710" bottom="6486"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="19" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="6">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="5" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="211" type="0">
</Transition>
<Transition StartId="13" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="20" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="6">
</Transition>
<Transition StartId="17" EndId="764" type="0">
</Transition>
<Transition StartId="18" EndId="13" type="0">
</Transition>
<Transition StartId="19" EndId="7" type="4">
</Transition>
<Transition StartId="19" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="17" type="4">
</Transition>
<Transition StartId="20" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="856" type="0">
</Transition>
<Transition StartId="28" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="208" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="705" type="0">
</Transition>
<Transition StartId="211" EndId="13" type="0">
</Transition>
<Transition StartId="705" EndId="857" type="0">
</Transition>
<Transition StartId="706" EndId="707" type="0">
</Transition>
<Transition StartId="707" EndId="721" type="0">
</Transition>
<Transition StartId="708" EndId="709" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="708" EndId="711" type="0">
</Transition>
<Transition StartId="709" EndId="710" type="0">
</Transition>
<Transition StartId="710" EndId="857" type="0">
</Transition>
<Transition StartId="711" EndId="712" type="0">
</Transition>
<Transition StartId="712" EndId="858" type="0">
</Transition>
<Transition StartId="713" EndId="722" type="0">
</Transition>
<Transition StartId="714" EndId="715" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="714" EndId="719" type="0">
</Transition>
<Transition StartId="715" EndId="716" type="0">
</Transition>
<Transition StartId="716" EndId="858" type="0">
</Transition>
<Transition StartId="719" EndId="720" type="0">
</Transition>
<Transition StartId="720" EndId="859" type="0">
</Transition>
<Transition StartId="721" EndId="708" type="0">
</Transition>
<Transition StartId="722" EndId="723" type="0">
</Transition>
<Transition StartId="723" EndId="714" type="0">
</Transition>
<Transition StartId="744" EndId="745" type="0">
</Transition>
<Transition StartId="745" EndId="747" type="0">
</Transition>
<Transition StartId="747" EndId="748" type="0">
</Transition>
<Transition StartId="748" EndId="868" type="0">
</Transition>
<Transition StartId="749" EndId="753" type="0">
</Transition>
<Transition StartId="750" EndId="751" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="750" EndId="755" type="0">
</Transition>
<Transition StartId="751" EndId="752" type="0">
</Transition>
<Transition StartId="752" EndId="868" type="0">
</Transition>
<Transition StartId="753" EndId="754" type="0">
</Transition>
<Transition StartId="754" EndId="750" type="0">
</Transition>
<Transition StartId="755" EndId="756" type="0">
</Transition>
<Transition StartId="756" EndId="757" type="0">
</Transition>
<Transition StartId="757" EndId="869" type="0">
</Transition>
<Transition StartId="758" EndId="762" type="0">
</Transition>
<Transition StartId="759" EndId="760" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="759" EndId="766" type="0">
</Transition>
<Transition StartId="760" EndId="761" type="0">
</Transition>
<Transition StartId="761" EndId="869" type="0">
</Transition>
<Transition StartId="762" EndId="763" type="0">
</Transition>
<Transition StartId="763" EndId="759" type="0">
</Transition>
<Transition StartId="765" EndId="876" type="0">
</Transition>
<Transition StartId="766" EndId="765" type="0">
</Transition>
<Transition StartId="767" EndId="870" type="0">
</Transition>
<Transition StartId="769" EndId="770" type="0">
</Transition>
<Transition StartId="770" EndId="877" type="0">
</Transition>
<Transition StartId="771" EndId="880" type="0">
</Transition>
<Transition StartId="774" EndId="879" type="0">
</Transition>
<Transition StartId="775" EndId="887" type="0">
</Transition>
<Transition StartId="778" EndId="878" type="0">
</Transition>
<Transition StartId="779" EndId="894" type="0">
</Transition>
<Transition StartId="782" EndId="921" type="0">
</Transition>
<Transition StartId="783" EndId="901" type="0">
</Transition>
<Transition StartId="786" EndId="908" type="0">
</Transition>
<Transition StartId="789" EndId="922" type="0">
</Transition>
<Transition StartId="790" EndId="915" type="0">
</Transition>
<Transition StartId="792" EndId="794" type="0">
</Transition>
<Transition StartId="794" EndId="923" type="0">
</Transition>
<Transition StartId="795" EndId="796" type="0">
</Transition>
<Transition StartId="796" EndId="925" type="0">
</Transition>
<Transition StartId="797" EndId="801" type="0">
</Transition>
<Transition StartId="798" EndId="799" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="798" EndId="803" type="0">
</Transition>
<Transition StartId="799" EndId="800" type="0">
</Transition>
<Transition StartId="800" EndId="925" type="0">
</Transition>
<Transition StartId="801" EndId="802" type="0">
</Transition>
<Transition StartId="802" EndId="798" type="0">
</Transition>
<Transition StartId="803" EndId="924" type="0">
</Transition>
<Transition StartId="804" EndId="805" type="0">
</Transition>
<Transition StartId="805" EndId="926" type="0">
</Transition>
<Transition StartId="806" EndId="810" type="0">
</Transition>
<Transition StartId="807" EndId="808" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="807" EndId="812" type="0">
</Transition>
<Transition StartId="808" EndId="809" type="0">
</Transition>
<Transition StartId="809" EndId="926" type="0">
</Transition>
<Transition StartId="810" EndId="811" type="0">
</Transition>
<Transition StartId="811" EndId="807" type="0">
</Transition>
<Transition StartId="812" EndId="814" type="0">
</Transition>
<Transition StartId="813" EndId="815" type="0">
</Transition>
<Transition StartId="814" EndId="933" type="0">
</Transition>
<Transition StartId="815" EndId="927" type="0">
</Transition>
<Transition StartId="817" EndId="934" type="0">
</Transition>
<Transition StartId="819" EndId="935" type="0">
</Transition>
<Transition StartId="821" EndId="822" type="0">
</Transition>
<Transition StartId="822" EndId="823" type="0">
</Transition>
<Transition StartId="823" EndId="824" type="0">
</Transition>
<Transition StartId="824" EndId="825" type="0">
</Transition>
<Transition StartId="825" EndId="941" type="0">
</Transition>
<Transition StartId="826" EndId="830" type="0">
</Transition>
<Transition StartId="827" EndId="828" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="827" EndId="832" type="0">
</Transition>
<Transition StartId="828" EndId="829" type="0">
</Transition>
<Transition StartId="829" EndId="941" type="0">
</Transition>
<Transition StartId="830" EndId="831" type="0">
</Transition>
<Transition StartId="831" EndId="827" type="0">
</Transition>
<Transition StartId="832" EndId="833" type="0">
</Transition>
<Transition StartId="833" EndId="943" type="0">
</Transition>
<Transition StartId="834" EndId="838" type="0">
</Transition>
<Transition StartId="835" EndId="836" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="835" EndId="840" type="0">
</Transition>
<Transition StartId="836" EndId="837" type="0">
</Transition>
<Transition StartId="837" EndId="943" type="0">
</Transition>
<Transition StartId="838" EndId="839" type="0">
</Transition>
<Transition StartId="839" EndId="835" type="0">
</Transition>
<Transition StartId="840" EndId="942" type="0">
</Transition>
<Transition StartId="841" EndId="845" type="0">
</Transition>
<Transition StartId="842" EndId="843" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="842" EndId="847" type="0">
</Transition>
<Transition StartId="843" EndId="844" type="0">
</Transition>
<Transition StartId="844" EndId="942" type="0">
</Transition>
<Transition StartId="845" EndId="846" type="0">
</Transition>
<Transition StartId="846" EndId="842" type="0">
</Transition>
<Transition StartId="847" EndId="944" type="0">
</Transition>
<Transition StartId="848" EndId="852" type="0">
</Transition>
<Transition StartId="849" EndId="850" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="849" EndId="855" type="0">
</Transition>
<Transition StartId="850" EndId="851" type="0">
</Transition>
<Transition StartId="851" EndId="944" type="0">
</Transition>
<Transition StartId="852" EndId="853" type="0">
</Transition>
<Transition StartId="853" EndId="849" type="0">
</Transition>
<Transition StartId="855" EndId="945" type="0">
</Transition>
<Transition StartId="856" EndId="28" type="0">
</Transition>
<Transition StartId="857" EndId="706" type="0">
</Transition>
<Transition StartId="858" EndId="713" type="0">
</Transition>
<Transition StartId="859" EndId="860" type="0">
</Transition>
<Transition StartId="860" EndId="864" type="0">
</Transition>
<Transition StartId="861" EndId="862" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="861" EndId="866" type="0">
</Transition>
<Transition StartId="862" EndId="865" type="0">
</Transition>
<Transition StartId="863" EndId="861" type="0">
</Transition>
<Transition StartId="864" EndId="863" type="0">
</Transition>
<Transition StartId="865" EndId="864" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42" and DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="866" EndId="765" type="0">
</Transition>
<Transition StartId="867" EndId="744" type="0">
</Transition>
<Transition StartId="868" EndId="749" type="0">
</Transition>
<Transition StartId="869" EndId="758" type="0">
</Transition>
<Transition StartId="870" EndId="874" type="0">
</Transition>
<Transition StartId="871" EndId="872" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="871" EndId="769" type="0">
</Transition>
<Transition StartId="872" EndId="875" type="0">
</Transition>
<Transition StartId="873" EndId="871" type="0">
</Transition>
<Transition StartId="874" EndId="873" type="0">
</Transition>
<Transition StartId="875" EndId="874" type="0">
</Transition>
<Transition StartId="876" EndId="767" type="0">
</Transition>
<Transition StartId="877" EndId="771" type="0">
</Transition>
<Transition StartId="878" EndId="779" type="0">
</Transition>
<Transition StartId="879" EndId="775" type="0">
</Transition>
<Transition StartId="880" EndId="884" type="0">
</Transition>
<Transition StartId="881" EndId="882" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="881" EndId="886" type="0">
</Transition>
<Transition StartId="882" EndId="885" type="0">
</Transition>
<Transition StartId="883" EndId="881" type="0">
</Transition>
<Transition StartId="884" EndId="883" type="0">
</Transition>
<Transition StartId="885" EndId="884" type="0">
</Transition>
<Transition StartId="886" EndId="774" type="0">
</Transition>
<Transition StartId="887" EndId="891" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="888" EndId="893" type="0">
</Transition>
<Transition StartId="889" EndId="892" type="0">
</Transition>
<Transition StartId="890" EndId="888" type="0">
</Transition>
<Transition StartId="891" EndId="890" type="0">
</Transition>
<Transition StartId="892" EndId="891" type="0">
</Transition>
<Transition StartId="893" EndId="778" type="0">
</Transition>
<Transition StartId="894" EndId="898" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="895" EndId="900" type="0">
</Transition>
<Transition StartId="896" EndId="899" type="0">
</Transition>
<Transition StartId="897" EndId="895" type="0">
</Transition>
<Transition StartId="898" EndId="897" type="0">
</Transition>
<Transition StartId="899" EndId="898" type="0">
</Transition>
<Transition StartId="900" EndId="782" type="0">
</Transition>
<Transition StartId="901" EndId="905" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="902" EndId="907" type="0">
</Transition>
<Transition StartId="903" EndId="906" type="0">
</Transition>
<Transition StartId="904" EndId="902" type="0">
</Transition>
<Transition StartId="905" EndId="904" type="0">
</Transition>
<Transition StartId="906" EndId="905" type="0">
</Transition>
<Transition StartId="907" EndId="786" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="0">
</Transition>
<Transition StartId="909" EndId="913" type="0">
</Transition>
<Transition StartId="910" EndId="911" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="910" EndId="789" type="0">
</Transition>
<Transition StartId="911" EndId="914" type="0">
</Transition>
<Transition StartId="912" EndId="910" type="0">
</Transition>
<Transition StartId="913" EndId="912" type="0">
</Transition>
<Transition StartId="914" EndId="913" type="0">
</Transition>
<Transition StartId="915" EndId="919" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="916" EndId="792" type="0">
</Transition>
<Transition StartId="917" EndId="920" type="0">
</Transition>
<Transition StartId="918" EndId="916" type="0">
</Transition>
<Transition StartId="919" EndId="918" type="0">
</Transition>
<Transition StartId="920" EndId="919" type="0">
</Transition>
<Transition StartId="921" EndId="783" type="0">
</Transition>
<Transition StartId="922" EndId="790" type="0">
</Transition>
<Transition StartId="923" EndId="795" type="0">
</Transition>
<Transition StartId="924" EndId="804" type="0">
</Transition>
<Transition StartId="925" EndId="797" type="0">
</Transition>
<Transition StartId="926" EndId="806" type="0">
</Transition>
<Transition StartId="927" EndId="931" type="0">
</Transition>
<Transition StartId="928" EndId="929" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="928" EndId="817" type="0">
</Transition>
<Transition StartId="929" EndId="932" type="0">
</Transition>
<Transition StartId="930" EndId="928" type="0">
</Transition>
<Transition StartId="931" EndId="930" type="0">
</Transition>
<Transition StartId="932" EndId="931" type="0">
</Transition>
<Transition StartId="933" EndId="813" type="0">
</Transition>
<Transition StartId="934" EndId="819" type="0">
</Transition>
<Transition StartId="935" EndId="939" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="936" EndId="821" type="0">
</Transition>
<Transition StartId="937" EndId="940" type="0">
</Transition>
<Transition StartId="938" EndId="936" type="0">
</Transition>
<Transition StartId="939" EndId="938" type="0">
</Transition>
<Transition StartId="940" EndId="939" type="0">
</Transition>
<Transition StartId="941" EndId="826" type="0">
</Transition>
<Transition StartId="942" EndId="841" type="0">
</Transition>
<Transition StartId="943" EndId="834" type="0">
</Transition>
<Transition StartId="944" EndId="848" type="0">
</Transition>
<Transition StartId="945" EndId="949" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="946" EndId="1198" type="0">
</Transition>
<Transition StartId="947" EndId="950" type="0">
</Transition>
<Transition StartId="948" EndId="946" type="0">
</Transition>
<Transition StartId="949" EndId="948" type="0">
</Transition>
<Transition StartId="950" EndId="949" type="0">
</Transition>
<Transition StartId="951" EndId="1193" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="951" EndId="1195" type="0">
</Transition>
<Transition StartId="1193" EndId="1195" type="0">
</Transition>
<Transition StartId="1194" EndId="1197" type="0">
</Transition>
<Transition StartId="1195" EndId="1194" type="0">
</Transition>
<Transition StartId="1196" EndId="951" type="0">
</Transition>
<Transition StartId="1197" EndId="2" type="0">
</Transition>
<Transition StartId="1198" EndId="1196" type="0">
</Transition>
</Transitions>
</Process>

