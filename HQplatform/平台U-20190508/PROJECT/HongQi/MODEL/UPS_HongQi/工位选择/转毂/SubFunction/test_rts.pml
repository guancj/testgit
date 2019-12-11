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
<Rect left="630" top="144" right="730" bottom="176"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="630" top="724" right="730" bottom="756"/>
<Script></Script></End>
<Activities>
<Activity id="19" ActivityType="3" name="转毂全部过程">
<Rect left="630" top="474" right="730" bottom="506"/>
<TitleText Enable="1" Text="转毂全部过程"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="进入检测工位"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="可以吗？"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON

</Script></Activity>
<Activity id="20" ActivityType="4" name="路由节点">
<Rect left="544" top="564" right="576" bottom="596"/>
</Activity>
<Activity id="60" ActivityType="5" name="ROL_Main">
<Rect left="630" top="524" right="730" bottom="556"/>
<SubProcesses>
<SubProcess id="ROL_Main">
<Parameters>
<Parameter id="PedalFlag" value="PedalFlag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="85" ActivityType="3" name="返修吗？">
<Rect left="830" top="584" right="930" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返修 - 转毂中"/>
<Line3Text Enable="1" Text="可以吗？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="88" ActivityType="3" name="统计数据整理">
<Rect left="630" top="584" right="730" bottom="616"/>
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
engine.Delay(3000);
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
engine.Delay(1000);
engine.SelectLayout(0);
engine.DialogBackColor = -1;

if(textSequenceSel ~= TextGiveUP ) then 
strTestMode = "OK";
end;
end;

end;

</Script></Activity>
<Activity id="106" ActivityType="3" name="por time init">
<Rect left="630" top="634" right="730" bottom="666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Seq_pro_time_start = os.clock();</Script></Activity>
<Activity id="110" ActivityType="3" name="是否进行制动踏板力检测">
<Rect left="630" top="244" right="730" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="进行制动踏板力检测吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>
engine.DialogBackColor = "yellow";
#PRESSBUTTON</Script></Activity>
<Activity id="111" ActivityType="3" name="不进行">
<Rect left="570" top="304" right="670" bottom="336"/>
<Script>PedalFlag = false;
engine.DialogBackColor = -1 ;</Script></Activity>
<Activity id="112" ActivityType="3" name="进行">
<Rect left="700" top="304" right="800" bottom="336"/>
<Script>PedalFlag = true;
engine.DialogBackColor = -1 ;</Script></Activity>
<Activity id="113" ActivityType="4" name="路由节点">
<Rect left="664" top="394" right="696" bottom="426"/>
</Activity>
<Activity id="114" ActivityType="4" name="路由节点">
<Rect left="774" top="634" right="806" bottom="666"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="110" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="19" EndId="60" type="6">
</Transition>
<Transition StartId="20" EndId="106" type="0">
</Transition>
<Transition StartId="60" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="106" type="1">
<Expression>strTestMode == "OK"</Expression></Transition>
<Transition StartId="88" EndId="114" type="0">
</Transition>
<Transition StartId="106" EndId="2" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="112" type="6">
</Transition>
<Transition StartId="111" EndId="113" type="0">
</Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="19" type="0">
</Transition>
<Transition StartId="114" EndId="106" type="0">
</Transition>
</Transitions>
</Process>

