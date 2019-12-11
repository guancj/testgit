<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="370" top="44" right="470" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="510" top="1424" right="610" bottom="1456"/>
<Script></Script></End>
<Activities>
<Activity id="183" ActivityType="5" flags="0" name="H7前束工位">
<Rect left="510" top="704" right="610" bottom="736"/>
<SubProcesses>
<SubProcess id="H7前束工位">
<Parameters>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="ACCLDWflag" value="ACCLDWflag"/>
<Parameter id="AFSPartnumber" value="AFSPartnumberr"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="188" ActivityType="5" flags="0" name="判断档位">
<Rect left="510" top="644" right="610" bottom="676"/>
<SubProcesses>
<SubProcess id="C131_ATcheckN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="209" ActivityType="3" flags="1" name="车型判断">
<Rect left="510" top="584" right="610" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>ACCLDWflag = false
AirSFlag = false
if (engine.CarType == "CH1GM41" or engine.CarType == "CMNA01A") then
	FWE_CarID = string.char(61)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1GM42" or engine.CarType == "CMNA02A") then
	FWE_CarID = string.char(62)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1GM40" or engine.CarType == "CMNA01A") then
	FWE_CarID = string.char(63)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1AM46" or engine.CarType == "CH1QM30") then
	FWE_CarID = string.char(64)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1AM47" or engine.CarType == "CH1QM40") then
	FWE_CarID = string.char(65)
        SWE_CarID = string.char(9)
        ACCLDWflag = true
elseif (engine.CarType == "CH1AM48" or engine.CarType == "CH1QM50") then
	FWE_CarID = string.char(66)
        SWE_CarID = string.char(9)
        ACCLDWflag = true
elseif (engine.CarType == "CH1CM32" or engine.CarType == "CH1PM20") then
	FWE_CarID = string.char(67)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1CM33" or engine.CarType == "CH1PM30") then
	FWE_CarID = string.char(68)
        SWE_CarID = string.char(9)
        ACCLDWflag = true
elseif (engine.CarType == "CH1BM35" or engine.CarType == "CNDA01A") then
	FWE_CarID = string.char(69)
        SWE_CarID = string.char(9)
        ACCLDWflag = true
elseif (engine.CarType == "CH1MM41") then
	FWE_CarID = string.char(70)
        SWE_CarID = string.char(9)
elseif (engine.CarType == "CH1AM54") then
	FWE_CarID = string.char(71)
        SWE_CarID = string.char(9)
        ACCLDWflag = true
 elseif (LibGeneral.CarTNC_C229(engine.CarType) == true) then
	FWE_CarID = string.char(74)
        SWE_CarID = string.char(74)
elseif (LibGeneral.CarTNC_HS7_AirS(engine.CarType) == false) then
	FWE_CarID = string.char(73)
        SWE_CarID = string.char(72)
elseif (LibGeneral.CarTNC_HS7_AirS(engine.CarType)) then
	FWE_CarID = string.char(72)
        SWE_CarID = string.char(72)
        AirSFlag = true
else
	FWE_CarID = nil
	print("CarID Error!! @Depin")
end
if (FWE_CarID ~= nil and SWE_CarID ~= nil) then
	print("FWE_CarID:"..string.byte(FWE_CarID))
        print("SWE_CarID:"..string.byte(SWE_CarID))
end
if (AirSFlag == true) then
	print("当前车有空气悬架")
else
	print("当前车没有空气悬架")
end

buslogvin = engine.VIN ;
print(buslogvin)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="车型错误">
<Rect left="650" top="584" right="750" bottom="616"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"车型查找不到..")
engine.SetLineText(2,engine.CarType)
engine.DialogBackColor = "red";
#PRESSBUTTON</Script></Activity>
<Activity id="212" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="860" top="754" right="960" bottom="786"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="false"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="510" top="884" right="610" bottom="916"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="1244" right="996" bottom="1276"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="104" right="996" bottom="136"/>
</Activity>
<Activity id="221" ActivityType="5" flags="0" name="HS7前束工位">
<Rect left="370" top="704" right="470" bottom="736"/>
<SubProcesses>
<SubProcess id="HS7前束工位">
<Parameters>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
<Parameter id="AirSFlag" value="AirSFlag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="824" right="716" bottom="856"/>
</Activity>
<Activity id="224" ActivityType="3" flags="0" name="检测OBD">
<Rect left="510" top="104" right="610" bottom="136"/>
<TitleText Enable="1" Text="前束工位"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请连接OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ExecuteRpdPending();
engine.WorkPlace = "FWE"


engine.DialogBackColor = -1
while(0 == bit32.band(engine.VciStatus,0x01)) do
	engine.Delay(300)
        --engine.ExecuteRpdPending();
end

engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")

</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="断开OBD">
<Rect left="510" top="1244" right="610" bottom="1276"/>
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
<Activity id="233" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="510" top="524" right="610" bottom="556"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="238" ActivityType="5" flags="0" name="IDTM连接">
<Rect left="510" top="464" right="610" bottom="496"/>
<SubProcesses>
<SubProcess id="IDTM连接">
<Parameters>
<Parameter id="Result" value="1" ret="Result"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="退出红外">
<Rect left="190" top="524" right="290" bottom="556"/>
<Script></Script></Activity>
<Activity id="240" ActivityType="5" flags="0" name="IDTM断开">
<Rect left="510" top="944" right="610" bottom="976"/>
<SubProcesses>
<SubProcess id="IDTM断开">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="241" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="944" right="290" bottom="976"/>
<Script></Script></Activity>
<Activity id="247" ActivityType="3" flags="0" name="测试用VMT连接有线">
<Rect left="650" top="464" right="750" bottom="496"/>
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
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="464" right="856" bottom="496"/>
</Activity>
<Activity id="249" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="1184" right="856" bottom="1216"/>
</Activity>
<Activity id="250" ActivityType="5" flags="0" name="IDTM断开">
<Rect left="510" top="404" right="610" bottom="436"/>
<SubProcesses>
<SubProcess id="IDTM断开">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="251" ActivityType="13" flags="0" name="StatisticResultList_ShowPID">
<Rect left="510" top="824" right="610" bottom="856"/>
<FunctionRef id="StatisticResultList_ShowPID" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="344" right="716" bottom="376"/>
</Activity>
<Activity id="253" ActivityType="3" flags="0" name="Route ADD">
<Rect left="510" top="344" right="610" bottom="376"/>
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
<Activity id="254" ActivityType="3" flags="0" name="Read_Time">
<Rect left="510" top="284" right="610" bottom="316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DTimeALSTotalStart = os.clock();
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="255" ActivityType="3" flags="0" name="ReadTime">
<Rect left="510" top="764" right="610" bottom="796"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DTimeALSTotalStart = os.clock() - DTimeALSTotalStart;
DTimeALSTotalStart = string.format("%d",DTimeALSTotalStart);

engine.LastError = 0;
engine.StatValue = "Test time ALS Total :"..tostring(DTimeALSTotalStart);</Script><assessment block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284" no="90" name="DEP2517" type="8" flags="97"/>
</Activity>
<Activity id="256" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="370" top="284" right="470" bottom="316"/>
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
<Activity id="257" ActivityType="3" flags="0" name="BusLog准备完成">
<Rect left="370" top="344" right="470" bottom="376"/>
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
<Activity id="258" ActivityType="3" flags="0" name="BusLog准备">
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
<Rect left="370" top="164" right="470" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="BusLog准备连接"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="通讯">
<Rect left="370" top="224" right="470" bottom="256"/>
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
<Activity id="260" ActivityType="3" flags="0" name="结束通讯">
<Rect left="90" top="164" right="190" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="261" ActivityType="3" flags="0" name="通讯失败">
<Rect left="90" top="224" right="190" bottom="256"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="90" top="284" right="190" bottom="316"/>
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
<Activity id="338" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="510" top="1004" right="610" bottom="1036"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="339" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="510" top="1064" right="610" bottom="1096"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="340" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="510" top="1124" right="610" bottom="1156"/>
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
<Rect left="510" top="1184" right="610" bottom="1216"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="342" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="1244" right="156" bottom="1276"/>
</Activity>
<Activity id="343" ActivityType="3" flags="0" name="buslog变量设置">
<Rect left="510" top="164" right="610" bottom="196"/>
<Script>
--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"
</Script></Activity>
<Activity id="344" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="510" top="224" right="610" bottom="256"/>
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
<Activity id="345" ActivityType="5" flags="0" name="C229前束工位">
<Rect left="260" top="704" right="360" bottom="736"/>
<SubProcesses>
<SubProcess id="C229前束工位">
<Parameters>
<Parameter id="FWE_CarID" value="FWE_CarID"/>
<Parameter id="SWE_CarID" value="SWE_CarID"/>
<Parameter id="AirSFlag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="346" ActivityType="3" flags="0" name="普通节点">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script>engine.ExecuteRpdPending();
engine.WorkPlace = "FWE"
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="346" type="0">
</Transition>
<Transition StartId="183" EndId="255" type="0">
</Transition>
<Transition StartId="188" EndId="183" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="1">
<Expression>FWE_CarID == nil</Expression></Transition>
<Transition StartId="209" EndId="221" type="1">
<Expression>LibGeneral.CarTNC_HS7(engine.CarType)</Expression></Transition>
<Transition StartId="209" EndId="188" type="0">
</Transition>
<Transition StartId="209" EndId="345" type="1">
<Expression>LibGeneral.CarTNC_C229(engine.CarType)</Expression></Transition>
<Transition StartId="210" EndId="222" type="0">
</Transition>
<Transition StartId="213" EndId="240" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="224" type="0">
</Transition>
<Transition StartId="221" EndId="255" type="0">
</Transition>
<Transition StartId="222" EndId="251" type="0">
</Transition>
<Transition StartId="224" EndId="343" type="0">
</Transition>
<Transition StartId="225" EndId="218" type="0">
</Transition>
<Transition StartId="233" EndId="209" type="0">
</Transition>
<Transition StartId="238" EndId="233" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="1">
<Expression>Result == 1</Expression></Transition>
<Transition StartId="239" EndId="241" type="0">
</Transition>
<Transition StartId="240" EndId="338" type="0">
</Transition>
<Transition StartId="241" EndId="240" type="0">
</Transition>
<Transition StartId="247" EndId="248" type="4">
</Transition>
<Transition StartId="248" EndId="249" type="0">
</Transition>
<Transition StartId="249" EndId="225" type="0">
</Transition>
<Transition StartId="250" EndId="238" type="0">
</Transition>
<Transition StartId="251" EndId="213" type="0">
</Transition>
<Transition StartId="252" EndId="233" type="0">
</Transition>
<Transition StartId="253" EndId="250" type="0">
</Transition>
<Transition StartId="254" EndId="252" type="0">
</Transition>
<Transition StartId="254" EndId="253" type="1">
<Expression>engine.VmtId==100 or engine.VmtId==101</Expression></Transition>
<Transition StartId="255" EndId="251" type="0">
</Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="254" type="0">
</Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="261" type="4">
</Transition>
<Transition StartId="259" EndId="256" type="0">
</Transition>
<Transition StartId="260" EndId="258" type="0">
</Transition>
<Transition StartId="261" EndId="260" type="0">
</Transition>
<Transition StartId="261" EndId="262" type="5">
</Transition>
<Transition StartId="262" EndId="342" type="0">
</Transition>
<Transition StartId="338" EndId="339" type="0">
</Transition>
<Transition StartId="339" EndId="340" type="0">
</Transition>
<Transition StartId="340" EndId="341" type="0">
</Transition>
<Transition StartId="341" EndId="225" type="0">
</Transition>
<Transition StartId="342" EndId="225" type="0">
</Transition>
<Transition StartId="343" EndId="344" type="0">
</Transition>
<Transition StartId="344" EndId="254" type="0">
</Transition>
<Transition StartId="345" EndId="255" type="0">
</Transition>
<Transition StartId="346" EndId="343" type="0">
</Transition>
</Transitions>
</Process>

