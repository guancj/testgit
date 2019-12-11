<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="BSD_Select" type="3" dir="0" data="" description="0:无,1:有"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="104" right="530" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="524" right="530" bottom="556"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="430" top="284" right="530" bottom="316"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="退出">
<Rect left="580" top="284" right="680" bottom="316"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="117" ActivityType="5" flags="0" name="IDT_Service_17">
<Rect left="430" top="404" right="530" bottom="436"/>
<SubProcesses>
<SubProcess id="IDT_Service_17">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="退出">
<Rect left="580" top="404" right="680" bottom="436"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 17 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="119" ActivityType="5" flags="0" name="IDT_Service_21">
<Rect left="430" top="464" right="530" bottom="496"/>
<SubProcesses>
<SubProcess id="IDT_Service_21">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="退出">
<Rect left="580" top="464" right="680" bottom="496"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="121" ActivityType="5" flags="0" name="BSDproMain">
<Rect left="430" top="344" right="530" bottom="376"/>
<SubProcesses>
<SubProcess id="BSDproMain">
<Parameters>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="退出">
<Rect left="580" top="224" right="680" bottom="256"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="129" ActivityType="5" flags="0" name="BSD_Wait">
<Rect left="430" top="164" right="530" bottom="196"/>
<SubProcesses>
<SubProcess id="BSD_Wait">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="130" ActivityType="5" flags="0" name="IDT_Service_04_发送标定项">
<Rect left="430" top="224" right="530" bottom="256"/>
<SubProcesses>
<SubProcess id="IDT_Service_04_发送标定项">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFC_Select" value="IFC_Select"/>
<Parameter id="RV_Select" value="RV_Select"/>
<Parameter id="BSD_Select" value="BSD_Select"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="129" type="0">
</Transition>
<Transition StartId="3" EndId="116" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="3" EndId="121" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="117" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="119" EndId="2" type="0">
</Transition>
<Transition StartId="121" EndId="117" type="0">
</Transition>
<Transition StartId="129" EndId="130" type="0">
</Transition>
<Transition StartId="130" EndId="3" type="0">
</Transition>
<Transition StartId="130" EndId="123" type="1">
<Expression>isOK == false</Expression></Transition>
</Transitions>
</Process>

