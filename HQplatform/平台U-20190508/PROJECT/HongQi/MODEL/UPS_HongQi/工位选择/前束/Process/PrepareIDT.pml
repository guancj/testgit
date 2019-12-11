<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="IDTHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="320" top="24" right="420" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="324" right="420" bottom="356"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="320" top="134" right="420" bottom="166"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="IDTHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000001@20==0b01000110&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String" value="&quot;MFT3C2-070     &quot;"/>
<Parameter id="StringStartPos" value="22"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="45" ActivityType="13" flags="0" name="IDT_01_StartCheck_Name">
<Rect left="320" top="194" right="420" bottom="226"/>
<Line2Text Enable="1" Text="01开始服务"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="1"/>
<Parameter id="pHndl" value="IDTHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="OK">
<Rect left="320" top="254" right="420" bottom="286"/>
<Script>isOK = true;

engine.println(" &lt;FWE_01_Start_Check_Name&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="570" top="194" right="670" bottom="226"/>
<Line2Text Enable="1" Text="IDT SERVICE 01 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script></Activity>
<Activity id="49" ActivityType="3" flags="1" name="判断通讯句柄">
<Rect left="320" top="74" right="420" bottom="106"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="570" top="74" right="670" bottom="106"/>
<Script>engine.println(" &lt;FAS_01_Start_Check_Name&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="52" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="324" right="636" bottom="356"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="49" type="0">
</Transition>
<Transition StartId="3" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="45" EndId="47" type="0">
</Transition>
<Transition StartId="46" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="52" type="0">
</Transition>
<Transition StartId="49" EndId="3" type="1">
<Expression>IDTHndl~=nil and IDTHndl&gt;= 0</Expression></Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="0">
</Transition>
<Transition StartId="52" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

