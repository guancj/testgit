<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="610" top="24" right="710" bottom="56"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="610" top="874" right="710" bottom="906"/>
<Script></Script></End>
<Activities>
<Activity id="183" ActivityType="3" flags="0" name="Title">
<Rect left="610" top="124" right="710" bottom="156"/>
<TitleText Enable="1" Text="一汽红旗-返修线"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.WorkPlace = "REP"
Station = "REP"
VMTLOC="REP"
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
</Script></Activity>
<Activity id="189" ActivityType="5" flags="0" name="返修线_HS7">
<Rect left="430" top="404" right="530" bottom="436"/>
<SubProcesses>
<SubProcess id="返修线_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="190" ActivityType="5" flags="0" name="返修">
<Rect left="610" top="404" right="710" bottom="436"/>
<SubProcesses>
<SubProcess id="返修">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="191" ActivityType="5" flags="0" name="Scan_KNR_HS7">
<Rect left="605" top="228" right="705" bottom="260"/>
<SubProcesses>
<SubProcess id="Scan_KNR_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="清除屏幕">
<Rect left="770" top="124" right="870" bottom="156"/>
<TitleText Enable="1" Text="一汽红旗-返修"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(1000)
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="变量设置2">
<Rect left="606" top="339" right="706" bottom="371"/>
<Script>DString_Car_Tpye = engine.CarType
buslogvin = engine.VIN ;
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="195" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="610" top="564" right="710" bottom="596"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="236" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="610" top="624" right="710" bottom="656"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="238" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="610" top="684" right="710" bottom="716"/>
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
<Rect left="610" top="744" right="710" bottom="776"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="241" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="200" top="234" right="300" bottom="266"/>
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
<Activity id="242" ActivityType="3" flags="0" name="BusLog准备完成">
<Rect left="350" top="234" right="450" bottom="266"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="245" ActivityType="3" flags="0" name="BusLog准备">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CAN的接收ID"/>
</Variables>
<Rect left="200" top="124" right="300" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="BusLog准备连接"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="通讯">
<Rect left="200" top="174" right="300" bottom="206"/>
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
<Activity id="247" ActivityType="3" flags="0" name="结束通讯">
<Rect left="70" top="124" right="170" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="通讯失败">
<Rect left="70" top="174" right="170" bottom="206"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="70" top="234" right="170" bottom="266"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="262" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="814" right="836" bottom="846"/>
</Activity>
<Activity id="263" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="504" right="836" bottom="536"/>
</Activity>
<Activity id="264" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="504" right="676" bottom="536"/>
</Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="814" right="676" bottom="846"/>
</Activity>
<Activity id="266" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="814" right="136" bottom="846"/>
</Activity>
<Activity id="267" ActivityType="3" flags="0" name="手动确认OBD">
<Rect left="360" top="169" right="460" bottom="201"/>
<TitleText Enable="1" Text="一汽红旗-二次内饰"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将电源线接入并连接OBD"/>
<Line3Text Enable="1" Text="确定？"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="268" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="607" top="285" right="707" bottom="317"/>
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
</Activities>
<Transitions>
<Transition StartId="1" EndId="183" type="0">
</Transition>
<Transition StartId="183" EndId="191" type="0">
</Transition>
<Transition StartId="189" EndId="264" type="0">
</Transition>
<Transition StartId="190" EndId="264" type="0">
</Transition>
<Transition StartId="191" EndId="268" type="0">
</Transition>
<Transition StartId="193" EndId="183" type="0">
</Transition>
<Transition StartId="194" EndId="189" type="1">
<Expression>LibGeneral.CarTNC_HS7(engine.CarType)</Expression></Transition>
<Transition StartId="194" EndId="190" type="0">
</Transition>
<Transition StartId="195" EndId="236" type="0">
</Transition>
<Transition StartId="236" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="265" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="245" EndId="246" type="0">
</Transition>
<Transition StartId="246" EndId="258" type="4">
</Transition>
<Transition StartId="246" EndId="241" type="0">
</Transition>
<Transition StartId="247" EndId="245" type="0">
</Transition>
<Transition StartId="258" EndId="247" type="0">
</Transition>
<Transition StartId="258" EndId="259" type="5">
</Transition>
<Transition StartId="259" EndId="266" type="0">
</Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="193" type="0">
</Transition>
<Transition StartId="264" EndId="195" type="0">
</Transition>
<Transition StartId="265" EndId="262" type="0">
</Transition>
<Transition StartId="266" EndId="265" type="0">
</Transition>
<Transition StartId="267" EndId="241" type="0">
</Transition>
<Transition StartId="268" EndId="194" type="0">
</Transition>
</Transitions>
</Process>

