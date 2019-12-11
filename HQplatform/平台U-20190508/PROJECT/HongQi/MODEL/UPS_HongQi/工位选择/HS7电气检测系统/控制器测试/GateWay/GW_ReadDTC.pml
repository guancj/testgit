<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3001" pbltext="DEP18">
<Parameters>
<Variable id="Station" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x780" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x788" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="84" right="590" bottom="116"/>
<Script></Script><TitleText Enable="1" Text="网关(GW)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="514" right="590" bottom="546"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="490" top="314" right="590" bottom="346"/>
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
<assessment no="14" name="DEP21" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="490" top="384" right="590" bottom="416"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U023387&quot;,&quot;U020087&quot;,&quot;U020187&quot;,&quot;U020287&quot;,&quot;U020887&quot;,&quot;U019987&quot;,&quot;U011187&quot;,&quot;&quot;,&quot;U012087&quot;,&quot;U025687&quot;,&quot;U2FE87&quot;,&quot;U024687&quot;,&quot;U010387&quot;,&quot;U013187&quot;,&quot;U013887&quot;,&quot;U02FE87&quot;,&quot;U023587&quot;,&quot;U015187&quot;,&quot;U013287&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout"/>
<Parameter id="section" value="&quot;C079_GW&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1843" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="4" flags="0" name="路由节点">
<Rect left="334" top="454" right="366" bottom="486"/>
</Activity>
<Activity id="175" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="380" top="384" right="480" bottom="416"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout"/>
<Parameter id="section" value="&quot;C079_GW&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1843" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="3" flags="0" name="通讯失败">
<Rect left="300" top="204" right="400" bottom="236"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="211" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="490" top="144" right="590" bottom="176"/>
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
<Activity id="212" ActivityType="13" flags="0" name="建立通讯">
<Rect left="490" top="204" right="590" bottom="236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="490" top="454" right="590" bottom="486"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="300" top="144" right="400" bottom="176"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="216" ActivityType="13" flags="0" name="扩展会话">
<Rect left="490" top="264" right="590" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="217" ActivityType="13" flags="0" name="过滤以及解释TR2">
<Rect left="600" top="384" right="700" bottom="416"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U011D87&quot;,&quot;U016487&quot;,&quot;U025687&quot;,&quot;U02FE87&quot;,&quot;B107300&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout"/>
<Parameter id="section" value="&quot;C079_GW&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1843" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="13" flags="0" name="过滤以及解释FUN">
<Rect left="720" top="384" right="820" bottom="416"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B107300&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout"/>
<Parameter id="section" value="&quot;C079_GW&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1843" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="211" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="175" type="0">
</Transition>
<Transition StartId="4" EndId="217" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="4" EndId="221" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="5" EndId="213" type="0">
</Transition>
<Transition StartId="172" EndId="213" type="0">
</Transition>
<Transition StartId="175" EndId="213" type="0">
</Transition>
<Transition StartId="208" EndId="214" type="0">
</Transition>
<Transition StartId="208" EndId="172" type="5">
</Transition>
<Transition StartId="211" EndId="212" type="3">
</Transition>
<Transition StartId="212" EndId="208" type="4">
</Transition>
<Transition StartId="212" EndId="216" type="0">
</Transition>
<Transition StartId="213" EndId="2" type="0">
</Transition>
<Transition StartId="214" EndId="211" type="0">
</Transition>
<Transition StartId="216" EndId="4" type="0">
</Transition>
<Transition StartId="217" EndId="213" type="0">
</Transition>
<Transition StartId="221" EndId="213" type="0">
</Transition>
</Transitions>
</Process>

