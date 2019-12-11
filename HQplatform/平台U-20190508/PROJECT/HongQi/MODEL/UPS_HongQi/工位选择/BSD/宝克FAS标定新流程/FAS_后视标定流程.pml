<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="RV_Select" type="3" dir="0" data="" description="0:无,1:有"/>
</Parameters>
<Start id="1" ActivityType="1" flags="12" name="开始节点">
<Rect left="380" top="104" right="480" bottom="136"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="12" name="结束节点">
<Rect left="380" top="404" right="480" bottom="436"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="12" name="IDT_Service_15">
<Rect left="380" top="224" right="480" bottom="256"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="95" ActivityType="3" flags="12" name="退出">
<Rect left="530" top="224" right="630" bottom="256"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; :15 service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="96" ActivityType="5" flags="12" name="IDT_Service_22">
<Rect left="380" top="344" right="480" bottom="376"/>
<SubProcesses>
<SubProcess id="IDT_Service_22">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="98" ActivityType="3" flags="12" name="退出">
<Rect left="530" top="344" right="630" bottom="376"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 22 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="99" ActivityType="3" flags="12" name="等待17s">
<Rect left="380" top="284" right="480" bottom="316"/>
<Script>local strTime = os.clock()
local endTime
while (true) do
	engine.Delay(1000)
        endTime = os.clock()
	engine.SetLineText(1,"请等待:".. (17 -math.floor(endTime - strTime)))
	if(math.floor(endTime - strTime) &gt; 17) then
		break
        end   
end</Script></Activity>
<Activity id="127" ActivityType="3" flags="12" name="退出">
<Rect left="530" top="164" right="630" bottom="196"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="128" ActivityType="5" flags="0" name="IDT_Service_04_发送标定项">
<Rect left="380" top="164" right="480" bottom="196"/>
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
<Transition StartId="1" EndId="128" type="0">
</Transition>
<Transition StartId="3" EndId="99" type="0">
</Transition>
<Transition StartId="3" EndId="95" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="96" EndId="98" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="96" EndId="2" type="0">
</Transition>
<Transition StartId="99" EndId="96" type="0">
</Transition>
<Transition StartId="128" EndId="3" type="0">
</Transition>
<Transition StartId="128" EndId="127" type="1">
<Expression>isOK == false</Expression></Transition>
</Transitions>
</Process>

