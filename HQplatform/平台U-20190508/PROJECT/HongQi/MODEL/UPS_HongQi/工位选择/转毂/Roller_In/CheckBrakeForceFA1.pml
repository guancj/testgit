<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
<Variable id="BrakeForce_FA" type="5" dir="1" data="0" description="前轴制动力"/>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
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
<Variable id="UTG_BrakeForce_FLFR" type="5" data="0.0" description="前轴制动力标称值，前轴重的60%"/>
<Variable id="DragForce_FL" type="5" data="0.0" description="左前轮阻滞力"/>
<Variable id="DragForce_FR" type="5" data="0.0" description="右前轮阻滞力"/>
<Variable id="DragForce_RL" type="5" data="0.0" description="左后轮阻滞力"/>
<Variable id="DragForce_RR" type="5" data="0.0" description="右后轮阻滞力"/>
<Variable id="count" type="3" data="0" description="用于循环计数"/>
<Variable id="BrakeForce_FL" type="5" data="0.0" description="左前轮制动力"/>
<Variable id="BrakeForce_FR" type="5" data="0.0" description="右前轮制动力"/>
<Variable id="BrakeForce_RL" type="5" data="0.0" description="左后轮制动力"/>
<Variable id="BrakeForce_RR" type="5" data="0.0" description="右后轮制动力"/>
<Variable id="UTG_DragForce_FLFR" type="5" data="0.0" description="前轴阻滞力标称值，前轴重的5%"/>
<Variable id="PedalForceFoot" type="5" data="0.0" description="踏板力，脚刹"/>
<Variable id="DragForceSum_FL" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="DragForceSum_FR" type="5" data="0.0" description="缓存变量，用于求和"/>
<Variable id="UTG_BrakeForce_FA" type="5" data="0.0" description="前轴制动力标称值（包含前轴阻滞力）"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="MaxDiffValue" type="5" data="0.0" description="最大差值"/>
<Variable id="BrakeForceDiff_FA" type="5" data="0.0" description="前轴动平衡"/>
<Variable id="PreValue_FA" type="5" data="0.0" description="前轴制动力占整车质量的百分比"/>
<Variable id="PreValue_DragForce_FL" type="5" data="0.0" description="左前阻滞力占前轴质量的百分比"/>
<Variable id="PreValue_DragForce_FR" type="5" data="0.0" description="右前阻滞力占前轴质量的百分比"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
<Variable id="PedalForceHand" type="5" data="0.0" description="踏板力，手刹"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 前轴制动力检测&quot;"/>
<Variable id="FISeQS_Error" type="3" data="0" description="FISeQS_Error"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="180" right="280" bottom="32"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="180" top="1916" right="280" bottom="1948"/>
<Script></Script></End>
<Activities>
<Activity id="5" ActivityType="3" name="标称值计算">
<Rect left="181" top="102" right="281" bottom="134"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>UTG_BrakeForce_FA = Weight_FA * 0.6;
UTG_DragForce_FLFR = Weight_FA * 0.05;

engine.println("##### UTG_DragForce_FLFR : " .. tostring(UTG_DragForce_FLFR ));
engine.println("##### UTG_BrakeForce_FA : " .. UTG_BrakeForce_FA .. "\n");</Script></Activity>
<Activity id="20" ActivityType="3" name="阻滞力检测">
<Rect left="182" top="581" right="282" bottom="613"/>
<Script>
--[[

if(DragForce_FL &lt;= UTG_DragForce_FLFR)
then
 DragForceSum_FL = DragForceSum_FL + math.abs(DragForce_FL);
end

if(DragForce_FR &lt;= UTG_DragForce_FLFR)
then
 DragForceSum_FR = DragForceSum_FR + math.abs(DragForce_FR);
end

--]]

 DragForceSum_FL = DragForceSum_FL + math.abs(DragForce_FL);
 DragForceSum_FR = DragForceSum_FR + math.abs(DragForce_FR);

 count = count + 1;</Script></Activity>
<Activity id="23" ActivityType="3" name="循环初始化">
<Rect left="181" top="471" right="281" bottom="503"/>
<Script>count = 0;
DragForceSum_FL = 0;
DragForceSum_FR = 0;</Script></Activity>
<Activity id="27" ActivityType="3" name="求平均值">
<Rect left="181" top="631" right="281" bottom="663"/>
<Script>DragForce_FL = DragForceSum_FL / 10;
DragForce_FR = DragForceSum_FR / 10;</Script></Activity>
<Activity id="28" ActivityType="3" name="左前阻滞力">
<Rect left="179" top="707" right="279" bottom="739"/>
<Script>if(DragForce_FL &gt; 0 and DragForce_FL &lt;= UTG_DragForce_FLFR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.println("##### DragForce_FL : " .. DragForce_FL .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_FL)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_FLFR)</Script></Activity>
<Activity id="29" ActivityType="3" name="右前阻滞力">
<Rect left="179" top="764" right="279" bottom="796"/>
<Script>if(DragForce_FR &gt; 0 and DragForce_FR &lt;= UTG_DragForce_FLFR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end
engine.println("##### DragForce_FR : " .. DragForce_FR .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_FR)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_FLFR)</Script></Activity>
<Activity id="30" ActivityType="3" name="循环初始化">
<Rect left="181" top="943" right="281" bottom="975"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>TimeStart = os.time();
LoopRunning = true;
MaxDiffValue = 0.0;</Script></Activity>
<Activity id="33" ActivityType="3" name="制动力检查">
<Rect left="183" top="1202" right="283" bottom="1234"/>
<Script>if(BrakeForce_FA &gt; UTG_BrakeForce_FA) then
 LoopRunning = false;
else
 TimeDiff = os.difftime(os.time(),TimeStart);
 if(TimeDiff &gt; 120) then
  LoopRunning = false;
 end
end</Script></Activity>
<Activity id="35" ActivityType="3" name="踏板测力计">
<Rect left="183" top="1307" right="283" bottom="1339"/>
<Script>if(PedalForceFoot &gt; 0 and PedalForceFoot &lt; 400.0) then
 engine.LastError = 0;
else
 engine.LastError = 1;
end
engine.println("##### PedalForceFoot : " .. PedalForceFoot .. "\n");


engine.StatValue = string.format("%.2f", PedalForceFoot)
engine.StatLower = "0"
engine.StatUpper = "400"

</Script></Activity>
<Activity id="43" ActivityType="3" name="右前制动力">
<Rect left="186" top="1460" right="286" bottom="1492"/>
<Script>if(BrakeForce_FR &gt; 0 and BrakeForce_FR &lt; 5000) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

engine.println("##### BrakeForce_FR: " .. BrakeForce_FR.. " Result : " .. engine.LastError .. "\n");

strBrakeForce_FR = tostring(math.floor(BrakeForce_FR/10))

engine.StatValue = string.format("%.2f", BrakeForce_FR)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="0" type="8" lower="0" upper="5000" unit="N" flags="99"/>
</Activity>
<Activity id="45" ActivityType="3" name="左前制动力">
<Rect left="184" top="1363" right="284" bottom="1395"/>
<Script>if(BrakeForce_FL &gt; 0 and BrakeForce_FL &lt; 8000) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

engine.println("##### BrakeForce_FL : " .. BrakeForce_FL .. " Result : " .. engine.LastError .. "\n");

strBrakeForce_FL = tostring(math.floor(BrakeForce_FL/10))

engine.StatValue = string.format("%.2f", BrakeForce_FL)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script></Activity>
<Activity id="48" ActivityType="3" name="前轴制动力百分比">
<Rect left="186" top="1649" right="286" bottom="1681"/>
<Script>PreValue_FA = BrakeForce_FA / Weight_FA * 100;

if(PreValue_FA &gt; 60) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

engine.println("### PreValue_FA = " .. tostring(PreValue_FA) .. "in range : " .. engine.LastError)

strPreValue_FA = tostring(string.format("%.1f", PreValue_FA))

engine.StatValue = string.format("%.2f", PreValue_FA)
engine.StatLower = "60"
engine.StatUpper = "100"</Script></Activity>
<Activity id="52" ActivityType="3" name="连接踏板力计">
<Rect left="8" top="216" right="108" bottom="248"/>
<TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请连接踏板力测量传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="准备就绪？"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="55" ActivityType="5" name="速度确定">
<Rect left="180" top="361" right="280" bottom="393"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="2.5"/>
<Parameter id="Target_FR" value="2.5"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;前轴2.5km/h&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="56" ActivityType="4" name="路由节点">
<Rect left="744" top="360" right="776" bottom="392"/>
</Activity>
<Activity id="61" ActivityType="4" name="路由节点">
<Rect left="344" top="546" right="376" bottom="578"/>
</Activity>
<Activity id="63" ActivityType="3" name="显示踏板力">
<Rect left="243" top="1132" right="343" bottom="1164"/>
<Line4Text Enable="1" Text="踏板力：&amp;PedalForceFoot N"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="4" name="路由节点">
<Rect left="348" top="1202" right="380" bottom="1234"/>
</Activity>
<Activity id="69" ActivityType="4" name="路由节点">
<Rect left="740" top="1752" right="772" bottom="1784"/>
</Activity>
<Activity id="70" ActivityType="5" name="车速确认BrakeForce FA">
<Rect left="74" top="1847" right="174" bottom="1879"/>
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
<Activity id="72" ActivityType="5" name="毂静止">
<Rect left="181" top="157" right="281" bottom="189"/>
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
<Activity id="73" ActivityType="4" name="路由节点">
<Rect left="742" top="157" right="774" bottom="189"/>
</Activity>
<Activity id="75" ActivityType="13" name="获取阻滞力">
<Rect left="181" top="523" right="281" bottom="555"/>
<Line1Text Enable="1" Text="基础阻滞力"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左前：&amp;DragForce_FL N"/>
<Line4Text Enable="1" Text="右前：&amp;DragForce_FR N"/>
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
<Parameter id="sendMode" value="0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="76" ActivityType="13" name="获取制动力">
<Rect left="180" top="1061" right="280" bottom="1093"/>
<Line2Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FL #R=左前刹车力"/>
<Line3Text Enable="1" Text="#L=bmpbar,0,5000,10,&amp;BrakeForce_FR #R=右前刹车力"/>
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
<Activity id="77" ActivityType="5" name="毂静止BrakeForce FA">
<Rect left="730" top="1844" right="830" bottom="1876"/>
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
<Activity id="79" ActivityType="3" name="挂空挡">
<Rect left="179" top="216" right="279" bottom="248"/>
<Line1Text Enable="1" Text="挂空挡不踩刹车"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="80" ActivityType="3" name="标题设置">
<Rect left="181" top="412" right="281" bottom="444"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" name="缓慢踩刹车">
<Rect left="180" top="1752" right="280" bottom="1784"/>
<Line1Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="83" ActivityType="3" name="前轴制动力差">
<Rect left="182" top="1257" right="282" bottom="1289"/>
<Script>BrakeForceDiff_FA = math.abs(BrakeForce_FL - BrakeForce_FR) / math.max(BrakeForce_FL,BrakeForce_FR) * 100;

if(BrakeForceDiff_FA &gt;= 0 and BrakeForceDiff_FA &lt;= 20) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end

engine.println("### BrakeForce_FL: " .. tostring(BrakeForce_FL))
engine.println("### BrakeForce_FR: " .. tostring(BrakeForce_FR))
engine.println("##### BrakeForceDiff_FA : " .. BrakeForceDiff_FA .. " Result : " .. engine.LastError .. "\n");

strBrakeForceDiff_FA = tostring(string.format("%.1f", BrakeForceDiff_FA))

engine.StatValue = string.format("%.2f", BrakeForceDiff_FA)
engine.StatLower = "0"
engine.StatUpper = tostring(20)</Script></Activity>
<Activity id="85" ActivityType="3" name="请踩脚刹车">
<Rect left="180" top="998" right="280" bottom="1030"/>
<Line1Text Enable="1" Text="请踩脚刹车"/>
<Script></Script></Activity>
<Activity id="86" ActivityType="4" name="路由节点">
<Rect left="743" top="292" right="775" bottom="324"/>
</Activity>
<Activity id="87" ActivityType="4" name="路由节点">
<Rect left="43" top="158" right="75" bottom="190"/>
</Activity>
<Activity id="88" ActivityType="3" name="结果初始化">
<Rect left="181" top="51" right="281" bottom="83"/>
<Script>Result = 0</Script></Activity>
<Activity id="89" ActivityType="3" name="最终结果不合格">
<Rect left="550" top="1753" right="650" bottom="1785"/>
<Script>Result = 1</Script></Activity>
<Activity id="90" ActivityType="4" name="路由节点">
<Rect left="349" top="1060" right="381" bottom="1092"/>
</Activity>
<Activity id="91" ActivityType="3" name="结果不合格">
<Rect left="343" top="708" right="443" bottom="740"/>
<Script>Result = 1</Script></Activity>
<Activity id="92" ActivityType="3" name="结果不合格">
<Rect left="345" top="765" right="445" bottom="797"/>
<Script>Result = 1</Script></Activity>
<Activity id="93" ActivityType="3" name="结果不合格">
<Rect left="348" top="1256" right="448" bottom="1288"/>
<Script>Result = 1</Script></Activity>
<Activity id="94" ActivityType="3" name="结果不合格">
<Rect left="351" top="1362" right="451" bottom="1394"/>
<Script>Result = 1</Script></Activity>
<Activity id="95" ActivityType="3" name="结果不合格">
<Rect left="353" top="1459" right="453" bottom="1491"/>
<Script>Result = 1</Script></Activity>
<Activity id="96" ActivityType="3" name="结果不合格">
<Rect left="356" top="1649" right="456" bottom="1681"/>
<Script>Result = 1</Script></Activity>
<Activity id="98" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="350" top="1306" right="450" bottom="1338"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="115"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForceDiff_FA "/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="99" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="350" top="1408" right="450" bottom="1440"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="112"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_FL"/>
<Parameter id="Unit" value="&quot;10N&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="100" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="353" top="1509" right="453" bottom="1541"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="113"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_FR"/>
<Parameter id="Unit" value="&quot;10N&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="101" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="358" top="1695" right="458" bottom="1727"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="114"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strPreValue_FA"/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="102" ActivityType="3" name="结果不合格">
<Rect left="43" top="1308" right="143" bottom="1340"/>
<Script>Result = 1</Script></Activity>
<Activity id="103" ActivityType="3" name="计算制动力">
<Rect left="95" top="1129" right="195" bottom="1161"/>
<Script>BrakeForce_FL = BrakeForce_FL - DragForce_FL;
BrakeForce_FR = BrakeForce_FR - DragForce_FR;
BrakeForce_RL = BrakeForce_RL - DragForce_RL;
BrakeForce_RR = BrakeForce_RR - DragForce_RR;
BrakeForce_FA = BrakeForce_FL + BrakeForce_FR;
BrakeForce_RA = BrakeForce_RL + BrakeForce_RR;
print("BrakeForce_FL"..tostring(BrakeForce_FL))
print("BrakeForce_FR"..tostring(BrakeForce_FR))
print("BrakeForce_RL"..tostring(BrakeForce_RL))
print("BrakeForce_RR"..tostring(BrakeForce_RR))
print("BrakeForce_FA"..tostring(BrakeForce_FA))
print("BrakeForce_RA"..tostring(BrakeForce_RA))</Script></Activity>
<Activity id="104" ActivityType="3" name="左前阻滞力百分比">
<Rect left="179" top="813" right="279" bottom="845"/>
<Script>PreValue_DragForce_FL = DragForce_FL / Weight_FA * 100;
if(PreValue_DragForce_FL &gt;= 0 and PreValue_DragForce_FL &lt;= 5) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("### PreValue_DragForce_FL= " .. tostring(PreValue_DragForce_FL) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_FL)
engine.StatLower = "0"
engine.StatUpper = "5"</Script></Activity>
<Activity id="105" ActivityType="3" name="右前阻滞力百分比">
<Rect left="181" top="862" right="281" bottom="894"/>
<Script>PreValue_DragForce_FR = DragForce_FR / Weight_FA * 100;
if(PreValue_DragForce_FR &gt;= 0 and PreValue_DragForce_FR &lt;= 5) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("### PreValue_DragForce_FR= " .. tostring(PreValue_DragForce_FR) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_FR)
engine.StatLower = "0"
engine.StatUpper = "5"</Script></Activity>
<Activity id="106" ActivityType="3" name="结果不合格">
<Rect left="348" top="814" right="448" bottom="846"/>
<Script>Result = 1</Script></Activity>
<Activity id="107" ActivityType="3" name="结果不合格">
<Rect left="347" top="861" right="447" bottom="893"/>
<Script>Result = 1</Script></Activity>
<Activity id="108" ActivityType="3" name="前轴制动力总和">
<Rect left="187" top="1571" right="287" bottom="1603"/>
<Script>if(BrakeForce_FA &gt; UTG_BrakeForce_FA) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end

engine.println("##### BrakeForce_FA: " .. BrakeForce_FA.. " Result : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", BrakeForce_FA)
engine.StatLower = tostring(BrakeForce_FA)
engine.StatUpper = "10000"</Script><assessment no="0" type="8" lower="0" upper="5000" unit="N" flags="97"/>
</Activity>
<Activity id="109" ActivityType="3" name="结果不合格">
<Rect left="353" top="1570" right="453" bottom="1602"/>
<Script>Result = 1</Script></Activity>
<Activity id="110" ActivityType="5" name="前轴2.5km/h">
<Rect left="180" top="284" right="280" bottom="316"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="2.5"/>
<Parameter id="speedFR" value="2.5"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="3000"/>
<Parameter id="torqueFR" value="3000"/>
<Parameter id="torqueRL" value="3000"/>
<Parameter id="torqueRR" value="3000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="111" ActivityType="5" name="前轴2.5km/h">
<Rect left="190" top="1834" right="290" bottom="1866"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="false"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="88" type="0">
</Transition>
<Transition StartId="5" EndId="87" type="0">
</Transition>
<Transition StartId="20" EndId="61" type="1">
<Expression>count &lt; 10</Expression></Transition>
<Transition StartId="20" EndId="27" type="0">
</Transition>
<Transition StartId="23" EndId="75" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="28" EndId="91" type="4">
</Transition>
<Transition StartId="29" EndId="104" type="0">
</Transition>
<Transition StartId="29" EndId="92" type="4">
</Transition>
<Transition StartId="30" EndId="85" type="0">
</Transition>
<Transition StartId="33" EndId="66" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="33" EndId="83" type="0">
</Transition>
<Transition StartId="35" EndId="45" type="0">
</Transition>
<Transition StartId="35" EndId="102" type="4">
</Transition>
<Transition StartId="43" EndId="100" type="0">
</Transition>
<Transition StartId="43" EndId="95" type="4">
</Transition>
<Transition StartId="45" EndId="99" type="0">
</Transition>
<Transition StartId="45" EndId="94" type="4">
</Transition>
<Transition StartId="48" EndId="101" type="0">
</Transition>
<Transition StartId="48" EndId="96" type="4">
</Transition>
<Transition StartId="52" EndId="79" type="6">
</Transition>
<Transition StartId="55" EndId="80" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="69" type="0">
</Transition>
<Transition StartId="61" EndId="75" type="0">
</Transition>
<Transition StartId="63" EndId="103" type="0">
</Transition>
<Transition StartId="66" EndId="90" type="0">
</Transition>
<Transition StartId="69" EndId="89" type="0">
</Transition>
<Transition StartId="70" EndId="2" type="0">
</Transition>
<Transition StartId="72" EndId="87" type="1">
<Expression>result == 0</Expression></Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="86" type="0">
</Transition>
<Transition StartId="75" EndId="20" type="0">
</Transition>
<Transition StartId="76" EndId="103" type="0">
</Transition>
<Transition StartId="76" EndId="63" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="79" EndId="110" type="0">
</Transition>
<Transition StartId="80" EndId="23" type="0">
</Transition>
<Transition StartId="81" EndId="111" type="0">
</Transition>
<Transition StartId="83" EndId="98" type="0">
</Transition>
<Transition StartId="83" EndId="93" type="4">
</Transition>
<Transition StartId="85" EndId="76" type="0">
</Transition>
<Transition StartId="86" EndId="56" type="0">
</Transition>
<Transition StartId="87" EndId="52" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="87" EndId="79" type="0">
</Transition>
<Transition StartId="88" EndId="5" type="0">
</Transition>
<Transition StartId="89" EndId="81" type="0">
</Transition>
<Transition StartId="90" EndId="76" type="0">
</Transition>
<Transition StartId="91" EndId="29" type="0">
</Transition>
<Transition StartId="92" EndId="104" type="0">
</Transition>
<Transition StartId="93" EndId="98" type="0">
</Transition>
<Transition StartId="94" EndId="99" type="0">
</Transition>
<Transition StartId="95" EndId="100" type="0">
</Transition>
<Transition StartId="96" EndId="101" type="0">
</Transition>
<Transition StartId="98" EndId="45" type="0">
</Transition>
<Transition StartId="98" EndId="35" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="99" EndId="43" type="0">
</Transition>
<Transition StartId="100" EndId="108" type="0">
</Transition>
<Transition StartId="101" EndId="81" type="0">
</Transition>
<Transition StartId="102" EndId="45" type="0">
</Transition>
<Transition StartId="103" EndId="33" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="104" EndId="106" type="4">
</Transition>
<Transition StartId="105" EndId="107" type="4">
</Transition>
<Transition StartId="105" EndId="30" type="0">
</Transition>
<Transition StartId="106" EndId="105" type="0">
</Transition>
<Transition StartId="107" EndId="30" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="4">
</Transition>
<Transition StartId="108" EndId="48" type="0">
</Transition>
<Transition StartId="109" EndId="48" type="0">
</Transition>
<Transition StartId="110" EndId="55" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="111" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

