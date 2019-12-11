<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1125" pbltext="DEP551">
<Parameters>
<Variable id="DString_C131_Partnumber_DDCU" type="8" dir="0" data="DString_C131_Partnumber_DDCU"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x759" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x779" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="620" top="14" right="720" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="550" top="13614" right="650" bottom="13646"/>
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
<Activity id="3" ActivityType="3" flags="0" name="司机门(DDCU)">
<Rect left="620" top="84" right="720" bottom="116"/>
<TitleText Enable="1" Text="司机门(DDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="620" top="144" right="720" bottom="176"/>
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
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="司机门检测"/>
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
<assessment no="1315" name="DEP1081" type="8" flags="97"/>
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
<Rect left="160" top="144" right="260" bottom="176"/>
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
<assessment no="1313" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="延时500MS">
<Rect left="620" top="204" right="720" bottom="236"/>
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
<assessment no="1314" name="DEP109" type="8" flags="97"/>
</Activity>
<Activity id="706" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="620" top="444" right="720" bottom="476"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x11"/>
<Parameter id="resTitle" value="0x51"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1315" name="DEP1081" type="8" flags="97"/>
</Activity>
<Activity id="707" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="620" top="514" right="720" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="460" top="584" right="560" bottom="616"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
<assessment no="1315" name="DEP1081" type="8" flags="97"/>
</Activity>
<Activity id="710" ActivityType="3" flags="0" name="重试？">
<Rect left="160" top="744" right="260" bottom="776"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="711" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="160" top="584" right="260" bottom="616"/>
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
<assessment no="1313" name="DEP108" type="8" flags="97"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1316" name="DEP111" type="8" flags="97"/>
</Activity>
<Activity id="714" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="620" top="584" right="720" bottom="616"/>
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
<Rect left="460" top="954" right="560" bottom="986"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1317" name="DEP112" type="8" flags="97"/>
</Activity>
<Activity id="718" ActivityType="13" flags="0" name="计算key">
<Rect left="460" top="874" right="560" bottom="906"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FBDCEA0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="比对零件号">
<Rect left="460" top="1024" right="560" bottom="1056"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_DDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_DDCU);
len = string.len(DString_C131_Partnumber_DDCU)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_DDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_DDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_DDCU);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_DDCU;
	
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
	
		if (DString1==DString_C131_Partnumber_DDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_DDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_DDCU);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_DDCU;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end
--engine.println("######## C131 DDCU PartNumber Read From ECU:".. StringRes);</Script><assessment no="1" name="DEP552" type="8" flags="97"/>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="读硬件号">
<Rect left="600" top="1084" right="700" bottom="1116"/>
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
</Script><assessment no="2" name="DEP553" type="8" flags="97"/>
</Activity>
<Activity id="724" ActivityType="3" flags="0" name="延时300MS">
<Rect left="460" top="1084" right="560" bottom="1116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="725" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="600" top="1144" right="700" bottom="1176"/>
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
</Script><assessment no="3" name="DEP554" type="8" flags="97"/>
</Activity>
<Activity id="726" ActivityType="3" flags="0" name="延时300MS">
<Rect left="460" top="1144" right="560" bottom="1176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="727" ActivityType="3" flags="0" name="读软件号">
<Rect left="600" top="1214" right="700" bottom="1246"/>
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
</Script><assessment no="4" name="DEP555" type="8" flags="97"/>
</Activity>
<Activity id="728" ActivityType="3" flags="0" name="延时300MS">
<Rect left="460" top="1214" right="560" bottom="1246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="729" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="600" top="1284" right="700" bottom="1316"/>
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


                                                          


</Script><assessment no="5" name="DEP556" type="8" flags="97"/>
</Activity>
<Activity id="730" ActivityType="3" flags="0" name="延时300MS">
<Rect left="460" top="1284" right="560" bottom="1316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="731" ActivityType="3" flags="0" name="延时300MS">
<Rect left="600" top="1024" right="700" bottom="1056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="732" ActivityType="3" flags="0" name="TemplateTestLoop_Light_On">
<Rect left="460" top="1344" right="560" bottom="1376"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，司机门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="733" ActivityType="3" flags="0" name="init">
<Rect left="460" top="1404" right="560" bottom="1436"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="734" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="460" top="1464" right="560" bottom="1496"/>
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
<Rect left="460" top="1534" right="560" bottom="1566"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="736" ActivityType="3" flags="0" name="endloop">
<Rect left="460" top="1674" right="560" bottom="1706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="737" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="1674" right="416" bottom="1706"/>
</Activity>
<Activity id="738" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="1464" right="416" bottom="1496"/>
</Activity>
<Activity id="739" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="460" top="1604" right="560" bottom="1636"/>
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
<assessment no="21" name="DEP571" type="8" flags="97"/>
</Activity>
<Activity id="741" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="940" top="1674" right="1040" bottom="1706"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="742" ActivityType="3" flags="0" name="init">
<Rect left="940" top="1734" right="1040" bottom="1766"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="743" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="940" top="1804" right="1040" bottom="1836"/>
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
<Rect left="940" top="2004" right="1040" bottom="2036"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="745" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="2004" right="1136" bottom="2036"/>
</Activity>
<Activity id="746" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="1804" right="1136" bottom="1836"/>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="940" top="2134" right="1040" bottom="2166"/>
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
<Rect left="790" top="2134" right="890" bottom="2166"/>
<Line1Text Enable="1" Text="请确认外后视镜开关位置于0位置"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="749" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="940" top="2074" right="1040" bottom="2106"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="750" ActivityType="3" flags="0" name="截取字符串">
<Rect left="940" top="1864" right="1040" bottom="1896"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="751" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="940" top="1924" right="1040" bottom="1956"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????0&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP572" type="8" flags="97"/>
</Activity>
<Activity id="753" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="160" top="2134" right="260" bottom="2166"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="754" ActivityType="3" flags="0" name="init">
<Rect left="160" top="2204" right="260" bottom="2236"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="755" ActivityType="3" flags="0" name="endloop">
<Rect left="160" top="2394" right="260" bottom="2426"/>
<Script></Script></Activity>
<Activity id="756" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="2394" right="116" bottom="2426"/>
</Activity>
<Activity id="757" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="160" top="2334" right="260" bottom="2366"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="42" name="DEP1923" type="8" flags="97"/>
</Activity>
<Activity id="758" ActivityType="3" flags="0" name="初始化">
<Rect left="160" top="2264" right="260" bottom="2296"/>
<Script>DFloat_Mts3Result = math.abs(engine.df_door_i);
DFloat_Mts3Result = tonumber(DFloat_Mts3Result);
engine.println("type",type(DFloat_Mts3Result));
</Script></Activity>
<Activity id="759" ActivityType="4" flags="0" name="路由节点">
<Rect left="84" top="2264" right="116" bottom="2296"/>
</Activity>
<Activity id="760" ActivityType="3" flags="0" name="Check_mirror">
<Rect left="470" top="2394" right="570" bottom="2426"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="761" ActivityType="13" flags="0" name="X_Axis_increase_adjust">
<Rect left="470" top="2464" right="570" bottom="2496"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="762" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="470" top="2784" right="570" bottom="2816"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="765" ActivityType="3" flags="0" name="init">
<Rect left="470" top="2534" right="570" bottom="2566"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  500
</Script></Activity>
<Activity id="766" ActivityType="3" flags="0" name="endloop">
<Rect left="470" top="2724" right="570" bottom="2756"/>
<Script></Script></Activity>
<Activity id="767" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="2724" right="436" bottom="2756"/>
</Activity>
<Activity id="768" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="470" top="2664" right="570" bottom="2696"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
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
<assessment no="13" name="DEP561" type="8" flags="97"/>
</Activity>
<Activity id="769" ActivityType="3" flags="0" name="初始化">
<Rect left="470" top="2594" right="570" bottom="2626"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i )
engine.println("type",type(DFloat_Mts3Result))
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="770" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="2594" right="436" bottom="2626"/>
</Activity>
<Activity id="772" ActivityType="13" flags="0" name="X_Axis_decrease_adjust">
<Rect left="670" top="2444" right="770" bottom="2476"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴减少"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="773" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="670" top="2784" right="770" bottom="2816"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="776" ActivityType="3" flags="0" name="init">
<Rect left="670" top="2534" right="770" bottom="2566"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  500</Script></Activity>
<Activity id="777" ActivityType="3" flags="0" name="endloop">
<Rect left="670" top="2724" right="770" bottom="2756"/>
<Script></Script></Activity>
<Activity id="778" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="2724" right="646" bottom="2756"/>
</Activity>
<Activity id="779" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="670" top="2664" right="770" bottom="2696"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
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
<assessment no="76" name="DEP562" type="8" flags="97"/>
</Activity>
<Activity id="780" ActivityType="3" flags="0" name="初始化">
<Rect left="670" top="2594" right="770" bottom="2626"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="781" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="2594" right="646" bottom="2626"/>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Y_Axis_increase_adjust">
<Rect left="670" top="2884" right="770" bottom="2916"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴增加"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="785" ActivityType="3" flags="0" name="init">
<Rect left="670" top="2964" right="770" bottom="2996"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="786" ActivityType="3" flags="0" name="endloop">
<Rect left="670" top="3154" right="770" bottom="3186"/>
<Script></Script></Activity>
<Activity id="787" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="3154" right="636" bottom="3186"/>
</Activity>
<Activity id="788" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="670" top="3094" right="770" bottom="3126"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
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
<assessment no="15" name="DEP563" type="8" flags="97"/>
</Activity>
<Activity id="789" ActivityType="3" flags="0" name="初始化">
<Rect left="670" top="3024" right="770" bottom="3056"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="790" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="3024" right="636" bottom="3056"/>
</Activity>
<Activity id="809" ActivityType="13" flags="0" name="XY_Axis_ReturnControlToECU">
<Rect left="1030" top="3284" right="1130" bottom="3316"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x06\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="Mirror_fold_automaticlly">
<Rect left="880" top="3414" right="980" bottom="3446"/>
<Line1Text Enable="1" Text="请确认外后视镜是打开状态"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="811" ActivityType="13" flags="0" name="后视镜折叠指令">
<Rect left="880" top="3554" right="980" bottom="3586"/>
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
<Parameter id="sendTel" value="&apos;\x02\x06\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="813" ActivityType="3" flags="0" name="延时1500MS">
<Rect left="880" top="3634" right="980" bottom="3666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="等待1.5秒"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="814" ActivityType="3" flags="0" name="init">
<Rect left="880" top="3704" right="980" bottom="3736"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="815" ActivityType="13" flags="0" name="Read_status">
<Rect left="880" top="3764" right="980" bottom="3796"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x13&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="816" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="3954" right="980" bottom="3986"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="817" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="3954" right="866" bottom="3986"/>
</Activity>
<Activity id="818" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="3764" right="866" bottom="3796"/>
</Activity>
<Activity id="819" ActivityType="3" flags="0" name="截取字符串">
<Rect left="880" top="3814" right="980" bottom="3846"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="820" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="880" top="3874" right="980" bottom="3906"/>
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
<assessment no="43" name="DEP565" type="8" flags="97"/>
</Activity>
<Activity id="821" ActivityType="13" flags="0" name="后视镜展开指令">
<Rect left="1070" top="3344" right="1170" bottom="3376"/>
<Line3Text Enable="1" Text="司机门倒车镜展开"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x06\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="822" ActivityType="3" flags="0" name="延时1500MS">
<Rect left="1070" top="3404" right="1170" bottom="3436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="等待1.5秒"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  1500</Script></Activity>
<Activity id="823" ActivityType="3" flags="0" name="init">
<Rect left="1070" top="3624" right="1170" bottom="3656"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="824" ActivityType="13" flags="0" name="Read_status">
<Rect left="1070" top="3694" right="1170" bottom="3726"/>
<Line3Text Enable="1" Text="获取司机门倒车镜展开状态"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x13&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="825" ActivityType="3" flags="0" name="endloop">
<Rect left="1070" top="3894" right="1170" bottom="3926"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="826" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="3894" right="1266" bottom="3926"/>
</Activity>
<Activity id="827" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="3694" right="1266" bottom="3726"/>
</Activity>
<Activity id="828" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1070" top="3754" right="1170" bottom="3786"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="829" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1070" top="3814" right="1170" bottom="3846"/>
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
<assessment no="46" name="DEP566" type="8" flags="97"/>
</Activity>
<Activity id="830" ActivityType="13" flags="0" name="Mirror_fold_open_ReturnControlToECU">
<Rect left="1070" top="4054" right="1170" bottom="4086"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x06\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="835" ActivityType="13" flags="0" name="Heating_Start">
<Rect left="370" top="4004" right="470" bottom="4036"/>
<Line3Text Enable="1" Text="司机门倒车镜开始加热"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x07\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="842" ActivityType="13" flags="0" name="Heating_Stop">
<Rect left="370" top="4394" right="470" bottom="4426"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x07\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP568" type="8" flags="97"/>
</Activity>
<Activity id="843" ActivityType="13" flags="0" name="Mirror_Heating_ReturnControlToECU">
<Rect left="370" top="4494" right="470" bottom="4526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x07\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="844" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="370" top="4074" right="470" bottom="4106"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="845" ActivityType="3" flags="0" name="init">
<Rect left="370" top="4134" right="470" bottom="4166"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="846" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="4334" right="470" bottom="4366"/>
<Script></Script></Activity>
<Activity id="847" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="4334" right="326" bottom="4366"/>
</Activity>
<Activity id="848" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="370" top="4264" right="470" bottom="4296"/>
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
<assessment no="17" name="DEP567" type="8" flags="97"/>
</Activity>
<Activity id="849" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="4194" right="470" bottom="4226"/>
<Script>DFloat_Mts3Result = math.abs(engine.df_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)</Script></Activity>
<Activity id="850" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="4194" right="326" bottom="4226"/>
</Activity>
<Activity id="851" ActivityType="13" flags="0" name="Check_the_door_lock">
<Rect left="370" top="4574" right="470" bottom="4606"/>
<Line3Text Enable="1" Text="司机门车门锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x01\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="852" ActivityType="3" flags="0" name="init">
<Rect left="370" top="4644" right="470" bottom="4676"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="853" ActivityType="13" flags="0" name="Read_status">
<Rect left="370" top="4714" right="470" bottom="4746"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x16&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="854" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="4944" right="470" bottom="4976"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="855" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="4944" right="326" bottom="4976"/>
</Activity>
<Activity id="856" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="4714" right="326" bottom="4746"/>
</Activity>
<Activity id="857" ActivityType="3" flags="0" name="截取字符串">
<Rect left="370" top="4784" right="470" bottom="4816"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="858" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="4864" right="470" bottom="4896"/>
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
<assessment no="47" name="DEP1924" type="8" flags="97"/>
</Activity>
<Activity id="862" ActivityType="13" flags="0" name="司机门门解锁指令">
<Rect left="370" top="5004" right="470" bottom="5036"/>
<Line3Text Enable="1" Text="司机门门解锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x01\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="init">
<Rect left="370" top="5074" right="470" bottom="5106"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="864" ActivityType="13" flags="0" name="Read_status">
<Rect left="370" top="5144" right="470" bottom="5176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x16&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="865" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="5344" right="470" bottom="5376"/>
<Script></Script></Activity>
<Activity id="866" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="5344" right="586" bottom="5376"/>
</Activity>
<Activity id="867" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="5144" right="586" bottom="5176"/>
</Activity>
<Activity id="868" ActivityType="3" flags="0" name="截取字符串">
<Rect left="370" top="5204" right="470" bottom="5236"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="869" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="370" top="5264" right="470" bottom="5296"/>
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
<assessment no="48" name="DEP1925" type="8" flags="97"/>
</Activity>
<Activity id="870" ActivityType="13" flags="0" name="door_lock_ReturnControlToECU">
<Rect left="370" top="5414" right="470" bottom="5446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x01\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="872" ActivityType="13" flags="0" name="Turn_Light_On">
<Rect left="370" top="5554" right="470" bottom="5586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="879" ActivityType="13" flags="0" name="Turn_Light_Off">
<Rect left="370" top="5844" right="470" bottom="5876"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP570" type="8" flags="97"/>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时200MS">
<Rect left="370" top="5914" right="470" bottom="5946"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="881" ActivityType="13" flags="0" name="Turn_Light_ReturnControlToECU">
<Rect left="370" top="5974" right="470" bottom="6006"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="司机门转向灯开启">
<Rect left="370" top="5494" right="470" bottom="5526"/>
<Line3Text Enable="1" Text="司机门转向灯开启"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="885" ActivityType="3" flags="0" name="endloop">
<Rect left="370" top="5774" right="470" bottom="5806"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="886" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="5774" right="336" bottom="5806"/>
</Activity>
<Activity id="887" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="370" top="5714" right="470" bottom="5746"/>
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
<Parameter id="TimeOut" value="20"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP569" type="8" flags="97"/>
</Activity>
<Activity id="888" ActivityType="3" flags="0" name="初始化">
<Rect left="370" top="5644" right="470" bottom="5676"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i )
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="5644" right="336" bottom="5676"/>
</Activity>
<Activity id="891" ActivityType="3" flags="0" name="Check_Mirror_Function_Switch_State">
<Rect left="660" top="5974" right="760" bottom="6006"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 L 位置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="892" ActivityType="3" flags="0" name="L">
<Rect left="660" top="6034" right="760" bottom="6066"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="893" ActivityType="13" flags="0" name="Read_status">
<Rect left="660" top="6104" right="760" bottom="6136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="endloop">
<Rect left="660" top="6294" right="760" bottom="6326"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="895" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="6294" right="626" bottom="6326"/>
</Activity>
<Activity id="896" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="6104" right="626" bottom="6136"/>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="截取字符串">
<Rect left="660" top="6174" right="760" bottom="6206"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="660" top="6234" right="760" bottom="6266"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="49" name="DEP1926" type="8" flags="97"/>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="0">
<Rect left="660" top="6364" right="760" bottom="6396"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 0 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="900" ActivityType="13" flags="0" name="Read_status">
<Rect left="660" top="6434" right="760" bottom="6466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="endloop">
<Rect left="660" top="6644" right="760" bottom="6676"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="902" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="6644" right="636" bottom="6676"/>
</Activity>
<Activity id="903" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="6434" right="636" bottom="6466"/>
</Activity>
<Activity id="904" ActivityType="3" flags="0" name="截取字符串">
<Rect left="660" top="6504" right="760" bottom="6536"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="905" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="660" top="6564" right="760" bottom="6596"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="50" name="DEP1927" type="8" flags="97"/>
</Activity>
<Activity id="906" ActivityType="3" flags="0" name="R">
<Rect left="870" top="6034" right="970" bottom="6066"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 R 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="907" ActivityType="13" flags="0" name="Read_status">
<Rect left="870" top="6104" right="970" bottom="6136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="endloop">
<Rect left="870" top="6314" right="970" bottom="6346"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="909" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="6314" right="1056" bottom="6346"/>
</Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="6104" right="1056" bottom="6136"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="截取字符串">
<Rect left="870" top="6174" right="970" bottom="6206"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="912" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="870" top="6234" right="970" bottom="6266"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="51" name="DEP1928" type="8" flags="97"/>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="H">
<Rect left="870" top="6374" right="970" bottom="6406"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到加热位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="914" ActivityType="13" flags="0" name="Read_status">
<Rect left="870" top="6434" right="970" bottom="6466"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="endloop">
<Rect left="870" top="6644" right="970" bottom="6676"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="6644" right="846" bottom="6676"/>
</Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="814" top="6434" right="846" bottom="6466"/>
</Activity>
<Activity id="918" ActivityType="3" flags="0" name="截取字符串">
<Rect left="870" top="6494" right="970" bottom="6526"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="919" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="870" top="6554" right="970" bottom="6586"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="52" name="DEP1930" type="8" flags="97"/>
</Activity>
<Activity id="920" ActivityType="3" flags="0" name="0">
<Rect left="1250" top="6354" right="1350" bottom="6386"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到 0 位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="921" ActivityType="13" flags="0" name="Read_status">
<Rect left="1250" top="6414" right="1350" bottom="6446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="922" ActivityType="3" flags="0" name="endloop">
<Rect left="1250" top="6594" right="1350" bottom="6626"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="923" ActivityType="4" flags="0" name="路由节点">
<Rect left="1414" top="6594" right="1446" bottom="6626"/>
</Activity>
<Activity id="924" ActivityType="4" flags="0" name="路由节点">
<Rect left="1414" top="6414" right="1446" bottom="6446"/>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1250" top="6474" right="1350" bottom="6506"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1250" top="6534" right="1350" bottom="6566"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="50" name="DEP1927" type="8" flags="97"/>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="F">
<Rect left="1250" top="6034" right="1350" bottom="6066"/>
<Line2Text Enable="1" Text="后视镜功能按钮旋转到折叠位置"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="928" ActivityType="13" flags="0" name="Read_status">
<Rect left="1250" top="6094" right="1350" bottom="6126"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x34&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="929" ActivityType="3" flags="0" name="endloop">
<Rect left="1250" top="6274" right="1350" bottom="6306"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="930" ActivityType="4" flags="0" name="路由节点">
<Rect left="1414" top="6274" right="1446" bottom="6306"/>
</Activity>
<Activity id="931" ActivityType="4" flags="0" name="路由节点">
<Rect left="1414" top="6094" right="1446" bottom="6126"/>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1250" top="6154" right="1350" bottom="6186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="933" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1250" top="6214" right="1350" bottom="6246"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="53" name="DEP1931" type="8" flags="97"/>
</Activity>
<Activity id="934" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="1250" top="6724" right="1350" bottom="6756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="935" ActivityType="3" flags="0" name="init">
<Rect left="660" top="6784" right="760" bottom="6816"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="936" ActivityType="13" flags="0" name="Read_status">
<Rect left="660" top="6854" right="760" bottom="6886"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x35&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="937" ActivityType="3" flags="0" name="endloop">
<Rect left="660" top="7064" right="760" bottom="7096"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="938" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="7064" right="636" bottom="7096"/>
</Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="6854" right="636" bottom="6886"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="截取字符串">
<Rect left="660" top="6924" right="760" bottom="6956"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="660" top="6994" right="760" bottom="7026"/>
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
<assessment no="54" name="DEP1932" type="8" flags="97"/>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="后视镜方向调整右方向按键按下">
<Rect left="660" top="7124" right="760" bottom="7156"/>
<Line2Text Enable="1" Text="后视镜方向调整右方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="943" ActivityType="13" flags="0" name="Read_status">
<Rect left="660" top="7194" right="760" bottom="7226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x35&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="944" ActivityType="3" flags="0" name="endloop">
<Rect left="660" top="7404" right="760" bottom="7436"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="945" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="7404" right="636" bottom="7436"/>
</Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="7194" right="636" bottom="7226"/>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="截取字符串">
<Rect left="660" top="7264" right="760" bottom="7296"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="660" top="7324" right="760" bottom="7356"/>
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
<assessment no="55" name="DEP1933" type="8" flags="97"/>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="Check_Rearview_Mirror_Direction_adjust_switch_State">
<Rect left="660" top="6724" right="760" bottom="6756"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="后视镜方向调整左方向按键按下"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="950" ActivityType="3" flags="0" name="后视镜方向调整上方向按键按下">
<Rect left="1040" top="6774" right="1140" bottom="6806"/>
<Line2Text Enable="1" Text="后视镜方向调整上方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="951" ActivityType="13" flags="0" name="Read_status">
<Rect left="1040" top="6844" right="1140" bottom="6876"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x35&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="endloop">
<Rect left="1040" top="7054" right="1140" bottom="7086"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="953" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="7054" right="1246" bottom="7086"/>
</Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="6844" right="1246" bottom="6876"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1040" top="6914" right="1140" bottom="6946"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="956" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1040" top="6974" right="1140" bottom="7006"/>
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
<assessment no="56" name="DEP1934" type="8" flags="97"/>
</Activity>
<Activity id="957" ActivityType="3" flags="0" name="后视镜方向调整下方向按键按下">
<Rect left="1040" top="7104" right="1140" bottom="7136"/>
<Line2Text Enable="1" Text="后视镜方向调整下方向按键按下"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="958" ActivityType="13" flags="0" name="Read_status">
<Rect left="1040" top="7174" right="1140" bottom="7206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x35&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="1040" top="7384" right="1140" bottom="7416"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="7384" right="1256" bottom="7416"/>
</Activity>
<Activity id="961" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="7174" right="1256" bottom="7206"/>
</Activity>
<Activity id="962" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1040" top="7244" right="1140" bottom="7276"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="963" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1040" top="7304" right="1140" bottom="7336"/>
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
<assessment no="57" name="DEP1935" type="8" flags="97"/>
</Activity>
<Activity id="964" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="1040" top="7454" right="1140" bottom="7486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="975" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="350" top="7454" right="450" bottom="7486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃下降"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x02\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="990" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="350" top="7824" right="450" bottom="7856"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x02\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="991" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="790" top="8234" right="890" bottom="8266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x02\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="993" ActivityType="3" flags="0" name="init">
<Rect left="350" top="7514" right="450" bottom="7546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  1000</Script></Activity>
<Activity id="994" ActivityType="3" flags="0" name="endloop">
<Rect left="350" top="7694" right="450" bottom="7726"/>
<Script></Script></Activity>
<Activity id="995" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="7694" right="306" bottom="7726"/>
</Activity>
<Activity id="996" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="350" top="7634" right="450" bottom="7666"/>
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
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP573" type="8" flags="97"/>
</Activity>
<Activity id="997" ActivityType="3" flags="0" name="初始化">
<Rect left="350" top="7574" right="450" bottom="7606"/>
<Script>DFloat_Mts3Result = (engine.df_door_i)  /1000;
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="998" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="7574" right="306" bottom="7606"/>
</Activity>
<Activity id="1007" ActivityType="13" flags="0" name="Window_up">
<Rect left="790" top="7824" right="890" bottom="7856"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
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
<Activity id="1008" ActivityType="3" flags="0" name="init">
<Rect left="790" top="7894" right="890" bottom="7926"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
#DELAY  1000</Script></Activity>
<Activity id="1009" ActivityType="3" flags="0" name="endloop">
<Rect left="790" top="8084" right="890" bottom="8116"/>
<Script></Script></Activity>
<Activity id="1010" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="8084" right="766" bottom="8116"/>
</Activity>
<Activity id="1011" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="790" top="8024" right="890" bottom="8056"/>
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
<assessment no="24" name="DEP574" type="8" flags="97"/>
</Activity>
<Activity id="1012" ActivityType="3" flags="0" name="初始化">
<Rect left="790" top="7954" right="890" bottom="7986"/>
<Script>DFloat_Mts3Result = (engine.df_door_i)  /1000
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)</Script></Activity>
<Activity id="1013" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="7954" right="766" bottom="7986"/>
</Activity>
<Activity id="1015" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="240" top="8234" right="340" bottom="8266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="1016" ActivityType="3" flags="0" name="init">
<Rect left="240" top="8294" right="340" bottom="8326"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1017" ActivityType="13" flags="0" name="Read_status">
<Rect left="240" top="8374" right="340" bottom="8406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1018" ActivityType="3" flags="0" name="endloop">
<Rect left="240" top="8574" right="340" bottom="8606"/>
<Script></Script></Activity>
<Activity id="1019" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="8574" right="176" bottom="8606"/>
</Activity>
<Activity id="1020" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="8374" right="176" bottom="8406"/>
</Activity>
<Activity id="1021" ActivityType="3" flags="0" name="截取字符串">
<Rect left="240" top="8434" right="340" bottom="8466"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1022" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="240" top="8494" right="340" bottom="8526"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="58" name="DEP2002" type="8" flags="97"/>
</Activity>
<Activity id="1023" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="240" top="8664" right="340" bottom="8696"/>
<Line2Text Enable="1" Text="司机门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="1024" ActivityType="3" flags="0" name="init">
<Rect left="240" top="8734" right="340" bottom="8766"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1025" ActivityType="13" flags="0" name="Read_status">
<Rect left="240" top="8814" right="340" bottom="8846"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1026" ActivityType="3" flags="0" name="endloop">
<Rect left="240" top="9024" right="340" bottom="9056"/>
<Script></Script></Activity>
<Activity id="1027" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="9024" right="176" bottom="9056"/>
</Activity>
<Activity id="1028" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="8814" right="176" bottom="8846"/>
</Activity>
<Activity id="1029" ActivityType="3" flags="0" name="截取字符串">
<Rect left="240" top="8884" right="340" bottom="8916"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1030" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="240" top="8944" right="340" bottom="8976"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="59" name="DEP2003" type="8" flags="97"/>
</Activity>
<Activity id="1031" ActivityType="3" flags="0" name="init">
<Rect left="520" top="8314" right="620" bottom="8346"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1032" ActivityType="13" flags="0" name="Read_status">
<Rect left="520" top="8384" right="620" bottom="8416"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1033" ActivityType="3" flags="0" name="endloop">
<Rect left="520" top="8594" right="620" bottom="8626"/>
<Script></Script></Activity>
<Activity id="1034" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="8594" right="716" bottom="8626"/>
</Activity>
<Activity id="1035" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="8384" right="716" bottom="8416"/>
</Activity>
<Activity id="1036" ActivityType="3" flags="0" name="截取字符串">
<Rect left="520" top="8454" right="620" bottom="8486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1037" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="520" top="8514" right="620" bottom="8546"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="60" name="DEP2056" type="8" flags="97"/>
</Activity>
<Activity id="1038" ActivityType="3" flags="0" name="init">
<Rect left="520" top="8664" right="620" bottom="8696"/>
<Line2Text Enable="1" Text="司机门玻璃升 Level 2（升到顶）"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1039" ActivityType="13" flags="0" name="Read_status">
<Rect left="520" top="8724" right="620" bottom="8756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1040" ActivityType="3" flags="0" name="endloop">
<Rect left="520" top="8934" right="620" bottom="8966"/>
<Script></Script></Activity>
<Activity id="1041" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="8934" right="726" bottom="8966"/>
</Activity>
<Activity id="1042" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="8724" right="726" bottom="8756"/>
</Activity>
<Activity id="1043" ActivityType="3" flags="0" name="截取字符串">
<Rect left="520" top="8794" right="620" bottom="8826"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1044" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="520" top="8854" right="620" bottom="8886"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="61" name="DEP2001" type="8" flags="97"/>
</Activity>
<Activity id="1051" ActivityType="3" flags="0" name="Passenger_Window_Down">
<Rect left="520" top="9024" right="620" bottom="9056"/>
<Line2Text Enable="1" Text="乘客门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="1052" ActivityType="3" flags="0" name="init">
<Rect left="520" top="9104" right="620" bottom="9136"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1053" ActivityType="13" flags="0" name="Read_status">
<Rect left="520" top="9174" right="620" bottom="9206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2D&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1054" ActivityType="3" flags="0" name="endloop">
<Rect left="520" top="9374" right="620" bottom="9406"/>
<Script></Script></Activity>
<Activity id="1055" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="9374" right="496" bottom="9406"/>
</Activity>
<Activity id="1056" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="9174" right="496" bottom="9206"/>
</Activity>
<Activity id="1057" ActivityType="3" flags="0" name="截取字符串">
<Rect left="520" top="9234" right="620" bottom="9266"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1058" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="520" top="9294" right="620" bottom="9326"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="62" name="DEP2006" type="8" flags="97"/>
</Activity>
<Activity id="1059" ActivityType="3" flags="0" name="init">
<Rect left="520" top="9444" right="620" bottom="9476"/>
<Line2Text Enable="1" Text="乘客门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1060" ActivityType="13" flags="0" name="Read_status">
<Rect left="520" top="9524" right="620" bottom="9556"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2D&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1061" ActivityType="3" flags="0" name="endloop">
<Rect left="520" top="9734" right="620" bottom="9766"/>
<Script></Script></Activity>
<Activity id="1062" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="9734" right="476" bottom="9766"/>
</Activity>
<Activity id="1063" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="9524" right="476" bottom="9556"/>
</Activity>
<Activity id="1064" ActivityType="3" flags="0" name="截取字符串">
<Rect left="520" top="9594" right="620" bottom="9626"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1065" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="520" top="9654" right="620" bottom="9686"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="63" name="DEP2007" type="8" flags="97"/>
</Activity>
<Activity id="1066" ActivityType="3" flags="0" name="init">
<Rect left="800" top="9114" right="900" bottom="9146"/>
<Line2Text Enable="1" Text="乘客门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1067" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="9184" right="900" bottom="9216"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2D&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1068" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="9394" right="900" bottom="9426"/>
<Script></Script></Activity>
<Activity id="1069" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="9394" right="1006" bottom="9426"/>
</Activity>
<Activity id="1070" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="9184" right="1006" bottom="9216"/>
</Activity>
<Activity id="1071" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="9254" right="900" bottom="9286"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1072" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="9314" right="900" bottom="9346"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="64" name="DEP2004" type="8" flags="97"/>
</Activity>
<Activity id="1073" ActivityType="3" flags="0" name="init">
<Rect left="800" top="9454" right="900" bottom="9486"/>
<Line2Text Enable="1" Text="乘客门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1074" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="9524" right="900" bottom="9556"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2D&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1075" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="9734" right="900" bottom="9766"/>
<Script></Script></Activity>
<Activity id="1076" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="9734" right="1006" bottom="9766"/>
</Activity>
<Activity id="1077" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="9524" right="1006" bottom="9556"/>
</Activity>
<Activity id="1078" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="9594" right="900" bottom="9626"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1079" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="9654" right="900" bottom="9686"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="65" name="DEP2005" type="8" flags="97"/>
</Activity>
<Activity id="1085" ActivityType="3" flags="0" name="RL_Window_Down">
<Rect left="800" top="9814" right="900" bottom="9846"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="1086" ActivityType="3" flags="0" name="init">
<Rect left="800" top="9904" right="900" bottom="9936"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1087" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="9974" right="900" bottom="10006"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1088" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="10184" right="900" bottom="10216"/>
<Script></Script></Activity>
<Activity id="1089" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="10184" right="756" bottom="10216"/>
</Activity>
<Activity id="1090" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="9974" right="756" bottom="10006"/>
</Activity>
<Activity id="1091" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="10044" right="900" bottom="10076"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1092" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="10104" right="900" bottom="10136"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="66" name="DEP2010" type="8" flags="97"/>
</Activity>
<Activity id="1093" ActivityType="3" flags="0" name="init">
<Rect left="800" top="10264" right="900" bottom="10296"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1094" ActivityType="13" flags="0" name="Read_status">
<Rect left="800" top="10334" right="900" bottom="10366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1095" ActivityType="3" flags="0" name="endloop">
<Rect left="800" top="10544" right="900" bottom="10576"/>
<Script></Script></Activity>
<Activity id="1096" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="10544" right="756" bottom="10576"/>
</Activity>
<Activity id="1097" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="10334" right="756" bottom="10366"/>
</Activity>
<Activity id="1098" ActivityType="3" flags="0" name="截取字符串">
<Rect left="800" top="10404" right="900" bottom="10436"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1099" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="800" top="10464" right="900" bottom="10496"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="67" name="DEP2011" type="8" flags="97"/>
</Activity>
<Activity id="1100" ActivityType="3" flags="0" name="init">
<Rect left="1090" top="9904" right="1190" bottom="9936"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1101" ActivityType="13" flags="0" name="Read_status">
<Rect left="1090" top="9974" right="1190" bottom="10006"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1102" ActivityType="3" flags="0" name="endloop">
<Rect left="1090" top="10184" right="1190" bottom="10216"/>
<Script></Script></Activity>
<Activity id="1103" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="10184" right="1266" bottom="10216"/>
</Activity>
<Activity id="1104" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="9974" right="1266" bottom="10006"/>
</Activity>
<Activity id="1105" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1090" top="10044" right="1190" bottom="10076"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1106" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1090" top="10104" right="1190" bottom="10136"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="68" name="DEP2008" type="8" flags="97"/>
</Activity>
<Activity id="1107" ActivityType="3" flags="0" name="init">
<Rect left="1090" top="10254" right="1190" bottom="10286"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1108" ActivityType="13" flags="0" name="Read_status">
<Rect left="1090" top="10324" right="1190" bottom="10356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1109" ActivityType="3" flags="0" name="endloop">
<Rect left="1090" top="10534" right="1190" bottom="10566"/>
<Script></Script></Activity>
<Activity id="1110" ActivityType="4" flags="0" name="路由节点">
<Rect left="1244" top="10534" right="1276" bottom="10566"/>
</Activity>
<Activity id="1111" ActivityType="4" flags="0" name="路由节点">
<Rect left="1244" top="10324" right="1276" bottom="10356"/>
</Activity>
<Activity id="1112" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1090" top="10394" right="1190" bottom="10426"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1113" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1090" top="10464" right="1190" bottom="10496"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="69" name="DEP2009" type="8" flags="97"/>
</Activity>
<Activity id="1114" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="10624" right="1156" bottom="10656"/>
</Activity>
<Activity id="1119" ActivityType="3" flags="0" name="RR_Window_Down">
<Rect left="270" top="10624" right="370" bottom="10656"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="1120" ActivityType="3" flags="0" name="init">
<Rect left="270" top="10684" right="370" bottom="10716"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1121" ActivityType="13" flags="0" name="Read_status">
<Rect left="270" top="10754" right="370" bottom="10786"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1122" ActivityType="3" flags="0" name="endloop">
<Rect left="270" top="10964" right="370" bottom="10996"/>
<Script></Script></Activity>
<Activity id="1123" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="10964" right="236" bottom="10996"/>
</Activity>
<Activity id="1124" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="10754" right="236" bottom="10786"/>
</Activity>
<Activity id="1125" ActivityType="3" flags="0" name="截取字符串">
<Rect left="270" top="10824" right="370" bottom="10856"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1126" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="270" top="10884" right="370" bottom="10916"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="70" name="DEP2013" type="8" flags="97"/>
</Activity>
<Activity id="1127" ActivityType="3" flags="0" name="init">
<Rect left="270" top="11034" right="370" bottom="11066"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1128" ActivityType="13" flags="0" name="Read_status">
<Rect left="270" top="11104" right="370" bottom="11136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1129" ActivityType="3" flags="0" name="endloop">
<Rect left="270" top="11314" right="370" bottom="11346"/>
<Script></Script></Activity>
<Activity id="1130" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="11314" right="236" bottom="11346"/>
</Activity>
<Activity id="1131" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="11104" right="236" bottom="11136"/>
</Activity>
<Activity id="1132" ActivityType="3" flags="0" name="截取字符串">
<Rect left="270" top="11174" right="370" bottom="11206"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1133" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="270" top="11234" right="370" bottom="11266"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="71" name="DEP2012" type="8" flags="97"/>
</Activity>
<Activity id="1134" ActivityType="3" flags="0" name="init">
<Rect left="550" top="10674" right="650" bottom="10706"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1135" ActivityType="13" flags="0" name="Read_status">
<Rect left="550" top="10754" right="650" bottom="10786"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1136" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="10964" right="650" bottom="10996"/>
<ButtonLText Enable="1"/>
<Script></Script></Activity>
<Activity id="1137" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="10964" right="756" bottom="10996"/>
</Activity>
<Activity id="1138" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="10754" right="756" bottom="10786"/>
</Activity>
<Activity id="1139" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="10824" right="650" bottom="10856"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1140" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="10884" right="650" bottom="10916"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="72" name="DEP2014" type="8" flags="97"/>
</Activity>
<Activity id="1141" ActivityType="3" flags="0" name="init">
<Rect left="550" top="11034" right="650" bottom="11066"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 2"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1142" ActivityType="13" flags="0" name="Read_status">
<Rect left="550" top="11104" right="650" bottom="11136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2F&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1143" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="11314" right="650" bottom="11346"/>
<Script></Script></Activity>
<Activity id="1144" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="11314" right="746" bottom="11346"/>
</Activity>
<Activity id="1145" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="11104" right="746" bottom="11136"/>
</Activity>
<Activity id="1146" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="11164" right="650" bottom="11196"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1147" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="11234" right="650" bottom="11266"/>
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
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="73" name="DEP2015" type="8" flags="97"/>
</Activity>
<Activity id="1152" ActivityType="3" flags="0" name="Seat_Memory_Switch">
<Rect left="1130" top="11464" right="1230" bottom="11496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="按司机门座椅记忆开关1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="1153" ActivityType="3" flags="0" name="init">
<Rect left="1130" top="11544" right="1230" bottom="11576"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1154" ActivityType="13" flags="0" name="Read_status">
<Rect left="1130" top="11614" right="1230" bottom="11646"/>
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
<Rect left="1130" top="11844" right="1230" bottom="11876"/>
<Script></Script></Activity>
<Activity id="1156" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="11844" right="1336" bottom="11876"/>
</Activity>
<Activity id="1157" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="11604" right="1336" bottom="11636"/>
</Activity>
<Activity id="1158" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1130" top="11684" right="1230" bottom="11716"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1159" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1130" top="11754" right="1230" bottom="11786"/>
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
<assessment no="33" name="DEP583" type="8" flags="97"/>
</Activity>
<Activity id="1160" ActivityType="3" flags="0" name="Check_Central_Lock">
<Rect left="1130" top="11994" right="1230" bottom="12026"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="按下中控锁 锁车键"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="1161" ActivityType="3" flags="0" name="init">
<Rect left="1130" top="12064" right="1230" bottom="12096"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1162" ActivityType="13" flags="0" name="Read_status">
<Rect left="1130" top="12144" right="1230" bottom="12176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x18&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1163" ActivityType="3" flags="0" name="endloop">
<Rect left="1130" top="12354" right="1230" bottom="12386"/>
<Script></Script></Activity>
<Activity id="1164" ActivityType="4" flags="0" name="路由节点">
<Rect left="1344" top="12354" right="1376" bottom="12386"/>
</Activity>
<Activity id="1165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1344" top="12144" right="1376" bottom="12176"/>
</Activity>
<Activity id="1166" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1130" top="12214" right="1230" bottom="12246"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1167" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1130" top="12274" right="1230" bottom="12306"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="39" name="DEP781" type="8" flags="97"/>
</Activity>
<Activity id="1168" ActivityType="4" flags="0" name="路由节点">
<Rect left="1164" top="11934" right="1196" bottom="11966"/>
</Activity>
<Activity id="1169" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="1130" top="12434" right="1230" bottom="12466"/>
<Line2Text Enable="1" Text="按下中控锁 解锁键"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="1170" ActivityType="3" flags="0" name="init">
<Rect left="1130" top="12504" right="1230" bottom="12536"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1171" ActivityType="13" flags="0" name="Read_status">
<Rect left="1130" top="12574" right="1230" bottom="12606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x18&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1172" ActivityType="3" flags="0" name="endloop">
<Rect left="1130" top="12784" right="1230" bottom="12816"/>
<Script></Script></Activity>
<Activity id="1173" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="12784" right="1406" bottom="12816"/>
</Activity>
<Activity id="1174" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="12574" right="1406" bottom="12606"/>
</Activity>
<Activity id="1175" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1130" top="12644" right="1230" bottom="12676"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1176" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1130" top="12694" right="1230" bottom="12726"/>
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
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="40" name="DEP782" type="8" flags="97"/>
</Activity>
<Activity id="1177" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="1130" top="12854" right="1230" bottom="12886"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1180" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="550" top="12854" right="650" bottom="12886"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1181" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="11934" right="616" bottom="11966"/>
</Activity>
<Activity id="1184" ActivityType="3" flags="0" name="init">
<Rect left="550" top="12924" right="650" bottom="12956"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1186" ActivityType="4" flags="0" name="路由节点">
<Rect left="494" top="13124" right="526" bottom="13156"/>
</Activity>
<Activity id="1187" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="550" top="13054" right="650" bottom="13086"/>
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
<assessment no="74" name="DEP2028" type="8" flags="97"/>
</Activity>
<Activity id="1188" ActivityType="3" flags="1" name="初始化">
<Rect left="550" top="12984" right="650" bottom="13016"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1189" ActivityType="4" flags="0" name="路由节点">
<Rect left="494" top="12974" right="526" bottom="13006"/>
</Activity>
<Activity id="1192" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="13274" right="616" bottom="13306"/>
</Activity>
<Activity id="1193" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="660" top="13274" right="760" bottom="13306"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11B3-00,B11B4-00,B11CF-00,B11D0-00,B11D1-00,B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1194" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="550" top="13404" right="650" bottom="13436"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="75" name="DEP110" type="8" flags="97"/>
</Activity>
<Activity id="1195" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="550" top="13344" right="650" bottom="13376"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2201-00,U2202-00,U2203-00,U2206-00,U2207-00,U0141-00,U1008-00,U0200-00,U0201-00,U0202-00,U0208-00,U0146-00,U0002-00,U2204-00,U2205-00,U220D-00,B11D3-00,B11D4-00,B11C8-00,B11C9-00,B11CA-00,B11CB-00,B11D2-00,B11D7-00,B11D9-00,}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1196" ActivityType="3" flags="0" name="读DTC">
<Rect left="550" top="13204" right="650" bottom="13236"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes); </Script><assessment no="75" name="DEP110" type="8" flags="97"/>
</Activity>
<Activity id="1200" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="670" top="3224" right="770" bottom="3256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1201" ActivityType="13" flags="0" name="Y_Axis_decrease_adjust">
<Rect left="880" top="2894" right="980" bottom="2926"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴减少"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1203" ActivityType="3" flags="0" name="init">
<Rect left="880" top="2974" right="980" bottom="3006"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1204" ActivityType="3" flags="0" name="endloop">
<Rect left="880" top="3164" right="980" bottom="3196"/>
<Script></Script></Activity>
<Activity id="1205" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="3164" right="856" bottom="3196"/>
</Activity>
<Activity id="1206" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="880" top="3104" right="980" bottom="3136"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="400"/>
<Parameter id="LowerLimit" value="50"/>
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
<assessment no="16" name="DEP564" type="8" flags="97"/>
</Activity>
<Activity id="1207" ActivityType="3" flags="0" name="初始化">
<Rect left="880" top="3034" right="980" bottom="3066"/>
<Script>DFloat_Mts3Result=engine.df_door_i
--DFloat_Mts3Result=tostring(DFloat_Mts3Result) </Script></Activity>
<Activity id="1208" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="3034" right="856" bottom="3066"/>
</Activity>
<Activity id="1209" ActivityType="13" flags="0" name="Adjust_Stop">
<Rect left="880" top="3224" right="980" bottom="3256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1211" ActivityType="3" flags="0" name="维持信号">
<Rect left="350" top="1014" right="450" bottom="1046"/>
<Script>engine.registerPacket(0,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1212" ActivityType="3" flags="0" name="延时200MS">
<Rect left="670" top="2384" right="770" bottom="2416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1213" ActivityType="3" flags="0" name="延时200MS">
<Rect left="670" top="2834" right="770" bottom="2866"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1214" ActivityType="3" flags="0" name="延时200MS">
<Rect left="880" top="2834" right="980" bottom="2866"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1215" ActivityType="3" flags="0" name="延时200MS">
<Rect left="880" top="3284" right="980" bottom="3316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1217" ActivityType="3" flags="0" name="延时200MS">
<Rect left="370" top="4444" right="470" bottom="4476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1218" ActivityType="3" flags="0" name="普通节点">
<Rect left="880" top="3354" right="980" bottom="3386"/>
<Script></Script></Activity>
<Activity id="1219" ActivityType="3" flags="0" name="普通节点">
<Rect left="370" top="3354" right="470" bottom="3386"/>
<Script></Script></Activity>
<Activity id="1220" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="4004" right="1136" bottom="4036"/>
</Activity>
<Activity id="1221" ActivityType="3" flags="0" name="延时200MS">
<Rect left="350" top="7754" right="450" bottom="7786"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  3000</Script></Activity>
<Activity id="1222" ActivityType="3" flags="0" name="延时200MS">
<Rect left="790" top="8174" right="890" bottom="8206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  3000</Script></Activity>
<Activity id="1223" ActivityType="3" flags="0" name="将玻璃上升">
<Rect left="550" top="13524" right="650" bottom="13556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=请将玻璃升到顶".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="1225" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="13124" right="650" bottom="13156"/>
<Script></Script></Activity>
<Activity id="1226" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="12404" right="616" bottom="12436"/>
</Activity>
<Activity id="1227" ActivityType="13" flags="0" name="转向灯亮指令">
<Rect left="880" top="3484" right="980" bottom="3516"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="转向灯亮"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1229" ActivityType="13" flags="0" name="转向灯关闭指令">
<Rect left="1070" top="3454" right="1170" bottom="3486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="转向灯关闭"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1230" ActivityType="3" flags="0" name="延时200MS">
<Rect left="1070" top="3504" right="1170" bottom="3536"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="1231" ActivityType="13" flags="0" name="Turn_Light_ReturnControlToECU">
<Rect left="1070" top="3554" right="1170" bottom="3586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1232" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="210" top="12894" right="310" bottom="12926"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1233" ActivityType="3" flags="0" name="init">
<Rect left="210" top="12964" right="310" bottom="12996"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1234" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="13164" right="186" bottom="13196"/>
</Activity>
<Activity id="1235" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="210" top="13094" right="310" bottom="13126"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="74" name="DEP2530" type="8" flags="97"/>
</Activity>
<Activity id="1236" ActivityType="3" flags="0" name="初始化">
<Rect left="210" top="13024" right="310" bottom="13056"/>
<Script>DFloat_Mts3Result=math.abs(engine.df_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1237" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="13024" right="186" bottom="13056"/>
</Activity>
<Activity id="1238" ActivityType="3" flags="0" name="endloop">
<Rect left="210" top="13164" right="310" bottom="13196"/>
<Script></Script></Activity>
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
<Transition StartId="710" EndId="711" type="0">
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
<Transition StartId="716" EndId="722" type="0">
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
<Transition StartId="733" EndId="734" type="0">
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
<Transition StartId="738" EndId="734" type="0">
</Transition>
<Transition StartId="739" EndId="736" type="0">
</Transition>
<Transition StartId="741" EndId="742" type="0">
</Transition>
<Transition StartId="742" EndId="743" type="0">
</Transition>
<Transition StartId="743" EndId="750" type="0">
</Transition>
<Transition StartId="744" EndId="745" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="744" EndId="749" type="0">
</Transition>
<Transition StartId="745" EndId="746" type="0">
</Transition>
<Transition StartId="746" EndId="743" type="0">
</Transition>
<Transition StartId="747" EndId="748" type="0">
</Transition>
<Transition StartId="748" EndId="753" type="0">
</Transition>
<Transition StartId="749" EndId="747" type="1">
<Expression>DString_C131_Car_Tpye~="CH1GM40" or  DString_C131_Car_Tpye~="CH1GM41"  or  DString_C131_Car_Tpye~="CH1GM42" or DString_C131_Car_Tpye ~= "CMNA02A"</Expression></Transition>
<Transition StartId="749" EndId="748" type="0">
</Transition>
<Transition StartId="750" EndId="751" type="0">
</Transition>
<Transition StartId="751" EndId="744" type="0">
</Transition>
<Transition StartId="753" EndId="754" type="0">
</Transition>
<Transition StartId="754" EndId="758" type="0">
</Transition>
<Transition StartId="755" EndId="756" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
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
<Transition StartId="762" EndId="1212" type="0">
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
<Transition StartId="773" EndId="1213" type="0">
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
<Transition StartId="785" EndId="789" type="0">
</Transition>
<Transition StartId="786" EndId="787" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="786" EndId="1200" type="0">
</Transition>
<Transition StartId="787" EndId="790" type="0">
</Transition>
<Transition StartId="788" EndId="786" type="0">
</Transition>
<Transition StartId="789" EndId="788" type="0">
</Transition>
<Transition StartId="790" EndId="789" type="0">
</Transition>
<Transition StartId="809" EndId="1218" type="0">
</Transition>
<Transition StartId="810" EndId="1227" type="0">
</Transition>
<Transition StartId="811" EndId="813" type="0">
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
<Transition StartId="822" EndId="1229" type="0">
</Transition>
<Transition StartId="823" EndId="824" type="0">
</Transition>
<Transition StartId="824" EndId="828" type="0">
</Transition>
<Transition StartId="825" EndId="826" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="825" EndId="1220" type="0">
</Transition>
<Transition StartId="826" EndId="827" type="0">
</Transition>
<Transition StartId="827" EndId="824" type="0">
</Transition>
<Transition StartId="828" EndId="829" type="0">
</Transition>
<Transition StartId="829" EndId="825" type="0">
</Transition>
<Transition StartId="830" EndId="835" type="0">
</Transition>
<Transition StartId="835" EndId="844" type="0">
</Transition>
<Transition StartId="842" EndId="1217" type="0">
</Transition>
<Transition StartId="843" EndId="851" type="0">
</Transition>
<Transition StartId="844" EndId="845" type="0">
</Transition>
<Transition StartId="845" EndId="849" type="0">
</Transition>
<Transition StartId="846" EndId="847" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="846" EndId="842" type="0">
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
<Transition StartId="870" EndId="884" type="0">
</Transition>
<Transition StartId="872" EndId="888" type="0">
</Transition>
<Transition StartId="879" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="881" EndId="891" type="0">
</Transition>
<Transition StartId="884" EndId="872" type="0">
</Transition>
<Transition StartId="885" EndId="886" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="885" EndId="879" type="0">
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
<Transition StartId="915" EndId="920" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM40" or DString_C131_Car_Tpye == "CH1GM41" or DString_C131_Car_Tpye == "CH1GM42"or DString_C131_Car_Tpye == "CMNA01A"or DString_C131_Car_Tpye == "CMNA02A"</Expression></Transition>
<Transition StartId="915" EndId="927" type="0">
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
<Transition StartId="922" EndId="934" type="0">
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
<Transition StartId="929" EndId="920" type="0">
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
<Transition StartId="990" EndId="1007" type="0">
</Transition>
<Transition StartId="991" EndId="1015" type="0">
</Transition>
<Transition StartId="993" EndId="997" type="0">
</Transition>
<Transition StartId="994" EndId="995" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="994" EndId="1221" type="0">
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
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="1009" EndId="1222" type="0">
</Transition>
<Transition StartId="1010" EndId="1013" type="0">
</Transition>
<Transition StartId="1011" EndId="1009" type="0">
</Transition>
<Transition StartId="1012" EndId="1011" type="0">
</Transition>
<Transition StartId="1013" EndId="1012" type="0">
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
<Transition StartId="1075" EndId="1085" type="0">
</Transition>
<Transition StartId="1076" EndId="1077" type="0">
</Transition>
<Transition StartId="1077" EndId="1074" type="0">
</Transition>
<Transition StartId="1078" EndId="1079" type="0">
</Transition>
<Transition StartId="1079" EndId="1075" type="0">
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
<Transition StartId="1143" EndId="1152" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42" and DString_C131_Car_Tpye ~= "CMNA02A"</Expression></Transition>
<Transition StartId="1143" EndId="1181" type="0">
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
<Transition StartId="1153" EndId="1154" type="0">
</Transition>
<Transition StartId="1154" EndId="1158" type="0">
</Transition>
<Transition StartId="1155" EndId="1156" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1155" EndId="1168" type="0">
</Transition>
<Transition StartId="1156" EndId="1157" type="0">
</Transition>
<Transition StartId="1157" EndId="1154" type="0">
</Transition>
<Transition StartId="1158" EndId="1159" type="0">
</Transition>
<Transition StartId="1159" EndId="1155" type="0">
</Transition>
<Transition StartId="1160" EndId="1161" type="0">
</Transition>
<Transition StartId="1161" EndId="1162" type="0">
</Transition>
<Transition StartId="1162" EndId="1166" type="0">
</Transition>
<Transition StartId="1163" EndId="1164" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1163" EndId="1169" type="0">
</Transition>
<Transition StartId="1164" EndId="1165" type="0">
</Transition>
<Transition StartId="1165" EndId="1162" type="0">
</Transition>
<Transition StartId="1166" EndId="1167" type="0">
</Transition>
<Transition StartId="1167" EndId="1163" type="0">
</Transition>
<Transition StartId="1168" EndId="1226" type="0">
</Transition>
<Transition StartId="1168" EndId="1160" type="1">
<Expression>DString_C131_Car_Tpye == "CMNA01A" or DString_C131_Car_Tpye == "CMNA02A" or DString_C131_Car_Tpye == "CH1QM30"or DString_C131_Car_Tpye == "CH1QM40"or DString_C131_Car_Tpye == "CH1QM50"or DString_C131_Car_Tpye == "CNDA01A"or DString_C131_Car_Tpye == "CH1PM20"or DString_C131_Car_Tpye == "CH1PM30"</Expression></Transition>
<Transition StartId="1169" EndId="1170" type="0">
</Transition>
<Transition StartId="1170" EndId="1171" type="0">
</Transition>
<Transition StartId="1171" EndId="1175" type="0">
</Transition>
<Transition StartId="1172" EndId="1173" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1172" EndId="1177" type="0">
</Transition>
<Transition StartId="1173" EndId="1174" type="0">
</Transition>
<Transition StartId="1174" EndId="1171" type="0">
</Transition>
<Transition StartId="1175" EndId="1176" type="0">
</Transition>
<Transition StartId="1176" EndId="1172" type="0">
</Transition>
<Transition StartId="1177" EndId="1180" type="0">
</Transition>
<Transition StartId="1180" EndId="1184" type="0">
</Transition>
<Transition StartId="1181" EndId="1168" type="0">
</Transition>
<Transition StartId="1184" EndId="1188" type="0">
</Transition>
<Transition StartId="1186" EndId="1189" type="0">
</Transition>
<Transition StartId="1187" EndId="1225" type="0">
</Transition>
<Transition StartId="1188" EndId="1187" type="0">
</Transition>
<Transition StartId="1189" EndId="1188" type="0">
</Transition>
<Transition StartId="1192" EndId="1193" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="1192" EndId="1195" type="0">
</Transition>
<Transition StartId="1193" EndId="1195" type="0">
</Transition>
<Transition StartId="1194" EndId="1223" type="0">
</Transition>
<Transition StartId="1195" EndId="1194" type="0">
</Transition>
<Transition StartId="1196" EndId="1192" type="0">
</Transition>
<Transition StartId="1200" EndId="1214" type="0">
</Transition>
<Transition StartId="1201" EndId="1203" type="0">
</Transition>
<Transition StartId="1203" EndId="1207" type="0">
</Transition>
<Transition StartId="1204" EndId="1205" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1204" EndId="1209" type="0">
</Transition>
<Transition StartId="1205" EndId="1208" type="0">
</Transition>
<Transition StartId="1206" EndId="1204" type="0">
</Transition>
<Transition StartId="1207" EndId="1206" type="0">
</Transition>
<Transition StartId="1208" EndId="1207" type="0">
</Transition>
<Transition StartId="1209" EndId="1215" type="0">
</Transition>
<Transition StartId="1212" EndId="772" type="0">
</Transition>
<Transition StartId="1213" EndId="782" type="0">
</Transition>
<Transition StartId="1214" EndId="1201" type="0">
</Transition>
<Transition StartId="1215" EndId="809" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="1215" EndId="1218" type="0">
</Transition>
<Transition StartId="1217" EndId="843" type="0">
</Transition>
<Transition StartId="1218" EndId="810" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11" and DString_C131_Car_Tpye ~= "CH1GM30" and DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42" and DString_C131_Car_Tpye ~= "CMNA02A"</Expression></Transition>
<Transition StartId="1218" EndId="1219" type="0">
</Transition>
<Transition StartId="1219" EndId="835" type="0">
</Transition>
<Transition StartId="1220" EndId="830" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="1220" EndId="835" type="0">
</Transition>
<Transition StartId="1221" EndId="990" type="0">
</Transition>
<Transition StartId="1222" EndId="991" type="0">
</Transition>
<Transition StartId="1223" EndId="2" type="0">
</Transition>
<Transition StartId="1225" EndId="1186" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1225" EndId="1196" type="0">
</Transition>
<Transition StartId="1226" EndId="1180" type="0">
</Transition>
<Transition StartId="1227" EndId="811" type="0">
</Transition>
<Transition StartId="1229" EndId="1230" type="0">
</Transition>
<Transition StartId="1230" EndId="1231" type="0">
</Transition>
<Transition StartId="1231" EndId="823" type="0">
</Transition>
<Transition StartId="1232" EndId="1233" type="0">
</Transition>
<Transition StartId="1233" EndId="1236" type="0">
</Transition>
<Transition StartId="1234" EndId="1237" type="0">
</Transition>
<Transition StartId="1235" EndId="1238" type="0">
</Transition>
<Transition StartId="1236" EndId="1235" type="0">
</Transition>
<Transition StartId="1237" EndId="1236" type="0">
</Transition>
<Transition StartId="1238" EndId="1234" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
</Transitions>
</Process>

