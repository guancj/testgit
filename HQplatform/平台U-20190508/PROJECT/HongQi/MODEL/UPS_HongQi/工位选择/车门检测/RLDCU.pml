<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3021" pbltext="DEP119">
<Parameters>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="DString_C131_Partnumber_RLDCU" type="8" dir="0" data="DString_C131_Partnumber_RLDCU"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x756" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="150" top="4" right="250" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="HS7-左后门检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="150" top="784" right="250" bottom="816"/>
<Script>engine.registerPacket(1,4000,0x7DF,"",0);
if( vciHandle == nil or vciHandle &lt; 0) then 
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
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="150" top="74" right="250" bottom="106"/>
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
<Rect left="150" top="134" right="250" bottom="166"/>
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
<assessment no="1" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="重试？">
<Rect left="20" top="134" right="120" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line3Text Enable="1" Text="重试吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="74" right="86" bottom="106"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="清故障码">
<Rect left="150" top="194" right="250" bottom="226"/>
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
<assessment no="2" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="重置">
<Rect left="150" top="254" right="250" bottom="286"/>
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
<Rect left="150" top="314" right="250" bottom="346"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="5"/>
<Parameter id="Text" value="&quot;请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="150" top="364" right="250" bottom="396"/>
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
<assessment no="3" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="716" ActivityType="3" flags="0" name="维持信号">
<Rect left="300" top="364" right="400" bottom="396"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="717" ActivityType="5" flags="1" name="RLDCU_check_door_light_lock_HS7">
<Rect left="150" top="534" right="250" bottom="566"/>
<SubProcesses>
<SubProcess id="RLDCU_check_door_light_lock_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="718" ActivityType="5" flags="0" name="RLDCU_check_switchs_HS7">
<Rect left="150" top="594" right="250" bottom="626"/>
<SubProcesses>
<SubProcess id="RLDCU_check_switchs_HS7">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="868" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="784" right="86" bottom="816"/>
</Activity>
<Activity id="869" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="300" top="424" right="400" bottom="456"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP123" type="8" flags="97"/>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="发送key">
<Rect left="300" top="534" right="400" bottom="566"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP124" type="8" flags="97"/>
</Activity>
<Activity id="871" ActivityType="13" flags="0" name="计算key">
<Rect left="300" top="484" right="400" bottom="516"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x41641375"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="873" ActivityType="3" flags="0" name="比对零件号">
<Rect left="430" top="364" right="530" bottom="396"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_RLDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_RLDCU);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	if (DString1==DString_C131_Partnumber_RLDCU) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_RLDCU);
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_RLDCU);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_RLDCU;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;             
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="6" name="DEP589" type="8" flags="97"/>
</Activity>
<Activity id="874" ActivityType="3" flags="0" name="读硬件号">
<Rect left="700" top="364" right="800" bottom="396"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;</Script></Activity>
<Activity id="875" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="960" top="364" right="1060" bottom="396"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;</Script></Activity>
<Activity id="876" ActivityType="3" flags="0" name="读软件号">
<Rect left="700" top="424" right="800" bottom="456"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script></Activity>
<Activity id="877" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="430" top="424" right="530" bottom="456"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
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
end</Script><assessment no="10" name="DEP593" type="8" flags="97"/>
</Activity>
<Activity id="878" ActivityType="3" flags="0" name="延时300MS">
<Rect left="560" top="364" right="660" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="882" ActivityType="3" flags="0" name="延时300MS">
<Rect left="830" top="364" right="930" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="883" ActivityType="3" flags="0" name="延时300MS">
<Rect left="830" top="424" right="930" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="884" ActivityType="3" flags="0" name="延时300MS">
<Rect left="560" top="424" right="660" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="889" ActivityType="13" flags="0" name="读故障码">
<Rect left="150" top="654" right="250" bottom="686"/>
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
<assessment no="15" name="DEP122" type="8" flags="97"/>
</Activity>
<Activity id="890" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="150" top="714" right="250" bottom="746"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U014187&quot;,&quot;U018587&quot;,&quot;U019987&quot;,&quot;U014687&quot;,&quot;U016487&quot;,&quot;U100087&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_RLDCU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2075" type="8" flags="97"/>
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
<Transition StartId="6" EndId="868" type="0">
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
<Transition StartId="716" EndId="873" type="0">
</Transition>
<Transition StartId="717" EndId="718" type="0">
</Transition>
<Transition StartId="718" EndId="889" type="0">
</Transition>
<Transition StartId="868" EndId="2" type="0">
</Transition>
<Transition StartId="869" EndId="871" type="0">
</Transition>
<Transition StartId="870" EndId="717" type="0">
</Transition>
<Transition StartId="871" EndId="870" type="0">
</Transition>
<Transition StartId="873" EndId="878" type="0">
</Transition>
<Transition StartId="874" EndId="882" type="0">
</Transition>
<Transition StartId="875" EndId="883" type="0">
</Transition>
<Transition StartId="876" EndId="884" type="0">
</Transition>
<Transition StartId="877" EndId="869" type="0">
</Transition>
<Transition StartId="878" EndId="874" type="0">
</Transition>
<Transition StartId="882" EndId="875" type="0">
</Transition>
<Transition StartId="883" EndId="876" type="0">
</Transition>
<Transition StartId="884" EndId="877" type="0">
</Transition>
<Transition StartId="889" EndId="890" type="0">
</Transition>
<Transition StartId="890" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

