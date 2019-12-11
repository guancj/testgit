<?xml version="1.0" encoding="utf-8" ?>
<Process description="检查byte6结果：&#13;&#10;1）是否是自动模式&#13;&#10;2）是否存在故障&#13;&#10;3）是否是急停状态&#13;&#10;4）转毂台是否准备好进行检测&#13;&#10;如出现以上错误，屏幕背景变红。" flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="pHndl" type="3" dir="0" data="0" description="通讯句柄"/>
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
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="280" top="14" right="380" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="280" top="254" right="380" bottom="286"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IDT_FAS_State_store">
<Rect left="280" top="84" right="380" bottom="116"/>
<FunctionRef id="IDT_FAS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram"/>
<Parameter id="filter" value="&quot;@6==0b1001??00&quot;"/>
<Parameter id="pHndl" value="pHndl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="延时50ms">
<Rect left="430" top="84" right="530" bottom="116"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="5" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="164" right="496" bottom="196"/>
</Activity>
<Activity id="7" ActivityType="3" flags="1" name="ErrorMonitor_Nok">
<Rect left="280" top="174" right="380" bottom="206"/>
<Script>if (isOK == false) then
	print("Quit SWE ErrorMonitor  isOK false")
        engine.UdpHandleVarSet(pHndl, "_FINISHFLAG",true) 
	engine.LastError = 1
        engine.StatValue = " ErrorMonitor  false"
end

if(engine.SharedVarGet("_ProcessOK") == 1)then
	engine.UdpHandleVarSet(pHndl, "_FINISHFLAG",true) 
        engine.LastError = 0
        engine.StatValue = " ErrorMonitor  true"
	print("Quit SWE ErrorMonitor _FINISHFLAG true")
end
 
 </Script><assessment no="8" name="DEP1294" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>isOK == true and engine.SharedVarGet("_ProcessOK") == 0 and engine.UdpHandleVarGet(pHndl, "_FINISHFLAG") == false</Expression></Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="3" type="0">
</Transition>
<Transition StartId="7" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

