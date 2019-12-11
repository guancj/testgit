<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHandl" type="3" dir="0" data="0"/>
<Variable id="SWEHandl" type="3" dir="0" data="0"/>
<Variable id="FASHandl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="74" right="470" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="860" top="154" right="960" bottom="186"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="PrepareIDT_FWE">
<Rect left="370" top="154" right="470" bottom="186"/>
<SubProcesses>
<SubProcess id="PrepareIDT">
<Parameters>
<Parameter id="IDTHndl" value="FWEHandl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="PrepareIDT_SWE">
<Rect left="710" top="154" right="810" bottom="186"/>
<SubProcesses>
<SubProcess id="PrepareIDT">
<Parameters>
<Parameter id="IDTHndl" value="SWEHandl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="NOK">
<Rect left="370" top="234" right="470" bottom="266"/>
<Script>engine.LastError = 1
engine.StatValue = "FWE IDT Start 01 Error"
engine.println(" &lt;FWE PreparationStart&gt; :  Service 01 Processed Execute failed")
</Script><assessment no="4" name="DEP1288" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="5" flags="0" name="PrepareIDT_FAS">
<Rect left="540" top="154" right="640" bottom="186"/>
<SubProcesses>
<SubProcess id="PrepareIDT">
<Parameters>
<Parameter id="IDTHndl" value="FASHandl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="NOK">
<Rect left="540" top="234" right="640" bottom="266"/>
<Script>engine.LastError = 1
engine.StatValue = "FAS IDT Start 01 Error"
engine.println(" &lt;FAS PreparationStart&gt; :  Service 01 Processed Execute failed")
</Script><assessment no="5" name="DEP1290" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="1" name="NOK">
<Rect left="710" top="234" right="810" bottom="266"/>
<Script>engine.LastError = 1
engine.StatValue = "SWE IDT Start 01 Error"
engine.println(" &lt;SWE PreparationStart&gt; :  Service 01 Processed Execute failed")
</Script><assessment no="6" name="DEP1289" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="74" right="616" bottom="106"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="7" type="1">
<Expression>isOK == true and FASHandl ~= ""</Expression></Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="4" EndId="2" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="4" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="10" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

