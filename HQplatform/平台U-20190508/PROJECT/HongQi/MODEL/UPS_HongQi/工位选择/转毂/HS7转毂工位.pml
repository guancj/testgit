<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="64" right="330" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="534" right="330" bottom="566"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_转毂通讯初始化">
<Rect left="230" top="124" right="330" bottom="156"/>
<Line2Text Enable="1" Text="IDT建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="&quot;idtcom_abs1&quot;"/>
<Parameter id="iniKey" value="&quot;abs_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="198" ActivityType="5" flags="0" name="开始IDT">
<Rect left="230" top="184" right="330" bottom="216"/>
<SubProcesses>
<SubProcess id="RTS_01_Start">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="200" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="460" top="314" right="560" bottom="346"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="460" top="384" right="560" bottom="416"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="202" ActivityType="5" flags="1" name="HS7process">
<Rect left="230" top="244" right="330" bottom="276"/>
<SubProcesses>
<SubProcess id="HS7process">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ErrorMonitor">
<Parameters>
<Parameter id="AutoMode" value="true"/>
<Parameter id="Error" value="true"/>
<Parameter id="Emergency" value="true"/>
<Parameter id="Ready" value="false"/>
<Parameter id="Handl" value="Ha"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ViewPosition">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="203" ActivityType="13" flags="0" name="ROL断开通讯">
<Rect left="230" top="454" right="330" bottom="486"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="202" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="202" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

