<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="350" top="44" right="450" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="350" top="364" right="450" bottom="396"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" name="判断通讯句柄">
<Rect left="350" top="94" right="450" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" name="idtCommonSend">
<Rect left="350" top="154" right="450" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b01001110&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" name="FWE_78_ResultTotal">
<Rect left="350" top="214" right="450" bottom="246"/>
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
<Activity id="57" ActivityType="3" name="OK">
<Rect left="350" top="284" right="450" bottom="316"/>
<Script>isOK = true;

engine.println(" &lt;FWE_78_ResultTotal&gt; ")</Script></Activity>
<Activity id="64" ActivityType="3" name="Handle invalid">
<Rect left="580" top="94" right="680" bottom="126"/>
<Script>engine.println(" &lt;FWE_10_RequestResultSpur&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="65" ActivityType="3" name="Handle invalid">
<Rect left="580" top="214" right="680" bottom="246"/>
<Script>engine.println(" &lt;FWE_78_ResultTotal&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="66" ActivityType="4" name="路由节点">
<Rect left="614" top="364" right="646" bottom="396"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="64" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="57" type="0">
</Transition>
<Transition StartId="5" EndId="65" type="1">
<Expression>ret == false</Expression></Transition>
<Transition StartId="57" EndId="2" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

