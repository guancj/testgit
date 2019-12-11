<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3033" pbltext="DEP1773">
<Parameters>
<Variable id="DString_C131_Partnumber_IVI" type="8" dir="0" data="DString_C131_Partnumber_IVI"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="Tester地址"/>
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
<Variable id="TimeStart" type="3" data="0" description="TimeStart"/>
<Variable id="TimeOut" type="3" data="15" description="TimeOut"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="280" top="44" right="380" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="2374" right="170" bottom="2406"/>
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
<Activity id="3" ActivityType="3" flags="0" name="(IVI)">
<Rect left="280" top="134" right="380" bottom="166"/>
<TitleText Enable="1" Text="IVI组合仪表"/>
<Script>engine.ecu_CAN_control_1 = false ;
engine.Delay(100)
engine.ecu_CAN_control_2 = true;
engine.Delay(100)</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="280" top="224" right="380" bottom="256"/>
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
<Rect left="280" top="314" right="380" bottom="346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1776" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="280" top="404" right="380" bottom="436"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP1774" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="70" top="224" right="170" bottom="256"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="重试？">
<Rect left="70" top="404" right="170" bottom="436"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
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
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="494" right="136" bottom="526"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="280" top="494" right="380" bottom="526"/>
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
<assessment no="2" name="DEP1775" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="信号维持">
<Rect left="410" top="584" right="510" bottom="616"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1096" ActivityType="13" flags="0" name="backlightL5">
<Rect left="280" top="1154" right="380" bottom="1186"/>
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
<Activity id="1098" ActivityType="3" flags="0" name="检测失败">
<Rect left="430" top="1304" right="530" bottom="1336"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;
engine.StatValue="Level 5"</Script><assessment no="24" name="DEP2177" type="8" flags="97"/>
</Activity>
<Activity id="1100" ActivityType="13" flags="0" name="backlightL1">
<Rect left="280" top="1884" right="380" bottom="1916"/>
<Line1Text Enable="1" Text="仪表背光级别1自动开启"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD3\x61\x03\x00\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1104" ActivityType="13" flags="0" name="returntoecu">
<Rect left="280" top="2094" right="380" bottom="2126"/>
<Line1Text Enable="1" Text="仪表背光级别1自动开启"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x7F"/>
<Parameter id="sendTel" value="&apos;\xD3\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1105" ActivityType="3" flags="0" name="比对零件号">
<Rect left="280" top="944" right="380" bottom="976"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_IVI);
engine.println("零件号标准值:"..DString_C131_Partnumber_IVI);
len = string.len(DString_C131_Partnumber_IVI)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_IVI) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_IVI); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_IVI);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_IVI;
	
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
	
		if (DString1==DString_C131_Partnumber_IVI) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_IVI); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_IVI);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_IVI;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="6" name="DEP1779" type="8" flags="97"/>
</Activity>
<Activity id="1109" ActivityType="3" flags="1" name="!!!读软件版本号">
<Rect left="280" top="1074" right="380" bottom="1106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
    StandValue="1600r"
    StandValue1="1700r"
	    if(StandValue~="")then
		   DString1 = engine.GetResponseString(3,2+#StandValue)
		   engine.SetLineText(3,DString1);
		   engine.println("软件版本号:"..DString1)
			  if(StandValue == DString1 or StandValue1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对软件版本号成功"..DString1.."  "..StandValue.."or"..StandValue1);
				else
				 engine.LastError = 1;
				 engine.println("比对软件版本号失败"..DString1.."  "..StandValue.."or"..StandValue1);
			  end
		else
			engine.println("不比对软件版本号");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=StandValue.."or"..StandValue1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
<Activity id="1124" ActivityType="3" flags="0" name="延时100MS">
<Rect left="410" top="2204" right="510" bottom="2236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="1129" ActivityType="3" flags="0" name="清除界面">
<Rect left="70" top="614" right="170" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="1130" ActivityType="3" flags="0" name="检测成功">
<Rect left="160" top="1304" right="260" bottom="1336"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;
engine.StatValue="Level 5"</Script><assessment no="24" name="DEP2177" type="8" flags="97"/>
</Activity>
<Activity id="1140" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="280" top="674" right="380" bottom="706"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1777" type="8" flags="97"/>
</Activity>
<Activity id="1141" ActivityType="13" flags="0" name="计算">
<Rect left="280" top="764" right="380" bottom="796"/>
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
<Activity id="1143" ActivityType="3" flags="0" name="延时300MS">
<Rect left="280" top="1794" right="380" bottom="1826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1144" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="280" top="1364" right="380" bottom="1396"/>
<Line1Text Enable="1" Text="切换诊断模式"/>
<Line2Text Enable="1"/>
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
<assessment no="50" name="DEP1776" type="8" flags="97"/>
</Activity>
<Activity id="1145" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="280" top="1434" right="380" bottom="1466"/>
<Line1Text Enable="1" Text="安全访问"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--#COMM 0x27 0x01
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="51" name="DEP1777" type="8" flags="97"/>
</Activity>
<Activity id="1146" ActivityType="13" flags="0" name="计算">
<Rect left="280" top="1524" right="380" bottom="1556"/>
<Line1Text Enable="1" Text="安全登录"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Activity id="1153" ActivityType="13" flags="0" name="returntoecu">
<Rect left="280" top="1704" right="380" bottom="1736"/>
<Line1Text Enable="1" Text="仪表背光级别5命令返回"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x7F"/>
<Parameter id="sendTel" value="&apos;\xD3\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1154" ActivityType="3" flags="0" name="backlight5检查">
<Rect left="280" top="1304" right="380" bottom="1336"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="检查仪表背光级别5"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>
engine.DialogBackColor = "yellow";
#PRESSBUTTON
</Script></Activity>
<Activity id="1155" ActivityType="3" flags="0" name="backlight1检查">
<Rect left="280" top="1994" right="380" bottom="2026"/>
<Line1Text Enable="1" Text="检查仪表背光级别1亮"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1156" ActivityType="3" flags="0" name="检测失败">
<Rect left="440" top="1994" right="540" bottom="2026"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;
engine.StatValue="Level 1"</Script><assessment no="25" name="DEP2178" type="8" flags="97"/>
</Activity>
<Activity id="1157" ActivityType="3" flags="0" name="检测成功">
<Rect left="140" top="1994" right="240" bottom="2026"/>
<Script>engine.LastError = 0;
engine.TestResult = 0;
engine.StatValue="Level 1"</Script><assessment no="25" name="DEP2178" type="8" flags="97"/>
</Activity>
<Activity id="1159" ActivityType="3" flags="0" name="发送key">
<Rect left="280" top="854" right="380" bottom="886"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1778" type="8" flags="97"/>
</Activity>
<Activity id="1160" ActivityType="3" flags="0" name="发送key">
<Rect left="280" top="1614" right="380" bottom="1646"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="52" name="DEP1778" type="8" flags="97"/>
</Activity>
<Activity id="1161" ActivityType="3" flags="0" name="延时100MS">
<Rect left="280" top="1004" right="380" bottom="1036"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="1162" ActivityType="13" flags="0" name="读故障码">
<Rect left="410" top="2274" right="510" bottom="2306"/>
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
<assessment no="18" name="DEP1853" type="8" flags="97"/>
</Activity>
<Activity id="1163" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="410" top="2364" right="510" bottom="2396"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B143DF1&quot;,&quot;B143CF1&quot;,&quot;B141F13&quot;,&quot;B141E13&quot;,&quot;B140D13&quot;,&quot;U014687&quot;,&quot;U02FA87&quot;,&quot;U123587&quot;,&quot;U125687&quot;,&quot;U016487&quot;,&quot;U118087&quot;,&quot;U114087&quot;,&quot;U114187&quot;,&quot;U120887&quot;,&quot;U114687&quot;,&quot;U115987&quot;,&quot;U118587&quot;,&quot;U112687&quot;,&quot;U119887&quot;,&quot;U123287&quot;,&quot;U015787&quot;,&quot;U124387&quot;,&quot;U123A87&quot;,&quot;U113887&quot;,&quot;B1430F0&quot;,&quot;B1430F0&quot;,&quot;B1431F0&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_IVI&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP2087" type="8" flags="97"/>
</Activity>
<Activity id="1166" ActivityType="3" flags="0" name="读软件版本号放在最后了">
<Rect left="170" top="1074" right="270" bottom="1106"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="12" type="4">
</Transition>
<Transition StartId="7" EndId="14" type="0">
</Transition>
<Transition StartId="11" EndId="4" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="6">
</Transition>
<Transition StartId="12" EndId="13" type="5">
</Transition>
<Transition StartId="13" EndId="1129" type="0">
</Transition>
<Transition StartId="14" EndId="1140" type="0">
</Transition>
<Transition StartId="859" EndId="1140" type="0">
</Transition>
<Transition StartId="1096" EndId="1154" type="0">
</Transition>
<Transition StartId="1098" EndId="1144" type="0">
</Transition>
<Transition StartId="1100" EndId="1155" type="0">
</Transition>
<Transition StartId="1104" EndId="2" type="0">
</Transition>
<Transition StartId="1105" EndId="1161" type="0">
</Transition>
<Transition StartId="1109" EndId="1096" type="0">
</Transition>
<Transition StartId="1124" EndId="1162" type="0">
</Transition>
<Transition StartId="1129" EndId="2" type="0">
</Transition>
<Transition StartId="1130" EndId="1144" type="0">
</Transition>
<Transition StartId="1140" EndId="1141" type="0">
</Transition>
<Transition StartId="1141" EndId="1159" type="0">
</Transition>
<Transition StartId="1143" EndId="1100" type="0">
</Transition>
<Transition StartId="1144" EndId="1145" type="0">
</Transition>
<Transition StartId="1145" EndId="1146" type="0">
</Transition>
<Transition StartId="1146" EndId="1160" type="0">
</Transition>
<Transition StartId="1153" EndId="1143" type="0">
</Transition>
<Transition StartId="1154" EndId="1098" type="5">
</Transition>
<Transition StartId="1154" EndId="1130" type="6">
</Transition>
<Transition StartId="1155" EndId="1157" type="6">
</Transition>
<Transition StartId="1155" EndId="1156" type="5">
</Transition>
<Transition StartId="1156" EndId="1104" type="0">
</Transition>
<Transition StartId="1157" EndId="1104" type="0">
</Transition>
<Transition StartId="1159" EndId="1105" type="0">
</Transition>
<Transition StartId="1160" EndId="1153" type="0">
</Transition>
<Transition StartId="1161" EndId="1109" type="0">
</Transition>
<Transition StartId="1162" EndId="1163" type="0">
</Transition>
</Transitions>
</Process>

