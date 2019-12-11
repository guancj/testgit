<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1126" pbltext="DEP119">
<Parameters>
<Variable id="DString_C131_Partnumber_RLDCU" type="8" dir="0" data="DString_C131_Partnumber_RLDCU"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75B" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="491" top="16" right="591" bottom="48"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="5434" right="330" bottom="5466"/>
<Script>--engine.registerPacket(1,4000,0x7DF,"",0);
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
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="左后门(RLDCU)">
<Rect left="491" top="75" right="591" bottom="107"/>
<TitleText Enable="1" Text="左后门(RLDCU)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "FAW C131 DOOR-"..Dstring.."--"..tostring(KNR)
engine.TestResult = 0;</Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="490" top="144" right="590" bottom="176"/>
<Line1Text Enable="1" Text="控制器连接！"/>
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
<Rect left="490" top="217" right="590" bottom="249"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1315" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="185" top="296" right="285" bottom="328"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="186" top="143" right="286" bottom="175"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="95" top="295" right="127" bottom="327"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="490" top="377" right="590" bottom="409"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1314" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="489" top="443" right="589" bottom="475"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x11"/>
<Parameter id="resTitle" value="0x51"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1315" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="489" top="515" right="589" bottom="547"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="490" top="297" right="590" bottom="329"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1313" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="489" top="581" right="589" bottom="613"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="2"/>
<Parameter id="Text" value="&quot;ECU重置，请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="704" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="489" top="653" right="589" bottom="685"/>
<Line1Text Enable="1" Text="控制器连接！"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="705" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="489" top="726" right="589" bottom="758"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1315" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="706" ActivityType="3" flags="0" name="重试？">
<Rect left="187" top="795" right="287" bottom="827"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="707" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="188" top="652" right="288" bottom="684"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="490" top="794" right="590" bottom="826"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1313" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="713" ActivityType="3" flags="0" name="比对零件号">
<Rect left="490" top="924" right="590" bottom="956"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_RLDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_RLDCU);
len = string.len(DString_C131_Partnumber_RLDCU)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_RLDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_RLDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_RLDCU);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_RLDCU;
	
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
	
		if (DString1==DString_C131_Partnumber_RLDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_RLDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_RLDCU);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_RLDCU;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end
</Script><assessment no="1" name="DEP589" type="8" flags="97"/>
</Activity>
<Activity id="714" ActivityType="3" flags="0" name="读硬件号">
<Rect left="650" top="984" right="750" bottom="1016"/>
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
</Script><assessment no="2" name="DEP590" type="8" flags="97"/>
</Activity>
<Activity id="715" ActivityType="3" flags="0" name="延时700MS">
<Rect left="490" top="984" right="590" bottom="1016"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="716" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="650" top="1054" right="750" bottom="1086"/>
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
</Script><assessment no="3" name="DEP591" type="8" flags="97"/>
</Activity>
<Activity id="717" ActivityType="3" flags="0" name="延时300MS">
<Rect left="500" top="1044" right="600" bottom="1076"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="718" ActivityType="3" flags="0" name="读软件号">
<Rect left="650" top="1114" right="750" bottom="1146"/>
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
</Script><assessment no="4" name="DEP592" type="8" flags="97"/>
</Activity>
<Activity id="719" ActivityType="3" flags="0" name="延时300MS">
<Rect left="500" top="1114" right="600" bottom="1146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="720" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="660" top="1194" right="760" bottom="1226"/>
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
        elseif(( DString_C131_Car_Tpye == "CMNA02A" ) or( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CH1QM30" ) or ( DString_C131_Car_Tpye == "CH1QM40" ) or ( DString_C131_Car_Tpye == "CH1QM50" )or ( DString_C131_Car_Tpye == "CNDA01A" )or ( DString_C131_Car_Tpye == "CH1PM30" )or ( DString_C131_Car_Tpye == "CH1PM20" ))then
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


                                                          


</Script><assessment no="5" name="DEP593" type="8" flags="97"/>
</Activity>
<Activity id="721" ActivityType="3" flags="0" name="延时300MS">
<Rect left="500" top="1194" right="600" bottom="1226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="722" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="320" top="1194" right="420" bottom="1226"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，左后门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="723" ActivityType="3" flags="0" name="init">
<Rect left="320" top="1254" right="420" bottom="1286"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="724" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="320" top="1314" right="420" bottom="1346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x27&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="725" ActivityType="3" flags="0" name="截取字符串">
<Rect left="320" top="1384" right="420" bottom="1416"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="726" ActivityType="3" flags="0" name="endloop">
<Rect left="320" top="1524" right="420" bottom="1556"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="727" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="1524" right="306" bottom="1556"/>
</Activity>
<Activity id="728" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="1314" right="306" bottom="1346"/>
</Activity>
<Activity id="729" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="320" top="1454" right="420" bottom="1486"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="730" ActivityType="3" flags="0" name="TemplateTestLoop_Light_Off">
<Rect left="820" top="1524" right="920" bottom="1556"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="731" ActivityType="3" flags="0" name="init">
<Rect left="820" top="1584" right="920" bottom="1616"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="732" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="820" top="1644" right="920" bottom="1676"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x27&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="733" ActivityType="3" flags="0" name="endloop">
<Rect left="820" top="1854" right="920" bottom="1886"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="734" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1854" right="1016" bottom="1886"/>
</Activity>
<Activity id="735" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="1644" right="1016" bottom="1676"/>
</Activity>
<Activity id="738" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="820" top="1914" right="920" bottom="1946"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="739" ActivityType="3" flags="0" name="截取字符串">
<Rect left="820" top="1714" right="920" bottom="1746"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="740" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="820" top="1764" right="920" bottom="1796"/>
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
<assessment no="14" name="DEP599" type="8" flags="97"/>
</Activity>
<Activity id="775" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="870" top="2174" right="970" bottom="2206"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左后门玻璃下降"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x10\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="870" top="2564" right="970" bottom="2596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x10\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="783" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="870" top="2634" right="970" bottom="2666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左后门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x10\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="790" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="870" top="2964" right="970" bottom="2996"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x10\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="791" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="870" top="3064" right="970" bottom="3096"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x10\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="793" ActivityType="13" flags="0" name="Check_the_door_lock">
<Rect left="400" top="3064" right="500" bottom="3096"/>
<Line3Text Enable="1" Text="左后门自动上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0F\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="794" ActivityType="3" flags="0" name="TemplateTestLoop_Door_Lock">
<Rect left="400" top="3134" right="500" bottom="3166"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="795" ActivityType="13" flags="0" name="Read_status">
<Rect left="400" top="3194" right="500" bottom="3226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x26&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="796" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="3404" right="500" bottom="3436"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="797" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3404" right="386" bottom="3436"/>
</Activity>
<Activity id="798" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="3194" right="386" bottom="3226"/>
</Activity>
<Activity id="799" ActivityType="3" flags="0" name="截取字符串">
<Rect left="400" top="3264" right="500" bottom="3296"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="800" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="3324" right="500" bottom="3356"/>
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
<assessment no="27" name="DEP602" type="8" flags="97"/>
</Activity>
<Activity id="801" ActivityType="3" flags="0" name="init">
<Rect left="400" top="3544" right="500" bottom="3576"/>
<Line3Text Enable="1" Text="左后门自动解锁"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="802" ActivityType="13" flags="0" name="Read_status">
<Rect left="400" top="3604" right="500" bottom="3636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x26&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="803" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="3804" right="500" bottom="3836"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="804" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="3804" right="376" bottom="3836"/>
</Activity>
<Activity id="805" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="3604" right="376" bottom="3636"/>
</Activity>
<Activity id="806" ActivityType="3" flags="0" name="截取字符串">
<Rect left="400" top="3664" right="500" bottom="3696"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="807" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="3724" right="500" bottom="3756"/>
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
<assessment no="28" name="DEP603" type="8" flags="97"/>
</Activity>
<Activity id="808" ActivityType="13" flags="0" name="TemplateTestLoop_Door_Unlock">
<Rect left="400" top="3474" right="500" bottom="3506"/>
<Line3Text Enable="1" Text="左后门自动解锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0F\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="809" ActivityType="13" flags="0" name="Doors_lock_ReturnControlToECU">
<Rect left="400" top="3864" right="500" bottom="3896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x0F\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="890" top="3864" right="990" bottom="3896"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="811" ActivityType="3" flags="0" name="init">
<Rect left="890" top="3934" right="990" bottom="3966"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="812" ActivityType="13" flags="0" name="Read_status">
<Rect left="890" top="3994" right="990" bottom="4026"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x31&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="813" ActivityType="3" flags="0" name="endloop">
<Rect left="890" top="4184" right="990" bottom="4216"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="814" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4184" right="866" bottom="4216"/>
</Activity>
<Activity id="815" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="3994" right="866" bottom="4026"/>
</Activity>
<Activity id="816" ActivityType="3" flags="0" name="截取字符串">
<Rect left="890" top="4064" right="990" bottom="4096"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="817" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="890" top="4124" right="990" bottom="4156"/>
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
<assessment no="29" name="DEP2020" type="8" flags="97"/>
</Activity>
<Activity id="818" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="890" top="4254" right="990" bottom="4286"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="819" ActivityType="3" flags="0" name="init">
<Rect left="890" top="4324" right="990" bottom="4356"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="820" ActivityType="13" flags="0" name="Read_status">
<Rect left="890" top="4394" right="990" bottom="4426"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x31&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="821" ActivityType="3" flags="0" name="endloop">
<Rect left="890" top="4604" right="990" bottom="4636"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="822" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4604" right="866" bottom="4636"/>
</Activity>
<Activity id="823" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4394" right="866" bottom="4426"/>
</Activity>
<Activity id="824" ActivityType="3" flags="0" name="截取字符串">
<Rect left="890" top="4464" right="990" bottom="4496"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="825" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="890" top="4524" right="990" bottom="4556"/>
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
<assessment no="30" name="DEP2021" type="8" flags="97"/>
</Activity>
<Activity id="826" ActivityType="3" flags="0" name="init">
<Rect left="1170" top="3944" right="1270" bottom="3976"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="827" ActivityType="13" flags="0" name="Read_status">
<Rect left="1170" top="4004" right="1270" bottom="4036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x31&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="828" ActivityType="3" flags="0" name="endloop">
<Rect left="1170" top="4214" right="1270" bottom="4246"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="829" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="4214" right="1366" bottom="4246"/>
</Activity>
<Activity id="830" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="4004" right="1366" bottom="4036"/>
</Activity>
<Activity id="831" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1170" top="4074" right="1270" bottom="4106"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="832" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1170" top="4134" right="1270" bottom="4166"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="31" name="DEP2018" type="8" flags="97"/>
</Activity>
<Activity id="833" ActivityType="3" flags="0" name="init">
<Rect left="1170" top="4304" right="1270" bottom="4336"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 2（升到顶）"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="834" ActivityType="13" flags="0" name="Read_status">
<Rect left="1170" top="4374" right="1270" bottom="4406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x31&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="835" ActivityType="3" flags="0" name="endloop">
<Rect left="1170" top="4584" right="1270" bottom="4616"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="836" ActivityType="4" flags="0" name="路由节点">
<Rect left="1344" top="4584" right="1376" bottom="4616"/>
</Activity>
<Activity id="837" ActivityType="4" flags="0" name="路由节点">
<Rect left="1344" top="4374" right="1376" bottom="4406"/>
</Activity>
<Activity id="838" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1170" top="4444" right="1270" bottom="4476"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="839" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1170" top="4504" right="1270" bottom="4536"/>
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
<assessment no="32" name="DEP2019" type="8" flags="97"/>
</Activity>
<Activity id="840" ActivityType="4" flags="0" name="路由节点">
<Rect left="1204" top="4664" right="1236" bottom="4696"/>
</Activity>
<Activity id="841" ActivityType="3" flags="0" name="TemplateTestLoop_Door_Lock">
<Rect left="230" top="4664" right="330" bottom="4696"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Script>#DELAY  1000</Script></Activity>
<Activity id="848" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="230" top="5084" right="330" bottom="5116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="849" ActivityType="3" flags="0" name="ReadDTC">
<Rect left="230" top="5144" right="330" bottom="5176"/>
<Script></Script></Activity>
<Activity id="853" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="230" top="5344" right="330" bottom="5376"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP122" type="8" flags="97"/>
</Activity>
<Activity id="854" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="230" top="5284" right="330" bottom="5316"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2206-00,U2207-00,U2208-00,U0141-00,U1008-00,U0199-00,U0146-00,U0002-00,U2301-00,U2306-00,B1233-00,B123F-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="855" ActivityType="3" flags="0" name="读DTC">
<Rect left="230" top="5214" right="330" bottom="5246"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP122" type="8" flags="97"/>
</Activity>
<Activity id="857" ActivityType="3" flags="0" name="延时500MS">
<Rect left="636" top="144" right="736" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="858" ActivityType="3" flags="0" name="延时700MS">
<Rect left="650" top="924" right="750" bottom="956"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="859" ActivityType="3" flags="0" name="维持信号">
<Rect left="590" top="854" right="690" bottom="886"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1212" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="330" top="1914" right="430" bottom="1946"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1213" ActivityType="3" flags="0" name="init">
<Rect left="330" top="1984" right="430" bottom="2016"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1214" ActivityType="3" flags="0" name="endloop">
<Rect left="330" top="2174" right="430" bottom="2206"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1215" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2174" right="316" bottom="2206"/>
</Activity>
<Activity id="1216" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="330" top="2114" right="430" bottom="2146"/>
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
<assessment no="26" name="DEP2323" type="8" flags="97"/>
</Activity>
<Activity id="1217" ActivityType="3" flags="0" name="初始化">
<Rect left="330" top="2044" right="430" bottom="2076"/>
<Script>DFloat_Mts3Result=math.abs(engine.dr_door_i);
--DFloat_Mts3Result=tostring(DFloat_Mts3Result);</Script></Activity>
<Activity id="1218" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="2044" right="316" bottom="2076"/>
</Activity>
<Activity id="1219" ActivityType="3" flags="0" name="延时1000MS">
<Rect left="1010" top="2174" right="1110" bottom="2206"/>
<Script>#DELAY  1000</Script></Activity>
<Activity id="1220" ActivityType="3" flags="0" name="init">
<Rect left="870" top="2244" right="970" bottom="2276"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1221" ActivityType="3" flags="0" name="endloop">
<Rect left="870" top="2434" right="970" bottom="2466"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1222" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="2434" right="836" bottom="2466"/>
</Activity>
<Activity id="1223" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="870" top="2374" right="970" bottom="2406"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP600" type="8" flags="97"/>
</Activity>
<Activity id="1224" ActivityType="3" flags="0" name="初始化">
<Rect left="870" top="2304" right="970" bottom="2336"/>
<Script>DFloat_Mts3Result=(engine.dr_door_i) /1000;
DFloat_Mts3Result = tonumber(DFloat_Mts3Result);</Script></Activity>
<Activity id="1225" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="2304" right="836" bottom="2336"/>
</Activity>
<Activity id="1226" ActivityType="3" flags="0" name="延时200MS">
<Rect left="870" top="2504" right="970" bottom="2536"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="1227" ActivityType="3" flags="0" name="init">
<Rect left="870" top="2714" right="970" bottom="2746"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1228" ActivityType="3" flags="0" name="endloop">
<Rect left="870" top="2904" right="970" bottom="2936"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1229" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="2904" right="836" bottom="2936"/>
</Activity>
<Activity id="1230" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="870" top="2844" right="970" bottom="2876"/>
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
<assessment no="16" name="DEP601" type="8" flags="97"/>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="初始化">
<Rect left="870" top="2774" right="970" bottom="2806"/>
<Script>DFloat_Mts3Result = (engine.dr_door_i)  /1000;
--DFloat_Mts3Result=tostring(DFloat_Mts3Result);</Script></Activity>
<Activity id="1232" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="2774" right="836" bottom="2806"/>
</Activity>
<Activity id="1233" ActivityType="3" flags="0" name="延时1000MS">
<Rect left="1020" top="2634" right="1120" bottom="2666"/>
<Script>#DELAY  1000</Script></Activity>
<Activity id="1234" ActivityType="3" flags="0" name="延时200MS">
<Rect left="870" top="3014" right="970" bottom="3046"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1241" ActivityType="3" flags="0" name="init">
<Rect left="230" top="4724" right="330" bottom="4756"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1242" ActivityType="3" flags="0" name="endloop">
<Rect left="230" top="5004" right="330" bottom="5036"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1243" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="5004" right="196" bottom="5036"/>
</Activity>
<Activity id="1244" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="520" top="4844" right="620" bottom="4876"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1621" type="8" flags="97"/>
</Activity>
<Activity id="1245" ActivityType="3" flags="0" name="初始化">
<Rect left="490" top="4784" right="590" bottom="4816"/>
<Script>DFloat_Mts3Result = math.abs(engine.dr_door_i );
DFloat_Mts3Result=tostring(DFloat_Mts3Result);
engine.println("手动开启门锁检测：".. DFloat_Mts3Result)</Script></Activity>
<Activity id="1246" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="4784" right="196" bottom="4816"/>
</Activity>
<Activity id="1247" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="794" right="126" bottom="826"/>
</Activity>
<Activity id="1248" ActivityType="3" flags="0" name="将玻璃上升">
<Rect left="730" top="4664" right="830" bottom="4696"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=请将玻璃升到顶".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="1249" ActivityType="3" flags="0" name="状态判断">
<Rect left="520" top="4664" right="620" bottom="4696"/>
<Script>if(engine.LButtonPressed) then 
engine.LastError = 1;
engine.StatValue = "左后门玻璃未上升到顶部"
end
if(engine.RButtonPressed) then
engine.LastError = 0;
engine.StatValue =""
end</Script><assessment no="33" name="DEP2044" type="8" flags="97"/>
</Activity>
<Activity id="1251" ActivityType="3" flags="0" name="截取字符串">
<Rect left="230" top="4854" right="330" bottom="4886"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1252" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="230" top="4924" right="330" bottom="4956"/>
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
<assessment no="34" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="1253" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="230" top="4784" right="330" bottom="4816"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x27&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1254" ActivityType="3" flags="0" name="TemplateTestLoop_Door_Lock">
<Rect left="830" top="4794" right="930" bottom="4826"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Script>#DELAY  1000</Script></Activity>
<Activity id="1255" ActivityType="3" flags="0" name="init">
<Rect left="830" top="4854" right="930" bottom="4886"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1256" ActivityType="3" flags="0" name="endloop">
<Rect left="830" top="5134" right="930" bottom="5166"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1257" ActivityType="4" flags="1" name="路由节点">
<Rect left="774" top="5124" right="806" bottom="5156"/>
</Activity>
<Activity id="1258" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="4914" right="806" bottom="4946"/>
</Activity>
<Activity id="1259" ActivityType="3" flags="0" name="截取字符串">
<Rect left="830" top="4984" right="930" bottom="5016"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1260" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="830" top="5054" right="930" bottom="5086"/>
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
<assessment no="34" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="1261" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="830" top="4914" right="930" bottom="4946"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x27&apos;"/>
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
<Transition StartId="5" EndId="857" type="0">
</Transition>
<Transition StartId="6" EndId="13" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="5" type="0">
</Transition>
<Transition StartId="9" EndId="1247" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="20" type="0">
</Transition>
<Transition StartId="13" EndId="7" type="4">
</Transition>
<Transition StartId="13" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="704" type="0">
</Transition>
<Transition StartId="704" EndId="705" type="0">
</Transition>
<Transition StartId="705" EndId="708" type="0">
</Transition>
<Transition StartId="706" EndId="707" type="0">
</Transition>
<Transition StartId="706" EndId="1247" type="5">
</Transition>
<Transition StartId="707" EndId="704" type="0">
</Transition>
<Transition StartId="708" EndId="706" type="4">
</Transition>
<Transition StartId="708" EndId="713" type="0">
</Transition>
<Transition StartId="713" EndId="858" type="0">
</Transition>
<Transition StartId="714" EndId="715" type="0">
</Transition>
<Transition StartId="715" EndId="716" type="0">
</Transition>
<Transition StartId="716" EndId="717" type="0">
</Transition>
<Transition StartId="717" EndId="718" type="0">
</Transition>
<Transition StartId="718" EndId="719" type="0">
</Transition>
<Transition StartId="719" EndId="720" type="0">
</Transition>
<Transition StartId="720" EndId="721" type="0">
</Transition>
<Transition StartId="721" EndId="722" type="0">
</Transition>
<Transition StartId="722" EndId="723" type="0">
</Transition>
<Transition StartId="723" EndId="724" type="0">
</Transition>
<Transition StartId="724" EndId="725" type="0">
</Transition>
<Transition StartId="725" EndId="729" type="0">
</Transition>
<Transition StartId="726" EndId="727" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="726" EndId="730" type="0">
</Transition>
<Transition StartId="727" EndId="728" type="0">
</Transition>
<Transition StartId="728" EndId="724" type="0">
</Transition>
<Transition StartId="729" EndId="726" type="0">
</Transition>
<Transition StartId="730" EndId="731" type="0">
</Transition>
<Transition StartId="731" EndId="732" type="0">
</Transition>
<Transition StartId="732" EndId="739" type="0">
</Transition>
<Transition StartId="733" EndId="734" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="733" EndId="738" type="0">
</Transition>
<Transition StartId="734" EndId="735" type="0">
</Transition>
<Transition StartId="735" EndId="732" type="0">
</Transition>
<Transition StartId="738" EndId="1212" type="0">
</Transition>
<Transition StartId="739" EndId="740" type="0">
</Transition>
<Transition StartId="740" EndId="733" type="0">
</Transition>
<Transition StartId="775" EndId="1219" type="0">
</Transition>
<Transition StartId="782" EndId="783" type="0">
</Transition>
<Transition StartId="783" EndId="1233" type="0">
</Transition>
<Transition StartId="790" EndId="1234" type="0">
</Transition>
<Transition StartId="791" EndId="793" type="0">
</Transition>
<Transition StartId="793" EndId="794" type="0">
</Transition>
<Transition StartId="794" EndId="795" type="0">
</Transition>
<Transition StartId="795" EndId="799" type="0">
</Transition>
<Transition StartId="796" EndId="797" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="796" EndId="808" type="0">
</Transition>
<Transition StartId="797" EndId="798" type="0">
</Transition>
<Transition StartId="798" EndId="795" type="0">
</Transition>
<Transition StartId="799" EndId="800" type="0">
</Transition>
<Transition StartId="800" EndId="796" type="0">
</Transition>
<Transition StartId="801" EndId="802" type="0">
</Transition>
<Transition StartId="802" EndId="806" type="0">
</Transition>
<Transition StartId="803" EndId="804" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="803" EndId="809" type="0">
</Transition>
<Transition StartId="804" EndId="805" type="0">
</Transition>
<Transition StartId="805" EndId="802" type="0">
</Transition>
<Transition StartId="806" EndId="807" type="0">
</Transition>
<Transition StartId="807" EndId="803" type="0">
</Transition>
<Transition StartId="808" EndId="801" type="0">
</Transition>
<Transition StartId="809" EndId="810" type="0">
</Transition>
<Transition StartId="810" EndId="811" type="0">
</Transition>
<Transition StartId="811" EndId="812" type="0">
</Transition>
<Transition StartId="812" EndId="816" type="0">
</Transition>
<Transition StartId="813" EndId="814" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="813" EndId="818" type="0">
</Transition>
<Transition StartId="814" EndId="815" type="0">
</Transition>
<Transition StartId="815" EndId="812" type="0">
</Transition>
<Transition StartId="816" EndId="817" type="0">
</Transition>
<Transition StartId="817" EndId="813" type="0">
</Transition>
<Transition StartId="818" EndId="819" type="0">
</Transition>
<Transition StartId="819" EndId="820" type="0">
</Transition>
<Transition StartId="820" EndId="824" type="0">
</Transition>
<Transition StartId="821" EndId="822" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="821" EndId="826" type="0">
</Transition>
<Transition StartId="822" EndId="823" type="0">
</Transition>
<Transition StartId="823" EndId="820" type="0">
</Transition>
<Transition StartId="824" EndId="825" type="0">
</Transition>
<Transition StartId="825" EndId="821" type="0">
</Transition>
<Transition StartId="826" EndId="827" type="0">
</Transition>
<Transition StartId="827" EndId="831" type="0">
</Transition>
<Transition StartId="828" EndId="829" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="828" EndId="833" type="0">
</Transition>
<Transition StartId="829" EndId="830" type="0">
</Transition>
<Transition StartId="830" EndId="827" type="0">
</Transition>
<Transition StartId="831" EndId="832" type="0">
</Transition>
<Transition StartId="832" EndId="828" type="0">
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
<Transition StartId="840" EndId="1248" type="0">
</Transition>
<Transition StartId="841" EndId="1241" type="0">
</Transition>
<Transition StartId="848" EndId="849" type="0">
</Transition>
<Transition StartId="849" EndId="855" type="0">
</Transition>
<Transition StartId="853" EndId="2" type="0">
</Transition>
<Transition StartId="854" EndId="853" type="0">
</Transition>
<Transition StartId="855" EndId="854" type="0">
</Transition>
<Transition StartId="857" EndId="6" type="0">
</Transition>
<Transition StartId="858" EndId="714" type="0">
</Transition>
<Transition StartId="1212" EndId="1213" type="0">
</Transition>
<Transition StartId="1213" EndId="1217" type="0">
</Transition>
<Transition StartId="1214" EndId="1215" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="1214" EndId="775" type="0">
</Transition>
<Transition StartId="1215" EndId="1218" type="0">
</Transition>
<Transition StartId="1216" EndId="1214" type="0">
</Transition>
<Transition StartId="1217" EndId="1216" type="0">
</Transition>
<Transition StartId="1218" EndId="1217" type="0">
</Transition>
<Transition StartId="1219" EndId="1220" type="0">
</Transition>
<Transition StartId="1220" EndId="1224" type="0">
</Transition>
<Transition StartId="1221" EndId="1222" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1221" EndId="1226" type="0">
</Transition>
<Transition StartId="1222" EndId="1225" type="0">
</Transition>
<Transition StartId="1223" EndId="1221" type="0">
</Transition>
<Transition StartId="1224" EndId="1223" type="0">
</Transition>
<Transition StartId="1225" EndId="1224" type="0">
</Transition>
<Transition StartId="1226" EndId="782" type="0">
</Transition>
<Transition StartId="1227" EndId="1231" type="0">
</Transition>
<Transition StartId="1228" EndId="1229" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1228" EndId="790" type="0">
</Transition>
<Transition StartId="1229" EndId="1232" type="0">
</Transition>
<Transition StartId="1230" EndId="1228" type="0">
</Transition>
<Transition StartId="1231" EndId="1230" type="0">
</Transition>
<Transition StartId="1232" EndId="1231" type="0">
</Transition>
<Transition StartId="1233" EndId="1227" type="0">
</Transition>
<Transition StartId="1234" EndId="791" type="0">
</Transition>
<Transition StartId="1241" EndId="1253" type="0">
</Transition>
<Transition StartId="1242" EndId="1243" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="1242" EndId="848" type="0">
</Transition>
<Transition StartId="1243" EndId="1246" type="0">
</Transition>
<Transition StartId="1246" EndId="1253" type="0">
</Transition>
<Transition StartId="1248" EndId="1249" type="0">
</Transition>
<Transition StartId="1249" EndId="841" type="0">
</Transition>
<Transition StartId="1251" EndId="1252" type="0">
</Transition>
<Transition StartId="1252" EndId="1242" type="0">
</Transition>
<Transition StartId="1253" EndId="1251" type="0">
</Transition>
<Transition StartId="1254" EndId="1255" type="0">
</Transition>
<Transition StartId="1255" EndId="1261" type="0">
</Transition>
<Transition StartId="1256" EndId="1257" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="1257" EndId="1258" type="0">
</Transition>
<Transition StartId="1258" EndId="1261" type="0">
</Transition>
<Transition StartId="1259" EndId="1260" type="0">
</Transition>
<Transition StartId="1260" EndId="1256" type="0">
</Transition>
<Transition StartId="1261" EndId="1259" type="0">
</Transition>
</Transitions>
</Process>

