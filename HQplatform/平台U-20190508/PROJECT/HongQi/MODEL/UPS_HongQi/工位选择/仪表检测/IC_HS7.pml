<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1110" pbltext="DEP1659">
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="44" right="470" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="220" top="704" right="320" bottom="736"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="1" name="组合仪表板 (IVI)">
<Rect left="370" top="104" right="470" bottom="136"/>
<TitleText Enable="1" Text="组合仪表板 (IC)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
engine.ecu_CAN_control_2 = false ;
#DELAY  500</Script></Activity>
<Activity id="1105" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="370" top="164" right="470" bottom="196"/>
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
<Activity id="1106" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="370" top="224" right="470" bottom="256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP1644" type="8" flags="97"/>
</Activity>
<Activity id="1107" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="284" right="470" bottom="316"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="1108" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="220" top="104" right="320" bottom="136"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1109" ActivityType="3" flags="0" name="重试？">
<Rect left="220" top="284" right="320" bottom="316"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="#L=重试吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON

</Script></Activity>
<Activity id="1110" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="370" top="344" right="470" bottom="376"/>
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
<assessment no="3" name="DEP38" type="8" flags="97"/>
</Activity>
<Activity id="1111" ActivityType="3" flags="0" name="信号维持">
<Rect left="290" top="404" right="390" bottom="436"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1112" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="370" top="464" right="470" bottom="496"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2204" name="DEP39" type="8" flags="97"/>
</Activity>
<Activity id="1141" ActivityType="13" flags="0" name="计算">
<Rect left="370" top="524" right="470" bottom="556"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x96B968CA"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1143" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="464" right="620" bottom="496"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_IC);
engine.println("零件号标准值:"..DString_C131_Partnumber_IC);
len = string.len(DString_C131_Partnumber_IC)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_IC) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_IC); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_IC);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_IC;
	
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
	
		if (DString1==DString_C131_Partnumber_IC) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_IC); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_IC);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_IC;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="4" name="DEP240" type="8" flags="97"/>
</Activity>
<Activity id="1144" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="404" right="620" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1145" ActivityType="3" flags="0" name="读硬件号">
<Rect left="520" top="344" right="620" bottom="376"/>
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
</Script><assessment no="5" name="DEP241" type="8" flags="97"/>
</Activity>
<Activity id="1146" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="344" right="770" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1147" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="670" top="404" right="770" bottom="436"/>
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
</Script><assessment no="6" name="DEP242" type="8" flags="97"/>
</Activity>
<Activity id="1148" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="464" right="770" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1149" ActivityType="3" flags="0" name="读软件号">
<Rect left="670" top="524" right="770" bottom="556"/>
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
#DELAY  300</Script><assessment no="7" name="DEP243" type="8" flags="97"/>
</Activity>
<Activity id="1150" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="670" top="584" right="770" bottom="616"/>
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
        elseif(( DString_C131_Car_Tpye == "CDAB01" ) or ( DString_C131_Car_Tpye == "CDAB02" ) or ( DString_C131_Car_Tpye == "CDAB03" )  or ( DString_C131_Car_Tpye == "CDAB04" ))then
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



                                                      </Script><assessment no="8" name="DEP244" type="8" flags="97"/>
</Activity>
<Activity id="1151" ActivityType="13" flags="0" name="backlightL5">
<Rect left="520" top="584" right="620" bottom="616"/>
<Line1Text Enable="1" Text="仪表背光级别5自动开启"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD3\x61\x03\x00\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1153" ActivityType="3" flags="0" name="发送key">
<Rect left="520" top="524" right="620" bottom="556"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2205" name="DEP40" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1105" type="0">
</Transition>
<Transition StartId="1105" EndId="1106" type="0">
</Transition>
<Transition StartId="1106" EndId="1107" type="0">
</Transition>
<Transition StartId="1107" EndId="1109" type="4">
</Transition>
<Transition StartId="1107" EndId="1110" type="0">
</Transition>
<Transition StartId="1108" EndId="3" type="0">
</Transition>
<Transition StartId="1109" EndId="1108" type="6">
</Transition>
<Transition StartId="1109" EndId="2" type="5">
</Transition>
<Transition StartId="1110" EndId="1112" type="0">
</Transition>
<Transition StartId="1111" EndId="1112" type="0">
</Transition>
<Transition StartId="1112" EndId="1141" type="0">
</Transition>
<Transition StartId="1141" EndId="1153" type="0">
</Transition>
<Transition StartId="1143" EndId="1144" type="0">
</Transition>
<Transition StartId="1144" EndId="1145" type="0">
</Transition>
<Transition StartId="1145" EndId="1146" type="0">
</Transition>
<Transition StartId="1146" EndId="1147" type="0">
</Transition>
<Transition StartId="1147" EndId="1148" type="0">
</Transition>
<Transition StartId="1148" EndId="1149" type="0">
</Transition>
<Transition StartId="1149" EndId="1150" type="0">
</Transition>
<Transition StartId="1150" EndId="1151" type="0">
</Transition>
<Transition StartId="1151" EndId="2" type="0">
</Transition>
<Transition StartId="1153" EndId="1143" type="0">
</Transition>
</Transitions>
</Process>

