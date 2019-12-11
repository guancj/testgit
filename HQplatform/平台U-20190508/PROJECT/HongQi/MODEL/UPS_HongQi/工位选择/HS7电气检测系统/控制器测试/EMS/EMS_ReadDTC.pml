<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3002" pbltext="DEP142">
<Parameters>
<Variable id="Station" type="8" dir="0" data="{}"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="600" top="94" right="700" bottom="126"/>
<Script></Script><TitleText Enable="1" Text="EMS(发动机)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="600" top="634" right="700" bottom="666"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="600" top="314" right="700" bottom="346"/>
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
<assessment no="16" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="600" top="454" right="700" bottom="486"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U100887&quot;,&quot;U041586&quot;,&quot;U042886&quot;,&quot;UO11186&quot;,&quot;U041587&quot;,&quot;U011186&quot;,&quot;U110100&quot;,&quot;U110300&quot;,&quot;U110400&quot;,&quot;U110500&quot;,&quot;U110600&quot;,&quot;C003100&quot;,&quot;C003400&quot;,&quot;C003700&quot;,&quot;C003A00&quot;,&quot;P011800&quot;,&quot;P059713&quot;,&quot;P260000&quot;,&quot;P025A13&quot;,&quot;P055800&quot;,&quot;P003029&quot;,&quot;P005000&quot;,&quot;P070000&quot;,&quot;P254100&quot;,&quot;P019300&quot;,&quot;P217652&quot;,&quot;P217654&quot;,&quot;P256400&quot;,&quot;P202200&quot;,&quot;P201700&quot;,&quot;P023800&quot;,&quot;P011300&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="2000"/>
<Parameter id="section" value="&quot;C079_EMS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="pCode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="pCodelist"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP2057" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="584" right="396" bottom="616"/>
</Activity>
<Activity id="178" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="470" top="454" right="570" bottom="486"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="2000"/>
<Parameter id="section" value="&quot;C079_EMS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="pCode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="pCodelist"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP2057" type="8" flags="97"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="通讯失败">
<Rect left="330" top="234" right="430" bottom="266"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="211" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="600" top="174" right="700" bottom="206"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="212" ActivityType="13" flags="0" name="扩展会话">
<Rect left="600" top="234" right="700" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="330" top="174" right="430" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="215" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="600" top="584" right="700" bottom="616"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="221" ActivityType="13" flags="0" name="过滤以及解释TR2">
<Rect left="720" top="454" right="820" bottom="486"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U042886&quot;,&quot;U041586&quot;,&quot;U040586&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="2000"/>
<Parameter id="section" value="&quot;C079_EMS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="pCode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="pCodelist"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP2057" type="8" flags="97"/>
</Activity>
<Activity id="222" ActivityType="13" flags="1" name="过滤以及解释TR2">
<Rect left="850" top="454" right="950" bottom="486"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;P012800&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="2000"/>
<Parameter id="section" value="&quot;C079_EMS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="pCode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="pCodelist"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP2057" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="211" type="0">
</Transition>
<Transition StartId="4" EndId="9" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="178" type="0">
</Transition>
<Transition StartId="4" EndId="221" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="4" EndId="222" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="9" EndId="215" type="0">
</Transition>
<Transition StartId="12" EndId="215" type="0">
</Transition>
<Transition StartId="178" EndId="215" type="0">
</Transition>
<Transition StartId="210" EndId="213" type="0">
</Transition>
<Transition StartId="210" EndId="12" type="5">
</Transition>
<Transition StartId="211" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="210" type="4">
</Transition>
<Transition StartId="212" EndId="4" type="0">
</Transition>
<Transition StartId="212" EndId="12" type="5">
</Transition>
<Transition StartId="213" EndId="211" type="0">
</Transition>
<Transition StartId="215" EndId="2" type="0">
</Transition>
<Transition StartId="221" EndId="215" type="0">
</Transition>
<Transition StartId="222" EndId="215" type="0">
</Transition>
</Transitions>
</Process>

