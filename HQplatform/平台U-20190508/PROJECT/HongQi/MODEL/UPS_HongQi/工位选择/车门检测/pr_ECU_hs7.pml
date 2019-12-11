<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x757" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75F" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="541" top="7" right="641" bottom="39"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="630" top="5584" right="730" bottom="5616"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="右后门（RRDCU）">
<Rect left="540" top="78" right="640" bottom="110"/>
<TitleText Enable="1" Text="右后门（RRDCU）"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="539" top="153" right="639" bottom="185"/>
<Line1Text Enable="1" Text="控制器通讯"/>
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
<Rect left="539" top="226" right="639" bottom="258"/>
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
<Rect left="234" top="305" right="334" bottom="337"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="235" top="152" right="335" bottom="184"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="178" top="304" right="210" bottom="336"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="539" top="386" right="639" bottom="418"/>
<Line1Text Enable="1" Text="清故障码"/>
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
<Rect left="538" top="452" right="638" bottom="484"/>
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
<Rect left="538" top="524" right="638" bottom="556"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="538" top="306" right="638" bottom="338"/>
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
<Activity id="14" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="538" top="590" right="638" bottom="622"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="2"/>
<Parameter id="Text" value="&quot;ECU重置，请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="538" top="662" right="638" bottom="694"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="705" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="538" top="735" right="638" bottom="767"/>
<Line1Text Enable="1" Text="切诊断"/>
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
<Activity id="706" ActivityType="3" flags="0" name="重试？">
<Rect left="236" top="804" right="336" bottom="836"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="707" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="237" top="661" right="337" bottom="693"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="537" top="804" right="637" bottom="836"/>
<Line1Text Enable="1" Text="读零件号"/>
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
<Activity id="709" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="537" top="865" right="637" bottom="897"/>
<Script></Script></Activity>
<Activity id="713" ActivityType="3" flags="0" name="延时500MS">
<Rect left="674" top="153" right="774" bottom="185"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="858" ActivityType="3" flags="0" name="比对零件号">
<Rect left="767" top="864" right="867" bottom="896"/>
<Line1Text Enable="1" Text="比对零件号"/>
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
<Activity id="859" ActivityType="3" flags="0" name="读硬件号">
<Rect left="915" top="926" right="1015" bottom="958"/>
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
<Activity id="860" ActivityType="3" flags="0" name="延时700MS">
<Rect left="767" top="925" right="867" bottom="957"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="918" top="990" right="1018" bottom="1022"/>
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
<Activity id="862" ActivityType="3" flags="0" name="延时300MS">
<Rect left="770" top="986" right="870" bottom="1018"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="863" ActivityType="3" flags="0" name="读软件号">
<Rect left="917" top="1061" right="1017" bottom="1093"/>
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
<Activity id="864" ActivityType="3" flags="0" name="延时300MS">
<Rect left="768" top="1057" right="868" bottom="1089"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="921" top="1131" right="1021" bottom="1163"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
		if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="2.00";            
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM31")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM26")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM27")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM41")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM42")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM40")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM46")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM47")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM48")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM35")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM32" or DString_C131_Car_Tpye == "CH1CM33")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1MM10")then
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
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="773" top="1133" right="873" bottom="1165"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="300" top="1134" right="400" bottom="1166"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，右后门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="868" ActivityType="3" flags="0" name="init">
<Rect left="300" top="1194" right="400" bottom="1226"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="869" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="300" top="1304" right="400" bottom="1336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2B&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="截取字符串">
<Rect left="300" top="1374" right="400" bottom="1406"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="871" ActivityType="3" flags="0" name="endloop">
<Rect left="300" top="1514" right="400" bottom="1546"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="872" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="1514" right="276" bottom="1546"/>
</Activity>
<Activity id="873" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="1244" right="276" bottom="1276"/>
</Activity>
<Activity id="874" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="1444" right="400" bottom="1476"/>
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
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="875" ActivityType="3" flags="0" name="TemplateTestLoop_Light_Off">
<Rect left="800" top="1514" right="900" bottom="1546"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="876" ActivityType="3" flags="0" name="init">
<Rect left="800" top="1574" right="900" bottom="1606"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="877" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="800" top="1704" right="900" bottom="1736"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2B&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="878" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="1914" right="900" bottom="1946"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="879" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="1914" right="1036" bottom="1946"/>
</Activity>
<Activity id="880" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="1634" right="1036" bottom="1666"/>
</Activity>
<Activity id="881" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="800" top="1974" right="900" bottom="2006"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="882" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="1774" right="900" bottom="1806"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="883" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="1834" right="900" bottom="1866"/>
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
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="330" top="1974" right="430" bottom="2006"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="889" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="820" top="2234" right="920" bottom="2266"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="右后门玻璃下降"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="896" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="820" top="2544" right="920" bottom="2576"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="897" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="820" top="2644" right="920" bottom="2676"/>
<Line3Text Enable="1" Text="右后门玻璃上升"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="904" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="820" top="2954" right="920" bottom="2986"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="905" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="820" top="3004" right="920" bottom="3036"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC1\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="906" ActivityType="13" flags="0" name="Check_the_door_lock">
<Rect left="410" top="3004" right="510" bottom="3036"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC0\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="907" ActivityType="3" flags="0" name="init">
<Rect left="410" top="3064" right="510" bottom="3096"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="908" ActivityType="13" flags="0" name="Read_status">
<Rect left="410" top="3194" right="510" bottom="3226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x42&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="909" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="3404" right="510" bottom="3436"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3404" right="386" bottom="3436"/>
</Activity>
<Activity id="911" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3124" right="386" bottom="3156"/>
</Activity>
<Activity id="912" ActivityType="3" flags="0" name="截取字符串">
<Rect left="410" top="3264" right="510" bottom="3296"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="913" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="3324" right="510" bottom="3356"/>
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
<Activity id="914" ActivityType="3" flags="0" name="init">
<Rect left="410" top="3524" right="510" bottom="3556"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="915" ActivityType="13" flags="0" name="Read_status">
<Rect left="410" top="3644" right="510" bottom="3676"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x42&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="916" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="3844" right="510" bottom="3876"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3844" right="386" bottom="3876"/>
</Activity>
<Activity id="918" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3584" right="386" bottom="3616"/>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="截取字符串">
<Rect left="410" top="3704" right="510" bottom="3736"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="920" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="3764" right="510" bottom="3796"/>
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
<Activity id="922" ActivityType="13" flags="0" name="Doors_lock_ReturnControlToECU">
<Rect left="410" top="3904" right="510" bottom="3936"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC0\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="923" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="590" top="3904" right="690" bottom="3936"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="924" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="880" top="3904" right="980" bottom="3936"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="925" ActivityType="3" flags="0" name="init">
<Rect left="880" top="3974" right="980" bottom="4006"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Read_status">
<Rect left="880" top="4094" right="980" bottom="4126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="4274" right="980" bottom="4306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="928" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="4274" right="846" bottom="4306"/>
</Activity>
<Activity id="929" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="4034" right="846" bottom="4066"/>
</Activity>
<Activity id="930" ActivityType="3" flags="0" name="截取字符串">
<Rect left="880" top="4154" right="980" bottom="4186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="931" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="880" top="4214" right="980" bottom="4246"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="880" top="4334" right="980" bottom="4366"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="933" ActivityType="3" flags="0" name="init">
<Rect left="880" top="4394" right="980" bottom="4426"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="934" ActivityType="13" flags="0" name="Read_status">
<Rect left="880" top="4534" right="980" bottom="4566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="4744" right="980" bottom="4776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="4744" right="856" bottom="4776"/>
</Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="4474" right="856" bottom="4506"/>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="截取字符串">
<Rect left="880" top="4604" right="980" bottom="4636"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="939" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="880" top="4654" right="980" bottom="4686"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="init">
<Rect left="1170" top="3984" right="1270" bottom="4016"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Read_status">
<Rect left="1170" top="4104" right="1270" bottom="4136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="endloop">
<Rect left="1170" top="4314" right="1270" bottom="4346"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="4314" right="1396" bottom="4346"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="4044" right="1396" bottom="4076"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1170" top="4174" right="1270" bottom="4206"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="946" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1170" top="4234" right="1270" bottom="4266"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="init">
<Rect left="1170" top="4404" right="1270" bottom="4436"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="Read_status">
<Rect left="1170" top="4514" right="1270" bottom="4546"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3D\x44&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="endloop">
<Rect left="1170" top="4724" right="1270" bottom="4756"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="4724" right="1406" bottom="4756"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="4464" right="1406" bottom="4496"/>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1170" top="4574" right="1270" bottom="4606"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="953" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1170" top="4634" right="1270" bottom="4666"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="1204" top="4794" right="1236" bottom="4826"/>
</Activity>
<Activity id="955" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="300" top="1244" right="400" bottom="1276"/>
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
<Activity id="956" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="800" top="1634" right="900" bottom="1666"/>
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
<Activity id="958" ActivityType="3" flags="0" name="init">
<Rect left="330" top="2044" right="430" bottom="2076"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="330" top="2234" right="430" bottom="2266"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="2234" right="286" bottom="2266"/>
</Activity>
<Activity id="961" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="330" top="2174" right="430" bottom="2206"/>
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
<Activity id="962" ActivityType="3" flags="0" name="初始化">
<Rect left="330" top="2104" right="430" bottom="2136"/>
<Script>DFloat_Mts3Result = engine.pr_door_i </Script></Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="2104" right="286" bottom="2136"/>
</Activity>
<Activity id="964" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="580" top="2234" right="680" bottom="2266"/>
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
<Activity id="965" ActivityType="3" flags="0" name="init">
<Rect left="820" top="2294" right="920" bottom="2326"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="966" ActivityType="3" flags="0" name="endloop">
<Rect left="820" top="2484" right="920" bottom="2516"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="2484" right="806" bottom="2516"/>
</Activity>
<Activity id="968" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="820" top="2424" right="920" bottom="2456"/>
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
<Activity id="969" ActivityType="3" flags="0" name="初始化">
<Rect left="820" top="2354" right="920" bottom="2386"/>
<Script>DFloat_Mts3Result = (engine.pr_door_i)  /1000</Script></Activity>
<Activity id="970" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="2354" right="806" bottom="2386"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="init">
<Rect left="820" top="2704" right="920" bottom="2736"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="972" ActivityType="3" flags="0" name="endloop">
<Rect left="820" top="2894" right="920" bottom="2926"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="973" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="2894" right="776" bottom="2926"/>
</Activity>
<Activity id="974" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="820" top="2824" right="920" bottom="2856"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30.0"/>
<Parameter id="LowerLimit" value="2.5"/>
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
<Activity id="975" ActivityType="3" flags="0" name="初始化">
<Rect left="820" top="2764" right="920" bottom="2796"/>
<Script>DFloat_Mts3Result = (engine.pr_door_i)  /1000</Script></Activity>
<Activity id="976" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="2764" right="776" bottom="2796"/>
</Activity>
<Activity id="977" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="820" top="2604" right="920" bottom="2636"/>
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
<Activity id="978" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="610" top="3004" right="710" bottom="3036"/>
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
<Activity id="979" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="410" top="3124" right="510" bottom="3156"/>
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
<Activity id="980" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="410" top="3584" right="510" bottom="3616"/>
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
<Activity id="981" ActivityType="13" flags="0" name="Check_the_door_Unlock">
<Rect left="410" top="3464" right="510" bottom="3496"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动解锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\xC0\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="982" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="880" top="4034" right="980" bottom="4066"/>
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
<Activity id="983" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="1170" top="4044" right="1270" bottom="4076"/>
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
<Activity id="984" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="880" top="4474" right="980" bottom="4506"/>
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
<Activity id="985" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="1170" top="4464" right="1270" bottom="4496"/>
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
<Activity id="986" ActivityType="3" flags="0" name="手动开启门锁">
<Rect left="1170" top="4864" right="1270" bottom="4896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="987" ActivityType="3" flags="0" name="init">
<Rect left="1170" top="4934" right="1270" bottom="4966"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="988" ActivityType="3" flags="0" name="endloop">
<Rect left="1170" top="5124" right="1270" bottom="5156"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="989" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="5124" right="1136" bottom="5156"/>
</Activity>
<Activity id="990" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1170" top="5064" right="1270" bottom="5096"/>
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
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="991" ActivityType="3" flags="0" name="初始化">
<Rect left="1170" top="4994" right="1270" bottom="5026"/>
<Script>DFloat_Mts3Result = engine.pr_door_i </Script></Activity>
<Activity id="992" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="4994" right="1136" bottom="5026"/>
</Activity>
<Activity id="993" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="630" top="5174" right="730" bottom="5206"/>
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
<Activity id="1199" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="1170" top="5174" right="1270" bottom="5206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1200" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="5314" right="696" bottom="5346"/>
</Activity>
<Activity id="1201" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="740" top="5314" right="840" bottom="5346"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11B3-00,B11B4-00,B11CF-00,B11D0-00,B11D1-00,B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1202" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="630" top="5444" right="730" bottom="5476"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DDCU&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1203" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="630" top="5384" right="730" bottom="5416"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2201-00,U2202-00,U2203-00,U2206-00,U2207-00,U0141-00,U1008-00,U0200-00,U0201-00,U0202-00,U0208-00,U0146-00,U2204-00,U2205-00,U220D-00,B11D3-00,B11C8-00,B11C9-00,B11CA-00,B11CB-00,B11D2-00,B11D7-00,B11D9-00,}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1204" ActivityType="3" flags="0" name="读DTC">
<Rect left="630" top="5244" right="730" bottom="5276"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes); </Script></Activity>
<Activity id="1205" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="630" top="5514" right="730" bottom="5546"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="713" type="0">
</Transition>
<Transition StartId="6" EndId="13" type="0">
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
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="7" type="4">
</Transition>
<Transition StartId="13" EndId="10" type="0">
</Transition>
<Transition StartId="14" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="705" type="0">
</Transition>
<Transition StartId="705" EndId="708" type="0">
</Transition>
<Transition StartId="706" EndId="707" type="6">
</Transition>
<Transition StartId="707" EndId="21" type="0">
</Transition>
<Transition StartId="708" EndId="706" type="4">
</Transition>
<Transition StartId="708" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="858" type="0">
</Transition>
<Transition StartId="713" EndId="6" type="0">
</Transition>
<Transition StartId="858" EndId="859" type="0">
</Transition>
<Transition StartId="859" EndId="860" type="0">
</Transition>
<Transition StartId="860" EndId="861" type="0">
</Transition>
<Transition StartId="861" EndId="862" type="0">
</Transition>
<Transition StartId="862" EndId="863" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="867" EndId="868" type="0">
</Transition>
<Transition StartId="868" EndId="955" type="0">
</Transition>
<Transition StartId="869" EndId="870" type="0">
</Transition>
<Transition StartId="870" EndId="874" type="0">
</Transition>
<Transition StartId="871" EndId="872" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="871" EndId="875" type="0">
</Transition>
<Transition StartId="872" EndId="873" type="0">
</Transition>
<Transition StartId="873" EndId="955" type="0">
</Transition>
<Transition StartId="874" EndId="871" type="0">
</Transition>
<Transition StartId="875" EndId="876" type="0">
</Transition>
<Transition StartId="876" EndId="956" type="0">
</Transition>
<Transition StartId="877" EndId="882" type="0">
</Transition>
<Transition StartId="878" EndId="879" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="878" EndId="881" type="0">
</Transition>
<Transition StartId="879" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="956" type="0">
</Transition>
<Transition StartId="881" EndId="884" type="0">
</Transition>
<Transition StartId="882" EndId="883" type="0">
</Transition>
<Transition StartId="883" EndId="878" type="0">
</Transition>
<Transition StartId="884" EndId="958" type="0">
</Transition>
<Transition StartId="889" EndId="965" type="0">
</Transition>
<Transition StartId="896" EndId="977" type="0">
</Transition>
<Transition StartId="897" EndId="971" type="0">
</Transition>
<Transition StartId="904" EndId="905" type="0">
</Transition>
<Transition StartId="905" EndId="978" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="979" type="0">
</Transition>
<Transition StartId="908" EndId="912" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="909" EndId="981" type="0">
</Transition>
<Transition StartId="910" EndId="911" type="0">
</Transition>
<Transition StartId="911" EndId="979" type="0">
</Transition>
<Transition StartId="912" EndId="913" type="0">
</Transition>
<Transition StartId="913" EndId="909" type="0">
</Transition>
<Transition StartId="914" EndId="980" type="0">
</Transition>
<Transition StartId="915" EndId="919" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="916" EndId="922" type="0">
</Transition>
<Transition StartId="917" EndId="918" type="0">
</Transition>
<Transition StartId="918" EndId="980" type="0">
</Transition>
<Transition StartId="919" EndId="920" type="0">
</Transition>
<Transition StartId="920" EndId="916" type="0">
</Transition>
<Transition StartId="922" EndId="923" type="0">
</Transition>
<Transition StartId="923" EndId="924" type="0">
</Transition>
<Transition StartId="924" EndId="925" type="0">
</Transition>
<Transition StartId="925" EndId="982" type="0">
</Transition>
<Transition StartId="926" EndId="930" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="927" EndId="932" type="0">
</Transition>
<Transition StartId="928" EndId="929" type="0">
</Transition>
<Transition StartId="929" EndId="982" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="927" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="984" type="0">
</Transition>
<Transition StartId="934" EndId="938" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="935" EndId="940" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="984" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="935" type="0">
</Transition>
<Transition StartId="940" EndId="983" type="0">
</Transition>
<Transition StartId="941" EndId="945" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="942" EndId="947" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="983" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="942" type="0">
</Transition>
<Transition StartId="947" EndId="985" type="0">
</Transition>
<Transition StartId="948" EndId="952" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="949" EndId="954" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="985" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="0">
</Transition>
<Transition StartId="953" EndId="949" type="0">
</Transition>
<Transition StartId="954" EndId="986" type="0">
</Transition>
<Transition StartId="955" EndId="869" type="0">
</Transition>
<Transition StartId="956" EndId="877" type="0">
</Transition>
<Transition StartId="958" EndId="962" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="959" EndId="964" type="0">
</Transition>
<Transition StartId="960" EndId="963" type="0">
</Transition>
<Transition StartId="961" EndId="959" type="0">
</Transition>
<Transition StartId="962" EndId="961" type="0">
</Transition>
<Transition StartId="963" EndId="962" type="0">
</Transition>
<Transition StartId="964" EndId="889" type="0">
</Transition>
<Transition StartId="965" EndId="969" type="0">
</Transition>
<Transition StartId="966" EndId="967" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="966" EndId="896" type="0">
</Transition>
<Transition StartId="967" EndId="970" type="0">
</Transition>
<Transition StartId="968" EndId="966" type="0">
</Transition>
<Transition StartId="969" EndId="968" type="0">
</Transition>
<Transition StartId="970" EndId="969" type="0">
</Transition>
<Transition StartId="971" EndId="975" type="0">
</Transition>
<Transition StartId="972" EndId="973" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="972" EndId="904" type="0">
</Transition>
<Transition StartId="973" EndId="976" type="0">
</Transition>
<Transition StartId="974" EndId="972" type="0">
</Transition>
<Transition StartId="975" EndId="974" type="0">
</Transition>
<Transition StartId="976" EndId="975" type="0">
</Transition>
<Transition StartId="977" EndId="897" type="0">
</Transition>
<Transition StartId="978" EndId="906" type="0">
</Transition>
<Transition StartId="979" EndId="908" type="0">
</Transition>
<Transition StartId="980" EndId="915" type="0">
</Transition>
<Transition StartId="981" EndId="914" type="0">
</Transition>
<Transition StartId="982" EndId="926" type="0">
</Transition>
<Transition StartId="983" EndId="941" type="0">
</Transition>
<Transition StartId="984" EndId="934" type="0">
</Transition>
<Transition StartId="985" EndId="948" type="0">
</Transition>
<Transition StartId="986" EndId="987" type="0">
</Transition>
<Transition StartId="987" EndId="991" type="0">
</Transition>
<Transition StartId="988" EndId="989" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="989" EndId="992" type="0">
</Transition>
<Transition StartId="990" EndId="988" type="0">
</Transition>
<Transition StartId="991" EndId="990" type="0">
</Transition>
<Transition StartId="992" EndId="991" type="0">
</Transition>
<Transition StartId="993" EndId="1204" type="0">
</Transition>
<Transition StartId="1199" EndId="993" type="0">
</Transition>
<Transition StartId="1200" EndId="1201" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="1200" EndId="1203" type="0">
</Transition>
<Transition StartId="1201" EndId="1203" type="0">
</Transition>
<Transition StartId="1202" EndId="1205" type="0">
</Transition>
<Transition StartId="1203" EndId="1202" type="0">
</Transition>
<Transition StartId="1204" EndId="1200" type="0">
</Transition>
<Transition StartId="1205" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

