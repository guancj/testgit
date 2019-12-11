<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="364" right="580" bottom="396"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="164" right="580" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00110100&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="1" name="FWE_52_TurnOverMeasure">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="多点测量"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="500"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="650" top="94" right="750" bottom="126"/>
<Script>ret = false
engine.println(" &lt;FAS_52_TestReadiness&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="结果测试">
<Rect left="480" top="294" right="580" bottom="326"/>
<Script>if (ret == true) then
	isOK = true;
	engine.LastError = 0
        engine.StatValue = "FWE TurnOverMeasure successful"
	engine.println(" &lt;FWE_52_TurnOverMeasure&gt; OK")
else
	isOK = false;
	engine.LastError = 1
        engine.StatValue = "FWE TurnOverMeasure failure"
	engine.SetLineText(1,"FWE SERVICE 52 ERROR")
	engine.DialogBackColor = "red";
	engine.Delay(2000)
	engine.DialogBackColor = -1;
	engine.println(" &lt;FWE_52_TurnOverMeasure_Err&gt; @Dpin ")
end</Script><assessment no="13" name="DEP1299" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="58" type="0">
</Transition>
<Transition StartId="4" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="63" type="0">
</Transition>
<Transition StartId="58" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

