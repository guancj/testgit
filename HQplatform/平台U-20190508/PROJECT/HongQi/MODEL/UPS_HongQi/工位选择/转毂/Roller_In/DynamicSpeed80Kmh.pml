<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="203" pbltext="DEP896">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0"/>
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
<Variable id="RollerSpeed" type="5" data="0"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="274" top="19" right="374" bottom="51"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="280" top="635" right="380" bottom="667"/>
<Script></Script></End>
<Activities>
<Activity id="11" ActivityType="3" name="清除屏幕">
<Rect left="276" top="78" right="376" bottom="110"/>
<TitleText Enable="1" Text="加速至100公里"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="3" name="定速巡航检查提示">
<Rect left="403" top="239" right="503" bottom="271"/>
<Line4Text Enable="1" Text="定速巡航检查"/>
<Script></Script></Activity>
<Activity id="14" ActivityType="3" name="普通节点">
<Rect left="276" top="290" right="376" bottom="322"/>
<Line1Text Enable="1" Text="加速至100公理/小时"/>
<Line2Text Enable="1" Text="变档位驾驶"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="15" ActivityType="4" name="路由节点">
<Rect left="309" top="201" right="341" bottom="233"/>
</Activity>
<Activity id="16" ActivityType="13" name="读取转毂速度">
<Rect left="276" top="408" right="376" bottom="440"/>
<FunctionRef id="IDT_RTS_GetRollerSpeed" model="LibIDT">
<Parameters>
<Parameter id="lastRequest" value="&quot;&quot;"/>
<Parameter id="pHndl" value="Handl"/>
<Parameter id="rollerSpeedFL" value="0" ret="rollerSpeedFL"/>
<Parameter id="rollerSpeedFR" value="0" ret="rollerSpeedFR"/>
<Parameter id="rollerSpeedRL" value="0" ret="rollerSpeedRL"/>
<Parameter id="rollerSpeedRR" value="0" ret="rollerSpeedRR"/>
<Parameter id="rollerSpeedFront" value="0" ret="rollerSpeedFront"/>
<Parameter id="rollerSpeedRear" value="0" ret="rollerSpeedRear"/>
<Parameter id="sendMode" value="4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="17" ActivityType="3" name="初始化">
<Rect left="275" top="353" right="375" bottom="385"/>
<Script>LoopRunning = true;
TimeStart = os.time();</Script></Activity>
<Activity id="18" ActivityType="3" name="速度比对">
<Rect left="276" top="466" right="376" bottom="498"/>
<Line3Text Enable="1" Text="速度：&amp;rollerSpeedRear  km/h"/>
<Script>if(rollerSpeedRear &gt;= 90 and rollerSpeedRear &lt;= 110) then
 LoopRunning = false;
elseif os.time() - TimeStart &gt; 180 then
 LoopRunning = false;
else
 engine.Delay(50);
end

engine.println("### rollerSpeedRear 80 : " .. tostring(rollerSpeedRear))</Script></Activity>
<Activity id="19" ActivityType="4" name="路由节点">
<Rect left="446" top="436" right="478" bottom="468"/>
</Activity>
<Activity id="20" ActivityType="3" name="清除屏幕">
<Rect left="279" top="581" right="379" bottom="613"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("### END Speed 100, roller speed : " .. tostring(rollerSpeedRear));</Script></Activity>
<Activity id="21" ActivityType="3" name="统计：速度">
<Rect left="275" top="527" right="375" bottom="559"/>
<Script>if(rollerSpeedRear &gt;= 90 and rollerSpeedRear &lt;= 110) then
 engine.LastError = 0
else
 engine.LastError = 1
end</Script><assessment no="8" name="DEP904" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="5" name="刹车至静止">
<Rect left="135" top="546" right="235" bottom="578"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheckRA">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_Max" value="0"/>
<Parameter id="Target_Min" value="0"/>
<Parameter id="DlgText" value="&quot;松油门，不准摘挡，缓缓停，最后踩制动&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="15" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="17" type="0">
</Transition>
<Transition StartId="15" EndId="12" type="0">
</Transition>
<Transition StartId="16" EndId="18" type="0">
</Transition>
<Transition StartId="17" EndId="16" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="1">
<Expression>LoopRunning</Expression></Transition>
<Transition StartId="18" EndId="21" type="0">
</Transition>
<Transition StartId="19" EndId="16" type="0">
</Transition>
<Transition StartId="20" EndId="2" type="0">
</Transition>
<Transition StartId="21" EndId="20" type="0">
</Transition>
<Transition StartId="26" EndId="20" type="0">
</Transition>
</Transitions>
</Process>

