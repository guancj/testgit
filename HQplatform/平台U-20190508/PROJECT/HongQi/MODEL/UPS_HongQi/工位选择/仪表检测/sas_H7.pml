<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1116" pbltext="DEP79">
<Parameters>
<Variable id="DString_C131_Partnumber_SAS" type="8" dir="0" data="DString_C131_Partnumber_SAS"/>
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
<Variable id="P2Max" type="3" data="5000" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="550" top="34" right="650" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="550" top="1124" right="650" bottom="1156"/>
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
<Activity id="3" ActivityType="3" flags="0" name="转角传感器 (SAS)">
<Rect left="550" top="94" right="650" bottom="126"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script>Dstring = engine.VmtId
KNR = engine.KNR
DString_ScreenTitle =  "MTS3B-"..Dstring.."--"..tostring(KNR)
--engine.ecu_CAN_control_2 = true ;
#DELAY  500</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="550" top="174" right="650" bottom="206"/>
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
<Rect left="550" top="244" right="650" bottom="276"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1508" name="DEP1089" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="250" top="324" right="350" bottom="356"/>
<Line1Text Enable="1" Text="转角传感器连接失败！"/>
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
<Rect left="250" top="174" right="350" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="184" top="324" right="216" bottom="356"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="324" right="650" bottom="356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1506" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="384" right="650" bottom="416"/>
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
<assessment no="1507" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="比对零件号">
<Rect left="550" top="574" right="650" bottom="606"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_SAS);
engine.println("零件号标准值:"..DString_C131_Partnumber_SAS);
len = string.len(DString_C131_Partnumber_SAS)

	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_SAS) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_SAS); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_SAS);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_SAS;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
	end
</Script><assessment no="1" name="DEP341" type="8" flags="97"/>
</Activity>
<Activity id="863" ActivityType="3" flags="0" name="读硬件号">
<Rect left="910" top="524" right="1010" bottom="556"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;</Script><assessment no="2" name="DEP342" type="8" flags="97"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1060" top="524" right="1160" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="920" top="584" right="1020" bottom="616"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@4);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;
</Script><assessment no="3" name="DEP343" type="8" flags="97"/>
</Activity>
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="770" top="584" right="870" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="读软件号">
<Rect left="920" top="654" right="1020" bottom="686"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

engine.StatValue=DString1;
engine.LastError = 0;
#DELAY  300</Script><assessment no="4" name="DEP344" type="8" flags="97"/>
</Activity>
<Activity id="868" ActivityType="3" flags="0" name="延时200MS">
<Rect left="550" top="634" right="650" bottom="666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="872" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="550" top="694" right="650" bottom="726"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "0007"
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


</Script><assessment no="5" name="DEP345" type="8" flags="97"/>
</Activity>
<Activity id="907" ActivityType="3" flags="0" name="延时300MS">
<Rect left="770" top="654" right="870" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="908" ActivityType="3" flags="0" name="延时100MS">
<Rect left="550" top="754" right="650" bottom="786"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="909" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="550" top="974" right="650" bottom="1006"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_SAS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP82" type="8" flags="97"/>
</Activity>
<Activity id="1066" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="550" top="894" right="650" bottom="926"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{C11F5-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1067" ActivityType="3" flags="0" name="读DTC">
<Rect left="550" top="824" right="650" bottom="856"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP82" type="8" flags="97"/>
</Activity>
<Activity id="1069" ActivityType="3" flags="0" name="信号维持">
<Rect left="650" top="454" right="750" bottom="486"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1070" ActivityType="3" flags="0" name="延时700MS">
<Rect left="550" top="514" right="650" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
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
<Transition StartId="7" EndId="8" type="6">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="1070" type="0">
</Transition>
<Transition StartId="859" EndId="868" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="867" EndId="907" type="0">
</Transition>
<Transition StartId="868" EndId="872" type="0">
</Transition>
<Transition StartId="872" EndId="908" type="0">
</Transition>
<Transition StartId="908" EndId="1067" type="0">
</Transition>
<Transition StartId="909" EndId="2" type="0">
</Transition>
<Transition StartId="1066" EndId="909" type="0">
</Transition>
<Transition StartId="1067" EndId="1066" type="0">
</Transition>
<Transition StartId="1069" EndId="1070" type="0">
</Transition>
<Transition StartId="1070" EndId="859" type="0">
</Transition>
</Transitions>
</Process>

