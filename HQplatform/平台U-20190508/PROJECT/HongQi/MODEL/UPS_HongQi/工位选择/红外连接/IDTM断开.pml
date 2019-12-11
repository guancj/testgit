<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="74" right="530" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="334" right="530" bottom="366"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDTMdisconnect">
<Rect left="430" top="134" right="530" bottom="166"/>
<FunctionRef id="IDTMdisconnect" model="LibGeneral">
</FunctionRef>
</Activity>
<Activity id="520" ActivityType="3" flags="0" name="关闭红外">
<Rect left="430" top="264" right="530" bottom="296"/>
<Script>engine.IrdaSetState(false)
engine.Delay(500)</Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="等待1秒">
<Rect left="430" top="194" right="530" bottom="226"/>
<Script>engine.Delay(1000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="523" type="0">
</Transition>
<Transition StartId="520" EndId="2" type="0">
</Transition>
<Transition StartId="523" EndId="520" type="0">
</Transition>
</Transitions>
</Process>

