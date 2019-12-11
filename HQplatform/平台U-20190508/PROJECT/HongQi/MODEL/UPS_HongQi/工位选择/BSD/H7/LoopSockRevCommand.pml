<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="tcphandle" type="3" dir="0" data="0"/>
<Variable id="vciHandle" type="3" dir="0" data="0"/>
<Variable id="returnResult" type="11" dir="1" data=""/>
<Variable id="CarType" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="390" top="124" right="490" bottom="156"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="390" top="336" right="490" bottom="368"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="1" name="SockClear">
<Rect left="390" top="194" right="490" bottom="226"/>
<Script>engine.SockClear(tcphandle)
</Script></Activity>
<Activity id="6" ActivityType="13" flags="0" name="GetCommand10">
<Rect left="390" top="264" right="490" bottom="296"/>
<FunctionRef id="GetCommand2canNew" model="LibGeneral">
<Parameters>
<Parameter id="tcphandle" value="tcphandle"/>
<Parameter id="vciHandle" value="vciHandle"/>
<Parameter id="fCommand" value="&quot;08000003F20000043602000000&quot;"/>
<Parameter id="sCommand" value="&quot;08000003F20100043602000000&quot;"/>
<Parameter id="returnResult" ret="returnResult"/>
<Parameter id="recvTime" value="120000"/>
<Parameter id="vflag" value="CarType"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="1">
<Expression>returnResult == true</Expression></Transition>
</Transitions>
</Process>

