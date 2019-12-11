<?xml version="1.0" encoding="utf-8" ?>
<Process description="检查转毂速度" flags="1">
<Parameters>
<Variable id="Timeout" type="3" dir="0" data="60" description="超时时间，单位秒"/>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="Target_Max" type="5" dir="0" data="0" description="最大值"/>
<Variable id="Target_Min" type="5" dir="0" data="0" description="最小值"/>
<Variable id="DlgText" type="8" dir="0" data="" description="标题显示文体"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
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
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
<Variable id="Speed_FL" type="5" data="0.0" description="左前毂的速度"/>
<Variable id="Speed_FR" type="5" data="0.0" description="右前毂的速度"/>
<Variable id="Speed_RL" type="5" data="0.0" description="左后毂的速度"/>
<Variable id="Speed_RR" type="5" data="0.0" description="右后毂的速度"/>
<Variable id="LoopRunning" type="11" data="true" description="循环标签"/>
<Variable id="Speed_FA" type="5" data="0.0" description="前轴速度"/>
<Variable id="Speed_RA" type="5" data="0.0" description="后轴速度"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="455" top="26" right="555" bottom="58"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="453" top="563" right="553" bottom="595"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="循环初始化">
<Rect left="455" top="121" right="555" bottom="153"/>
<Line2Text Enable="1" Text="&amp;DlgText"/>
<Script>LoopRunning = true;
TimeStart = os.time();</Script></Activity>
<Activity id="9" ActivityType="3" flags="1" name="速度检查">
<Rect left="455" top="380" right="555" bottom="412"/>
<Script>if(Speed_RA &gt;= Target_Min and Speed_RA &lt;= Target_Max) then
 LoopRunning = false;
 Result = 0;
else
 engine.Delay(50);
end
engine.println("##### Speed : " .. Speed_RA .. "\n");
</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="是否超时">
<Rect left="456" top="205" right="556" bottom="237"/>
<Script>TimeDiff = os.difftime(os.time(),TimeStart);</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="超时">
<Rect left="276" top="380" right="376" bottom="412"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="系统超时"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="18" ActivityType="4" flags="0" name="路由节点">
<Rect left="673" top="297" right="705" bottom="329"/>
</Activity>
<Activity id="19" ActivityType="13" flags="0" name="读取转毂速度">
<Rect left="456" top="292" right="556" bottom="324"/>
<Line3Text Enable="1" Text="&amp;Speed_FA km/h"/>
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
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="12" type="0">
</Transition>
<Transition StartId="9" EndId="18" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="12" EndId="19" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>TimeDiff &gt; Timeout</Expression></Transition>
<Transition StartId="13" EndId="2" type="0">
</Transition>
<Transition StartId="18" EndId="12" type="0">
</Transition>
<Transition StartId="19" EndId="9" type="0">
</Transition>
</Transitions>
</Process>

