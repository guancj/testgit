<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3003" pbltext="DEP31">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="610" top="84" right="710" bottom="116"/>
<Script></Script><TitleText Enable="1" Text="AT(变速箱)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="600" top="504" right="700" bottom="536"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="600" top="294" right="700" bottom="326"/>
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
<assessment no="15" name="DEP149" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="600" top="394" right="700" bottom="426"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;P097715&quot;,&quot;P097914&quot;,&quot;P098214&quot;,&quot;P098514&quot;,&quot;P099B14&quot;,&quot;P099814&quot;,&quot;P096214&quot;,&quot;P276414&quot;,&quot;P072014&quot;,&quot;P071514&quot;,&quot;P070831&quot;,&quot;U010387&quot;,&quot;U141486&quot;,&quot;U141586&quot;,&quot;U141286&quot;,&quot;U141386&quot;,&quot;141186&quot;,&quot;U141686&quot;,&quot;U140886&quot;,&quot;U141186&quot;,&quot;U142286&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_AT&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2058" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="454" right="476" bottom="486"/>
</Activity>
<Activity id="176" ActivityType="13" flags="1" name="过滤以及解释">
<Rect left="470" top="394" right="570" bottom="426"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_AT&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2058" type="8" flags="97"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="通讯失败">
<Rect left="410" top="224" right="510" bottom="256"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="211" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="610" top="164" right="710" bottom="196"/>
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
<Rect left="610" top="224" right="710" bottom="256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP32" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="410" top="164" right="510" bottom="196"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="600" top="454" right="700" bottom="486"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="215" ActivityType="13" flags="0" name="过滤以及解释TR2">
<Rect left="710" top="394" right="810" bottom="426"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U142286&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_AT&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2058" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="211" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="176" type="0">
</Transition>
<Transition StartId="4" EndId="215" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="5" EndId="214" type="0">
</Transition>
<Transition StartId="175" EndId="214" type="0">
</Transition>
<Transition StartId="176" EndId="214" type="0">
</Transition>
<Transition StartId="210" EndId="213" type="0">
</Transition>
<Transition StartId="210" EndId="175" type="5">
</Transition>
<Transition StartId="211" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="210" type="4">
</Transition>
<Transition StartId="212" EndId="4" type="0">
</Transition>
<Transition StartId="213" EndId="211" type="0">
</Transition>
<Transition StartId="214" EndId="2" type="0">
</Transition>
<Transition StartId="215" EndId="214" type="0">
</Transition>
</Transitions>
</Process>

