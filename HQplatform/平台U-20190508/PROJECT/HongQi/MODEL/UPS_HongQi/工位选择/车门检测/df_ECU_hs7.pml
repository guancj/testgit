<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x754" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75C" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="620" top="24" right="720" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="400" top="14654" right="500" bottom="14686"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="司机门(DDCU)">
<Rect left="620" top="94" right="720" bottom="126"/>
<TitleText Enable="1" Text="司机门(DDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="620" top="164" right="720" bottom="196"/>
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
<Activity id="5" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="620" top="264" right="720" bottom="296"/>
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
<Activity id="6" ActivityType="3" flags="0" name="重试？">
<Rect left="160" top="324" right="260" bottom="356"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="159" top="163" right="259" bottom="195"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="324" right="136" bottom="356"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="620" top="324" right="720" bottom="356"/>
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
<Activity id="20" ActivityType="3" flags="0" name="延时500MS">
<Rect left="620" top="214" right="720" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="705" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="620" top="384" right="720" bottom="416"/>
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
<Activity id="706" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="620" top="454" right="720" bottom="486"/>
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
<Activity id="707" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="620" top="524" right="720" bottom="556"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="460" top="604" right="560" bottom="636"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="709" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="460" top="674" right="560" bottom="706"/>
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
<Activity id="710" ActivityType="3" flags="0" name="重试？">
<Rect left="150" top="744" right="250" bottom="776"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="711" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="150" top="604" right="250" bottom="636"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="712" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="460" top="744" right="560" bottom="776"/>
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
<Activity id="713" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="460" top="814" right="560" bottom="846"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="714" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="620" top="604" right="720" bottom="636"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="2"/>
<Parameter id="Text" value="&quot;ECU重置，请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="715" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="744" right="136" bottom="776"/>
</Activity>
<Activity id="716" ActivityType="3" flags="0" name="发送key">
<Rect left="460" top="944" right="560" bottom="976"/>
<Line1Text Enable="1" Text="发送key"/>
<Script>
#COMMEX vciHandle -1 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="717" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="910" top="944" right="1010" bottom="976"/>
<Script></Script></Activity>
<Activity id="718" ActivityType="13" flags="0" name="计算key">
<Rect left="460" top="874" right="560" bottom="906"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30530264"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="比对零件号">
<Rect left="910" top="1024" right="1010" bottom="1056"/>
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
<Activity id="723" ActivityType="3" flags="0" name="读硬件号">
<Rect left="1050" top="1084" right="1150" bottom="1116"/>
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
<Activity id="724" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="1084" right="1010" bottom="1116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="725" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1050" top="1144" right="1150" bottom="1176"/>
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
<Activity id="726" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="1144" right="1010" bottom="1176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="727" ActivityType="3" flags="0" name="读软件号">
<Rect left="1050" top="1214" right="1150" bottom="1246"/>
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
<Activity id="728" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="1214" right="1010" bottom="1246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="729" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1050" top="1284" right="1150" bottom="1316"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
		if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="4.00";            
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
<Activity id="730" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="1284" right="1010" bottom="1316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="731" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1050" top="1024" right="1150" bottom="1056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="732" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="470" top="1284" right="570" bottom="1316"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，司机门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="733" ActivityType="3" flags="0" name="init">
<Rect left="470" top="1354" right="570" bottom="1386"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="734" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="470" top="1484" right="570" bottom="1516"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x17&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="735" ActivityType="3" flags="0" name="截取字符串">
<Rect left="470" top="1554" right="570" bottom="1586"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="736" ActivityType="3" flags="0" name="endloop">
<Rect left="470" top="1694" right="570" bottom="1726"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="737" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="1694" right="416" bottom="1726"/>
</Activity>
<Activity id="738" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="1424" right="416" bottom="1456"/>
</Activity>
<Activity id="739" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="470" top="1624" right="570" bottom="1656"/>
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
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="740" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="470" top="1424" right="570" bottom="1456"/>
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
<Activity id="741" ActivityType="3" flags="0" name="TemplateTestLoop_Light_Off">
<Rect left="950" top="1694" right="1050" bottom="1726"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="742" ActivityType="3" flags="0" name="init">
<Rect left="950" top="1754" right="1050" bottom="1786"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="743" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="950" top="1884" right="1050" bottom="1916"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x17&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="744" ActivityType="3" flags="0" name="endloop">
<Rect left="950" top="2084" right="1050" bottom="2116"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="745" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="2084" right="1146" bottom="2116"/>
</Activity>
<Activity id="746" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="1824" right="1146" bottom="1856"/>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="950" top="2214" right="1050" bottom="2246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(0,"请将外后视镜开关置于折叠档位");

engine.SetLineText(1,"#L=观察外后视镜折叠了吗？#R=BMPEYE");

engine.SetLButtonText("放弃");
engine.SetRButtonText("合格");
#PRESSBUTTON
engine.ShowMessage();
if (engine.LButtonPressed == true) then
engine.LastError = 1;
engine.StatValue = "NOK";

elseif (engine.RButtonPressed == true) then

engine.LastError = 0;
engine.StatValue = "OK";

end;

engine.SetLineText(0,"");
engine.SetLineText(1,"");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();
</Script></Activity>
<Activity id="748" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="810" top="2214" right="910" bottom="2246"/>
<Line1Text Enable="1" Text="请确认外后视镜开关位置于0位置"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="749" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="950" top="2154" right="1050" bottom="2186"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="750" ActivityType="3" flags="0" name="截取字符串">
<Rect left="950" top="1944" right="1050" bottom="1976"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="751" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="950" top="2004" right="1050" bottom="2036"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="752" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="950" top="1824" right="1050" bottom="1856"/>
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
<Activity id="753" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="160" top="2214" right="260" bottom="2246"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="754" ActivityType="3" flags="0" name="init">
<Rect left="160" top="2284" right="260" bottom="2316"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="755" ActivityType="3" flags="0" name="endloop">
<Rect left="163" top="2477" right="263" bottom="2509"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="756" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="2474" right="116" bottom="2506"/>
</Activity>
<Activity id="757" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="160" top="2414" right="260" bottom="2446"/>
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
<Activity id="758" ActivityType="3" flags="0" name="初始化">
<Rect left="160" top="2344" right="260" bottom="2376"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="759" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="2344" right="116" bottom="2376"/>
</Activity>
<Activity id="760" ActivityType="3" flags="0" name="Check_mirror">
<Rect left="339" top="2477" right="439" bottom="2509"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="761" ActivityType="13" flags="0" name="X_Axis_increase_adjust">
<Rect left="343" top="2621" right="443" bottom="2653"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="762" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="343" top="3014" right="443" bottom="3046"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="765" ActivityType="3" flags="0" name="init">
<Rect left="343" top="2691" right="443" bottom="2723"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="766" ActivityType="3" flags="0" name="endloop">
<Rect left="343" top="2954" right="443" bottom="2986"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="767" ActivityType="4" flags="0" name="路由节点">
<Rect left="277" top="2954" right="309" bottom="2986"/>
</Activity>
<Activity id="768" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="343" top="2894" right="443" bottom="2926"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="550"/>
<Parameter id="LowerLimit" value="470"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="10"/>
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
<Activity id="769" ActivityType="3" flags="0" name="初始化">
<Rect left="343" top="2824" right="443" bottom="2856"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="770" ActivityType="4" flags="0" name="路由节点">
<Rect left="277" top="2824" right="309" bottom="2856"/>
</Activity>
<Activity id="772" ActivityType="13" flags="0" name="X_Axis_decrease_adjust">
<Rect left="600" top="2544" right="700" bottom="2576"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴减少"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="773" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="600" top="2864" right="700" bottom="2896"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="776" ActivityType="3" flags="0" name="init">
<Rect left="600" top="2614" right="700" bottom="2646"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="777" ActivityType="3" flags="0" name="endloop">
<Rect left="600" top="2804" right="700" bottom="2836"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="778" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="2804" right="576" bottom="2836"/>
</Activity>
<Activity id="779" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="600" top="2744" right="700" bottom="2776"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="550"/>
<Parameter id="LowerLimit" value="470"/>
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
<Activity id="780" ActivityType="3" flags="0" name="初始化">
<Rect left="600" top="2674" right="700" bottom="2706"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="781" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="2674" right="576" bottom="2706"/>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Y_Axis_increase_adjust">
<Rect left="820" top="2534" right="920" bottom="2566"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="783" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="830" top="2864" right="930" bottom="2896"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="785" ActivityType="3" flags="0" name="init">
<Rect left="820" top="2614" right="920" bottom="2646"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="786" ActivityType="3" flags="0" name="endloop">
<Rect left="820" top="2804" right="920" bottom="2836"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="787" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="2804" right="786" bottom="2836"/>
</Activity>
<Activity id="788" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="820" top="2744" right="920" bottom="2776"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="550"/>
<Parameter id="LowerLimit" value="470"/>
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
<Activity id="789" ActivityType="3" flags="0" name="初始化">
<Rect left="820" top="2674" right="920" bottom="2706"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="790" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="2674" right="786" bottom="2706"/>
</Activity>
<Activity id="800" ActivityType="13" flags="0" name="Y_Axis_decrease_adjust">
<Rect left="1020" top="2474" right="1120" bottom="2506"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴减少"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x03\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="801" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="1020" top="2804" right="1120" bottom="2836"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x64\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="803" ActivityType="3" flags="0" name="init">
<Rect left="1020" top="2554" right="1120" bottom="2586"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="804" ActivityType="3" flags="0" name="endloop">
<Rect left="1020" top="2744" right="1120" bottom="2776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="805" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="2754" right="1006" bottom="2786"/>
</Activity>
<Activity id="806" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1020" top="2684" right="1120" bottom="2716"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="550"/>
<Parameter id="LowerLimit" value="470"/>
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
<Activity id="807" ActivityType="3" flags="0" name="初始化">
<Rect left="1020" top="2614" right="1120" bottom="2646"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="808" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="2614" right="1006" bottom="2646"/>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="Mirror_fold_automaticlly">
<Rect left="250" top="3094" right="350" bottom="3126"/>
<Line1Text Enable="1" Text="请确认外后视镜是打开状态"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="811" ActivityType="13" flags="0" name="Fold_automaticlly">
<Rect left="250" top="3184" right="350" bottom="3216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜折叠"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
<Activity id="812" ActivityType="4" flags="0" name="路由节点">
<Rect left="1054" top="3054" right="1086" bottom="3086"/>
</Activity>
<Activity id="813" ActivityType="3" flags="0" name="延时1500MS">
<Rect left="250" top="3244" right="350" bottom="3276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="814" ActivityType="3" flags="0" name="init">
<Rect left="250" top="3304" right="350" bottom="3336"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="815" ActivityType="13" flags="0" name="Read_status">
<Rect left="250" top="3414" right="350" bottom="3446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE3&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="816" ActivityType="3" flags="0" name="endloop">
<Rect left="250" top="3604" right="350" bottom="3636"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="817" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="3604" right="236" bottom="3636"/>
</Activity>
<Activity id="818" ActivityType="4" flags="0" name="路由节点">
<Rect left="199" top="3416" right="231" bottom="3448"/>
</Activity>
<Activity id="819" ActivityType="3" flags="0" name="截取字符串">
<Rect left="250" top="3474" right="350" bottom="3506"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="820" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="250" top="3534" right="350" bottom="3566"/>
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
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="821" ActivityType="13" flags="0" name="Open_automaticlly">
<Rect left="523" top="3143" right="623" bottom="3175"/>
<Line3Text Enable="1" Text="司机门倒车镜展开"/>
<Line4Text Enable="1"/>
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
<Activity id="822" ActivityType="3" flags="0" name="延时1500MS">
<Rect left="520" top="3194" right="620" bottom="3226"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="823" ActivityType="3" flags="0" name="init">
<Rect left="520" top="3254" right="620" bottom="3286"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="824" ActivityType="13" flags="0" name="Read_status">
<Rect left="520" top="3384" right="620" bottom="3416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE3&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="825" ActivityType="3" flags="0" name="endloop">
<Rect left="520" top="3594" right="620" bottom="3626"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="826" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="3594" right="496" bottom="3626"/>
</Activity>
<Activity id="827" ActivityType="4" flags="0" name="路由节点">
<Rect left="465" top="3379" right="497" bottom="3411"/>
</Activity>
<Activity id="828" ActivityType="3" flags="0" name="截取字符串">
<Rect left="520" top="3454" right="620" bottom="3486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="829" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="520" top="3514" right="620" bottom="3546"/>
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
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="830" ActivityType="13" flags="0" name="Mirror_fold_open_ReturnControlToECU">
<Rect left="693" top="3678" right="793" bottom="3710"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x65\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="834" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="3674" right="586" bottom="3706"/>
</Activity>
<Activity id="835" ActivityType="13" flags="0" name="Heating_Start">
<Rect left="1020" top="3674" right="1120" bottom="3706"/>
<Line3Text Enable="1" Text="司机门倒车镜开始加热"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x66\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="843" ActivityType="13" flags="0" name="Mirror_Heating_ReturnControlToECU">
<Rect left="1020" top="4144" right="1120" bottom="4176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x66\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="844" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="1020" top="3754" right="1120" bottom="3786"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="845" ActivityType="3" flags="0" name="init">
<Rect left="1020" top="3814" right="1120" bottom="3846"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="846" ActivityType="3" flags="0" name="endloop">
<Rect left="1020" top="4014" right="1120" bottom="4046"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="847" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="4014" right="976" bottom="4046"/>
</Activity>
<Activity id="848" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1020" top="3944" right="1120" bottom="3976"/>
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
<Parameter id="CType" value="3"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="888"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="849" ActivityType="3" flags="0" name="初始化">
<Rect left="1020" top="3874" right="1120" bottom="3906"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="850" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="3874" right="976" bottom="3906"/>
</Activity>
<Activity id="851" ActivityType="13" flags="0" name="Check_the_door_lock">
<Rect left="400" top="4144" right="500" bottom="4176"/>
<Line3Text Enable="1" Text="司机门门上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x60\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="852" ActivityType="3" flags="0" name="init">
<Rect left="400" top="4224" right="500" bottom="4256"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="853" ActivityType="13" flags="0" name="Read_status">
<Rect left="400" top="4354" right="500" bottom="4386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE6&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="854" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="4564" right="500" bottom="4596"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="855" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="4564" right="356" bottom="4596"/>
</Activity>
<Activity id="856" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="4294" right="356" bottom="4326"/>
</Activity>
<Activity id="857" ActivityType="3" flags="0" name="截取字符串">
<Rect left="400" top="4424" right="500" bottom="4456"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="858" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="4494" right="500" bottom="4526"/>
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
<Activity id="862" ActivityType="13" flags="0" name="TemplateTestLoop_Door_Unlock">
<Rect left="620" top="4234" right="720" bottom="4266"/>
<Line3Text Enable="1" Text="司机门门解锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x60\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="init">
<Rect left="620" top="4304" right="720" bottom="4336"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="864" ActivityType="13" flags="0" name="Read_status">
<Rect left="620" top="4464" right="720" bottom="4496"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE6&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="865" ActivityType="3" flags="0" name="endloop">
<Rect left="620" top="4664" right="720" bottom="4696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="866" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="4664" right="836" bottom="4696"/>
</Activity>
<Activity id="867" ActivityType="4" flags="0" name="路由节点">
<Rect left="798" top="4459" right="830" bottom="4491"/>
</Activity>
<Activity id="868" ActivityType="3" flags="0" name="截取字符串">
<Rect left="620" top="4524" right="720" bottom="4556"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="869" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="620" top="4584" right="720" bottom="4616"/>
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
<Activity id="870" ActivityType="13" flags="0" name="door_lock_ReturnControlToECU">
<Rect left="621" top="4734" right="721" bottom="4766"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x60\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="872" ActivityType="13" flags="0" name="Turn_Light_On">
<Rect left="1074" top="4809" right="1174" bottom="4841"/>
<Line3Text Enable="1" Text="司机门转向灯开启"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x62\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时500MS">
<Rect left="1223" top="5060" right="1323" bottom="5092"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="881" ActivityType="13" flags="0" name="Turn_Light_ReturnControlToECU">
<Rect left="1070" top="5324" right="1170" bottom="5356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x62\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="init">
<Rect left="1070" top="4990" right="1170" bottom="5022"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="885" ActivityType="3" flags="0" name="endloop">
<Rect left="1070" top="5180" right="1170" bottom="5212"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="886" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="5180" right="1026" bottom="5212"/>
</Activity>
<Activity id="887" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1070" top="5120" right="1170" bottom="5152"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="650"/>
<Parameter id="LowerLimit" value="550"/>
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
<Activity id="888" ActivityType="3" flags="0" name="初始化">
<Rect left="1070" top="5050" right="1170" bottom="5082"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="5043" right="1026" bottom="5075"/>
</Activity>
<Activity id="891" ActivityType="3" flags="0" name="Check_Mirror_Function_Switch_State">
<Rect left="250" top="5324" right="350" bottom="5356"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 L 位置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="892" ActivityType="3" flags="0" name="L">
<Rect left="250" top="5394" right="350" bottom="5426"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="893" ActivityType="13" flags="0" name="Read_status">
<Rect left="250" top="5534" right="350" bottom="5566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="endloop">
<Rect left="250" top="5744" right="350" bottom="5776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="5744" right="226" bottom="5776"/>
</Activity>
<Activity id="896" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="5464" right="226" bottom="5496"/>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="截取字符串">
<Rect left="250" top="5604" right="350" bottom="5636"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="250" top="5664" right="350" bottom="5696"/>
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
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="0">
<Rect left="250" top="5804" right="350" bottom="5836"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 0 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="900" ActivityType="13" flags="0" name="Read_status">
<Rect left="250" top="5944" right="350" bottom="5976"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="endloop">
<Rect left="250" top="6154" right="350" bottom="6186"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="902" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="6154" right="226" bottom="6186"/>
</Activity>
<Activity id="903" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="5864" right="226" bottom="5896"/>
</Activity>
<Activity id="904" ActivityType="3" flags="0" name="截取字符串">
<Rect left="250" top="6014" right="350" bottom="6046"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="905" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="250" top="6074" right="350" bottom="6106"/>
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
</Activity>
<Activity id="906" ActivityType="3" flags="0" name="R">
<Rect left="460" top="5394" right="560" bottom="5426"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 R 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="907" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="5534" right="560" bottom="5566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="5744" right="560" bottom="5776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="909" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="5744" right="666" bottom="5776"/>
</Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="5464" right="666" bottom="5496"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="5604" right="560" bottom="5636"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="912" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="5664" right="560" bottom="5696"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="H">
<Rect left="460" top="5814" right="560" bottom="5846"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到加热位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="914" ActivityType="13" flags="0" name="Read_status">
<Rect left="460" top="5954" right="560" bottom="5986"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="6164" right="560" bottom="6196"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="6164" right="446" bottom="6196"/>
</Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="5874" right="446" bottom="5906"/>
</Activity>
<Activity id="918" ActivityType="3" flags="0" name="截取字符串">
<Rect left="460" top="6014" right="560" bottom="6046"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="919" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="6074" right="560" bottom="6106"/>
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
<Activity id="920" ActivityType="3" flags="0" name="0">
<Rect left="760" top="5394" right="860" bottom="5426"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 0 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="921" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="5544" right="860" bottom="5576"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="922" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="5744" right="860" bottom="5776"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="923" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="5744" right="926" bottom="5776"/>
</Activity>
<Activity id="924" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="5464" right="926" bottom="5496"/>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="5604" right="860" bottom="5636"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="5664" right="860" bottom="5696"/>
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
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="F">
<Rect left="760" top="5814" right="860" bottom="5846"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到折叠位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="928" ActivityType="13" flags="0" name="Read_status">
<Rect left="760" top="5954" right="860" bottom="5986"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEE&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="929" ActivityType="3" flags="0" name="endloop">
<Rect left="760" top="6164" right="860" bottom="6196"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="930" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="6164" right="926" bottom="6196"/>
</Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="5884" right="926" bottom="5916"/>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="截取字符串">
<Rect left="760" top="6024" right="860" bottom="6056"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="933" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="760" top="6074" right="860" bottom="6106"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="934" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="760" top="6234" right="860" bottom="6266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="935" ActivityType="3" flags="0" name="init">
<Rect left="260" top="6324" right="360" bottom="6356"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="936" ActivityType="13" flags="0" name="Read_status">
<Rect left="260" top="6454" right="360" bottom="6486"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="937" ActivityType="3" flags="0" name="endloop">
<Rect left="260" top="6664" right="360" bottom="6696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="938" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="6664" right="236" bottom="6696"/>
</Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="6394" right="236" bottom="6426"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="截取字符串">
<Rect left="260" top="6524" right="360" bottom="6556"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="260" top="6574" right="360" bottom="6606"/>
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
<Activity id="942" ActivityType="3" flags="0" name="init">
<Rect left="260" top="6714" right="360" bottom="6746"/>
<Line2Text Enable="1" Text="后视镜方向调整右方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="943" ActivityType="13" flags="0" name="Read_status">
<Rect left="260" top="6834" right="360" bottom="6866"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="260" top="7044" right="360" bottom="7076"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="7044" right="236" bottom="7076"/>
</Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="6774" right="236" bottom="6806"/>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="截取字符串">
<Rect left="260" top="6904" right="360" bottom="6936"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="260" top="6964" right="360" bottom="6996"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="Check_Rearview_Mirror_Direction_adjust_switch_State">
<Rect left="260" top="6234" right="360" bottom="6266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="后视镜方向调整左方向按键按下"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="950" ActivityType="3" flags="0" name="init">
<Rect left="620" top="6334" right="720" bottom="6366"/>
<Line2Text Enable="1" Text="后视镜方向调整上方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="951" ActivityType="13" flags="0" name="Read_status">
<Rect left="620" top="6454" right="720" bottom="6486"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="endloop">
<Rect left="620" top="6664" right="720" bottom="6696"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="953" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="6664" right="836" bottom="6696"/>
</Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="6394" right="836" bottom="6426"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="截取字符串">
<Rect left="620" top="6524" right="720" bottom="6556"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="956" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="620" top="6584" right="720" bottom="6616"/>
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
</Activity>
<Activity id="957" ActivityType="3" flags="0" name="init">
<Rect left="620" top="6714" right="720" bottom="6746"/>
<Line2Text Enable="1" Text="后视镜方向调整下方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="958" ActivityType="13" flags="0" name="Read_status">
<Rect left="620" top="6834" right="720" bottom="6866"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="620" top="7044" right="720" bottom="7076"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="7044" right="866" bottom="7076"/>
</Activity>
<Activity id="961" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="6774" right="866" bottom="6806"/>
</Activity>
<Activity id="962" ActivityType="3" flags="0" name="截取字符串">
<Rect left="620" top="6904" right="720" bottom="6936"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="963" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="620" top="6964" right="720" bottom="6996"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="964" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="620" top="7114" right="720" bottom="7146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="975" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="830" top="7184" right="930" bottom="7216"/>
<Line1Text Enable="1" Text="司机门玻璃下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="990" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="830" top="7514" right="930" bottom="7546"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="991" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="1110" top="7644" right="1210" bottom="7676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="993" ActivityType="3" flags="0" name="init">
<Rect left="830" top="7254" right="930" bottom="7286"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="994" ActivityType="3" flags="0" name="endloop">
<Rect left="830" top="7444" right="930" bottom="7476"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="995" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="7444" right="786" bottom="7476"/>
</Activity>
<Activity id="996" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="830" top="7384" right="930" bottom="7416"/>
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
<Activity id="997" ActivityType="3" flags="0" name="初始化">
<Rect left="830" top="7314" right="930" bottom="7346"/>
<Script>DFloat_Mts3Result = (engine.df_door_i)  /1000</Script></Activity>
<Activity id="998" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="7314" right="786" bottom="7346"/>
</Activity>
<Activity id="1007" ActivityType="13" flags="0" name="Window_up">
<Rect left="1110" top="7184" right="1210" bottom="7216"/>
<Line1Text Enable="1" Text="司机门玻璃上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1008" ActivityType="3" flags="0" name="init">
<Rect left="1110" top="7264" right="1210" bottom="7296"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1009" ActivityType="3" flags="0" name="endloop">
<Rect left="1110" top="7454" right="1210" bottom="7486"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1010" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="7454" right="1266" bottom="7486"/>
</Activity>
<Activity id="1011" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="1110" top="7394" right="1210" bottom="7426"/>
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
<Activity id="1012" ActivityType="3" flags="0" name="初始化">
<Rect left="1110" top="7324" right="1210" bottom="7356"/>
<Script>DFloat_Mts3Result = (engine.df_door_i)  /1000</Script></Activity>
<Activity id="1013" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="7324" right="1266" bottom="7356"/>
</Activity>
<Activity id="1014" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="1110" top="7514" right="1210" bottom="7546"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1015" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="210" top="7644" right="310" bottom="7676"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="1016" ActivityType="3" flags="0" name="init">
<Rect left="210" top="7704" right="310" bottom="7736"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1017" ActivityType="13" flags="0" name="Read_status">
<Rect left="210" top="7844" right="310" bottom="7876"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1018" ActivityType="3" flags="0" name="endloop">
<Rect left="210" top="8044" right="310" bottom="8076"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1019" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="8044" right="146" bottom="8076"/>
</Activity>
<Activity id="1020" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="7774" right="146" bottom="7806"/>
</Activity>
<Activity id="1021" ActivityType="3" flags="0" name="截取字符串">
<Rect left="210" top="7904" right="310" bottom="7936"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1022" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="210" top="7964" right="310" bottom="7996"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1023" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="210" top="8114" right="310" bottom="8146"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="1024" ActivityType="3" flags="0" name="init">
<Rect left="210" top="8174" right="310" bottom="8206"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1025" ActivityType="13" flags="0" name="Read_status">
<Rect left="210" top="8304" right="310" bottom="8336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1026" ActivityType="3" flags="0" name="endloop">
<Rect left="210" top="8514" right="310" bottom="8546"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1027" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="8514" right="146" bottom="8546"/>
</Activity>
<Activity id="1028" ActivityType="4" flags="0" name="路由节点">
<Rect left="114" top="8244" right="146" bottom="8276"/>
</Activity>
<Activity id="1029" ActivityType="3" flags="0" name="截取字符串">
<Rect left="210" top="8374" right="310" bottom="8406"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1030" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="210" top="8434" right="310" bottom="8466"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1031" ActivityType="3" flags="0" name="init">
<Rect left="490" top="7714" right="590" bottom="7746"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1032" ActivityType="13" flags="0" name="Read_status">
<Rect left="490" top="7854" right="590" bottom="7886"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1033" ActivityType="3" flags="0" name="endloop">
<Rect left="490" top="8064" right="590" bottom="8096"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1034" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="8064" right="686" bottom="8096"/>
</Activity>
<Activity id="1035" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="7784" right="686" bottom="7816"/>
</Activity>
<Activity id="1036" ActivityType="3" flags="0" name="截取字符串">
<Rect left="490" top="7924" right="590" bottom="7956"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1037" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="490" top="7984" right="590" bottom="8016"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1038" ActivityType="3" flags="0" name="init">
<Rect left="490" top="8154" right="590" bottom="8186"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1039" ActivityType="13" flags="0" name="Read_status">
<Rect left="490" top="8284" right="590" bottom="8316"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE9&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1040" ActivityType="3" flags="0" name="endloop">
<Rect left="490" top="8494" right="590" bottom="8526"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1041" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="8494" right="696" bottom="8526"/>
</Activity>
<Activity id="1042" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="8224" right="696" bottom="8256"/>
</Activity>
<Activity id="1043" ActivityType="3" flags="0" name="截取字符串">
<Rect left="490" top="8354" right="590" bottom="8386"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1044" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="490" top="8414" right="590" bottom="8446"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1051" ActivityType="3" flags="0" name="Passenger_Window_Down">
<Rect left="810" top="8564" right="910" bottom="8596"/>
<Script></Script></Activity>
<Activity id="1052" ActivityType="3" flags="0" name="init">
<Rect left="810" top="8644" right="910" bottom="8676"/>
<Line2Text Enable="1" Text="乘客门玻璃降 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1053" ActivityType="13" flags="0" name="Read_status">
<Rect left="810" top="8774" right="910" bottom="8806"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1054" ActivityType="3" flags="0" name="endloop">
<Rect left="810" top="8974" right="910" bottom="9006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1055" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="8974" right="796" bottom="9006"/>
</Activity>
<Activity id="1056" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="8714" right="796" bottom="8746"/>
</Activity>
<Activity id="1057" ActivityType="3" flags="0" name="截取字符串">
<Rect left="810" top="8834" right="910" bottom="8866"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1058" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="810" top="8894" right="910" bottom="8926"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1059" ActivityType="3" flags="0" name="init">
<Rect left="810" top="9044" right="910" bottom="9076"/>
<Line2Text Enable="1" Text="乘客门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1060" ActivityType="13" flags="0" name="Read_status">
<Rect left="810" top="9164" right="910" bottom="9196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1061" ActivityType="3" flags="0" name="endloop">
<Rect left="810" top="9374" right="910" bottom="9406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1062" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="9384" right="776" bottom="9416"/>
</Activity>
<Activity id="1063" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="9104" right="776" bottom="9136"/>
</Activity>
<Activity id="1064" ActivityType="3" flags="0" name="截取字符串">
<Rect left="810" top="9234" right="910" bottom="9266"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1065" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="810" top="9294" right="910" bottom="9326"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1066" ActivityType="3" flags="0" name="init">
<Rect left="1100" top="8654" right="1200" bottom="8686"/>
<Line2Text Enable="1" Text="乘客门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1067" ActivityType="13" flags="0" name="Read_status">
<Rect left="1100" top="8784" right="1200" bottom="8816"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1068" ActivityType="3" flags="0" name="endloop">
<Rect left="1100" top="8994" right="1200" bottom="9026"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1069" ActivityType="4" flags="0" name="路由节点">
<Rect left="1274" top="8994" right="1306" bottom="9026"/>
</Activity>
<Activity id="1070" ActivityType="4" flags="0" name="路由节点">
<Rect left="1274" top="8724" right="1306" bottom="8756"/>
</Activity>
<Activity id="1071" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1100" top="8854" right="1200" bottom="8886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1072" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1100" top="8914" right="1200" bottom="8946"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1073" ActivityType="3" flags="0" name="init">
<Rect left="1100" top="9054" right="1200" bottom="9086"/>
<Line2Text Enable="1" Text="乘客门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1074" ActivityType="13" flags="0" name="Read_status">
<Rect left="1100" top="9164" right="1200" bottom="9196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEA&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1075" ActivityType="3" flags="0" name="endloop">
<Rect left="1100" top="9374" right="1200" bottom="9406"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1076" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="9374" right="1346" bottom="9406"/>
</Activity>
<Activity id="1077" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="9104" right="1336" bottom="9136"/>
</Activity>
<Activity id="1078" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1100" top="9234" right="1200" bottom="9266"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1079" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1100" top="9294" right="1200" bottom="9326"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1080" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="9444" right="1166" bottom="9476"/>
</Activity>
<Activity id="1085" ActivityType="3" flags="0" name="RL_Window_Down">
<Rect left="130" top="9454" right="230" bottom="9486"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="1086" ActivityType="3" flags="0" name="init">
<Rect left="130" top="9544" right="230" bottom="9576"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1087" ActivityType="13" flags="0" name="Read_status">
<Rect left="130" top="9664" right="230" bottom="9696"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1088" ActivityType="3" flags="0" name="endloop">
<Rect left="130" top="9874" right="230" bottom="9906"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1089" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="9874" right="106" bottom="9906"/>
</Activity>
<Activity id="1090" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="9604" right="106" bottom="9636"/>
</Activity>
<Activity id="1091" ActivityType="3" flags="0" name="截取字符串">
<Rect left="130" top="9734" right="230" bottom="9766"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1092" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="130" top="9794" right="230" bottom="9826"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1093" ActivityType="3" flags="0" name="init">
<Rect left="130" top="9954" right="230" bottom="9986"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1094" ActivityType="13" flags="0" name="Read_status">
<Rect left="130" top="10084" right="230" bottom="10116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1095" ActivityType="3" flags="0" name="endloop">
<Rect left="130" top="10294" right="230" bottom="10326"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1096" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="10304" right="96" bottom="10336"/>
</Activity>
<Activity id="1097" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="10014" right="86" bottom="10046"/>
</Activity>
<Activity id="1098" ActivityType="3" flags="0" name="截取字符串">
<Rect left="130" top="10154" right="230" bottom="10186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1099" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="130" top="10214" right="230" bottom="10246"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1100" ActivityType="3" flags="0" name="init">
<Rect left="420" top="9544" right="520" bottom="9576"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1101" ActivityType="13" flags="0" name="Read_status">
<Rect left="420" top="9674" right="520" bottom="9706"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1102" ActivityType="3" flags="0" name="endloop">
<Rect left="420" top="9884" right="520" bottom="9916"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1103" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="9884" right="596" bottom="9916"/>
</Activity>
<Activity id="1104" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="9614" right="596" bottom="9646"/>
</Activity>
<Activity id="1105" ActivityType="3" flags="0" name="截取字符串">
<Rect left="420" top="9744" right="520" bottom="9776"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1106" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="420" top="9804" right="520" bottom="9836"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1107" ActivityType="3" flags="0" name="init">
<Rect left="420" top="9954" right="520" bottom="9986"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1108" ActivityType="13" flags="0" name="Read_status">
<Rect left="420" top="10084" right="520" bottom="10116"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEB&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1109" ActivityType="3" flags="0" name="endloop">
<Rect left="420" top="10294" right="520" bottom="10326"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1110" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="10294" right="626" bottom="10326"/>
</Activity>
<Activity id="1111" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="10014" right="626" bottom="10046"/>
</Activity>
<Activity id="1112" ActivityType="3" flags="0" name="截取字符串">
<Rect left="420" top="10154" right="520" bottom="10186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1113" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="420" top="10204" right="520" bottom="10236"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1114" ActivityType="4" flags="0" name="路由节点">
<Rect left="454" top="10364" right="486" bottom="10396"/>
</Activity>
<Activity id="1119" ActivityType="3" flags="0" name="RR_Window_Down">
<Rect left="700" top="10364" right="800" bottom="10396"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="1120" ActivityType="3" flags="0" name="init">
<Rect left="700" top="10454" right="800" bottom="10486"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1121" ActivityType="13" flags="0" name="Read_status">
<Rect left="700" top="10574" right="800" bottom="10606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1122" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="10784" right="800" bottom="10816"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1123" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="10784" right="646" bottom="10816"/>
</Activity>
<Activity id="1124" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="10514" right="646" bottom="10546"/>
</Activity>
<Activity id="1125" ActivityType="3" flags="0" name="截取字符串">
<Rect left="700" top="10644" right="800" bottom="10676"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1126" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="700" top="10704" right="800" bottom="10736"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1127" ActivityType="3" flags="0" name="init">
<Rect left="700" top="10864" right="800" bottom="10896"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1128" ActivityType="13" flags="0" name="Read_status">
<Rect left="700" top="10994" right="800" bottom="11026"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1129" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="11204" right="800" bottom="11236"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1130" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="11204" right="666" bottom="11236"/>
</Activity>
<Activity id="1131" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="10924" right="666" bottom="10956"/>
</Activity>
<Activity id="1132" ActivityType="3" flags="0" name="截取字符串">
<Rect left="700" top="11064" right="800" bottom="11096"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1133" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="700" top="11124" right="800" bottom="11156"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1134" ActivityType="3" flags="0" name="init">
<Rect left="980" top="10454" right="1080" bottom="10486"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1135" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="10584" right="1080" bottom="10616"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1136" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="10794" right="1080" bottom="10826"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1137" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="10794" right="1186" bottom="10826"/>
</Activity>
<Activity id="1138" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="10524" right="1186" bottom="10556"/>
</Activity>
<Activity id="1139" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="10654" right="1080" bottom="10686"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1140" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="10714" right="1080" bottom="10746"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1141" ActivityType="3" flags="0" name="init">
<Rect left="980" top="10864" right="1080" bottom="10896"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1142" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="10994" right="1080" bottom="11026"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xEC&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1143" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="11204" right="1080" bottom="11236"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1144" top="11204" right="1176" bottom="11236"/>
</Activity>
<Activity id="1145" ActivityType="4" flags="0" name="路由节点">
<Rect left="1144" top="10924" right="1176" bottom="10956"/>
</Activity>
<Activity id="1146" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="11054" right="1080" bottom="11086"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1147" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="11124" right="1080" bottom="11156"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1152" ActivityType="3" flags="0" name="Seat_Memory_Switch1">
<Rect left="980" top="11354" right="1080" bottom="11386"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="按司机门座椅记忆开关1"/>
<Script></Script></Activity>
<Activity id="1153" ActivityType="3" flags="0" name="init">
<Rect left="980" top="11414" right="1080" bottom="11446"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1154" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="11564" right="1080" bottom="11596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x19&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1155" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="11764" right="1080" bottom="11796"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1156" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="11764" right="1186" bottom="11796"/>
</Activity>
<Activity id="1157" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="11494" right="1186" bottom="11526"/>
</Activity>
<Activity id="1158" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="11624" right="1080" bottom="11656"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1159" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="11694" right="1080" bottom="11726"/>
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
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1160" ActivityType="3" flags="0" name="Check_Central_Lock">
<Rect left="980" top="12894" right="1080" bottom="12926"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="按下中控锁 锁车键"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="1161" ActivityType="3" flags="0" name="init">
<Rect left="980" top="12944" right="1080" bottom="12976"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1162" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="13074" right="1080" bottom="13106"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE8&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1163" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="13284" right="1080" bottom="13316"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1164" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="13284" right="1216" bottom="13316"/>
</Activity>
<Activity id="1165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="13004" right="1216" bottom="13036"/>
</Activity>
<Activity id="1166" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="13144" right="1080" bottom="13176"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1167" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="13204" right="1080" bottom="13236"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1168" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="12834" right="1046" bottom="12866"/>
</Activity>
<Activity id="1169" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="980" top="13364" right="1080" bottom="13396"/>
<Line2Text Enable="1" Text="按下中控锁 解锁键"/>
<Script></Script></Activity>
<Activity id="1170" ActivityType="3" flags="0" name="init">
<Rect left="980" top="13434" right="1080" bottom="13466"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1171" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="13574" right="1080" bottom="13606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x3C\xE8&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1172" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="13784" right="1080" bottom="13816"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1173" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="13784" right="1246" bottom="13816"/>
</Activity>
<Activity id="1174" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="13504" right="1246" bottom="13536"/>
</Activity>
<Activity id="1175" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="13644" right="1080" bottom="13676"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1176" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="13694" right="1080" bottom="13726"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1177" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="980" top="13854" right="1080" bottom="13886"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1178" ActivityType="3" flags="0" name="普通节点">
<Rect left="400" top="11354" right="500" bottom="11386"/>
<Script></Script></Activity>
<Activity id="1179" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="980" top="11494" right="1080" bottom="11526"/>
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
<Activity id="1180" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="400" top="13854" right="500" bottom="13886"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1181" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="12834" right="466" bottom="12866"/>
</Activity>
<Activity id="1182" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="980" top="13004" right="1080" bottom="13036"/>
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
<Activity id="1183" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="980" top="13504" right="1080" bottom="13536"/>
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
<Activity id="1184" ActivityType="3" flags="0" name="init">
<Rect left="400" top="13924" right="500" bottom="13956"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1185" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="14114" right="500" bottom="14146"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1186" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="14114" right="366" bottom="14146"/>
</Activity>
<Activity id="1187" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="400" top="14054" right="500" bottom="14086"/>
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
<Activity id="1188" ActivityType="3" flags="0" name="初始化">
<Rect left="400" top="13984" right="500" bottom="14016"/>
<Script>DFloat_Mts3Result = engine.df_door_i </Script></Activity>
<Activity id="1189" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="13984" right="366" bottom="14016"/>
</Activity>
<Activity id="1190" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="400" top="14184" right="500" bottom="14216"/>
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
<Activity id="1192" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="14404" right="466" bottom="14436"/>
</Activity>
<Activity id="1193" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="510" top="14404" right="610" bottom="14436"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11B3-00,B11B4-00,B11CF-00,B11D0-00,B11D1-00,B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1194" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="400" top="14524" right="500" bottom="14556"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DDCU&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1195" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="400" top="14474" right="500" bottom="14506"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2201-00,U2202-00,U2203-00,U2206-00,U2207-00,U0141-00,U1008-00,U0200-00,U0201-00,U0202-00,U0208-00,U0146-00,U2204-00,U2205-00,U220D-00,B11D3-00,B11C8-00,B11C9-00,B11CA-00,B11CB-00,B11D2-00,B11D7-00,B11D9-00,}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1196" ActivityType="3" flags="0" name="读DTC">
<Rect left="400" top="14334" right="500" bottom="14366"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes); </Script></Activity>
<Activity id="1197" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="400" top="14594" right="500" bottom="14626"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1198" ActivityType="3" flags="0" name="Seat_Memory_Switch2">
<Rect left="980" top="11854" right="1080" bottom="11886"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="按司机门座椅记忆开关2"/>
<Script></Script></Activity>
<Activity id="1199" ActivityType="3" flags="0" name="init">
<Rect left="980" top="11914" right="1080" bottom="11946"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1200" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="12064" right="1080" bottom="12096"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1A&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1201" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="12264" right="1080" bottom="12296"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1202" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="12264" right="1226" bottom="12296"/>
</Activity>
<Activity id="1203" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="11994" right="1226" bottom="12026"/>
</Activity>
<Activity id="1204" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="12124" right="1080" bottom="12156"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1205" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="12194" right="1080" bottom="12226"/>
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
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1206" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="980" top="11994" right="1080" bottom="12026"/>
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
<Activity id="1207" ActivityType="3" flags="0" name="Seat_Memory_Switch3">
<Rect left="980" top="12354" right="1080" bottom="12386"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="按司机门座椅记忆开关3"/>
<Script></Script></Activity>
<Activity id="1208" ActivityType="3" flags="0" name="init">
<Rect left="980" top="12414" right="1080" bottom="12446"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1209" ActivityType="13" flags="0" name="Read_status">
<Rect left="980" top="12564" right="1080" bottom="12596"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1B&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1210" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="12764" right="1080" bottom="12796"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1211" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="12764" right="1256" bottom="12796"/>
</Activity>
<Activity id="1212" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="12494" right="1256" bottom="12526"/>
</Activity>
<Activity id="1213" ActivityType="3" flags="0" name="截取字符串">
<Rect left="980" top="12624" right="1080" bottom="12656"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1214" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="12694" right="1080" bottom="12726"/>
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
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1215" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="980" top="12494" right="1080" bottom="12526"/>
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
<Activity id="1259" ActivityType="3" flags="0" name="普通节点">
<Rect left="413" top="29" right="513" bottom="61"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x03\x3E\x00\x80\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1260" ActivityType="3" flags="0" name="维持信号">
<Rect left="455" top="1019" right="555" bottom="1051"/>
<Script>engine.registerPacket(0,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1261" ActivityType="3" flags="0" name="延时300MS">
<Rect left="867" top="3683" right="967" bottom="3715"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1262" ActivityType="3" flags="0" name="延时500MS">
<Rect left="739" top="5092" right="839" bottom="5124"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="1263" ActivityType="3" flags="0" name="延时500MS">
<Rect left="971" top="7330" right="1071" bottom="7362"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="1264" ActivityType="3" flags="0" name="延时300MS">
<Rect left="441" top="2778" right="541" bottom="2810"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1265" ActivityType="3" flags="0" name="延时300MS">
<Rect left="675" top="2694" right="775" bottom="2726"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1266" ActivityType="3" flags="0" name="延时300MS">
<Rect left="896" top="2603" right="996" bottom="2635"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="20" type="0">
</Transition>
<Transition StartId="5" EndId="10" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="0">
</Transition>
<Transition StartId="6" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="9" EndId="715" type="0">
</Transition>
<Transition StartId="10" EndId="6" type="4">
</Transition>
<Transition StartId="10" EndId="705" type="0">
</Transition>
<Transition StartId="20" EndId="5" type="0">
</Transition>
<Transition StartId="705" EndId="706" type="0">
</Transition>
<Transition StartId="706" EndId="707" type="0">
</Transition>
<Transition StartId="707" EndId="714" type="0">
</Transition>
<Transition StartId="708" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="712" type="0">
</Transition>
<Transition StartId="710" EndId="711" type="6">
</Transition>
<Transition StartId="710" EndId="715" type="5">
</Transition>
<Transition StartId="711" EndId="708" type="0">
</Transition>
<Transition StartId="712" EndId="713" type="0">
</Transition>
<Transition StartId="712" EndId="710" type="4">
</Transition>
<Transition StartId="713" EndId="718" type="0">
</Transition>
<Transition StartId="714" EndId="708" type="0">
</Transition>
<Transition StartId="716" EndId="1260" type="0">
</Transition>
<Transition StartId="717" EndId="722" type="0">
</Transition>
<Transition StartId="718" EndId="716" type="0">
</Transition>
<Transition StartId="722" EndId="731" type="0">
</Transition>
<Transition StartId="723" EndId="724" type="0">
</Transition>
<Transition StartId="724" EndId="725" type="0">
</Transition>
<Transition StartId="725" EndId="726" type="0">
</Transition>
<Transition StartId="726" EndId="727" type="0">
</Transition>
<Transition StartId="727" EndId="728" type="0">
</Transition>
<Transition StartId="728" EndId="729" type="0">
</Transition>
<Transition StartId="729" EndId="730" type="0">
</Transition>
<Transition StartId="730" EndId="732" type="0">
</Transition>
<Transition StartId="731" EndId="723" type="0">
</Transition>
<Transition StartId="732" EndId="733" type="0">
</Transition>
<Transition StartId="733" EndId="740" type="0">
</Transition>
<Transition StartId="734" EndId="735" type="0">
</Transition>
<Transition StartId="735" EndId="739" type="0">
</Transition>
<Transition StartId="736" EndId="737" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="736" EndId="741" type="0">
</Transition>
<Transition StartId="737" EndId="738" type="0">
</Transition>
<Transition StartId="738" EndId="740" type="0">
</Transition>
<Transition StartId="739" EndId="736" type="0">
</Transition>
<Transition StartId="740" EndId="734" type="0">
</Transition>
<Transition StartId="741" EndId="742" type="0">
</Transition>
<Transition StartId="742" EndId="752" type="0">
</Transition>
<Transition StartId="743" EndId="750" type="0">
</Transition>
<Transition StartId="744" EndId="745" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="744" EndId="749" type="0">
</Transition>
<Transition StartId="745" EndId="746" type="0">
</Transition>
<Transition StartId="746" EndId="752" type="0">
</Transition>
<Transition StartId="747" EndId="748" type="0">
</Transition>
<Transition StartId="748" EndId="753" type="0">
</Transition>
<Transition StartId="749" EndId="747" type="1">
<Expression>DString_C131_Car_Tpye~="CH1GM30" or  DString_C131_Car_Tpye~="CH1GM41"  or  DString_C131_Car_Tpye~="CH1GM42" </Expression></Transition>
<Transition StartId="749" EndId="748" type="0">
</Transition>
<Transition StartId="750" EndId="751" type="0">
</Transition>
<Transition StartId="751" EndId="744" type="0">
</Transition>
<Transition StartId="752" EndId="743" type="0">
</Transition>
<Transition StartId="753" EndId="754" type="0">
</Transition>
<Transition StartId="754" EndId="758" type="0">
</Transition>
<Transition StartId="755" EndId="756" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="755" EndId="760" type="0">
</Transition>
<Transition StartId="756" EndId="759" type="0">
</Transition>
<Transition StartId="757" EndId="755" type="0">
</Transition>
<Transition StartId="758" EndId="757" type="0">
</Transition>
<Transition StartId="759" EndId="758" type="0">
</Transition>
<Transition StartId="760" EndId="761" type="0">
</Transition>
<Transition StartId="761" EndId="765" type="0">
</Transition>
<Transition StartId="762" EndId="1264" type="0">
</Transition>
<Transition StartId="765" EndId="769" type="0">
</Transition>
<Transition StartId="766" EndId="767" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="766" EndId="762" type="0">
</Transition>
<Transition StartId="767" EndId="770" type="0">
</Transition>
<Transition StartId="768" EndId="766" type="0">
</Transition>
<Transition StartId="769" EndId="768" type="0">
</Transition>
<Transition StartId="770" EndId="769" type="0">
</Transition>
<Transition StartId="772" EndId="776" type="0">
</Transition>
<Transition StartId="773" EndId="1265" type="0">
</Transition>
<Transition StartId="776" EndId="780" type="0">
</Transition>
<Transition StartId="777" EndId="778" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="777" EndId="773" type="0">
</Transition>
<Transition StartId="778" EndId="781" type="0">
</Transition>
<Transition StartId="779" EndId="777" type="0">
</Transition>
<Transition StartId="780" EndId="779" type="0">
</Transition>
<Transition StartId="781" EndId="780" type="0">
</Transition>
<Transition StartId="782" EndId="785" type="0">
</Transition>
<Transition StartId="783" EndId="1266" type="0">
</Transition>
<Transition StartId="785" EndId="789" type="0">
</Transition>
<Transition StartId="786" EndId="787" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="786" EndId="783" type="0">
</Transition>
<Transition StartId="787" EndId="790" type="0">
</Transition>
<Transition StartId="788" EndId="786" type="0">
</Transition>
<Transition StartId="789" EndId="788" type="0">
</Transition>
<Transition StartId="790" EndId="789" type="0">
</Transition>
<Transition StartId="800" EndId="803" type="0">
</Transition>
<Transition StartId="801" EndId="810" type="0">
</Transition>
<Transition StartId="803" EndId="807" type="0">
</Transition>
<Transition StartId="804" EndId="805" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="804" EndId="801" type="0">
</Transition>
<Transition StartId="805" EndId="808" type="0">
</Transition>
<Transition StartId="806" EndId="804" type="0">
</Transition>
<Transition StartId="807" EndId="806" type="0">
</Transition>
<Transition StartId="808" EndId="807" type="0">
</Transition>
<Transition StartId="810" EndId="811" type="0">
</Transition>
<Transition StartId="811" EndId="813" type="0">
</Transition>
<Transition StartId="812" EndId="810" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11" and DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42"</Expression></Transition>
<Transition StartId="812" EndId="835" type="0">
</Transition>
<Transition StartId="813" EndId="814" type="0">
</Transition>
<Transition StartId="814" EndId="815" type="0">
</Transition>
<Transition StartId="815" EndId="819" type="0">
</Transition>
<Transition StartId="816" EndId="817" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="816" EndId="821" type="0">
</Transition>
<Transition StartId="817" EndId="818" type="0">
</Transition>
<Transition StartId="818" EndId="815" type="0">
</Transition>
<Transition StartId="819" EndId="820" type="0">
</Transition>
<Transition StartId="820" EndId="816" type="0">
</Transition>
<Transition StartId="821" EndId="822" type="0">
</Transition>
<Transition StartId="822" EndId="823" type="0">
</Transition>
<Transition StartId="823" EndId="824" type="0">
</Transition>
<Transition StartId="824" EndId="828" type="0">
</Transition>
<Transition StartId="825" EndId="826" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="825" EndId="834" type="0">
</Transition>
<Transition StartId="825" EndId="1261" type="0">
</Transition>
<Transition StartId="826" EndId="827" type="0">
</Transition>
<Transition StartId="827" EndId="824" type="0">
</Transition>
<Transition StartId="828" EndId="829" type="0">
</Transition>
<Transition StartId="829" EndId="825" type="0">
</Transition>
<Transition StartId="830" EndId="1261" type="0">
</Transition>
<Transition StartId="834" EndId="830" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="835" EndId="844" type="0">
</Transition>
<Transition StartId="843" EndId="851" type="0">
</Transition>
<Transition StartId="844" EndId="845" type="0">
</Transition>
<Transition StartId="845" EndId="849" type="0">
</Transition>
<Transition StartId="846" EndId="847" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="846" EndId="843" type="0">
</Transition>
<Transition StartId="847" EndId="850" type="0">
</Transition>
<Transition StartId="848" EndId="846" type="0">
</Transition>
<Transition StartId="849" EndId="848" type="0">
</Transition>
<Transition StartId="850" EndId="849" type="0">
</Transition>
<Transition StartId="851" EndId="852" type="0">
</Transition>
<Transition StartId="852" EndId="853" type="0">
</Transition>
<Transition StartId="853" EndId="857" type="0">
</Transition>
<Transition StartId="854" EndId="855" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="854" EndId="862" type="0">
</Transition>
<Transition StartId="855" EndId="856" type="0">
</Transition>
<Transition StartId="856" EndId="853" type="0">
</Transition>
<Transition StartId="857" EndId="858" type="0">
</Transition>
<Transition StartId="858" EndId="854" type="0">
</Transition>
<Transition StartId="862" EndId="863" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="868" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="865" EndId="870" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="867" EndId="864" type="0">
</Transition>
<Transition StartId="868" EndId="869" type="0">
</Transition>
<Transition StartId="869" EndId="865" type="0">
</Transition>
<Transition StartId="870" EndId="872" type="0">
</Transition>
<Transition StartId="872" EndId="884" type="0">
</Transition>
<Transition StartId="881" EndId="891" type="0">
</Transition>
<Transition StartId="884" EndId="888" type="0">
</Transition>
<Transition StartId="885" EndId="886" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="885" EndId="881" type="0">
</Transition>
<Transition StartId="886" EndId="889" type="0">
</Transition>
<Transition StartId="887" EndId="885" type="0">
</Transition>
<Transition StartId="888" EndId="887" type="0">
</Transition>
<Transition StartId="889" EndId="888" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="893" EndId="897" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="894" EndId="899" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="0">
</Transition>
<Transition StartId="896" EndId="893" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="898" EndId="894" type="0">
</Transition>
<Transition StartId="899" EndId="900" type="0">
</Transition>
<Transition StartId="900" EndId="904" type="0">
</Transition>
<Transition StartId="901" EndId="902" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="901" EndId="906" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="0">
</Transition>
<Transition StartId="903" EndId="900" type="0">
</Transition>
<Transition StartId="904" EndId="905" type="0">
</Transition>
<Transition StartId="905" EndId="901" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="911" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="908" EndId="913" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="0">
</Transition>
<Transition StartId="910" EndId="907" type="0">
</Transition>
<Transition StartId="911" EndId="912" type="0">
</Transition>
<Transition StartId="912" EndId="908" type="0">
</Transition>
<Transition StartId="913" EndId="914" type="0">
</Transition>
<Transition StartId="914" EndId="918" type="0">
</Transition>
<Transition StartId="915" EndId="916" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="915" EndId="920" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="0">
</Transition>
<Transition StartId="917" EndId="914" type="0">
</Transition>
<Transition StartId="918" EndId="919" type="0">
</Transition>
<Transition StartId="919" EndId="915" type="0">
</Transition>
<Transition StartId="920" EndId="921" type="0">
</Transition>
<Transition StartId="921" EndId="925" type="0">
</Transition>
<Transition StartId="922" EndId="923" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="922" EndId="927" type="0">
</Transition>
<Transition StartId="923" EndId="924" type="0">
</Transition>
<Transition StartId="924" EndId="921" type="0">
</Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="922" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="0">
</Transition>
<Transition StartId="928" EndId="932" type="0">
</Transition>
<Transition StartId="929" EndId="930" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="929" EndId="934" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="928" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="929" type="0">
</Transition>
<Transition StartId="934" EndId="949" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="0">
</Transition>
<Transition StartId="936" EndId="940" type="0">
</Transition>
<Transition StartId="937" EndId="938" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="937" EndId="942" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="936" type="0">
</Transition>
<Transition StartId="940" EndId="941" type="0">
</Transition>
<Transition StartId="941" EndId="937" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="0">
</Transition>
<Transition StartId="943" EndId="947" type="0">
</Transition>
<Transition StartId="944" EndId="945" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="944" EndId="950" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="943" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="944" type="0">
</Transition>
<Transition StartId="949" EndId="935" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="955" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="952" EndId="957" type="0">
</Transition>
<Transition StartId="953" EndId="954" type="0">
</Transition>
<Transition StartId="954" EndId="951" type="0">
</Transition>
<Transition StartId="955" EndId="956" type="0">
</Transition>
<Transition StartId="956" EndId="952" type="0">
</Transition>
<Transition StartId="957" EndId="958" type="0">
</Transition>
<Transition StartId="958" EndId="962" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="959" EndId="964" type="0">
</Transition>
<Transition StartId="960" EndId="961" type="0">
</Transition>
<Transition StartId="961" EndId="958" type="0">
</Transition>
<Transition StartId="962" EndId="963" type="0">
</Transition>
<Transition StartId="963" EndId="959" type="0">
</Transition>
<Transition StartId="964" EndId="975" type="0">
</Transition>
<Transition StartId="975" EndId="993" type="0">
</Transition>
<Transition StartId="990" EndId="1263" type="0">
</Transition>
<Transition StartId="991" EndId="1015" type="0">
</Transition>
<Transition StartId="993" EndId="997" type="0">
</Transition>
<Transition StartId="994" EndId="995" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="994" EndId="990" type="0">
</Transition>
<Transition StartId="995" EndId="998" type="0">
</Transition>
<Transition StartId="996" EndId="994" type="0">
</Transition>
<Transition StartId="997" EndId="996" type="0">
</Transition>
<Transition StartId="998" EndId="997" type="0">
</Transition>
<Transition StartId="1007" EndId="1008" type="0">
</Transition>
<Transition StartId="1008" EndId="1012" type="0">
</Transition>
<Transition StartId="1009" EndId="1010" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1009" EndId="1014" type="0">
</Transition>
<Transition StartId="1010" EndId="1013" type="0">
</Transition>
<Transition StartId="1011" EndId="1009" type="0">
</Transition>
<Transition StartId="1012" EndId="1011" type="0">
</Transition>
<Transition StartId="1013" EndId="1012" type="0">
</Transition>
<Transition StartId="1014" EndId="991" type="0">
</Transition>
<Transition StartId="1015" EndId="1016" type="0">
</Transition>
<Transition StartId="1016" EndId="1017" type="0">
</Transition>
<Transition StartId="1017" EndId="1021" type="0">
</Transition>
<Transition StartId="1018" EndId="1019" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1018" EndId="1023" type="0">
</Transition>
<Transition StartId="1019" EndId="1020" type="0">
</Transition>
<Transition StartId="1020" EndId="1017" type="0">
</Transition>
<Transition StartId="1021" EndId="1022" type="0">
</Transition>
<Transition StartId="1022" EndId="1018" type="0">
</Transition>
<Transition StartId="1023" EndId="1024" type="0">
</Transition>
<Transition StartId="1024" EndId="1025" type="0">
</Transition>
<Transition StartId="1025" EndId="1029" type="0">
</Transition>
<Transition StartId="1026" EndId="1027" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1026" EndId="1031" type="0">
</Transition>
<Transition StartId="1027" EndId="1028" type="0">
</Transition>
<Transition StartId="1028" EndId="1025" type="0">
</Transition>
<Transition StartId="1029" EndId="1030" type="0">
</Transition>
<Transition StartId="1030" EndId="1026" type="0">
</Transition>
<Transition StartId="1031" EndId="1032" type="0">
</Transition>
<Transition StartId="1032" EndId="1036" type="0">
</Transition>
<Transition StartId="1033" EndId="1034" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1033" EndId="1038" type="0">
</Transition>
<Transition StartId="1034" EndId="1035" type="0">
</Transition>
<Transition StartId="1035" EndId="1032" type="0">
</Transition>
<Transition StartId="1036" EndId="1037" type="0">
</Transition>
<Transition StartId="1037" EndId="1033" type="0">
</Transition>
<Transition StartId="1038" EndId="1039" type="0">
</Transition>
<Transition StartId="1039" EndId="1043" type="0">
</Transition>
<Transition StartId="1040" EndId="1041" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1040" EndId="1051" type="0">
</Transition>
<Transition StartId="1041" EndId="1042" type="0">
</Transition>
<Transition StartId="1042" EndId="1039" type="0">
</Transition>
<Transition StartId="1043" EndId="1044" type="0">
</Transition>
<Transition StartId="1044" EndId="1040" type="0">
</Transition>
<Transition StartId="1051" EndId="1052" type="0">
</Transition>
<Transition StartId="1052" EndId="1053" type="0">
</Transition>
<Transition StartId="1053" EndId="1057" type="0">
</Transition>
<Transition StartId="1054" EndId="1055" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1054" EndId="1059" type="0">
</Transition>
<Transition StartId="1055" EndId="1056" type="0">
</Transition>
<Transition StartId="1056" EndId="1053" type="0">
</Transition>
<Transition StartId="1057" EndId="1058" type="0">
</Transition>
<Transition StartId="1058" EndId="1054" type="0">
</Transition>
<Transition StartId="1059" EndId="1060" type="0">
</Transition>
<Transition StartId="1060" EndId="1064" type="0">
</Transition>
<Transition StartId="1061" EndId="1062" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1061" EndId="1066" type="0">
</Transition>
<Transition StartId="1062" EndId="1063" type="0">
</Transition>
<Transition StartId="1063" EndId="1060" type="0">
</Transition>
<Transition StartId="1064" EndId="1065" type="0">
</Transition>
<Transition StartId="1065" EndId="1061" type="0">
</Transition>
<Transition StartId="1066" EndId="1067" type="0">
</Transition>
<Transition StartId="1067" EndId="1071" type="0">
</Transition>
<Transition StartId="1068" EndId="1069" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1068" EndId="1073" type="0">
</Transition>
<Transition StartId="1069" EndId="1070" type="0">
</Transition>
<Transition StartId="1070" EndId="1067" type="0">
</Transition>
<Transition StartId="1071" EndId="1072" type="0">
</Transition>
<Transition StartId="1072" EndId="1068" type="0">
</Transition>
<Transition StartId="1073" EndId="1074" type="0">
</Transition>
<Transition StartId="1074" EndId="1078" type="0">
</Transition>
<Transition StartId="1075" EndId="1076" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1075" EndId="1080" type="0">
</Transition>
<Transition StartId="1076" EndId="1077" type="0">
</Transition>
<Transition StartId="1077" EndId="1074" type="0">
</Transition>
<Transition StartId="1078" EndId="1079" type="0">
</Transition>
<Transition StartId="1079" EndId="1075" type="0">
</Transition>
<Transition StartId="1080" EndId="1085" type="0">
</Transition>
<Transition StartId="1085" EndId="1086" type="0">
</Transition>
<Transition StartId="1086" EndId="1087" type="0">
</Transition>
<Transition StartId="1087" EndId="1091" type="0">
</Transition>
<Transition StartId="1088" EndId="1089" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1088" EndId="1093" type="0">
</Transition>
<Transition StartId="1089" EndId="1090" type="0">
</Transition>
<Transition StartId="1090" EndId="1087" type="0">
</Transition>
<Transition StartId="1091" EndId="1092" type="0">
</Transition>
<Transition StartId="1092" EndId="1088" type="0">
</Transition>
<Transition StartId="1093" EndId="1094" type="0">
</Transition>
<Transition StartId="1094" EndId="1098" type="0">
</Transition>
<Transition StartId="1095" EndId="1096" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1095" EndId="1100" type="0">
</Transition>
<Transition StartId="1096" EndId="1097" type="0">
</Transition>
<Transition StartId="1097" EndId="1094" type="0">
</Transition>
<Transition StartId="1098" EndId="1099" type="0">
</Transition>
<Transition StartId="1099" EndId="1095" type="0">
</Transition>
<Transition StartId="1100" EndId="1101" type="0">
</Transition>
<Transition StartId="1101" EndId="1105" type="0">
</Transition>
<Transition StartId="1102" EndId="1103" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1102" EndId="1107" type="0">
</Transition>
<Transition StartId="1103" EndId="1104" type="0">
</Transition>
<Transition StartId="1104" EndId="1101" type="0">
</Transition>
<Transition StartId="1105" EndId="1106" type="0">
</Transition>
<Transition StartId="1106" EndId="1102" type="0">
</Transition>
<Transition StartId="1107" EndId="1108" type="0">
</Transition>
<Transition StartId="1108" EndId="1112" type="0">
</Transition>
<Transition StartId="1109" EndId="1110" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1109" EndId="1114" type="0">
</Transition>
<Transition StartId="1110" EndId="1111" type="0">
</Transition>
<Transition StartId="1111" EndId="1108" type="0">
</Transition>
<Transition StartId="1112" EndId="1113" type="0">
</Transition>
<Transition StartId="1113" EndId="1109" type="0">
</Transition>
<Transition StartId="1114" EndId="1119" type="0">
</Transition>
<Transition StartId="1119" EndId="1120" type="0">
</Transition>
<Transition StartId="1120" EndId="1121" type="0">
</Transition>
<Transition StartId="1121" EndId="1125" type="0">
</Transition>
<Transition StartId="1122" EndId="1123" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1122" EndId="1127" type="0">
</Transition>
<Transition StartId="1123" EndId="1124" type="0">
</Transition>
<Transition StartId="1124" EndId="1121" type="0">
</Transition>
<Transition StartId="1125" EndId="1126" type="0">
</Transition>
<Transition StartId="1126" EndId="1122" type="0">
</Transition>
<Transition StartId="1127" EndId="1128" type="0">
</Transition>
<Transition StartId="1128" EndId="1132" type="0">
</Transition>
<Transition StartId="1129" EndId="1130" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1129" EndId="1134" type="0">
</Transition>
<Transition StartId="1130" EndId="1131" type="0">
</Transition>
<Transition StartId="1131" EndId="1128" type="0">
</Transition>
<Transition StartId="1132" EndId="1133" type="0">
</Transition>
<Transition StartId="1133" EndId="1129" type="0">
</Transition>
<Transition StartId="1134" EndId="1135" type="0">
</Transition>
<Transition StartId="1135" EndId="1139" type="0">
</Transition>
<Transition StartId="1136" EndId="1137" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1136" EndId="1141" type="0">
</Transition>
<Transition StartId="1137" EndId="1138" type="0">
</Transition>
<Transition StartId="1138" EndId="1135" type="0">
</Transition>
<Transition StartId="1139" EndId="1140" type="0">
</Transition>
<Transition StartId="1140" EndId="1136" type="0">
</Transition>
<Transition StartId="1141" EndId="1142" type="0">
</Transition>
<Transition StartId="1142" EndId="1146" type="0">
</Transition>
<Transition StartId="1143" EndId="1144" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1143" EndId="1152" type="0">
</Transition>
<Transition StartId="1144" EndId="1145" type="0">
</Transition>
<Transition StartId="1145" EndId="1142" type="0">
</Transition>
<Transition StartId="1146" EndId="1147" type="0">
</Transition>
<Transition StartId="1147" EndId="1143" type="0">
</Transition>
<Transition StartId="1152" EndId="1153" type="0">
</Transition>
<Transition StartId="1153" EndId="1179" type="0">
</Transition>
<Transition StartId="1154" EndId="1158" type="0">
</Transition>
<Transition StartId="1155" EndId="1156" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1155" EndId="1198" type="0">
</Transition>
<Transition StartId="1156" EndId="1157" type="0">
</Transition>
<Transition StartId="1157" EndId="1179" type="0">
</Transition>
<Transition StartId="1158" EndId="1159" type="0">
</Transition>
<Transition StartId="1159" EndId="1155" type="0">
</Transition>
<Transition StartId="1160" EndId="1161" type="0">
</Transition>
<Transition StartId="1161" EndId="1182" type="0">
</Transition>
<Transition StartId="1162" EndId="1166" type="0">
</Transition>
<Transition StartId="1163" EndId="1164" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1163" EndId="1169" type="0">
</Transition>
<Transition StartId="1164" EndId="1165" type="0">
</Transition>
<Transition StartId="1165" EndId="1182" type="0">
</Transition>
<Transition StartId="1166" EndId="1167" type="0">
</Transition>
<Transition StartId="1167" EndId="1163" type="0">
</Transition>
<Transition StartId="1168" EndId="1160" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM21" or  DString_C131_Car_Tpye == "CH1GM22" or  DString_C131_Car_Tpye == "CH1AM41" or DString_C131_Car_Tpye == "CH1AM42"  or  DString_C131_Car_Tpye == "CH1HM11" or  DString_C131_Car_Tpye == "CH1HM12" or  DString_C131_Car_Tpye == "CH1HM13" or DString_C131_Car_Tpye == "CH1FM12"  or  DString_C131_Car_Tpye == "CH1FM13" or  DString_C131_Car_Tpye == "CH1CM28" or  DString_C131_Car_Tpye == "CH1CM29"  or  DString_C131_Car_Tpye == "CH1JM11"</Expression></Transition>
<Transition StartId="1168" EndId="1181" type="0">
</Transition>
<Transition StartId="1169" EndId="1170" type="0">
</Transition>
<Transition StartId="1170" EndId="1183" type="0">
</Transition>
<Transition StartId="1171" EndId="1175" type="0">
</Transition>
<Transition StartId="1172" EndId="1173" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1172" EndId="1177" type="0">
</Transition>
<Transition StartId="1173" EndId="1174" type="0">
</Transition>
<Transition StartId="1174" EndId="1183" type="0">
</Transition>
<Transition StartId="1175" EndId="1176" type="0">
</Transition>
<Transition StartId="1176" EndId="1172" type="0">
</Transition>
<Transition StartId="1177" EndId="1180" type="0">
</Transition>
<Transition StartId="1178" EndId="1152" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42"</Expression></Transition>
<Transition StartId="1178" EndId="1181" type="0">
</Transition>
<Transition StartId="1179" EndId="1154" type="0">
</Transition>
<Transition StartId="1180" EndId="1184" type="0">
</Transition>
<Transition StartId="1181" EndId="1180" type="0">
</Transition>
<Transition StartId="1182" EndId="1162" type="0">
</Transition>
<Transition StartId="1183" EndId="1171" type="0">
</Transition>
<Transition StartId="1184" EndId="1188" type="0">
</Transition>
<Transition StartId="1185" EndId="1186" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1185" EndId="1190" type="0">
</Transition>
<Transition StartId="1186" EndId="1189" type="0">
</Transition>
<Transition StartId="1187" EndId="1185" type="0">
</Transition>
<Transition StartId="1188" EndId="1187" type="0">
</Transition>
<Transition StartId="1189" EndId="1188" type="0">
</Transition>
<Transition StartId="1190" EndId="1196" type="0">
</Transition>
<Transition StartId="1192" EndId="1193" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="1192" EndId="1195" type="0">
</Transition>
<Transition StartId="1193" EndId="1195" type="0">
</Transition>
<Transition StartId="1194" EndId="1197" type="0">
</Transition>
<Transition StartId="1195" EndId="1194" type="0">
</Transition>
<Transition StartId="1196" EndId="1192" type="0">
</Transition>
<Transition StartId="1197" EndId="2" type="0">
</Transition>
<Transition StartId="1198" EndId="1199" type="0">
</Transition>
<Transition StartId="1199" EndId="1206" type="0">
</Transition>
<Transition StartId="1200" EndId="1204" type="0">
</Transition>
<Transition StartId="1201" EndId="1202" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1201" EndId="1207" type="0">
</Transition>
<Transition StartId="1202" EndId="1203" type="0">
</Transition>
<Transition StartId="1203" EndId="1206" type="0">
</Transition>
<Transition StartId="1204" EndId="1205" type="0">
</Transition>
<Transition StartId="1205" EndId="1201" type="0">
</Transition>
<Transition StartId="1206" EndId="1200" type="0">
</Transition>
<Transition StartId="1207" EndId="1208" type="0">
</Transition>
<Transition StartId="1208" EndId="1215" type="0">
</Transition>
<Transition StartId="1209" EndId="1213" type="0">
</Transition>
<Transition StartId="1210" EndId="1211" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1210" EndId="1168" type="0">
</Transition>
<Transition StartId="1211" EndId="1212" type="0">
</Transition>
<Transition StartId="1212" EndId="1215" type="0">
</Transition>
<Transition StartId="1213" EndId="1214" type="0">
</Transition>
<Transition StartId="1214" EndId="1210" type="0">
</Transition>
<Transition StartId="1215" EndId="1209" type="0">
</Transition>
<Transition StartId="1260" EndId="753" type="0">
</Transition>
<Transition StartId="1261" EndId="835" type="0">
</Transition>
<Transition StartId="1263" EndId="1007" type="0">
</Transition>
<Transition StartId="1264" EndId="772" type="0">
</Transition>
<Transition StartId="1265" EndId="782" type="0">
</Transition>
<Transition StartId="1266" EndId="800" type="0">
</Transition>
</Transitions>
</Process>

