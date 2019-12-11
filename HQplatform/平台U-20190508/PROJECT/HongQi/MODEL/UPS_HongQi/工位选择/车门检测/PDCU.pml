<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3019" pbltext="DEP113">
<Parameters>
<Variable id="DString_C131_Partnumber_PDCU" type="8" dir="0" data="DString_C131_Partnumber_PDCU"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="物理通道"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x755" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75D" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="4" right="470" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="HS7-右前门检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="1184" right="470" bottom="1216"/>
<Script>engine.registerPacket(0,4000,0x7DF,"",0);
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
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="370" top="54" right="470" bottom="86"/>
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
<Rect left="370" top="114" right="470" bottom="146"/>
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
<assessment no="2" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="重试？">
<Rect left="250" top="104" right="350" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line3Text Enable="1" Text="重试吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="44" right="316" bottom="76"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="清故障码">
<Rect left="370" top="184" right="470" bottom="216"/>
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
<assessment no="11" name="DEP115" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="重置">
<Rect left="370" top="254" right="470" bottom="286"/>
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
<Activity id="707" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="370" top="314" right="470" bottom="346"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="5"/>
<Parameter id="Text" value="&quot;请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="370" top="374" right="470" bottom="406"/>
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
<assessment no="12" name="DEP1119" type="8" flags="97"/>
</Activity>
<Activity id="716" ActivityType="3" flags="0" name="维持信号">
<Rect left="370" top="434" right="470" bottom="466"/>
<Script>engine.registerPacket(0,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="717" ActivityType="5" flags="0" name="PDCU_adjust_mirror_HS7">
<Rect left="370" top="674" right="470" bottom="706"/>
<SubProcesses>
<SubProcess id="PDCU_adjust_mirror_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="718" ActivityType="5" flags="0" name="PDCU_Check_the_turn_and_door_light_HS7">
<Rect left="370" top="744" right="470" bottom="776"/>
<SubProcesses>
<SubProcess id="PDCU_Check_the_turn_and_door_light_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="719" ActivityType="5" flags="0" name="PLDCU_check_switchs_HS7">
<Rect left="370" top="814" right="470" bottom="846"/>
<SubProcesses>
<SubProcess id="PLDCU_check_switchs_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="720" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="370" top="1064" right="470" bottom="1096"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="右前门检测完成"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="721" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1064" right="316" bottom="1096"/>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="370" top="494" right="470" bottom="526"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP117" type="8" flags="97"/>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="发送key">
<Rect left="370" top="614" right="470" bottom="646"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP118" type="8" flags="97"/>
</Activity>
<Activity id="724" ActivityType="13" flags="0" name="计算key">
<Rect left="370" top="544" right="470" bottom="576"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30640275"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="725" ActivityType="5" flags="0" name="PDCU_line_decetion_HS7">
<Rect left="370" top="1124" right="470" bottom="1156"/>
<SubProcesses>
<SubProcess id="PDCU_line_decetion_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="726" ActivityType="5" flags="0" name="PDCU_Check_door_lock_HS7">
<Rect left="370" top="884" right="470" bottom="916"/>
<SubProcesses>
<SubProcess id="PDCU_Check_door_lock_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="727" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="434" right="620" bottom="466"/>
<Line1Text Enable="1" Text="读零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_PDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_PDCU);
len = string.len(DString_C131_Partnumber_PDCU)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_PDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PDCU);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_PDCU;
	
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
	
		if (DString1==DString_C131_Partnumber_PDCU) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PDCU); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PDCU);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_PDCU;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="15" name="DEP621" type="8" flags="97"/>
</Activity>
<Activity id="728" ActivityType="3" flags="0" name="读硬件号">
<Rect left="760" top="434" right="860" bottom="466"/>
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
<Activity id="729" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1000" top="434" right="1100" bottom="466"/>
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
<Activity id="730" ActivityType="3" flags="0" name="读软件号">
<Rect left="760" top="494" right="860" bottom="526"/>
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
<Activity id="731" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="520" top="494" right="620" bottom="526"/>
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


                                                          


</Script><assessment no="5" name="DEP629" type="8" flags="97"/>
</Activity>
<Activity id="732" ActivityType="3" flags="0" name="延时300MS">
<Rect left="880" top="494" right="980" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="879" ActivityType="3" flags="0" name="延时300MS">
<Rect left="880" top="434" right="980" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="880" ActivityType="3" flags="0" name="延时300MS">
<Rect left="640" top="434" right="740" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="延时300MS">
<Rect left="640" top="494" right="740" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="1199" ActivityType="13" flags="0" name="读故障码">
<Rect left="370" top="944" right="470" bottom="976"/>
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
<assessment no="17" name="DEP116" type="8" flags="97"/>
</Activity>
<Activity id="1200" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="370" top="1004" right="470" bottom="1036"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U019987&quot;,&quot;B115515&quot;,&quot;U014187&quot;,&quot;U018587&quot;,&quot;U020887&quot;,&quot;U014687&quot;,&quot;U016487&quot;,&quot;U100087&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_PDCU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2073" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="4">
</Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="6">
</Transition>
<Transition StartId="6" EndId="721" type="0">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="707" type="0">
</Transition>
<Transition StartId="707" EndId="708" type="0">
</Transition>
<Transition StartId="708" EndId="716" type="0">
</Transition>
<Transition StartId="716" EndId="727" type="0">
</Transition>
<Transition StartId="717" EndId="718" type="0">
</Transition>
<Transition StartId="718" EndId="719" type="0">
</Transition>
<Transition StartId="719" EndId="726" type="0">
</Transition>
<Transition StartId="720" EndId="725" type="0">
</Transition>
<Transition StartId="721" EndId="720" type="0">
</Transition>
<Transition StartId="722" EndId="724" type="0">
</Transition>
<Transition StartId="723" EndId="717" type="0">
</Transition>
<Transition StartId="724" EndId="723" type="0">
</Transition>
<Transition StartId="725" EndId="2" type="0">
</Transition>
<Transition StartId="726" EndId="1199" type="0">
</Transition>
<Transition StartId="727" EndId="880" type="0">
</Transition>
<Transition StartId="728" EndId="879" type="0">
</Transition>
<Transition StartId="729" EndId="732" type="0">
</Transition>
<Transition StartId="730" EndId="881" type="0">
</Transition>
<Transition StartId="731" EndId="722" type="0">
</Transition>
<Transition StartId="732" EndId="730" type="0">
</Transition>
<Transition StartId="879" EndId="729" type="0">
</Transition>
<Transition StartId="880" EndId="728" type="0">
</Transition>
<Transition StartId="881" EndId="731" type="0">
</Transition>
<Transition StartId="1199" EndId="1200" type="0">
</Transition>
<Transition StartId="1200" EndId="720" type="0">
</Transition>
</Transitions>
</Process>

