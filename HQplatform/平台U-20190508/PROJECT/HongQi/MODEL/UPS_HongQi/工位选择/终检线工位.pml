<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="4" right="460" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="一汽红旗-终检工位"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="360" top="1084" right="460" bottom="1116"/>
<Script></Script></End>
<Activities>
<Activity id="152" ActivityType="5" flags="1" name="终检线_HS7">
<Rect left="210" top="474" right="310" bottom="506"/>
<SubProcesses>
<SubProcess id="终检线_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="153" ActivityType="5" flags="0" name="终检线">
<Rect left="360" top="474" right="460" bottom="506"/>
<SubProcesses>
<SubProcess id="终检线">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="154" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="360" top="624" right="460" bottom="656"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="360" top="684" right="460" bottom="716"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="218" ActivityType="3" flags="0" name="变量设置">
<Rect left="360" top="114" right="460" bottom="146"/>
<Script>engine.WorkPlace="FIN"
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
</Script></Activity>
<Activity id="221" ActivityType="3" flags="0" name="车型打印">
<Rect left="360" top="344" right="460" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>buslogvin = engine.VIN ;
print(buslogvin)
DString_Car_Tpye = engine.CarType
print("###车型选择参数:"..DString_Car_Tpye)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="226" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="1014" right="746" bottom="1046"/>
</Activity>
<Activity id="227" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="54" right="746" bottom="86"/>
</Activity>
<Activity id="229" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="360" top="284" right="460" bottom="316"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="手动确认OBD">
<Rect left="360" top="54" right="460" bottom="86"/>
<TitleText Enable="1" Text="一汽红旗-终检工位"/>
<Line1Text Enable="1" Text="连接OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
--os.execute("w32tm /resync /nowait /force")
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="232" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="210" top="44" right="310" bottom="76"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="手动确认OBD">
<Rect left="360" top="1014" right="460" bottom="1046"/>
<TitleText Enable="1" Text="一汽红旗-终检工位"/>
<Line1Text Enable="1" Text="断开OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
--os.execute("w32tm /resync /nowait /force")
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="236" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="460" top="754" right="560" bottom="786"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="238" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="460" top="824" right="560" bottom="856"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="239" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="460" top="884" right="560" bottom="916"/>
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
<Rect left="460" top="944" right="560" bottom="976"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="241" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="210" top="224" right="310" bottom="256"/>
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
<Rect left="210" top="284" right="310" bottom="316"/>
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
<Activity id="255" ActivityType="3" flags="0" name="BusLog准备">
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
<Rect left="210" top="114" right="310" bottom="146"/>
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
<Rect left="210" top="164" right="310" bottom="196"/>
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
<Rect left="70" top="114" right="170" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="260" ActivityType="3" flags="0" name="通讯失败">
<Rect left="70" top="164" right="170" bottom="196"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="335" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="1014" right="136" bottom="1046"/>
</Activity>
<Activity id="337" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="70" top="284" right="170" bottom="316"/>
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
<Rect left="394" top="544" right="426" bottom="576"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="231" type="0">
</Transition>
<Transition StartId="152" EndId="338" type="0">
</Transition>
<Transition StartId="153" EndId="338" type="0">
</Transition>
<Transition StartId="154" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="233" type="0">
</Transition>
<Transition StartId="218" EndId="229" type="0">
</Transition>
<Transition StartId="221" EndId="153" type="0">
</Transition>
<Transition StartId="221" EndId="152" type="1">
<Expression>LibGeneral.CarTNC_HS7(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="226" EndId="227" type="0">
</Transition>
<Transition StartId="227" EndId="231" type="0">
</Transition>
<Transition StartId="229" EndId="221" type="0">
</Transition>
<Transition StartId="231" EndId="218" type="0">
</Transition>
<Transition StartId="232" EndId="218" type="0">
</Transition>
<Transition StartId="233" EndId="226" type="0">
</Transition>
<Transition StartId="236" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="233" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="229" type="0">
</Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="260" type="4">
</Transition>
<Transition StartId="256" EndId="241" type="0">
</Transition>
<Transition StartId="259" EndId="255" type="0">
</Transition>
<Transition StartId="260" EndId="259" type="0">
</Transition>
<Transition StartId="260" EndId="337" type="5">
</Transition>
<Transition StartId="335" EndId="233" type="0">
</Transition>
<Transition StartId="337" EndId="335" type="0">
</Transition>
<Transition StartId="338" EndId="154" type="0">
</Transition>
</Transitions>
</Process>

