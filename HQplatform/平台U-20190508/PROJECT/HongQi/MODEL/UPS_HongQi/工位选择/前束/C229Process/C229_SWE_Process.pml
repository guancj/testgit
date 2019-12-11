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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
<Variable id="BCM_DontOpen" type="11" data="true"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="390" top="34" right="490" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="390" top="1594" right="490" bottom="1626"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
	--[[if(engine.LastError ~= 0) then
	engine.StatValue = "ECU Close fail ";	
	end --]]

end</Script><Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="11" ActivityType="5" flags="0" name="灯箱回基准位">
<Rect left="390" top="1534" right="490" bottom="1566"/>
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
<Rect left="390" top="594" right="490" bottom="626"/>
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
<Rect left="390" top="904" right="490" bottom="936"/>
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
<Rect left="390" top="1084" right="490" bottom="1116"/>
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
<Rect left="390" top="844" right="490" bottom="876"/>
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
<Rect left="390" top="1024" right="490" bottom="1056"/>
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
<Rect left="390" top="1144" right="490" bottom="1176"/>
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
<Rect left="390" top="94" right="490" bottom="126"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="59" ActivityType="13" flags="0" name="扩展会话">
<Rect left="390" top="154" right="490" bottom="186"/>
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
<Rect left="390" top="214" right="490" bottom="246"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
<assessment no="101" name="DEP2240" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="13" flags="0" name="打开左近光灯">
<Rect left="390" top="264" right="490" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x99\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="102" name="DEP2241" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="13" flags="0" name="打开右近光灯">
<Rect left="390" top="324" right="490" bottom="356"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x89\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="103" name="DEP2242" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="5" flags="0" name="左近光灯调整">
<Rect left="390" top="394" right="490" bottom="426"/>
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
<Rect left="390" top="464" right="490" bottom="496"/>
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
<Rect left="390" top="524" right="490" bottom="556"/>
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
<Rect left="390" top="724" right="490" bottom="756"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x89\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="105" name="DEP2243" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="13" flags="0" name="打开右远光灯">
<Rect left="390" top="654" right="490" bottom="686"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x8A\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="104" name="DEP2244" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="13" flags="0" name="关闭左近光灯">
<Rect left="390" top="1334" right="490" bottom="1366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x99\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="108" name="DEP2245" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="13" flags="0" name="关闭右近光灯">
<Rect left="390" top="1404" right="490" bottom="1436"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x89\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="109" name="DEP2246" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="13" flags="0" name="关闭左远光灯">
<Rect left="390" top="1264" right="490" bottom="1296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x9A\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="107" name="DEP2247" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="13" flags="0" name="关闭右远光灯">
<Rect left="390" top="1204" right="490" bottom="1236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xD0\x8A\x03\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="106" name="DEP2248" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="3" flags="1" name="延时500ms">
<Rect left="390" top="784" right="490" bottom="816"/>
<Script>engine.Delay(500)</Script></Activity>
<Activity id="153" ActivityType="5" flags="0" name="右远光灯光强结果">
<Rect left="390" top="954" right="490" bottom="986"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Intensityright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="394" right="686" bottom="426"/>
</Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="844" right="686" bottom="876"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="1204" right="686" bottom="1236"/>
</Activity>
<Activity id="157" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="390" top="1464" right="490" bottom="1496"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="94" right="226" bottom="126"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="784" right="226" bottom="816"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="关闭所有灯光">
<Rect left="180" top="1144" right="280" bottom="1176"/>
<Line1Text Enable="1" Text="请关闭所有灯光"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="214" top="1534" right="246" bottom="1566"/>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="594" right="226" bottom="626"/>
</Activity>
<Activity id="167" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="394" right="226" bottom="426"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="58" type="0">
</Transition>
<Transition StartId="11" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="146" type="1">
<Expression>isOK == true and BCM_DontOpen == true</Expression></Transition>
<Transition StartId="34" EndId="154" type="0">
</Transition>
<Transition StartId="34" EndId="166" type="0">
</Transition>
<Transition StartId="35" EndId="153" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="35" EndId="155" type="0">
</Transition>
<Transition StartId="36" EndId="49" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="36" EndId="155" type="0">
</Transition>
<Transition StartId="43" EndId="35" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="43" EndId="155" type="0">
</Transition>
<Transition StartId="44" EndId="36" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="44" EndId="155" type="0">
</Transition>
<Transition StartId="49" EndId="150" type="1">
<Expression>isOK == true and BCM_DontOpen == true</Expression></Transition>
<Transition StartId="49" EndId="155" type="0">
</Transition>
<Transition StartId="49" EndId="164" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="3">
</Transition>
<Transition StartId="58" EndId="158" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="3">
</Transition>
<Transition StartId="59" EndId="158" type="0">
</Transition>
<Transition StartId="60" EndId="125" type="3">
</Transition>
<Transition StartId="60" EndId="158" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="141" EndId="154" type="0">
</Transition>
<Transition StartId="142" EndId="144" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="142" EndId="154" type="0">
</Transition>
<Transition StartId="144" EndId="34" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="144" EndId="154" type="0">
</Transition>
<Transition StartId="145" EndId="152" type="0">
</Transition>
<Transition StartId="146" EndId="145" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="157" type="0">
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
<Transition StartId="153" EndId="155" type="0">
</Transition>
<Transition StartId="154" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="150" type="0">
</Transition>
<Transition StartId="157" EndId="11" type="0">
</Transition>
<Transition StartId="158" EndId="167" type="0">
</Transition>
<Transition StartId="163" EndId="152" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="11" type="0">
</Transition>
<Transition StartId="166" EndId="163" type="0">
</Transition>
<Transition StartId="167" EndId="141" type="0">
</Transition>
</Transitions>
</Process>

