<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="382" top="80" right="482" bottom="112"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="424" right="480" bottom="456"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="5" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="382" top="200" right="482" bottom="232"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00011011&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="51" ActivityType="13" flags="0" name="FWE_27_WheelTurn">
<Rect left="380" top="274" right="480" bottom="306"/>
<Line2Text Enable="1" Text="转向角"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="50000"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="382" top="136" right="482" bottom="168"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="55" ActivityType="3" flags="1" name="OK">
<Rect left="380" top="334" right="480" bottom="366"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Send Vehicl ID successful"
engine.println(" &lt;FWE_27_VehicleID&gt; ")


</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="610" top="134" right="710" bottom="166"/>
<Script>ret = false
engine.println(" &lt;FWE_22_VehicleID&gt; : handle invalid --&gt;")</Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="NOK">
<Rect left="610" top="274" right="710" bottom="306"/>
<Script>	isOK = false;
	engine.LastError = 1
        engine.StatValue = "FWE WheelTurn"
	engine.SetLineText(1,"FWE SERVICE 27 ERROR")
	engine.DialogBackColor = "red";
	engine.Delay(2000)
	engine.DialogBackColor = -1;

	engine.println(" &lt;FWE_27_WheelTurn_Err&gt; @Dpin ")</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="54" type="0">
</Transition>
<Transition StartId="5" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="55" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="51" EndId="62" type="0">
</Transition>
<Transition StartId="54" EndId="5" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="54" EndId="60" type="0">
</Transition>
<Transition StartId="55" EndId="2" type="0">
</Transition>
<Transition StartId="60" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

