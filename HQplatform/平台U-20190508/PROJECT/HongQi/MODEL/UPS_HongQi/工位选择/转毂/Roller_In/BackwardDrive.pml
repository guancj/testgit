<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="203" pbltext="DEP896">
<Parameters>
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
<Variable id="TitleText" type="8" data="&quot;转毂中 - 动态曲线 - 倒车检测&quot;"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="74" top="23" right="174" bottom="55"/>
<Script></Script><TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="67" top="795" right="167" bottom="827"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" name="请倒车">
<Rect left="74" top="131" right="174" bottom="163"/>
<Line1Text Enable="1" Text="请倒车"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" name="倒车报警">
<Rect left="202" top="186" right="302" bottom="218"/>
<Line2Text Enable="1" Text="倒车报警"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="OK？"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="5" ActivityType="3" name="倒车灯">
<Rect left="73" top="292" right="173" bottom="324"/>
<Line2Text Enable="1" Text="倒车灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="OK？"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="6" ActivityType="3" name="倒车影像">
<Rect left="200" top="433" right="300" bottom="465"/>
<Line2Text Enable="1" Text="倒车影像"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="OK？"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="7" ActivityType="5" name="倒车模式">
<Rect left="349" top="50" right="449" bottom="82"/>
<SubProcesses>
<SubProcess id="ROL_DriveMode">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="withEngine" value="false"/>
<Parameter id="driveEngine" value="false"/>
<Parameter id="exhaustAbove" value="true"/>
<Parameter id="modeControl" value="1"/>
<Parameter id="rearSecurity" value="true"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="5" name="毂静止">
<Rect left="353" top="103" right="453" bottom="135"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheck">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_FL" value="0"/>
<Parameter id="Target_FR" value="0"/>
<Parameter id="Target_RL" value="0"/>
<Parameter id="Target_RR" value="0"/>
<Parameter id="DlgText" value="&quot;请确认转毂静止&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="10" ActivityType="5" name="速度检查">
<Rect left="70" top="591" right="170" bottom="623"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheckFA">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_Max" value="-5"/>
<Parameter id="Target_Min" value="-15"/>
<Parameter id="DlgText" value="&quot;倒车加速至5km/h&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="11" ActivityType="3" name="屏幕清理">
<Rect left="72" top="538" right="172" bottom="570"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="5" name="刹车至停">
<Rect left="69" top="693" right="169" bottom="725"/>
<SubProcesses>
<SubProcess id="ROL_SpeedCheckRA">
<Parameters>
<Parameter id="Timeout" value="60"/>
<Parameter id="Result" value="0" ret="result"/>
<Parameter id="Target_Max" value="1.0"/>
<Parameter id="Target_Min" value="-1.0"/>
<Parameter id="DlgText" value="&quot;缓慢踩刹车停下车子&quot;"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="14" ActivityType="3" name="清除界面">
<Rect left="75" top="76" right="175" bottom="108"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="15" ActivityType="3" name="清除界面">
<Rect left="68" top="746" right="168" bottom="778"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="16" ActivityType="3" name="合格">
<Rect left="344" top="241" right="444" bottom="273"/>
<Script>engine.LastError = 0</Script><assessment no="2" name="DEP899" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" name="不合格">
<Rect left="202" top="234" right="302" bottom="266"/>
<Script>engine.LastError = 1</Script><assessment no="2" name="DEP899" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" name="合格">
<Rect left="197" top="348" right="297" bottom="380"/>
<Script>engine.LastError = 0</Script><assessment no="3" name="DEP898" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" name="不合格">
<Rect left="72" top="345" right="172" bottom="377"/>
<Script>engine.LastError = 1</Script><assessment no="3" name="DEP898" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="4" name="路由节点">
<Rect left="107" top="401" right="139" bottom="433"/>
</Activity>
<Activity id="21" ActivityType="3" name="合格">
<Rect left="340" top="489" right="440" bottom="521"/>
<Script>engine.LastError = 0</Script><assessment no="4" name="DEP900" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" name="不合格">
<Rect left="200" top="487" right="300" bottom="519"/>
<Script>engine.LastError = 1</Script><assessment no="4" name="DEP900" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" name="统计：倒车速度">
<Rect left="69" top="642" right="169" bottom="674"/>
<Script>engine.LastError = result</Script><assessment no="5" name="DEP901" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="14" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="16" type="6">
</Transition>
<Transition StartId="4" EndId="17" type="0">
</Transition>
<Transition StartId="5" EndId="19" type="0">
</Transition>
<Transition StartId="5" EndId="18" type="6">
</Transition>
<Transition StartId="6" EndId="21" type="3">
</Transition>
<Transition StartId="6" EndId="22" type="4">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="14" type="0">
</Transition>
<Transition StartId="10" EndId="23" type="0">
</Transition>
<Transition StartId="11" EndId="10" type="0">
</Transition>
<Transition StartId="12" EndId="15" type="0">
</Transition>
<Transition StartId="14" EndId="3" type="0">
</Transition>
<Transition StartId="15" EndId="2" type="0">
</Transition>
<Transition StartId="18" EndId="20" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="11" type="0">
</Transition>
<Transition StartId="21" EndId="11" type="0">
</Transition>
<Transition StartId="22" EndId="11" type="0">
</Transition>
<Transition StartId="23" EndId="12" type="0">
</Transition>
</Transitions>
</Process>

