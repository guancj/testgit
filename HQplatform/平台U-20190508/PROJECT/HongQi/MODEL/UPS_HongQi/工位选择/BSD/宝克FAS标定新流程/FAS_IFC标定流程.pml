<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="IFC_Select" type="3" dir="0" data="" description="0:无,1:有"/>
</Parameters>
<Start id="1" ActivityType="1" flags="12" name="开始节点">
<Rect left="400" top="104" right="500" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="12" name="结束节点">
<Rect left="400" top="464" right="500" bottom="496"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="12" name="IDT_Service_19">
<Rect left="400" top="224" right="500" bottom="256"/>
<SubProcesses>
<SubProcess id="IDT_Service_19">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="109" ActivityType="3" flags="12" name="退出">
<Rect left="550" top="224" right="650" bottom="256"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="110" ActivityType="5" flags="12" name="IDT_Service_18">
<Rect left="400" top="404" right="500" bottom="436"/>
<SubProcesses>
<SubProcess id="IDT_Service_18">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFCresult" value="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="111" ActivityType="3" flags="12" name="退出">
<Rect left="550" top="404" right="650" bottom="436"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="112" ActivityType="5" flags="12" name="IFC_Calibration">
<Rect left="400" top="344" right="500" bottom="376"/>
<SubProcesses>
<SubProcess id="IFC_Calibration">
<Parameters>
<Parameter id="IFCresult" ret="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="113" ActivityType="5" flags="12" name="IDT_Service_15">
<Rect left="400" top="284" right="500" bottom="316"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="114" ActivityType="3" flags="12" name="退出">
<Rect left="550" top="284" right="650" bottom="316"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="126" ActivityType="5" flags="1" name="IDT_Service_04_发送标定项">
<Rect left="400" top="164" right="500" bottom="196"/>
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
<Activity id="127" ActivityType="3" flags="0" name="退出">
<Rect left="550" top="164" right="650" bottom="196"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="126" type="0">
</Transition>
<Transition StartId="3" EndId="109" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="3" EndId="113" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="110" EndId="2" type="0">
</Transition>
<Transition StartId="112" EndId="110" type="0">
</Transition>
<Transition StartId="113" EndId="112" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="126" EndId="3" type="0">
</Transition>
<Transition StartId="126" EndId="127" type="1">
<Expression>isOK == false</Expression></Transition>
</Transitions>
</Process>

