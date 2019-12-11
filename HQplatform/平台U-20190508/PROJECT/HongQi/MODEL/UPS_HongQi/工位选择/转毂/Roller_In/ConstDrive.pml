<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1606" pbltext="DEP1567" Ecu="EV_EngineContrModul1UDS_ALL">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="EngineRPM" type="3" data="0" description="转速"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="EngineCoolantTemp" type="3" data="0" description="水温"/>
<Variable id="Bank1Sensor1Temp" type="3" data="0" description="催化剂温度"/>
<Variable id="Oxygen1Status" type="3" data="0" description="氧传感器1状态"/>
<Variable id="Oxygen2Status" type="3" data="0" description="氧传感器2状态"/>
<Variable id="RollerSpeed" type="5" data="0" description="转毂速度"/>
<Variable id="Rs_EngineRPM" type="3" data="-1" description="转速检查结果"/>
<Variable id="Rs_EngineCoolantTemp" type="3" data="-1" description="水温检查结果"/>
<Variable id="Rs_Bank1Sensor1Temp" type="3" data="-1" description="催化剂温度检查结果"/>
<Variable id="Rs_Oxygen1Status" type="3" data="-1" description="氧传感器1状态检查结果"/>
<Variable id="Rs_Oxygen2Status" type="3" data="-1" description="氧传感器2状态检查结果"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="410" top="84" right="510" bottom="116"/>
<Script></Script><TitleText Enable="1" Text="转毂中 - 动态曲线 - 等速驾驶"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="410" top="534" right="510" bottom="566"/>
<Script></Script></End>
<Activities>
<Activity id="39" ActivityType="5" flags="0" name="刹车至静止">
<Rect left="410" top="444" right="510" bottom="476"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheckRA">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_Max" value="0"/>
<Parameter id="Target_Min" value="0"/>
<Parameter id="DlgText" value="&quot;松油门，不准摘挡，缓缓停，最后踩制动&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1304" ActivityType="5" flags="0" name="constdrive_25_30L">
<Rect left="410" top="264" right="510" bottom="296"/>
<SubProcesses>
<SubProcess id="constdrive_25_30L">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1306" ActivityType="5" flags="0" name="后轴驾驶模式">
<Rect left="410" top="144" right="510" bottom="176"/>
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
<Activity id="1307" ActivityType="3" flags="0" name="统计后轴驾驶模式">
<Rect left="550" top="144" right="650" bottom="176"/>
<Script>engine.LastError = 1</Script><assessment no="1" name="DEP1565" type="8" flags="97"/>
</Activity>
<Activity id="1308" ActivityType="3" flags="0" name="统计后轴驾驶模式">
<Rect left="410" top="204" right="510" bottom="236"/>
<Script>engine.LastError = 0</Script><assessment no="1" name="DEP1565" type="8" flags="97"/>
</Activity>
<Activity id="1309" ActivityType="5" flags="0" name="constdrive_H7MJ19_20T">
<Rect left="550" top="264" right="650" bottom="296"/>
<SubProcesses>
<SubProcess id="constdrive_H7MJ19_20T">
<Parameters>
<Parameter id="Handl" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1310" ActivityType="5" flags="0" name="constdrive_H7MJ19_30L">
<Rect left="690" top="264" right="790" bottom="296"/>
<SubProcesses>
<SubProcess id="constdrive_H7MJ19_30L">
<Parameters>
<Parameter id="Handl" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="1311" ActivityType="5" flags="0" name="BrakeForceNtimes">
<Rect left="210" top="354" right="310" bottom="386"/>
<SubProcesses>
<SubProcess id="BrakeForceNtimes">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1306" type="0">
</Transition>
<Transition StartId="39" EndId="2" type="0">
</Transition>
<Transition StartId="1304" EndId="39" type="0">
</Transition>
<Transition StartId="1306" EndId="1308" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="1306" EndId="1307" type="0">
</Transition>
<Transition StartId="1308" EndId="1304" type="0">
</Transition>
<Transition StartId="1308" EndId="1309" type="1">
<Expression>engine.CarType =="CMNA02A" or engine.CarType =="CMNA01A" or engine.CarType =="CH1QM30" or engine.CarType =="CH1QM40" or engine.CarType =="CH1QM50"</Expression></Transition>
<Transition StartId="1308" EndId="1310" type="1">
<Expression>engine.CarType =="CNDA01A" or engine.CarType =="CH1PM30" or engine.CarType =="CH1PM20"</Expression></Transition>
<Transition StartId="1309" EndId="39" type="0">
</Transition>
<Transition StartId="1310" EndId="39" type="0">
</Transition>
<Transition StartId="1311" EndId="39" type="0">
</Transition>
</Transitions>
</Process>

