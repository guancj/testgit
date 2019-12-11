<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="-1" description="通讯句柄"/>
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
<Variable id="FirapName" type="8" data="" description="Firap名称"/>
<Variable id="IDTAnswer" type="8" data="" description="IDT响应报文"/>
<Variable id="result" type="3" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="IDFromFirap" type="3" data="0" description="从Firap获得的序号"/>
<Variable id="IDFromIDT" type="3" data="0" description="从IDT获得的序号"/>
<Variable id="SimFlg" type="11" data="true" description="是否进行模拟"/>
<Variable id="ConnetStatus" type="11" data=""/>
<Variable id="finishflag" type="8" data="false" description="&quot;_FINISHFLAG&quot; 值"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="260" top="34" right="360" bottom="66"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="260" top="1334" right="360" bottom="1366"/>
<Script></Script></End>
<Activities>
<Activity id="163" ActivityType="5" flags="0" name="回基准位置">
<Rect left="260" top="1164" right="360" bottom="1196"/>
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
<Activity id="164" ActivityType="5" flags="0" name="停止IDT">
<Rect left="260" top="1224" right="360" bottom="1256"/>
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
<Activity id="168" ActivityType="5" flags="0" name="制动力检测">
<Rect left="260" top="464" right="360" bottom="496"/>
<SubProcesses>
<SubProcess id="CheckBrakeForce">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="181" ActivityType="5" flags="0" name="喇叭检测">
<Rect left="260" top="274" right="360" bottom="306"/>
<SubProcesses>
<SubProcess id="HornTest">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="182" ActivityType="5" flags="0" name="驾驶模式40公里对表">
<Rect left="260" top="334" right="360" bottom="366"/>
<SubProcesses>
<SubProcess id="DriveTest">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="result" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="184" ActivityType="5" flags="0" name="ESP踏板检测">
<Rect left="260" top="664" right="360" bottom="696"/>
<SubProcesses>
<SubProcess id="SwitchTest">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="设置退出标识">
<Rect left="260" top="1274" right="360" bottom="1306"/>
<Line2Text Enable="1" Text="转毂检测结束"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true);
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="返修吗？">
<Rect left="1250" top="574" right="1350" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返修 - 阀门检测"/>
<Line3Text Enable="1" Text="可以吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="210" ActivityType="5" flags="0" name="等速驾驶">
<Rect left="260" top="394" right="360" bottom="426"/>
<SubProcesses>
<SubProcess id="ConstDrive">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="220" ActivityType="5" flags="0" name="阀门检测">
<Rect left="1250" top="514" right="1350" bottom="546"/>
<SubProcesses>
<SubProcess id="roll_esp_valve_test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="224" ActivityType="5" flags="0" name="EPB标定">
<Rect left="260" top="714" right="360" bottom="746"/>
<SubProcesses>
<SubProcess id="EPB_Calibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="228" ActivityType="5" flags="0" name="模式控制">
<Rect left="260" top="154" right="360" bottom="186"/>
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
<Activity id="232" ActivityType="5" flags="0" name="轴距设置">
<Rect left="260" top="94" right="360" bottom="126"/>
<SubProcesses>
<SubProcess id="RTS_04_WheelBase">
<Parameters>
<Parameter id="WheelBase" value="2970"/>
<Parameter id="Width" value="1800"/>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="轴距设置失败">
<Rect left="460" top="94" right="560" bottom="126"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="模式控制失败">
<Rect left="460" top="154" right="560" bottom="186"/>
<Script>engine.LastError = 1
engine.StatValue = "03 service controlActuators failure"

engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script><assessment no="8" name="DEP1457" type="8" flags="97"/>
</Activity>
<Activity id="238" ActivityType="3" flags="0" name="统计模式控制成功">
<Rect left="260" top="214" right="360" bottom="246"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "03 service controlActuators successful"
</Script><assessment no="8" name="DEP1457" type="8" flags="97"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="制动力IDT失败">
<Rect left="670" top="484" right="770" bottom="516"/>
<Script></Script></Activity>
<Activity id="240" ActivityType="3" flags="0" name="轮速传感器IDT失败">
<Rect left="610" top="594" right="710" bottom="626"/>
<Script></Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="阀门检测IDT失败">
<Rect left="540" top="684" right="640" bottom="716"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="894" right="766" bottom="926"/>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="40公里对表IDT失败">
<Rect left="830" top="354" right="930" bottom="386"/>
<Script></Script></Activity>
<Activity id="245" ActivityType="5" flags="0" name="ABSlightCheck">
<Rect left="260" top="774" right="360" bottom="806"/>
<SubProcesses>
<SubProcess id="ABSlightCheck">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="250" ActivityType="5" flags="0" name="阀门检测改过版">
<Rect left="260" top="594" right="360" bottom="626"/>
<SubProcesses>
<SubProcess id="H7roll_esp_valve_test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="251" ActivityType="5" flags="0" name="轮速传感器">
<Rect left="260" top="524" right="360" bottom="556"/>
<SubProcesses>
<SubProcess id="WheelSpeedSensor">
<Parameters>
<Parameter id="Handl" value="Handl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="252" ActivityType="5" flags="0" name="ESP_Read_DTC">
<Rect left="430" top="844" right="530" bottom="876"/>
<SubProcesses>
<SubProcess id="ESP_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="253" ActivityType="5" flags="0" name="EPB_Read_DTC">
<Rect left="430" top="894" right="530" bottom="926"/>
<SubProcesses>
<SubProcess id="EPB_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="254" ActivityType="5" flags="0" name="EMS_Read_DTC">
<Rect left="430" top="954" right="530" bottom="986"/>
<SubProcesses>
<SubProcess id="EMS_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="255" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="260" top="1024" right="360" bottom="1056"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="256" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="260" top="1084" right="360" bottom="1116"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="257" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="914" right="326" bottom="946"/>
</Activity>
<Activity id="258" ActivityType="3" flags="0" name="喇叭检测失败">
<Rect left="990" top="274" right="1090" bottom="306"/>
<Script></Script></Activity>
<Activity id="259" ActivityType="5" flags="0" name="制动力检测不带踏板力">
<Rect left="430" top="394" right="530" bottom="426"/>
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
<Transition StartId="1" EndId="232" type="0">
</Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="189" type="0">
</Transition>
<Transition StartId="168" EndId="239" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="168" EndId="251" type="0">
</Transition>
<Transition StartId="181" EndId="258" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="181" EndId="182" type="0">
</Transition>
<Transition StartId="182" EndId="244" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="182" EndId="210" type="0">
</Transition>
<Transition StartId="184" EndId="224" type="0">
</Transition>
<Transition StartId="189" EndId="2" type="0">
</Transition>
<Transition StartId="210" EndId="168" type="0">
</Transition>
<Transition StartId="210" EndId="259" type="1">
<Expression>engine.SharedVarGet("PedalOrNot") == "0"</Expression></Transition>
<Transition StartId="224" EndId="245" type="0">
</Transition>
<Transition StartId="228" EndId="238" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="228" EndId="237" type="0">
</Transition>
<Transition StartId="232" EndId="228" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="232" EndId="236" type="0">
</Transition>
<Transition StartId="238" EndId="181" type="0">
</Transition>
<Transition StartId="239" EndId="243" type="0">
</Transition>
<Transition StartId="240" EndId="243" type="0">
</Transition>
<Transition StartId="241" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="255" type="0">
</Transition>
<Transition StartId="244" EndId="243" type="0">
</Transition>
<Transition StartId="245" EndId="257" type="0">
</Transition>
<Transition StartId="250" EndId="241" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="250" EndId="184" type="0">
</Transition>
<Transition StartId="251" EndId="240" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="251" EndId="250" type="0">
</Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="255" type="0">
</Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="163" type="0">
</Transition>
<Transition StartId="257" EndId="255" type="0">
</Transition>
<Transition StartId="258" EndId="243" type="0">
</Transition>
<Transition StartId="259" EndId="251" type="0">
</Transition>
<Transition StartId="259" EndId="239" type="1">
<Expression>isOK == 3</Expression></Transition>
</Transitions>
</Process>

