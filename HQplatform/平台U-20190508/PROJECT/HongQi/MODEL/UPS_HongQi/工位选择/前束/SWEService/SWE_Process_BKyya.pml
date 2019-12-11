<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1133" pbltext="DEP41">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75E" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="150" top="24" right="250" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="150" top="1614" right="250" bottom="1646"/>
<Script></Script><Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="11" ActivityType="5" flags="0" name="灯箱回基准位">
<Rect left="150" top="1554" right="250" bottom="1586"/>
<SubProcesses>
<SubProcess id="SWE_05_BasicState">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="34" ActivityType="5" flags="0" name="右近光灯结果">
<Rect left="150" top="584" right="250" bottom="616"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Lowright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="35" ActivityType="5" flags="0" name="右远光灯结果">
<Rect left="150" top="904" right="250" bottom="936"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Hightright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="36" ActivityType="5" flags="0" name="左远光灯结果">
<Rect left="150" top="1084" right="250" bottom="1116"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Hightleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="43" ActivityType="5" flags="0" name="右远光灯调整">
<Rect left="150" top="844" right="250" bottom="876"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Hightright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="44" ActivityType="5" flags="0" name="左远光灯调整">
<Rect left="150" top="1024" right="250" bottom="1056"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Hightleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="49" ActivityType="5" flags="0" name="左远光灯光强结果">
<Rect left="150" top="1144" right="250" bottom="1176"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Intensityleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="58" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="150" top="84" right="250" bottom="116"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="59" ActivityType="13" flags="0" name="扩展会话">
<Rect left="150" top="144" right="250" bottom="176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="100" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="13" flags="0" name="安全访问">
<Rect left="150" top="204" right="250" bottom="236"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
<assessment no="101" name="DEP2240" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="13" flags="0" name="打开左近光灯">
<Rect left="150" top="254" right="250" bottom="286"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="102" name="DEP2241" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="13" flags="0" name="打开右近光灯">
<Rect left="150" top="314" right="250" bottom="346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x04\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="103" name="DEP2242" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="5" flags="0" name="左近光灯调整">
<Rect left="150" top="384" right="250" bottom="416"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Lowleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="142" ActivityType="5" flags="0" name="左近光灯结果">
<Rect left="150" top="454" right="250" bottom="486"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Lowleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="144" ActivityType="5" flags="0" name="右近光灯调整">
<Rect left="150" top="514" right="250" bottom="546"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Lowright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="145" ActivityType="13" flags="0" name="打开左远光灯">
<Rect left="150" top="714" right="250" bottom="746"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="105" name="DEP2243" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="13" flags="0" name="打开右远光灯">
<Rect left="150" top="644" right="250" bottom="676"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x06\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="104" name="DEP2244" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="13" flags="0" name="关闭左近光灯">
<Rect left="150" top="1334" right="250" bottom="1366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x03\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="108" name="DEP2245" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="13" flags="0" name="关闭右近光灯">
<Rect left="150" top="1404" right="250" bottom="1436"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x04\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="109" name="DEP2246" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="13" flags="0" name="关闭左远光灯">
<Rect left="150" top="1264" right="250" bottom="1296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x05\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="107" name="DEP2247" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="13" flags="0" name="关闭右远光灯">
<Rect left="150" top="1204" right="250" bottom="1236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x06\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="106" name="DEP2248" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="延时500ms">
<Rect left="150" top="774" right="250" bottom="806"/>
<Script>engine.Delay(500)</Script></Activity>
<Activity id="153" ActivityType="5" flags="0" name="右远光灯光强结果">
<Rect left="150" top="954" right="250" bottom="986"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Intensityright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="384" right="396" bottom="416"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="844" right="396" bottom="876"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="1204" right="396" bottom="1236"/>
</Activity>
<Activity id="161" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="150" top="1484" right="250" bottom="1516"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="164" right="686" bottom="196"/>
</Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="1484" right="686" bottom="1516"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="58" type="0">
</Transition>
<Transition StartId="11" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="146" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="34" EndId="158" type="0">
</Transition>
<Transition StartId="35" EndId="153" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="35" EndId="159" type="0">
</Transition>
<Transition StartId="36" EndId="49" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="36" EndId="159" type="0">
</Transition>
<Transition StartId="43" EndId="35" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="43" EndId="159" type="0">
</Transition>
<Transition StartId="44" EndId="36" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="44" EndId="159" type="0">
</Transition>
<Transition StartId="49" EndId="150" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="3">
</Transition>
<Transition StartId="58" EndId="162" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="3">
</Transition>
<Transition StartId="59" EndId="162" type="0">
</Transition>
<Transition StartId="60" EndId="125" type="3">
</Transition>
<Transition StartId="60" EndId="162" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="141" EndId="158" type="0">
</Transition>
<Transition StartId="142" EndId="144" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="142" EndId="158" type="0">
</Transition>
<Transition StartId="144" EndId="34" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="144" EndId="158" type="0">
</Transition>
<Transition StartId="145" EndId="152" type="0">
</Transition>
<Transition StartId="146" EndId="145" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="161" type="0">
</Transition>
<Transition StartId="149" EndId="147" type="0">
</Transition>
<Transition StartId="150" EndId="149" type="0">
</Transition>
<Transition StartId="150" EndId="149" type="0">
</Transition>
<Transition StartId="152" EndId="43" type="0">
</Transition>
<Transition StartId="153" EndId="44" type="0">
</Transition>
<Transition StartId="153" EndId="159" type="0">
</Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="160" EndId="150" type="0">
</Transition>
<Transition StartId="161" EndId="11" type="0">
</Transition>
<Transition StartId="162" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="161" type="0">
</Transition>
</Transitions>
</Process>

