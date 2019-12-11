<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1117" pbltext="DEP36">
<Parameters>
<Variable id="DString_C131_Partnumber_IC" type="8" dir="0" data="DString_C131_Partnumber_IC"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x728" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
<Variable id="TimeStart" type="3" data="0" description="开始计时"/>
<Variable id="TimeOut" type="3" data="10" description="时时间"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="520" top="44" right="620" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="200" top="1844" right="300" bottom="1876"/>
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
<Activity id="3" ActivityType="3" flags="0" name="组合仪表板 (IC)">
<Rect left="520" top="104" right="620" bottom="136"/>
<TitleText Enable="1" Text="组合仪表板 (IC)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
engine.ecu_CAN_control_2 = false ;
#DELAY  500</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="520" top="164" right="620" bottom="196"/>
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
<Rect left="520" top="234" right="620" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2202" name="DEP1074" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="220" top="164" right="320" bottom="196"/>
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
<Rect left="520" top="294" right="620" bottom="326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2200" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="520" top="414" right="620" bottom="446"/>
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
<assessment no="2203" name="DEP38" type="8" flags="97"/>
</Activity>
<Activity id="862" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="474" right="620" bottom="506"/>
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
end</Script><assessment no="1" name="DEP240" type="8" flags="97"/>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="读硬件号">
<Rect left="890" top="454" right="990" bottom="486"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;
</Script><assessment no="2" name="DEP241" type="8" flags="97"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="延时300MS">
<Rect left="890" top="514" right="990" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="890" top="584" right="990" bottom="616"/>
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
</Script><assessment no="3" name="DEP242" type="8" flags="97"/>
</Activity>
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="554" right="620" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="868" ActivityType="3" flags="0" name="延时700MS">
<Rect left="890" top="384" right="990" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="892" ActivityType="3" flags="0" name="读软件号">
<Rect left="390" top="794" right="490" bottom="826"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
--if(( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CMNA02A" )or ( DString_C131_Car_Tpye == "CNDA01A" ))then
--		StandValue="C023017"; 
--elseif(DString_C131_Car_Tpye == "CH1MM41" )then
--		StandValue="C028122"; 
if(@0==0x62)then
	StandValue="C023017"; 
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                                     

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
DString1=string.char(@3)..hexstr(@4-@6);

engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="4" name="DEP243" type="8" flags="97"/>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="944" right="620" bottom="976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="仪表板所有指示灯关闭指令">
<Rect left="280" top="1364" right="380" bottom="1396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x00\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="899" ActivityType="13" flags="0" name="仪表板所有指示灯点亮指令">
<Rect left="520" top="1124" right="620" bottom="1156"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x00\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="902" ActivityType="13" flags="0" name="Return_Control_To_ECU">
<Rect left="610" top="1544" right="710" bottom="1576"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="903" ActivityType="13" flags="0" name="喇叭开启指令">
<Rect left="940" top="1184" right="1040" bottom="1216"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x01\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="905" ActivityType="13" flags="0" name="Return_Control_To_ECU">
<Rect left="940" top="1424" right="1040" bottom="1456"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x01\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="906" ActivityType="13" flags="0" name="仪表板内所有指针工作指令">
<Rect left="940" top="1484" right="1040" bottom="1516"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x03\x03\x05&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="908" ActivityType="13" flags="0" name="Return_Control_To_ECU">
<Rect left="940" top="1664" right="1040" bottom="1696"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x0A\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="909" ActivityType="13" flags="0" name="打印障码">
<Rect left="520" top="1844" right="620" bottom="1876"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_CLUSTER&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="38" name="DEP134" type="8" flags="97"/>
</Activity>
<Activity id="1066" ActivityType="13" flags="0" name="过滤故障码">
<Rect left="670" top="1844" right="770" bottom="1876"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0146-00,P1BBA-00,P1BBB-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1067" ActivityType="3" flags="0" name="读DTC">
<Rect left="820" top="1844" right="920" bottom="1876"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP134" type="8" flags="97"/>
</Activity>
<Activity id="1069" ActivityType="3" flags="0" name="重试？">
<Rect left="220" top="294" right="320" bottom="326"/>
<Line1Text Enable="1" Text="IC控制器连接失败！"/>
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
--engine.println("flag:"..tostring(flag));
</Script></Activity>
<Activity id="1094" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="520" top="1004" right="620" bottom="1036"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2202" name="DEP1074" type="8" flags="97"/>
</Activity>
<Activity id="1095" ActivityType="3" flags="0" name="延时300MS">
<Rect left="940" top="1754" right="1040" bottom="1786"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1096" ActivityType="3" flags="0" name="信号维持">
<Rect left="620" top="1064" right="720" bottom="1096"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1104" ActivityType="3" flags="0" name="检测失败">
<Rect left="130" top="1244" right="230" bottom="1276"/>
<Line2Text Enable="1" Text="检测不合格"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;
#DELAY  500</Script><assessment no="34" name="DEP461" type="8" flags="97"/>
</Activity>
<Activity id="1105" ActivityType="3" flags="0" name="检测成功">
<Rect left="460" top="1244" right="560" bottom="1276"/>
<Line2Text Enable="1" Text="检测合格"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;
#DELAY  500</Script><assessment no="34" name="DEP461" type="8" flags="97"/>
</Activity>
<Activity id="1132" ActivityType="3" flags="0" name="检测失败">
<Rect left="130" top="1484" right="230" bottom="1516"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="35" name="DEP462" type="8" flags="97"/>
</Activity>
<Activity id="1133" ActivityType="3" flags="0" name="检测成功">
<Rect left="460" top="1484" right="560" bottom="1516"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;</Script><assessment no="35" name="DEP462" type="8" flags="97"/>
</Activity>
<Activity id="1134" ActivityType="3" flags="0" name="检测成功">
<Rect left="1090" top="1304" right="1190" bottom="1336"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;</Script><assessment no="36" name="DEP464" type="8" flags="97"/>
</Activity>
<Activity id="1135" ActivityType="3" flags="0" name="检测失败">
<Rect left="790" top="1304" right="890" bottom="1336"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="36" name="DEP464" type="8" flags="97"/>
</Activity>
<Activity id="1136" ActivityType="3" flags="0" name="检测失败">
<Rect left="790" top="1604" right="890" bottom="1636"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="37" name="DEP466" type="8" flags="97"/>
</Activity>
<Activity id="1137" ActivityType="3" flags="0" name="检测成功">
<Rect left="1090" top="1604" right="1190" bottom="1636"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;</Script><assessment no="37" name="DEP466" type="8" flags="97"/>
</Activity>
<Activity id="1138" ActivityType="3" flags="0" name="延时300MS">
<Rect left="280" top="1304" right="380" bottom="1336"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1139" ActivityType="3" flags="0" name="延时300MS">
<Rect left="280" top="1544" right="380" bottom="1576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1140" ActivityType="3" flags="0" name="延时300MS">
<Rect left="940" top="1364" right="1040" bottom="1396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1141" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="280" top="1244" right="380" bottom="1276"/>
<Line1Text Enable="1" Text="仪表板所有指示灯是否都亮？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "yellow";
#PRESSBUTTON</Script></Activity>
<Activity id="1142" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="280" top="1484" right="380" bottom="1516"/>
<Line1Text Enable="1" Text="仪表板所有指示灯都关闭？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="1143" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="940" top="1304" right="1040" bottom="1336"/>
<Line1Text Enable="1" Text="喇叭开启？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="1144" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="940" top="1604" right="1040" bottom="1636"/>
<Line1Text Enable="1" Text="仪表板内所有指针都工作？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1145" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1184" right="676" bottom="1216"/>
</Activity>
<Activity id="1147" ActivityType="3" flags="0" name="读软件号">
<Rect left="520" top="794" right="620" bottom="826"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
--if(( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CMNA02A" )or ( DString_C131_Car_Tpye == "CNDA01A" ))then
--		StandValue="C023017"; 
--elseif(DString_C131_Car_Tpye == "CH1MM41" )then
--		StandValue="C028122"; 
if(@0==0x62)then
	StandValue="C028122"; 
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                                     

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
DString1=string.char(@3)..hexstr(@4-@6);

engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;</Script><assessment no="4" name="DEP243" type="8" flags="97"/>
</Activity>
<Activity id="1148" ActivityType="3" flags="0" name="读软件号">
<Rect left="650" top="794" right="750" bottom="826"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
--if(( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CMNA02A" )or ( DString_C131_Car_Tpye == "CNDA01A" ))then
--		StandValue="C023017"; 
--elseif(DString_C131_Car_Tpye == "CH1MM41" )then
--		StandValue="C028122"; 
if(@0==0x62)then
	StandValue="C020306"; 
        StandValue1="C020308"; 
	engine.SetLineText(2,StandValue.."或"..StandValue1);
	engine.println("软件号标准值:"..StandValue.."或"..StandValue1);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1 or StandValue1 == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1);
		end
                        engine.StatValue=DString1;
	else
		engine.println("不比对软件号");
	end                                     

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.StatPoint=StandValue.."或"..StandValue1
</Script><assessment no="4" name="DEP243" type="8" flags="97"/>
</Activity>
<Activity id="1149" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="354" right="620" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1150" ActivityType="13" flags="0" name="清故障码">
<Rect left="940" top="1844" right="1040" bottom="1876"/>
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
<assessment no="2203" name="DEP38" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="1069" type="4">
</Transition>
<Transition StartId="10" EndId="1149" type="0">
</Transition>
<Transition StartId="11" EndId="862" type="0">
</Transition>
<Transition StartId="862" EndId="866" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="866" EndId="892" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CH1CM32" ) or ( DString_C131_Car_Tpye == "CH1CM33" ) or ( DString_C131_Car_Tpye == "CH1BM35" )</Expression></Transition>
<Transition StartId="866" EndId="1147" type="1">
<Expression>DString_C131_Car_Tpye == "CH1MM41"</Expression></Transition>
<Transition StartId="866" EndId="1148" type="1">
<Expression>( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CMNA02A" )or ( DString_C131_Car_Tpye == "CH1QM30" )or ( DString_C131_Car_Tpye == "CH1QM40" )or ( DString_C131_Car_Tpye == "CH1QM50" )or ( DString_C131_Car_Tpye == "CH1PM20" )or ( DString_C131_Car_Tpye == "CH1PM30" )or ( DString_C131_Car_Tpye == "CNDA01A" )</Expression></Transition>
<Transition StartId="868" EndId="863" type="0">
</Transition>
<Transition StartId="892" EndId="894" type="0">
</Transition>
<Transition StartId="894" EndId="1094" type="0">
</Transition>
<Transition StartId="898" EndId="1142" type="0">
</Transition>
<Transition StartId="899" EndId="1141" type="0">
</Transition>
<Transition StartId="902" EndId="1145" type="0">
</Transition>
<Transition StartId="903" EndId="1143" type="0">
</Transition>
<Transition StartId="905" EndId="906" type="0">
</Transition>
<Transition StartId="906" EndId="1144" type="0">
</Transition>
<Transition StartId="908" EndId="1095" type="0">
</Transition>
<Transition StartId="909" EndId="2" type="0">
</Transition>
<Transition StartId="1066" EndId="909" type="0">
</Transition>
<Transition StartId="1067" EndId="1066" type="0">
</Transition>
<Transition StartId="1069" EndId="9" type="5">
</Transition>
<Transition StartId="1069" EndId="8" type="6">
</Transition>
<Transition StartId="1094" EndId="899" type="0">
</Transition>
<Transition StartId="1095" EndId="1150" type="0">
</Transition>
<Transition StartId="1096" EndId="899" type="0">
</Transition>
<Transition StartId="1104" EndId="1138" type="0">
</Transition>
<Transition StartId="1105" EndId="1138" type="0">
</Transition>
<Transition StartId="1132" EndId="1139" type="0">
</Transition>
<Transition StartId="1133" EndId="1139" type="0">
</Transition>
<Transition StartId="1134" EndId="1140" type="0">
</Transition>
<Transition StartId="1135" EndId="1140" type="0">
</Transition>
<Transition StartId="1136" EndId="908" type="0">
</Transition>
<Transition StartId="1137" EndId="908" type="0">
</Transition>
<Transition StartId="1138" EndId="898" type="0">
</Transition>
<Transition StartId="1139" EndId="902" type="0">
</Transition>
<Transition StartId="1140" EndId="905" type="0">
</Transition>
<Transition StartId="1141" EndId="1104" type="5">
</Transition>
<Transition StartId="1141" EndId="1105" type="6">
</Transition>
<Transition StartId="1142" EndId="1132" type="5">
</Transition>
<Transition StartId="1142" EndId="1133" type="6">
</Transition>
<Transition StartId="1143" EndId="1135" type="5">
</Transition>
<Transition StartId="1143" EndId="1134" type="6">
</Transition>
<Transition StartId="1144" EndId="1137" type="6">
</Transition>
<Transition StartId="1144" EndId="1136" type="5">
</Transition>
<Transition StartId="1145" EndId="903" type="0">
</Transition>
<Transition StartId="1147" EndId="894" type="0">
</Transition>
<Transition StartId="1148" EndId="894" type="0">
</Transition>
<Transition StartId="1149" EndId="11" type="0">
</Transition>
<Transition StartId="1150" EndId="1067" type="0">
</Transition>
</Transitions>
</Process>

