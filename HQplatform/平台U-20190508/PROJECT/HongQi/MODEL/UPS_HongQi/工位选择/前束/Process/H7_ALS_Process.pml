<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="FASHndl" type="3" dir="0" data="0"/>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="ACCLDWflag" type="11" dir="0" data=""/>
<Variable id="AFSPartnumber" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="60" top="84" right="160" bottom="116"/>
<Script>engine.Delay(200)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1240" top="274" right="1340" bottom="306"/>
<Script></Script></End>
<Activities>
<Activity id="29" ActivityType="5" flags="0" name="SWE_22_VehicleID">
<Rect left="190" top="164" right="290" bottom="196"/>
<SubProcesses>
<SubProcess id="SWE_22_VehicleID">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="退出">
<Rect left="60" top="224" right="160" bottom="256"/>
<Script>engine.println(" &lt;FWE_22&gt; : Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="退出">
<Rect left="190" top="224" right="290" bottom="256"/>
<Script>engine.println(" &lt;SWE_22&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="32" ActivityType="5" flags="0" name="TestProcess">
<Rect left="320" top="164" right="420" bottom="196"/>
<SubProcesses>
<SubProcess id="TestProcess">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="FWEisOK"/>
</Parameters>
</SubProcess>
<SubProcess id="SWE_Process">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="SWEisOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="完成">
<Rect left="1240" top="164" right="1340" bottom="196"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.SharedVarSet("_ProcessOK",1)
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true) 
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true) 
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true) </Script></Activity>
<Activity id="34" ActivityType="5" flags="0" name="FAS_61_LDWSetting">
<Rect left="450" top="164" right="550" bottom="196"/>
<SubProcesses>
<SubProcess id="FAS_61_LDWSetting">
<Parameters>
<Parameter id="FASHndl" value="FASHndl"/>
<Parameter id="Type" value="&quot;Start&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="35" ActivityType="5" flags="0" name="FWE_05_BasicState">
<Rect left="1100" top="164" right="1200" bottom="196"/>
<SubProcesses>
<SubProcess id="FWE_05_BasicState">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="36" ActivityType="5" flags="0" name="FAS_61_LDW回基准位">
<Rect left="960" top="164" right="1060" bottom="196"/>
<SubProcesses>
<SubProcess id="FAS_61_LDWSetting">
<Parameters>
<Parameter id="FASHndl" value="FASHndl"/>
<Parameter id="Type" value="&quot;Stop&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="39" ActivityType="5" flags="0" name="FWE_22_VehicleID">
<Rect left="60" top="164" right="160" bottom="196"/>
<SubProcesses>
<SubProcess id="FWE_22_VehicleID">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="40" ActivityType="5" flags="0" name="FAS_67_ACCSetting">
<Rect left="710" top="164" right="810" bottom="196"/>
<SubProcesses>
<SubProcess id="FAS_67_ACCSetting">
<Parameters>
<Parameter id="FASHndl" value="FASHndl"/>
<Parameter id="Type" value="&quot;Start&quot;"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="退出">
<Rect left="320" top="224" right="420" bottom="256"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="退出">
<Rect left="450" top="224" right="550" bottom="256"/>
<Script>engine.println(" &lt;FAS_61_LDWsetting&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="48" ActivityType="5" flags="0" name="Calibration_Process">
<Rect left="580" top="164" right="680" bottom="196"/>
<SubProcesses>
<SubProcess id="Calibration_Process">
<Parameters>
<Parameter id="ACCLDWflag" value="ACCLDWflag"/>
<Parameter id="AFSPartnumber" value="AFSPartnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="退出">
<Rect left="710" top="224" right="810" bottom="256"/>
<Script>engine.println(" &lt;FAS_67_ACCsetting&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="退出">
<Rect left="960" top="224" right="1060" bottom="256"/>
<Script>engine.println(" &lt;FAS_61_LDWstop&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="退出">
<Rect left="1100" top="224" right="1200" bottom="256"/>
<Script>engine.println(" &lt;FAS_61_LDWstop&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="52" ActivityType="5" flags="0" name="ACCCalibration">
<Rect left="840" top="164" right="940" bottom="196"/>
<SubProcesses>
<SubProcess id="ACCCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="84" right="516" bottom="116"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="84" right="986" bottom="116"/>
</Activity>
<Activity id="55" ActivityType="5" flags="0" name="FWE_26_主销外倾">
<Rect left="910" top="434" right="1010" bottom="466"/>
<SubProcesses>
<SubProcess id="FWE_26_Castor">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="56" ActivityType="5" flags="0" name="FWE_27_转向角">
<Rect left="910" top="514" right="1010" bottom="546"/>
<SubProcesses>
<SubProcess id="FWE_27_WheelTurn">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="57" ActivityType="5" flags="0" name="ACC板子移动判断">
<Rect left="340" top="404" right="440" bottom="436"/>
<SubProcesses>
<SubProcess id="ACC板子移动判断勿用">
<Parameters>
<Parameter id="isOK" ret="isOK == true "/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="39" type="0">
</Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="29" EndId="32" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="32" EndId="34" type="1">
<Expression>FWEisOK == true and SWEisOK == true and ACCLDWflag == true</Expression></Transition>
<Transition StartId="32" EndId="42" type="0">
</Transition>
<Transition StartId="32" EndId="53" type="1">
<Expression>FWEisOK == true and SWEisOK == true and ACCLDWflag == false</Expression></Transition>
<Transition StartId="33" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="48" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="34" EndId="43" type="0">
</Transition>
<Transition StartId="35" EndId="33" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="35" EndId="51" type="0">
</Transition>
<Transition StartId="36" EndId="35" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="36" EndId="50" type="0">
</Transition>
<Transition StartId="39" EndId="29" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="39" EndId="30" type="0">
</Transition>
<Transition StartId="40" EndId="49" type="0">
</Transition>
<Transition StartId="40" EndId="52" type="1">
<Expression>isOK == true  and ACCLDWflag == true</Expression></Transition>
<Transition StartId="48" EndId="54" type="1">
<Expression>ACCLDWflag == false</Expression></Transition>
<Transition StartId="48" EndId="40" type="1">
<Expression>ACCLDWflag == true</Expression></Transition>
<Transition StartId="52" EndId="36" type="0">
</Transition>
<Transition StartId="53" EndId="48" type="0">
</Transition>
<Transition StartId="54" EndId="35" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
</Transitions>
</Process>

