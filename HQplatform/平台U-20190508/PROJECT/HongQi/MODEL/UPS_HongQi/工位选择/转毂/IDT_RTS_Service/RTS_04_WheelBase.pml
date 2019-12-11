<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="WheelBase" type="3" dir="0" data="0"/>
<Variable id="Width" type="3" dir="0" data="0"/>
<Variable id="Hndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="320" top="54" right="420" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="424" right="420" bottom="456"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="320" top="174" right="420" bottom="206"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000100@20==0b00000000&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_04_WheelBase">
<Rect left="320" top="294" right="420" bottom="326"/>
<Line2Text Enable="1" Text="轴距调整"/>
<Line4Text Enable="1" Text="请等待..."/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="300"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="OK">
<Rect left="320" top="354" right="420" bottom="386"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "04 service WheelBase successful"
engine.println(" &lt;RTS_04_WheelBase&gt; ")</Script><assessment no="7" name="DEP1456" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="570" top="294" right="670" bottom="326"/>
<Line2Text Enable="1" Text="RTS SERVICE 04 ERROR"/>
<Script>isOK = false
engine.LastError = 0
engine.StatValue = "04 service WheelBase failure"
engine.DialogBackColor = "red";</Script><assessment no="7" name="DEP1456" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="320" top="114" right="420" bottom="146"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="570" top="114" right="670" bottom="146"/>
<Script>engine.println(" &lt;RTS_04_WheelBase&gt; : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="424" right="636" bottom="456"/>
</Activity>
<Activity id="52" ActivityType="3" flags="1" name="设置轴距宽度">
<Rect left="320" top="234" right="420" bottom="266"/>
<Script>engine.LastError = 0
engine.StatValue = WheelBase..","..Width

TempByte23 = math.floor(WheelBase / 0x100)
TempByte24 = WheelBase % 0x100
idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(TempByte23))
idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(TempByte24))

TempByte25 = math.floor(Width / 0x100)
TempByte26 = Width % 0x100
idt_tel = LibIDT.idtSetBytes(idt_tel,25,1,string.char(TempByte25))
idt_tel = LibIDT.idtSetBytes(idt_tel,26,1,string.char(TempByte26))</Script><assessment no="6" name="DEP1455" type="8" flags="97"/>
</Activity>
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

