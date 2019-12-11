<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="200" pbltext="DEP808">
<Parameters>
<Variable id="TestStationID" type="3" dir="0" data="0" description="检测台序号"/>
<Variable id="Handl" type="3" dir="0" data="-1" description="通讯句柄"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
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
<Rect left="639" top="14" right="739" bottom="46"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="640" top="1214" right="740" bottom="1246"/>
<Script></Script></End>
<Activities>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="174" right="1316" bottom="206"/>
</Activity>
<Activity id="152" ActivityType="5" flags="0" name="开始IDT">
<Rect left="640" top="138" right="740" bottom="170"/>
<SubProcesses>
<SubProcess id="ROL_Start">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="155" ActivityType="5" flags="0" name="调整轴距">
<Rect left="640" top="251" right="740" bottom="283"/>
<SubProcesses>
<SubProcess id="ROL_WheelBase">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="WheelBase" value="2970"/>
<Parameter id="Handl" value="Handl"/>
<Parameter id="width" value="1800"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="244" right="1316" bottom="276"/>
</Activity>
<Activity id="159" ActivityType="5" flags="0" name="后轴驾驶模式">
<Rect left="639" top="316" right="739" bottom="348"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="withEngine" value="true"/>
<Parameter id="driveEngine" value="true"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="2"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="2000"/>
<Parameter id="torqueFR" value="2000"/>
<Parameter id="torqueRL" value="0"/>
<Parameter id="torqueRR" value="0"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="314" right="1316" bottom="346"/>
</Activity>
<Activity id="163" ActivityType="5" flags="0" name="回基准位置">
<Rect left="643" top="875" right="743" bottom="907"/>
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
<Rect left="642" top="940" right="742" bottom="972"/>
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
<Rect left="220" top="534" right="320" bottom="566"/>
<SubProcesses>
<SubProcess id="CheckBrakeForce">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="转毂台匹配错误">
<Rect left="843" top="125" right="943" bottom="157"/>
<Line2Text Enable="1" Text="转毂选择错误"/>
<Line4Text Enable="1" Text="将取消检测"/>
<Script>engine.DialogBackColor = "red";
engine.println("##### IDFromIDT " .. IDFromIDT .. "\n");
engine.println("##### TestStationID " .. TestStationID .. "\n");

engine.LastError = 1
engine.StatValue = "Roller station match faild, IDfromRoller:" .. tostring(IDFromIDT) .. " SetStation:" .. tostring(TestStationID)</Script><assessment no="4" name="DEP812" type="8" flags="97"/>
</Activity>
<Activity id="181" ActivityType="5" flags="0" name="喇叭检测">
<Rect left="781" top="371" right="881" bottom="403"/>
<SubProcesses>
<SubProcess id="HornTest">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="182" ActivityType="5" flags="0" name="动态曲线">
<Rect left="758" top="535" right="858" bottom="567"/>
<SubProcesses>
<SubProcess id="DriveTest">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="183" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="874" right="1316" bottom="906"/>
</Activity>
<Activity id="184" ActivityType="5" flags="0" name="ESP开关检测">
<Rect left="363" top="535" right="463" bottom="567"/>
<SubProcesses>
<SubProcess id="SwitchTest">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="185" ActivityType="3" flags="0" name="开始IDT失败">
<Rect left="844" top="175" right="944" bottom="207"/>
<Line2Text Enable="1" Text="开始IDT失败"/>
<Line4Text Enable="1" Text="将取消检测"/>
<Script>engine.DialogBackColor = "red";
engine.println("##### IDFromIDT " .. IDFromIDT .. "\n");
engine.println("##### TestStationID " .. TestStationID .. "\n");

engine.LastError = 1</Script><assessment no="5" name="DEP813" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="设置退出标识">
<Rect left="642" top="1005" right="742" bottom="1037"/>
<Line2Text Enable="1" Text="转毂检测结束"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true);
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="195" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="114" right="1316" bottom="146"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="220" top="594" right="320" bottom="626"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="516" top="593" right="616" bottom="625"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="759" top="595" right="859" bottom="627"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="202" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="362" top="593" right="462" bottom="625"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="测量块完整性">
<Rect left="639" top="78" right="739" bottom="110"/>
<Script>engine.StatValue = "Roller Tester Incomplete"
engine.LastError = 0</Script><assessment block="5" ptbtext="DEP807" group="200" pbltext="DEP808" no="101" name="DEP814" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="测量块完整性">
<Rect left="490" top="875" right="590" bottom="907"/>
<Script>engine.StatValue = "Roller Tester Complete"
engine.LastError = 0</Script><assessment block="5" ptbtext="DEP807" group="200" pbltext="DEP808" no="101" name="DEP814" type="8" flags="97"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="喇叭检测">
<Rect left="640" top="370" right="740" bottom="402"/>
<Line2Text Enable="1" Text="拉动远光灯光开关，灯光喇叭功能是否正常"/>
<Line4Text Enable="1" Text="可以吗？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "yellow";
#PRESSBUTTON
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="单步选择">
<Rect left="641" top="423" right="741" bottom="455"/>
<TitleText Enable="1" Text="转毂中单步测试"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--测试项选择

textRolTestBrake = "制动力检测";
textRolTestEspSwitch = "ESP开关检测";
textRolTestEspValve = "ESP阀门检测";
textRolTestDynDrive = "动态驾驶检测";
textRolTestConstDrive = "等速驾驶检测";
textRolTestWWS = "轮速传感器检测";
textRolTestReadDTC = "读取DTC";
CText_Title_back_down = "放弃";
textRolTestEPBCali = "EPB标定检测";
--列表添加
engine.DialogBackColor = "cyan";


engine.ListClear();
engine.ListAddString(CText_Title_back_down,false);
engine.ListAddString(textRolTestBrake,true);
engine.ListAddString(textRolTestEspSwitch,false);
engine.ListAddString(textRolTestEspValve,false);
engine.ListAddString(textRolTestDynDrive,false);
engine.ListAddString(textRolTestConstDrive,false);
engine.ListAddString(textRolTestWWS,false);
engine.ListAddString(textRolTestReadDTC,false);
engine.ListAddString(textRolTestEPBCali,false);


engine.SelectLayout(1);
#INPUT textRolTestSel
engine.println("已选择转毂单步测试项：" .. tostring(textRolTestSel));
engine.SelectLayout(0);
engine.DialogBackColor = "-1";</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="统计数据整理">
<Rect left="641" top="731" right="741" bottom="763"/>
<TitleText Enable="1" Text="&amp;engine.WorkPlace"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>strTestMode = "";

engine.ListClear();

--测试结果列表
local i,PtbTest;
local j,PblTest;
local StatisticTestResult = engine.GetResults();


if(#StatisticTestResult ~= 0) then
TextGiveUP = "放弃";
--engine.ListAddString( TextGiveUP,true);
end;

engine.println(table2xmlstring(StatisticTestResult,"Gongshu"));
dump(StatisticTestResult,"Gongshu");

for i=1, #StatisticTestResult do 
PtbTest = StatisticTestResult[i];
for j=1, #PtbTest.pbl do 
PblTest = PtbTest.pbl[j];
if(PblTest.result ~=0) then 

textList = "NOK       "..tostring(PblTest.pbltext) ;
else
textList = "OK        "..tostring(PblTest.pbltext) ;

end;

engine.ListAddString(textList,false);

end;

end;

if(engine.TestResult ~= 0 and #StatisticTestResult ~= 0) then
engine.DialogBackColor = "red";
engine.SelectLayout(1);
#INPUT textSequenceSel

engine.SelectLayout(0);
engine.DialogBackColor = -1;

if(textSequenceSel ~= TextGiveUP ) then 
strTestMode = "rework";

end;



else
if(engine.TestResult == 0 and #StatisticTestResult ~= 0) then
engine.DialogBackColor = "green";

engine.SelectLayout(1);
#INPUT textSequenceSel
engine.SelectLayout(0);
engine.DialogBackColor = -1;

if(textSequenceSel ~= TextGiveUP ) then 
strTestMode = "rework";
end;
end;

end;




--engine.WorkPlace = "RO2";</Script></Activity>
<Activity id="214" ActivityType="5" flags="0" name="等速驾驶">
<Rect left="882" top="536" right="982" bottom="568"/>
<SubProcesses>
<SubProcess id="ConstDrive">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="215" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="882" top="595" right="982" bottom="627"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="424" right="76" bottom="456"/>
</Activity>
<Activity id="217" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="874" right="76" bottom="906"/>
</Activity>
<Activity id="218" ActivityType="3" flags="0" name="转毂台匹配">
<Rect left="484" top="76" right="584" bottom="108"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1;
engine.println("##### IDFromIDT " .. IDFromIDT .. "\n");
engine.println("##### TestStationID " .. TestStationID .. "\n");

engine.LastError = 0
</Script><assessment no="4" name="DEP812" type="8" flags="97"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="开始IDT重置">
<Rect left="481" top="138" right="581" bottom="170"/>
<Script>engine.DialogBackColor = -1;
engine.println("##### IDFromIDT " .. IDFromIDT .. "\n");
engine.println("##### TestStationID " .. TestStationID .. "\n");

engine.LastError = 0</Script><assessment no="5" name="DEP813" type="8" flags="97"/>
</Activity>
<Activity id="220" ActivityType="3" flags="0" name="测量块完整性">
<Rect left="640" top="1074" right="740" bottom="1106"/>
<Script>engine.StatValue = "Roller Tester Complete"
engine.LastError = 0</Script><assessment block="5" ptbtext="DEP807" group="200" pbltext="DEP808" no="101" name="DEP814" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="5" flags="0" name="WheelSpeedSensor">
<Rect left="1000" top="534" right="1100" bottom="566"/>
<SubProcesses>
<SubProcess id="WheelSpeedSensor">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="1000" top="594" right="1100" bottom="626"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="223" ActivityType="5" flags="0" name="roll_esp_valve_test">
<Rect left="520" top="534" right="620" bottom="566"/>
<SubProcesses>
<SubProcess id="roll_esp_valve_test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="224" ActivityType="5" flags="0" name="EPB_Calibration">
<Rect left="70" top="534" right="170" bottom="566"/>
<SubProcesses>
<SubProcess id="EPB_Calibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="70" top="594" right="170" bottom="626"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="226" ActivityType="5" flags="0" name="ESP_Read_DTC">
<Rect left="1130" top="484" right="1230" bottom="516"/>
<SubProcesses>
<SubProcess id="ESP_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="227" ActivityType="5" flags="0" name="EPB_Read_DTC">
<Rect left="1130" top="554" right="1230" bottom="586"/>
<SubProcesses>
<SubProcess id="EPB_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="228" ActivityType="5" flags="0" name="EMS_Read_DTC">
<Rect left="1130" top="614" right="1230" bottom="646"/>
<SubProcesses>
<SubProcess id="EMS_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="229" ActivityType="3" flags="0" name="检测结束标识">
<Rect left="1130" top="684" right="1230" bottom="716"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="204" type="0">
</Transition>
<Transition StartId="144" EndId="158" type="0">
</Transition>
<Transition StartId="152" EndId="171" type="1">
<Expression>IDFromIDT ~= TestStationID</Expression></Transition>
<Transition StartId="152" EndId="155" type="1">
<Expression>result == 0 and IDFromIDT == TestStationID</Expression></Transition>
<Transition StartId="152" EndId="185" type="0">
</Transition>
<Transition StartId="155" EndId="159" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="155" EndId="158" type="0">
</Transition>
<Transition StartId="158" EndId="161" type="0">
</Transition>
<Transition StartId="159" EndId="209" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="159" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="183" type="0">
</Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="189" type="0">
</Transition>
<Transition StartId="168" EndId="196" type="0">
</Transition>
<Transition StartId="171" EndId="195" type="0">
</Transition>
<Transition StartId="181" EndId="210" type="0">
</Transition>
<Transition StartId="181" EndId="161" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="182" EndId="200" type="0">
</Transition>
<Transition StartId="183" EndId="163" type="0">
</Transition>
<Transition StartId="184" EndId="202" type="0">
</Transition>
<Transition StartId="185" EndId="144" type="0">
</Transition>
<Transition StartId="189" EndId="220" type="0">
</Transition>
<Transition StartId="195" EndId="144" type="0">
</Transition>
<Transition StartId="196" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="196" EndId="163" type="0">
</Transition>
<Transition StartId="198" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="198" EndId="163" type="0">
</Transition>
<Transition StartId="200" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="200" EndId="163" type="0">
</Transition>
<Transition StartId="202" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="202" EndId="163" type="0">
</Transition>
<Transition StartId="204" EndId="218" type="0">
</Transition>
<Transition StartId="205" EndId="163" type="0">
</Transition>
<Transition StartId="209" EndId="181" type="1">
<Expression>engine.WorkPlace == "RO1"</Expression></Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="168" type="1">
<Expression>textRolTestSel == textRolTestBrake and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="184" type="1">
<Expression>textRolTestSel == textRolTestEspSwitch and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="223" type="1">
<Expression>textRolTestSel == textRolTestEspValve and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="182" type="1">
<Expression>textRolTestSel == textRolTestDynDrive and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="214" type="1">
<Expression>textRolTestSel == textRolTestConstDrive and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="216" type="1">
<Expression>textRolTestSel == CText_Title_back_down or engine.LButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="221" type="1">
<Expression>textRolTestSel == textRolTestWWS and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="224" type="1">
<Expression>textRolTestSel == textRolTestEPBCali and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="210" EndId="226" type="1">
<Expression>textRolTestSel == textRolTestReadDTC and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="213" EndId="210" type="0">
</Transition>
<Transition StartId="214" EndId="215" type="0">
</Transition>
<Transition StartId="215" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="215" EndId="163" type="0">
</Transition>
<Transition StartId="216" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="205" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="152" type="0">
</Transition>
<Transition StartId="220" EndId="2" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="223" EndId="198" type="0">
</Transition>
<Transition StartId="224" EndId="225" type="0">
</Transition>
<Transition StartId="225" EndId="163" type="0">
</Transition>
<Transition StartId="225" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
<Transition StartId="226" EndId="227" type="0">
</Transition>
<Transition StartId="227" EndId="228" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="213" type="1">
<Expression>not finishflag</Expression></Transition>
</Transitions>
</Process>

