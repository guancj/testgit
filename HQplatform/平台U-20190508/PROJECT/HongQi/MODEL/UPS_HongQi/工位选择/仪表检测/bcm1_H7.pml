<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1133" pbltext="DEP41">
<Parameters>
<Variable id="DString_C131_Partnumber_BCM1" type="8" dir="0" data="DString_C131_Partnumber_BCM1"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75E" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77E" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="610" top="44" right="710" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="579" top="5449" right="679" bottom="5481"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="610" top="134" right="710" bottom="166"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script>#DELAY  1000
--engine.ecu_CAN_control_2 = false ;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="610" top="194" right="710" bottom="226"/>
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
<Rect left="610" top="254" right="710" bottom="286"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1729" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="310" top="344" right="410" bottom="376"/>
<Line1Text Enable="1" Text="BCM 控制器连接失败！"/>
<Line2Text Enable="1" Text="#L=重试吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON
--flag = 0;
--repeat
--        if (engine.start_press == false ) then
--		flag = 1
 --       elseif (engine.stop_press == true) then
--		flag = 2
   --     else
--		flag = 0
  --      end
--until(flag ~= 0)
--engine.println("stop_press:"..tostring(engine.stop_press));
--engine.println("start_press:"..tostring(engine.start_press));
--engine.println("flag:"..tostring(flag));</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="310" top="194" right="410" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="344" right="256" bottom="376"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="建立通讯">
<Rect left="610" top="344" right="710" bottom="376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1727" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="858" ActivityType="13" flags="0" name="清故障码">
<Rect left="610" top="434" right="710" bottom="466"/>
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
<assessment no="1728" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="610" top="494" right="710" bottom="526"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1730" name="DEP44" type="8" flags="97"/>
</Activity>
<Activity id="861" ActivityType="3" flags="0" name="发送key">
<Rect left="610" top="614" right="710" bottom="646"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1731" name="DEP45" type="8" flags="97"/>
</Activity>
<Activity id="862" ActivityType="3" flags="0" name="比对零件号">
<Rect left="610" top="804" right="710" bottom="836"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_BCM1);
engine.println("零件号标准值:"..DString_C131_Partnumber_BCM1);
len = string.len(DString_C131_Partnumber_BCM1)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_BCM1) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_BCM1); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_BCM1);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_BCM1;
	
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
	
		if (DString1==DString_C131_Partnumber_BCM1) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_BCM1); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_BCM1);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_BCM1;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end
--engine.println("######## C131 DDCU PartNumber Read From ECU:"..StringRes);</Script><assessment no="1" name="DEP249" type="8" flags="97"/>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="读硬件号">
<Rect left="1240" top="674" right="1340" bottom="706"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;</Script></Activity>
<Activity id="864" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1090" top="644" right="1190" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1240" top="734" right="1340" bottom="766"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;
</Script></Activity>
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1090" top="734" right="1190" bottom="766"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="读软件号">
<Rect left="1240" top="824" right="1340" bottom="856"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@14);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;
#DELAY  300</Script><assessment no="4" name="DEP252" type="8" flags="97"/>
</Activity>
<Activity id="871" ActivityType="3" flags="0" name="延时200MS">
<Rect left="610" top="884" right="710" bottom="916"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="877" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="610" top="954" right="710" bottom="986"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
	if(( DString_C131_Car_Tpye == "CH1GM30" ) or  ( DString_C131_Car_Tpye == "CH1GM23" ) or ( DString_C131_Car_Tpye == "CH1AM43" ) or ( DString_C131_Car_Tpye == "CH1AM44" ) or ( DString_C131_Car_Tpye == "CH1DM16" ) or ( DString_C131_Car_Tpye == "CH1DM17" ))then
		StandValue="04.00#06.11"; 
        DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CMNA02A" )or ( DString_C131_Car_Tpye == "CNDA01A" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1FM20" ) or ( DString_C131_Car_Tpye == "CH1FM30" ) or ( DString_C131_Car_Tpye == "CH1BM34" ) or ( DString_C131_Car_Tpye == "CH1NM11" ) or ( DString_C131_Car_Tpye == "CH1CM31" ) or ( DString_C131_Car_Tpye == "CH1JM12" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1BM35" ) or ( DString_C131_Car_Tpye == "CH1CM33" )or ( DString_C131_Car_Tpye == "CH1QM30" )or ( DString_C131_Car_Tpye == "CH1QM40" )or ( DString_C131_Car_Tpye == "CH1QM50" )or ( DString_C131_Car_Tpye == "CH1PM20" )or ( DString_C131_Car_Tpye == "CH1PM30" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1LM13" ) or ( DString_C131_Car_Tpye == "CH1LM23" ) or ( DString_C131_Car_Tpye == "CH1MM41" ))then
	    StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1FM12" ) or ( DString_C131_Car_Tpye == "CH1FM13" ) or ( DString_C131_Car_Tpye == "CH1LM11" )  or ( DString_C131_Car_Tpye == "CH1LM21" )  or ( DString_C131_Car_Tpye == "CH1MM21" ) or ( DString_C131_Car_Tpye == "CH1JM11" ))then
		StandValue="04.00#06"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	elseif(( DString_C131_Car_Tpye == "CH1CM30" ) or ( DString_C131_Car_Tpye == "CH1CM32" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;



                                                      </Script><assessment no="5" name="DEP253" type="8" flags="97"/>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="延时100MS">
<Rect left="610" top="1024" right="710" bottom="1056"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="886" ActivityType="3" flags="0" name="手动大灯关闭">
<Rect left="239" top="1186" right="339" bottom="1218"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="大灯关闭"/>
<Script></Script></Activity>
<Activity id="887" ActivityType="3" flags="0" name="init">
<Rect left="238" top="1251" right="338" bottom="1283"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="888" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="237" top="1312" right="337" bottom="1344"/>
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
<Activity id="889" ActivityType="3" flags="0" name="截取字符串">
<Rect left="236" top="1383" right="336" bottom="1415"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="890" ActivityType="3" flags="0" name="endloop">
<Rect left="237" top="1518" right="337" bottom="1550"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="891" ActivityType="4" flags="0" name="路由节点">
<Rect left="187" top="1518" right="219" bottom="1550"/>
</Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="188" top="1313" right="220" bottom="1345"/>
</Activity>
<Activity id="893" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="238" top="1451" right="338" bottom="1483"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="示宽灯">
<Rect left="238" top="1591" right="338" bottom="1623"/>
<Line2Text Enable="1" Text="示宽灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="895" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="237" top="1652" right="337" bottom="1684"/>
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
<Activity id="896" ActivityType="3" flags="0" name="截取字符串">
<Rect left="236" top="1723" right="336" bottom="1755"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="897" ActivityType="3" flags="0" name="endloop">
<Rect left="237" top="1858" right="337" bottom="1890"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="898" ActivityType="4" flags="0" name="路由节点">
<Rect left="179" top="1855" right="211" bottom="1887"/>
</Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="180" top="1650" right="212" bottom="1682"/>
</Activity>
<Activity id="900" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="238" top="1791" right="338" bottom="1823"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP695" type="8" flags="97"/>
</Activity>
<Activity id="901" ActivityType="3" flags="0" name="手动近光灯打开">
<Rect left="238" top="1932" right="338" bottom="1964"/>
<Line2Text Enable="1" Text="近光灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="902" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="237" top="1993" right="337" bottom="2025"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x11&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="截取字符串">
<Rect left="236" top="2064" right="336" bottom="2096"/>
<Script>MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="904" ActivityType="3" flags="0" name="endloop">
<Rect left="237" top="2199" right="337" bottom="2231"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="905" ActivityType="4" flags="0" name="路由节点">
<Rect left="176" top="2198" right="208" bottom="2230"/>
</Activity>
<Activity id="906" ActivityType="4" flags="0" name="路由节点">
<Rect left="177" top="1993" right="209" bottom="2025"/>
</Activity>
<Activity id="907" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="238" top="2132" right="338" bottom="2164"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP696" type="8" flags="97"/>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="自动头灯">
<Rect left="235" top="2271" right="335" bottom="2303"/>
<Line2Text Enable="1" Text="自动头灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="909" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="234" top="2332" right="334" bottom="2364"/>
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
<Activity id="910" ActivityType="3" flags="0" name="截取字符串">
<Rect left="233" top="2403" right="333" bottom="2435"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="911" ActivityType="3" flags="0" name="endloop">
<Rect left="234" top="2538" right="334" bottom="2570"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="912" ActivityType="4" flags="0" name="路由节点">
<Rect left="165" top="2537" right="197" bottom="2569"/>
</Activity>
<Activity id="913" ActivityType="4" flags="0" name="路由节点">
<Rect left="166" top="2332" right="198" bottom="2364"/>
</Activity>
<Activity id="914" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="235" top="2471" right="335" bottom="2503"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP697" type="8" flags="97"/>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="大灯关闭">
<Rect left="234" top="2616" right="334" bottom="2648"/>
<Line2Text Enable="1" Text="大灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="916" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="230" top="2674" right="330" bottom="2706"/>
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
<Activity id="917" ActivityType="3" flags="0" name="截取字符串">
<Rect left="232" top="2748" right="332" bottom="2780"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="918" ActivityType="3" flags="0" name="endloop">
<Rect left="233" top="2883" right="333" bottom="2915"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="919" ActivityType="4" flags="0" name="路由节点">
<Rect left="169" top="2880" right="201" bottom="2912"/>
</Activity>
<Activity id="920" ActivityType="4" flags="0" name="路由节点">
<Rect left="170" top="2675" right="202" bottom="2707"/>
</Activity>
<Activity id="921" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="234" top="2816" right="334" bottom="2848"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="922" ActivityType="3" flags="0" name="BCM1_Measure_Value">
<Rect left="234" top="2948" right="334" bottom="2980"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="#L=拨到OFF,关闭位置#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow";
#PRESSBUTTON</Script></Activity>
<Activity id="923" ActivityType="3" flags="0" name="前雾灯关闭">
<Rect left="508" top="1187" right="608" bottom="1219"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="924" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="507" top="1248" right="607" bottom="1280"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="截取字符串">
<Rect left="506" top="1319" right="606" bottom="1351"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="926" ActivityType="3" flags="0" name="endloop">
<Rect left="507" top="1454" right="607" bottom="1486"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="927" ActivityType="4" flags="0" name="路由节点">
<Rect left="670" top="1453" right="702" bottom="1485"/>
</Activity>
<Activity id="928" ActivityType="4" flags="0" name="路由节点">
<Rect left="671" top="1252" right="703" bottom="1284"/>
</Activity>
<Activity id="929" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="508" top="1387" right="608" bottom="1419"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP698" type="8" flags="97"/>
</Activity>
<Activity id="931" ActivityType="3" flags="0" name="打开前雾灯">
<Rect left="507" top="1543" right="607" bottom="1575"/>
<Line2Text Enable="1" Text="打开前雾灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="932" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="506" top="1604" right="606" bottom="1636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="933" ActivityType="3" flags="0" name="截取字符串">
<Rect left="505" top="1675" right="605" bottom="1707"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="934" ActivityType="3" flags="0" name="endloop">
<Rect left="506" top="1810" right="606" bottom="1842"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="935" ActivityType="4" flags="0" name="路由节点">
<Rect left="673" top="1809" right="705" bottom="1841"/>
</Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="1604" right="706" bottom="1636"/>
</Activity>
<Activity id="937" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="507" top="1743" right="607" bottom="1775"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP699" type="8" flags="97"/>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="前雾灯关闭">
<Rect left="503" top="1902" right="603" bottom="1934"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="940" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="503" top="1959" right="603" bottom="1991"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x12&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="941" ActivityType="3" flags="0" name="截取字符串">
<Rect left="502" top="2030" right="602" bottom="2062"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="942" ActivityType="3" flags="0" name="endloop">
<Rect left="503" top="2165" right="603" bottom="2197"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="680" top="2164" right="712" bottom="2196"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="681" top="1959" right="713" bottom="1991"/>
</Activity>
<Activity id="945" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="504" top="2098" right="604" bottom="2130"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP698" type="8" flags="97"/>
</Activity>
<Activity id="946" ActivityType="3" flags="0" name="转向灯关闭">
<Rect left="502" top="2260" right="602" bottom="2292"/>
<Line2Text Enable="1" Text="转向灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="947" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="501" top="2321" right="601" bottom="2353"/>
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
<Activity id="948" ActivityType="3" flags="0" name="截取字符串">
<Rect left="500" top="2392" right="600" bottom="2424"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="949" ActivityType="3" flags="0" name="endloop">
<Rect left="501" top="2527" right="601" bottom="2559"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="2534" right="466" bottom="2566"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="2324" right="466" bottom="2356"/>
</Activity>
<Activity id="952" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="502" top="2460" right="602" bottom="2492"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP700" type="8" flags="97"/>
</Activity>
<Activity id="960" ActivityType="3" flags="0" name="左转向灯">
<Rect left="873" top="1185" right="973" bottom="1217"/>
<Line2Text Enable="1" Text="左转向灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="961" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="872" top="1250" right="972" bottom="1282"/>
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
<Activity id="962" ActivityType="3" flags="0" name="截取字符串">
<Rect left="871" top="1317" right="971" bottom="1349"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="963" ActivityType="3" flags="0" name="endloop">
<Rect left="872" top="1452" right="972" bottom="1484"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="1119" top="1450" right="1151" bottom="1482"/>
</Activity>
<Activity id="965" ActivityType="4" flags="0" name="路由节点">
<Rect left="1120" top="1245" right="1152" bottom="1277"/>
</Activity>
<Activity id="966" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="873" top="1385" right="973" bottom="1417"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP701" type="8" flags="97"/>
</Activity>
<Activity id="967" ActivityType="3" flags="0" name="右转向灯">
<Rect left="871" top="1545" right="971" bottom="1577"/>
<Line2Text Enable="1" Text="右转向灯"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="968" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="870" top="1606" right="970" bottom="1638"/>
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
<Activity id="969" ActivityType="3" flags="0" name="截取字符串">
<Rect left="869" top="1677" right="969" bottom="1709"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="970" ActivityType="3" flags="0" name="endloop">
<Rect left="870" top="1812" right="970" bottom="1844"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="971" ActivityType="4" flags="0" name="路由节点">
<Rect left="1151" top="1810" right="1183" bottom="1842"/>
</Activity>
<Activity id="972" ActivityType="4" flags="0" name="路由节点">
<Rect left="1152" top="1605" right="1184" bottom="1637"/>
</Activity>
<Activity id="973" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="871" top="1745" right="971" bottom="1777"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP702" type="8" flags="97"/>
</Activity>
<Activity id="976" ActivityType="3" flags="0" name="转向灯关闭">
<Rect left="876" top="1887" right="976" bottom="1919"/>
<Line2Text Enable="1" Text="转向灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="977" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="880" top="1948" right="980" bottom="1980"/>
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
<Activity id="978" ActivityType="3" flags="0" name="截取字符串">
<Rect left="874" top="2019" right="974" bottom="2051"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="979" ActivityType="3" flags="0" name="endloop">
<Rect left="875" top="2154" right="975" bottom="2186"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="980" ActivityType="4" flags="0" name="路由节点">
<Rect left="1069" top="2152" right="1101" bottom="2184"/>
</Activity>
<Activity id="981" ActivityType="4" flags="0" name="路由节点">
<Rect left="1070" top="1947" right="1102" bottom="1979"/>
</Activity>
<Activity id="982" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="876" top="2087" right="976" bottom="2119"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP700" type="8" flags="97"/>
</Activity>
<Activity id="983" ActivityType="3" flags="0" name="远光灯关闭">
<Rect left="875" top="2229" right="975" bottom="2261"/>
<Line2Text Enable="1" Text="远光灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="984" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="870" top="2291" right="970" bottom="2323"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x10&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="985" ActivityType="3" flags="0" name="截取字符串">
<Rect left="873" top="2361" right="973" bottom="2393"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="986" ActivityType="3" flags="0" name="endloop">
<Rect left="874" top="2496" right="974" bottom="2528"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="987" ActivityType="4" flags="0" name="路由节点">
<Rect left="1102" top="2494" right="1134" bottom="2526"/>
</Activity>
<Activity id="988" ActivityType="4" flags="0" name="路由节点">
<Rect left="1103" top="2289" right="1135" bottom="2321"/>
</Activity>
<Activity id="989" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="875" top="2429" right="975" bottom="2461"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP703" type="8" flags="97"/>
</Activity>
<Activity id="990" ActivityType="3" flags="0" name="远光灯开">
<Rect left="873" top="2579" right="973" bottom="2611"/>
<Line2Text Enable="1" Text="远光灯开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="991" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="872" top="2640" right="972" bottom="2672"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x10&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="992" ActivityType="3" flags="0" name="截取字符串">
<Rect left="871" top="2711" right="971" bottom="2743"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="993" ActivityType="3" flags="0" name="endloop">
<Rect left="872" top="2846" right="972" bottom="2878"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="994" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="2844" right="1166" bottom="2876"/>
</Activity>
<Activity id="995" ActivityType="4" flags="0" name="路由节点">
<Rect left="1135" top="2639" right="1167" bottom="2671"/>
</Activity>
<Activity id="996" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="873" top="2779" right="973" bottom="2811"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP704" type="8" flags="97"/>
</Activity>
<Activity id="997" ActivityType="3" flags="0" name="远光灯关闭">
<Rect left="239" top="3074" right="339" bottom="3106"/>
<Line2Text Enable="1" Text="远光灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="998" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="238" top="3129" right="338" bottom="3161"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x10&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="999" ActivityType="3" flags="0" name="截取字符串">
<Rect left="237" top="3200" right="337" bottom="3232"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1000" ActivityType="3" flags="0" name="endloop">
<Rect left="238" top="3335" right="338" bottom="3367"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1001" ActivityType="4" flags="0" name="路由节点">
<Rect left="152" top="3333" right="184" bottom="3365"/>
</Activity>
<Activity id="1002" ActivityType="4" flags="0" name="路由节点">
<Rect left="152" top="3129" right="184" bottom="3161"/>
</Activity>
<Activity id="1003" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="239" top="3268" right="339" bottom="3300"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="27" name="DEP703" type="8" flags="97"/>
</Activity>
<Activity id="1004" ActivityType="3" flags="0" name="Wiper_washer_switch_check">
<Rect left="237" top="3403" right="337" bottom="3435"/>
<Line1Text Enable="1" Text="将雨刷开关"/>
<Line2Text Enable="1" Text="拨到OFF,关闭位置"/>
<Script></Script></Activity>
<Activity id="1005" ActivityType="4" flags="0" name="路由节点">
<Rect left="906" top="3070" right="938" bottom="3102"/>
</Activity>
<Activity id="1006" ActivityType="3" flags="0" name="雨刷关闭">
<Rect left="237" top="3471" right="337" bottom="3503"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1007" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="236" top="3532" right="336" bottom="3564"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1008" ActivityType="3" flags="0" name="截取字符串">
<Rect left="235" top="3603" right="335" bottom="3635"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1009" ActivityType="3" flags="0" name="endloop">
<Rect left="236" top="3738" right="336" bottom="3770"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1010" ActivityType="4" flags="0" name="路由节点">
<Rect left="153" top="3735" right="185" bottom="3767"/>
</Activity>
<Activity id="1011" ActivityType="4" flags="0" name="路由节点">
<Rect left="153" top="3531" right="185" bottom="3563"/>
</Activity>
<Activity id="1012" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="237" top="3671" right="337" bottom="3703"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="28" name="DEP705" type="8" flags="97"/>
</Activity>
<Activity id="1014" ActivityType="3" flags="0" name="雨刷拨到INT档">
<Rect left="235" top="3840" right="335" bottom="3872"/>
<Line2Text Enable="1" Text="雨刷拨到INT档"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1015" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="234" top="3901" right="334" bottom="3933"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1E&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1016" ActivityType="3" flags="0" name="截取字符串">
<Rect left="233" top="3972" right="333" bottom="4004"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1017" ActivityType="3" flags="0" name="endloop">
<Rect left="234" top="4107" right="334" bottom="4139"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1018" ActivityType="4" flags="0" name="路由节点">
<Rect left="185" top="4104" right="217" bottom="4136"/>
</Activity>
<Activity id="1019" ActivityType="4" flags="0" name="路由节点">
<Rect left="185" top="3900" right="217" bottom="3932"/>
</Activity>
<Activity id="1020" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="235" top="4040" right="335" bottom="4072"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP706" type="8" flags="97"/>
</Activity>
<Activity id="1022" ActivityType="3" flags="0" name="雨刷拨到低速档">
<Rect left="588" top="3117" right="688" bottom="3149"/>
<Line2Text Enable="1" Text="雨刷拨到低速档"/>
<Script>Pram_1=nil</Script></Activity>
<Activity id="1023" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="587" top="3178" right="687" bottom="3210"/>
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
<Activity id="1024" ActivityType="3" flags="0" name="截取字符串">
<Rect left="586" top="3249" right="686" bottom="3281"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1025" ActivityType="3" flags="0" name="endloop">
<Rect left="587" top="3384" right="687" bottom="3416"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1026" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="3383" right="776" bottom="3415"/>
</Activity>
<Activity id="1027" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="3179" right="776" bottom="3211"/>
</Activity>
<Activity id="1028" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="588" top="3317" right="688" bottom="3349"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP707" type="8" flags="97"/>
</Activity>
<Activity id="1030" ActivityType="3" flags="0" name="雨刷拨到高速档">
<Rect left="587" top="3476" right="687" bottom="3508"/>
<Line2Text Enable="1" Text="雨刷拨到高速档"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1031" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="586" top="3537" right="686" bottom="3569"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1032" ActivityType="3" flags="0" name="截取字符串">
<Rect left="585" top="3608" right="685" bottom="3640"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1033" ActivityType="3" flags="0" name="endloop">
<Rect left="586" top="3743" right="686" bottom="3775"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1034" ActivityType="4" flags="0" name="路由节点">
<Rect left="739" top="3741" right="771" bottom="3773"/>
</Activity>
<Activity id="1035" ActivityType="4" flags="0" name="路由节点">
<Rect left="739" top="3537" right="771" bottom="3569"/>
</Activity>
<Activity id="1036" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="587" top="3676" right="687" bottom="3708"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="31" name="DEP708" type="8" flags="97"/>
</Activity>
<Activity id="1038" ActivityType="3" flags="0" name="雨刷关闭">
<Rect left="585" top="3811" right="685" bottom="3843"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1039" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="584" top="3872" right="684" bottom="3904"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x1C&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1040" ActivityType="3" flags="0" name="截取字符串">
<Rect left="583" top="3943" right="683" bottom="3975"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1041" ActivityType="3" flags="0" name="endloop">
<Rect left="584" top="4078" right="684" bottom="4110"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1042" ActivityType="4" flags="0" name="路由节点">
<Rect left="535" top="4075" right="567" bottom="4107"/>
</Activity>
<Activity id="1043" ActivityType="4" flags="0" name="路由节点">
<Rect left="535" top="3871" right="567" bottom="3903"/>
</Activity>
<Activity id="1044" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="585" top="4011" right="685" bottom="4043"/>
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
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP705" type="8" flags="97"/>
</Activity>
<Activity id="1045" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="583" top="4136" right="683" bottom="4168"/>
<Line1Text Enable="1" Text="将雨刷开关"/>
<Line2Text Enable="1" Text="拨到OFF,关闭位置"/>
<Script></Script></Activity>
<Activity id="1047" ActivityType="4" flags="0" name="路由节点">
<Rect left="617" top="4198" right="649" bottom="4230"/>
</Activity>
<Activity id="1048" ActivityType="4" flags="0" name="路由节点">
<Rect left="616" top="4253" right="648" bottom="4285"/>
</Activity>
<Activity id="1049" ActivityType="4" flags="0" name="路由节点">
<Rect left="616" top="4318" right="648" bottom="4350"/>
</Activity>
<Activity id="1050" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="4387" right="646" bottom="4419"/>
</Activity>
<Activity id="1051" ActivityType="4" flags="0" name="路由节点">
<Rect left="613" top="4453" right="645" bottom="4485"/>
</Activity>
<Activity id="1054" ActivityType="4" flags="0" name="路由节点">
<Rect left="299" top="4516" right="331" bottom="4548"/>
</Activity>
<Activity id="1062" ActivityType="3" flags="0" name="DlgBackColor">
<Rect left="579" top="4928" right="679" bottom="4960"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1063" ActivityType="3" flags="0" name="ReadDTC">
<Rect left="579" top="5004" right="679" bottom="5036"/>
<Script></Script></Activity>
<Activity id="1065" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="579" top="5281" right="679" bottom="5313"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_BCM1&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="52" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="1066" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="578" top="5209" right="678" bottom="5241"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0146-00,U0141-00,U0199-00,U0200-00,U0201-00,U0202-00,B1035-00,B1002-00,B1005-00,B1008-00,B100B-00,B100E-00,B1011-00,B1014-00,B1017-00,B101A-00,B101D-00,U1037-00,U10A0-00,U1008-00,U0002-00,U1039-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1067" ActivityType="3" flags="0" name="读DTC">
<Rect left="579" top="5137" right="679" bottom="5169"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="52" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="1070" ActivityType="13" flags="0" name="计算key">
<Rect left="610" top="554" right="710" bottom="586"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1093" ActivityType="3" flags="0" name="信号维持">
<Rect left="710" top="674" right="810" bottom="706"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1094" ActivityType="3" flags="0" name="延时200MS">
<Rect left="610" top="734" right="710" bottom="766"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="10" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="6">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="4">
</Transition>
<Transition StartId="10" EndId="858" type="0">
</Transition>
<Transition StartId="858" EndId="859" type="0">
</Transition>
<Transition StartId="859" EndId="1070" type="0">
</Transition>
<Transition StartId="861" EndId="1094" type="0">
</Transition>
<Transition StartId="862" EndId="871" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="871" EndId="877" type="0">
</Transition>
<Transition StartId="877" EndId="884" type="0">
</Transition>
<Transition StartId="884" EndId="886" type="0">
</Transition>
<Transition StartId="886" EndId="887" type="0">
</Transition>
<Transition StartId="887" EndId="888" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="0">
</Transition>
<Transition StartId="889" EndId="893" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="890" EndId="894" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="0">
</Transition>
<Transition StartId="892" EndId="888" type="0">
</Transition>
<Transition StartId="893" EndId="890" type="0">
</Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="0">
</Transition>
<Transition StartId="896" EndId="900" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="897" EndId="901" type="0">
</Transition>
<Transition StartId="898" EndId="899" type="0">
</Transition>
<Transition StartId="899" EndId="895" type="0">
</Transition>
<Transition StartId="900" EndId="897" type="0">
</Transition>
<Transition StartId="901" EndId="902" type="0">
</Transition>
<Transition StartId="902" EndId="903" type="0">
</Transition>
<Transition StartId="903" EndId="907" type="0">
</Transition>
<Transition StartId="904" EndId="905" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="904" EndId="908" type="0">
</Transition>
<Transition StartId="905" EndId="906" type="0">
</Transition>
<Transition StartId="906" EndId="902" type="0">
</Transition>
<Transition StartId="907" EndId="904" type="0">
</Transition>
<Transition StartId="908" EndId="909" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="0">
</Transition>
<Transition StartId="910" EndId="914" type="0">
</Transition>
<Transition StartId="911" EndId="912" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="911" EndId="915" type="0">
</Transition>
<Transition StartId="912" EndId="913" type="0">
</Transition>
<Transition StartId="913" EndId="909" type="0">
</Transition>
<Transition StartId="914" EndId="911" type="0">
</Transition>
<Transition StartId="915" EndId="916" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="0">
</Transition>
<Transition StartId="917" EndId="921" type="0">
</Transition>
<Transition StartId="918" EndId="919" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="918" EndId="923" type="0">
</Transition>
<Transition StartId="918" EndId="946" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" )or ( DString_C131_Car_Tpye == "CH1BM35" )or ( DString_C131_Car_Tpye == "CH1CM33" ) or (DString_C131_Car_Tpye == "CH1PM30") or (DString_C131_Car_Tpye == "CNDA01A")</Expression></Transition>
<Transition StartId="919" EndId="920" type="0">
</Transition>
<Transition StartId="920" EndId="916" type="0">
</Transition>
<Transition StartId="921" EndId="918" type="0">
</Transition>
<Transition StartId="923" EndId="924" type="0">
</Transition>
<Transition StartId="924" EndId="925" type="0">
</Transition>
<Transition StartId="925" EndId="929" type="0">
</Transition>
<Transition StartId="926" EndId="927" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="926" EndId="931" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="0">
</Transition>
<Transition StartId="928" EndId="924" type="0">
</Transition>
<Transition StartId="929" EndId="926" type="0">
</Transition>
<Transition StartId="931" EndId="932" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="937" type="0">
</Transition>
<Transition StartId="934" EndId="935" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="934" EndId="939" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="0">
</Transition>
<Transition StartId="936" EndId="932" type="0">
</Transition>
<Transition StartId="937" EndId="934" type="0">
</Transition>
<Transition StartId="939" EndId="940" type="0">
</Transition>
<Transition StartId="940" EndId="941" type="0">
</Transition>
<Transition StartId="941" EndId="945" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="942" EndId="946" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="940" type="0">
</Transition>
<Transition StartId="945" EndId="942" type="0">
</Transition>
<Transition StartId="946" EndId="947" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="952" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="949" EndId="960" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="947" type="0">
</Transition>
<Transition StartId="952" EndId="949" type="0">
</Transition>
<Transition StartId="960" EndId="961" type="0">
</Transition>
<Transition StartId="961" EndId="962" type="0">
</Transition>
<Transition StartId="962" EndId="966" type="0">
</Transition>
<Transition StartId="963" EndId="964" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="963" EndId="967" type="0">
</Transition>
<Transition StartId="964" EndId="965" type="0">
</Transition>
<Transition StartId="965" EndId="961" type="0">
</Transition>
<Transition StartId="966" EndId="963" type="0">
</Transition>
<Transition StartId="967" EndId="968" type="0">
</Transition>
<Transition StartId="968" EndId="969" type="0">
</Transition>
<Transition StartId="969" EndId="973" type="0">
</Transition>
<Transition StartId="970" EndId="971" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="970" EndId="976" type="0">
</Transition>
<Transition StartId="971" EndId="972" type="0">
</Transition>
<Transition StartId="972" EndId="968" type="0">
</Transition>
<Transition StartId="973" EndId="970" type="0">
</Transition>
<Transition StartId="976" EndId="977" type="0">
</Transition>
<Transition StartId="977" EndId="978" type="0">
</Transition>
<Transition StartId="978" EndId="982" type="0">
</Transition>
<Transition StartId="979" EndId="980" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="979" EndId="983" type="0">
</Transition>
<Transition StartId="980" EndId="981" type="0">
</Transition>
<Transition StartId="981" EndId="977" type="0">
</Transition>
<Transition StartId="982" EndId="979" type="0">
</Transition>
<Transition StartId="983" EndId="984" type="0">
</Transition>
<Transition StartId="984" EndId="985" type="0">
</Transition>
<Transition StartId="985" EndId="989" type="0">
</Transition>
<Transition StartId="986" EndId="987" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="986" EndId="990" type="0">
</Transition>
<Transition StartId="987" EndId="988" type="0">
</Transition>
<Transition StartId="988" EndId="984" type="0">
</Transition>
<Transition StartId="989" EndId="986" type="0">
</Transition>
<Transition StartId="990" EndId="991" type="0">
</Transition>
<Transition StartId="991" EndId="992" type="0">
</Transition>
<Transition StartId="992" EndId="996" type="0">
</Transition>
<Transition StartId="993" EndId="994" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="993" EndId="1005" type="0">
</Transition>
<Transition StartId="994" EndId="995" type="0">
</Transition>
<Transition StartId="995" EndId="991" type="0">
</Transition>
<Transition StartId="996" EndId="993" type="0">
</Transition>
<Transition StartId="997" EndId="998" type="0">
</Transition>
<Transition StartId="998" EndId="999" type="0">
</Transition>
<Transition StartId="999" EndId="1003" type="0">
</Transition>
<Transition StartId="1000" EndId="1001" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1000" EndId="1004" type="0">
</Transition>
<Transition StartId="1001" EndId="1002" type="0">
</Transition>
<Transition StartId="1002" EndId="998" type="0">
</Transition>
<Transition StartId="1003" EndId="1000" type="0">
</Transition>
<Transition StartId="1004" EndId="1006" type="0">
</Transition>
<Transition StartId="1005" EndId="997" type="0">
</Transition>
<Transition StartId="1006" EndId="1007" type="0">
</Transition>
<Transition StartId="1007" EndId="1008" type="0">
</Transition>
<Transition StartId="1008" EndId="1012" type="0">
</Transition>
<Transition StartId="1009" EndId="1010" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1009" EndId="1014" type="0">
</Transition>
<Transition StartId="1010" EndId="1011" type="0">
</Transition>
<Transition StartId="1011" EndId="1007" type="0">
</Transition>
<Transition StartId="1012" EndId="1009" type="0">
</Transition>
<Transition StartId="1014" EndId="1015" type="0">
</Transition>
<Transition StartId="1015" EndId="1016" type="0">
</Transition>
<Transition StartId="1016" EndId="1020" type="0">
</Transition>
<Transition StartId="1017" EndId="1018" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1017" EndId="1022" type="0">
</Transition>
<Transition StartId="1018" EndId="1019" type="0">
</Transition>
<Transition StartId="1019" EndId="1015" type="0">
</Transition>
<Transition StartId="1020" EndId="1017" type="0">
</Transition>
<Transition StartId="1022" EndId="1023" type="0">
</Transition>
<Transition StartId="1023" EndId="1024" type="0">
</Transition>
<Transition StartId="1024" EndId="1028" type="0">
</Transition>
<Transition StartId="1025" EndId="1026" type="1">
<Expression>FinishFlag_1== false</Expression></Transition>
<Transition StartId="1025" EndId="1030" type="0">
</Transition>
<Transition StartId="1026" EndId="1027" type="0">
</Transition>
<Transition StartId="1027" EndId="1023" type="0">
</Transition>
<Transition StartId="1028" EndId="1025" type="0">
</Transition>
<Transition StartId="1030" EndId="1031" type="0">
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
<Transition StartId="1035" EndId="1031" type="0">
</Transition>
<Transition StartId="1036" EndId="1033" type="0">
</Transition>
<Transition StartId="1038" EndId="1039" type="0">
</Transition>
<Transition StartId="1039" EndId="1040" type="0">
</Transition>
<Transition StartId="1040" EndId="1044" type="0">
</Transition>
<Transition StartId="1041" EndId="1042" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1041" EndId="1045" type="0">
</Transition>
<Transition StartId="1042" EndId="1043" type="0">
</Transition>
<Transition StartId="1043" EndId="1039" type="0">
</Transition>
<Transition StartId="1044" EndId="1041" type="0">
</Transition>
<Transition StartId="1045" EndId="1047" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1FM20") and (DString_C131_Car_Tpye ~= "CH1FM30") and (DString_C131_Car_Tpye ~= "CH1GM30") and (DString_C131_Car_Tpye ~= "CH1GM23") and (DString_C131_Car_Tpye ~= "CH1AM43") and (DString_C131_Car_Tpye ~= "CH1AM44")</Expression></Transition>
<Transition StartId="1047" EndId="1048" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1AM46") and (DString_C131_Car_Tpye ~= "CH1GM42") and (DString_C131_Car_Tpye ~= "CH1GM41") and (DString_C131_Car_Tpye ~= "CH1GM40") and (DString_C131_Car_Tpye ~= "CH1AM47") and (DString_C131_Car_Tpye ~= "CH1AM48")</Expression></Transition>
<Transition StartId="1047" EndId="1054" type="0">
</Transition>
<Transition StartId="1048" EndId="1049" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1CM31") and (DString_C131_Car_Tpye ~= "CH1BM34") and (DString_C131_Car_Tpye ~= "CH1DM16") and (DString_C131_Car_Tpye ~= "CH1DM17") and (DString_C131_Car_Tpye ~= "CH1LM13") and (DString_C131_Car_Tpye ~= "CH1LM23")</Expression></Transition>
<Transition StartId="1048" EndId="1054" type="0">
</Transition>
<Transition StartId="1049" EndId="1050" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1CM33") and (DString_C131_Car_Tpye ~= "CH1BM35") and (DString_C131_Car_Tpye ~= "CH1MM41")</Expression></Transition>
<Transition StartId="1049" EndId="1054" type="0">
</Transition>
<Transition StartId="1050" EndId="1051" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1LM21") and (DString_C131_Car_Tpye ~= "CH1JM12") and (DString_C131_Car_Tpye ~= "CH1LM30") and (DString_C131_Car_Tpye ~= "CH1CM30") and (DString_C131_Car_Tpye ~= "CH1CM32")</Expression></Transition>
<Transition StartId="1050" EndId="1054" type="0">
</Transition>
<Transition StartId="1051" EndId="1062" type="0">
</Transition>
<Transition StartId="1054" EndId="1062" type="0">
</Transition>
<Transition StartId="1062" EndId="1063" type="0">
</Transition>
<Transition StartId="1063" EndId="1067" type="0">
</Transition>
<Transition StartId="1065" EndId="2" type="0">
</Transition>
<Transition StartId="1066" EndId="1065" type="0">
</Transition>
<Transition StartId="1067" EndId="1066" type="0">
</Transition>
<Transition StartId="1070" EndId="861" type="0">
</Transition>
<Transition StartId="1093" EndId="1094" type="0">
</Transition>
<Transition StartId="1094" EndId="862" type="0">
</Transition>
</Transitions>
</Process>

