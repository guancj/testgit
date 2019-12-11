<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1502" pbltext="DEP63">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="410" top="34" right="510" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="ESP标定"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="410" top="854" right="510" bottom="886"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="数据信息版本">
<Rect left="410" top="204" right="510" bottom="236"/>
<Line2Text Enable="1" Text="数据信息版本"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xf1\x82")</Script><assessment no="3" name="DEP1414" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="410" top="84" right="510" bottom="116"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="读VIN码">
<Rect left="410" top="264" right="510" bottom="296"/>
<Line2Text Enable="1" Text="读VIN码"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xf1\x90")</Script><assessment no="4" name="DEP272" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="410" top="324" right="510" bottom="356"/>
<Line2Text Enable="1" Text="读软件版本号"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xf1\x94")</Script><assessment no="5" name="DEP270" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="读取软件信息">
<Rect left="410" top="384" right="510" bottom="416"/>
<Line2Text Enable="1" Text="读软件版本信息"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xf1\x95")</Script><assessment no="6" name="DEP1415" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="读安装日期">
<Rect left="410" top="444" right="510" bottom="476"/>
<Line2Text Enable="1" Text="读安装日期"/>
<Script>request = "\xF1\x9D"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,request)

recvTel = recvTel:sub(4-1)
recvTel = LibGeneral.hex2str(recvTel)


</Script><assessment no="7" name="DEP1416" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="集成偏航率传感器标定">
<Rect left="410" top="494" right="510" bottom="526"/>
<Line2Text Enable="1" Text="传感器标定"/>
<Script>request = "\x01\xF1\x02"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
engine.Delay(2000)

</Script><assessment no="8" name="DEP1417" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="检查偏航率标定结果">
<Rect left="410" top="554" right="510" bottom="586"/>
<Line1Text Enable="1" Text="传感器标定结果"/>
<Script>Pram_1 = nil

repeat
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xF1\x02")

	MeasInt = string.byte(recvTel:sub(5,5)) 
	FinishFlag,Pram_1 = LibGeneral.Status_Check_view_8bit(Pram_1,1,"00000001",0,0,MeasInt,"",1,1,0,20)  --参数保存表,显示行,期望比对值,保留0,读服务的Err,待比对值,右边显示内容,比对类型(OK,NOK,OK计时,NOK计时),OKcount,NOKcount,TimeOut,
	engine.Delay(50)																			--返回值FinishFlag(true 完成退出 false未完成),PramOut(表为下次比对准备)																			
until(FinishFlag == true)

</Script><assessment no="9" name="DEP1418" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="清除故障码">
<Rect left="410" top="614" right="510" bottom="646"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script><assessment no="10" name="DEP1050" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="拓展会话">
<Rect left="410" top="144" right="510" bottom="176"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="2" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="410" top="794" right="510" bottom="826"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="UDS_ReadDTCByStatusMask">
<Rect left="410" top="664" right="510" bottom="696"/>
<TitleText Enable="1" Text="ESP 读取DTC"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x08"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="308" ActivityType="13" flags="0" name="UDS_DTCFilterStatisticList">
<Rect left="410" top="724" right="510" bottom="756"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U160808&quot;,&quot;C106600&quot;}"/>
<Parameter id="ViewList_Flag" value="true"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C131_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1575" type="8" flags="97"/>
</Activity>
<Activity id="309" ActivityType="3" flags="0" name="NOK">
<Rect left="730" top="244" right="830" bottom="276"/>
<Script>engine.LastError = 1</Script></Activity>
<Activity id="310" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="794" right="796" bottom="826"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="3">
</Transition>
<Transition StartId="3" EndId="309" type="0">
</Transition>
<Transition StartId="4" EndId="17" type="3">
</Transition>
<Transition StartId="4" EndId="309" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="3">
</Transition>
<Transition StartId="5" EndId="309" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="3">
</Transition>
<Transition StartId="6" EndId="309" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="3">
</Transition>
<Transition StartId="7" EndId="309" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="3">
</Transition>
<Transition StartId="8" EndId="309" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="3">
</Transition>
<Transition StartId="13" EndId="309" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="3">
</Transition>
<Transition StartId="14" EndId="309" type="0">
</Transition>
<Transition StartId="15" EndId="19" type="3">
</Transition>
<Transition StartId="15" EndId="309" type="0">
</Transition>
<Transition StartId="17" EndId="3" type="3">
</Transition>
<Transition StartId="17" EndId="309" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="0">
</Transition>
<Transition StartId="19" EndId="308" type="0">
</Transition>
<Transition StartId="308" EndId="18" type="3">
</Transition>
<Transition StartId="308" EndId="309" type="0">
</Transition>
<Transition StartId="309" EndId="310" type="0">
</Transition>
<Transition StartId="310" EndId="18" type="0">
</Transition>
</Transitions>
</Process>

