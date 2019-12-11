<?xml version="1.0" encoding="utf-8" ?>
<Process description="IPort=2011&#13;&#10;rPort=2010" flags="1" block="5" ptbtext="DEP807" group="200" pbltext="DEP808">
<Parameters>
<Variable id="TestStationID" type="3" dir="0" data="0" description="检测台序号"/>
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
<Variable id="FirapName" type="8" data="" description="Firap名称"/>
<Variable id="IDTAnswer" type="8" data="" description="IDT响应报文"/>
<Variable id="result" type="3" data="0" description="返回值，0：OK，1：NOK"/>
<Variable id="IDFromFirap" type="3" data="0" description="从Firap获得的序号"/>
<Variable id="IDFromIDT" type="3" data="0" description="从IDT获得的序号"/>
<Variable id="SimFlg" type="11" data="true" description="是否进行模拟"/>
<Variable id="ConnetStatus" type="11" data=""/>
<Variable id="Handl" type="3" data="0"/>
<Variable id="TestStandIP" type="8" data="&quot;&quot;" description="转毂台IP"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="145" right="245" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="150" top="444" right="250" bottom="476"/>
<Script></Script></End>
<Activities>
<Activity id="13" ActivityType="3" flags="0" name="驶入">
<Rect left="146" top="63" right="246" bottom="95"/>
<TitleText Enable="1" Text="转毂中检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请驶入转毂"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="已驶入？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="64" right="596" bottom="96"/>
</Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="444" right="596" bottom="476"/>
</Activity>
<Activity id="157" ActivityType="3" flags="0" name="清除屏幕">
<Rect left="150" top="244" right="250" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="165" ActivityType="13" flags="0" name="断开通讯">
<Rect left="150" top="364" right="250" bottom="396"/>
<FunctionRef id="IDT_DestroyConnection" model="LibIDT">
<Parameters>
<Parameter id="ret" ret="ret_"/>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="185" ActivityType="5" flags="0" name="Roller_In_Test">
<Rect left="150" top="304" right="250" bottom="336"/>
<SubProcesses>
<SubProcess id="Roller_In_Test">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ErrorMonitor">
<Parameters>
<Parameter id="AutoMode" value="true"/>
<Parameter id="Error" value="true"/>
<Parameter id="Emergency" value="true"/>
<Parameter id="Ready" value="true"/>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="ROL_ViewPosition">
<Parameters>
<Parameter id="Handl" value="Handl"/>
</Parameters>
</SubProcess>
<SubProcess id="IDT_Toggling" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Handl"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="192" ActivityType="3" flags="1" name="断开远程firap">
<Rect left="400" top="294" right="500" bottom="326"/>
<Script>
engine.println("### firap: disconnect");

--os.execute("C:\\\"Program Files\"\\TightVNC\\tvnserver.exe -controlservice -disconnectall");
ExecuteProcess("C:\\Program Files\\TightVNC\\tvnserver.exe","\"C:\\Program Files\\TightVNC\\tvnserver.exe\" -controlservice -disconnectall",0,false);</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="普通节点">
<Rect left="150" top="124" right="250" bottom="156"/>
<Script>idt_comStation = "idtcom_abs1";
engine.WorkPlace = "RO1";
</Script></Activity>
<Activity id="196" ActivityType="13" flags="0" name="IDT_BuildConnection_Init">
<Rect left="150" top="184" right="250" bottom="216"/>
<Line2Text Enable="1" Text="IDT建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="请等待"/>
<FunctionRef id="IDT_BuildConnection_Init" model="LibIDT">
<Parameters>
<Parameter id="iniFile" value="&quot;idtcom.ini&quot;"/>
<Parameter id="iniSection" value="idt_comStation"/>
<Parameter id="iniKey" value="&quot;abs_udp&quot;"/>
<Parameter id="pHndl" value="0" ret="Handl"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="195" type="6">
</Transition>
<Transition StartId="13" EndId="136" type="5">
</Transition>
<Transition StartId="136" EndId="144" type="0">
</Transition>
<Transition StartId="144" EndId="2" type="0">
</Transition>
<Transition StartId="157" EndId="185" type="0">
</Transition>
<Transition StartId="165" EndId="2" type="0">
</Transition>
<Transition StartId="185" EndId="165" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="157" type="0">
</Transition>
</Transitions>
</Process>

