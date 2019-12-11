<?xml version="1.0" encoding="utf-8" ?>
<Process description="控制模式：范围0~7&#13;&#10;0：自由轮&#13;&#10;1：前轴模式&#13;&#10;2：后轴模式&#13;&#10;3：四驱（前轴耦合+后轴耦合）&#13;&#10;4：静态制动力检测/轮速传感器测试&#13;&#10;5：动态测试1（灵活测试）&#13;&#10;6：动态测试2（刹车时所有轮速度相同）&#13;&#10;7：保持（转速=0）" flags="1" block="5" ptbtext="DEP807" group="200" pbltext="DEP808">
<Parameters>
<Variable id="Timeout" type="3" dir="0" data="60" description="超时时间，单位秒"/>
<Variable id="Result" type="3" dir="1" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="withEngine" type="11" dir="0" data="" description="with engine,设置发送报文中第3字节的第2bit位"/>
<Variable id="driveEngine" type="11" dir="0" data="" description="设置发送报文中第5字节的第2bit位"/>
<Variable id="exhaustAbove" type="11" dir="0" data="" description="尾气罩是否升起，设置发送报文中第5字节的第8bit位"/>
<Variable id="modeControl" type="3" dir="0" data="0" description="模式控制，设置发送报文中第6字节值，范围0-7"/>
<Variable id="rearSecurity" type="11" dir="0" data="" description="后轴安全模式,用第11字节的第2bit为表示"/>
<Variable id="speedFL" type="5" dir="0" data="0" description="左前毂速度,单位km/h"/>
<Variable id="speedFR" type="5" dir="0" data="0" description="右前毂速度,单位km/h"/>
<Variable id="speedRL" type="5" dir="0" data="0" description="左后毂速度,单位km/h"/>
<Variable id="speedRR" type="5" dir="0" data="0" description="右后毂速度,单位km/h"/>
<Variable id="torqueFL" type="3" dir="0" data="0" description="左前毂扭矩"/>
<Variable id="torqueFR" type="3" dir="0" data="0" description="右前毂扭矩"/>
<Variable id="torqueRL" type="3" dir="0" data="0" description="左后毂扭矩"/>
<Variable id="torqueRR" type="3" dir="0" data="0" description="右后毂扭矩"/>
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
<Variable id="RecvTel" type="8" data=""/>
<Variable id="modeFilter" type="8" data=""/>
<Variable id="isOK" type="11" data="false" description="状态：true=OK，false=NOK"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="460" top="138" right="560" bottom="170"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="457" top="707" right="557" bottom="739"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" name="循环初始化">
<Rect left="459" top="203" right="559" bottom="235"/>
<Line2Text Enable="1" Text="驾驶模式设置"/>
<Line4Text Enable="1" Text="请等待..."/>
<Script>LoopRunning = true;
TimeStart = os.time();</Script></Activity>
<Activity id="9" ActivityType="3" name="成功">
<Rect left="457" top="524" right="557" bottom="556"/>
<Script>Result = 0;</Script></Activity>
<Activity id="10" ActivityType="3" name="失败">
<Rect left="721" top="320" right="821" bottom="352"/>
<Line4Text Enable="1" Text="执行失败/无服务"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="13" ActivityType="3" name="超时">
<Rect left="290" top="320" right="390" bottom="352"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);</Script></Activity>
<Activity id="20" ActivityType="13" name="IDT_RTS_DriveActuators_service_3">
<Rect left="459" top="258" right="559" bottom="290"/>
<FunctionRef id="IDT_RTS_DriveActuators_service_3" model="LibIDT">
<Parameters>
<Parameter id="withEngine" value="withEngine"/>
<Parameter id="driveEngine" value="driveEngine"/>
<Parameter id="exhaustAbove" value="exhaustAbove"/>
<Parameter id="modeControl" value="modeControl"/>
<Parameter id="rearSecurity" value="rearSecurity"/>
<Parameter id="speedFL" value="speedFL"/>
<Parameter id="speedFR" value="speedFR"/>
<Parameter id="speedRL" value="speedRL"/>
<Parameter id="speedRR" value="speedRR"/>
<Parameter id="torqueFL" value="torqueFL"/>
<Parameter id="torqueFR" value="torqueFR"/>
<Parameter id="torqueRL" value="torqueRL"/>
<Parameter id="torqueRR" value="torqueRR"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="13" name="传动模式">
<Rect left="458" top="445" right="558" bottom="477"/>
<FunctionRef id="IDT_RTS_State_actual" model="LibIDT">
<Parameters>
<Parameter id="filter" value="modeFilter"/>
<Parameter id="receiveDatagram" ret="RecvTel"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="22" ActivityType="4" name="路由节点">
<Rect left="755" top="611" right="787" bottom="643"/>
</Activity>
<Activity id="23" ActivityType="4" name="路由节点">
<Rect left="323" top="613" right="355" bottom="645"/>
</Activity>
<Activity id="28" ActivityType="3" name="模式错误">
<Rect left="604" top="445" right="704" bottom="477"/>
<Line4Text Enable="1" Text="传动模式错误"/>
<Script>Result = 1;
engine.DialogBackColor = "red";
engine.Delay(500);
engine.StatValue = "Drive Mode Error : " .. tostring(modeControl);</Script><assessment no="9" name="DEP817" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" name="普通节点">
<Rect left="458" top="380" right="558" bottom="412"/>
<Script>if(modeControl == 0) then
 modeFilter = "@7==0b00000000";
end

if(modeControl == 1) then
 modeFilter = "@7==0b00000001";
end

if(modeControl == 2) then
 modeFilter = "@7==0b00000010";
end

if(modeControl == 3) then
 modeFilter = "@7==0b00000011";
end

if(modeControl == 4) then
 modeFilter = "@7==0b00000100";
end

if(modeControl == 5) then
 modeFilter = "@7==0b00000101";
end

if(modeControl == 6) then
 modeFilter = "@7==0b00000110";
end

if(modeControl == 7) then
 modeFilter = "@7==0b00000111";
end</Script></Activity>
<Activity id="31" ActivityType="3" name="统计节点">
<Rect left="457" top="612" right="557" bottom="644"/>
<Script>if(Result == 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
end
engine.StatValue = "Drive Mode Reslut : " .. Result;</Script><assessment no="9" name="DEP817" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="13" name="IDT_WaitForServiceFinish">
<Rect left="458" top="320" right="558" bottom="352"/>
<FunctionRef id="IDT_WaitForServiceFinish" model="LibIDT">
<Parameters>
<Parameter id="serviceNum" value="3"/>
<Parameter id="timeOut" value="Timeout"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="ret" value="0" ret="Ret"/>
<Parameter id="revTel"/>
<Parameter id="sendMode" value="0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="35" ActivityType="4" name="路由节点">
<Rect left="754" top="446" right="786" bottom="478"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="20" type="0">
</Transition>
<Transition StartId="9" EndId="31" type="0">
</Transition>
<Transition StartId="10" EndId="35" type="0">
</Transition>
<Transition StartId="13" EndId="23" type="0">
</Transition>
<Transition StartId="20" EndId="34" type="0">
</Transition>
<Transition StartId="21" EndId="9" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="21" EndId="28" type="0">
</Transition>
<Transition StartId="22" EndId="31" type="0">
</Transition>
<Transition StartId="23" EndId="31" type="0">
</Transition>
<Transition StartId="28" EndId="35" type="0">
</Transition>
<Transition StartId="30" EndId="21" type="0">
</Transition>
<Transition StartId="31" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="30" type="1">
<Expression>Ret == 1</Expression></Transition>
<Transition StartId="34" EndId="10" type="0">
</Transition>
<Transition StartId="34" EndId="13" type="1">
<Expression>Ret == -2</Expression></Transition>
<Transition StartId="35" EndId="22" type="0">
</Transition>
</Transitions>
</Process>

