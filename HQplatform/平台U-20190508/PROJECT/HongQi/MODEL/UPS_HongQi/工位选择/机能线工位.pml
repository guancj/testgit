<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="74" right="590" bottom="106"/>
<Script></Script><TitleText Enable="1" Text="一汽红旗-机能线"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="1044" right="590" bottom="1076"/>
<Script></Script></End>
<Activities>
<Activity id="88" ActivityType="5" flags="0" name="机能线">
<Rect left="490" top="464" right="590" bottom="496"/>
<SubProcesses>
<SubProcess id="机能线">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="220" ActivityType="3" flags="0" name="工位设置">
<Rect left="490" top="204" right="590" bottom="236"/>
<Script>engine.WorkPlace="FUN"
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
</Script></Activity>
<Activity id="222" ActivityType="3" flags="0" name="车型打印">
<Rect left="490" top="384" right="590" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_Car_Tpye = engine.CarType
print("###车型选择参数:"..DString_Car_Tpye)
buslogvin = engine.VIN ;
print(buslogvin)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="223" ActivityType="5" flags="0" name="机能线_HS7">
<Rect left="360" top="464" right="460" bottom="496"/>
<SubProcesses>
<SubProcess id="机能线_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="224" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="490" top="594" right="590" bottom="626"/>
<TitleText Enable="1" Text="测试结果显示"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="490" top="654" right="590" bottom="686"/>
<Script>
engine.SaveResultXml();

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="934" top="984" right="966" bottom="1016"/>
</Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="934" top="144" right="966" bottom="176"/>
</Activity>
<Activity id="231" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="490" top="314" right="590" bottom="346"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="手动确认OBD">
<Rect left="490" top="144" right="590" bottom="176"/>
<TitleText Enable="1" Text="一汽红旗-机能线"/>
<Line1Text Enable="1" Text="请连接OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.ExecuteRpdPending();
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="手动确认OBD">
<Rect left="490" top="974" right="590" bottom="1006"/>
<TitleText Enable="1" Text="一汽红旗-机能线"/>
<Line1Text Enable="1" Text="请断开OBD"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.ExecuteRpdPending();
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="234" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="190" top="314" right="290" bottom="346"/>
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
<Rect left="330" top="314" right="430" bottom="346"/>
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
<Rect left="190" top="204" right="290" bottom="236"/>
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
<Rect left="190" top="254" right="290" bottom="286"/>
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
<Rect left="60" top="204" right="160" bottom="236"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="通讯失败">
<Rect left="60" top="254" right="160" bottom="286"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="261" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="60" top="314" right="160" bottom="346"/>
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
<Rect left="94" top="984" right="126" bottom="1016"/>
</Activity>
<Activity id="263" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="590" top="734" right="690" bottom="766"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="264" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="590" top="804" right="690" bottom="836"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="265" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="590" top="864" right="690" bottom="896"/>
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
<Activity id="266" ActivityType="3" flags="0" name="removebuslog">
<Rect left="590" top="924" right="690" bottom="956"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="267" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="534" right="556" bottom="566"/>
</Activity>
<Activity id="268" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="360" top="264" right="460" bottom="296"/>
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
<Transition StartId="1" EndId="232" type="0">
</Transition>
<Transition StartId="88" EndId="267" type="0">
</Transition>
<Transition StartId="220" EndId="231" type="0">
</Transition>
<Transition StartId="222" EndId="223" type="1">
<Expression>LibGeneral.CarTNC_HS7(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="222" EndId="88" type="0">
</Transition>
<Transition StartId="223" EndId="267" type="0">
</Transition>
<Transition StartId="224" EndId="225" type="0">
</Transition>
<Transition StartId="225" EndId="233" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="232" type="0">
</Transition>
<Transition StartId="231" EndId="222" type="0">
</Transition>
<Transition StartId="232" EndId="220" type="0">
</Transition>
<Transition StartId="233" EndId="228" type="0">
</Transition>
<Transition StartId="234" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="231" type="0">
</Transition>
<Transition StartId="245" EndId="246" type="0">
</Transition>
<Transition StartId="246" EndId="258" type="4">
</Transition>
<Transition StartId="246" EndId="234" type="0">
</Transition>
<Transition StartId="257" EndId="245" type="0">
</Transition>
<Transition StartId="258" EndId="257" type="0">
</Transition>
<Transition StartId="258" EndId="261" type="5">
</Transition>
<Transition StartId="261" EndId="262" type="0">
</Transition>
<Transition StartId="262" EndId="233" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="265" type="0">
</Transition>
<Transition StartId="265" EndId="266" type="0">
</Transition>
<Transition StartId="266" EndId="233" type="0">
</Transition>
<Transition StartId="267" EndId="224" type="0">
</Transition>
<Transition StartId="268" EndId="231" type="0">
</Transition>
</Transitions>
</Process>

