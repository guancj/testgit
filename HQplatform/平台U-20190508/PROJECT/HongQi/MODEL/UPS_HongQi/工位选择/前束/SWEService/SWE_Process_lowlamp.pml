<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="1" name="开始节点">
<Rect left="280" top="94" right="380" bottom="126"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="280" top="484" right="380" bottom="516"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="左近光灯调整">
<Rect left="280" top="154" right="380" bottom="186"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Lowleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="左近光灯结果">
<Rect left="280" top="214" right="380" bottom="246"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Lowleft">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="32" ActivityType="5" flags="0" name="右近光灯结果">
<Rect left="280" top="324" right="380" bottom="356"/>
<SubProcesses>
<SubProcess id="SWE_38_RequestResult_Lowright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="35" ActivityType="5" flags="0" name="右近光灯调整">
<Rect left="280" top="274" right="380" bottom="306"/>
<SubProcesses>
<SubProcess id="SWE_08_SWEConfig_Lowright">
<Parameters>
<Parameter id="SWEHndl" value="SWEHndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="关闭近光灯">
<Rect left="280" top="404" right="380" bottom="436"/>
<Script>engine.SharedVarSet("BCM_LowLamp_off",true)</Script></Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="274" right="546" bottom="306"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="3" EndId="45" type="0">
</Transition>
<Transition StartId="4" EndId="35" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="4" EndId="45" type="0">
</Transition>
<Transition StartId="32" EndId="43" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="32" EndId="45" type="0">
</Transition>
<Transition StartId="35" EndId="32" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="35" EndId="45" type="0">
</Transition>
<Transition StartId="43" EndId="2" type="0">
</Transition>
<Transition StartId="45" EndId="43" type="0">
</Transition>
</Transitions>
</Process>

