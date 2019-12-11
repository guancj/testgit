<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="FWE_CarID" type="8" dir="0" data=""/>
<Variable id="AFSPartnumber" type="8" dir="0" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="124" right="200" bottom="156"/>
<Script>engine.Delay(200)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="850" top="314" right="950" bottom="346"/>
<Script></Script></End>
<Activities>
<Activity id="29" ActivityType="5" flags="0" name="SWE_22_VehicleID">
<Rect left="230" top="204" right="330" bottom="236"/>
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
<Rect left="100" top="264" right="200" bottom="296"/>
<Script>engine.println(" &lt;FWE_22&gt; : Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="退出">
<Rect left="230" top="264" right="330" bottom="296"/>
<Script>engine.println(" &lt;SWE_22&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="完成">
<Rect left="850" top="204" right="950" bottom="236"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.SharedVarSet("_ProcessOK",1)
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true) 
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true) </Script></Activity>
<Activity id="35" ActivityType="5" flags="0" name="FWE_05_BasicState">
<Rect left="710" top="204" right="810" bottom="236"/>
<SubProcesses>
<SubProcess id="FWE_05_BasicState">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="39" ActivityType="5" flags="0" name="FWE_22_VehicleID">
<Rect left="100" top="204" right="200" bottom="236"/>
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
<Activity id="42" ActivityType="3" flags="0" name="退出">
<Rect left="370" top="264" right="470" bottom="296"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="退出">
<Rect left="710" top="264" right="810" bottom="296"/>
<Script>engine.println(" &lt;FAS_61_LDWstop&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="52" ActivityType="5" flags="0" name="HS7_TestProcess">
<Rect left="370" top="204" right="470" bottom="236"/>
<SubProcesses>
<SubProcess id="HS7_TestProcess">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="FWEisOK"/>
<Parameter id="AirSFlag" value="AirSFlag"/>
<Parameter id="AirS_Result" value="1" ret="AirS_Result"/>
</Parameters>
</SubProcess>
<SubProcess id="HS7_SWE_Process">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="SWEisOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="53" ActivityType="5" flags="0" name="SASCalibration">
<Rect left="520" top="204" right="620" bottom="236"/>
<SubProcesses>
<SubProcess id="SASCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="54" ActivityType="5" flags="1" name="HS7_ESPCalibration">
<Rect left="520" top="264" right="620" bottom="296"/>
<SubProcesses>
<SubProcess id="HS7_ESPCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="55" ActivityType="5" flags="0" name="HS7_ALSCalibration">
<Rect left="520" top="334" right="620" bottom="366"/>
<SubProcesses>
<SubProcess id="HS7_ALSCalibration">
<Parameters>
<Parameter id="DString_C079_Partnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="134" right="576" bottom="166"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="退出">
<Rect left="520" top="74" right="620" bottom="106"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="58" ActivityType="5" flags="0" name="空气悬架标定_基础设置">
<Rect left="370" top="124" right="470" bottom="156"/>
<SubProcesses>
<SubProcess id="空气悬架标定_基础设置">
<Parameters>
<Parameter id="vciHandle" ret="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="59" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="124" right="326" bottom="156"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="39" type="0">
</Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="29" EndId="52" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="33" EndId="2" type="0">
</Transition>
<Transition StartId="35" EndId="33" type="1">
<Expression>isOK== true</Expression></Transition>
<Transition StartId="35" EndId="51" type="0">
</Transition>
<Transition StartId="39" EndId="29" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="39" EndId="30" type="0">
</Transition>
<Transition StartId="52" EndId="42" type="0">
</Transition>
<Transition StartId="52" EndId="56" type="1">
<Expression>AirSFlag == true and AirS_Result ~=0</Expression></Transition>
<Transition StartId="52" EndId="53" type="1">
<Expression>FWEisOK == true and SWEisOK == true</Expression></Transition>
<Transition StartId="53" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="35" type="0">
</Transition>
<Transition StartId="56" EndId="35" type="0">
</Transition>
<Transition StartId="58" EndId="52" type="0">
</Transition>
<Transition StartId="59" EndId="58" type="1">
<Expression>AirSFlag == true and isOK== true</Expression></Transition>
</Transitions>
</Process>

