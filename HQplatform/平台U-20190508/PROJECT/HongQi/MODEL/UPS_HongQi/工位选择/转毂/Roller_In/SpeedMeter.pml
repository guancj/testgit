<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1605" pbltext="DEP1564" Ecu="EV_DashBoardUDS_ALL">
<Parameters>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x714" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77e" description="CANId"/>
<Variable id="RollerSpeed" type="5" data="0" description="转毂速度"/>
<Variable id="Speed_FL" type="5" data="0.0" description="左前毂的速度"/>
<Variable id="Speed_FR" type="5" data="0.0" description="右前毂的速度"/>
<Variable id="Speed_RL" type="5" data="0.0" description="左后毂的速度"/>
<Variable id="Speed_RR" type="5" data="0.0" description="右后毂的速度"/>
<Variable id="VehicleSpeed" type="3" data="0" description="仪表速度"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 动态曲线 - 40公里对表&quot;"/>
<Variable id="result" type="3" data="0" description="结果：0：OK，1：NOK"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="Timeout" type="3" data="60" description="超时时间，单位秒"/>
<Variable id="Speed_FA" type="5" data="0.0" description="前轴速度"/>
<Variable id="Speed_RA" type="5" data="0.0" description="后轴速度"/>
<Variable id="FISeQS_Error" type="3" data="0" description="FISeQS_Error"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="590" top="44" right="690" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="590" top="814" right="690" bottom="846"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="18" ActivityType="3" flags="0" name="速度比对">
<Rect left="590" top="384" right="690" bottom="416"/>
<Line3Text Enable="1" Text="仪表速速：请保持40 km/h"/>
<Line4Text Enable="1" Text="轮        速：&amp;VehicleSpeed km/h"/>
<Script>--if(VehicleSpeed &gt;= 39.5 and VehicleSpeed &lt;= 40.5 and Speed_RA &gt;= 32.8 and Speed_RA &lt;= 40.0) then
if(Speed_RA &gt;= 32.8 and Speed_RA &lt;= 40.0) then
 LoopRunning = false;
 Result = 0;
 engine.LastError = 0
else
 Result = 1;
engine.LastError = 1
engine.Delay(100);
end
--engine.println("##### MeterSpeed : " .. VehicleSpeed .. "\n");

engine.println("##### Speed Compaire, roller speed : " .. Speed_RA .. "\n");

strSpeed_RA = tostring(math.floor(Speed_RA))

engine.StatValue = string.format("%.2f", Speed_RA)
</Script><assessment no="5" name="DEP1566" type="8" flags="105"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="循环初始化">
<Rect left="590" top="164" right="690" bottom="196"/>
<Line2Text Enable="1" Text="加速至40km/h 并保持"/>
<Line3Text Enable="1" Text="然后按确定！！"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
LoopRunning = true;
TimeStart = os.time();
VehicleSpeed = 40;
Timeout = 90;
engine.LastError = 0</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="是否超时">
<Rect left="590" top="224" right="690" bottom="256"/>
<Script>TimeDiff = os.difftime(os.time(),TimeStart);</Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="224" right="546" bottom="256"/>
</Activity>
<Activity id="27" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="384" right="786" bottom="416"/>
</Activity>
<Activity id="28" ActivityType="13" flags="0" name="读取转毂速度">
<Rect left="590" top="294" right="690" bottom="326"/>
<FunctionRef id="IDT_RTS_GetRollerSpeed" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="rollerSpeedFL" value="0" ret="Speed_FL"/>
<Parameter id="rollerSpeedFR" value="0" ret="Speed_FR"/>
<Parameter id="rollerSpeedRL" value="0" ret="Speed_RL"/>
<Parameter id="rollerSpeedRR" value="0" ret="Speed_RR"/>
<Parameter id="rollerSpeedFront" value="0" ret="Speed_FA"/>
<Parameter id="rollerSpeedRear" value="0" ret="Speed_RA"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="30" ActivityType="5" flags="0" name="检查毂速度">
<Rect left="590" top="684" right="690" bottom="716"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
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
<Activity id="34" ActivityType="3" flags="0" name="设置标题">
<Rect left="590" top="94" right="690" bottom="126"/>
<Line1Text Enable="1" Text="向前行驶"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="清除屏幕">
<Rect left="590" top="734" right="690" bottom="766"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("### END Speed Compaire, roller speed : " .. tostring(Speed_RA));
</Script></Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="224" right="786" bottom="256"/>
</Activity>
<Activity id="37" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="444" right="546" bottom="476"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="缓慢踩刹车">
<Rect left="590" top="564" right="690" bottom="596"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="百分比">
<Rect left="590" top="514" right="690" bottom="546"/>
<Script>strDiffPercent = string.format("%.1f" , math.abs(VehicleSpeed - Speed_RA) * 2.5)

engine.println("### Speed difference precent : " .. tostring(strDiffPercent))</Script></Activity>
<Activity id="50" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="590" top="624" right="690" bottom="656"/>
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
<Parameter id="withEngine" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="34" type="0">
</Transition>
<Transition StartId="18" EndId="27" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="18" EndId="49" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="26" type="1">
<Expression>TimeDiff &gt; Timeout</Expression></Transition>
<Transition StartId="24" EndId="28" type="0">
</Transition>
<Transition StartId="26" EndId="37" type="0">
</Transition>
<Transition StartId="27" EndId="36" type="0">
</Transition>
<Transition StartId="28" EndId="18" type="0">
</Transition>
<Transition StartId="30" EndId="35" type="0">
</Transition>
<Transition StartId="34" EndId="23" type="0">
</Transition>
<Transition StartId="35" EndId="2" type="0">
</Transition>
<Transition StartId="36" EndId="24" type="0">
</Transition>
<Transition StartId="37" EndId="49" type="0">
</Transition>
<Transition StartId="38" EndId="50" type="0">
</Transition>
<Transition StartId="49" EndId="38" type="0">
</Transition>
<Transition StartId="50" EndId="30" type="0">
</Transition>
</Transitions>
</Process>

