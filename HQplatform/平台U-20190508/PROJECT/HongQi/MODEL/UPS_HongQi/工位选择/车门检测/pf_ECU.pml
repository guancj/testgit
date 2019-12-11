<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3019" pbltext="DEP113">
<Parameters>
<Variable id="DString_C131_Partnumber_PDCU" type="8" dir="0" data="DString_C131_Partnumber_PDCU"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75A" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77A" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="530" top="4" right="630" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="700" top="3494" right="800" bottom="3526"/>
<Script>engine.registerPacket(1,4000,0x7DF,"",0);
if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
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
<assessment no="12" name="DEP1119" type="8" flags="97"/>
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
<assessment no="11" name="DEP115" type="8" flags="97"/>
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
<assessment no="12" name="DEP1119" type="8" flags="97"/>
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
<Rect left="370" top="584" right="470" bottom="616"/>
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
<Rect left="370" top="644" right="470" bottom="676"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="12" name="DEP1119" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="重试？">
<Rect left="190" top="704" right="290" bottom="736"/>
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
<assessment no="2" name="DEP114" type="5" flags="97"/>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="704" right="470" bottom="736"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="370" top="764" right="470" bottom="796"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="824" right="620" bottom="856"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_PDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_PDCU);
len = string.len(DString_C131_Partnumber_PDCU)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_PDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PDCU);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_PDCU;
	
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
	
		if (DString1==DString_C131_Partnumber_PDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PDCU);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_PDCU;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="15" name="DEP621" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="读硬件号">
<Rect left="820" top="824" right="920" bottom="856"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="1" name="DEP622" type="8" flags="97"/>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="延时700MS">
<Rect left="820" top="884" right="920" bottom="916"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="203" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="670" top="884" right="770" bottom="916"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="3" name="DEP623" type="8" flags="97"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="884" right="620" bottom="916"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="读软件号">
<Rect left="370" top="884" right="470" bottom="916"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="4" name="DEP624" type="8" flags="97"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="延时300MS">
<Rect left="370" top="944" right="470" bottom="976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="520" top="944" right="620" bottom="976"/>
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
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM42")then
		StandValue="3.00"; 
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
		StandValue="1.00"; 
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
        elseif(DString_C131_Car_Tpye == "CMNA02A" )then
		StandValue="3.00"; 
        elseif(( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CH1QM30" ) or ( DString_C131_Car_Tpye == "CH1QM40" ) or ( DString_C131_Car_Tpye == "CH1QM50" )or ( DString_C131_Car_Tpye == "CNDA01A" )or ( DString_C131_Car_Tpye == "CH1PM30" )or ( DString_C131_Car_Tpye == "CH1PM20" ))then
		StandValue="1.00"; 
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


                                                          


</Script><assessment no="5" name="DEP629" type="8" flags="97"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="1004" right="620" bottom="1036"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="Door_Light_On">
<Rect left="370" top="1004" right="470" bottom="1036"/>
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
<Rect left="370" top="1064" right="470" bottom="1096"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="706" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="370" top="1124" right="470" bottom="1156"/>
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
<Rect left="370" top="1184" right="470" bottom="1216"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="708" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="1304" right="470" bottom="1336"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="709" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1304" right="316" bottom="1336"/>
</Activity>
<Activity id="710" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1124" right="316" bottom="1156"/>
</Activity>
<Activity id="711" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="370" top="1364" right="470" bottom="1396"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="712" ActivityType="3" flags="0" name="init">
<Rect left="370" top="1424" right="470" bottom="1456"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="713" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="370" top="1484" right="470" bottom="1516"/>
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
<Rect left="370" top="1664" right="470" bottom="1696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="715" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1664" right="316" bottom="1696"/>
</Activity>
<Activity id="716" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1484" right="316" bottom="1516"/>
</Activity>
<Activity id="721" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="1244" right="470" bottom="1276"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="41" name="DEP776" type="8" flags="97"/>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="截取字符串">
<Rect left="370" top="1544" right="470" bottom="1576"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="723" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="1604" right="470" bottom="1636"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="42" name="DEP777" type="8" flags="97"/>
</Activity>
<Activity id="744" ActivityType="3" flags="0" name="Mirror_fold_automaticlly">
<Rect left="790" top="1014" right="890" bottom="1046"/>
<Line1Text Enable="1" Text="请确认外后视镜是打开状态"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="745" ActivityType="13" flags="0" name="后视镜折叠指令">
<Rect left="790" top="1134" right="890" bottom="1166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜折叠"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0D\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="48" name="DEP2492" type="8" flags="97"/>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="延时3000MS">
<Rect left="790" top="1184" right="890" bottom="1216"/>
<Line2Text Enable="1" Text="乘客门倒车镜折叠中"/>
<Line3Text Enable="1" Text="请等待3秒"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="748" ActivityType="3" flags="0" name="init">
<Rect left="790" top="1244" right="890" bottom="1276"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="749" ActivityType="13" flags="0" name="Read_status">
<Rect left="790" top="1304" right="890" bottom="1336"/>
<Line2Text Enable="1" Text="获取乘客门倒车镜折叠状态"/>
<Line3Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="750" ActivityType="3" flags="0" name="endloop">
<Rect left="790" top="1484" right="890" bottom="1516"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="751" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1484" right="1016" bottom="1516"/>
</Activity>
<Activity id="752" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1304" right="1016" bottom="1336"/>
</Activity>
<Activity id="753" ActivityType="3" flags="0" name="截取字符串">
<Rect left="790" top="1364" right="890" bottom="1396"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="754" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="790" top="1424" right="890" bottom="1456"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????1&quot;"/>
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
<assessment no="50" name="DEP1964" type="8" flags="97"/>
</Activity>
<Activity id="755" ActivityType="13" flags="0" name="Open_automaticlly">
<Rect left="790" top="1544" right="890" bottom="1576"/>
<Line3Text Enable="1" Text="乘客门倒车镜展开"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0D\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="49" name="DEP2495" type="8" flags="97"/>
</Activity>
<Activity id="756" ActivityType="3" flags="0" name="延时3000MS">
<Rect left="790" top="1604" right="890" bottom="1636"/>
<Line4Text Enable="1" Text="请等待3秒"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="757" ActivityType="3" flags="0" name="init">
<Rect left="790" top="1724" right="890" bottom="1756"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="758" ActivityType="13" flags="0" name="Read_status">
<Rect left="790" top="1784" right="890" bottom="1816"/>
<Line3Text Enable="1" Text="获取乘客门倒车镜展开状态"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="759" ActivityType="3" flags="0" name="endloop">
<Rect left="790" top="1964" right="890" bottom="1996"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="760" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1964" right="976" bottom="1996"/>
</Activity>
<Activity id="761" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1784" right="976" bottom="1816"/>
</Activity>
<Activity id="762" ActivityType="3" flags="0" name="截取字符串">
<Rect left="790" top="1844" right="890" bottom="1876"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="763" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="790" top="1904" right="890" bottom="1936"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????0&quot;"/>
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
<assessment no="51" name="DEP1965" type="8" flags="97"/>
</Activity>
<Activity id="764" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="704" right="136" bottom="736"/>
</Activity>
<Activity id="765" ActivityType="3" flags="0" name="乘客门倒车镜X轴增加">
<Rect left="370" top="2024" right="470" bottom="2056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴增加"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="767" ActivityType="13" flags="0" name="X_Axis_increase_adjust">
<Rect left="370" top="2084" right="470" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="769" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="370" top="2384" right="470" bottom="2416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="770" ActivityType="3" flags="0" name="乘客门倒车镜X轴减少">
<Rect left="640" top="2024" right="740" bottom="2056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="771" ActivityType="13" flags="0" name="X_Axis_decrease_adjust">
<Rect left="640" top="2084" right="740" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="774" ActivityType="3" flags="0" name="乘客门倒车镜Y轴增加">
<Rect left="880" top="2024" right="980" bottom="2056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="775" ActivityType="13" flags="0" name="Y_Axis_increase_adjust">
<Rect left="880" top="2084" right="980" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="778" ActivityType="3" flags="0" name="乘客门倒车镜Y轴减少">
<Rect left="1120" top="2024" right="1220" bottom="2056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="779" ActivityType="13" flags="0" name="Y_Axis_decrease_adjust">
<Rect left="1120" top="2084" right="1220" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="782" ActivityType="3" flags="0" name="乘客门倒车镜开始加热">
<Rect left="1330" top="2024" right="1430" bottom="2056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜开始加热"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="783" ActivityType="13" flags="0" name="Heating_Start">
<Rect left="1330" top="2084" right="1430" bottom="2116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0E\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="786" ActivityType="13" flags="0" name="Heating_ReturnControlToECU">
<Rect left="1330" top="2444" right="1430" bottom="2476"/>
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
<Rect left="370" top="2804" right="470" bottom="2836"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="乘客门转向灯开启"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script><assessment no="60" name="DEP2493" type="8" flags="97"/>
</Activity>
<Activity id="790" ActivityType="13" flags="0" name="Turn_light_on">
<Rect left="370" top="2864" right="470" bottom="2896"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0A\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="792" ActivityType="13" flags="0" name="Turn_light_off">
<Rect left="370" top="3164" right="470" bottom="3196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0A\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP775" type="8" flags="97"/>
</Activity>
<Activity id="794" ActivityType="3" flags="0" name="Check_the_door_lock">
<Rect left="640" top="2504" right="740" bottom="2536"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="乘客门自动上锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="795" ActivityType="13" flags="0" name="Lock_Door">
<Rect left="640" top="2564" right="740" bottom="2596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x08\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="796" ActivityType="3" flags="0" name="init">
<Rect left="640" top="2624" right="740" bottom="2656"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="797" ActivityType="13" flags="0" name="Read_status">
<Rect left="640" top="2684" right="740" bottom="2716"/>
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
<Rect left="640" top="2864" right="740" bottom="2896"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="799" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="2864" right="616" bottom="2896"/>
</Activity>
<Activity id="800" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="2684" right="616" bottom="2716"/>
</Activity>
<Activity id="801" ActivityType="3" flags="0" name="截取字符串">
<Rect left="640" top="2744" right="740" bottom="2776"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="802" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="640" top="2804" right="740" bottom="2836"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="37" name="DEP1968" type="8" flags="97"/>
</Activity>
<Activity id="803" ActivityType="3" flags="0" name="Check_the_door_Unlock">
<Rect left="640" top="2924" right="740" bottom="2956"/>
<Line2Text Enable="1" Text="乘客们自动解锁"/>
<Line3Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="804" ActivityType="13" flags="0" name="Unlock_Door">
<Rect left="640" top="2984" right="740" bottom="3016"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x08\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="805" ActivityType="3" flags="0" name="init">
<Rect left="640" top="3044" right="740" bottom="3076"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="806" ActivityType="13" flags="0" name="Read_status">
<Rect left="640" top="3104" right="740" bottom="3136"/>
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
<Activity id="807" ActivityType="3" flags="1" name="endloop">
<Rect left="640" top="3284" right="740" bottom="3316"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="808" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="3284" right="616" bottom="3316"/>
</Activity>
<Activity id="809" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="3104" right="616" bottom="3136"/>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="截取字符串">
<Rect left="640" top="3164" right="740" bottom="3196"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="811" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="640" top="3224" right="740" bottom="3256"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="38" name="DEP1969" type="8" flags="97"/>
</Activity>
<Activity id="812" ActivityType="13" flags="0" name="Door_lock_ReturnControlToECU">
<Rect left="640" top="3344" right="740" bottom="3376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x08\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="813" ActivityType="3" flags="0" name="Check_the_door_window">
<Rect left="940" top="2504" right="1040" bottom="2536"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="乘客门玻璃自动下降"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="814" ActivityType="3" flags="0" name="延时300MS">
<Rect left="790" top="3344" right="890" bottom="3376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="815" ActivityType="13" flags="0" name="Window_down">
<Rect left="940" top="2564" right="1040" bottom="2596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x09\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="817" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="940" top="2864" right="1040" bottom="2896"/>
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
<Rect left="940" top="2924" right="1040" bottom="2956"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="乘客门玻璃自动上升"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x09\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="822" ActivityType="13" flags="0" name="Window_ReturnControlToECU">
<Rect left="940" top="3344" right="1040" bottom="3376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x09\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="823" ActivityType="3" flags="0" name="清除界面">
<Rect left="1060" top="3344" right="1160" bottom="3376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="824" ActivityType="3" flags="0" name="Windows_Switch_Check">
<Rect left="1210" top="2504" right="1310" bottom="2536"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="825" ActivityType="3" flags="0" name="init">
<Rect left="1210" top="2564" right="1310" bottom="2596"/>
<Line2Text Enable="1" Text="副司机门玻璃降 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="826" ActivityType="13" flags="0" name="Read_status">
<Rect left="1210" top="2624" right="1310" bottom="2656"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x30&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="827" ActivityType="3" flags="0" name="endloop">
<Rect left="1210" top="2804" right="1310" bottom="2836"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="828" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="2804" right="1186" bottom="2836"/>
</Activity>
<Activity id="829" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="2624" right="1186" bottom="2656"/>
</Activity>
<Activity id="830" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1210" top="2684" right="1310" bottom="2716"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="831" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1210" top="2744" right="1310" bottom="2776"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP2035" type="8" flags="97"/>
</Activity>
<Activity id="833" ActivityType="3" flags="0" name="副司机门玻璃降 Level 2">
<Rect left="1210" top="2864" right="1310" bottom="2896"/>
<Line2Text Enable="1" Text="副司机门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="834" ActivityType="13" flags="0" name="Read_status">
<Rect left="1210" top="2924" right="1310" bottom="2956"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x30&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="835" ActivityType="3" flags="0" name="endloop">
<Rect left="1210" top="3104" right="1310" bottom="3136"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="836" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="3104" right="1186" bottom="3136"/>
</Activity>
<Activity id="837" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="2924" right="1186" bottom="2956"/>
</Activity>
<Activity id="838" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1210" top="2984" right="1310" bottom="3016"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="839" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1210" top="3044" right="1310" bottom="3076"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="33" name="DEP2036" type="8" flags="97"/>
</Activity>
<Activity id="840" ActivityType="3" flags="0" name="副司机门玻璃升 Level 1">
<Rect left="1210" top="3164" right="1310" bottom="3196"/>
<Line2Text Enable="1" Text="副司机门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="841" ActivityType="13" flags="0" name="Read_status">
<Rect left="1210" top="3224" right="1310" bottom="3256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x30&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="842" ActivityType="3" flags="0" name="endloop">
<Rect left="1210" top="3404" right="1310" bottom="3436"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="843" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="3404" right="1186" bottom="3436"/>
</Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="3224" right="1186" bottom="3256"/>
</Activity>
<Activity id="845" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1210" top="3284" right="1310" bottom="3316"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="846" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1210" top="3344" right="1310" bottom="3376"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="34" name="DEP2033" type="8" flags="97"/>
</Activity>
<Activity id="847" ActivityType="3" flags="0" name="副司机门玻璃升 Level 2（升到顶）">
<Rect left="1420" top="2504" right="1520" bottom="2536"/>
<Line2Text Enable="1" Text="副司机门玻璃升 Level 2（升到顶）"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="848" ActivityType="13" flags="0" name="Read_status">
<Rect left="1420" top="2564" right="1520" bottom="2596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x30&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="849" ActivityType="3" flags="0" name="endloop">
<Rect left="1420" top="2744" right="1520" bottom="2776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="850" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="2744" right="1396" bottom="2776"/>
</Activity>
<Activity id="851" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="2564" right="1396" bottom="2596"/>
</Activity>
<Activity id="852" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1420" top="2624" right="1520" bottom="2656"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="853" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1420" top="2684" right="1520" bottom="2716"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP2034" type="8" flags="97"/>
</Activity>
<Activity id="855" ActivityType="3" flags="0" name="手动开启门锁">
<Rect left="1420" top="2804" right="1520" bottom="2836"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="856" ActivityType="3" flags="0" name="延时700MS">
<Rect left="670" top="824" right="770" bottom="856"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="859" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="370" top="1724" right="470" bottom="1756"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="门灯电压检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="860" ActivityType="3" flags="0" name="init">
<Rect left="370" top="1784" right="470" bottom="1816"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="1964" right="470" bottom="1996"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="862" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1964" right="316" bottom="1996"/>
</Activity>
<Activity id="863" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="370" top="1904" right="470" bottom="1936"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="20000"/>
<Parameter id="LowerLimit" value="0"/>
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
<assessment no="43" name="DEP1963" type="8" flags="97"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="1844" right="470" bottom="1876"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i);
--DFloat_Mts3Result =tostring(DFloat_Mts3Result )
--DFloat_Mts3Result = math.abs(engine.df_door_i)</Script></Activity>
<Activity id="865" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1844" right="316" bottom="1876"/>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="init">
<Rect left="370" top="2144" right="470" bottom="2176"/>
<Script>Pram_1=nil;</Script></Activity>
<Activity id="871" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="2324" right="470" bottom="2356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="872" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2324" right="316" bottom="2356"/>
</Activity>
<Activity id="874" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="2204" right="470" bottom="2236"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i)
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )
engine.println("DFloat_Mts3Result"..tostring(DFloat_Mts3Result))
--DFloat_Mts3Result = math.abs(engine.df_door_i )</Script></Activity>
<Activity id="875" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2204" right="316" bottom="2236"/>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="init">
<Rect left="640" top="2144" right="740" bottom="2176"/>
<Script>Pram_1=nil
</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="endloop">
<Rect left="640" top="2324" right="740" bottom="2356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="882" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="2324" right="616" bottom="2356"/>
</Activity>
<Activity id="883" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="640" top="2264" right="740" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="52" name="DEP769" type="8" flags="97"/>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="初始化">
<Rect left="640" top="2204" right="740" bottom="2236"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )
engine.println("DFloat_Mts3Result"..tostring(DFloat_Mts3Result))
--DFloat_Mts3Result = math.abs(engine.df_door_i )</Script></Activity>
<Activity id="885" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="2204" right="616" bottom="2236"/>
</Activity>
<Activity id="886" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="640" top="2384" right="740" bottom="2416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="887" ActivityType="3" flags="0" name="init">
<Rect left="880" top="2144" right="980" bottom="2176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="888" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="2324" right="980" bottom="2356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="2324" right="856" bottom="2356"/>
</Activity>
<Activity id="890" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="880" top="2264" right="980" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
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
<assessment no="53" name="DEP770" type="8" flags="97"/>
</Activity>
<Activity id="891" ActivityType="3" flags="0" name="初始化">
<Rect left="880" top="2204" right="980" bottom="2236"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )
engine.println("DFloat_Mts3Result"..tostring(DFloat_Mts3Result))
--DFloat_Mts3Result = math.abs(engine.df_door_i )</Script></Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="2204" right="856" bottom="2236"/>
</Activity>
<Activity id="893" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="880" top="2384" right="980" bottom="2416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="init">
<Rect left="1120" top="2144" right="1220" bottom="2176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="895" ActivityType="3" flags="0" name="endloop">
<Rect left="1120" top="2324" right="1220" bottom="2356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="896" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="2324" right="1096" bottom="2356"/>
</Activity>
<Activity id="897" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1120" top="2264" right="1220" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
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
<assessment no="54" name="DEP771" type="8" flags="97"/>
</Activity>
<Activity id="898" ActivityType="3" flags="0" name="初始化">
<Rect left="1120" top="2204" right="1220" bottom="2236"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )
engine.println("DFloat_Mts3Result"..tostring(DFloat_Mts3Result))
--DFloat_Mts3Result = math.abs(engine.df_door_i)</Script></Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="2204" right="1096" bottom="2236"/>
</Activity>
<Activity id="900" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="1120" top="2384" right="1220" bottom="2416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0C\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="init">
<Rect left="1330" top="2144" right="1430" bottom="2176"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="902" ActivityType="3" flags="0" name="endloop">
<Rect left="1330" top="2324" right="1430" bottom="2356"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="903" ActivityType="4" flags="0" name="路由节点">
<Rect left="1484" top="2324" right="1516" bottom="2356"/>
</Activity>
<Activity id="904" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1330" top="2264" right="1430" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="3500"/>
<Parameter id="LowerLimit" value="900"/>
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
<assessment no="55" name="DEP772" type="8" flags="97"/>
</Activity>
<Activity id="905" ActivityType="3" flags="0" name="初始化">
<Rect left="1330" top="2204" right="1430" bottom="2236"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result )
engine.println("DFloat_Mts3Result"..tostring(DFloat_Mts3Result))
--DFloat_Mts3Result = math.abs(engine.df_door_i )</Script></Activity>
<Activity id="906" ActivityType="4" flags="0" name="路由节点">
<Rect left="1484" top="2204" right="1516" bottom="2236"/>
</Activity>
<Activity id="907" ActivityType="13" flags="0" name="Heating_Stop">
<Rect left="1330" top="2384" right="1430" bottom="2416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0E\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="56" name="DEP773" type="8" flags="97"/>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="370" top="2504" right="470" bottom="2536"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="909" ActivityType="3" flags="0" name="init">
<Rect left="370" top="2564" right="470" bottom="2596"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="910" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="2744" right="470" bottom="2776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="911" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2744" right="316" bottom="2776"/>
</Activity>
<Activity id="912" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="370" top="2684" right="470" bottom="2716"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="20000"/>
<Parameter id="LowerLimit" value="0"/>
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
<assessment no="43" name="DEP1963" type="8" flags="97"/>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="2624" right="470" bottom="2656"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i);
--DFloat_Mts3Result =tostring(DFloat_Mts3Result )
--DFloat_Mts3Result = math.abs(engine.df_door_i)</Script></Activity>
<Activity id="914" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2624" right="316" bottom="2656"/>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="init">
<Rect left="370" top="2924" right="470" bottom="2956"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  500</Script></Activity>
<Activity id="916" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="3104" right="470" bottom="3136"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="3104" right="316" bottom="3136"/>
</Activity>
<Activity id="918" ActivityType="13" flags="1" name="Tolerance_view_Float_A">
<Rect left="370" top="3044" right="470" bottom="3076"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="190"/>
<Parameter id="LowerLimit" value="100"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP774" type="8" flags="97"/>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="2984" right="470" bottom="3016"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i);
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)
--DFloat_Mts3Result = math.abs(engine.df_door_i )</Script></Activity>
<Activity id="920" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2984" right="316" bottom="3016"/>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="init">
<Rect left="940" top="2624" right="1040" bottom="2656"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  1500</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="endloop">
<Rect left="940" top="2804" right="1040" bottom="2836"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="929" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="2804" right="916" bottom="2836"/>
</Activity>
<Activity id="930" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="940" top="2744" right="1040" bottom="2776"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="44" name="DEP778" type="8" flags="97"/>
</Activity>
<Activity id="931" ActivityType="3" flags="0" name="初始化">
<Rect left="940" top="2684" right="1040" bottom="2716"/>
<Script>DFloat_Mts3Result = math.abs(engine.pf_door_i )  /1000;
--DFloat_Mts3Result =tostring(DFloat_Mts3Result )
--DFloat_Mts3Result = math.abs(engine.df_door_i )/1000</Script></Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="2684" right="916" bottom="2716"/>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="init">
<Rect left="940" top="2984" right="1040" bottom="3016"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  2000</Script></Activity>
<Activity id="936" ActivityType="3" flags="0" name="endloop">
<Rect left="940" top="3164" right="1040" bottom="3196"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="3164" right="916" bottom="3196"/>
</Activity>
<Activity id="938" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="940" top="3104" right="1040" bottom="3136"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30"/>
<Parameter id="LowerLimit" value="1"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="8"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="45" name="DEP779" type="8" flags="97"/>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="初始化">
<Rect left="940" top="3044" right="1040" bottom="3076"/>
<Script>DFloat_Mts3Result = math.abs(engine.pf_door_i ) /1000;
--DFloat_Mts3Result =tostring(DFloat_Mts3Result )
--DFloat_Mts3Result = math.abs(engine.df_door_i )/1000</Script></Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="3044" right="916" bottom="3076"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="init">
<Rect left="1420" top="2864" right="1520" bottom="2896"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="946" ActivityType="3" flags="0" name="endloop">
<Rect left="1420" top="3044" right="1520" bottom="3076"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="947" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="3044" right="1396" bottom="3076"/>
</Activity>
<Activity id="948" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1420" top="2984" right="1520" bottom="3016"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="200"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="46" name="DEP2032" type="8" flags="97"/>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="初始化">
<Rect left="1420" top="2924" right="1520" bottom="2956"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i );
--DFloat_Mts3Result =tostring(DFloat_Mts3Result )</Script></Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="2924" right="1396" bottom="2956"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="3404" right="1486" bottom="3436"/>
</Activity>
<Activity id="1193" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="1420" top="3494" right="1520" bottom="3526"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00,U2452-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1194" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="1120" top="3494" right="1220" bottom="3526"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="47" name="DEP116" type="8" flags="97"/>
</Activity>
<Activity id="1195" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="1270" top="3494" right="1370" bottom="3526"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2206-00,U2207-00,U2208-00,U0141-00,U1008-00,U0199-00,U0208-00,U0146-00,U0002-00,U2251-00,U2252-00,U2258-00,B11FE-00,B120B-00,U0209-00,B1207-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1196" ActivityType="3" flags="0" name="读DTC">
<Rect left="1420" top="3284" right="1520" bottom="3316"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes); </Script><assessment no="47" name="DEP116" type="8" flags="97"/>
</Activity>
<Activity id="1198" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="1420" top="3164" right="1520" bottom="3196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Activity id="1199" ActivityType="3" flags="0" name="维持信号">
<Rect left="370" top="824" right="470" bottom="856"/>
<Script>engine.registerPacket(0,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1201" ActivityType="3" flags="0" name="延时300MS">
<Rect left="940" top="3284" right="1040" bottom="3316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1202" ActivityType="3" flags="0" name="将玻璃上升">
<Rect left="990" top="3454" right="1090" bottom="3486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=请将右前门玻璃升到顶".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="1203" ActivityType="3" flags="0" name="状态判断">
<Rect left="840" top="3454" right="940" bottom="3486"/>
<Script>if(engine.LButtonPressed) then 
engine.LastError = 1;
engine.StatValue = "右前门玻璃未上升到顶部"
end
if(engine.RButtonPressed) then
engine.LastError = 0;
engine.StatValue =""
end</Script></Activity>
<Activity id="1205" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="2384" right="556" bottom="2416"/>
</Activity>
<Activity id="1206" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="2024" right="556" bottom="2056"/>
</Activity>
<Activity id="1207" ActivityType="4" flags="0" name="路由节点">
<Rect left="794" top="2384" right="826" bottom="2416"/>
</Activity>
<Activity id="1208" ActivityType="4" flags="0" name="路由节点">
<Rect left="794" top="2024" right="826" bottom="2056"/>
</Activity>
<Activity id="1209" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="2384" right="1066" bottom="2416"/>
</Activity>
<Activity id="1210" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="2024" right="1066" bottom="2056"/>
</Activity>
<Activity id="1211" ActivityType="4" flags="0" name="路由节点">
<Rect left="1244" top="2384" right="1276" bottom="2416"/>
</Activity>
<Activity id="1212" ActivityType="4" flags="0" name="路由节点">
<Rect left="1244" top="2024" right="1276" bottom="2056"/>
</Activity>
<Activity id="1213" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="2444" right="436" bottom="2476"/>
</Activity>
<Activity id="1214" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="3164" right="556" bottom="3196"/>
</Activity>
<Activity id="1215" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="2504" right="556" bottom="2536"/>
</Activity>
<Activity id="1216" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="2504" right="856" bottom="2536"/>
</Activity>
<Activity id="1217" ActivityType="4" flags="0" name="路由节点">
<Rect left="1094" top="2504" right="1126" bottom="2536"/>
</Activity>
<Activity id="1218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="2504" right="1366" bottom="2536"/>
</Activity>
<Activity id="1219" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="3404" right="1366" bottom="3436"/>
</Activity>
<Activity id="1220" ActivityType="13" flags="0" name="Tolerance_view_Float_B">
<Rect left="370" top="2264" right="470" bottom="2296"/>
<FunctionRef id="Tolerance_view_Float_B" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="57" name="DEP768" type="8" flags="97"/>
</Activity>
<Activity id="1221" ActivityType="13" flags="0" name="转向灯亮指令">
<Rect left="790" top="1074" right="890" bottom="1106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="转向灯亮"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0A\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1222" ActivityType="13" flags="0" name="Turn_light_off">
<Rect left="790" top="1664" right="890" bottom="1696"/>
<Line3Text Enable="1" Text="转向灯关闭指令"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0A\x03\x00&apos;"/>
<Parameter id="recvTel"/>
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
<Transition StartId="7" EndId="8" type="0">
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
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="17" EndId="764" type="5">
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
<Transition StartId="25" EndId="1199" type="0">
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
<Transition StartId="705" EndId="706" type="0">
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
<Transition StartId="710" EndId="706" type="0">
</Transition>
<Transition StartId="711" EndId="712" type="0">
</Transition>
<Transition StartId="712" EndId="713" type="0">
</Transition>
<Transition StartId="713" EndId="722" type="0">
</Transition>
<Transition StartId="714" EndId="715" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="714" EndId="859" type="0">
</Transition>
<Transition StartId="715" EndId="716" type="0">
</Transition>
<Transition StartId="716" EndId="713" type="0">
</Transition>
<Transition StartId="721" EndId="708" type="0">
</Transition>
<Transition StartId="722" EndId="723" type="0">
</Transition>
<Transition StartId="723" EndId="714" type="0">
</Transition>
<Transition StartId="744" EndId="1221" type="0">
</Transition>
<Transition StartId="745" EndId="747" type="0">
</Transition>
<Transition StartId="747" EndId="748" type="0">
</Transition>
<Transition StartId="748" EndId="749" type="0">
</Transition>
<Transition StartId="749" EndId="753" type="0">
</Transition>
<Transition StartId="750" EndId="751" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="750" EndId="755" type="0">
</Transition>
<Transition StartId="751" EndId="752" type="0">
</Transition>
<Transition StartId="752" EndId="749" type="0">
</Transition>
<Transition StartId="753" EndId="754" type="0">
</Transition>
<Transition StartId="754" EndId="750" type="0">
</Transition>
<Transition StartId="755" EndId="756" type="0">
</Transition>
<Transition StartId="756" EndId="1222" type="0">
</Transition>
<Transition StartId="757" EndId="758" type="0">
</Transition>
<Transition StartId="758" EndId="762" type="0">
</Transition>
<Transition StartId="759" EndId="760" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="759" EndId="765" type="0">
</Transition>
<Transition StartId="760" EndId="761" type="0">
</Transition>
<Transition StartId="761" EndId="758" type="0">
</Transition>
<Transition StartId="762" EndId="763" type="0">
</Transition>
<Transition StartId="763" EndId="759" type="0">
</Transition>
<Transition StartId="765" EndId="767" type="0">
</Transition>
<Transition StartId="767" EndId="870" type="0">
</Transition>
<Transition StartId="769" EndId="1205" type="0">
</Transition>
<Transition StartId="770" EndId="771" type="0">
</Transition>
<Transition StartId="771" EndId="880" type="0">
</Transition>
<Transition StartId="774" EndId="775" type="0">
</Transition>
<Transition StartId="775" EndId="887" type="0">
</Transition>
<Transition StartId="778" EndId="779" type="0">
</Transition>
<Transition StartId="779" EndId="894" type="0">
</Transition>
<Transition StartId="782" EndId="783" type="0">
</Transition>
<Transition StartId="783" EndId="901" type="0">
</Transition>
<Transition StartId="786" EndId="1213" type="0">
</Transition>
<Transition StartId="789" EndId="790" type="0">
</Transition>
<Transition StartId="790" EndId="915" type="0">
</Transition>
<Transition StartId="792" EndId="1214" type="0">
</Transition>
<Transition StartId="794" EndId="795" type="0">
</Transition>
<Transition StartId="795" EndId="796" type="0">
</Transition>
<Transition StartId="796" EndId="797" type="0">
</Transition>
<Transition StartId="797" EndId="801" type="0">
</Transition>
<Transition StartId="798" EndId="799" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="798" EndId="803" type="0">
</Transition>
<Transition StartId="799" EndId="800" type="0">
</Transition>
<Transition StartId="800" EndId="797" type="0">
</Transition>
<Transition StartId="801" EndId="802" type="0">
</Transition>
<Transition StartId="802" EndId="798" type="0">
</Transition>
<Transition StartId="803" EndId="804" type="0">
</Transition>
<Transition StartId="804" EndId="805" type="0">
</Transition>
<Transition StartId="805" EndId="806" type="0">
</Transition>
<Transition StartId="806" EndId="810" type="0">
</Transition>
<Transition StartId="807" EndId="808" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="807" EndId="812" type="0">
</Transition>
<Transition StartId="808" EndId="809" type="0">
</Transition>
<Transition StartId="809" EndId="806" type="0">
</Transition>
<Transition StartId="810" EndId="811" type="0">
</Transition>
<Transition StartId="811" EndId="807" type="0">
</Transition>
<Transition StartId="812" EndId="814" type="0">
</Transition>
<Transition StartId="813" EndId="815" type="0">
</Transition>
<Transition StartId="814" EndId="1216" type="0">
</Transition>
<Transition StartId="815" EndId="927" type="0">
</Transition>
<Transition StartId="817" EndId="819" type="0">
</Transition>
<Transition StartId="819" EndId="935" type="0">
</Transition>
<Transition StartId="822" EndId="823" type="0">
</Transition>
<Transition StartId="823" EndId="1217" type="0">
</Transition>
<Transition StartId="824" EndId="825" type="0">
</Transition>
<Transition StartId="825" EndId="826" type="0">
</Transition>
<Transition StartId="826" EndId="830" type="0">
</Transition>
<Transition StartId="827" EndId="828" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="827" EndId="833" type="0">
</Transition>
<Transition StartId="828" EndId="829" type="0">
</Transition>
<Transition StartId="829" EndId="826" type="0">
</Transition>
<Transition StartId="830" EndId="831" type="0">
</Transition>
<Transition StartId="831" EndId="827" type="0">
</Transition>
<Transition StartId="833" EndId="834" type="0">
</Transition>
<Transition StartId="834" EndId="838" type="0">
</Transition>
<Transition StartId="835" EndId="836" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="835" EndId="840" type="0">
</Transition>
<Transition StartId="836" EndId="837" type="0">
</Transition>
<Transition StartId="837" EndId="834" type="0">
</Transition>
<Transition StartId="838" EndId="839" type="0">
</Transition>
<Transition StartId="839" EndId="835" type="0">
</Transition>
<Transition StartId="840" EndId="841" type="0">
</Transition>
<Transition StartId="841" EndId="845" type="0">
</Transition>
<Transition StartId="842" EndId="843" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="842" EndId="1219" type="0">
</Transition>
<Transition StartId="843" EndId="844" type="0">
</Transition>
<Transition StartId="844" EndId="841" type="0">
</Transition>
<Transition StartId="845" EndId="846" type="0">
</Transition>
<Transition StartId="846" EndId="842" type="0">
</Transition>
<Transition StartId="847" EndId="848" type="0">
</Transition>
<Transition StartId="848" EndId="852" type="0">
</Transition>
<Transition StartId="849" EndId="850" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="849" EndId="855" type="0">
</Transition>
<Transition StartId="850" EndId="851" type="0">
</Transition>
<Transition StartId="851" EndId="848" type="0">
</Transition>
<Transition StartId="852" EndId="853" type="0">
</Transition>
<Transition StartId="853" EndId="849" type="0">
</Transition>
<Transition StartId="855" EndId="945" type="0">
</Transition>
<Transition StartId="856" EndId="28" type="0">
</Transition>
<Transition StartId="859" EndId="860" type="0">
</Transition>
<Transition StartId="860" EndId="864" type="0">
</Transition>
<Transition StartId="861" EndId="862" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="861" EndId="765" type="0">
</Transition>
<Transition StartId="861" EndId="744" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42" and DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM11" and DString_C131_Car_Tpye ~= "CMNA02A"</Expression></Transition>
<Transition StartId="862" EndId="865" type="0">
</Transition>
<Transition StartId="863" EndId="861" type="0">
</Transition>
<Transition StartId="864" EndId="863" type="0">
</Transition>
<Transition StartId="865" EndId="864" type="0">
</Transition>
<Transition StartId="870" EndId="874" type="0">
</Transition>
<Transition StartId="871" EndId="872" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="871" EndId="769" type="0">
</Transition>
<Transition StartId="872" EndId="875" type="0">
</Transition>
<Transition StartId="874" EndId="1220" type="0">
</Transition>
<Transition StartId="875" EndId="874" type="0">
</Transition>
<Transition StartId="880" EndId="884" type="0">
</Transition>
<Transition StartId="881" EndId="882" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="886" EndId="1207" type="0">
</Transition>
<Transition StartId="887" EndId="891" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="893" EndId="1209" type="0">
</Transition>
<Transition StartId="894" EndId="898" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="900" EndId="1211" type="0">
</Transition>
<Transition StartId="901" EndId="905" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="935" EndId="939" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="936" EndId="1201" type="0">
</Transition>
<Transition StartId="937" EndId="940" type="0">
</Transition>
<Transition StartId="938" EndId="936" type="0">
</Transition>
<Transition StartId="939" EndId="938" type="0">
</Transition>
<Transition StartId="940" EndId="939" type="0">
</Transition>
<Transition StartId="945" EndId="949" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="1194" EndId="2" type="0">
</Transition>
<Transition StartId="1195" EndId="1194" type="0">
</Transition>
<Transition StartId="1196" EndId="951" type="0">
</Transition>
<Transition StartId="1198" EndId="1196" type="0">
</Transition>
<Transition StartId="1199" EndId="26" type="0">
</Transition>
<Transition StartId="1201" EndId="822" type="0">
</Transition>
<Transition StartId="1202" EndId="1203" type="0">
</Transition>
<Transition StartId="1205" EndId="1206" type="0">
</Transition>
<Transition StartId="1206" EndId="770" type="0">
</Transition>
<Transition StartId="1207" EndId="1208" type="0">
</Transition>
<Transition StartId="1208" EndId="774" type="0">
</Transition>
<Transition StartId="1209" EndId="1210" type="0">
</Transition>
<Transition StartId="1210" EndId="778" type="0">
</Transition>
<Transition StartId="1211" EndId="1212" type="0">
</Transition>
<Transition StartId="1212" EndId="782" type="0">
</Transition>
<Transition StartId="1213" EndId="908" type="0">
</Transition>
<Transition StartId="1214" EndId="1215" type="0">
</Transition>
<Transition StartId="1215" EndId="794" type="0">
</Transition>
<Transition StartId="1216" EndId="813" type="0">
</Transition>
<Transition StartId="1217" EndId="824" type="0">
</Transition>
<Transition StartId="1218" EndId="847" type="0">
</Transition>
<Transition StartId="1219" EndId="1218" type="0">
</Transition>
<Transition StartId="1220" EndId="871" type="0">
</Transition>
<Transition StartId="1221" EndId="745" type="0">
</Transition>
<Transition StartId="1222" EndId="757" type="0">
</Transition>
</Transitions>
</Process>

