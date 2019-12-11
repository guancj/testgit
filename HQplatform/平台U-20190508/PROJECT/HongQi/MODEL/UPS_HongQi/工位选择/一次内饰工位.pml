<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Variables>
<Variable id="BuslogPath" type="8" data="&quot;&quot;"/>
<Variable id="ObdHandle" type="3" data="-1"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script><TitleText Enable="1" Text="一汽红旗 一次内饰"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="924" right="580" bottom="956"/>
<Script></Script></End>
<Activities>
<Activity id="140" ActivityType="3" flags="0" name="变量设置2">
<Rect left="480" top="294" right="580" bottom="326"/>
<Script>DString_Car_Tpye = engine.CarType
buslogvin = engine.VIN ;
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="146" ActivityType="5" flags="0" name="一次内饰">
<Rect left="480" top="364" right="580" bottom="396"/>
<SubProcesses>
<SubProcess id="一次内饰">
<Parameters>
<Parameter id="ObdHandle" value="-1" ret="ObdHandle"/>
<Parameter id="BuslogPath" value="BuslogPath"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="147" ActivityType="5" flags="0" name="一次内饰_HS7">
<Rect left="360" top="364" right="460" bottom="396"/>
<SubProcesses>
<SubProcess id="一次内饰_HS7">
<Parameters>
<Parameter id="ObdHandle" value="-1" ret="ObdHandle"/>
<Parameter id="BuslogPath" value="BuslogPath"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="151" ActivityType="5" flags="0" name="Scan_KNR_HS7">
<Rect left="480" top="184" right="580" bottom="216"/>
<SubProcesses>
<SubProcess id="Scan_KNR_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="154" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="480" top="504" right="580" bottom="536"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="false"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="480" top="574" right="580" bottom="606"/>
<Script>date=os.date("%Y%m%d_%H%M%S");
engine.WorkPlace="TR1";
engine.SaveResultXml();

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();
engine.ExecuteRpdPending();
</Script></Activity>
<Activity id="215" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="74" right="796" bottom="106"/>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="更新程序">
<Rect left="480" top="74" right="580" bottom="106"/>
<TitleText Enable="1" Text="一汽红旗 一次内饰"/>
<Script>engine.ExecuteRpdPending();
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="235" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="580" top="624" right="680" bottom="656"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="237" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="580" top="684" right="680" bottom="716"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="239" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="580" top="744" right="680" bottom="776"/>
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
<Rect left="580" top="804" right="680" bottom="836"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="864" right="796" bottom="896"/>
</Activity>
<Activity id="242" ActivityType="3" flags="1" name="变量设置1">
<Rect left="480" top="124" right="580" bottom="156"/>
<Script>engine.WorkPlace="TR1"
VMTLOC = "TR1"
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
</Script></Activity>
<Activity id="243" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="160" top="294" right="260" bottom="326"/>
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
<Activity id="244" ActivityType="3" flags="0" name="BusLog准备完成">
<Rect left="300" top="294" right="400" bottom="326"/>
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
<Rect left="160" top="184" right="260" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="BusLog准备连接"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="256" ActivityType="3" flags="0" name="通讯">
<Rect left="160" top="234" right="260" bottom="266"/>
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
<Activity id="257" ActivityType="3" flags="0" name="结束通讯">
<Rect left="30" top="184" right="130" bottom="216"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="260" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="234" right="130" bottom="266"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="261" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="30" top="294" right="130" bottom="326"/>
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
<Activity id="338" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="864" right="96" bottom="896"/>
</Activity>
<Activity id="340" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="444" right="546" bottom="476"/>
</Activity>
<Activity id="341" ActivityType="3" flags="0" name="更新系统时间">
<Rect left="480" top="864" right="580" bottom="896"/>
<Script>local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="216" type="0">
</Transition>
<Transition StartId="140" EndId="146" type="0">
</Transition>
<Transition StartId="140" EndId="147" type="1">
<Expression>LibGeneral.CarTNC_HS7(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="146" EndId="340" type="0">
</Transition>
<Transition StartId="147" EndId="340" type="0">
</Transition>
<Transition StartId="151" EndId="140" type="0">
</Transition>
<Transition StartId="154" EndId="213" type="0">
</Transition>
<Transition StartId="213" EndId="235" type="0">
</Transition>
<Transition StartId="215" EndId="216" type="0">
</Transition>
<Transition StartId="216" EndId="242" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="341" type="0">
</Transition>
<Transition StartId="241" EndId="215" type="0">
</Transition>
<Transition StartId="242" EndId="151" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="140" type="0">
</Transition>
<Transition StartId="245" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="260" type="4">
</Transition>
<Transition StartId="256" EndId="243" type="0">
</Transition>
<Transition StartId="257" EndId="245" type="0">
</Transition>
<Transition StartId="260" EndId="257" type="0">
</Transition>
<Transition StartId="260" EndId="261" type="5">
</Transition>
<Transition StartId="261" EndId="338" type="0">
</Transition>
<Transition StartId="338" EndId="341" type="0">
</Transition>
<Transition StartId="340" EndId="154" type="0">
</Transition>
<Transition StartId="341" EndId="241" type="0">
</Transition>
</Transitions>
</Process>

