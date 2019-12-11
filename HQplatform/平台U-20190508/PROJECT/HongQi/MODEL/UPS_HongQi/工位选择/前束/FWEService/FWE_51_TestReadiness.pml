<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="64" right="530" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="364" right="530" bottom="396"/>
<Script>engine.Delay(100)</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="430" top="124" right="530" bottom="156"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="55" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="430" top="174" right="530" bottom="206"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00110011&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_51_TestReadiness">
<Rect left="430" top="224" right="530" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="测试准备"/>
<Line3Text Enable="1" Text="请放置方向盘水平仪....."/>
<Line4Text Enable="1"/>
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
<Activity id="57" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="580" top="124" right="680" bottom="156"/>
<Script>ret = false
engine.println(" &lt;FAS_51_TestReadiness&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="61" ActivityType="3" flags="1" name="结果判断">
<Rect left="430" top="284" right="530" bottom="316"/>
<Script>if (ret == true) then
	isOK = true;
	engine.LastError = 0
        engine.StatValue = "FWE 51 TestReadiness Service"
	engine.println(" &lt;FWE_51_TestReadiness&gt; OK")
else
	isOK = false;
	engine.LastError = 1
        engine.StatValue = "FWE 51 TestReadiness Service"
	engine.SetLineText(1,"FWE SERVICE 51 ERROR")
	engine.DialogBackColor = "red";
	engine.Delay(2000)
	engine.DialogBackColor = -1;
	engine.println(" &lt;FWE_51_TestReadiness_Err&gt; @Dpin ")
end</Script><assessment no="12" name="DEP1298" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="55" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="57" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="61" type="0">
</Transition>
<Transition StartId="57" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

