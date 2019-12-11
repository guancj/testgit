<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="200" pbltext="DEP808">
<Parameters>
<Variable id="Timeout" type="3" dir="0" data="60" description="超时时间，单位秒"/>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：OK，1：NOK"/>
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
<Variable id="RecvTel" type="8" data="" description="接收报文"/>
<Variable id="isOK" type="11" data="false" description="状态：true=OK，false=NOK"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="440" top="64" right="540" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="440" top="774" right="540" bottom="806"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" name="初始化">
<Rect left="440" top="164" right="540" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="开始进行检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="初始化中..."/>
<Script>TestStationID = "00";</Script></Activity>
<Activity id="9" ActivityType="3" name="成功ROL_Start">
<Rect left="440" top="454" right="540" bottom="486"/>
<Script>Result = 0;
--TestStationID = @38;

TestStationID = engine.UdpHandleVarGet(Handl, "_LASTREVTEL"):sub(39,39):byte()
engine.println("### TestStationID from roller device : " .. tostring(TestStationID))</Script></Activity>
<Activity id="10" ActivityType="3" name="失败ROL_Start">
<Rect left="660" top="394" right="760" bottom="426"/>
<Line3Text Enable="1" Text="执行失败/无服务"/>
<Script>Result = 1;
engine.DialogBackColor = "red";

engine.LastError = 1

engine.Delay(500);</Script></Activity>
<Activity id="13" ActivityType="3" name="超时">
<Rect left="210" top="354" right="310" bottom="386"/>
<Line3Text Enable="1" Text="系统超时"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(200);</Script></Activity>
<Activity id="19" ActivityType="13" name="检查状态ROL_Start">
<Rect left="440" top="394" right="540" bottom="426"/>
<FunctionRef id="IDT_RTS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram" value="RecvTel"/>
<Parameter id="filter" value="&quot;@6==0b?0010?00&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="3" name="统计节点">
<Rect left="440" top="524" right="540" bottom="556"/>
<Script>if(Result == 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.StatValue = "Start IDT";</Script></Activity>
<Activity id="21" ActivityType="13" name="IDT_WaitForServiceFinish">
<Rect left="440" top="314" right="540" bottom="346"/>
<FunctionRef id="IDT_WaitForServiceFinish" model="LibIDT">
<Parameters>
<Parameter id="serviceNum" value="1"/>
<Parameter id="timeOut" value="30"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="revTel"/>
<Parameter id="sendMode" value="0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="22" ActivityType="13" name="IDT_RTS_StartTest_service_1">
<Rect left="440" top="244" right="540" bottom="276"/>
<FunctionRef id="IDT_RTS_StartTest_service_1" model="LibIDT">
<Parameters>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="receiveDatagram" ret="RecvTel"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="23" ActivityType="13" name="IDT_RTS_Fzg_ID_22">
<Rect left="580" top="604" right="680" bottom="636"/>
<FunctionRef id="IDT_RTS_Fzg_ID_22" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ID_Typ" value="2"/>
<Parameter id="IDT_Timeout" value="5"/>
<Parameter id="Vehicle_ID" value="engine.KNR"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="revTel" ret="RecvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="24" ActivityType="3" name="普通节点">
<Rect left="440" top="684" right="540" bottom="716"/>
<Script>engine.Delay(2000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="22" type="0">
</Transition>
<Transition StartId="9" EndId="20" type="0">
</Transition>
<Transition StartId="10" EndId="20" type="0">
</Transition>
<Transition StartId="13" EndId="20" type="0">
</Transition>
<Transition StartId="19" EndId="9" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="19" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="23" type="0">
</Transition>
<Transition StartId="21" EndId="19" type="1">
<Expression>Ret == 1</Expression></Transition>
<Transition StartId="21" EndId="10" type="0">
</Transition>
<Transition StartId="21" EndId="13" type="1">
<Expression>Ret == -2</Expression></Transition>
<Transition StartId="22" EndId="21" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

