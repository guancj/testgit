<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="pHndl" type="3" dir="0" data="-1" description="通讯句柄"/>
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
<Variable id="toggleCounter" type="3" data="0" description="toggleCounter 计数"/>
<Variable id="lastSndTel" type="8" data="&quot;&quot;" description="lastSndTel"/>
<Variable id="lastRevTel" type="8" data="&quot;&quot;" description="lastRevTel"/>
<Variable id="toggleTel" type="8" data="&quot;&quot;" description="toggleTel"/>
<Variable id="QUITE" type="11" data="false" description="是否退出循环"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="386" top="32" right="486" bottom="64"/>
<Script>engine.Delay(1000)</Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="382" top="938" right="482" bottom="970"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" name="判断通讯端口有效">
<Rect left="385" top="157" right="485" bottom="189"/>
<Script>engine.LastError = 0

if pHndl &lt; 0 then
    engine.println("IDT_Toggling, input idt handl is invalid, pHandl : " .. tostring(pHandl));
    engine.LastError = -1;
end</Script></Activity>
<Activity id="4" ActivityType="4" name="路由节点">
<Rect left="664" top="156" right="696" bottom="188"/>
</Activity>
<Activity id="5" ActivityType="3" name="获取ToggleCounter">
<Rect left="387" top="344" right="487" bottom="376"/>
<Script>toggleCounter = engine.UdpHandleVarGet(pHndl, "_TOGGLECOUNTER");
if toggleCounter == nil then
    engine.println("IDT_Toggling, _TOGGLECOUNTER reset to 0 !")
    toggleCounter = 0;
end</Script></Activity>
<Activity id="6" ActivityType="3" name="获取上一次发送报文">
<Rect left="387" top="410" right="487" bottom="442"/>
<Script>lastSndTel = engine.UdpHandleVarGet(pHndl, "_LASTSNDTEL");
if lastSndTel == nil then
    lastSndTel = LibIDT.idtInitRequest(pHndl)
end

lastRevTel = engine.UdpHandleVarGet(pHndl, "_LASTREVTEL");
local zero = "\x00"
if lastRevTel == nil then
    lastRevTel = zero:rep(44);
end
</Script></Activity>
<Activity id="7" ActivityType="3" name="初始化toggle报文">
<Rect left="386" top="469" right="486" bottom="501"/>
<Script>toggleTel = lastSndTel;</Script></Activity>
<Activity id="10" ActivityType="13" name="Service字节使用00">
<Rect left="237" top="469" right="337" bottom="501"/>
<FunctionRef id="idtSetBytes">
<Parameters>
<Parameter id="request" value="toggleTel"/>
<Parameter id="pos" value="2"/>
<Parameter id="nByte" value="1"/>
<Parameter id="modifyBytes" value="&quot;\x00&quot;"/>
<Parameter id="ret" ret="toggleTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" name="设置togglebyte">
<Rect left="385" top="533" right="485" bottom="565"/>
<Script>toggleTel = LibIDT.idtSetBytes(toggleTel,4,1,lastRevTel:sub(12,12))</Script></Activity>
<Activity id="15" ActivityType="4" name="路由节点">
<Rect left="126" top="810" right="158" bottom="842"/>
</Activity>
<Activity id="16" ActivityType="4" name="路由节点">
<Rect left="125" top="156" right="157" bottom="188"/>
</Activity>
<Activity id="17" ActivityType="3" name="检测退出标识">
<Rect left="383" top="809" right="483" bottom="841"/>
<Script>QUITE = engine.UdpHandleVarGet(pHndl, "_FINISHFLAG");
if nil == QUITE then
    QUITE = false;
end</Script></Activity>
<Activity id="18" ActivityType="4" name="路由节点">
<Rect left="665" top="937" right="697" bottom="969"/>
</Activity>
<Activity id="19" ActivityType="3" name="Deay">
<Rect left="91" top="473" right="191" bottom="505"/>
<Script>engine.Delay(31);</Script></Activity>
<Activity id="20" ActivityType="13" name="idtToggleDataExchange">
<Rect left="384" top="600" right="484" bottom="632"/>
<FunctionRef id="idtToggleDataExchange">
<Parameters>
<Parameter id="request" value="toggleTel"/>
<Parameter id="timeout" value="1"/>
<Parameter id="pHndl" value="pHndl"/>
<Parameter id="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="3" name="互斥锁定IDT_GENERAL_SEMAPHORE">
<Rect left="386" top="222" right="486" bottom="254"/>
<Script>engine.MutexOpen("IDT_GENERAL_SEMAPHORE" .. tostring(pHndl))
engine.MutexWait("IDT_GENERAL_SEMAPHORE" .. tostring(pHndl),-1)</Script></Activity>
<Activity id="22" ActivityType="3" name="互斥解锁IDT_GENERAL_SEMAPHORE">
<Rect left="384" top="744" right="484" bottom="776"/>
<Script>engine.MutexRelease("IDT_GENERAL_SEMAPHORE" .. tostring(pHndl))</Script></Activity>
<Activity id="23" ActivityType="3" name="DEBUG Into Toggle">
<Rect left="386" top="94" right="486" bottom="126"/>
<Script>engine.println("### Start Toggling ...");
toggleStepXcount = 0             -- 同步错位计数</Script></Activity>
<Activity id="24" ActivityType="3" name="ToggleFinished">
<Rect left="383" top="877" right="483" bottom="909"/>
<Script>engine.println("### Stop toggling");</Script></Activity>
<Activity id="25" ActivityType="3" name="获取上一次发送报文">
<Rect left="383" top="667" right="483" bottom="699"/>
<Script>lastSndTel = engine.UdpHandleVarGet(pHndl, "_LASTSNDTEL");
if lastSndTel == nil then
    lastSndTel = LibIDT.idtInitRequest(pHndl)
end

lastRevTel = engine.UdpHandleVarGet(pHndl, "_LASTREVTEL");
local zero = "\x00"
if lastRevTel == nil then
    lastRevTel = zero:rep(44);
end
</Script></Activity>
<Activity id="26" ActivityType="3" name="检测退出标识">
<Rect left="537" top="666" right="637" bottom="698"/>
<Script>QUITE = engine.UdpHandleVarGet(pHndl, "_FINISHFLAG");
if nil == QUITE then
    QUITE = false;
end</Script></Activity>
<Activity id="27" ActivityType="3" name="同步监测">
<Rect left="537" top="345" right="637" bottom="377"/>
<Script>toggleStepXcount = toggleStepXcount + 1 
engine.println("&lt;IDT_Toggling&gt; 同步监测计数：" .. tostring(toggleStepXcount))

</Script></Activity>
<Activity id="28" ActivityType="3" name="退出">
<Rect left="537" top="878" right="637" bottom="910"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" name="同步计数初始化">
<Rect left="387" top="283" right="487" bottom="315"/>
<Script>toggleStepXcount = 0             -- 同步错位计数</Script></Activity>
<Activity id="30" ActivityType="3" name="服务切换">
<Rect left="237" top="534" right="337" bottom="566"/>
<Script>engine.println("&lt;IDT_Toggling&gt; 服务切换 xx - 00")</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="23" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="4">
</Transition>
<Transition StartId="3" EndId="21" type="0">
</Transition>
<Transition StartId="4" EndId="18" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="12" type="0">
</Transition>
<Transition StartId="7" EndId="10" type="1">
<Expression>lastRevTel:sub(2,2) == "\x01" and lastSndTel:sub(2,2) ~= "\x00"</Expression></Transition>
<Transition StartId="10" EndId="30" type="0">
</Transition>
<Transition StartId="12" EndId="20" type="0">
</Transition>
<Transition StartId="15" EndId="19" type="0">
</Transition>
<Transition StartId="16" EndId="3" type="0">
</Transition>
<Transition StartId="17" EndId="15" type="1">
<Expression>QUITE == false</Expression></Transition>
<Transition StartId="17" EndId="24" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="0">
</Transition>
<Transition StartId="19" EndId="16" type="0">
</Transition>
<Transition StartId="20" EndId="25" type="0">
</Transition>
<Transition StartId="21" EndId="29" type="0">
</Transition>
<Transition StartId="22" EndId="17" type="0">
</Transition>
<Transition StartId="23" EndId="3" type="0">
</Transition>
<Transition StartId="24" EndId="2" type="0">
</Transition>
<Transition StartId="25" EndId="22" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="1">
<Expression>lastRevTel:sub(2,2) == "\x01" and lastSndTel:sub(2,2) == "\x00"</Expression></Transition>
<Transition StartId="26" EndId="27" type="1">
<Expression>QUITE == false</Expression></Transition>
<Transition StartId="26" EndId="28" type="0">
</Transition>
<Transition StartId="27" EndId="5" type="0">
</Transition>
<Transition StartId="28" EndId="24" type="0">
</Transition>
<Transition StartId="29" EndId="5" type="0">
</Transition>
<Transition StartId="30" EndId="12" type="0">
</Transition>
</Transitions>
</Process>

