<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3040" pbltext="DEP2333">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="34" right="400" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="504" right="400" bottom="536"/>
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
<Parameter id="BitOrByte" value="&quot;@2==0b00010000&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_16_Home_Pos">
<Rect left="300" top="214" right="400" bottom="246"/>
<Line2Text Enable="1" Text="获取设备归位结果"/>
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
<Rect left="300" top="284" right="400" bottom="316"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "16 Service is successful"
engine.println(" &lt;BAS_16_Start&gt; ")</Script><assessment no="9" name="DEP2328" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="214" right="650" bottom="246"/>
<Line2Text Enable="1" Text="IDT SERVICE 16 ERROR"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "16 Service is failuer"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script><assessment no="9" name="DEP2328" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="300" top="94" right="400" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="550" top="94" right="650" bottom="126"/>
<Script>engine.println(" &lt;BSD 01 Service Start : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="504" right="616" bottom="536"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="结果获取">
<Rect left="300" top="424" right="400" bottom="456"/>
<Script>Home_Pos_Result = string.sub(recvDataHexStr,5,6)
print("BEP Home_Pos_Result ###"..tostring(Home_Pos_Result))</Script></Activity>
<Activity id="53" ActivityType="13" flags="0" name="hex2str">
<Rect left="300" top="354" right="400" bottom="386"/>
<FunctionRef id="hex2str" model="LibGeneral">
<Parameters>
<Parameter id="hex" value="recvData"/>
<Parameter id="ret" ret="recvDataHexStr"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="54" ActivityType="3" flags="1" name="In Home Pos NOK">
<Rect left="130" top="424" right="230" bottom="456"/>
<Line2Text Enable="1" Text="In Home Pos NOK"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "BEP In Home Pos Status NOK"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script><assessment no="10" name="DEP2328" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="普通节点">
<Rect left="130" top="504" right="230" bottom="536"/>
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
<Transition StartId="52" EndId="54" type="0">
</Transition>
<Transition StartId="52" EndId="2" type="1">
<Expression>Home_Pos_Result =="01"</Expression></Transition>
<Transition StartId="53" EndId="52" type="0">
</Transition>
<Transition StartId="54" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

