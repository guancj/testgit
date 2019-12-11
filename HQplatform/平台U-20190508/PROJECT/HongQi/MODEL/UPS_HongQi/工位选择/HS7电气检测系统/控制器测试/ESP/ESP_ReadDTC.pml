<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3007" pbltext="DEP63">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AC" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="450" top="124" right="550" bottom="156"/>
<Script></Script><TitleText Enable="1" Text="ESP(车身电子稳定系统)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="450" top="704" right="550" bottom="736"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="450" top="304" right="550" bottom="336"/>
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
<assessment no="15" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="450" top="494" right="550" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;C103296&quot;,&quot;C103396&quot;,&quot;C003200&quot;,&quot;C003500&quot;,&quot;C003800&quot;,&quot;C003B00&quot;,&quot;C00A800&quot;,&quot;C00A900&quot;,&quot;C00AA00&quot;,&quot;C00AB00&quot;,&quot;C00AC00&quot;,&quot;C121208&quot;,&quot;C155512&quot;,&quot;C156601&quot;,&quot;C156701&quot;,&quot;U040186&quot;,&quot;U040286&quot;,&quot;U042886&quot;,&quot;U044786&quot;,&quot;U113887&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="624" right="186" bottom="656"/>
</Activity>
<Activity id="178" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="340" top="494" right="440" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="通讯失败">
<Rect left="120" top="304" right="220" bottom="336"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="184" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="450" top="174" right="550" bottom="206"/>
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
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="120" top="174" right="220" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="450" top="624" right="550" bottom="656"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="215" ActivityType="13" flags="0" name="过滤以及解释TR2">
<Rect left="680" top="494" right="780" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;C00A800&quot;,&quot;U042886&quot;,&quot;U011D87&quot;,&quot;U110187&quot;,&quot;C155512&quot;,&quot;U110087&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="414" right="516" bottom="446"/>
</Activity>
<Activity id="217" ActivityType="13" flags="0" name="M+过滤以及解释TR1">
<Rect left="560" top="494" right="660" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;C103296&quot;,&quot;C103396&quot;,&quot;C003200&quot;,&quot;C003500&quot;,&quot;C003800&quot;,&quot;C003B00&quot;,&quot;C00A800&quot;,&quot;C00A900&quot;,&quot;C00AA00&quot;,&quot;C00AB00&quot;,&quot;C00AC00&quot;,&quot;C121208&quot;,&quot;C155512&quot;,&quot;C156601&quot;,&quot;C156701&quot;,&quot;U040186&quot;,&quot;U040286&quot;,&quot;U042886&quot;,&quot;U044786&quot;,&quot;U113887&quot;,&quot;U124387&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="414" right="746" bottom="446"/>
</Activity>
<Activity id="219" ActivityType="13" flags="0" name="M+过滤以及解释TR2">
<Rect left="800" top="494" right="900" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;C00A800&quot;,&quot;U042886&quot;,&quot;U011D87&quot;,&quot;U124387&quot;,&quot;U110187&quot;,&quot;C155512&quot;,&quot;U110087&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="414" right="406" bottom="446"/>
</Activity>
<Activity id="221" ActivityType="13" flags="0" name="M+过滤以及解释">
<Rect left="220" top="494" right="320" bottom="526"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U124387&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2062" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="184" type="0">
</Transition>
<Transition StartId="4" EndId="216" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="220" type="0">
</Transition>
<Transition StartId="4" EndId="218" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="4" EndId="183" type="4">
</Transition>
<Transition StartId="5" EndId="214" type="0">
</Transition>
<Transition StartId="175" EndId="214" type="0">
</Transition>
<Transition StartId="178" EndId="214" type="0">
</Transition>
<Transition StartId="183" EndId="213" type="0">
</Transition>
<Transition StartId="183" EndId="175" type="5">
</Transition>
<Transition StartId="184" EndId="4" type="0">
</Transition>
<Transition StartId="213" EndId="184" type="0">
</Transition>
<Transition StartId="214" EndId="2" type="0">
</Transition>
<Transition StartId="215" EndId="214" type="0">
</Transition>
<Transition StartId="216" EndId="5" type="0">
</Transition>
<Transition StartId="216" EndId="217" type="1">
<Expression>LibGeneral.CarTNC_HS7_M_plus(engine.CarType)</Expression></Transition>
<Transition StartId="217" EndId="214" type="0">
</Transition>
<Transition StartId="218" EndId="215" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="1">
<Expression>LibGeneral.CarTNC_HS7_M_plus(engine.CarType)</Expression></Transition>
<Transition StartId="219" EndId="214" type="0">
</Transition>
<Transition StartId="220" EndId="178" type="0">
</Transition>
<Transition StartId="220" EndId="221" type="1">
<Expression>LibGeneral.CarTNC_HS7_M_plus(engine.CarType)</Expression></Transition>
<Transition StartId="221" EndId="214" type="0">
</Transition>
</Transitions>
</Process>

