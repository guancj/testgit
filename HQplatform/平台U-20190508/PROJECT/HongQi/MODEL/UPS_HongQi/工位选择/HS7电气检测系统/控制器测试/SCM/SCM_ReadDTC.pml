<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3024" pbltext="DEP205">
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
<Variable id="CAN_SND_ID" type="3" data="0x753" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="600" top="84" right="700" bottom="116"/>
<Script></Script><TitleText Enable="1" Text="SCM(转向柱)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="600" top="534" right="700" bottom="566"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="600" top="284" right="700" bottom="316"/>
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
<assessment no="15" name="DEP208" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="600" top="344" right="700" bottom="376"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U020887&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_SCM&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2078" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="414" right="406" bottom="446"/>
</Activity>
<Activity id="176" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="450" top="344" right="550" bottom="376"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_SCM&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP2078" type="8" flags="97"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1160" top="164" right="1260" bottom="196"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="178" ActivityType="3" flags="0" name="通讯">
<Rect left="1160" top="214" right="1260" bottom="246"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="179" ActivityType="3" flags="0" name="通讯失败">
<Rect left="970" top="214" right="1070" bottom="246"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="结束通讯">
<Rect left="970" top="174" right="1070" bottom="206"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="181" ActivityType="3" flags="0" name="通讯失败">
<Rect left="410" top="204" right="510" bottom="236"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="184" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="600" top="154" right="700" bottom="186"/>
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
<Activity id="185" ActivityType="13" flags="0" name="扩展会话">
<Rect left="600" top="214" right="700" bottom="246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="400" top="144" right="500" bottom="176"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="560" top="414" right="660" bottom="446"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="184" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>Station == "TR1"</Expression></Transition>
<Transition StartId="4" EndId="176" type="0">
</Transition>
<Transition StartId="5" EndId="214" type="0">
</Transition>
<Transition StartId="175" EndId="214" type="0">
</Transition>
<Transition StartId="176" EndId="214" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="179" type="4">
</Transition>
<Transition StartId="178" EndId="4" type="3">
</Transition>
<Transition StartId="179" EndId="180" type="0">
</Transition>
<Transition StartId="180" EndId="177" type="0">
</Transition>
<Transition StartId="181" EndId="213" type="0">
</Transition>
<Transition StartId="181" EndId="175" type="5">
</Transition>
<Transition StartId="184" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="4" type="0">
</Transition>
<Transition StartId="185" EndId="181" type="4">
</Transition>
<Transition StartId="213" EndId="184" type="0">
</Transition>
<Transition StartId="214" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

