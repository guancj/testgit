<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1111" pbltext="DEP26">
<Parameters>
<Variable id="DString_C131_Partnumber_AC" type="8" dir="0" data="DString_C131_Partnumber_AC"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x762" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x782" description="CANId"/>
<Variable id="TimeStart" type="3" data="0" description="开始计时"/>
<Variable id="TimeOut" type="3" data="15" description="超时时间"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="540" top="34" right="640" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="2114" right="310" bottom="2146"/>
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
<Activity id="3" ActivityType="3" flags="0" name="DlgMultiInit">
<Rect left="540" top="104" right="640" bottom="136"/>
<TitleText Enable="1" Text="空调（AC）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
engine.ecu_CAN_control_2 = true;
#DELAY  500</Script></Activity>
<Activity id="5" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="34" right="66" bottom="66"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="540" top="194" right="640" bottom="226"/>
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
<Activity id="7" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="540" top="274" right="640" bottom="306"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1901" name="DEP1076" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="重试？">
<Rect left="228" top="347" right="328" bottom="379"/>
<Line1Text Enable="1" Text="AC 控制器连接失败！"/>
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
<Activity id="9" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="229" top="194" right="329" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="4" flags="0" name="路由节点">
<Rect left="160" top="346" right="192" bottom="378"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="540" top="354" right="640" bottom="386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1900" name="DEP27" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="2114" right="66" bottom="2146"/>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="540" top="424" right="640" bottom="456"/>
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
<assessment no="1" name="DEP28" type="8" flags="97"/>
</Activity>
<Activity id="868" ActivityType="3" flags="0" name="延时200MS">
<Rect left="540" top="654" right="640" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="880" ActivityType="3" flags="0" name="普通节点">
<Rect left="860" top="754" right="960" bottom="786"/>
<Script></Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="794" right="730" bottom="826"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0111"
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

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="882" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="754" right="730" bottom="786"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0009"
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="883" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="834" right="730" bottom="866"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0100"
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);

</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="874" right="730" bottom="906"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0100"
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);

</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="885" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="914" right="730" bottom="946"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0100"
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="886" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="954" right="730" bottom="986"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0073"
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="887" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="1004" right="730" bottom="1036"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0081"
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

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;

</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="888" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="1044" right="730" bottom="1076"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0073"
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="889" ActivityType="3" flags="0" name="延时100MS">
<Rect left="400" top="1244" right="500" bottom="1276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="890" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="1244" right="926" bottom="1276"/>
</Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="1314" right="286" bottom="1346"/>
</Activity>
<Activity id="897" ActivityType="13" flags="0" name="Swing_registor_motor_check">
<Rect left="210" top="1364" right="310" bottom="1396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x20\x07\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="898" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="210" top="1424" right="310" bottom="1456"/>
<TitleText Enable="1" Text="请稍等"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="0"/>
<Parameter id="Timeout" value="3"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="DlgMultiLineSetAll">
<Rect left="210" top="1484" right="310" bottom="1516"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="AC 摆风机构正在动作"/>
<Script></Script></Activity>
<Activity id="900" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="210" top="1544" right="310" bottom="1576"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="3"/>
<Parameter id="Timeout" value="8"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="901" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="210" top="1604" right="310" bottom="1636"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x20\x07\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="902" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="210" top="1664" right="310" bottom="1696"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<Line1Text Enable="1" Text="是否完成了2次往复动作？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow";
TimeStart = os.time();
repeat
	TimeDiff = os.difftime(os.time(),TimeStart);
until((engine.start_press==false)or(engine.stop_press==true)or(TimeDiff&gt;TimeOut))
engine.println("stop_press:"..tostring(engine.stop_press));
engine.println("start_press:"..tostring(engine.start_press));</Script></Activity>
<Activity id="903" ActivityType="13" flags="0" name="swing_motor_ReturnControlToECU">
<Rect left="210" top="1784" right="310" bottom="1816"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x20\x07\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="904" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1314" right="466" bottom="1346"/>
</Activity>
<Activity id="1065" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="210" top="1964" right="310" bottom="1996"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_AIRCO&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="41" name="DEP163" type="8" flags="97"/>
</Activity>
<Activity id="1066" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="210" top="1904" right="310" bottom="1936"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1282-15,B1290-15,U0002-87,U0100-87,U0122-87,U0146-87}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1067" ActivityType="3" flags="0" name="读DTC">
<Rect left="210" top="1844" right="310" bottom="1876"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="41" name="DEP163" type="8" flags="97"/>
</Activity>
<Activity id="1071" ActivityType="3" flags="0" name="信号维持">
<Rect left="440" top="464" right="540" bottom="496"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1133" ActivityType="3" flags="0" name="检测失败">
<Rect left="70" top="1724" right="170" bottom="1756"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script></Activity>
<Activity id="1134" ActivityType="3" flags="0" name="检测成功">
<Rect left="340" top="1724" right="440" bottom="1756"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;</Script></Activity>
<Activity id="1135" ActivityType="3" flags="0" name="DlgSichtpruefung_Clear">
<Rect left="210" top="1724" right="310" bottom="1756"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<Line1Text Enable="1" Text="是否完成了2次往复动作"/>
<Line2Text Enable="1" Text="#L=OK?#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>--#PRESSBUTTON</Script></Activity>
<Activity id="1136" ActivityType="3" flags="0" name="比对零件号">
<Rect left="540" top="584" right="640" bottom="616"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_AC);
engine.println("零件号标准值:"..DString_C131_Partnumber_AC);
len = string.len(DString_C131_Partnumber_AC)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_AC) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_AC); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_AC);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_AC;
	
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
	
		if (DString1==DString_C131_Partnumber_AC) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_AC); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_AC);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_AC;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="4" name="DEP230" type="8" flags="97"/>
</Activity>
<Activity id="1137" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="1094" right="730" bottom="1126"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0112"
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="1138" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="1144" right="730" bottom="1176"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0081"
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

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;


</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
<Activity id="1139" ActivityType="3" flags="0" name="延时300MS">
<Rect left="540" top="514" right="640" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1140" ActivityType="13" flags="0" name="读故障码">
<Rect left="400" top="1994" right="500" bottom="2026"/>
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
<assessment no="41" name="DEP163" type="8" flags="97"/>
</Activity>
<Activity id="1141" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="400" top="2114" right="500" bottom="2146"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B1282-15&quot;,&quot;B1290-15&quot;,&quot;U0002-87&quot;,&quot;U0100-87&quot;,&quot;U0146-87&quot;,&quot;U0122-87&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_AIRCO&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="41" name="DEP163" type="8" flags="97"/>
</Activity>
<Activity id="1142" ActivityType="3" flags="0" name="V6软件版本号">
<Rect left="630" top="1194" right="730" bottom="1226"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0200"
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

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="7" name="DEP220" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="1">
<Expression>( DString_C131_Car_Tpye ~= "CH1DM11" ) and ( DString_C131_Car_Tpye ~= "CH1DM13" )</Expression></Transition>
<Transition StartId="1" EndId="5" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="12" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="11" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="6">
</Transition>
<Transition StartId="8" EndId="10" type="5">
</Transition>
<Transition StartId="9" EndId="6" type="0">
</Transition>
<Transition StartId="11" EndId="8" type="4">
</Transition>
<Transition StartId="11" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="2" type="0">
</Transition>
<Transition StartId="13" EndId="1139" type="0">
</Transition>
<Transition StartId="868" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="881" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1LM11" ) or ( DString_C131_Car_Tpye == "CH1LM21" ) or ( DString_C131_Car_Tpye == "CH1MM21" ) or (DString_C131_Car_Tpye == "CH1LM13") or (DString_C131_Car_Tpye == "CH1LM23") </Expression></Transition>
<Transition StartId="880" EndId="882" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" )</Expression></Transition>
<Transition StartId="880" EndId="883" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1FM12" ) or ( DString_C131_Car_Tpye == "CH1FM13" ) or (DString_C131_Car_Tpye == "CH1FM20") or (DString_C131_Car_Tpye == "CH1FM30")</Expression></Transition>
<Transition StartId="880" EndId="884" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1JM11" ) or ( DString_C131_Car_Tpye == "CH1JM12" )</Expression></Transition>
<Transition StartId="880" EndId="885" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1DM17" ) or ( DString_C131_Car_Tpye == "CH1DM16" )</Expression></Transition>
<Transition StartId="880" EndId="886" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM30" ) or ( DString_C131_Car_Tpye == "CH1GM23" ) or ( DString_C131_Car_Tpye == "CH1AM43" ) or ( DString_C131_Car_Tpye == "CH1AM44" ) or ( DString_C131_Car_Tpye == "CH1BM34" ) or ( DString_C131_Car_Tpye == "CH1BM35")</Expression></Transition>
<Transition StartId="880" EndId="887" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1GM41") or (DString_C131_Car_Tpye == "CH1GM42") or (DString_C131_Car_Tpye == "CH1GM40") or (DString_C131_Car_Tpye == "CH1AM46") or (DString_C131_Car_Tpye == "CH1AM47") or (DString_C131_Car_Tpye == "CH1AM48")</Expression></Transition>
<Transition StartId="880" EndId="888" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1NM11" ) or ( DString_C131_Car_Tpye == "CH1CM31" ) or ( DString_C131_Car_Tpye == "CH1CM30" ) or ( DString_C131_Car_Tpye == "CH1CM33" ) or ( DString_C131_Car_Tpye == "CH1CM32")</Expression></Transition>
<Transition StartId="880" EndId="890" type="0">
</Transition>
<Transition StartId="880" EndId="1137" type="1">
<Expression>DString_C131_Car_Tpye == "CH1MM41"</Expression></Transition>
<Transition StartId="880" EndId="1138" type="1">
<Expression>(DString_C131_Car_Tpye == "CMNA02A") or (DString_C131_Car_Tpye == "CMNA01A") or (DString_C131_Car_Tpye == "CH1QM30") or (DString_C131_Car_Tpye == "CH1QM40") or (DString_C131_Car_Tpye == "CH1QM50")</Expression></Transition>
<Transition StartId="880" EndId="1142" type="1">
<Expression>(DString_C131_Car_Tpye == "CNDA01A")or (DString_C131_Car_Tpye == "CH1PM30")or (DString_C131_Car_Tpye == "CH1PM20")</Expression></Transition>
<Transition StartId="881" EndId="889" type="0">
</Transition>
<Transition StartId="882" EndId="889" type="0">
</Transition>
<Transition StartId="883" EndId="889" type="0">
</Transition>
<Transition StartId="884" EndId="889" type="0">
</Transition>
<Transition StartId="885" EndId="889" type="0">
</Transition>
<Transition StartId="886" EndId="889" type="0">
</Transition>
<Transition StartId="887" EndId="889" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="0">
</Transition>
<Transition StartId="889" EndId="904" type="0">
</Transition>
<Transition StartId="890" EndId="889" type="0">
</Transition>
<Transition StartId="894" EndId="897" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1LM13") and (DString_C131_Car_Tpye ~= "CH1LM23") and (DString_C131_Car_Tpye ~= "CH1MM21") and (DString_C131_Car_Tpye ~= "CH1CM31")</Expression></Transition>
<Transition StartId="894" EndId="904" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="898" EndId="899" type="0">
</Transition>
<Transition StartId="899" EndId="900" type="0">
</Transition>
<Transition StartId="900" EndId="901" type="0">
</Transition>
<Transition StartId="901" EndId="902" type="0">
</Transition>
<Transition StartId="902" EndId="1134" type="1">
<Expression>engine.start_press==false</Expression></Transition>
<Transition StartId="902" EndId="1133" type="1">
<Expression>engine.stop_press==true</Expression></Transition>
<Transition StartId="902" EndId="1135" type="1">
<Expression>TimeDiff&gt;TimeOut</Expression></Transition>
<Transition StartId="904" EndId="1140" type="0">
</Transition>
<Transition StartId="1065" EndId="2" type="0">
</Transition>
<Transition StartId="1066" EndId="1065" type="0">
</Transition>
<Transition StartId="1067" EndId="1066" type="0">
</Transition>
<Transition StartId="1071" EndId="1139" type="0">
</Transition>
<Transition StartId="1133" EndId="903" type="0">
</Transition>
<Transition StartId="1134" EndId="903" type="0">
</Transition>
<Transition StartId="1135" EndId="1134" type="6">
</Transition>
<Transition StartId="1135" EndId="1133" type="5">
</Transition>
<Transition StartId="1136" EndId="868" type="0">
</Transition>
<Transition StartId="1137" EndId="889" type="0">
</Transition>
<Transition StartId="1138" EndId="889" type="0">
</Transition>
<Transition StartId="1139" EndId="1136" type="0">
</Transition>
<Transition StartId="1140" EndId="1141" type="0">
</Transition>
<Transition StartId="1141" EndId="2" type="0">
</Transition>
<Transition StartId="1142" EndId="889" type="0">
</Transition>
</Transitions>
</Process>

