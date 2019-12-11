<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="546" top="17" right="646" bottom="49"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="539" top="411" right="639" bottom="443"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="IntSetValue_DTimeOut">
<Rect left="793" top="86" right="893" bottom="118"/>
<TitleText Enable="1" Text="Door left side test"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="5" flags="1" name="driver_door">
<Rect left="550" top="214" right="650" bottom="246"/>
<SubProcesses>
<SubProcess id="driver_door">
<Parameters>
<Parameter id="DString_C131_Driver_Door_Speaker"/>
<Parameter id="DString_C131_PEPS0_handleswic"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
</Transitions>
</Process>

