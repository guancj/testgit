<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
<Parameters>
<Variable id="DString_C131_Partnumber_PEPS" type="8" dir="0" data="DString_C131_Partnumber_PEPS"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="521" top="26" right="621" bottom="58"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="520" top="984" right="620" bottom="1016"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
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
<Activity id="3" ActivityType="3" flags="0" name="智能进入系统 (PEPS)">
<Rect left="521" top="93" right="621" bottom="125"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
--engine.ecu_CAN_control_2 = false;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="520" top="159" right="620" bottom="191"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="520" top="232" right="620" bottom="264"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="重试？">
<Rect left="215" top="311" right="315" bottom="343"/>
<Line1Text Enable="1" Text="PEPS控制器连接失败！"/>
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
<Rect left="216" top="158" right="316" bottom="190"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="314" right="176" bottom="346"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="520" top="312" right="620" bottom="344"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="520" top="384" right="620" bottom="416"/>
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
<assessment no="2" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="524" right="620" bottom="556"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_PEPS);
engine.println("零件号标准值:"..DString_C131_Partnumber_PEPS);
len = string.len(DString_C131_Partnumber_PEPS)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_PEPS) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PEPS); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PEPS);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_PEPS;
	
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
	
		if (DString1==DString_C131_Partnumber_PEPS) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PEPS); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PEPS);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_PEPS;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="6" name="DEP359" type="8" flags="97"/>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="读硬件号">
<Rect left="881" top="447" right="981" bottom="479"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@14);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1
engine.LastError = 0;</Script><assessment no="7" name="DEP360" type="8" flags="97"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="延时100MS">
<Rect left="520" top="584" right="620" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="882" top="505" right="982" bottom="537"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@5);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1
engine.LastError = 0;</Script><assessment no="8" name="DEP361" type="8" flags="97"/>
</Activity>
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1000" top="494" right="1100" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="延时700MS">
<Rect left="877" top="385" right="977" bottom="417"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="885" ActivityType="3" flags="0" name="读软件号">
<Rect left="883" top="565" right="983" bottom="597"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@14);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
engine.LastError = 0;</Script><assessment no="9" name="DEP362" type="8" flags="97"/>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="延时300MS">
<Rect left="880" top="644" right="980" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="915" ActivityType="3" flags="0" name="ReadDTC">
<Rect left="870" top="734" right="970" bottom="766"/>
<Script></Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="874" right="936" bottom="906"/>
</Activity>
<Activity id="918" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="870" top="1004" right="970" bottom="1036"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C079_PEPS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="919" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="870" top="944" right="970" bottom="976"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0141-00,U0199-00,U0200-00,U0201-00,U0202-00,U0146-00,U250A-00,U250B-00,B12F3-00,B12F4-00,B12F5-00,B141A-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="920" ActivityType="3" flags="0" name="读DTC">
<Rect left="870" top="804" right="970" bottom="836"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x0C
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="923" ActivityType="3" flags="0" name="信号维持">
<Rect left="630" top="454" right="730" bottom="486"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="924" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="520" top="654" right="620" bottom="686"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
        StandValue="130";
        StandValue1 ="131";
        DString1=string.char(@3,@4,@5);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="" )then
		if(StandValue == DString1 or StandValue1 == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue.."or"..StandValue1);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue.."or"..StandValue1);
		end
	else
		engine.println("不比对软件版本号");
	end                 
	engine.StatValue=DString1;
	engine.StatPoint=StandValue.."or"..StandValue1;	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="10" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="925" ActivityType="13" flags="0" name="读故障码">
<Rect left="520" top="724" right="620" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x09"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="926" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="520" top="814" right="620" bottom="846"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B12F300&quot;,&quot;B12F400&quot;,&quot;B12F500&quot;,&quot;U014187&quot;,&quot;U019987&quot;,&quot;U020087&quot;,&quot;U020187&quot;,&quot;U020287&quot;,&quot;U014687&quot;,&quot;U023087&quot;,&quot;U114687&quot;,&quot;U124587&quot;,&quot;U019887&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_PEPS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="60" name="DEP2083" type="8" flags="97"/>
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
<Transition StartId="6" EndId="8" type="6">
</Transition>
<Transition StartId="6" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="6" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="924" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="885" type="0">
</Transition>
<Transition StartId="867" EndId="863" type="0">
</Transition>
<Transition StartId="885" EndId="903" type="0">
</Transition>
<Transition StartId="915" EndId="920" type="0">
</Transition>
<Transition StartId="916" EndId="919" type="0">
</Transition>
<Transition StartId="919" EndId="918" type="0">
</Transition>
<Transition StartId="920" EndId="916" type="0">
</Transition>
<Transition StartId="923" EndId="12" type="0">
</Transition>
<Transition StartId="924" EndId="925" type="0">
</Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

