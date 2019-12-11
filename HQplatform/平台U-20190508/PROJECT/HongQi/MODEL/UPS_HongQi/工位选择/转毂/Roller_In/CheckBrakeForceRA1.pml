<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="31" pbltext="DEP818">
<Parameters>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="BrakeForce_RA" type="5" dir="1" data="0" description="后轴制动力"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="BrakeForce_FA" type="5" dir="0" data="0" description="前轴刹车力"/>
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
<Variable id="PedalForceFoot" type="5" data="0.0" description="踏板力"/>
<Variable id="DragForceSum_RL" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="DragForceSum_RR" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="UTG_BrakeForce_RA" type="5" data="0.0" description="后轴制动力标称值（包含后轴阻滞力）"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="MaxDiffValue" type="5" data="0.0" description="最大差值"/>
<Variable id="BrakeForceDiff_RA" type="5" data="0.0" description="后轴动平衡"/>
<Variable id="PreValue_RA" type="5" data="0.0" description="后轴制动力占整车质量的百分比"/>
<Variable id="PreValue_DragForce_RL" type="5" data="0.0" description="左后滞力占前轴质量的百分比"/>
<Variable id="PreValue_DragForce_RR" type="5" data="0.0" description="右后阻滞力占前轴质量的百分比"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
<Variable id="PedalForceHand" type="5" data="0.0" description="踏板力，手刹"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 后轴制动力检测&quot;"/>
<Variable id="FISeQS_Error" type="3" data="0" description="FISeQS 上传结果值"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="224" right="324" bottom="32"/>
<Script></Script><TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="223" top="1890" right="323" bottom="1922"/>
<Script></Script></End>
<Activities>
<Activity id="5" ActivityType="3" name="标称值计算">
<Rect left="225" top="97" right="325" bottom="129"/>
<TitleText Enable="1" Text="后轴制动力检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>UTG_BrakeForce_RA = Weight_RA * 0.2;
UTG_DragForce_RLRR = Weight_RA * 0.05;
engine.println("##### UTG_BrakeForce_RA : " .. UTG_BrakeForce_RA .. "\n");
engine.println("##### UTG_DragForce_RLRR : " .. UTG_DragForce_RLRR .. "\n");</Script></Activity>
<Activity id="20" ActivityType="3" name="阻滞力检测">
<Rect left="228" top="521" right="328" bottom="553"/>
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
<Rect left="228" top="409" right="328" bottom="441"/>
<Script>count = 0;
DragForceSum_RL = 0;
DragForceSum_RR = 0;</Script></Activity>
<Activity id="26" ActivityType="4" name="路由节点">
<Rect left="389" top="499" right="421" bottom="531"/>
</Activity>
<Activity id="27" ActivityType="3" name="求平均值">
<Rect left="228" top="570" right="328" bottom="602"/>
<Script>DragForce_RL = DragForceSum_RL / 10;
DragForce_RR = DragForceSum_RR / 10;</Script></Activity>
<Activity id="28" ActivityType="3" name="左后阻滞力">
<Rect left="228" top="643" right="328" bottom="675"/>
<Script>if(DragForce_RL &gt; 0 and DragForce_RL &lt;= UTG_DragForce_RLRR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("##### DragForce_RL : " .. DragForce_RL .. " RS : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_RL)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_RLRR)</Script><assessment no="11" name="DEP823" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" name="右后阻滞力">
<Rect left="227" top="691" right="327" bottom="723"/>
<Script>if(DragForce_RR &gt; 0 and DragForce_RR &lt;= UTG_DragForce_RLRR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("##### DragForce_RR ##: " .. DragForce_RR .. " RS : " .. engine.LastError .. "\n");
engine.println("##### UTG_DragForce_RLRR ##: " .. UTG_DragForce_RLRR);

engine.StatValue = string.format("%.2f", DragForce_RR)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_RLRR)</Script><assessment no="12" name="DEP824" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" name="初始化标准值">
<Rect left="226" top="906" right="326" bottom="938"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>UTG_BrakeForce_RA = UTG_BrakeForce_RLRR + DragForce_RL + DragForce_RR;
TimeStart = os.time();
LoopRunning = true;
MaxDiffValue = 0.0;
engine.println("##### UTG_BrakeForce_RA : " .. UTG_BrakeForce_RA .. "\n");</Script></Activity>
<Activity id="33" ActivityType="3" name="制动力检查">
<Rect left="224" top="1146" right="324" bottom="1178"/>
<Script>UTG_BrakeForce_OA = (Weight_FA + Weight_RA) * 0.6;
BrakeForce_ALL = BrakeForce_FA + BrakeForce_RA;

if(BrakeForce_RA &gt; UTG_BrakeForce_RA and BrakeForce_ALL &gt;= UTG_BrakeForce_OA) then
 LoopRunning = false;
else
 TimeDiff = os.difftime(os.time(),TimeStart);
 if(TimeDiff &gt; 120) then
  LoopRunning = false;
 end
end</Script></Activity>
<Activity id="35" ActivityType="3" name="踏板测力计">
<Rect left="225" top="1248" right="325" bottom="1280"/>
<Script>if(PedalForceFoot &gt; 0 and  PedalForceFoot &lt; 400) then
 engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.println("##### PedalForceFoot : " .. PedalForceFoot .. "\n");

engine.StatValue = string.format("%.2f", PedalForceFoot)
engine.StatLower = "0"
engine.StatUpper = "400"</Script><assessment no="30" name="DEP846" type="8" flags="99"/>
</Activity>
<Activity id="38" ActivityType="3" name="后轴制动力差">
<Rect left="225" top="1195" right="325" bottom="1227"/>
<Script>BrakeForceDiff_RA = math.abs(BrakeForce_RL - BrakeForce_RR) / math.max(BrakeForce_RL,BrakeForce_RR) * 100;

if(BrakeForce_RA &gt;= Weight_RA * 0.6) then
	 if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 24) then
	  engine.LastError = 0;
	  FISeQS_Error = 0
	 else
	  engine.LastError = -1;
	  FISeQS_Error = 1
	 end
	 engine.StatLower = "0"
	 engine.StatUpper = "24"
else
	 if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 8) then
	  engine.LastError = 0;
	  FISeQS_Error = 0
	 else
	  engine.LastError = -1;
	  FISeQS_Error = 1
	 end
	 engine.StatLower = "0"
	 engine.StatUpper = "8"
end
engine.println("##### BrakeForceDiff_RA : " .. BrakeForceDiff_RA .. " Result : " .. engine.LastError .. "\n");

strBrakeForceDiff_RA = tostring(string.format("%.1f", BrakeForceDiff_RA))

engine.StatValue = string.format("%.2f", BrakeForceDiff_RA)</Script><assessment no="13" name="DEP835" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" name="左后制动力">
<Rect left="225" top="1313" right="325" bottom="1345"/>
<Script>if(BrakeForce_RL &gt; 0 and BrakeForce_RL &lt; 5000) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

strBrakeForce_RL = tostring(math.floor(BrakeForce_RL/10))

engine.StatValue = string.format("%.2f", BrakeForce_RL)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="14" name="DEP828" type="8" flags="99"/>
</Activity>
<Activity id="44" ActivityType="3" name="右后制动力">
<Rect left="224" top="1403" right="324" bottom="1435"/>
<Script>if(BrakeForce_RR &gt; 0 and BrakeForce_RR &lt; 5000) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end


strBrakeForce_RR = tostring(math.floor(BrakeForce_RR/10))

engine.StatValue = string.format("%.2f", BrakeForce_RR)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="15" name="DEP829" type="8" flags="99"/>
</Activity>
<Activity id="45" ActivityType="3" name="后轴制动力百分比">
<Rect left="223" top="1568" right="323" bottom="1600"/>
<Script>PreValue_RA = BrakeForce_RA / Weight_RA * 100;

engine.LastError = 0;
FISeQS_Error = 0

--[[
if(PreValue_RA &gt; 20)
then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end
]]

strPreValue_RA = tostring(string.format("%.1f", PreValue_RA))

engine.StatValue = string.format("%.2f", PreValue_RA)
engine.StatLower = "20"
engine.StatUpper = "100"</Script><assessment no="16" name="DEP836" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="5" name="速度检查">
<Rect left="224" top="304" right="324" bottom="336"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="2.5"/>
<Parameter id="Target_RR" value="2.5"/>
<Parameter id="DlgText" value="&quot;后轴2.5km/h&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="52" ActivityType="4" name="路由节点">
<Rect left="705" top="304" right="737" bottom="336"/>
</Activity>
<Activity id="54" ActivityType="4" name="路由节点">
<Rect left="383" top="1145" right="415" bottom="1177"/>
</Activity>
<Activity id="55" ActivityType="4" name="路由节点">
<Rect left="700" top="1714" right="732" bottom="1746"/>
</Activity>
<Activity id="56" ActivityType="5" name="检查毂速度">
<Rect left="93" top="1820" right="193" bottom="1852"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;缓慢踩刹车让毂静止&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="57" ActivityType="5" name="毂静止">
<Rect left="370" top="144" right="470" bottom="176"/>
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
<Activity id="58" ActivityType="4" name="路由节点">
<Rect left="705" top="147" right="737" bottom="179"/>
</Activity>
<Activity id="59" ActivityType="3" name="挂空挡">
<Rect left="225" top="199" right="325" bottom="231"/>
<TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1" Text="挂空挡不踩刹车"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="5" name="后轴2.5km/h">
<Rect left="225" top="247" right="325" bottom="279"/>
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
<Activity id="61" ActivityType="3" name="标题设置">
<Rect left="227" top="351" right="327" bottom="383"/>
<TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="62" ActivityType="13" name="获取阻滞力">
<Rect left="228" top="462" right="328" bottom="494"/>
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
<Activity id="63" ActivityType="3" name="显示踏板力">
<Rect left="269" top="1087" right="369" bottom="1119"/>
<Line4Text Enable="1" Text="踏板力：&amp;PedalForceFoot N"/>
<Script></Script></Activity>
<Activity id="64" ActivityType="13" name="获取制动力">
<Rect left="225" top="1021" right="325" bottom="1053"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RL #R=左后刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_RR #R=右后刹车力"/>
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
<Activity id="65" ActivityType="3" name="缓慢踩刹车">
<Rect left="223" top="1712" right="323" bottom="1744"/>
<Line1Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="5" name="毂静止">
<Rect left="223" top="1768" right="323" bottom="1800"/>
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
<Activity id="67" ActivityType="3" name="请踩脚刹车">
<Rect left="225" top="956" right="325" bottom="988"/>
<Line1Text Enable="1" Text="请踩脚刹车"/>
<Script></Script></Activity>
<Activity id="68" ActivityType="4" name="路由节点">
<Rect left="705" top="246" right="737" bottom="278"/>
</Activity>
<Activity id="69" ActivityType="3" name="结果初始化">
<Rect left="225" top="45" right="325" bottom="77"/>
<Script>Result = 0</Script></Activity>
<Activity id="70" ActivityType="3" name="最终结果不合格">
<Rect left="539" top="1713" right="639" bottom="1745"/>
<Script>Result = 1</Script></Activity>
<Activity id="71" ActivityType="4" name="路由节点">
<Rect left="383" top="1022" right="415" bottom="1054"/>
</Activity>
<Activity id="72" ActivityType="3" name="结果不合格">
<Rect left="388" top="642" right="488" bottom="674"/>
<Script>Result = 1</Script></Activity>
<Activity id="73" ActivityType="3" name="结果不合格">
<Rect left="390" top="691" right="490" bottom="723"/>
<Script>Result = 1</Script></Activity>
<Activity id="75" ActivityType="3" name="结果不合格">
<Rect left="381" top="1194" right="481" bottom="1226"/>
<Script>Result = 1</Script></Activity>
<Activity id="76" ActivityType="3" name="结果不合格">
<Rect left="380" top="1312" right="480" bottom="1344"/>
<Script>Result = 1</Script></Activity>
<Activity id="77" ActivityType="3" name="结果不合格">
<Rect left="380" top="1403" right="480" bottom="1435"/>
<Script>Result = 1</Script></Activity>
<Activity id="78" ActivityType="3" name="结果不合格">
<Rect left="381" top="1568" right="481" bottom="1600"/>
<Script>Result = 1</Script></Activity>
<Activity id="81" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="379" top="1359" right="479" bottom="1391"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="122"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_RL"/>
<Parameter id="Unit" value="&quot;10N&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP839" type="8" flags="105"/>
</Activity>
<Activity id="82" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="380" top="1448" right="480" bottom="1480"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="123"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_RR"/>
<Parameter id="Unit" value="&quot;10N&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP841" type="8" flags="105"/>
</Activity>
<Activity id="83" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="383" top="1249" right="483" bottom="1281"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="125"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForceDiff_RA"/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP842" type="8" flags="105"/>
</Activity>
<Activity id="84" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="381" top="1615" right="481" bottom="1647"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="124"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strPreValue_RA"/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP841" type="8" flags="105"/>
</Activity>
<Activity id="85" ActivityType="3" name="结果不合格">
<Rect left="91" top="1251" right="191" bottom="1283"/>
<Script>Result = 1</Script></Activity>
<Activity id="86" ActivityType="3" name="计算制动力">
<Rect left="141" top="1087" right="241" bottom="1119"/>
<Script>BrakeForce_FL = BrakeForce_FL - DragForce_FL;
BrakeForce_FR = BrakeForce_FR - DragForce_FR;
BrakeForce_RL = BrakeForce_RL - DragForce_RL;
BrakeForce_RR = BrakeForce_RR - DragForce_RR;
BrakeForce_RA = BrakeForce_RL + BrakeForce_RR;</Script></Activity>
<Activity id="87" ActivityType="3" name="左后阻滞力百分比">
<Rect left="227" top="747" right="327" bottom="779"/>
<Script>PreValue_DragForce_RL = DragForce_RL / Weight_RA * 100;
if(PreValue_DragForce_RL &gt;= 0 and PreValue_DragForce_RL &lt;= 5)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.StatValue = string.format("%.2f", PreValue_DragForce_RL)
engine.StatLower = "0"
engine.StatUpper = "5"</Script><assessment no="17" name="DEP833" type="8" flags="97"/>
</Activity>
<Activity id="88" ActivityType="3" name="右后阻滞力百分比">
<Rect left="227" top="800" right="327" bottom="832"/>
<Script>PreValue_DragForce_RR = DragForce_RR / Weight_RA * 100;
if(PreValue_DragForce_RR &gt;= 0 and PreValue_DragForce_RR &lt;= 5)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.StatValue = string.format("%.2f", PreValue_DragForce_RR)
engine.StatLower = "0"
engine.StatUpper = "5"</Script><assessment no="18" name="DEP834" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" name="结果不合格">
<Rect left="390" top="748" right="490" bottom="780"/>
<Script>Result = 1</Script></Activity>
<Activity id="90" ActivityType="3" name="结果不合格">
<Rect left="389" top="800" right="489" bottom="832"/>
<Script>Result = 1</Script></Activity>
<Activity id="91" ActivityType="3" name="后轴制动力总和">
<Rect left="222" top="1505" right="322" bottom="1537"/>
<Script>if(BrakeForce_RA &gt; UTG_BrakeForce_RA) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("##### BrakeForce_RA: " .. BrakeForce_RA.. " Result : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", BrakeForce_RA)
engine.StatLower = tostring(BrakeForce_RA)
engine.StatUpper = "8000"</Script><assessment no="42" name="DEP914" type="8" lower="0" upper="5000" unit="N" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" name="结果不合格">
<Rect left="380" top="1506" right="480" bottom="1538"/>
<Script>Result = 1</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="69" type="0">
</Transition>
<Transition StartId="5" EndId="59" type="0">
</Transition>
<Transition StartId="20" EndId="26" type="1">
<Expression>count &lt; 10</Expression></Transition>
<Transition StartId="20" EndId="27" type="0">
</Transition>
<Transition StartId="23" EndId="62" type="0">
</Transition>
<Transition StartId="26" EndId="62" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="28" EndId="72" type="4">
</Transition>
<Transition StartId="29" EndId="87" type="0">
</Transition>
<Transition StartId="29" EndId="73" type="4">
</Transition>
<Transition StartId="30" EndId="67" type="0">
</Transition>
<Transition StartId="33" EndId="54" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="33" EndId="38" type="0">
</Transition>
<Transition StartId="35" EndId="43" type="0">
</Transition>
<Transition StartId="35" EndId="85" type="4">
</Transition>
<Transition StartId="38" EndId="83" type="0">
</Transition>
<Transition StartId="38" EndId="75" type="4">
</Transition>
<Transition StartId="43" EndId="76" type="4">
</Transition>
<Transition StartId="43" EndId="81" type="0">
</Transition>
<Transition StartId="44" EndId="82" type="0">
</Transition>
<Transition StartId="44" EndId="77" type="4">
</Transition>
<Transition StartId="45" EndId="84" type="0">
</Transition>
<Transition StartId="45" EndId="78" type="4">
</Transition>
<Transition StartId="51" EndId="52" type="1">
<Expression>result ~= 0</Expression></Transition>
<Transition StartId="51" EndId="61" type="0">
</Transition>
<Transition StartId="52" EndId="55" type="0">
</Transition>
<Transition StartId="54" EndId="71" type="0">
</Transition>
<Transition StartId="55" EndId="70" type="0">
</Transition>
<Transition StartId="56" EndId="2" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="57" EndId="59" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="58" EndId="68" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="51" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="60" EndId="68" type="0">
</Transition>
<Transition StartId="61" EndId="23" type="0">
</Transition>
<Transition StartId="62" EndId="20" type="0">
</Transition>
<Transition StartId="63" EndId="86" type="0">
</Transition>
<Transition StartId="64" EndId="86" type="0">
</Transition>
<Transition StartId="64" EndId="63" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
<Transition StartId="67" EndId="64" type="0">
</Transition>
<Transition StartId="68" EndId="52" type="0">
</Transition>
<Transition StartId="69" EndId="5" type="0">
</Transition>
<Transition StartId="70" EndId="65" type="0">
</Transition>
<Transition StartId="71" EndId="64" type="0">
</Transition>
<Transition StartId="72" EndId="29" type="0">
</Transition>
<Transition StartId="73" EndId="87" type="0">
</Transition>
<Transition StartId="75" EndId="83" type="0">
</Transition>
<Transition StartId="76" EndId="81" type="0">
</Transition>
<Transition StartId="77" EndId="82" type="0">
</Transition>
<Transition StartId="78" EndId="84" type="0">
</Transition>
<Transition StartId="81" EndId="44" type="0">
</Transition>
<Transition StartId="82" EndId="91" type="0">
</Transition>
<Transition StartId="83" EndId="43" type="0">
</Transition>
<Transition StartId="83" EndId="35" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="84" EndId="65" type="0">
</Transition>
<Transition StartId="85" EndId="43" type="0">
</Transition>
<Transition StartId="86" EndId="33" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="4">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="90" type="4">
</Transition>
<Transition StartId="88" EndId="30" type="0">
</Transition>
<Transition StartId="89" EndId="88" type="0">
</Transition>
<Transition StartId="90" EndId="30" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="4">
</Transition>
<Transition StartId="91" EndId="45" type="0">
</Transition>
<Transition StartId="92" EndId="45" type="0">
</Transition>
</Transitions>
</Process>

