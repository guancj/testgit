<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1504" pbltext="DEP79">
<Parameters>
<Variable id="ACCLDWflag" type="11" dir="0" data="ACCLDWflag"/>
<Variable id="AFSPartnumber" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="470" top="24" right="570" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="470" top="324" right="570" bottom="356"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="1" name="LWDCalibration">
<Rect left="470" top="94" right="570" bottom="126"/>
<SubProcesses>
<SubProcess id="LWDCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="45" ActivityType="5" flags="0" name="ESPCalibration">
<Rect left="470" top="154" right="570" bottom="186"/>
<SubProcesses>
<SubProcess id="ESPCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="48" ActivityType="5" flags="0" name="AFSCalibration">
<Rect left="470" top="204" right="570" bottom="236"/>
<SubProcesses>
<SubProcess id="AFSCalibration">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="Partnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="49" ActivityType="5" flags="0" name="SASCalibration">
<Rect left="470" top="264" right="570" bottom="296"/>
<SubProcesses>
<SubProcess id="SASCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="94" right="396" bottom="126"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="1">
<Expression>ACCLDWflag == true</Expression></Transition>
<Transition StartId="1" EndId="50" type="0">
</Transition>
<Transition StartId="3" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="2" type="0">
</Transition>
<Transition StartId="50" EndId="45" type="0">
</Transition>
</Transitions>
</Process>

