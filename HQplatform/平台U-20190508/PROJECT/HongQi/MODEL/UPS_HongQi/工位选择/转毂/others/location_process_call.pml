<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="600" top="124" right="700" bottom="156"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="602" top="940" right="702" bottom="972"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="数据准备">
<Rect left="604" top="281" right="704" bottom="313"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
Flag_ShowTBLResult = false;
Flag_RepeatEnable  = false;
Flag_Retry = false;
--工位
strTmpLocation = engine.WorkPlace;

--完整模式or单步模式
strTestMode = "Complete";
--strTestMode = "Single";

if( strTmpLocation == "VP1" or strTmpLocation == "VP2" or strTmpLocation == "EC7"  or strTmpLocation == "EC8" or strTmpLocation == "OPT" or strTmpLocation == "ADM") then

Flag_ShowTBLResult = true;
Flag_RepeatEnable  = true;

end;
</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="统计数据整理">
<Rect left="603" top="583" right="703" bottom="615"/>
<TitleText Enable="1" Text="&amp;engine.WorkPlace"/>
<Script>

if(Flag_ShowTBLResult == true) then



engine.ListClear();


--测试结果列表
local i,PtbTest;
local j,PblTest;
StatisticTestResult = engine.GetResults();

--engine.println(table2xmlstring("Gongshu",StatisticTestResult));
--dump("Gongshu",StatisticTestResult);
engine.println(table2xmlstring(StatisticTestResult,"Gongshu"));
dump(StatisticTestResult,"Gongshu");

if(#StatisticTestResult ~= 0) then
TextGiveUP = "放弃";
engine.ListAddString( TextGiveUP,true);
end;


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
engine.println("已选择单步：" .. tostring(textSequenceSel));
engine.SelectLayout(0);
engine.DialogBackColor = -1;

if(textSequenceSel ~= TextGiveUP ) then 
Flag_Retry = true;
strTestMode = "Single";


end;



else
if(engine.TestResult == 0 and #StatisticTestResult ~= 0) then
engine.DialogBackColor = "green";

engine.SelectLayout(1);
#INPUT textSequenceSel
engine.SelectLayout(0);
engine.DialogBackColor = -1;

end;

end;

end;
</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="普通节点">
<Rect left="603" top="352" right="703" bottom="384"/>
<Script>Flag_Retry = false;</Script></Activity>
<Activity id="29" ActivityType="3" flags="1" name="SaveResult">
<Rect left="602" top="776" right="702" bottom="808"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local StatisticTestResult = engine.GetResults();


if (#StatisticTestResult ~= 0) then

engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();

end;

engine.WorkPlace = strTmpLocation;</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="清界面">
<Rect left="601" top="838" right="701" bottom="870"/>
<TitleText Enable="1"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="打印机选择">
<Rect left="602" top="635" right="702" bottom="667"/>
<TitleText Enable="1" Text="选择打印机"/>
<Script>--打印机工位
PrinterLocationVp1 = "VP1 - 预检1 - 打印机";
PrinterLocationVp2 = "VP2 - 预检2 - 打印机";
PrinterLocationZp7 = "EC7 - 下线检测 - 打印机";
PrinterLocationOpt = "OPT - 返修 - 打印机" ;
PrinterLocationAL1 = "AL1 - 前束一线 - 打印机";
PrinterLocationAL2 = "AL2 - 前束二线 - 打印机";
PrinterLocationRO1 = "RO1 - 转毂一线 - 打印机";
PrinterLocationRO2 = "RO2 - 转毂二测 - 打印机";
PrinterLocationZp8 = "ZP8 - 报交 - 打印机";



-- 转毂

if(engine.WorkPlace == "ROL" or engine.WorkPlace == "ROR" ) then 


--列表添加
engine.DialogBackColor = -1;


engine.ListClear();
engine.ListAddString(PrinterLocationRO1,true);
engine.ListAddString(PrinterLocationRO2,false);

engine.SelectLayout(1);
#INPUT PrinterLocationSel
engine.println("已选择工位：" .. tostring(PrinterLocationSel));
engine.DialogBackColor = -1;

if( PrinterLocationSel == PrinterLocationRO1 ) then   engine.WorkPlace = "RO1" ;    end;
if( PrinterLocationSel == PrinterLocationRO2 ) then   engine.WorkPlace = "RO2" ;    end;


engine.SelectLayout(0);

end;


-- ADM



if(engine.WorkPlace == "ADM" ) then 


--列表添加
engine.DialogBackColor = -1;


engine.ListClear();
engine.ListAddString(PrinterLocationOpt,true);
engine.ListAddString(PrinterLocationRO1,false);
engine.ListAddString(PrinterLocationRO2,false);
engine.ListAddString(PrinterLocationAL1,false);
engine.ListAddString(PrinterLocationAL2,false);
engine.ListAddString(PrinterLocationZp7,false);
engine.ListAddString(PrinterLocationZp8,false);
engine.ListAddString(PrinterLocationVp2,false);
engine.ListAddString(PrinterLocationVp1,false);


engine.SelectLayout(1);
#INPUT PrinterLocationSel
engine.println("已选择工位：" .. tostring(PrinterLocationSel));
engine.DialogBackColor = -1;

if( PrinterLocationSel == PrinterLocationRO1 ) then   engine.WorkPlace = "RO1" ;    end;
if( PrinterLocationSel == PrinterLocationRO2 ) then   engine.WorkPlace = "RO2" ;    end;
if( PrinterLocationSel == PrinterLocationOpt ) then   engine.WorkPlace = "OPT" ;    end;
if( PrinterLocationSel == PrinterLocationAL1 ) then   engine.WorkPlace = "AL1" ;    end;
if( PrinterLocationSel == PrinterLocationAL2 ) then   engine.WorkPlace = "AL2" ;    end;
if( PrinterLocationSel == PrinterLocationZp7 ) then   engine.WorkPlace = "EC7" ;    end;
if( PrinterLocationSel == PrinterLocationVp2 ) then   engine.WorkPlace = "VP2" ;    end;
if( PrinterLocationSel == PrinterLocationVp1 ) then   engine.WorkPlace = "VP1" ;    end;
if( PrinterLocationSel == PrinterLocationZp8 ) then   engine.WorkPlace = "EC8" ;    end;

engine.SelectLayout(0);

end;


StatisticTestResult = engine.GetResults();



</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="time init">
<Rect left="603" top="199" right="703" bottom="231"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Seq_x_time_start = os.clock();</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="time end">
<Rect left="526" top="701" right="626" bottom="733"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Seq_x_time_end = os.clock();
local use_time = Seq_x_time_end - Seq_x_time_start;
local Str_use_time = string.format("%d",use_time);

engine.LastError = 0;
engine.StatValue = "Time:"..tostring(Str_use_time);</Script><assessment block="6" ptbtext="DEP951" group="6" pbltext="DEP951" no="12" name="DEP951" type="8" flags="1"/>
</Activity>
<Activity id="43" ActivityType="5" flags="0" name="test_rts_rework">
<Rect left="890" top="474" right="990" bottom="506"/>
<SubProcesses>
<SubProcess id="test_rts_rework">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="44" ActivityType="5" flags="0" name="test_rts">
<Rect left="730" top="474" right="830" bottom="506"/>
<SubProcesses>
<SubProcess id="test_rts">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="41" type="0">
</Transition>
<Transition StartId="3" EndId="26" type="0">
</Transition>
<Transition StartId="17" EndId="26" type="1">
<Expression>Flag_Retry == true and Flag_RepeatEnable  == true</Expression></Transition>
<Transition StartId="17" EndId="40" type="0">
</Transition>
<Transition StartId="26" EndId="43" type="1">
<Expression>strTmpLocation == "ROR" </Expression></Transition>
<Transition StartId="26" EndId="44" type="1">
<Expression>strTmpLocation == "ROL" </Expression></Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="2" type="0">
</Transition>
<Transition StartId="40" EndId="42" type="1">
<Expression>#StatisticTestResult ~= 0</Expression></Transition>
<Transition StartId="40" EndId="29" type="0">
</Transition>
<Transition StartId="41" EndId="3" type="0">
</Transition>
<Transition StartId="42" EndId="29" type="0">
</Transition>
<Transition StartId="43" EndId="40" type="0">
</Transition>
<Transition StartId="44" EndId="17" type="0">
</Transition>
</Transitions>
</Process>

