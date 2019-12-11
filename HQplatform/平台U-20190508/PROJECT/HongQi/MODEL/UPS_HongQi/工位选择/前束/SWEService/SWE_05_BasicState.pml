<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="206" top="32" right="306" bottom="64"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="206" top="320" right="306" bottom="352"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="206" top="144" right="306" bottom="176"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000101&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="SWE_05_BasicState">
<Rect left="206" top="208" right="306" bottom="240"/>
<Line4Text Enable="1" Text="大灯回基准位"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="300"/>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="46" ActivityType="3" flags="1" name="OK">
<Rect left="206" top="264" right="306" bottom="296"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "SWE Service 05 BasicState"


engine.println(" &lt;SWE_05_BasicState&gt; ")</Script><assessment no="121" name="DEP1407" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="454" top="208" right="554" bottom="240"/>
<Script>engine.LastError = 1
engine.StatValue = "SWE 回基准位"
engine.SetLineText(1,"SWE SERVICE 05 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;</Script><assessment no="121" name="DEP1407" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="206" top="88" right="306" bottom="120"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="454" top="88" right="554" bottom="120"/>
<Script>engine.println(" &lt;SWE_05_BasicState&gt; : handle invalid --&gt;"..tostring(SWEHndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="488" top="320" right="520" bottom="352"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="46" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="47" type="0">
</Transition>
<Transition StartId="46" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="51" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>SWEHndl~=nil and SWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="0">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

