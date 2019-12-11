<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3022" pbltext="DEP125">
<Parameters>
<Variable id="DString_C131_Partnumber_RRDCU" type="8" dir="0" data="DString_C131_Partnumber_RRDCU"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x757" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75F" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="250" top="14" right="350" bottom="46"/>
<Script></Script><TitleText Enable="1" Text="HS7-右后门检测"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="250" top="764" right="350" bottom="796"/>
<Script>engine.registerPacket(1,4000,0x7DF,"",0);
if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="250" top="84" right="350" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="250" top="144" right="350" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
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
<assessment no="1" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="重试？">
<Rect left="120" top="144" right="220" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line3Text Enable="1" Text="重试吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="7" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="84" right="186" bottom="116"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="清故障码">
<Rect left="250" top="194" right="350" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP127" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="重置">
<Rect left="250" top="244" right="350" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="ECU重置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x11"/>
<Parameter id="resTitle" value="0x51"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="250" top="294" right="350" bottom="326"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="5"/>
<Parameter id="Text" value="&quot;请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="250" top="344" right="350" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
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
<assessment no="3" name="DEP1094" type="8" flags="97"/>
</Activity>
<Activity id="709" ActivityType="3" flags="0" name="维持信号">
<Rect left="400" top="344" right="500" bottom="376"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);
</Script></Activity>
<Activity id="717" ActivityType="5" flags="0" name="RRDCU_check_door_light_lock_HS7">
<Rect left="400" top="494" right="500" bottom="526"/>
<SubProcesses>
<SubProcess id="RRDCU_check_door_light_lock_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="718" ActivityType="5" flags="0" name="RRDCU_check_switchs_HS7">
<Rect left="400" top="554" right="500" bottom="586"/>
<SubProcesses>
<SubProcess id="RRDCU_check_switchs_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="719" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="250" top="644" right="350" bottom="676"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="720" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="644" right="186" bottom="676"/>
</Activity>
<Activity id="721" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="400" top="434" right="500" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP129" type="8" flags="97"/>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="发送key">
<Rect left="250" top="494" right="350" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP130" type="8" flags="97"/>
</Activity>
<Activity id="724" ActivityType="13" flags="0" name="计算key">
<Rect left="250" top="434" right="350" bottom="466"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x41751386"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="725" ActivityType="5" flags="0" name="RRDCU_line_decetion_HS7">
<Rect left="250" top="704" right="350" bottom="736"/>
<SubProcesses>
<SubProcess id="RRDCU_line_decetion_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="726" ActivityType="3" flags="0" name="比对零件号">
<Rect left="550" top="344" right="650" bottom="376"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_RRDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_RRDCU);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	
	if (DString1==DString_C131_Partnumber_RRDCU) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_RRDCU); 
	else
		engine.LastError = 1;
		engine.TestResult = 1; 
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_RRDCU);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_RRDCU;

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="6" name="DEP669" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="读硬件号">
<Rect left="790" top="344" right="890" bottom="376"/>
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
</Script></Activity>
<Activity id="860" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1030" top="344" right="1130" bottom="376"/>
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
</Script></Activity>
<Activity id="862" ActivityType="3" flags="0" name="读软件号">
<Rect left="790" top="434" right="890" bottom="466"/>
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
</Script></Activity>
<Activity id="864" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="550" top="434" right="650" bottom="466"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="1.01.25";          
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
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


                                                          


</Script><assessment no="10" name="DEP673" type="8" flags="97"/>
</Activity>
<Activity id="865" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="344" right="770" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="434" right="770" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="882" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="434" right="1010" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="883" ActivityType="3" flags="0" name="延时300MS">
<Rect left="910" top="344" right="1010" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1238" ActivityType="13" flags="0" name="读故障码">
<Rect left="550" top="554" right="650" bottom="586"/>
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
<assessment no="15" name="DEP128" type="8" flags="97"/>
</Activity>
<Activity id="1239" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="550" top="644" right="650" bottom="676"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B11D515&quot;,&quot;U014187&quot;,&quot;U018587&quot;,&quot;U019987&quot;,&quot;U014687&quot;,&quot;U016487&quot;,&quot;U100087&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_RRDCU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2076" type="8" flags="97"/>
</Activity>
<Activity id="1240" ActivityType="3" flags="0" name="TemplateTestLoop_door_lock">
<Rect left="830" top="534" right="930" bottom="566"/>
<Line2Text Enable="1" Text="手动开启车锁"/>
<Script></Script></Activity>
<Activity id="1241" ActivityType="3" flags="0" name="init">
<Rect left="830" top="594" right="930" bottom="626"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="1248" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="794" right="806" bottom="826"/>
</Activity>
<Activity id="1249" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="830" top="714" right="930" bottom="746"/>
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
<assessment block="1" ptbtext="DEP164" group="2801" pbltext="DEP2272" no="100" name="DEP2531" type="8" flags="97"/>
</Activity>
<Activity id="1250" ActivityType="3" flags="0" name="初始化">
<Rect left="830" top="654" right="930" bottom="686"/>
<Script>DFloat_Mts3Result=math.abs(engine.pf_door_i );
DFloat_Mts3Result = tonumber(DFloat_Mts3Result)
</Script></Activity>
<Activity id="1251" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="654" right="806" bottom="686"/>
</Activity>
<Activity id="1252" ActivityType="3" flags="0" name="endloop">
<Rect left="830" top="794" right="930" bottom="826"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="4">
</Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="6">
</Transition>
<Transition StartId="5" EndId="720" type="0">
</Transition>
<Transition StartId="7" EndId="4" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="708" type="0">
</Transition>
<Transition StartId="708" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="726" type="0">
</Transition>
<Transition StartId="717" EndId="718" type="0">
</Transition>
<Transition StartId="718" EndId="1238" type="0">
</Transition>
<Transition StartId="719" EndId="725" type="0">
</Transition>
<Transition StartId="720" EndId="719" type="0">
</Transition>
<Transition StartId="721" EndId="724" type="0">
</Transition>
<Transition StartId="723" EndId="717" type="0">
</Transition>
<Transition StartId="724" EndId="723" type="0">
</Transition>
<Transition StartId="725" EndId="2" type="0">
</Transition>
<Transition StartId="726" EndId="865" type="0">
</Transition>
<Transition StartId="859" EndId="883" type="0">
</Transition>
<Transition StartId="860" EndId="882" type="0">
</Transition>
<Transition StartId="862" EndId="881" type="0">
</Transition>
<Transition StartId="864" EndId="721" type="0">
</Transition>
<Transition StartId="865" EndId="859" type="0">
</Transition>
<Transition StartId="881" EndId="864" type="0">
</Transition>
<Transition StartId="882" EndId="862" type="0">
</Transition>
<Transition StartId="883" EndId="860" type="0">
</Transition>
<Transition StartId="1238" EndId="1239" type="0">
</Transition>
<Transition StartId="1239" EndId="719" type="0">
</Transition>
<Transition StartId="1240" EndId="1241" type="0">
</Transition>
<Transition StartId="1241" EndId="1250" type="0">
</Transition>
<Transition StartId="1248" EndId="1251" type="0">
</Transition>
<Transition StartId="1249" EndId="1252" type="0">
</Transition>
<Transition StartId="1250" EndId="1249" type="0">
</Transition>
<Transition StartId="1251" EndId="1250" type="0">
</Transition>
<Transition StartId="1252" EndId="1248" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
</Transitions>
</Process>

