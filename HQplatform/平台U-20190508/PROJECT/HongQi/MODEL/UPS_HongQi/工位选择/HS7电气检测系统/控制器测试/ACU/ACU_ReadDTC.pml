<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3006" pbltext="DEP1616">
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
<Variable id="CAN_SND_ID" type="3" data="0x720" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x728" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="590" top="84" right="690" bottom="116"/>
<Script></Script><TitleText Enable="1" Text="ACU(安全气囊)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="590" top="714" right="690" bottom="746"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="590" top="304" right="690" bottom="336"/>
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
<assessment no="15" name="DEP1845" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="690" top="464" right="790" bottom="496"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B00201A&quot;,&quot;B00111B&quot;,&quot;B00281A&quot;,&quot;B00011B&quot;,&quot;B00021B&quot;,&quot;B00DF15&quot;,&quot;B00301A&quot;,&quot;B00301A&quot;,&quot;B00301B&quot;,&quot;B00381B&quot;,&quot;B009013&quot;,&quot;B009513&quot;,&quot;B009213&quot;,&quot;B009713&quot;,&quot;B00381A&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="424" top="644" right="456" bottom="676"/>
</Activity>
<Activity id="177" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="440" top="494" right="540" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B009713&quot;,&quot;B00381A&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="13" flags="0" name="过滤以及解释TR2">
<Rect left="940" top="464" right="1040" bottom="496"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B00011B&quot;,&quot;B00021B&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="通讯失败">
<Rect left="390" top="254" right="490" bottom="286"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="184" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="590" top="194" right="690" bottom="226"/>
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
<Rect left="590" top="254" right="690" bottom="286"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1617" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="390" top="194" right="490" bottom="226"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="590" top="644" right="690" bottom="676"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="215" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="464" right="656" bottom="496"/>
</Activity>
<Activity id="216" ActivityType="13" flags="0" name="C081-TR1">
<Rect left="590" top="574" right="690" bottom="606"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B00201A&quot;,&quot;B00111B&quot;,&quot;B00281A&quot;,&quot;B00011B&quot;,&quot;B00021B&quot;,&quot;B00DF15&quot;,&quot;B00301A&quot;,&quot;B00301A&quot;,&quot;B00301B&quot;,&quot;B00381B&quot;,&quot;B009013&quot;,&quot;B009513&quot;,&quot;B009213&quot;,&quot;B009713&quot;,&quot;B00381A&quot;,&quot;B00721B&quot;,&quot;B00281B&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="217" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="404" right="1006" bottom="436"/>
</Activity>
<Activity id="218" ActivityType="13" flags="0" name="c081-tr2">
<Rect left="810" top="464" right="910" bottom="496"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B00011B&quot;,&quot;B00021B&quot;,&quot;B00721B&quot;,&quot;B00281B&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="434" right="506" bottom="466"/>
</Activity>
<Activity id="220" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="330" top="494" right="430" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ACU&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1889" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="404" right="926" bottom="436"/>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="434" right="556" bottom="466"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="184" type="0">
</Transition>
<Transition StartId="4" EndId="215" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="219" type="0">
</Transition>
<Transition StartId="4" EndId="217" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="5" EndId="214" type="0">
</Transition>
<Transition StartId="175" EndId="214" type="0">
</Transition>
<Transition StartId="177" EndId="214" type="0">
</Transition>
<Transition StartId="178" EndId="214" type="0">
</Transition>
<Transition StartId="183" EndId="213" type="0">
</Transition>
<Transition StartId="183" EndId="175" type="5">
</Transition>
<Transition StartId="184" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="183" type="4">
</Transition>
<Transition StartId="212" EndId="4" type="0">
</Transition>
<Transition StartId="213" EndId="184" type="0">
</Transition>
<Transition StartId="214" EndId="2" type="0">
</Transition>
<Transition StartId="215" EndId="5" type="0">
</Transition>
<Transition StartId="215" EndId="216" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="216" EndId="214" type="0">
</Transition>
<Transition StartId="217" EndId="178" type="0">
</Transition>
<Transition StartId="218" EndId="214" type="0">
</Transition>
<Transition StartId="219" EndId="220" type="0">
</Transition>
<Transition StartId="220" EndId="214" type="0">
</Transition>
<Transition StartId="221" EndId="218" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="222" EndId="177" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
</Transitions>
</Process>

