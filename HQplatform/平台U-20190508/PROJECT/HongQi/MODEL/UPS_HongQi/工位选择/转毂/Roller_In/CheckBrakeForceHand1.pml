<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="31" pbltext="DEP818">
<Parameters>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
<Variable id="BrakeForce_Hand" type="5" dir="1" data="0" description="驻车力"/>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
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
<Variable id="Speed_FL" type="5" data="0.0" description="左前毂的速度"/>
<Variable id="Speed_FR" type="5" data="0.0" description="右前毂的速度"/>
<Variable id="Speed_RL" type="5" data="0.0" description="左后毂的速度"/>
<Variable id="Speed_RR" type="5" data="0.0" description="右后毂的速度"/>
<Variable id="Speed_FA" type="5" data="0.0" description="前轴毂的速度"/>
<Variable id="Speed_RA" type="5" data="0.0" description="后轴毂的速度"/>
<Variable id="UTG_BrakeForce_RLRR" type="5" data="0.0" description="后轴制动力标称值，后轴重的20%"/>
<Variable id="DragForce_FL" type="5" data="0.0" description="左前轮阻滞力"/>
<Variable id="DragForce_FR" type="5" data="0.0" description="右前轮阻滞力"/>
<Variable id="DragForce_RL" type="5" data="0.0" description="左后轮阻滞力"/>
<Variable id="DragForce_RR" type="5" data="0.0" description="右后轮阻滞力"/>
<Variable id="count" type="3" data="0" description="用于循环计数"/>
<Variable id="BrakeForce_FL" type="5" data="0.0" description="左前轮制动力"/>
<Variable id="BrakeForce_FR" type="5" data="0.0" description="右前轮制动力"/>
<Variable id="BrakeForce_RL" type="5" data="0.0" description="左后轮制动力"/>
<Variable id="BrakeForce_RR" type="5" data="0.0" description="右后轮制动力"/>
<Variable id="UTG_DragForce_RLRR" type="5" data="0.0" description="后轴阻滞力标称值，后轴重的5%"/>
<Variable id="PedalForceHand" type="5" data="0.0" description="踏板力，手刹"/>
<Variable id="DragForceSum_RL" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="DragForceSum_RR" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="UTG_BrakeForce_RA" type="5" data="0.0" description="后轴制动力标称值（包含后轴阻滞力）"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="MaxDiffValue" type="5" data="0.0" description="最大差值"/>
<Variable id="BrakeForceDiff_RA" type="5" data="0.0" description="后轴动平衡"/>
<Variable id="PreValue" type="5" data="0.0" description="总制动力占总质量的百分比"/>
<Variable id="result" type="3" data="0" description="结果 0：OK，1：NOK"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 驻车制动力检测&quot;"/>
<Variable id="FISeQS_Error" type="3" data="0" description="FISeQS_Error"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="331" top="15" right="431" bottom="47"/>
<Script></Script><TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="337" top="1669" right="437" bottom="1701"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="5" ActivityType="3" name="标称值计算">
<Rect left="330" top="118" right="430" bottom="150"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>UTG_BrakeForce_RA = (Weight_RA + Weight_FA) * 0.2
UTG_DragForce_RLRR = Weight_FA * 0.05;

engine.println("##### UTG_BrakeForce_RLRR : " .. UTG_BrakeForce_RLRR .. "\n");
engine.println("##### UTG_DragForce_RLRR : " .. UTG_DragForce_RLRR .. "\n");</Script></Activity>
<Activity id="20" ActivityType="3" name="阻滞力检测">
<Rect left="332" top="566" right="432" bottom="598"/>
<Script>if(DragForce_RL &lt;= UTG_DragForce_RLRR)
then
 DragForceSum_RL = DragForceSum_RL + math.abs(DragForce_RL);
end

if(DragForce_RR &lt;= UTG_DragForce_RLRR)
then
 DragForceSum_RR = DragForceSum_RR + math.abs(DragForce_RR);
end

count = count + 1;
engine.println("##### BaseForce : " .. DragForce_RL .. " / " .. DragForce_RR .. "\n");</Script></Activity>
<Activity id="23" ActivityType="3" name="初始化计数器">
<Rect left="333" top="453" right="433" bottom="485"/>
<Script>count = 0;
DragForceSum_RL = 0;
DragForceSum_RR = 0;</Script></Activity>
<Activity id="27" ActivityType="3" name="求平均值">
<Rect left="333" top="617" right="433" bottom="649"/>
<Script>DragForce_RL = DragForceSum_RL / 10;
DragForce_RR = DragForceSum_RR / 10;</Script></Activity>
<Activity id="28" ActivityType="3" name="左后阻滞力">
<Rect left="332" top="670" right="432" bottom="702"/>
<Script>if(DragForce_RL &gt; 0 and DragForce_RL &lt;= UTG_DragForce_RLRR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.println("##### DragForce_RL : " .. DragForce_RL .. " RS : " .. engine.LastError .. "\n");</Script></Activity>
<Activity id="29" ActivityType="3" name="右后阻滞力">
<Rect left="334" top="728" right="434" bottom="760"/>
<Script>if(DragForce_RR &gt; 0 and DragForce_RR &lt;= UTG_DragForce_RLRR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.println("##### DragForce_RR : " .. DragForce_RR .. " RS : " .. engine.LastError .. "\n");</Script></Activity>
<Activity id="30" ActivityType="3" name="初始化&amp;标准值">
<Rect left="336" top="781" right="436" bottom="813"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>TimeStart = os.time();
LoopRunning = true;
MaxDiffValue = 0.0;
engine.println("##### UTG_BrakeForce_RA : " .. UTG_BrakeForce_RA .. "\n");</Script></Activity>
<Activity id="33" ActivityType="3" name="制动力检查">
<Rect left="334" top="1029" right="434" bottom="1061"/>
<Script>BrakeForce_Hand = BrakeForce_RA;

if(BrakeForce_Hand &gt; UTG_BrakeForce_RA) then
 LoopRunning = false;
else
 TimeDiff = os.difftime(os.time(),TimeStart);
 if(TimeDiff &gt; 120) then
  LoopRunning = false;
 end
end
engine.println("##### BrakeForce RL/RR/RA : " .. BrakeForce_RL .. " / " .. BrakeForce_RR  .. " / " .. BrakeForce_Hand .. "\n");</Script></Activity>
<Activity id="35" ActivityType="3" name="手刹测力计">
<Rect left="334" top="1134" right="434" bottom="1166"/>
<Script>if(PedalForceHand &gt; 0.0 and PedalForceHand &lt; 400.0) then
 engine.LastError = 0;
else
 engine.LastError = 1
end
engine.println("##### PedalForceHand : " .. PedalForceHand .. "\n");


engine.StatValue = string.format("%.2f",PedalForceHand)
engine.StatLower = "0"
engine.StatUpper = "400"</Script><assessment no="31" name="DEP847" type="8" flags="99"/>
</Activity>
<Activity id="43" ActivityType="3" name="手刹后轴制动力差">
<Rect left="334" top="1082" right="434" bottom="1114"/>
<Script>BrakeForceDiff_RA = math.abs(BrakeForce_RL - BrakeForce_RR) / math.max(BrakeForce_RL,BrakeForce_RR) * 100;

if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 20)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.println("##### BrakeForceDiff_RA Hand: " .. BrakeForceDiff_RA .. " Result : " .. engine.LastError .. "\n");


engine.StatValue = string.format("%.2f",BrakeForceDiff_RA)
engine.StatLower = "0"
engine.StatUpper = "20"</Script><assessment no="35" name="DEP851" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" name="左后制动力">
<Rect left="335" top="1210" right="435" bottom="1242"/>
<Script>if(BrakeForce_RL &gt; 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end


engine.StatValue = string.format("%.2f",BrakeForce_RL)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script></Activity>
<Activity id="46" ActivityType="3" name="右后制动力">
<Rect left="334" top="1272" right="434" bottom="1304"/>
<Script>if(BrakeForce_RR &gt; 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.StatValue = string.format("%.2f",BrakeForce_RR)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script></Activity>
<Activity id="49" ActivityType="3" name="手刹百分比">
<Rect left="336" top="1426" right="436" bottom="1458"/>
<Script>PreValue = BrakeForce_Hand / (Weight_FA + Weight_RA) * 100;
if(PreValue &gt;= 20 and PreValue &lt;= 100) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

strPreValue = tostring(string.format("%.1f",PreValue))

engine.StatValue = string.format("%.2f",PreValue)
engine.StatLower = "20"
engine.StatUpper = "100"</Script></Activity>
<Activity id="52" ActivityType="3" name="连接手刹力计">
<Rect left="516" top="14" right="616" bottom="46"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请连接手刹力测量传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="准备就绪？"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="53" ActivityType="5" name="速度检查">
<Rect left="333" top="344" right="433" bottom="376"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="2.5"/>
<Parameter id="Target_RR" value="2.5"/>
<Parameter id="DlgText" value="&quot;2.5km/h&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="54" ActivityType="4" name="路由节点">
<Rect left="845" top="347" right="877" bottom="379"/>
</Activity>
<Activity id="56" ActivityType="4" name="路由节点">
<Rect left="505" top="1030" right="537" bottom="1062"/>
</Activity>
<Activity id="57" ActivityType="3" name="显示手刹力">
<Rect left="200" top="845" right="300" bottom="877"/>
<Line4Text Enable="1" Text="踏板力：&amp;PedalForceHand N"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="4" name="路由节点">
<Rect left="845" top="1520" right="877" bottom="1552"/>
</Activity>
<Activity id="61" ActivityType="5" name="毂静止">
<Rect left="414" top="191" right="514" bottom="223"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;请确认转毂静止&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="62" ActivityType="4" name="路由节点">
<Rect left="844" top="188" right="876" bottom="220"/>
</Activity>
<Activity id="63" ActivityType="3" name="标题设置">
<Rect left="332" top="240" right="432" bottom="272"/>
<TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="64" ActivityType="5" name="后轴2.5km/h">
<Rect left="331" top="292" right="431" bottom="324"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="withEngine" value="true"/>
<Parameter id="driveEngine" value="true"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="2.5"/>
<Parameter id="speedRR" value="2.5"/>
<Parameter id="torqueFL" value="2500"/>
<Parameter id="torqueFR" value="2500"/>
<Parameter id="torqueRL" value="2500"/>
<Parameter id="torqueRR" value="2500"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="65" ActivityType="3" name="标题设置">
<Rect left="332" top="399" right="432" bottom="431"/>
<TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="13" name="获取阻滞力">
<Rect left="332" top="506" right="432" bottom="538"/>
<Line1Text Enable="1" Text="基础阻滞力"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左后：&amp;DragForce_RL N"/>
<Line4Text Enable="1" Text="右后：&amp;DragForce_RR N"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="DragForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="DragForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="DragForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="DragForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceHand"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceFoot"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="67" ActivityType="4" name="路由节点">
<Rect left="497" top="540" right="529" bottom="572"/>
</Activity>
<Activity id="68" ActivityType="3" name="请拉手刹">
<Rect left="336" top="842" right="436" bottom="874"/>
<Line1Text Enable="1" Text="请拉手刹"/>
<Script></Script></Activity>
<Activity id="69" ActivityType="13" name="获取制动力">
<Rect left="335" top="899" right="435" bottom="931"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=左后刹车力"/>
<FunctionRef id="IDT_RTS_BrakeForce" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="brakeForceFL" value="0" ret="BrakeForce_FL"/>
<Parameter id="brakeForceFR" value="0" ret="BrakeForce_FR"/>
<Parameter id="brakeForceRL" value="0" ret="BrakeForce_RL"/>
<Parameter id="brakeForceRR" value="0" ret="BrakeForce_RR"/>
<Parameter id="brakePedal" value="0" ret="PedalForceFoot"/>
<Parameter id="brakePedalH" value="0" ret="PedalForceHand"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="70" ActivityType="5" name="检查毂速度手刹">
<Rect left="218" top="1621" right="318" bottom="1653"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;释放手刹，缓慢踩刹车让毂静止&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="71" ActivityType="3" name="缓慢踩刹车">
<Rect left="336" top="1519" right="436" bottom="1551"/>
<Line1Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="72" ActivityType="5" name="毂静止">
<Rect left="336" top="1583" right="436" bottom="1615"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0"/>
<Parameter id="withEngine" value="false"/>
<Parameter id="driveEngine" value="false"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="73" ActivityType="4" name="路由节点">
<Rect left="844" top="292" right="876" bottom="324"/>
</Activity>
<Activity id="74" ActivityType="3" name="结果初始化">
<Rect left="330" top="64" right="430" bottom="96"/>
<Script>Result = 0</Script></Activity>
<Activity id="75" ActivityType="4" name="路由节点">
<Rect left="505" top="842" right="537" bottom="874"/>
</Activity>
<Activity id="76" ActivityType="3" name="最终结果不合格">
<Rect left="645" top="1519" right="745" bottom="1551"/>
<Script>Result = 1</Script></Activity>
<Activity id="78" ActivityType="3" name="结果不合格">
<Rect left="501" top="1082" right="601" bottom="1114"/>
<Script>Result = 1</Script></Activity>
<Activity id="79" ActivityType="3" name="结果不合格">
<Rect left="185" top="1137" right="285" bottom="1169"/>
<Script>Result = 1</Script></Activity>
<Activity id="80" ActivityType="3" name="结果不合格">
<Rect left="502" top="1210" right="602" bottom="1242"/>
<Script>Result = 1</Script></Activity>
<Activity id="81" ActivityType="3" name="结果不合格">
<Rect left="504" top="1273" right="604" bottom="1305"/>
<Script>Result = 1</Script></Activity>
<Activity id="82" ActivityType="3" name="结果不合格">
<Rect left="506" top="1421" right="606" bottom="1453"/>
<Script>Result = 1</Script></Activity>
<Activity id="83" ActivityType="3" name="手刹制动力总和">
<Rect left="334" top="1334" right="434" bottom="1366"/>
<Script>if(BrakeForce_Hand &gt;= UTG_BrakeForce_RA) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end


strBrakeForce_Hand = tostring(math.floor(BrakeForce_Hand))


engine.StatValue = string.format("%.2f",BrakeForce_Hand)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script></Activity>
<Activity id="84" ActivityType="3" name="结果不合格">
<Rect left="505" top="1327" right="605" bottom="1359"/>
<Script>Result = 1</Script></Activity>
<Activity id="85" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="504" top="1375" right="604" bottom="1407"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="141"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_Hand"/>
<Parameter id="Unit" value="&quot;N&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="86" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="505" top="1467" right="605" bottom="1499"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="142"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strPreValue"/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="87" ActivityType="3" name="计算制动力">
<Rect left="334" top="958" right="434" bottom="990"/>
<Script>BrakeForce_FL = BrakeForce_FL - DragForce_FL;
BrakeForce_FR = BrakeForce_FR - DragForce_FR;
BrakeForce_RL = BrakeForce_RL - DragForce_RL;
BrakeForce_RR = BrakeForce_RR - DragForce_RR;
BrakeForce_FA = BrakeForce_FL + BrakeForce_FR;
BrakeForce_RA = BrakeForce_RL + BrakeForce_RR;</Script></Activity>
<Activity id="91" ActivityType="4" name="路由节点">
<Rect left="502" top="1132" right="534" bottom="1164"/>
</Activity>
<Activity id="92" ActivityType="3" name="普通节点">
<Rect left="490" top="104" right="590" bottom="136"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="74" type="0">
</Transition>
<Transition StartId="5" EndId="63" type="0">
</Transition>
<Transition StartId="5" EndId="92" type="0">
</Transition>
<Transition StartId="20" EndId="67" type="1">
<Expression>count &lt; 10</Expression></Transition>
<Transition StartId="20" EndId="27" type="0">
</Transition>
<Transition StartId="23" EndId="66" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="68" type="0">
</Transition>
<Transition StartId="33" EndId="43" type="0">
</Transition>
<Transition StartId="33" EndId="56" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="35" EndId="45" type="0">
</Transition>
<Transition StartId="35" EndId="79" type="4">
</Transition>
<Transition StartId="43" EndId="78" type="4">
</Transition>
<Transition StartId="43" EndId="91" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="45" EndId="80" type="4">
</Transition>
<Transition StartId="46" EndId="83" type="0">
</Transition>
<Transition StartId="46" EndId="81" type="4">
</Transition>
<Transition StartId="49" EndId="86" type="0">
</Transition>
<Transition StartId="49" EndId="82" type="4">
</Transition>
<Transition StartId="53" EndId="54" type="0">
</Transition>
<Transition StartId="53" EndId="65" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="54" EndId="60" type="0">
</Transition>
<Transition StartId="56" EndId="75" type="0">
</Transition>
<Transition StartId="57" EndId="69" type="0">
</Transition>
<Transition StartId="60" EndId="76" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="0">
</Transition>
<Transition StartId="61" EndId="63" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="62" EndId="73" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="53" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="64" EndId="73" type="1">
<Expression>result ~= 0</Expression></Transition>
<Transition StartId="65" EndId="23" type="0">
</Transition>
<Transition StartId="66" EndId="20" type="0">
</Transition>
<Transition StartId="67" EndId="66" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="87" type="0">
</Transition>
<Transition StartId="70" EndId="2" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="2" type="0">
</Transition>
<Transition StartId="73" EndId="54" type="0">
</Transition>
<Transition StartId="74" EndId="5" type="0">
</Transition>
<Transition StartId="75" EndId="68" type="0">
</Transition>
<Transition StartId="76" EndId="71" type="0">
</Transition>
<Transition StartId="78" EndId="91" type="0">
</Transition>
<Transition StartId="79" EndId="45" type="0">
</Transition>
<Transition StartId="80" EndId="46" type="0">
</Transition>
<Transition StartId="81" EndId="83" type="0">
</Transition>
<Transition StartId="82" EndId="86" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="4">
</Transition>
<Transition StartId="83" EndId="85" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="49" type="0">
</Transition>
<Transition StartId="86" EndId="71" type="0">
</Transition>
<Transition StartId="87" EndId="33" type="0">
</Transition>
<Transition StartId="91" EndId="45" type="0">
</Transition>
</Transitions>
</Process>

