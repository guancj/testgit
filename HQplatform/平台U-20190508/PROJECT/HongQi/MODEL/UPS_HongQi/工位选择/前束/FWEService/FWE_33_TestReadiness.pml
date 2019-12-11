<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="430" top="64" right="530" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="430" top="364" right="530" bottom="396"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" name="判断通讯句柄">
<Rect left="430" top="124" right="530" bottom="156"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="55" ActivityType="13" name="idtCommonSend">
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
<Activity id="56" ActivityType="13" name="FWE_33_TestReadiness">
<Rect left="430" top="224" right="530" bottom="256"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="3"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="3" name="Handle invalid">
<Rect left="630" top="124" right="730" bottom="156"/>
<Script>engine.println(" &lt;FAS_33_TestReadiness&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="61" ActivityType="3" name="OK">
<Rect left="430" top="284" right="530" bottom="316"/>
<Script>isOK = true;

engine.println(" &lt;FWE_33_TestReadiness&gt; ")</Script></Activity>
<Activity id="62" ActivityType="3" name="NOK">
<Rect left="630" top="224" right="730" bottom="256"/>
<Line2Text Enable="1" Text="FWE SERVICE 33 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script></Activity>
<Activity id="63" ActivityType="4" name="路由节点">
<Rect left="664" top="364" right="696" bottom="396"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="55" type="0">
</Transition>
<Transition StartId="3" EndId="57" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="61" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="57" EndId="62" type="0">
</Transition>
<Transition StartId="61" EndId="2" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

