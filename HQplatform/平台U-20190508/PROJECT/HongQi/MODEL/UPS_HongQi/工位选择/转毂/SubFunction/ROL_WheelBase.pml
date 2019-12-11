<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="200" pbltext="DEP808">
<Parameters>
<Variable id="Timeout" type="3" dir="0" data="60" description="超时时间，单位秒"/>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="WheelBase" type="3" dir="0" data="0" description="轴距值"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="width" type="3" dir="0" data="0" description="车宽度"/>
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
<Variable id="RecvTel" type="8" data=""/>
<Variable id="isOK" type="11" data="false" description="状态：true=OK，false=NOK"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="456" top="39" right="556" bottom="71"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="457" top="681" right="557" bottom="713"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" name="初始化">
<Rect left="455" top="121" right="555" bottom="153"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="轴距调整"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待..."/>
<Script></Script></Activity>
<Activity id="9" ActivityType="3" name="成功ROL_WheelBase">
<Rect left="458" top="477" right="558" bottom="509"/>
<Script>Result = 0;</Script></Activity>
<Activity id="10" ActivityType="3" name="失败ROL_WheelBase">
<Rect left="865" top="351" right="965" bottom="383"/>
<Line4Text Enable="1" Text="执行失败/无服务"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="13" ActivityType="3" name="超时">
<Rect left="240" top="354" right="340" bottom="386"/>
<Line4Text Enable="1" Text="系统超时"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="19" ActivityType="13" name="IDT_RTS_service_4">
<Rect left="456" top="298" right="556" bottom="330"/>
<FunctionRef id="IDT_RTS_service_4" model="LibIDT">
<Parameters>
<Parameter id="wheelbase" value="WheelBase"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="13" name="IDT_RTS_State_actual">
<Rect left="458" top="408" right="558" bottom="440"/>
<FunctionRef id="IDT_RTS_State_actual" model="LibIDT">
<Parameters>
<Parameter id="filter" value="&quot;@10==0b???0000?&quot;"/>
<Parameter id="receiveDatagram" ret="RecvTel"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="23" ActivityType="3" name="车辆未放下">
<Rect left="628" top="475" right="728" bottom="507"/>
<Line4Text Enable="1" Text="车辆未放下"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="24" ActivityType="4" name="路由节点">
<Rect left="896" top="581" right="928" bottom="613"/>
</Activity>
<Activity id="25" ActivityType="4" name="路由节点">
<Rect left="269" top="581" right="301" bottom="613"/>
</Activity>
<Activity id="26" ActivityType="3" name="统计节点">
<Rect left="457" top="581" right="557" bottom="613"/>
<Script>if(Result == 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.StatValue = "Wheel Base";</Script><assessment no="8" name="DEP816" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="13" name="IDT_WaitForServiceFinish">
<Rect left="457" top="348" right="557" bottom="380"/>
<FunctionRef id="IDT_WaitForServiceFinish" model="LibIDT">
<Parameters>
<Parameter id="serviceNum" value="4"/>
<Parameter id="timeOut" value="30"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="revTel"/>
<Parameter id="sendMode" value="0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="29" ActivityType="3" name="普通节点">
<Rect left="460" top="204" right="560" bottom="236"/>
<Script>engine.Delay(1000);</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="29" type="0">
</Transition>
<Transition StartId="9" EndId="26" type="0">
</Transition>
<Transition StartId="10" EndId="24" type="0">
</Transition>
<Transition StartId="13" EndId="25" type="0">
</Transition>
<Transition StartId="19" EndId="27" type="0">
</Transition>
<Transition StartId="20" EndId="9" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="20" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="26" type="0">
</Transition>
<Transition StartId="24" EndId="26" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="2" type="0">
</Transition>
<Transition StartId="27" EndId="20" type="1">
<Expression>Ret == 1</Expression></Transition>
<Transition StartId="27" EndId="10" type="0">
</Transition>
<Transition StartId="27" EndId="13" type="1">
<Expression>Ret == -2</Expression></Transition>
<Transition StartId="29" EndId="19" type="0">
</Transition>
</Transitions>
</Process>

