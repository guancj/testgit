<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="460" top="24" right="560" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="460" top="334" right="560" bottom="366"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" name="idtCommonSend">
<Rect left="460" top="154" right="560" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00010110@5==0b00000010&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String" value="engine.KNR"/>
<Parameter id="StringStartPos" value="21"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" name="RTS_22_VehicleID">
<Rect left="460" top="214" right="560" bottom="246"/>
<Line2Text Enable="1" Text="01开始服务"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="30"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" name="OK">
<Rect left="460" top="274" right="560" bottom="306"/>
<Script>isOK = true;

engine.println(" &lt;RTS_01_Start&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" name="NOK">
<Rect left="710" top="214" right="810" bottom="246"/>
<Line2Text Enable="1" Text="IDT SERVICE 01 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script></Activity>
<Activity id="48" ActivityType="3" name="判断通讯句柄">
<Rect left="460" top="94" right="560" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" name="Handle invalid">
<Rect left="710" top="94" right="810" bottom="126"/>
<Script>engine.println(" &lt;RTS 01 Service Start : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="52" ActivityType="4" name="路由节点">
<Rect left="744" top="334" right="776" bottom="366"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="47" type="0">
</Transition>
<Transition StartId="5" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="52" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>Hndl~=nil and Hndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="47" type="0">
</Transition>
<Transition StartId="52" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

