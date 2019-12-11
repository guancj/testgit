<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C3" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="310" top="54" right="410" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="1" name="结束节点">
<Rect left="310" top="1044" right="410" bottom="1076"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="310" top="114" right="410" bottom="146"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP86" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="切换诊断模式">
<Rect left="310" top="174" right="410" bottom="206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP1083" type="8" flags="97"/>
</Activity>
<Activity id="307" ActivityType="13" flags="0" name="安装测试">
<Rect left="310" top="924" right="410" bottom="956"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安装测试"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\x02\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="12" name="DEP1461" type="8" flags="97"/>
</Activity>
<Activity id="315" ActivityType="13" flags="0" name="清除DTC">
<Rect left="310" top="234" right="410" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP87" type="8" flags="97"/>
</Activity>
<Activity id="316" ActivityType="3" flags="0" name="检测系统状态评估">
<Rect left="310" top="424" right="410" bottom="456"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 010C ##"..DVciResult);</Script></Activity>
<Activity id="709" ActivityType="13" flags="0" name="左制动力状态检查">
<Rect left="310" top="484" right="410" bottom="516"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;55&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;Brake Left状态评估&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="10" name="DEP1459" type="8" flags="97"/>
</Activity>
<Activity id="1222" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="310" top="544" right="410" bottom="576"/>
<Script></Script></Activity>
<Activity id="1223" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="454" right="206" bottom="486"/>
</Activity>
<Activity id="1224" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="310" top="354" right="410" bottom="386"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x0C&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1225" ActivityType="3" flags="0" name="InitTest">
<Rect left="310" top="294" right="410" bottom="326"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1226" ActivityType="3" flags="0" name="检测系统状态评估">
<Rect left="310" top="744" right="410" bottom="776"/>
<Script>DVciResult = string.sub(DVciResult1,4,4);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 检测系统状态评估 010D ##"..DVciResult);</Script></Activity>
<Activity id="1227" ActivityType="13" flags="0" name="右制动力状态检查">
<Rect left="310" top="804" right="410" bottom="836"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;55&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;Brake Right状态评估&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP1460" type="8" flags="97"/>
</Activity>
<Activity id="1228" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="310" top="864" right="410" bottom="896"/>
<Script></Script></Activity>
<Activity id="1229" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="804" right="596" bottom="836"/>
</Activity>
<Activity id="1230" ActivityType="13" flags="0" name="检测系统状态">
<Rect left="310" top="684" right="410" bottom="716"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x0D&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="InitTest">
<Rect left="310" top="614" right="410" bottom="646"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1235" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="310" top="984" right="410" bottom="1016"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="315" type="0">
</Transition>
<Transition StartId="307" EndId="1235" type="0">
</Transition>
<Transition StartId="315" EndId="1225" type="0">
</Transition>
<Transition StartId="316" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="1222" type="0">
</Transition>
<Transition StartId="1222" EndId="1223" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1222" EndId="1231" type="0">
</Transition>
<Transition StartId="1223" EndId="1224" type="0">
</Transition>
<Transition StartId="1224" EndId="316" type="0">
</Transition>
<Transition StartId="1225" EndId="1224" type="0">
</Transition>
<Transition StartId="1226" EndId="1227" type="0">
</Transition>
<Transition StartId="1227" EndId="1228" type="0">
</Transition>
<Transition StartId="1228" EndId="1229" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1228" EndId="307" type="0">
</Transition>
<Transition StartId="1229" EndId="1230" type="0">
</Transition>
<Transition StartId="1230" EndId="1226" type="0">
</Transition>
<Transition StartId="1231" EndId="1230" type="0">
</Transition>
<Transition StartId="1235" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

