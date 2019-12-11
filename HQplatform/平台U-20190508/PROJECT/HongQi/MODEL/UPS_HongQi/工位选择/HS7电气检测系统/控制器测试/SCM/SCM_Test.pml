<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x753" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="180" right="280" bottom="32"/>
<Script></Script><TitleText Enable="1" Text="SCM功能测试"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="180" top="654" right="280" bottom="686"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="180" top="54" right="280" bottom="86"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="21" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="SCM_Shorting_longing_Motor">
<Rect left="180" top="414" right="280" bottom="446"/>
<SubProcesses>
<SubProcess id="SCM_Shorting_longing_Motor">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="180" top="214" right="280" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x27 0x01
s0=@2;
s1=@3;
s2=@4;
s3=@5;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="23" name="DEP209" type="8" flags="97"/>
</Activity>
<Activity id="255" ActivityType="3" flags="0" name="发送key">
<Rect left="180" top="344" right="280" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1  0x27 0x02 key0 key1 key2 key3
engine.Delay(50)
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="24" name="DEP210" type="8" flags="97"/>
</Activity>
<Activity id="256" ActivityType="13" flags="0" name="计算">
<Rect left="180" top="274" right="280" bottom="306"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x1F53F164"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="257" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="214" right="386" bottom="246"/>
</Activity>
<Activity id="258" ActivityType="5" flags="0" name="SCM_Switch_Check">
<Rect left="180" top="494" right="280" bottom="526"/>
<SubProcesses>
<SubProcess id="SCM_Switch_Check">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="259" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="180" top="574" right="280" bottom="606"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="574" right="386" bottom="606"/>
</Activity>
<Activity id="264" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="180" top="154" right="280" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换扩展模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="22" name="DEP1101" type="8" flags="97"/>
</Activity>
<Activity id="265" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10" top="104" right="110" bottom="136"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="266" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="10" top="54" right="110" bottom="86"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="267" ActivityType="3" flags="0" name="通讯">
<Rect left="180" top="104" right="280" bottom="136"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="1" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="268" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="574" right="76" bottom="606"/>
</Activity>
<Activity id="269" ActivityType="3" flags="0" name="累计次数">
<Rect left="320" top="344" right="420" bottom="376"/>
<Script>send_ok = send_ok + 1;</Script></Activity>
<Activity id="270" ActivityType="3" flags="0" name="循环变量定义">
<Rect left="430" top="164" right="530" bottom="196"/>
<Script>send_ok = 0;</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="267" type="0">
</Transition>
<Transition StartId="4" EndId="258" type="0">
</Transition>
<Transition StartId="254" EndId="256" type="0">
</Transition>
<Transition StartId="255" EndId="4" type="0">
</Transition>
<Transition StartId="255" EndId="269" type="4">
</Transition>
<Transition StartId="256" EndId="255" type="0">
</Transition>
<Transition StartId="257" EndId="254" type="0">
</Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="2" type="0">
</Transition>
<Transition StartId="260" EndId="259" type="0">
</Transition>
<Transition StartId="264" EndId="270" type="0">
</Transition>
<Transition StartId="265" EndId="266" type="0">
</Transition>
<Transition StartId="265" EndId="268" type="5">
</Transition>
<Transition StartId="266" EndId="3" type="0">
</Transition>
<Transition StartId="267" EndId="265" type="4">
</Transition>
<Transition StartId="267" EndId="264" type="0">
</Transition>
<Transition StartId="268" EndId="259" type="0">
</Transition>
<Transition StartId="269" EndId="257" type="0">
</Transition>
<Transition StartId="269" EndId="260" type="1">
<Expression>send_ok &gt;= 3</Expression></Transition>
<Transition StartId="270" EndId="254" type="0">
</Transition>
</Transitions>
</Process>

