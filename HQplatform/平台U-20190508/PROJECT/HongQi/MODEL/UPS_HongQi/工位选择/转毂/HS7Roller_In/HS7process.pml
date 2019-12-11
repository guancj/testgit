<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="34" right="330" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="1014" right="330" bottom="1046"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="轴距设置">
<Rect left="230" top="94" right="330" bottom="126"/>
<SubProcesses>
<SubProcess id="RTS_04_WheelBase">
<Parameters>
<Parameter id="WheelBase" value="3008"/>
<Parameter id="Width" value="1998"/>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="233" ActivityType="5" flags="0" name="模式控制">
<Rect left="230" top="154" right="330" bottom="186"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="2"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="2000"/>
<Parameter id="torqueFR" value="2000"/>
<Parameter id="torqueRL" value="0"/>
<Parameter id="torqueRR" value="0"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="234" ActivityType="3" flags="0" name="统计模式控制成功">
<Rect left="230" top="214" right="330" bottom="246"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "03 service controlActuators successful"


</Script></Activity>
<Activity id="239" ActivityType="5" flags="0" name="喇叭检测">
<Rect left="230" top="274" right="330" bottom="306"/>
<SubProcesses>
<SubProcess id="HornTest">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="轮速传感器">
<Rect left="230" top="354" right="330" bottom="386"/>
<SubProcesses>
<SubProcess id="HS7WheelSpeedSensor">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="242" ActivityType="5" flags="1" name="回基准位置">
<Rect left="230" top="844" right="330" bottom="876"/>
<SubProcesses>
<SubProcess id="ROL_BasePos">
<Parameters>
<Parameter id="Timeout" value="20"/>
<Parameter id="Result" value="0"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="243" ActivityType="5" flags="0" name="停止IDT">
<Rect left="230" top="904" right="330" bottom="936"/>
<SubProcesses>
<SubProcess id="ROL_Stop">
<Parameters>
<Parameter id="Timeout" value="10"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="设置退出标识">
<Rect left="230" top="954" right="330" bottom="986"/>
<Line2Text Enable="1" Text="转毂检测结束"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true);
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="246" ActivityType="5" flags="0" name="40千米每小时对表">
<Rect left="230" top="494" right="330" bottom="526"/>
<SubProcesses>
<SubProcess id="DriveTest">
<Parameters>
<Parameter id="Handl" value="0"/>
<Parameter id="result" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="247" ActivityType="5" flags="0" name="HS7阀门检测">
<Rect left="230" top="424" right="330" bottom="456"/>
<SubProcesses>
<SubProcess id="HS7Roller_esp_value_test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="249" ActivityType="5" flags="0" name="HS7ConstDrive">
<Rect left="230" top="554" right="330" bottom="586"/>
<SubProcesses>
<SubProcess id="HS7ConstDrive">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="250" ActivityType="3" flags="0" name="轮速传感器IDT失败">
<Rect left="620" top="354" right="720" bottom="386"/>
<Script></Script></Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="684" right="686" bottom="716"/>
</Activity>
<Activity id="252" ActivityType="3" flags="0" name="40公里对表IDT失败">
<Rect left="560" top="494" right="660" bottom="526"/>
<Script></Script></Activity>
<Activity id="253" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="230" top="684" right="330" bottom="716"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="230" top="764" right="330" bottom="796"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="255" ActivityType="5" flags="0" name="制动力检测">
<Rect left="230" top="604" right="330" bottom="636"/>
<SubProcesses>
<SubProcess id="CheckBrakeForce">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" ret="isOK "/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="256" ActivityType="3" flags="0" name="喇叭检测失败">
<Rect left="730" top="274" right="830" bottom="306"/>
<Script></Script></Activity>
<Activity id="257" ActivityType="5" flags="0" name="制动力检测不带踏板力">
<Rect left="100" top="604" right="200" bottom="636"/>
<SubProcesses>
<SubProcess id="CheckBrakeForce-0">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK "/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="233" type="0">
</Transition>
<Transition StartId="233" EndId="234" type="0">
</Transition>
<Transition StartId="234" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="241" type="0">
</Transition>
<Transition StartId="239" EndId="256" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="241" EndId="247" type="0">
</Transition>
<Transition StartId="241" EndId="250" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="2" type="0">
</Transition>
<Transition StartId="246" EndId="252" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="246" EndId="249" type="0">
</Transition>
<Transition StartId="247" EndId="246" type="0">
</Transition>
<Transition StartId="249" EndId="255" type="0">
</Transition>
<Transition StartId="249" EndId="257" type="1">
<Expression>engine.SharedVarGet("PedalOrNot") == "0"</Expression></Transition>
<Transition StartId="250" EndId="251" type="0">
</Transition>
<Transition StartId="251" EndId="253" type="0">
</Transition>
<Transition StartId="252" EndId="251" type="0">
</Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="242" type="0">
</Transition>
<Transition StartId="255" EndId="253" type="0">
</Transition>
<Transition StartId="256" EndId="251" type="0">
</Transition>
<Transition StartId="257" EndId="253" type="0">
</Transition>
</Transitions>
</Process>

