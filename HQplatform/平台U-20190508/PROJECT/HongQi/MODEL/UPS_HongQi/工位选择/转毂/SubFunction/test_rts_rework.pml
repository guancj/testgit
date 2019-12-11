<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="649" top="79" right="749" bottom="111"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="942" top="155" right="1042" bottom="187"/>
<Script></Script></End>
<Activities>
<Activity id="9" ActivityType="3" name="选择列表">
<Rect left="648" top="154" right="748" bottom="186"/>
<TitleText Enable="1" Text="转毂返修"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--测试项选择

textRolTestSingle = "选择单项转毂检测";
textRolTestEpsCalib = "电子助力转向标定";
textRolTestRol = "转毂中测试";
textRolTestRolALL = "转毂全部过程";
textRolTestPrr = "转毂前的预检测";
textRolTestLEPReady = "LEP 怠速准备位检测";
textRolTestLEP = "LEP 怠速检测";
textRolTestEmissi = "尾气检测";
textRolTestDtcReadALL = "读所有故障码";
textRolTestDtcClearALL = "清所有故障码";
textRolTestESPCalib = "车身稳定系统标定"

--列表添加
engine.DialogBackColor = "cyan";


engine.ListClear();
--engine.ListAddString(textRolTestRolALL,false);
--engine.ListAddString(textRolTestPrr,false);
engine.ListAddString(textRolTestRol,true);
--engine.ListAddString(textRolTestEmissi,false);
--engine.ListAddString(textRolTestLEP,false);

engine.ListAddString(textRolTestSingle,false);
--engine.ListAddString(textRolTestEpsCalib,false);
--engine.ListAddString(textRolTestESPCalib,false);


--if (engine.executeLAS('($G0C|$G1A)&amp;$TL0&amp;$7GR|($7MS|$7GR)&amp;$D16|($DP7&amp;$TJ5)|($D16&amp;($G1C|$G0C)&amp;$TL9&amp;$7GR)')) then
--engine.ListAddString(textRolTestLEPReady ,false);
--end;

--engine.ListAddString(textRolTestDtcReadALL,false);
--engine.ListAddString(textRolTestDtcClearALL,false);


engine.SelectLayout(1);
#INPUT textRolTestSel
engine.println("已选择转毂测试项：" .. tostring(textRolTestSel));
engine.SelectLayout(0);
engine.DialogBackColor = "-1";</Script></Activity>
<Activity id="63" ActivityType="3" name="统计数据整理">
<Rect left="180" top="364" right="280" bottom="396"/>
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
--#INPUT textSequenceSel
engine.SelectLayout(0);
engine.DialogBackColor = -1;

if(textSequenceSel ~= TextGiveUP ) then 
strTestMode = "rework";
end;
end;

end;




--engine.WorkPlace = "RO2";</Script></Activity>
<Activity id="64" ActivityType="4" name="路由节点">
<Rect left="424" top="354" right="456" bottom="386"/>
</Activity>
<Activity id="65" ActivityType="5" name="ROL_Main">
<Rect left="185" top="244" right="285" bottom="276"/>
<SubProcesses>
<SubProcess id="ROL_Main">
<Parameters>
<Parameter id="PedalFlag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="87" ActivityType="3" name="是否进行制动踏板力检测">
<Rect left="650" top="294" right="750" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="进行制动踏板力检测吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>
engine.DialogBackColor = "yellow";
#PRESSBUTTON</Script></Activity>
<Activity id="88" ActivityType="3" name="不进行">
<Rect left="600" top="364" right="700" bottom="396"/>
<Script>PedalFlag = false;
engine.DialogBackColor = -1 ;</Script></Activity>
<Activity id="89" ActivityType="3" name="进行">
<Rect left="720" top="364" right="820" bottom="396"/>
<Script>PedalFlag = true;
engine.DialogBackColor = -1 ;</Script></Activity>
<Activity id="90" ActivityType="5" name="ROL_Main_rework">
<Rect left="680" top="424" right="780" bottom="456"/>
<SubProcesses>
<SubProcess id="ROL_Main_rework">
<Parameters>
<Parameter id="PedalFlag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="65" type="1">
<Expression>textRolTestSel == textRolTestRol and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="9" EndId="87" type="1">
<Expression>textRolTestSel == textRolTestSingle and engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="9" EndId="2" type="1">
<Expression>engine.LButtonPressed == true</Expression></Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="9" type="0">
</Transition>
<Transition StartId="65" EndId="63" type="0">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="6">
</Transition>
<Transition StartId="88" EndId="90" type="0">
</Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="64" type="0">
</Transition>
</Transitions>
</Process>

