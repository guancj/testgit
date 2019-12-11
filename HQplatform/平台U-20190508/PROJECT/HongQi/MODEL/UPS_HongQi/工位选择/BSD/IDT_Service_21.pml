<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="24" right="400" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="354" right="400" bottom="386"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="300" top="154" right="400" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00010101&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_21_ IFC_Test_Done">
<Rect left="300" top="214" right="400" bottom="246"/>
<Line2Text Enable="1" Text="17检测完成服务"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="60"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="OK">
<Rect left="300" top="274" right="400" bottom="306"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "21 Service is successful"
engine.println(" &lt;IFC done&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="214" right="650" bottom="246"/>
<Line2Text Enable="1" Text="IDT SERVICE 17 ERROR"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "21 Service is failuer"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="300" top="94" right="400" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="550" top="94" right="650" bottom="126"/>
<Script>engine.println(" &lt;BSD 01 Service Start : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="354" right="616" bottom="386"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="BSD结果">
<Rect left="130" top="214" right="230" bottom="246"/>
<Script>S0Az = engine.SharedVarGet("S0Az")
S0EL = engine.SharedVarGet("S0EL")
S1Az = engine.SharedVarGet("S1Az")
S1EL = engine.SharedVarGet("S1EL")
LED = engine.SharedVarGet("LED")
fac = 100


value1 = S0Az * fac
idt_tel = LibIDT.BSDvalueSet(value1,idt_tel,23)

value1 = S0EL * fac
idt_tel = LibIDT.BSDvalueSet(value1,idt_tel,27)

value1 = S1Az * fac
idt_tel = LibIDT.BSDvalueSet(value1,idt_tel,31)

value1 = S1EL * fac
idt_tel = LibIDT.BSDvalueSet(value1,idt_tel,35)

value1 = LED * fac
idt_tel = LibIDT.BSDvalueSet(value1,idt_tel,39)
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="52" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="47" type="0">
</Transition>
<Transition StartId="5" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="51" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>Hndl~=nil and Hndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="47" type="0">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
<Transition StartId="52" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

