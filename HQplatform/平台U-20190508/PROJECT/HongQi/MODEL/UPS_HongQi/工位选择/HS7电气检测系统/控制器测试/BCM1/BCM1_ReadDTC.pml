<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3027" pbltext="DEP41">
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="600" top="44" right="700" bottom="76"/>
<Script></Script><TitleText Enable="1" Text="BCM1(车身控制器1)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="600" top="464" right="700" bottom="496"/>
<Script>--#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="读故障码">
<Rect left="600" top="254" right="700" bottom="286"/>
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
<assessment no="123" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="过滤以及解释TR1">
<Rect left="600" top="314" right="700" bottom="346"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;U019987&quot;,&quot;U020087&quot;,&quot;U020187&quot;,&quot;U020287&quot;,&quot;U124387&quot;,&quot;U123587&quot;,&quot;U014687&quot;,&quot;U014187&quot;,&quot;U019887&quot;,&quot;U023087&quot;,&quot;B101400&quot;,&quot;B101700&quot;,&quot;B100200&quot;,&quot;B100500&quot;,&quot;U02FF87&quot;,&quot;B100800&quot;,&quot;B100B00&quot;,&quot;B101A00&quot;,&quot;B101D00&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_BCM1&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="144" name="DEP2081" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="394" top="394" right="426" bottom="426"/>
</Activity>
<Activity id="176" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="460" top="314" right="560" bottom="346"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_BCM1&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="170" name="DEP2081" type="8" flags="97"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="通讯失败">
<Rect left="360" top="194" right="460" bottom="226"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="184" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="600" top="134" right="700" bottom="166"/>
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
<Rect left="600" top="194" right="700" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="175" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="360" top="134" right="460" bottom="166"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="600" top="394" right="700" bottom="426"/>
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

