<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="400" top="54" right="500" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="400" top="404" right="500" bottom="436"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="400" top="194" right="500" bottom="226"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000001@20==0b00000001&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String" value="&quot;VMT           &quot;"/>
<Parameter id="StringStartPos" value="22"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_01_StartCheck_Name">
<Rect left="400" top="254" right="500" bottom="286"/>
<Line2Text Enable="1" Text="01开始服务"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="3"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="46" ActivityType="3" flags="1" name="OK">
<Rect left="400" top="314" right="500" bottom="346"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "01 Service is successful"
engine.println(" &lt;RTS_01_Start&gt; ")</Script><assessment no="1" name="DEP1450" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="650" top="254" right="750" bottom="286"/>
<Line2Text Enable="1" Text="IDT SERVICE 01 ERROR"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "01 Service is failuer"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script><assessment no="1" name="DEP1450" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="400" top="134" right="500" bottom="166"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="650" top="134" right="750" bottom="166"/>
<Script>engine.println(" &lt;RTS 01 Service Start : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="404" right="716" bottom="436"/>
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
<Expression>Hndl~=nil and Hndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="0">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

