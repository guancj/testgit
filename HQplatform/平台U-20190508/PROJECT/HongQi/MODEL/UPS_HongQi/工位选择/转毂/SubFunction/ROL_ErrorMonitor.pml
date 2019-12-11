<?xml version="1.0" encoding="utf-8" ?>
<Process description="检查byte6结果：&#13;&#10;1）是否是自动模式&#13;&#10;2）是否存在故障&#13;&#10;3）是否是急停状态&#13;&#10;4）转毂台是否准备好进行检测&#13;&#10;如出现以上错误，屏幕背景变红，等待500毫秒后退出。" flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="AutoMode" type="11" dir="0" data="true" description="是否监控运行模式，true是，false否"/>
<Variable id="Error" type="11" dir="0" data="true" description="是否监控故障，true是，false否"/>
<Variable id="Emergency" type="11" dir="0" data="true" description="是否监控急停，true是，false否"/>
<Variable id="Ready" type="11" dir="0" data="true" description="是否监控准备好状态，true是，false否"/>
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
<Variable id="finishflag" type="11" data="" description="true??,false??"/>
<Variable id="IDTAnswer" type="8" data="" description="??????"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="121" right="221" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="279" top="550" right="379" bottom="582"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="非自动模式">
<Rect left="644" top="95" right="744" bottom="127"/>
<TitleText Enable="1" Text="非自动模式  缓缓踩刹车 停车"/>
<Line1Text Enable="1" Text="非自动模式  缓缓踩刹车 停车"/>
<Line2Text Enable="1" Text="非自动模式  缓缓踩刹车 停车"/>
<Line3Text Enable="1" Text="非自动模式  缓缓踩刹车 停车"/>
<Line4Text Enable="1" Text="非自动模式  缓缓踩刹车 停车"/>
<Script>engine.println("##### Error: 非自动模式 \n");

engine.StatValue = "RTS ERROR : No auto mode"
engine.LastError = 1</Script><assessment no="2" name="DEP1451" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="故障">
<Rect left="647" top="180" right="747" bottom="212"/>
<TitleText Enable="1" Text="故障 缓缓踩刹车 停车"/>
<Line1Text Enable="1" Text="故障 缓缓踩刹车 停车"/>
<Line2Text Enable="1" Text="故障 缓缓踩刹车 停车"/>
<Line3Text Enable="1" Text="故障 缓缓踩刹车 停车"/>
<Line4Text Enable="1" Text="故障 缓缓踩刹车 停车"/>
<Script>engine.println("##### Error: 故障 \n");

engine.StatValue = "RTS ERROR : Error"
engine.LastError = 1</Script><assessment no="3" name="DEP1452" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="急停">
<Rect left="647" top="257" right="747" bottom="289"/>
<TitleText Enable="1" Text="急停  缓缓踩刹车 停车"/>
<Line1Text Enable="1" Text="急停  缓缓踩刹车 停车"/>
<Line2Text Enable="1" Text="急停  缓缓踩刹车 停车"/>
<Line3Text Enable="1" Text="急停  缓缓踩刹车 停车"/>
<Line4Text Enable="1" Text="急停  缓缓踩刹车 停车"/>
<Script>engine.println("##### Error: 急停 \n");

engine.StatValue = "RTS ERROR : Error Emergency Off"
engine.LastError = 1</Script><assessment no="4" name="DEP1453" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="未准备好ROL_ErrorMonitor">
<Rect left="650" top="347" right="750" bottom="379"/>
<TitleText Enable="1" Text="未准备好 缓缓踩刹车 停车"/>
<Line1Text Enable="1" Text="未准备好 缓缓踩刹车 停车"/>
<Line2Text Enable="1" Text="未准备好 缓缓踩刹车 停车"/>
<Line3Text Enable="1" Text="未准备好 缓缓踩刹车 停车"/>
<Line4Text Enable="1" Text="未准备好 缓缓踩刹车 停车"/>
<Script>engine.println("##### Error: 转毂未准备好 \n");

engine.StatValue = "RTS ERROR : Roller Not Ready"
engine.LastError = 1</Script><assessment no="5" name="DEP1454" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="设置结束标志">
<Rect left="846" top="229" right="946" bottom="261"/>
<Script>engine.DialogBackColor = "red";
engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true);</Script></Activity>
<Activity id="16" ActivityType="4" flags="0" name="运行模式">
<Rect left="314" top="93" right="346" bottom="125"/>
</Activity>
<Activity id="17" ActivityType="4" flags="0" name="故障">
<Rect left="314" top="181" right="346" bottom="213"/>
</Activity>
<Activity id="18" ActivityType="4" flags="0" name="急停">
<Rect left="315" top="256" right="347" bottom="288"/>
</Activity>
<Activity id="19" ActivityType="4" flags="0" name="准备状态">
<Rect left="314" top="346" right="346" bottom="378"/>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="IDT_ALS_State_store">
<Rect left="451" top="94" right="551" bottom="126"/>
<FunctionRef id="IDT_ALS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram"/>
<Parameter id="filter" value="&quot;@6==0b?001????&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="22" ActivityType="13" flags="0" name="IDT_ALS_State_store">
<Rect left="450" top="181" right="550" bottom="213"/>
<FunctionRef id="IDT_ALS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram"/>
<Parameter id="filter" value="&quot;@6==0b??????0?&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="23" ActivityType="13" flags="0" name="IDT_ALS_State_store">
<Rect left="456" top="346" right="556" bottom="378"/>
<FunctionRef id="IDT_ALS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram"/>
<Parameter id="filter" value="&quot;@6==0b1???????&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="24" ActivityType="13" flags="0" name="IDT_ALS_State_store">
<Rect left="454" top="256" right="554" bottom="288"/>
<FunctionRef id="IDT_ALS_State_store" model="LibIDT">
<Parameters>
<Parameter id="lastDatagram"/>
<Parameter id="filter" value="&quot;@6==0b???????0&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="isOK" value="0" ret="isOK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="25" ActivityType="4" flags="0" name="路由节点">
<Rect left="879" top="549" right="911" bottom="581"/>
</Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="879" top="1" right="911" bottom="33"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="CheckFINISHEDFLAG_ROL_ErrorMonitor">
<Rect left="120" top="93" right="220" bottom="125"/>
<Script>finishflag = engine.UdpHandleVarGet(Handl, "_FINISHFLAG");</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="Delay">
<Rect left="119" top="443" right="219" bottom="475"/>
<Script>engine.Delay(200);</Script></Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="313" top="443" right="345" bottom="475"/>
</Activity>
<Activity id="32" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="93" right="66" bottom="125"/>
</Activity>
<Activity id="33" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="551" right="66" bottom="583"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="普通节点">
<Rect left="618" top="428" right="718" bottom="460"/>
<Script></Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="统计重置">
<Rect left="120" top="44" right="220" bottom="76"/>
<Script>engine.LastError = 0</Script></Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="344" right="406" bottom="376"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="26" type="1">
<Expression>Handl == nil</Expression></Transition>
<Transition StartId="1" EndId="35" type="0">
</Transition>
<Transition StartId="4" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="15" type="0">
</Transition>
<Transition StartId="8" EndId="15" type="0">
</Transition>
<Transition StartId="10" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="25" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="16" EndId="21" type="1">
<Expression>AutoMode</Expression></Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="17" EndId="22" type="1">
<Expression>Error</Expression></Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="18" EndId="24" type="1">
<Expression>Emergency</Expression></Transition>
<Transition StartId="19" EndId="31" type="0">
</Transition>
<Transition StartId="21" EndId="17" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="21" EndId="4" type="1">
<Expression>not isOK</Expression></Transition>
<Transition StartId="22" EndId="18" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="22" EndId="6" type="1">
<Expression>not isOK</Expression></Transition>
<Transition StartId="23" EndId="10" type="1">
<Expression>not isOK</Expression></Transition>
<Transition StartId="23" EndId="31" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="24" EndId="8" type="1">
<Expression>not isOK</Expression></Transition>
<Transition StartId="24" EndId="19" type="1">
<Expression>isOK</Expression></Transition>
<Transition StartId="25" EndId="2" type="0">
</Transition>
<Transition StartId="26" EndId="15" type="0">
</Transition>
<Transition StartId="29" EndId="16" type="0">
</Transition>
<Transition StartId="29" EndId="32" type="1">
<Expression>finishflag</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="31" EndId="30" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="2" type="0">
</Transition>
<Transition StartId="34" EndId="23" type="1">
<Expression>Ready</Expression></Transition>
<Transition StartId="35" EndId="29" type="0">
</Transition>
<Transition StartId="36" EndId="23" type="1">
<Expression>Ready</Expression></Transition>
</Transitions>
</Process>

