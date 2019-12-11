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
<Variable id="CAN_SND_ID" type="3" data="0x756" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75E" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="491" top="16" right="591" bottom="48"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="223" top="5300" right="323" bottom="5332"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="左后门(RLDCU)">
<Rect left="491" top="75" right="591" bottom="107"/>
<TitleText Enable="1" Text="左后门(RLDCU)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "FAW C131 DOOR-"..Dstring.."--"..tostring(KNR)</Script></Activity>
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
<Rect left="488" top="795" right="588" bottom="827"/>
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
<Activity id="712" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="488" top="856" right="588" bottom="888"/>
<Script></Script></Activity>
<Activity id="713" ActivityType="3" flags="0" name="比对零件号">
<Rect left="733" top="854" right="833" bottom="886"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>

#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_RLDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_RLDCU);
len = string.len(DString_C131_Partnumber_RLDCU)

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

engine.println("######## C131 DDCU PartNumber Read From ECU:"..StringRes);</Script></Activity>
<Activity id="714" ActivityType="3" flags="0" name="读硬件号">
<Rect left="881" top="916" right="981" bottom="948"/>
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
<Activity id="715" ActivityType="3" flags="0" name="延时700MS">
<Rect left="733" top="915" right="833" bottom="947"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="716" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="884" top="980" right="984" bottom="1012"/>
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
<Activity id="717" ActivityType="3" flags="0" name="延时300MS">
<Rect left="736" top="976" right="836" bottom="1008"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="718" ActivityType="3" flags="0" name="读软件号">
<Rect left="883" top="1051" right="983" bottom="1083"/>
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
<Activity id="719" ActivityType="3" flags="0" name="延时300MS">
<Rect left="734" top="1047" right="834" bottom="1079"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="720" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="887" top="1121" right="987" bottom="1153"/>
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
<Activity id="721" ActivityType="3" flags="0" name="延时300MS">
<Rect left="739" top="1123" right="839" bottom="1155"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="722" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="335" top="1122" right="435" bottom="1154"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，左后门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="723" ActivityType="3" flags="0" name="init">
<Rect left="336" top="1186" right="436" bottom="1218"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="724" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="335" top="1247" right="435" bottom="1279"/>
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
<Rect left="334" top="1318" right="434" bottom="1350"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="726" ActivityType="3" flags="0" name="endloop">
<Rect left="335" top="1453" right="435" bottom="1485"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="727" ActivityType="4" flags="0" name="路由节点">
<Rect left="285" top="1453" right="317" bottom="1485"/>
</Activity>
<Activity id="728" ActivityType="4" flags="0" name="路由节点">
<Rect left="286" top="1248" right="318" bottom="1280"/>
</Activity>
<Activity id="729" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="336" top="1386" right="436" bottom="1418"/>
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
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="730" ActivityType="3" flags="0" name="TemplateTestLoop_Light_Off">
<Rect left="819" top="1453" right="919" bottom="1485"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="731" ActivityType="3" flags="0" name="init">
<Rect left="820" top="1518" right="920" bottom="1550"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="732" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="819" top="1579" right="919" bottom="1611"/>
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
<Rect left="819" top="1785" right="919" bottom="1817"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="734" ActivityType="4" flags="0" name="路由节点">
<Rect left="986" top="1786" right="1018" bottom="1818"/>
</Activity>
<Activity id="735" ActivityType="4" flags="0" name="路由节点">
<Rect left="987" top="1581" right="1019" bottom="1613"/>
</Activity>
<Activity id="738" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="819" top="1850" right="919" bottom="1882"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="739" ActivityType="3" flags="0" name="截取字符串">
<Rect left="819" top="1644" right="919" bottom="1676"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="740" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="818" top="1702" right="918" bottom="1734"/>
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
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="741" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="318" top="1852" right="418" bottom="1884"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="742" ActivityType="3" flags="0" name="init">
<Rect left="316" top="1933" right="416" bottom="1965"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="743" ActivityType="3" flags="0" name="endloop">
<Rect left="314" top="2105" right="414" bottom="2137"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="744" ActivityType="4" flags="0" name="路由节点">
<Rect left="250" top="2105" right="282" bottom="2137"/>
</Activity>
<Activity id="745" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="315" top="2031" right="415" bottom="2063"/>
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
<Activity id="775" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="890" top="2105" right="990" bottom="2137"/>
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
<Activity id="776" ActivityType="3" flags="0" name="init">
<Rect left="890" top="2170" right="990" bottom="2202"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="777" ActivityType="3" flags="0" name="endloop">
<Rect left="890" top="2361" right="990" bottom="2393"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="778" ActivityType="4" flags="0" name="路由节点">
<Rect left="1179" top="2360" right="1211" bottom="2392"/>
</Activity>
<Activity id="779" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="889" top="2268" right="989" bottom="2300"/>
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
<Activity id="780" ActivityType="3" flags="0" name="!!!注意存在补偿">
<Rect left="966" top="2310" right="1066" bottom="2342"/>
<Script></Script></Activity>
<Activity id="781" ActivityType="4" flags="0" name="路由节点">
<Rect left="1178" top="2170" right="1210" bottom="2202"/>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="889" top="2432" right="989" bottom="2464"/>
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
<Rect left="883" top="2483" right="983" bottom="2515"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左后门玻璃上升"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x02\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="784" ActivityType="3" flags="0" name="init">
<Rect left="883" top="2548" right="983" bottom="2580"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="785" ActivityType="3" flags="0" name="endloop">
<Rect left="883" top="2739" right="983" bottom="2771"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="786" ActivityType="4" flags="0" name="路由节点">
<Rect left="1206" top="2738" right="1238" bottom="2770"/>
</Activity>
<Activity id="787" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="882" top="2646" right="982" bottom="2678"/>
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
<Activity id="788" ActivityType="3" flags="0" name="!!!注意存在补偿">
<Rect left="959" top="2688" right="1059" bottom="2720"/>
<Script></Script></Activity>
<Activity id="789" ActivityType="4" flags="0" name="路由节点">
<Rect left="1205" top="2548" right="1237" bottom="2580"/>
</Activity>
<Activity id="790" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="882" top="2810" right="982" bottom="2842"/>
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
<Rect left="883" top="2863" right="983" bottom="2895"/>
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
<Rect left="418" top="2865" right="518" bottom="2897"/>
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
<Rect left="419" top="2935" right="519" bottom="2967"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="795" ActivityType="13" flags="0" name="Read_status">
<Rect left="418" top="2996" right="518" bottom="3028"/>
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
<Rect left="418" top="3202" right="518" bottom="3234"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="797" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="3201" right="406" bottom="3233"/>
</Activity>
<Activity id="798" ActivityType="4" flags="0" name="路由节点">
<Rect left="375" top="2995" right="407" bottom="3027"/>
</Activity>
<Activity id="799" ActivityType="3" flags="0" name="截取字符串">
<Rect left="418" top="3061" right="518" bottom="3093"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="800" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="417" top="3119" right="517" bottom="3151"/>
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
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="801" ActivityType="3" flags="0" name="init">
<Rect left="420" top="3340" right="520" bottom="3372"/>
<Line3Text Enable="1" Text="左后门自动解锁"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="802" ActivityType="13" flags="0" name="Read_status">
<Rect left="419" top="3401" right="519" bottom="3433"/>
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
<Rect left="418" top="3601" right="518" bottom="3633"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="804" ActivityType="4" flags="0" name="路由节点">
<Rect left="359" top="3599" right="391" bottom="3631"/>
</Activity>
<Activity id="805" ActivityType="4" flags="0" name="路由节点">
<Rect left="357" top="3402" right="389" bottom="3434"/>
</Activity>
<Activity id="806" ActivityType="3" flags="0" name="截取字符串">
<Rect left="419" top="3466" right="519" bottom="3498"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="807" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="418" top="3524" right="518" bottom="3556"/>
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
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="808" ActivityType="13" flags="0" name="TemplateTestLoop_Door_Unlock">
<Rect left="419" top="3272" right="519" bottom="3304"/>
<Line3Text Enable="1" Text="左后门自动上锁"/>
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
<Rect left="419" top="3662" right="519" bottom="3694"/>
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
<Rect left="938" top="3662" right="1038" bottom="3694"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="811" ActivityType="3" flags="0" name="init">
<Rect left="935" top="3732" right="1035" bottom="3764"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="812" ActivityType="13" flags="0" name="Read_status">
<Rect left="934" top="3791" right="1034" bottom="3823"/>
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
<Rect left="934" top="3999" right="1034" bottom="4031"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="814" ActivityType="4" flags="0" name="路由节点">
<Rect left="890" top="3996" right="922" bottom="4028"/>
</Activity>
<Activity id="815" ActivityType="4" flags="0" name="路由节点">
<Rect left="886" top="3791" right="918" bottom="3823"/>
</Activity>
<Activity id="816" ActivityType="3" flags="0" name="截取字符串">
<Rect left="934" top="3858" right="1034" bottom="3890"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="817" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="933" top="3916" right="1033" bottom="3948"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;??????1?&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="818" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="934" top="4064" right="1034" bottom="4096"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="819" ActivityType="3" flags="0" name="init">
<Rect left="932" top="4126" right="1032" bottom="4158"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="820" ActivityType="13" flags="0" name="Read_status">
<Rect left="933" top="4190" right="1033" bottom="4222"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="821" ActivityType="3" flags="0" name="endloop">
<Rect left="934" top="4400" right="1034" bottom="4432"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="822" ActivityType="4" flags="0" name="路由节点">
<Rect left="880" top="4401" right="912" bottom="4433"/>
</Activity>
<Activity id="823" ActivityType="4" flags="0" name="路由节点">
<Rect left="879" top="4189" right="911" bottom="4221"/>
</Activity>
<Activity id="824" ActivityType="3" flags="0" name="截取字符串">
<Rect left="934" top="4259" right="1034" bottom="4291"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="825" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="933" top="4317" right="1033" bottom="4349"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;?????1??&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="826" ActivityType="3" flags="0" name="init">
<Rect left="1221" top="3739" right="1321" bottom="3771"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="827" ActivityType="13" flags="0" name="Read_status">
<Rect left="1222" top="3803" right="1322" bottom="3835"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="828" ActivityType="3" flags="0" name="endloop">
<Rect left="1223" top="4013" right="1323" bottom="4045"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="829" ActivityType="4" flags="0" name="路由节点">
<Rect left="1387" top="4016" right="1419" bottom="4048"/>
</Activity>
<Activity id="830" ActivityType="4" flags="0" name="路由节点">
<Rect left="1385" top="3804" right="1417" bottom="3836"/>
</Activity>
<Activity id="831" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1223" top="3872" right="1323" bottom="3904"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="832" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1222" top="3930" right="1322" bottom="3962"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="833" ActivityType="3" flags="0" name="init">
<Rect left="1225" top="4105" right="1325" bottom="4137"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="834" ActivityType="13" flags="0" name="Read_status">
<Rect left="1226" top="4169" right="1326" bottom="4201"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="835" ActivityType="3" flags="0" name="endloop">
<Rect left="1227" top="4379" right="1327" bottom="4411"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="836" ActivityType="4" flags="0" name="路由节点">
<Rect left="1398" top="4379" right="1430" bottom="4411"/>
</Activity>
<Activity id="837" ActivityType="4" flags="0" name="路由节点">
<Rect left="1396" top="4170" right="1428" bottom="4202"/>
</Activity>
<Activity id="838" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1227" top="4238" right="1327" bottom="4270"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="839" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1226" top="4296" right="1326" bottom="4328"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;??????11&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="840" ActivityType="4" flags="0" name="路由节点">
<Rect left="1264" top="4465" right="1296" bottom="4497"/>
</Activity>
<Activity id="841" ActivityType="3" flags="0" name="TemplateTestLoop_Door_Lock">
<Rect left="226" top="4465" right="326" bottom="4497"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Script></Script></Activity>
<Activity id="842" ActivityType="3" flags="0" name="init">
<Rect left="224" top="4545" right="324" bottom="4577"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="843" ActivityType="3" flags="0" name="endloop">
<Rect left="224" top="4736" right="324" bottom="4768"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="547" top="4735" right="579" bottom="4767"/>
</Activity>
<Activity id="845" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="223" top="4643" right="323" bottom="4675"/>
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
<Activity id="846" ActivityType="3" flags="0" name="!!!注意存在补偿">
<Rect left="70" top="4614" right="170" bottom="4646"/>
<Script></Script></Activity>
<Activity id="847" ActivityType="4" flags="0" name="路由节点">
<Rect left="546" top="4545" right="578" bottom="4577"/>
</Activity>
<Activity id="848" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="223" top="4802" right="323" bottom="4834"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="849" ActivityType="3" flags="0" name="ReadDTC">
<Rect left="222" top="4861" right="322" bottom="4893"/>
<Script></Script></Activity>
<Activity id="850" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="222" top="4925" right="322" bottom="4957"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x19"/>
<Parameter id="resTitle" value="0x59"/>
<Parameter id="sendTel" value="&apos;\x02\x09&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="853" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="222" top="5138" right="322" bottom="5170"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="854" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="221" top="5066" right="321" bottom="5098"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2206-00,U2207-00,U2208-00,U0141-00,U1008-00,U0199-00,U0146-00,U0002-00,U2351-00,U2356-00,B1266-00,B1271-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="855" ActivityType="3" flags="0" name="读DTC">
<Rect left="222" top="4994" right="322" bottom="5026"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="856" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="223" top="5228" right="323" bottom="5260"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
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
<Rect left="885" top="853" right="985" bottom="885"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="859" ActivityType="3" flags="0" name="维持信号">
<Rect left="490" top="924" right="590" bottom="956"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
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
<Transition StartId="706" EndId="707" type="6">
</Transition>
<Transition StartId="707" EndId="704" type="0">
</Transition>
<Transition StartId="708" EndId="706" type="4">
</Transition>
<Transition StartId="708" EndId="712" type="0">
</Transition>
<Transition StartId="712" EndId="713" type="0">
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
<Transition StartId="738" EndId="741" type="0">
</Transition>
<Transition StartId="739" EndId="740" type="0">
</Transition>
<Transition StartId="740" EndId="733" type="0">
</Transition>
<Transition StartId="741" EndId="742" type="0">
</Transition>
<Transition StartId="742" EndId="745" type="0">
</Transition>
<Transition StartId="743" EndId="744" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="743" EndId="775" type="0">
</Transition>
<Transition StartId="745" EndId="743" type="0">
</Transition>
<Transition StartId="775" EndId="776" type="0">
</Transition>
<Transition StartId="776" EndId="779" type="0">
</Transition>
<Transition StartId="777" EndId="778" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="777" EndId="782" type="0">
</Transition>
<Transition StartId="778" EndId="781" type="0">
</Transition>
<Transition StartId="779" EndId="777" type="0">
</Transition>
<Transition StartId="781" EndId="776" type="0">
</Transition>
<Transition StartId="782" EndId="783" type="0">
</Transition>
<Transition StartId="783" EndId="784" type="0">
</Transition>
<Transition StartId="784" EndId="787" type="0">
</Transition>
<Transition StartId="785" EndId="786" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="785" EndId="790" type="0">
</Transition>
<Transition StartId="786" EndId="789" type="0">
</Transition>
<Transition StartId="787" EndId="785" type="0">
</Transition>
<Transition StartId="789" EndId="784" type="0">
</Transition>
<Transition StartId="790" EndId="791" type="0">
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
<Transition StartId="840" EndId="841" type="0">
</Transition>
<Transition StartId="841" EndId="842" type="0">
</Transition>
<Transition StartId="842" EndId="845" type="0">
</Transition>
<Transition StartId="843" EndId="844" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="843" EndId="848" type="0">
</Transition>
<Transition StartId="844" EndId="847" type="0">
</Transition>
<Transition StartId="845" EndId="843" type="0">
</Transition>
<Transition StartId="847" EndId="842" type="0">
</Transition>
<Transition StartId="848" EndId="849" type="0">
</Transition>
<Transition StartId="849" EndId="850" type="0">
</Transition>
<Transition StartId="850" EndId="855" type="0">
</Transition>
<Transition StartId="853" EndId="856" type="0">
</Transition>
<Transition StartId="854" EndId="853" type="0">
</Transition>
<Transition StartId="855" EndId="854" type="0">
</Transition>
<Transition StartId="856" EndId="2" type="0">
</Transition>
<Transition StartId="857" EndId="6" type="0">
</Transition>
<Transition StartId="858" EndId="714" type="0">
</Transition>
</Transitions>
</Process>

