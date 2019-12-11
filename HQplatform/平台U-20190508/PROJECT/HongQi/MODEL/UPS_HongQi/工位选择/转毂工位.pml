<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="380" top="34" right="480" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="一汽红旗-转毂工位"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="550" top="1254" right="650" bottom="1286"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="H7转毂工位">
<Rect left="700" top="674" right="800" bottom="706"/>
<SubProcesses>
<SubProcess id="H7转毂工位">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="普通节点">
<Rect left="1260" top="234" right="1360" bottom="266"/>
<Script>engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力");
engine.Delay(3000)


BrakeForce_FL = 80
BrakeForce_FL = tostring(BrakeForce_FL)

BrakeForce_FR = 300
BrakeForce_FR = tostring(BrakeForce_FR)

engine.SetLineText(0,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力");

engine.Delay(3000)</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="普通节点">
<Rect left="1260" top="184" right="1360" bottom="216"/>
<Script>BrakeForce_FL = 800
BrakeForce_FL = tostring(BrakeForce_FL)

BrakeForce_FR = 3000
BrakeForce_FR = tostring(BrakeForce_FR)</Script></Activity>
<Activity id="212" ActivityType="3" flags="0" name="全局车型设置">
<Rect left="1260" top="294" right="1360" bottom="326"/>
<Script>engine.ListClear()
engine.SelectLayout(1)

engine.ListAddString("HS7")
engine.ListAddString("H7")

#INPUT Stype

engine.SelectLayout(0)


engine.SharedVarSet("vehicleID",Stype)</Script></Activity>
<Activity id="213" ActivityType="5" flags="0" name="HS7转毂工位">
<Rect left="550" top="674" right="650" bottom="706"/>
<SubProcesses>
<SubProcess id="HS7转毂工位">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="214" ActivityType="3" flags="0" name="检测OBD">
<Rect left="550" top="94" right="650" bottom="126"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请连接OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
engine.SharedVarSet("_ProcessOK",0)

engine.DialogBackColor = -1
while(0 == bit32.band(engine.VciStatus,0x01)) do
	engine.ExecuteRpdPending();
	engine.Delay(300)
end

engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")</Script></Activity>
<Activity id="232" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="430" top="744" right="530" bottom="776"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="430" top="804" right="530" bottom="836"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="235" ActivityType="3" flags="0" name="轴重获取">
<Rect left="360" top="594" right="460" bottom="626"/>
<Script>local hp = engine.httpOpen() 
local postData = "&lt;?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?&gt;&lt;tel&gt;&lt;action&gt;vehiclereport&lt;/action&gt;&lt;begindate&gt;2019-01-20 00:00:00&lt;/begindate&gt;&lt;enddate&gt;2019-12-10 23:59:59&lt;/enddate&gt;&lt;id&gt;knr&lt;/id&gt;&lt;knr&gt;"..engine.KNR.."&lt;/knr&gt;&lt;langtype&gt;zh&lt;/langtype&gt;&lt;module&gt;api&lt;/module&gt;&lt;nokonly&gt;false&lt;/nokonly&gt;&lt;querytype&gt;all&lt;/querytype&gt;&lt;testblock&gt;&lt;/testblock&gt;&lt;testdeviceno&gt;&lt;/testdeviceno&gt;&lt;testplace&gt;FWE&lt;/testplace&gt;&lt;vehicletype&gt;&lt;/vehicletype&gt;&lt;/tel&gt;"

retcode= engine.httpPost(hp, "https://10.134.184.2:8443/report", postData)
print("recode:"..retcode)

local strJson = engine.httpGetResponse(hp)
local pos = string.find(strJson,"前轴轴重")
pos = pos + 8 + 75
print("pos:"..pos)
strJson = strJson:sub(pos,-1)
print("weiG_FA:"..strJson)
endPos = string.find(strJson,"&lt;/value&gt;")
print("endPos"..endPos)
Weight_FA = strJson:sub(1,endPos-1)


pos = string.find(strJson,"后轴轴重")
pos = pos + 8 + 75
print("pos:"..pos)
strJson = strJson:sub(pos,-1)
endPos = string.find(strJson,"&lt;/value&gt;")
Weight_RA = strJson:sub(1,endPos-1)




print("Weight_FA:"..string.format("%s",Weight_FA))
print("Weight_RA:"..string.format("%s",Weight_RA))</Script></Activity>
<Activity id="236" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="550" top="474" right="650" bottom="506"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="车型打印">
<Rect left="550" top="594" right="650" bottom="626"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_Car_Tpye = engine.CarType
print("###车型选择参数:"..DString_Car_Tpye)

if (LibGeneral.CarTNC_HS7(DString_Car_Tpye)) then
	engine.SharedVarSet("vehicleID","HS7")
else
	engine.SharedVarSet("vehicleID","H7")	
end

buslogvin = engine.VIN ;
print(buslogvin)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"
engine.SharedVarSet("PedalOrNot","0")   --不检踏板力</Script></Activity>
<Activity id="238" ActivityType="3" flags="0" name="断开OBD">
<Rect left="550" top="1164" right="650" bottom="1196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请断开OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(2000)
engine.DialogBackColor = -1
while(1 == bit32.band(engine.VciStatus,0x01)) do
	engine.Delay(300)
end

engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")

local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="239" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1164" right="946" bottom="1196"/>
</Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="94" right="946" bottom="126"/>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="IDTM连接">
<Rect left="550" top="414" right="650" bottom="446"/>
<SubProcesses>
<SubProcess id="IDTM连接">
<Parameters>
<Parameter id="Result" value="1" ret="Result"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="242" ActivityType="5" flags="0" name="IDTM断开">
<Rect left="550" top="344" right="650" bottom="376"/>
<SubProcesses>
<SubProcess id="IDTM断开">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="251" ActivityType="3" flags="0" name="退出红外">
<Rect left="240" top="414" right="340" bottom="446"/>
<Script></Script></Activity>
<Activity id="252" ActivityType="5" flags="0" name="IDTM断开">
<Rect left="550" top="874" right="650" bottom="906"/>
<SubProcesses>
<SubProcess id="IDTM断开">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="253" ActivityType="3" flags="0" name="普通节点">
<Rect left="240" top="874" right="340" bottom="906"/>
<Script></Script></Activity>
<Activity id="254" ActivityType="3" flags="0" name="测试用VMT连接有线">
<Rect left="700" top="414" right="800" bottom="446"/>
<Line1Text Enable="1" Text="测试使用"/>
<Line2Text Enable="1" Text="VMT连接有线网"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(2,"#L=" .. "可以吗？" .. "#R=BMPEYE");
#PRESSBUTTON
if (engine.LButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "可以吗？" .. "#R=BMPNOK");
engine.ShowMessage();
engine.LastError = 1;
engine.StatValue = "NOK";

elseif (engine.RButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "可以吗？" .. "#R=BMPOK");
engine.ShowMessage();
engine.LastError = 0;
engine.StatValue = "OK";

end;</Script></Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="414" right="886" bottom="446"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="1124" right="886" bottom="1156"/>
</Activity>
<Activity id="258" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="344" right="736" bottom="376"/>
</Activity>
<Activity id="259" ActivityType="3" flags="0" name="Route ADD">
<Rect left="550" top="284" right="650" bottom="316"/>
<Script>require 'alien'
local user = alien.load('Kernel32.dll') 
user.WinExec:types{ret = 'int','string','int'}

ret = user.WinExec("cmd.exe /c route delete 10.134.0.0 &gt;tmp1.log",0)
print("ret delete result = "..tostring(ret));
 --[[local file = io.open("tmp1.log","r")
 local doc = file:read("*a")
 print("ret delete doc is "..tostring(doc))
 file:close()]]
engine.Delay(500)

ret = user.WinExec("cmd.exe /c route add 10.134.0.0 mask 255.255.0.0 10.134.245.254 &gt;tmp2.log",0)
print("ret add result= "..tostring(ret));
--[[ local file = io.open("tmp2.log","r")
 local doc = file:read("*a")
 print("ret add doc is "..tostring(doc))
 file:close()]]
 engine.Delay(500)</Script></Activity>
<Activity id="260" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="280" top="194" right="380" bottom="226"/>
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
<Activity id="261" ActivityType="3" flags="0" name="BusLog准备完成">
<Rect left="400" top="194" right="500" bottom="226"/>
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
<Activity id="262" ActivityType="3" flags="0" name="BusLog准备">
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
<Rect left="160" top="144" right="260" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="BusLog准备连接"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="263" ActivityType="3" flags="0" name="通讯">
<Rect left="160" top="194" right="260" bottom="226"/>
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
<Activity id="264" ActivityType="3" flags="0" name="结束通讯">
<Rect left="30" top="144" right="130" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="265" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="194" right="130" bottom="226"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="266" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="30" top="254" right="130" bottom="286"/>
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
<Activity id="267" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="650" top="914" right="750" bottom="946"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="268" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="650" top="974" right="750" bottom="1006"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="340" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="650" top="1034" right="750" bottom="1066"/>
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
<Activity id="341" ActivityType="3" flags="0" name="removebuslog">
<Rect left="650" top="1094" right="750" bottom="1126"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="342" ActivityType="3" flags="0" name="buslog变量和时间同步">
<Rect left="550" top="144" right="650" bottom="176"/>
<Script>--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"

local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="343" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="194" right="616" bottom="226"/>
</Activity>
<Activity id="344" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="1164" right="96" bottom="1196"/>
</Activity>
<Activity id="345" ActivityType="5" flags="0" name="C229转毂工位">
<Rect left="400" top="674" right="500" bottom="706"/>
<SubProcesses>
<SubProcess id="C229转毂工位">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="347" ActivityType="3" flags="1" name="普通节点">
<Rect left="380" top="94" right="480" bottom="126"/>
<Script>engine.WorkPlace = "ROL"</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="347" type="0">
</Transition>
<Transition StartId="3" EndId="252" type="0">
</Transition>
<Transition StartId="210" EndId="209" type="0">
</Transition>
<Transition StartId="213" EndId="252" type="0">
</Transition>
<Transition StartId="214" EndId="342" type="0">
</Transition>
<Transition StartId="232" EndId="233" type="0">
</Transition>
<Transition StartId="233" EndId="252" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="0">
</Transition>
<Transition StartId="236" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="213" type="1">
<Expression>LibGeneral.CarTNC_HS7(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="237" EndId="3" type="0">
</Transition>
<Transition StartId="237" EndId="345" type="1">
<Expression>LibGeneral.CarTNC_C229(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="214" type="0">
</Transition>
<Transition StartId="241" EndId="236" type="0">
</Transition>
<Transition StartId="241" EndId="251" type="1">
<Expression>Result == 1</Expression></Transition>
<Transition StartId="242" EndId="241" type="0">
</Transition>
<Transition StartId="251" EndId="253" type="0">
</Transition>
<Transition StartId="252" EndId="238" type="0">
</Transition>
<Transition StartId="253" EndId="252" type="0">
</Transition>
<Transition StartId="254" EndId="255" type="4">
</Transition>
<Transition StartId="255" EndId="256" type="0">
</Transition>
<Transition StartId="256" EndId="238" type="0">
</Transition>
<Transition StartId="258" EndId="236" type="0">
</Transition>
<Transition StartId="259" EndId="242" type="0">
</Transition>
<Transition StartId="260" EndId="261" type="0">
</Transition>
<Transition StartId="261" EndId="343" type="0">
</Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="265" type="4">
</Transition>
<Transition StartId="263" EndId="260" type="0">
</Transition>
<Transition StartId="264" EndId="262" type="0">
</Transition>
<Transition StartId="265" EndId="264" type="0">
</Transition>
<Transition StartId="265" EndId="266" type="5">
</Transition>
<Transition StartId="266" EndId="344" type="0">
</Transition>
<Transition StartId="267" EndId="268" type="0">
</Transition>
<Transition StartId="268" EndId="340" type="0">
</Transition>
<Transition StartId="340" EndId="341" type="0">
</Transition>
<Transition StartId="341" EndId="238" type="0">
</Transition>
<Transition StartId="342" EndId="343" type="0">
</Transition>
<Transition StartId="343" EndId="259" type="1">
<Expression>engine.VmtId==100 or engine.VmtId==101</Expression></Transition>
<Transition StartId="343" EndId="258" type="0">
</Transition>
<Transition StartId="344" EndId="238" type="0">
</Transition>
<Transition StartId="345" EndId="252" type="0">
</Transition>
<Transition StartId="347" EndId="214" type="0">
</Transition>
</Transitions>
</Process>

