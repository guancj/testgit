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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="350" top="34" right="450" bottom="66"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1" Text="强制上ON挡电"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="350" top="654" right="450" bottom="686"/>
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
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="350" top="264" right="450" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="350" top="414" right="450" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMMEX vciHandle -1 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
</Script></Activity>
<Activity id="14" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="350" top="334" right="450" bottom="366"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="16" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="350" top="104" right="450" bottom="136"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="17" ActivityType="13" flags="0" name="切换诊断模式">
<Rect left="350" top="184" right="450" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
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
</Activity>
<Activity id="18" ActivityType="3" flags="1" name="上电">
<Rect left="350" top="484" right="450" bottom="516"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="上ON挡电"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x2f 0x01 0x41 0x03 0x02</Script></Activity>
<Activity id="19" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="350" top="564" right="450" bottom="596"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="184" right="586" bottom="216"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="普通节点">
<Rect left="520" top="484" right="620" bottom="516"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="上电失败"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="通讯失败">
<Rect left="190" top="184" right="290" bottom="216"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="182" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="190" top="104" right="290" bottom="136"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="564" right="256" bottom="596"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="16" type="0">
</Transition>
<Transition StartId="7" EndId="14" type="0">
</Transition>
<Transition StartId="8" EndId="18" type="0">
</Transition>
<Transition StartId="14" EndId="8" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="7" type="0">
</Transition>
<Transition StartId="17" EndId="20" type="4">
</Transition>
<Transition StartId="17" EndId="66" type="4">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="18" EndId="23" type="4">
</Transition>
<Transition StartId="19" EndId="2" type="0">
</Transition>
<Transition StartId="20" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="19" type="0">
</Transition>
<Transition StartId="66" EndId="182" type="0">
</Transition>
<Transition StartId="66" EndId="214" type="5">
</Transition>
<Transition StartId="182" EndId="16" type="0">
</Transition>
<Transition StartId="214" EndId="19" type="0">
</Transition>
</Transitions>
</Process>

