<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1605" pbltext="DEP1564">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="result" type="3" dir="1" data="0"/>
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
<Variable id="TitleText" type="8" data="&quot;转毂中 - 动态驾驶过程&quot;"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="44" right="470" bottom="76"/>
<Script></Script><TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="584" right="470" bottom="616"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="毂静止">
<Rect left="370" top="284" right="470" bottom="316"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;缓慢踩刹车停下车子&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="9" ActivityType="5" flags="0" name="40公里对表">
<Rect left="370" top="404" right="470" bottom="436"/>
<SubProcesses>
<SubProcess id="SpeedMeter">
<Parameters>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="测量块完整">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script>engine.LastError = 1
engine.StatValue = "Test block incomplete"</Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="510" top="404" right="610" bottom="436"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="34" ActivityType="3" flags="0" name="返修吗？">
<Rect left="510" top="464" right="610" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返修 - 40公里对表"/>
<Line3Text Enable="1" Text="可以吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="37" ActivityType="5" flags="0" name="后轴驾驶模式">
<Rect left="370" top="164" right="470" bottom="196"/>
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
<Activity id="38" ActivityType="3" flags="0" name="统计IDT错误">
<Rect left="650" top="164" right="750" bottom="196"/>
<Script>engine.LastError = 1
reuslt = 3</Script><assessment no="1" name="DEP1565" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="统计后轴驾驶模式">
<Rect left="370" top="224" right="470" bottom="256"/>
<Script>engine.LastError = 0</Script><assessment no="1" name="DEP1565" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="统计毂静止错误">
<Rect left="650" top="284" right="750" bottom="316"/>
<Script>engine.LastError = 1
reuslt = 3</Script><assessment no="2" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="统计毂静止">
<Rect left="370" top="344" right="470" bottom="376"/>
<Script>engine.LastError = 0
ctype = engine.SharedVarGet("vehicleID")</Script><assessment no="2" name="DEP1528" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="5" flags="0" name="HS7SpeedMeter">
<Rect left="230" top="404" right="330" bottom="436"/>
<SubProcesses>
<SubProcess id="HS7SpeedMeter">
<Parameters>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="90" top="404" right="190" bottom="436"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="返修吗？">
<Rect left="90" top="464" right="190" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返修 - 40公里对表"/>
<Line3Text Enable="1" Text="可以吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="344" right="716" bottom="376"/>
</Activity>
<Activity id="47" ActivityType="5" flags="0" name="c229_SpeedMeter">
<Rect left="650" top="404" right="750" bottom="436"/>
<SubProcesses>
<SubProcess id="c229_SpeedMeter">
<Parameters>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="650" top="464" right="750" bottom="496"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="返修吗？">
<Rect left="830" top="404" right="930" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返修 - 40公里对表"/>
<Line3Text Enable="1" Text="可以吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="864" top="574" right="896" bottom="606"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="20" type="0">
</Transition>
<Transition StartId="3" EndId="41" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="3" EndId="40" type="0">
</Transition>
<Transition StartId="9" EndId="25" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="1">
<Expression>result == 0 </Expression></Transition>
<Transition StartId="20" EndId="37" type="0">
</Transition>
<Transition StartId="25" EndId="34" type="1">
<Expression>finishflag == false</Expression></Transition>
<Transition StartId="25" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="9" type="0">
</Transition>
<Transition StartId="34" EndId="2" type="5">
</Transition>
<Transition StartId="37" EndId="39" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="39" EndId="3" type="0">
</Transition>
<Transition StartId="41" EndId="9" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="1">
<Expression>ctype == "HS7"</Expression></Transition>
<Transition StartId="41" EndId="46" type="1">
<Expression>LibGeneral.CarTNC_C229(engine.CarType)</Expression></Transition>
<Transition StartId="42" EndId="2" type="1">
<Expression>result == 0 </Expression></Transition>
<Transition StartId="42" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="1">
<Expression>finishflag == false</Expression></Transition>
<Transition StartId="44" EndId="2" type="0">
</Transition>
<Transition StartId="45" EndId="42" type="0">
</Transition>
<Transition StartId="45" EndId="2" type="5">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="50" type="1">
<Expression>finishflag == false</Expression></Transition>
<Transition StartId="49" EndId="2" type="0">
</Transition>
<Transition StartId="50" EndId="47" type="0">
</Transition>
<Transition StartId="50" EndId="51" type="5">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

