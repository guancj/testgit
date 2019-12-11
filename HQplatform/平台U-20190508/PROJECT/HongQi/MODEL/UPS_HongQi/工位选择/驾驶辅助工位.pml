<?xml version="1.0" encoding="utf-8" ?>
<Process>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="440" top="64" right="540" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="440" top="1104" right="540" bottom="1136"/>
<Script></Script></End>
<Activities>
<Activity id="12" ActivityType="5" flags="0" name="FAS标定">
<Rect left="440" top="554" right="540" bottom="586"/>
<SubProcesses>
<SubProcess id="FAS标定">
<Parameters>
<Parameter id="PosStation" value="ExecuteFlag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="17" ActivityType="13" flags="1" name="StatisticResultList">
<Rect left="440" top="684" right="540" bottom="716"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="440" top="754" right="540" bottom="786"/>
<Script>

engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="234" ActivityType="3" flags="0" name="检测内容以及车型区分">
<Rect left="440" top="494" right="540" bottom="526"/>
<Script>if (LibGeneral.CarTNC_HS7(engine.CarType)) then
	if (LibGeneral.HS7_BackShow(engine.CarType))then
		ExecuteFlag = "BackShow" 
        end
	if (LibGeneral.HS7_IFC(engine.CarType))then
		ExecuteFlag = "IFC" 
        end		
	if (LibGeneral.HS7_IFCandBSD(engine.CarType))then
		ExecuteFlag = "IFC_BSD" 
        end  
        engine.SharedVarSet("vehicleID","HS7") 
else
	if (LibGeneral.H7_BSD(engine.CarType)) then
		ExecuteFlag = "H7BSD" 
        else
		ExecuteFlag = "H7Back"
        end
	
	engine.SharedVarSet("vehicleID","H7") 
end

print("ExecuteFlag = "..tostring(ExecuteFlag))
buslogvin = engine.VIN ;
print(buslogvin)
--本地Buslog文件上传至服务器路径
buslogpend = engine.ProgPath.."Buslog\\UpsPending\\"..buslogvin..buslogworkplace..buslogdate..".log"</Script></Activity>
<Activity id="237" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="440" top="434" right="540" bottom="466"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="239" ActivityType="4" flags="0" name="路由节点">
<Rect left="794" top="1054" right="826" bottom="1086"/>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="检测OBD">
<Rect left="440" top="124" right="540" bottom="156"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请连接OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.WorkPlace = "FAS"
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
<Activity id="241" ActivityType="3" flags="0" name="断开OBD">
<Rect left="440" top="1054" right="540" bottom="1086"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请断开OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow"
engine.Delay(2000)
while(1 == bit32.band(engine.VciStatus,0x01)) do
	engine.Delay(300)
end
engine.DialogBackColor = -1
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
<Activity id="242" ActivityType="4" flags="0" name="路由节点">
<Rect left="794" top="124" right="826" bottom="156"/>
</Activity>
<Activity id="243" ActivityType="3" flags="0" name="同步服务器时间">
<Rect left="440" top="254" right="540" bottom="286"/>
<Script>--answer = ExecuteProcess("C:\\Windows\\System32\\net.exe","C:\\Windows\\System32\\net.exe time \\\\10.134.184.2 /set /yes",0,false) 

local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)

--buslog 写入地址
buslogworkplace = engine.WorkPlace;
buslogdate = os.date("%Y%m%d%H%M%S");
engine.println("Buslog文件生成时间"..buslogdate)
--本地暂存Buslog文件路径
BuslogPath = engine.ProgPath.."Buslog\\"..buslogworkplace..buslogdate..".log"

</Script></Activity>
<Activity id="244" ActivityType="3" flags="0" name="Read_Time_For_BSD">
<Rect left="440" top="324" right="540" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>BSDTimestart = os.clock();
engine.SharedVarSet("BSDTimestart_shared",BSDTimestart)</Script></Activity>
<Activity id="245" ActivityType="3" flags="0" name="StatisticResult_BackColor">
<Rect left="290" top="704" right="390" bottom="736"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>local StatisticTestResult = engine.GetResults();
if(engine.TestResult ~= 0 and #StatisticTestResult ~= 0) then
	engine.DialogBackColor = "red";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test NOK");
        engine.Delay(2000);
elseif(engine.TestResult == 0 and #StatisticTestResult ~= 0) then
	engine.DialogBackColor = "green";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test OK");
        engine.Delay(2000);
end;
        engine.SetTitleText("")
        engine.SetLineText(2,"");
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="Read_Time">
<Rect left="440" top="184" right="540" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DTimeBSDTotalStart = os.clock();</Script></Activity>
<Activity id="255" ActivityType="3" flags="0" name="ReadTime">
<Rect left="440" top="614" right="540" bottom="646"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>DTimeBSDTotalStart = os.clock() - DTimeBSDTotalStart;
DTimeBSDTotalStart = string.format("%d",DTimeBSDTotalStart);

engine.LastError = 0;
engine.StatValue = "Test time BSD Total :"..tostring(DTimeBSDTotalStart);</Script><assessment block="1" ptbtext="DEP164" group="3040" pbltext="DEP2333" no="14" name="DEP2518" type="8" flags="97"/>
</Activity>
<Activity id="256" ActivityType="13" flags="0" name="Buslog_Open">
<Rect left="160" top="434" right="260" bottom="466"/>
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
<Rect left="300" top="434" right="400" bottom="466"/>
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
<Rect left="160" top="324" right="260" bottom="356"/>
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
<Rect left="160" top="374" right="260" bottom="406"/>
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
<Rect left="30" top="324" right="130" bottom="356"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="261" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="374" right="130" bottom="406"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="BusLog准备失败">
<Rect left="30" top="434" right="130" bottom="466"/>
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
<Activity id="263" ActivityType="13" flags="0" name="Buslog_Close">
<Rect left="610" top="824" right="710" bottom="856"/>
<Line2Text Enable="1"/>
<FunctionRef id="Buslog_Close" model="LibGeneral">
<Parameters>
<Parameter id="iObdHandle" value="ObdHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="264" ActivityType="13" flags="0" name="Read_buslog">
<Rect left="610" top="884" right="710" bottom="916"/>
<Line2Text Enable="1" Text="读取buslog"/>
<FunctionRef id="Readfile" model="LibGeneral">
<Parameters>
<Parameter id="Datapath" value="BuslogPath"/>
<Parameter id="content" ret="content"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="340" ActivityType="13" flags="0" name="Write_buslog">
<Rect left="610" top="944" right="710" bottom="976"/>
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
<Rect left="610" top="1004" right="710" bottom="1036"/>
<Line2Text Enable="1" Text="删除本地Buslog"/>
<Script>os.remove(BuslogPath);</Script></Activity>
<Activity id="342" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="1054" right="96" bottom="1086"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="240" type="0">
</Transition>
<Transition StartId="12" EndId="255" type="0">
</Transition>
<Transition StartId="17" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="241" type="0">
</Transition>
<Transition StartId="234" EndId="12" type="0">
</Transition>
<Transition StartId="237" EndId="234" type="0">
</Transition>
<Transition StartId="239" EndId="242" type="0">
</Transition>
<Transition StartId="240" EndId="246" type="0">
</Transition>
<Transition StartId="241" EndId="239" type="0">
</Transition>
<Transition StartId="242" EndId="240" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="237" type="0">
</Transition>
<Transition StartId="245" EndId="155" type="0">
</Transition>
<Transition StartId="246" EndId="243" type="0">
</Transition>
<Transition StartId="255" EndId="17" type="0">
</Transition>
<Transition StartId="256" EndId="257" type="0">
</Transition>
<Transition StartId="257" EndId="237" type="0">
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
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="340" type="0">
</Transition>
<Transition StartId="340" EndId="341" type="0">
</Transition>
<Transition StartId="342" EndId="241" type="0">
</Transition>
</Transitions>
</Process>

