<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="406" top="24" right="506" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="406" top="392" right="506" bottom="424"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" name="idtCommonSend">
<Rect left="406" top="200" right="506" bottom="232"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="serviceData"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" name="SWE_08_MoveAnd">
<Rect left="406" top="264" right="506" bottom="296"/>
<Line4Text Enable="1" Text="左矩阵大灯调整"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="50000"/>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="46" ActivityType="3" name="OK">
<Rect left="406" top="328" right="506" bottom="360"/>
<Script>isOK = true;

engine.println(" &lt;FWE_01_Start_Check_Name&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" name="NOK">
<Rect left="654" top="264" right="754" bottom="296"/>
<Line2Text Enable="1" Text="SWE 08 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script></Activity>
<Activity id="48" ActivityType="3" name="判断通讯句柄">
<Rect left="406" top="80" right="506" bottom="112"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="50" ActivityType="3" name="Handle invalid">
<Rect left="654" top="80" right="754" bottom="112"/>
<Script>engine.println(" &lt;SWEHndl_08&gt; : handle invalid --&gt;"..tostring(SWEHndl))</Script></Activity>
<Activity id="51" ActivityType="4" name="路由节点">
<Rect left="688" top="392" right="720" bottom="424"/>
</Activity>
<Activity id="52" ActivityType="3" name="服务数据">
<Rect left="406" top="136" right="506" bottom="168"/>
<Script>serviceData = "@2==0b00001000@24==0b00000000@25==0b00000101@26==0b00000000@27==0b00000000@30==0b00000000"   --左矩阵大灯调整
</Script></Activity>
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
<Transition StartId="48" EndId="52" type="1">
<Expression>SWEHndl~=nil and SWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="0">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
<Transition StartId="52" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

