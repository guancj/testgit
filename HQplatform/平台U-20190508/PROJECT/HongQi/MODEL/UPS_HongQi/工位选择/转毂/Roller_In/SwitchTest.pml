<?xml version="1.0" encoding="utf-8" ?>
<Process description="ABS开关检测，踩制动踏板（释放）超时时间各60s。" flags="1" block="1" ptbtext="DEP164" group="1602" pbltext="DEP63">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0x03" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CANId"/>
<Variable id="LoopRunning" type="11" data="true"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="RecvTel" type="8" data=""/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - ESP开关检测&quot;"/>
<Variable id="CompareFlag" type="11" data=""/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="470" top="24" right="570" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="470" top="924" right="570" bottom="956"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script></End>
<Activities>
<Activity id="28" ActivityType="3" flags="1" name="释放制动踏板开关">
<Rect left="470" top="624" right="570" bottom="656"/>
<Script>DVciResult = string.sub(DVciResult1,5,5);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 制动开关 FD01 ##"..DVciResult);</Script></Activity>
<Activity id="1269" ActivityType="3" flags="0" name="InitTest">
<Rect left="470" top="504" right="570" bottom="536"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1270" ActivityType="13" flags="0" name="释放踏板状态比对">
<Rect left="470" top="684" right="570" bottom="716"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;00&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;释放刹车&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1506" type="8" flags="97"/>
</Activity>
<Activity id="1271" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="470" top="744" right="570" bottom="776"/>
<Script></Script></Activity>
<Activity id="1272" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="664" right="656" bottom="696"/>
</Activity>
<Activity id="1273" ActivityType="13" flags="0" name="制动开关">
<Rect left="470" top="564" right="570" bottom="596"/>
<TitleText Enable="1" Text="制动开关检测"/>
<Line1Text Enable="1" Text="释放制动踏板"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xFD\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1274" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="470" top="84" right="570" bottom="116"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="1275" ActivityType="13" flags="0" name="扩展会话">
<Rect left="470" top="144" right="570" bottom="176"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="1276" ActivityType="3" flags="0" name="踩制动踏板">
<Rect left="470" top="314" right="570" bottom="346"/>
<Script>DVciResult = string.sub(DVciResult1,5,5);
DVciResult = LibGeneral.hex2str(DVciResult)
engine.println("### 制动开关 FD01 ##"..DVciResult);</Script></Activity>
<Activity id="1277" ActivityType="3" flags="0" name="InitTest">
<Rect left="470" top="204" right="570" bottom="236"/>
<Script>Pram_1 = nil;</Script></Activity>
<Activity id="1278" ActivityType="13" flags="0" name="踩踏板状态比对">
<Rect left="470" top="374" right="570" bottom="406"/>
<FunctionRef id="Status_Check_view_String" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="TextCmp" value="&quot;01&quot;"/>
<Parameter id="MeasText" value="DVciResult"/>
<Parameter id="RightViewText" value="&quot;踩制动踏板&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1505" type="8" flags="97"/>
</Activity>
<Activity id="1279" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="470" top="444" right="570" bottom="476"/>
<Script></Script></Activity>
<Activity id="1280" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="354" right="656" bottom="386"/>
</Activity>
<Activity id="1281" ActivityType="13" flags="0" name="制动开关">
<Rect left="470" top="264" right="570" bottom="296"/>
<TitleText Enable="1" Text="制动开关检测"/>
<Line1Text Enable="1" Text="踩制动踏板"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xFD\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1282" ActivityType="3" flags="0" name="清除屏幕">
<Rect left="470" top="794" right="570" bottom="826"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="1284" ActivityType="13" flags="0" name="清故障码">
<Rect left="260" top="174" right="360" bottom="206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1274" type="0">
</Transition>
<Transition StartId="28" EndId="1270" type="0">
</Transition>
<Transition StartId="1269" EndId="1273" type="0">
</Transition>
<Transition StartId="1270" EndId="1271" type="0">
</Transition>
<Transition StartId="1271" EndId="1272" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1271" EndId="1282" type="0">
</Transition>
<Transition StartId="1272" EndId="1273" type="0">
</Transition>
<Transition StartId="1273" EndId="28" type="0">
</Transition>
<Transition StartId="1274" EndId="1275" type="0">
</Transition>
<Transition StartId="1275" EndId="1284" type="0">
</Transition>
<Transition StartId="1276" EndId="1278" type="0">
</Transition>
<Transition StartId="1277" EndId="1281" type="0">
</Transition>
<Transition StartId="1278" EndId="1279" type="0">
</Transition>
<Transition StartId="1279" EndId="1280" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1279" EndId="1269" type="0">
</Transition>
<Transition StartId="1280" EndId="1281" type="0">
</Transition>
<Transition StartId="1281" EndId="1276" type="0">
</Transition>
<Transition StartId="1282" EndId="2" type="0">
</Transition>
<Transition StartId="1284" EndId="1277" type="0">
</Transition>
</Transitions>
</Process>

