<?xml version="1.0" encoding="utf-8" ?>
<Process description="VMT发送端口：2010 ， VMT接收端口：2011 ， VMT发送首字节：06， VMT接收首字节：05">
<Parameters>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
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
<Rect left="50" top="24" right="150" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="50" top="594" right="150" bottom="626"/>
<Script></Script></End>
<Activities>
<Activity id="5" ActivityType="3" flags="0" name="转毂选择">
<Rect left="50" top="154" right="150" bottom="186"/>
<Script></Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="普通节点">
<Rect left="50" top="524" right="150" bottom="556"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="11" ActivityType="5" flags="0" name="转毂中检测">
<Rect left="50" top="204" right="150" bottom="236"/>
<SubProcesses>
<SubProcess id="Roller_In_Main">
<Parameters>
<Parameter id="TestStationID" value="2"/>
<Parameter id="PedalFlag" value="PedalFlag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="rts time init">
<Rect left="50" top="84" right="150" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Seq_rts_time_start = os.clock();</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="rts time end">
<Rect left="50" top="464" right="150" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Seq_rts_time_end = os.clock();
local use_time = Seq_rts_time_end - Seq_rts_time_start;
local Str_use_time = string.format("%d",use_time);

engine.LastError = 0;
engine.StatValue = "Time:"..tostring(Str_use_time);</Script></Activity>
<Activity id="14" ActivityType="5" flags="1" name="ESP_Read_DTC">
<Rect left="50" top="264" right="150" bottom="296"/>
<SubProcesses>
<SubProcess id="ESP_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="44" ActivityType="5" flags="0" name="EPB_Read_DTC">
<Rect left="50" top="334" right="150" bottom="366"/>
<SubProcesses>
<SubProcess id="EPB_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="45" ActivityType="5" flags="0" name="EMS_Read_DTC">
<Rect left="50" top="394" right="150" bottom="426"/>
<SubProcesses>
<SubProcess id="EMS_Read_DTC">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="12" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="11" EndId="14" type="0">
</Transition>
<Transition StartId="12" EndId="5" type="0">
</Transition>
<Transition StartId="13" EndId="9" type="0">
</Transition>
<Transition StartId="14" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="13" type="0">
</Transition>
</Transitions>
</Process>

