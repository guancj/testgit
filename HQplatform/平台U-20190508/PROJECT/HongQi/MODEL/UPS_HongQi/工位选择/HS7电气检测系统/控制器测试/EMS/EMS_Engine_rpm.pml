<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3003" pbltext="DEP31">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特�?/"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="50" top="84" right="150" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="50" top="624" right="150" bottom="656"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="确认车辆非点火状态">
<Rect left="50" top="264" right="150" bottom="296"/>
<Line1Text Enable="1" Text="请确认车辆发动机非启动状态？"/>
<Line2Text Enable="1" Text="并处于上电状态"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
   engine.StatValue = "人工点击确定：车辆处于非启动并上电状态";
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.StatValue = "人工点击放弃：车辆处于非启动并上电状态";
else
end</Script><assessment no="60" name="DEP2496" type="8" flags="97"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="初始化变量">
<Rect left="50" top="324" right="150" bottom="356"/>
<Line1Text Enable="1" Text="读取发动机转速中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_2 = nil</Script></Activity>
<Activity id="1288" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="50" top="524" right="150" bottom="556"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1294" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="374" right="326" bottom="406"/>
</Activity>
<Activity id="1295" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="524" right="326" bottom="556"/>
</Activity>
<Activity id="1296" ActivityType="3" flags="0" name="转速换算">
<Rect left="50" top="424" right="150" bottom="456"/>
<Script>vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1299" ActivityType="13" flags="0" name="读取转速">
<Rect left="50" top="374" right="150" bottom="406"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x04&apos;"/>
<Parameter id="recvTel" ret="DVciResult_rpm"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1300" ActivityType="13" flags="0" name="车辆转速">
<Rect left="50" top="474" right="150" bottom="506"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="0"/>
<Parameter id="LowerLimit" value="0"/>
<Parameter id="MeasValue" value="vehicle_Rpm"/>
<Parameter id="RightViewText" value="&quot;转速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;Rpm&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="61" name="DEP2496" type="8" flags="97"/>
</Activity>
<Activity id="1305" ActivityType="3" flags="0" name="连接ECU">
<Rect left="50" top="144" right="150" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="连接ECU"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="1306" ActivityType="3" flags="0" name="通讯">
<Rect left="50" top="194" right="150" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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

end</Script><assessment no="80" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="1307" ActivityType="3" flags="0" name="通讯失败">
<Rect left="210" top="194" right="310" bottom="226"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="1308" ActivityType="3" flags="0" name="结束通讯">
<Rect left="210" top="144" right="310" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="1305" type="0">
</Transition>
<Transition StartId="3" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="1299" type="0">
</Transition>
<Transition StartId="1288" EndId="1295" type="1">
<Expression>FinishFlag_2 ==  false</Expression></Transition>
<Transition StartId="1288" EndId="2" type="0">
</Transition>
<Transition StartId="1294" EndId="1299" type="0">
</Transition>
<Transition StartId="1295" EndId="1294" type="0">
</Transition>
<Transition StartId="1296" EndId="1300" type="0">
</Transition>
<Transition StartId="1299" EndId="1296" type="0">
</Transition>
<Transition StartId="1300" EndId="1288" type="0">
</Transition>
<Transition StartId="1305" EndId="1306" type="0">
</Transition>
<Transition StartId="1306" EndId="1307" type="4">
</Transition>
<Transition StartId="1306" EndId="3" type="0">
</Transition>
<Transition StartId="1307" EndId="1308" type="0">
</Transition>
<Transition StartId="1308" EndId="1305" type="0">
</Transition>
</Transitions>
</Process>

