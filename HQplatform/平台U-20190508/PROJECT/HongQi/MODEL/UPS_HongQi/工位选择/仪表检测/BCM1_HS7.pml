<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3027" pbltext="DEP41">
<Parameters>
<Variable id="DString_C131_Partnumber_BCM1" type="8" dir="0" data="DString_C131_Partnumber_BCM1"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="550" top="4" right="650" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="250" top="2804" right="350" bottom="2836"/>
<Script>--engine.registerPacket(1,4000,0x7DF,"",0);
if( vciHandle == nil or vciHandle &lt; 0) then 
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
<Rect left="550" top="74" right="650" bottom="106"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
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
engine.ecu_CAN_control_2=false ;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="550" top="134" right="650" bottom="166"/>
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
<Rect left="550" top="264" right="650" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="147" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="250" top="324" right="350" bottom="356"/>
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
<Rect left="250" top="134" right="350" bottom="166"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="564" right="316" bottom="596"/>
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
<assessment no="10" name="DEP42" type="8" flags="97"/>
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
<assessment no="148" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="410" top="434" right="510" bottom="466"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="149" name="DEP44" type="8" flags="97"/>
</Activity>
<Activity id="860" ActivityType="3" flags="0" name="发送key">
<Rect left="410" top="554" right="510" bottom="586"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="150" name="DEP45" type="8" flags="97"/>
</Activity>
<Activity id="862" ActivityType="13" flags="0" name="计算key">
<Rect left="410" top="494" right="510" bottom="526"/>
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
<Activity id="1071" ActivityType="3" flags="0" name="信号维持">
<Rect left="670" top="424" right="770" bottom="456"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1072" ActivityType="3" flags="0" name="比对零件号">
<Rect left="550" top="464" right="650" bottom="496"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x87
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	end
end</Script><assessment no="1" name="DEP249" type="8" flags="97"/>
</Activity>
<Activity id="1073" ActivityType="3" flags="0" name="延时100MS">
<Rect left="550" top="524" right="650" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="1074" ActivityType="3" flags="0" name="读硬件号">
<Rect left="940" top="614" right="1040" bottom="646"/>
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
engine.LastError = 0;</Script><assessment no="2" name="DEP250" type="8" flags="97"/>
</Activity>
<Activity id="1075" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1060" top="614" right="1160" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1076" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1060" top="674" right="1160" bottom="706"/>
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
engine.LastError = 0;</Script><assessment no="3" name="DEP251" type="8" flags="97"/>
</Activity>
<Activity id="1077" ActivityType="3" flags="0" name="延时300MS">
<Rect left="940" top="674" right="1040" bottom="706"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1078" ActivityType="3" flags="0" name="读软件号">
<Rect left="820" top="674" right="920" bottom="706"/>
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
engine.LastError = 0;
#DELAY  300</Script><assessment no="4" name="DEP252" type="8" flags="97"/>
</Activity>
<Activity id="1081" ActivityType="3" flags="0" name="init">
<Rect left="550" top="974" right="650" bottom="1006"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到示宽位置"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1082" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="550" top="1034" right="650" bottom="1066"/>
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
<Activity id="1083" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="1094" right="650" bottom="1126"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1084" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="1154" right="650" bottom="1186"/>
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
<assessment no="66" name="DEP695" type="8" flags="97"/>
</Activity>
<Activity id="1085" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="1214" right="650" bottom="1246"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1086" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1214" right="466" bottom="1246"/>
</Activity>
<Activity id="1087" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1034" right="466" bottom="1066"/>
</Activity>
<Activity id="1089" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1960" top="794" right="2060" bottom="826"/>
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
<Activity id="1090" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="1394" right="650" bottom="1426"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1091" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1960" top="914" right="2060" bottom="946"/>
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
<assessment no="151" name="DEP704" type="8" flags="97"/>
</Activity>
<Activity id="1092" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="1514" right="650" bottom="1546"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1093" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1334" right="466" bottom="1366"/>
</Activity>
<Activity id="1094" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1514" right="466" bottom="1546"/>
</Activity>
<Activity id="1095" ActivityType="3" flags="0" name="init">
<Rect left="550" top="1274" right="650" bottom="1306"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到近光位置"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1096" ActivityType="3" flags="0" name="init">
<Rect left="550" top="1574" right="650" bottom="1606"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到Auto位置"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1097" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="550" top="1634" right="650" bottom="1666"/>
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
<Activity id="1098" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="1694" right="650" bottom="1726"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1099" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="1754" right="650" bottom="1786"/>
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
<assessment no="67" name="DEP697" type="8" flags="97"/>
</Activity>
<Activity id="1100" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="1814" right="650" bottom="1846"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1101" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1634" right="466" bottom="1666"/>
</Activity>
<Activity id="1102" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1814" right="466" bottom="1846"/>
</Activity>
<Activity id="1104" ActivityType="3" flags="0" name="前雾灯打开">
<Rect left="1030" top="734" right="1130" bottom="766"/>
<Line2Text Enable="1" Text="前雾灯打开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1105" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1030" top="794" right="1130" bottom="826"/>
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
<Activity id="1106" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="854" right="1130" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1107" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="914" right="1130" bottom="946"/>
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
<assessment no="69" name="DEP699" type="8" flags="97"/>
</Activity>
<Activity id="1108" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="974" right="1130" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1109" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="794" right="1246" bottom="826"/>
</Activity>
<Activity id="1110" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="974" right="1246" bottom="1006"/>
</Activity>
<Activity id="1111" ActivityType="3" flags="0" name="init">
<Rect left="550" top="1874" right="650" bottom="1906"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到OFF位置"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1112" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="550" top="1934" right="650" bottom="1966"/>
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
<Activity id="1113" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="1994" right="650" bottom="2026"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1114" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="2054" right="650" bottom="2086"/>
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
<assessment no="63" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="1115" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="2114" right="650" bottom="2146"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1116" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="1934" right="466" bottom="1966"/>
</Activity>
<Activity id="1117" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="2114" right="466" bottom="2146"/>
</Activity>
<Activity id="1118" ActivityType="3" flags="0" name="前雾灯关闭">
<Rect left="1030" top="1034" right="1130" bottom="1066"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1119" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1030" top="1094" right="1130" bottom="1126"/>
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
<Activity id="1120" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="1154" right="1130" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1121" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="1214" right="1130" bottom="1246"/>
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
<assessment no="152" name="DEP698" type="8" flags="97"/>
</Activity>
<Activity id="1122" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="1274" right="1130" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1123" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1094" right="1246" bottom="1126"/>
</Activity>
<Activity id="1124" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1274" right="1246" bottom="1306"/>
</Activity>
<Activity id="1125" ActivityType="3" flags="0" name="后雾灯打开">
<Rect left="1030" top="1334" right="1130" bottom="1366"/>
<Line2Text Enable="1" Text="后雾灯打开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1126" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1030" top="1394" right="1130" bottom="1426"/>
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
<Activity id="1127" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="1454" right="1130" bottom="1486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1128" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="1514" right="1130" bottom="1546"/>
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
<assessment no="153" name="DEP1993" type="8" flags="97"/>
</Activity>
<Activity id="1129" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="1574" right="1130" bottom="1606"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1130" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1394" right="946" bottom="1426"/>
</Activity>
<Activity id="1131" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1574" right="946" bottom="1606"/>
</Activity>
<Activity id="1132" ActivityType="3" flags="0" name="后雾灯关闭">
<Rect left="1030" top="1634" right="1130" bottom="1666"/>
<Line2Text Enable="1" Text="后雾灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1133" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1030" top="1694" right="1130" bottom="1726"/>
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
<Activity id="1134" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="1754" right="1130" bottom="1786"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1135" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="1814" right="1130" bottom="1846"/>
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
<assessment no="154" name="DEP1994" type="8" flags="97"/>
</Activity>
<Activity id="1136" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1694" right="946" bottom="1726"/>
</Activity>
<Activity id="1137" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="1874" right="1130" bottom="1906"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1138" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1874" right="946" bottom="1906"/>
</Activity>
<Activity id="1139" ActivityType="3" flags="0" name="左转向灯打开">
<Rect left="1480" top="734" right="1580" bottom="766"/>
<Line2Text Enable="1" Text="左转向灯打开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1140" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1480" top="794" right="1580" bottom="826"/>
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
<Activity id="1141" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="854" right="1580" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1142" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="914" right="1580" bottom="946"/>
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
<assessment no="155" name="DEP2189" type="8" flags="97"/>
</Activity>
<Activity id="1143" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="974" right="1580" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1664" top="794" right="1696" bottom="826"/>
</Activity>
<Activity id="1145" ActivityType="4" flags="0" name="路由节点">
<Rect left="1664" top="974" right="1696" bottom="1006"/>
</Activity>
<Activity id="1146" ActivityType="3" flags="0" name="左转向灯关闭">
<Rect left="1480" top="1034" right="1580" bottom="1066"/>
<Line2Text Enable="1" Text="左转向灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1147" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1480" top="1094" right="1580" bottom="1126"/>
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
<Activity id="1148" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="1154" right="1580" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1149" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="1214" right="1580" bottom="1246"/>
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
<assessment no="52" name="DEP2190" type="8" flags="97"/>
</Activity>
<Activity id="1150" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="1274" right="1580" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1151" ActivityType="4" flags="0" name="路由节点">
<Rect left="1664" top="1094" right="1696" bottom="1126"/>
</Activity>
<Activity id="1152" ActivityType="4" flags="0" name="路由节点">
<Rect left="1664" top="1274" right="1696" bottom="1306"/>
</Activity>
<Activity id="1153" ActivityType="3" flags="0" name="右转向灯打开">
<Rect left="1480" top="1334" right="1580" bottom="1366"/>
<Line2Text Enable="1" Text="右转向灯打开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1154" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1480" top="1394" right="1580" bottom="1426"/>
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
<Activity id="1155" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="1454" right="1580" bottom="1486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1156" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="1514" right="1580" bottom="1546"/>
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
<assessment no="171" name="DEP2191" type="8" flags="97"/>
</Activity>
<Activity id="1157" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="1574" right="1580" bottom="1606"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1158" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="1394" right="1396" bottom="1426"/>
</Activity>
<Activity id="1159" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="1574" right="1396" bottom="1606"/>
</Activity>
<Activity id="1160" ActivityType="3" flags="0" name="右转向灯关闭">
<Rect left="1480" top="1634" right="1580" bottom="1666"/>
<Line2Text Enable="1" Text="右转向灯关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1161" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1480" top="1694" right="1580" bottom="1726"/>
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
<Activity id="1162" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="1754" right="1580" bottom="1786"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1163" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="1814" right="1580" bottom="1846"/>
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
<assessment no="156" name="DEP2192" type="8" flags="97"/>
</Activity>
<Activity id="1164" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="1874" right="1580" bottom="1906"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="1694" right="1396" bottom="1726"/>
</Activity>
<Activity id="1166" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="1874" right="1396" bottom="1906"/>
</Activity>
<Activity id="1167" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="550" top="1334" right="650" bottom="1366"/>
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
<Activity id="1168" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1960" top="854" right="2060" bottom="886"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1170" ActivityType="3" flags="0" name="endloop">
<Rect left="1960" top="974" right="2060" bottom="1006"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1171" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="794" right="2176" bottom="826"/>
</Activity>
<Activity id="1172" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="974" right="2176" bottom="1006"/>
</Activity>
<Activity id="1173" ActivityType="3" flags="0" name="远光灯打开">
<Rect left="1960" top="734" right="2060" bottom="766"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="远光灯打开"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1174" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="1454" right="650" bottom="1486"/>
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
<assessment no="68" name="DEP696" type="8" flags="97"/>
</Activity>
<Activity id="1176" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1960" top="1154" right="2060" bottom="1186"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1177" ActivityType="3" flags="0" name="endloop">
<Rect left="1960" top="1274" right="2060" bottom="1306"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1178" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1094" right="2176" bottom="1126"/>
</Activity>
<Activity id="1179" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1274" right="2176" bottom="1306"/>
</Activity>
<Activity id="1180" ActivityType="3" flags="0" name="远光灯关闭">
<Rect left="1960" top="1034" right="2060" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="远光灯关闭"/>
<Line3Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1181" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1960" top="1214" right="2060" bottom="1246"/>
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
<assessment no="157" name="DEP703" type="8" flags="97"/>
</Activity>
<Activity id="1182" ActivityType="3" flags="0" name="雨刷拨到INT档">
<Rect left="1960" top="1334" right="2060" bottom="1366"/>
<Line2Text Enable="1" Text="雨刷拨到INT档"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1183" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1960" top="1394" right="2060" bottom="1426"/>
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
<Activity id="1184" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1960" top="1454" right="2060" bottom="1486"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1185" ActivityType="3" flags="0" name="endloop">
<Rect left="1960" top="1574" right="2060" bottom="1606"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1186" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1574" right="2176" bottom="1606"/>
</Activity>
<Activity id="1187" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1394" right="2176" bottom="1426"/>
</Activity>
<Activity id="1188" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1960" top="1514" right="2060" bottom="1546"/>
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
<assessment no="172" name="DEP706" type="8" flags="97"/>
</Activity>
<Activity id="1189" ActivityType="3" flags="0" name="雨刷拨到低速档">
<Rect left="1960" top="1634" right="2060" bottom="1666"/>
<Line2Text Enable="1" Text="雨刷拨到低速档"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1190" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1960" top="1694" right="2060" bottom="1726"/>
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
<Activity id="1191" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1960" top="1754" right="2060" bottom="1786"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1192" ActivityType="3" flags="0" name="endloop">
<Rect left="1960" top="1874" right="2060" bottom="1906"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1193" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1874" right="2176" bottom="1906"/>
</Activity>
<Activity id="1194" ActivityType="4" flags="0" name="路由节点">
<Rect left="2144" top="1694" right="2176" bottom="1726"/>
</Activity>
<Activity id="1195" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1960" top="1814" right="2060" bottom="1846"/>
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
<assessment no="173" name="DEP707" type="8" flags="97"/>
</Activity>
<Activity id="1196" ActivityType="3" flags="0" name="雨刷拨到高速档">
<Rect left="1030" top="1994" right="1130" bottom="2026"/>
<Line2Text Enable="1" Text="雨刷拨到高速档"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1197" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1030" top="2054" right="1130" bottom="2086"/>
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
<Activity id="1198" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="2114" right="1130" bottom="2146"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1199" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="2234" right="1130" bottom="2266"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1200" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="2234" right="946" bottom="2266"/>
</Activity>
<Activity id="1201" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="2054" right="946" bottom="2086"/>
</Activity>
<Activity id="1202" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="2174" right="1130" bottom="2206"/>
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
<assessment no="158" name="DEP708" type="8" flags="97"/>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="雨刷关闭">
<Rect left="1480" top="1994" right="1580" bottom="2026"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1232" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1480" top="2054" right="1580" bottom="2086"/>
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
<Activity id="1233" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="2114" right="1580" bottom="2146"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1234" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="2234" right="1580" bottom="2266"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1235" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="2234" right="1726" bottom="2266"/>
</Activity>
<Activity id="1236" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="2054" right="1726" bottom="2086"/>
</Activity>
<Activity id="1237" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="2174" right="1580" bottom="2206"/>
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
<assessment no="159" name="DEP705" type="8" flags="97"/>
</Activity>
<Activity id="1238" ActivityType="3" flags="0" name="雨刷清洗打开">
<Rect left="1030" top="2294" right="1130" bottom="2326"/>
<Line2Text Enable="1" Text="前清洗开关打开"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1239" ActivityType="13" flags="0" name="获取前雨刷开启状态">
<Rect left="1030" top="2464" right="1130" bottom="2496"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x23&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1240" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1030" top="2524" right="1130" bottom="2556"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1241" ActivityType="3" flags="0" name="endloop">
<Rect left="1030" top="2644" right="1130" bottom="2676"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1242" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="2644" right="946" bottom="2676"/>
</Activity>
<Activity id="1243" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="2464" right="946" bottom="2496"/>
</Activity>
<Activity id="1244" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1030" top="2584" right="1130" bottom="2616"/>
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
<assessment no="160" name="DEP2470" type="8" flags="97"/>
</Activity>
<Activity id="1245" ActivityType="3" flags="0" name="前清洗开关关闭">
<Rect left="1480" top="2434" right="1580" bottom="2466"/>
<Line2Text Enable="1" Text="前清洗开关关闭"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1246" ActivityType="13" flags="0" name="获取雨刷关闭状态">
<Rect left="1480" top="2494" right="1580" bottom="2526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x23&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1247" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1480" top="2554" right="1580" bottom="2586"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1248" ActivityType="3" flags="0" name="endloop">
<Rect left="1480" top="2674" right="1580" bottom="2706"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1249" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="2674" right="1726" bottom="2706"/>
</Activity>
<Activity id="1250" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="2494" right="1726" bottom="2526"/>
</Activity>
<Activity id="1251" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1480" top="2614" right="1580" bottom="2646"/>
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
<assessment no="62" name="DEP2471" type="8" flags="97"/>
</Activity>
<Activity id="1252" ActivityType="3" flags="0" name="读DTC">
<Rect left="1240" top="2624" right="1340" bottom="2656"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="161" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="1253" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="1240" top="2684" right="1340" bottom="2716"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{C11F5-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1254" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="1240" top="2744" right="1340" bottom="2776"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C079_BCM1&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="174" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="1256" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="1960" top="1094" right="2060" bottom="1126"/>
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
<Activity id="1257" ActivityType="3" flags="0" name="init">
<Rect left="550" top="674" right="650" bottom="706"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到OFF位置"/>
<Line3Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";
Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="1258" ActivityType="13" flags="0" name="VCIDataExchangeEx">
<Rect left="550" top="734" right="650" bottom="766"/>
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
<Activity id="1259" ActivityType="3" flags="0" name="截取字符串">
<Rect left="550" top="794" right="650" bottom="826"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="1260" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="550" top="854" right="650" bottom="886"/>
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
<assessment no="63" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="1261" ActivityType="3" flags="0" name="endloop">
<Rect left="550" top="914" right="650" bottom="946"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="1262" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="734" right="466" bottom="766"/>
</Activity>
<Activity id="1263" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="914" right="466" bottom="946"/>
</Activity>
<Activity id="1264" ActivityType="3" flags="0" name="延时1000MS">
<Rect left="550" top="194" right="650" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  1000</Script></Activity>
<Activity id="1265" ActivityType="13" flags="0" name="读故障码">
<Rect left="1480" top="2744" right="1580" bottom="2776"/>
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
<assessment no="162" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="1266" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="1480" top="2804" right="1580" bottom="2836"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U014687&quot;,&quot;U014187&quot;,&quot;U019987&quot;,&quot;U019887&quot;,&quot;U020087&quot;,&quot;U020187&quot;,&quot;U020287&quot;,&quot;U023087&quot;,&quot;U023187&quot;,&quot;U02FF87&quot;,&quot;U114687&quot;,&quot;U124587&quot;,&quot;U124387&quot;,&quot;U123587&quot;,&quot;B100200&quot;,&quot;B100500&quot;,&quot;B100800&quot;,&quot;B100B00&quot;,&quot;B101A00&quot;,&quot;B101D00&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_BCM1&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="178" name="DEP2081" type="8" flags="97"/>
</Activity>
<Activity id="1267" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="550" top="594" right="650" bottom="626"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
    StandValue="04.11#04_HS7"
	    if(StandValue~="")then
		   DString1 = engine.GetResponseString(3,2+#StandValue)
		   engine.SetLineText(3,DString1);
		   engine.println("软件版本号:"..DString1)
			  if(StandValue == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
				else
				 engine.LastError = 1;
				 engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
			  end
		else
			engine.println("不比对软件版本号");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=StandValue;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
</Script><assessment no="5" name="DEP253" type="8" flags="97"/>
</Activity>
<Activity id="1269" ActivityType="13" flags="0" name="前雨刷开启指令">
<Rect left="1030" top="2354" right="1130" bottom="2386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x11\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1270" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1030" top="2404" right="1130" bottom="2436"/>
<Script>engine.Delay(300);</Script></Activity>
<Activity id="1271" ActivityType="13" flags="0" name="前雨刷关闭指令">
<Rect left="1480" top="2294" right="1580" bottom="2326"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x11\x03\0x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1272" ActivityType="13" flags="0" name="返回控制器">
<Rect left="1480" top="2364" right="1580" bottom="2396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x11\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1273" ActivityType="4" flags="0" name="路由节点">
<Rect left="1294" top="2404" right="1326" bottom="2436"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="1264" type="0">
</Transition>
<Transition StartId="5" EndId="10" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="6">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="1072" type="0">
</Transition>
<Transition StartId="859" EndId="862" type="0">
</Transition>
<Transition StartId="862" EndId="860" type="0">
</Transition>
<Transition StartId="1072" EndId="1073" type="0">
</Transition>
<Transition StartId="1073" EndId="1267" type="0">
</Transition>
<Transition StartId="1074" EndId="1075" type="0">
</Transition>
<Transition StartId="1075" EndId="1076" type="0">
</Transition>
<Transition StartId="1076" EndId="1077" type="0">
</Transition>
<Transition StartId="1077" EndId="1078" type="0">
</Transition>
<Transition StartId="1081" EndId="1082" type="0">
</Transition>
<Transition StartId="1082" EndId="1083" type="0">
</Transition>
<Transition StartId="1083" EndId="1084" type="0">
</Transition>
<Transition StartId="1084" EndId="1085" type="0">
</Transition>
<Transition StartId="1085" EndId="1086" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1085" EndId="1095" type="0">
</Transition>
<Transition StartId="1086" EndId="1087" type="0">
</Transition>
<Transition StartId="1087" EndId="1082" type="0">
</Transition>
<Transition StartId="1089" EndId="1168" type="0">
</Transition>
<Transition StartId="1090" EndId="1174" type="0">
</Transition>
<Transition StartId="1091" EndId="1170" type="0">
</Transition>
<Transition StartId="1092" EndId="1094" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1092" EndId="1096" type="0">
</Transition>
<Transition StartId="1093" EndId="1167" type="0">
</Transition>
<Transition StartId="1094" EndId="1093" type="0">
</Transition>
<Transition StartId="1095" EndId="1167" type="0">
</Transition>
<Transition StartId="1096" EndId="1097" type="0">
</Transition>
<Transition StartId="1097" EndId="1098" type="0">
</Transition>
<Transition StartId="1098" EndId="1099" type="0">
</Transition>
<Transition StartId="1099" EndId="1100" type="0">
</Transition>
<Transition StartId="1100" EndId="1102" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1100" EndId="1111" type="0">
</Transition>
<Transition StartId="1101" EndId="1097" type="0">
</Transition>
<Transition StartId="1102" EndId="1101" type="0">
</Transition>
<Transition StartId="1104" EndId="1105" type="0">
</Transition>
<Transition StartId="1105" EndId="1106" type="0">
</Transition>
<Transition StartId="1106" EndId="1107" type="0">
</Transition>
<Transition StartId="1107" EndId="1108" type="0">
</Transition>
<Transition StartId="1108" EndId="1110" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1108" EndId="1118" type="0">
</Transition>
<Transition StartId="1109" EndId="1105" type="0">
</Transition>
<Transition StartId="1110" EndId="1109" type="0">
</Transition>
<Transition StartId="1111" EndId="1112" type="0">
</Transition>
<Transition StartId="1112" EndId="1113" type="0">
</Transition>
<Transition StartId="1113" EndId="1114" type="0">
</Transition>
<Transition StartId="1114" EndId="1115" type="0">
</Transition>
<Transition StartId="1115" EndId="1117" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1115" EndId="1104" type="0">
</Transition>
<Transition StartId="1116" EndId="1112" type="0">
</Transition>
<Transition StartId="1117" EndId="1116" type="0">
</Transition>
<Transition StartId="1118" EndId="1119" type="0">
</Transition>
<Transition StartId="1119" EndId="1120" type="0">
</Transition>
<Transition StartId="1120" EndId="1121" type="0">
</Transition>
<Transition StartId="1121" EndId="1122" type="0">
</Transition>
<Transition StartId="1122" EndId="1124" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1122" EndId="1125" type="0">
</Transition>
<Transition StartId="1123" EndId="1119" type="0">
</Transition>
<Transition StartId="1124" EndId="1123" type="0">
</Transition>
<Transition StartId="1125" EndId="1126" type="0">
</Transition>
<Transition StartId="1126" EndId="1127" type="0">
</Transition>
<Transition StartId="1127" EndId="1128" type="0">
</Transition>
<Transition StartId="1128" EndId="1129" type="0">
</Transition>
<Transition StartId="1129" EndId="1131" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1129" EndId="1132" type="0">
</Transition>
<Transition StartId="1130" EndId="1126" type="0">
</Transition>
<Transition StartId="1131" EndId="1130" type="0">
</Transition>
<Transition StartId="1132" EndId="1133" type="0">
</Transition>
<Transition StartId="1133" EndId="1134" type="0">
</Transition>
<Transition StartId="1134" EndId="1135" type="0">
</Transition>
<Transition StartId="1135" EndId="1137" type="0">
</Transition>
<Transition StartId="1136" EndId="1133" type="0">
</Transition>
<Transition StartId="1137" EndId="1138" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1137" EndId="1139" type="0">
</Transition>
<Transition StartId="1138" EndId="1136" type="0">
</Transition>
<Transition StartId="1139" EndId="1140" type="0">
</Transition>
<Transition StartId="1140" EndId="1141" type="0">
</Transition>
<Transition StartId="1141" EndId="1142" type="0">
</Transition>
<Transition StartId="1142" EndId="1143" type="0">
</Transition>
<Transition StartId="1143" EndId="1145" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1143" EndId="1146" type="0">
</Transition>
<Transition StartId="1144" EndId="1140" type="0">
</Transition>
<Transition StartId="1145" EndId="1144" type="0">
</Transition>
<Transition StartId="1146" EndId="1147" type="0">
</Transition>
<Transition StartId="1147" EndId="1148" type="0">
</Transition>
<Transition StartId="1148" EndId="1149" type="0">
</Transition>
<Transition StartId="1149" EndId="1150" type="0">
</Transition>
<Transition StartId="1150" EndId="1152" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1150" EndId="1153" type="0">
</Transition>
<Transition StartId="1151" EndId="1147" type="0">
</Transition>
<Transition StartId="1152" EndId="1151" type="0">
</Transition>
<Transition StartId="1153" EndId="1154" type="0">
</Transition>
<Transition StartId="1154" EndId="1155" type="0">
</Transition>
<Transition StartId="1155" EndId="1156" type="0">
</Transition>
<Transition StartId="1156" EndId="1157" type="0">
</Transition>
<Transition StartId="1157" EndId="1159" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1157" EndId="1160" type="0">
</Transition>
<Transition StartId="1158" EndId="1154" type="0">
</Transition>
<Transition StartId="1159" EndId="1158" type="0">
</Transition>
<Transition StartId="1160" EndId="1161" type="0">
</Transition>
<Transition StartId="1161" EndId="1162" type="0">
</Transition>
<Transition StartId="1162" EndId="1163" type="0">
</Transition>
<Transition StartId="1163" EndId="1164" type="0">
</Transition>
<Transition StartId="1164" EndId="1166" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1164" EndId="1173" type="0">
</Transition>
<Transition StartId="1165" EndId="1161" type="0">
</Transition>
<Transition StartId="1166" EndId="1165" type="0">
</Transition>
<Transition StartId="1167" EndId="1090" type="0">
</Transition>
<Transition StartId="1168" EndId="1091" type="0">
</Transition>
<Transition StartId="1170" EndId="1172" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1170" EndId="1180" type="0">
</Transition>
<Transition StartId="1171" EndId="1089" type="0">
</Transition>
<Transition StartId="1172" EndId="1171" type="0">
</Transition>
<Transition StartId="1173" EndId="1089" type="0">
</Transition>
<Transition StartId="1174" EndId="1092" type="0">
</Transition>
<Transition StartId="1176" EndId="1181" type="0">
</Transition>
<Transition StartId="1177" EndId="1179" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1177" EndId="1182" type="0">
</Transition>
<Transition StartId="1178" EndId="1256" type="0">
</Transition>
<Transition StartId="1179" EndId="1178" type="0">
</Transition>
<Transition StartId="1180" EndId="1256" type="0">
</Transition>
<Transition StartId="1181" EndId="1177" type="0">
</Transition>
<Transition StartId="1182" EndId="1183" type="0">
</Transition>
<Transition StartId="1183" EndId="1184" type="0">
</Transition>
<Transition StartId="1184" EndId="1188" type="0">
</Transition>
<Transition StartId="1185" EndId="1186" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1185" EndId="1189" type="0">
</Transition>
<Transition StartId="1186" EndId="1187" type="0">
</Transition>
<Transition StartId="1187" EndId="1183" type="0">
</Transition>
<Transition StartId="1188" EndId="1185" type="0">
</Transition>
<Transition StartId="1189" EndId="1190" type="0">
</Transition>
<Transition StartId="1190" EndId="1191" type="0">
</Transition>
<Transition StartId="1191" EndId="1195" type="0">
</Transition>
<Transition StartId="1192" EndId="1193" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1192" EndId="1196" type="0">
</Transition>
<Transition StartId="1193" EndId="1194" type="0">
</Transition>
<Transition StartId="1194" EndId="1190" type="0">
</Transition>
<Transition StartId="1195" EndId="1192" type="0">
</Transition>
<Transition StartId="1196" EndId="1197" type="0">
</Transition>
<Transition StartId="1197" EndId="1198" type="0">
</Transition>
<Transition StartId="1198" EndId="1202" type="0">
</Transition>
<Transition StartId="1199" EndId="1200" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1199" EndId="1231" type="0">
</Transition>
<Transition StartId="1200" EndId="1201" type="0">
</Transition>
<Transition StartId="1201" EndId="1197" type="0">
</Transition>
<Transition StartId="1202" EndId="1199" type="0">
</Transition>
<Transition StartId="1231" EndId="1232" type="0">
</Transition>
<Transition StartId="1232" EndId="1233" type="0">
</Transition>
<Transition StartId="1233" EndId="1237" type="0">
</Transition>
<Transition StartId="1234" EndId="1235" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1234" EndId="1273" type="0">
</Transition>
<Transition StartId="1235" EndId="1236" type="0">
</Transition>
<Transition StartId="1236" EndId="1232" type="0">
</Transition>
<Transition StartId="1237" EndId="1234" type="0">
</Transition>
<Transition StartId="1238" EndId="1269" type="0">
</Transition>
<Transition StartId="1239" EndId="1240" type="0">
</Transition>
<Transition StartId="1240" EndId="1244" type="0">
</Transition>
<Transition StartId="1241" EndId="1242" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1241" EndId="1271" type="0">
</Transition>
<Transition StartId="1242" EndId="1243" type="0">
</Transition>
<Transition StartId="1243" EndId="1239" type="0">
</Transition>
<Transition StartId="1244" EndId="1241" type="0">
</Transition>
<Transition StartId="1245" EndId="1246" type="0">
</Transition>
<Transition StartId="1246" EndId="1247" type="0">
</Transition>
<Transition StartId="1247" EndId="1251" type="0">
</Transition>
<Transition StartId="1248" EndId="1249" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1248" EndId="1265" type="0">
</Transition>
<Transition StartId="1249" EndId="1250" type="0">
</Transition>
<Transition StartId="1250" EndId="1246" type="0">
</Transition>
<Transition StartId="1251" EndId="1248" type="0">
</Transition>
<Transition StartId="1252" EndId="1253" type="0">
</Transition>
<Transition StartId="1253" EndId="1254" type="0">
</Transition>
<Transition StartId="1256" EndId="1176" type="0">
</Transition>
<Transition StartId="1257" EndId="1258" type="0">
</Transition>
<Transition StartId="1258" EndId="1259" type="0">
</Transition>
<Transition StartId="1259" EndId="1260" type="0">
</Transition>
<Transition StartId="1260" EndId="1261" type="0">
</Transition>
<Transition StartId="1261" EndId="1263" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1261" EndId="1081" type="0">
</Transition>
<Transition StartId="1262" EndId="1258" type="0">
</Transition>
<Transition StartId="1263" EndId="1262" type="0">
</Transition>
<Transition StartId="1264" EndId="5" type="0">
</Transition>
<Transition StartId="1265" EndId="1266" type="0">
</Transition>
<Transition StartId="1266" EndId="2" type="0">
</Transition>
<Transition StartId="1267" EndId="1257" type="0">
</Transition>
<Transition StartId="1269" EndId="1270" type="0">
</Transition>
<Transition StartId="1270" EndId="1239" type="0">
</Transition>
<Transition StartId="1271" EndId="1272" type="0">
</Transition>
<Transition StartId="1272" EndId="1245" type="0">
</Transition>
<Transition StartId="1273" EndId="1265" type="0">
</Transition>
</Transitions>
</Process>

