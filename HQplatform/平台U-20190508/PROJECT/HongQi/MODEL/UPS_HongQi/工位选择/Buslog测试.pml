<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="44" right="460" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="360" top="664" right="460" bottom="696"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="变量设置">
<Rect left="360" top="114" right="460" bottom="146"/>
<Script>engine.WorkPlace="FIN"
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
print("engine.ProgPath路径："..engine.ProgPath)
print("本地暂存Buslog文件路径-BuslogPath："..BuslogPath)</Script></Activity>
<Activity id="219" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="220" top="224" right="320" bottom="256"/>
<Line2Text Enable="1" Text="正在打开应用中，请稍等"/>
<FunctionRef id="Buslog_Open" model="LibGeneral">
<Parameters>
<Parameter id="iProtocolType" value="4"/>
<Parameter id="iBaudrate" value="500000"/>
<Parameter id="iCanSId" value="0"/>
<Parameter id="iCanRId" value="0"/>
<Parameter id="saveFileName" value="BuslogPath"/>
<Parameter id="isFilled" value="false"/>
<Parameter id="FilterID" value="0"/>
<Parameter id="iPort" value="1"/>
<Parameter id="iObdHandle" value="0" ret="ObdHandle"/>
<Parameter id="result" value="0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="235" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="360" top="394" right="460" bottom="426"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="237" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="360" top="464" right="460" bottom="496"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="239" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="360" top="524" right="460" bottom="556"/>
<Line2Text Enable="1" Text="转存buslog"/>
<FunctionRef id="Writefile" model="LibGeneral">
<Parameters>
<Parameter id="path" value="buslogpend"/>
<Parameter id="content" value="content"/>
<Parameter id="mode" value="&quot;w&quot;"/>
<Parameter id="ret" ret="buslog_state"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="removebuslog">
<Rect left="360" top="584" right="460" bottom="616"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="车型打印">
<Rect left="360" top="334" right="460" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>buslogvin = "LLLLLLLLLLLLLLLLL" ;
print(buslogvin)
DString_Car_Tpye = engine.CarType
print("###车型选择参数:"..DString_Car_Tpye)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="242" ActivityType="5" flags="0" name="GW_ReadDTC">
<Rect left="580" top="284" right="680" bottom="316"/>
<SubProcesses>
<SubProcess id="GW_ReadDTC">
<Parameters>
<Parameter id="Station"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="243" ActivityType="5" flags="0" name="EMS_ReadDTC">
<Rect left="580" top="104" right="680" bottom="136"/>
<SubProcesses>
<SubProcess id="EMS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="5" flags="0" name="AT_ReadDTC">
<Rect left="580" top="164" right="680" bottom="196"/>
<SubProcesses>
<SubProcess id="AT_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="245" ActivityType="5" flags="0" name="EGSM_ReadDTC">
<Rect left="580" top="224" right="680" bottom="256"/>
<SubProcesses>
<SubProcess id="EGSM_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="247" ActivityType="5" flags="0" name="GW_FIN">
<Rect left="580" top="344" right="680" bottom="376"/>
<SubProcesses>
<SubProcess id="GW_FIN">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="248" ActivityType="5" flags="0" name="ESP_FIN">
<Rect left="580" top="404" right="680" bottom="436"/>
<SubProcesses>
<SubProcess id="ESP_FIN">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="249" ActivityType="5" flags="0" name="EMS_FIN">
<Rect left="580" top="464" right="680" bottom="496"/>
<SubProcesses>
<SubProcess id="EMS_FIN">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="251" ActivityType="5" flags="0" name="GW_ReadDTC">
<Rect left="580" top="514" right="680" bottom="546"/>
<SubProcesses>
<SubProcess id="GW_ReadDTC">
<Parameters>
<Parameter id="Station"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="252" ActivityType="5" flags="0" name="GW_FIN">
<Rect left="360" top="164" right="460" bottom="196"/>
<SubProcesses>
<SubProcess id="GW_FIN">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="254" ActivityType="2" flags="0" name="结束节点">
<Rect left="220" top="284" right="320" bottom="316"/>
<Script>#STOPCOMM
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Activity>
<Activity id="255" ActivityType="3" flags="0" name="连接ECU">
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
<Variable id="CAN_SND_ID" type="3" data="0x780" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x788" description="CAN的接收ID"/>
</Variables>
<Rect left="220" top="114" right="320" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="BusLo准备连接"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="通讯">
<Rect left="220" top="164" right="320" bottom="196"/>
<Line2Text Enable="1" Text="BusLog准备连接"/>
<Script>#COMM 0x22 0xf1 0x87
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="结束通讯">
<Rect left="90" top="114" right="190" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="334" ActivityType="3" flags="0" name="通讯失败">
<Rect left="90" top="164" right="190" bottom="196"/>
<Line1Text Enable="1" Text="GW 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="255" type="0">
</Transition>
<Transition StartId="219" EndId="254" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="2" type="0">
</Transition>
<Transition StartId="241" EndId="235" type="0">
</Transition>
<Transition StartId="242" EndId="247" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="245" type="0">
</Transition>
<Transition StartId="245" EndId="242" type="0">
</Transition>
<Transition StartId="247" EndId="248" type="0">
</Transition>
<Transition StartId="248" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="251" type="0">
</Transition>
<Transition StartId="251" EndId="241" type="0">
</Transition>
<Transition StartId="254" EndId="247" type="0">
</Transition>
<Transition StartId="255" EndId="258" type="0">
</Transition>
<Transition StartId="258" EndId="334" type="4">
</Transition>
<Transition StartId="258" EndId="219" type="0">
</Transition>
<Transition StartId="259" EndId="255" type="0">
</Transition>
<Transition StartId="334" EndId="259" type="0">
</Transition>
<Transition StartId="334" EndId="2" type="5">
</Transition>
</Transitions>
</Process>

