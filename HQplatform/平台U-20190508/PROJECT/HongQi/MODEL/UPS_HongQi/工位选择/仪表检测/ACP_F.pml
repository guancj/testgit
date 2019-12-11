<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x742" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74A" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="74" right="470" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="644" right="170" bottom="676"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="ACP_F">
<Rect left="370" top="134" right="470" bottom="166"/>
<TitleText Enable="1" Text="ACP_F"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
engine.ecu_CAN_control_2 = false ;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="370" top="194" right="470" bottom="226"/>
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
<Rect left="370" top="254" right="470" bottom="286"/>
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
<Activity id="6" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="314" right="470" bottom="346"/>
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
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="130" top="194" right="230" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="重试？">
<Rect left="130" top="314" right="230" bottom="346"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="#L=重试吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON

</Script></Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="374" right="470" bottom="406"/>
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
<Activity id="15" ActivityType="3" flags="0" name="信号维持">
<Rect left="370" top="434" right="470" bottom="466"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1097" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="434" right="620" bottom="466"/>
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
<Activity id="1106" ActivityType="3" flags="0" name="读硬件号">
<Rect left="820" top="434" right="920" bottom="466"/>
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
<Activity id="1107" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="970" top="494" right="1070" bottom="526"/>
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
<Activity id="1108" ActivityType="3" flags="0" name="读软件号">
<Rect left="670" top="494" right="770" bottom="526"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@14);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  300</Script></Activity>
<Activity id="1109" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="520" top="494" right="620" bottom="526"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
	if(( DString_C131_Car_Tpye == "CH1GM30" ) or  ( DString_C131_Car_Tpye == "CH1GM23" ) or ( DString_C131_Car_Tpye == "CH1AM43" ) or ( DString_C131_Car_Tpye == "CH1AM44" ) or ( DString_C131_Car_Tpye == "CH1DM16" ) or ( DString_C131_Car_Tpye == "CH1DM17" ))then
		StandValue="04.00#06.11"; 
        DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1FM20" ) or ( DString_C131_Car_Tpye == "CH1FM30" ) or ( DString_C131_Car_Tpye == "CH1BM34" ) or ( DString_C131_Car_Tpye == "CH1NM11" ) or ( DString_C131_Car_Tpye == "CH1CM31" ) or ( DString_C131_Car_Tpye == "CH1JM12" ))then
		StandValue="04.00#06.11"; 
    	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(( DString_C131_Car_Tpye == "CH1BM35" ) or ( DString_C131_Car_Tpye == "CH1CM33" ))then
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);



                                                      </Script></Activity>
<Activity id="1110" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="434" right="770" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1111" ActivityType="3" flags="0" name="延时300MS">
<Rect left="820" top="494" right="920" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1112" ActivityType="3" flags="0" name="延时300MS">
<Rect left="970" top="434" right="1070" bottom="466"/>
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
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="12" type="4">
</Transition>
<Transition StartId="6" EndId="13" type="0">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="12" EndId="8" type="3">
</Transition>
<Transition StartId="13" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="1097" type="0">
</Transition>
<Transition StartId="1097" EndId="1110" type="0">
</Transition>
<Transition StartId="1106" EndId="1112" type="0">
</Transition>
<Transition StartId="1107" EndId="1111" type="0">
</Transition>
<Transition StartId="1108" EndId="1109" type="0">
</Transition>
<Transition StartId="1110" EndId="1106" type="0">
</Transition>
<Transition StartId="1111" EndId="1108" type="0">
</Transition>
<Transition StartId="1112" EndId="1107" type="0">
</Transition>
</Transitions>
</Process>

