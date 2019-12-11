<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="FAScalibration" type="3" dir="0" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="44" right="530" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="864" right="530" bottom="896"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="FAS_IFC标定流程">
<Rect left="570" top="294" right="670" bottom="326"/>
<SubProcesses>
<SubProcess id="FAS_IFC标定流程">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFC_Select" value="IFC_Select"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="FAS_后视标定流程">
<Rect left="570" top="434" right="670" bottom="466"/>
<SubProcesses>
<SubProcess id="FAS_后视标定流程">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="RV_Select" value="RV_Select"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="5" ActivityType="5" flags="1" name="FAS_BSD标定流程">
<Rect left="570" top="574" right="670" bottom="606"/>
<SubProcesses>
<SubProcess id="FAS_BSD标定流程">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="BSD_Select" value="BSD_Select"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="IDT_Service_05">
<Rect left="430" top="594" right="530" bottom="626"/>
<SubProcesses>
<SubProcess id="IDT_Service_05">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="StopFlag" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="退出">
<Rect left="730" top="294" right="830" bottom="326"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="退出">
<Rect left="730" top="434" right="830" bottom="466"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="退出">
<Rect left="730" top="574" right="830" bottom="606"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="130" ActivityType="5" flags="0" name="IDT_Service_05">
<Rect left="570" top="374" right="670" bottom="406"/>
<SubProcesses>
<SubProcess id="IDT_Service_05">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="StopFlag" value="1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="退出">
<Rect left="730" top="374" right="830" bottom="406"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="132" ActivityType="5" flags="0" name="IDT_Service_05">
<Rect left="570" top="514" right="670" bottom="546"/>
<SubProcesses>
<SubProcess id="IDT_Service_05">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="StopFlag" value="1"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="退出">
<Rect left="730" top="514" right="830" bottom="546"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="IFC检测确认">
<Rect left="430" top="234" right="530" bottom="266"/>
<Script>print("IFC_Select = "..tostring(IFC_Select));</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="RV检测确认">
<Rect left="430" top="354" right="530" bottom="386"/>
<Script>print("RV_Select = "..tostring(RV_Select));</Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="BSD检测确认">
<Rect left="430" top="474" right="530" bottom="506"/>
<Script>print("BSD_Select = "..tostring(RV_Select));</Script></Activity>
<Activity id="137" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="430" top="664" right="530" bottom="696"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="退出">
<Rect left="570" top="664" right="670" bottom="696"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="139" ActivityType="5" flags="0" name="IDT_Service_02">
<Rect left="430" top="734" right="530" bottom="766"/>
<SubProcesses>
<SubProcess id="IDT_Service_02">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="完成">
<Rect left="430" top="794" right="530" bottom="826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.SharedVarSet("_ProcessOK",1)
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="退出">
<Rect left="570" top="734" right="670" bottom="766"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="变量初始化">
<Rect left="430" top="114" right="530" bottom="146"/>
<Script>IFC_Select =0;
RV_Select =0;
BSD_Select =0;
engine.SharedVarSet("S0Az",0)
engine.SharedVarSet("S0EL",0)
engine.SharedVarSet("S1Az",0)
engine.SharedVarSet("S1EL",0)
engine.SharedVarSet("LED",0)</Script></Activity>
<Activity id="143" ActivityType="3" flags="1" name="ECU标定项确认">
<Rect left="430" top="174" right="530" bottom="206"/>
<Script>if (LibGeneral.CarTNC_HS7(engine.CarType)) then
	if (LibGeneral.HS7_BackShow(engine.CarType))then
		RV_Select =1;
        end
	if (LibGeneral.HS7_IFC(engine.CarType))then
		IFC_Select = 1;
                RV_Select =1;
        end		
	if (LibGeneral.HS7_IFCandBSD(engine.CarType))then
		IFC_Select = 1;
                BSD_Select = 1; 
        end  
      
        engine.SharedVarSet("vehicleID","HS7") 
else
	if (LibGeneral.H7_BSD(engine.CarType)) then
		RV_Select = 1;
                BSD_Select = 1; 
        else
		RV_Select = 1;
        end
	
	engine.SharedVarSet("vehicleID","H7") 
end


print("IFC_Select = "..tostring(IFC_Select));
print("RV_Select = "..tostring(RV_Select));
print("BSD_Select = "..tostring(BSD_Select));

</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="142" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="3" EndId="135" type="0">
</Transition>
<Transition StartId="4" EndId="128" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="4" EndId="136" type="0">
</Transition>
<Transition StartId="5" EndId="129" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="5" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="137" type="0">
</Transition>
<Transition StartId="130" EndId="131" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="130" EndId="4" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="132" EndId="5" type="0">
</Transition>
<Transition StartId="134" EndId="3" type="1">
<Expression>IFC_Select ==1</Expression></Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="130" type="1">
<Expression>RV_Select ==1</Expression></Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="132" type="1">
<Expression>BSD_Select ==1</Expression></Transition>
<Transition StartId="136" EndId="9" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="137" EndId="139" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="139" EndId="141" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="140" EndId="2" type="0">
</Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="143" EndId="134" type="0">
</Transition>
</Transitions>
</Process>

