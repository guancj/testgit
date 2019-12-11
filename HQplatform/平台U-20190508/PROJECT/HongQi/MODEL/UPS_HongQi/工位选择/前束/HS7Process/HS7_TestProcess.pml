<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="AirSFlag" type="11" dir="0" data=""/>
<Variable id="AirS_Result" type="3" dir="1" data="1"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="170" top="154" right="270" bottom="186"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="900" top="244" right="1000" bottom="276"/>
<Script>print("AirS_Result = "..tostring(AirS_Result));</Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="FWE_51_TestReadiness">
<Rect left="170" top="324" right="270" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_51_TestReadiness">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="5" ActivityType="5" flags="0" name="FWE_52_TurnOverMeasure">
<Rect left="330" top="324" right="430" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_52_TurnOverMeasure">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="FWE_07_ChassisSetup_ALL">
<Rect left="630" top="324" right="730" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_07_ChassisSetup_ALL">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="5" flags="1" name="FWE_ChassisSetupBefore">
<Rect left="490" top="324" right="590" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_ChassisSetupBefore">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="AirSFlag" value="AirSFlag"/>
<Parameter id="vciHandle" ret="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="退出">
<Rect left="170" top="394" right="270" bottom="426"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="退出">
<Rect left="330" top="394" right="430" bottom="426"/>
<Script>engine.println(" &lt;FWE_51_TestReadiness&gt; : FWE Service 51 TestReadiness")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="退出">
<Rect left="490" top="394" right="590" bottom="426"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="19" ActivityType="5" flags="0" name="FWE_10_RequestResultSpur">
<Rect left="760" top="324" right="860" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_10_RequestResultSpur">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="true"/>
<Parameter id="EvalResult_RL" ret="aSpurResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSpurResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSpurResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="5" flags="0" name="FWE_11_RequestResultSturz">
<Rect left="900" top="324" right="1000" bottom="356"/>
<SubProcesses>
<SubProcess id="FWE_11_RequestResultSturz">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="CalcResult" value="true"/>
<Parameter id="EvalResult_RL" ret="aSturzResult_RL"/>
<Parameter id="EvalResult_RR" ret="aSturzResult_RR"/>
<Parameter id="EvalResult_RA" ret="aSturzResult_RA"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="退出">
<Rect left="630" top="394" right="730" bottom="426"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="退出">
<Rect left="760" top="394" right="860" bottom="426"/>
<Script>engine.println(" &lt;FWE_ChassisSetupBefore&gt; : FWE Service ChassisSetupBefore")
engine.UdpHandleVarSet(FWEHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(FASHndl, "_FINISHFLAG",true)
engine.UdpHandleVarSet(SWEHndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="23" ActivityType="5" flags="0" name="空气悬架标定">
<Rect left="490" top="164" right="590" bottom="196"/>
<SubProcesses>
<SubProcess id="空气悬架标定">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK"/>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="251" ActivityType="5" flags="0" name="空气悬架初检">
<Rect left="350" top="164" right="450" bottom="196"/>
<SubProcesses>
<SubProcess id="空气悬架初检">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="252" ActivityType="13" flags="0" name="PBL_Result">
<Rect left="630" top="164" right="730" bottom="196"/>
<FunctionRef id="PBL_Result" model="LibGeneral">
<Parameters>
<Parameter id="PTB_Nr" value="1"/>
<Parameter id="PBL_Nr" value="3011"/>
<Parameter id="PBL_Result" value="0" ret="AirS_Result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="空悬不合格,底盘不调整">
<Rect left="900" top="164" right="1000" bottom="196"/>
<Script>	engine.LastError = 1
        engine.StatValue = "空气悬架不合格,底盘未调整"
	engine.println(" 底盘未调整 ")
</Script><assessment block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284" no="79" name="DEP1349" type="8" flags="97"/>
</Activity>
<Activity id="255" ActivityType="5" flags="0" name="HS7_空气悬架调整后测量">
<Rect left="630" top="244" right="730" bottom="276"/>
<SubProcesses>
<SubProcess id="HS7_空气悬架调整后测量">
<Parameters>
<Parameter id="FWEHndl" value="FWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="3" EndId="12" type="0">
</Transition>
<Transition StartId="5" EndId="16" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="9" EndId="19" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="9" EndId="21" type="0">
</Transition>
<Transition StartId="11" EndId="17" type="0">
</Transition>
<Transition StartId="11" EndId="23" type="1">
<Expression>AirSFlag == true and isOK == true</Expression></Transition>
<Transition StartId="11" EndId="9" type="1">
<Expression>AirSFlag == false and isOK == true</Expression></Transition>
<Transition StartId="19" EndId="20" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="19" EndId="22" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="23" EndId="252" type="0">
</Transition>
<Transition StartId="251" EndId="23" type="0">
</Transition>
<Transition StartId="252" EndId="255" type="0">
</Transition>
<Transition StartId="252" EndId="254" type="1">
<Expression>AirS_Result ~= 0 </Expression></Transition>
<Transition StartId="254" EndId="2" type="0">
</Transition>
<Transition StartId="255" EndId="9" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="255" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

