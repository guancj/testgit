<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Timeout" type="3" dir="0" data="60" description="超时时间，单位秒"/>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：成功，-1：执行失败"/>
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
<Variable id="Ret" type="3" data="0" description="返回值,0:没有正在被执行的service;1:执行成功;2:service正在执行中;-1:执行失败"/>
<Variable id="TimeStart" type="3" data="0" description="计时器开始"/>
<Variable id="TimeDiff" type="3" data="0" description="时间差"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="456" top="39" right="556" bottom="71"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="460" top="517" right="560" bottom="549"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" name="循环初始化">
<Rect left="455" top="121" right="555" bottom="153"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="停止IDT通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待..."/>
<Script>LoopRunning = true;
TimeStart = os.time();</Script></Activity>
<Activity id="9" ActivityType="3" name="成功">
<Rect left="458" top="402" right="558" bottom="434"/>
<Script>Result = 1;</Script></Activity>
<Activity id="10" ActivityType="3" name="失败">
<Rect left="606" top="337" right="706" bottom="369"/>
<Line4Text Enable="1" Text="执行失败/无服务"/>
<Script>Result = 0;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="12" ActivityType="3" name="是否超时">
<Rect left="456" top="205" right="556" bottom="237"/>
<Script>TimeDiff = os.difftime(os.time(),TimeStart);</Script></Activity>
<Activity id="13" ActivityType="3" name="超时">
<Rect left="276" top="380" right="376" bottom="412"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="系统超时"/>
<Script>Result = 0;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="18" ActivityType="13" name="IDT_RTS_StopTest_service_2">
<Rect left="457" top="271" right="557" bottom="303"/>
<FunctionRef id="IDT_RTS_StopTest_service_2" model="LibIDT">
<Parameters>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="19" ActivityType="13" name="IDT_WaitForServiceFinish">
<Rect left="457" top="336" right="557" bottom="368"/>
<FunctionRef id="IDT_WaitForServiceFinish" model="LibIDT">
<Parameters>
<Parameter id="serviceNum" value="2"/>
<Parameter id="timeOut" value="15"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="revTel" ret="Ret_revTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="3" name="清除屏幕">
<Rect left="459" top="459" right="559" bottom="491"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="12" type="0">
</Transition>
<Transition StartId="9" EndId="20" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="18" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>TimeDiff &gt; Timeout</Expression></Transition>
<Transition StartId="13" EndId="20" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="9" type="1">
<Expression>Ret == 1</Expression></Transition>
<Transition StartId="19" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

