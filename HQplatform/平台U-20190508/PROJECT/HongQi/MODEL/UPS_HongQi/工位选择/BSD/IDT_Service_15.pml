<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="34" right="400" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="514" right="400" bottom="546"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="300" top="154" right="400" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00001111&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_15_In_Test_Pos">
<Rect left="300" top="214" right="400" bottom="246"/>
<Line2Text Enable="1" Text="15请求工作位置服务"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="500"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="OK">
<Rect left="300" top="284" right="400" bottom="316"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "15 Service is successful"
engine.println(" &lt;BSD_15_Start&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="214" right="650" bottom="246"/>
<Line2Text Enable="1" Text="IDT SERVICE 15 ERROR"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "15 Service is failuer"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="300" top="94" right="400" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="550" top="94" right="650" bottom="126"/>
<Script>engine.println(" &lt;BSD 01 Service Start : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="514" right="616" bottom="546"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="结果获取">
<Rect left="300" top="424" right="400" bottom="456"/>
<Script>Test_Pos_Result = string.sub(recvDataHexStr,5,6)
print("BEP Test_Pos_Result ###"..tostring(Test_Pos_Result))</Script></Activity>
<Activity id="53" ActivityType="13" flags="0" name="hex2str">
<Rect left="300" top="354" right="400" bottom="386"/>
<FunctionRef id="hex2str" model="LibGeneral">
<Parameters>
<Parameter id="hex" value="recvData"/>
<Parameter id="ret" ret="recvDataHexStr"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="In Test Pos NOK">
<Rect left="110" top="424" right="210" bottom="456"/>
<Line2Text Enable="1" Text="In Test Pos NOK"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "In Test Pos NOK"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="普通节点">
<Rect left="110" top="514" right="210" bottom="546"/>
<Script></Script></Activity>
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
<Transition StartId="5" EndId="53" type="0">
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
<Transition StartId="52" EndId="2" type="1">
<Expression>Test_Pos_Result =="01"</Expression></Transition>
<Transition StartId="52" EndId="57" type="0">
</Transition>
<Transition StartId="53" EndId="52" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

