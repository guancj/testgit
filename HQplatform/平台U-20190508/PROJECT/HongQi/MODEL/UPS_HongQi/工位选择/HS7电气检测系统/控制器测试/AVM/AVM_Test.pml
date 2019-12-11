<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693">
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
<Variable id="CAN_SND_ID" type="3" data="0x726" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="190" right="290" bottom="32"/>
<Script></Script><TitleText Enable="1" Text="全景控制单元(AVM)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="190" top="514" right="290" bottom="546"/>
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
<Rect left="870" top="114" right="970" bottom="146"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="1" name="DEP1694" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="5" flags="0" name="AVM_Short_Sensor_Check">
<Rect left="190" top="214" right="290" bottom="246"/>
<SubProcesses>
<SubProcess id="AVM_Short_Sensor_Check">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="6" ActivityType="5" flags="0" name="AVM_long_Sensor_Check">
<Rect left="190" top="294" right="290" bottom="326"/>
<SubProcesses>
<SubProcess id="AVM_Long_Sensor_Check">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="7" ActivityType="5" flags="0" name="AVM_Image_Check">
<Rect left="190" top="364" right="290" bottom="396"/>
<SubProcesses>
<SubProcess id="AVM_Image_Check">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="190" top="434" right="290" bottom="466"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="打开AVM开关">
<Rect left="190" top="164" right="290" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=开打AVM开关".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="11" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="334" right="376" bottom="366"/>
</Activity>
<Activity id="12" ActivityType="3" flags="1" name="通讯失败">
<Rect left="40" top="104" right="140" bottom="136"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="266" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="190" top="54" right="290" bottom="86"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="267" ActivityType="13" flags="0" name="扩展会话">
<Rect left="190" top="104" right="290" bottom="136"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP1694" type="8" flags="97"/>
</Activity>
<Activity id="268" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="40" top="54" right="140" bottom="86"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="434" right="106" bottom="466"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="266" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="2" type="0">
</Transition>
<Transition StartId="10" EndId="5" type="0">
</Transition>
<Transition StartId="11" EndId="8" type="0">
</Transition>
<Transition StartId="12" EndId="268" type="0">
</Transition>
<Transition StartId="12" EndId="269" type="5">
</Transition>
<Transition StartId="266" EndId="267" type="0">
</Transition>
<Transition StartId="267" EndId="12" type="4">
</Transition>
<Transition StartId="267" EndId="10" type="0">
</Transition>
<Transition StartId="267" EndId="10" type="0">
</Transition>
<Transition StartId="268" EndId="266" type="0">
</Transition>
<Transition StartId="269" EndId="8" type="0">
</Transition>
</Transitions>
</Process>

