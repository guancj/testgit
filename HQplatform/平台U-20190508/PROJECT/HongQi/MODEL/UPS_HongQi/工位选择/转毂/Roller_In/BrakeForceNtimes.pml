<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0"/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="440" top="54" right="540" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="440" top="1224" right="540" bottom="1256"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="440" top="124" right="540" bottom="156"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1339" ActivityType="13" flags="0" name="扩展会话">
<Rect left="440" top="184" right="540" bottom="216"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1340" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="570" top="184" right="670" bottom="216"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1342" ActivityType="3" flags="0" name="加速至60km/h">
<Rect left="440" top="314" right="540" bottom="346"/>
<Line1Text Enable="1" Text="请加速至60km/h"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1343" ActivityType="3" flags="0" name="车速换算">
<Rect left="440" top="444" right="540" bottom="476"/>
<Script>--vehicle_speed = string.sub(DVciResult_speed,4,5);
--vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
--vehicle_speed = vehicle_speed * 0.0078125
vehicle_speed = ReadSpeed_FL
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1344" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="440" top="584" right="540" bottom="616"/>
<Script></Script></Activity>
<Activity id="1345" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="374" right="656" bottom="406"/>
</Activity>
<Activity id="1346" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="584" right="656" bottom="616"/>
</Activity>
<Activity id="1347" ActivityType="3" flags="0" name="IDT速度">
<Rect left="440" top="374" right="540" bottom="406"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01


curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
        
tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
tmpFL2 = string.byte(curtRevTel:sub(14,14))
ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor


		


</Script></Activity>
<Activity id="1364" ActivityType="13" flags="0" name="Tolerance_view_Float_Atime">
<Rect left="440" top="504" right="540" bottom="536"/>
<FunctionRef id="Tolerance_view_Float_Atime" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="70.0"/>
<Parameter id="LowerLimit" value="50.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="300"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1365" ActivityType="3" flags="0" name="踩刹车使车停止">
<Rect left="440" top="674" right="540" bottom="706"/>
<Line1Text Enable="1" Text="踩刹车使车停止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil</Script></Activity>
<Activity id="1366" ActivityType="3" flags="0" name="车速换算">
<Rect left="440" top="824" right="540" bottom="856"/>
<Script>--vehicle_speed = string.sub(DVciResult_speed,4,5);
--vehicle_speed = LibGeneral.binStr2Int(vehicle_speed)
--vehicle_speed = vehicle_speed * 0.0078125
vehicle_speed = ReadSpeed_FL
engine.println("### 读取车速 vehicle_speed ##"..vehicle_speed);</Script></Activity>
<Activity id="1367" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="440" top="964" right="540" bottom="996"/>
<Script></Script></Activity>
<Activity id="1368" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="754" right="686" bottom="786"/>
</Activity>
<Activity id="1369" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="964" right="686" bottom="996"/>
</Activity>
<Activity id="1370" ActivityType="3" flags="1" name="IDT速度">
<Rect left="440" top="754" right="540" bottom="786"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01


curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
        
tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
tmpFL2 = string.byte(curtRevTel:sub(14,14))
ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor


		


</Script></Activity>
<Activity id="1371" ActivityType="13" flags="0" name="Tolerance_view_Float_Atime">
<Rect left="440" top="884" right="540" bottom="916"/>
<FunctionRef id="Tolerance_view_Float_Atime" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="5.0"/>
<Parameter id="LowerLimit" value="0.0"/>
<Parameter id="MeasValue" value="vehicle_speed"/>
<Parameter id="RightViewText" value="&quot;当前车速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="300"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;km/h&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1372" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="1034" right="766" bottom="1066"/>
</Activity>
<Activity id="1375" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="440" top="1154" right="540" bottom="1186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1377" ActivityType="3" flags="0" name="RepeatTest">
<Rect left="580" top="1064" right="680" bottom="1096"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="需要重新进行刹车测试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="退出"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1378" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="314" right="766" bottom="346"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1339" type="0">
</Transition>
<Transition StartId="1339" EndId="1340" type="4">
</Transition>
<Transition StartId="1339" EndId="1342" type="0">
</Transition>
<Transition StartId="1342" EndId="1347" type="0">
</Transition>
<Transition StartId="1343" EndId="1364" type="0">
</Transition>
<Transition StartId="1344" EndId="1346" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1344" EndId="1365" type="0">
</Transition>
<Transition StartId="1345" EndId="1347" type="0">
</Transition>
<Transition StartId="1346" EndId="1345" type="0">
</Transition>
<Transition StartId="1347" EndId="1343" type="0">
</Transition>
<Transition StartId="1364" EndId="1344" type="0">
</Transition>
<Transition StartId="1365" EndId="1370" type="0">
</Transition>
<Transition StartId="1366" EndId="1371" type="0">
</Transition>
<Transition StartId="1367" EndId="1369" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="1367" EndId="1375" type="0">
</Transition>
<Transition StartId="1368" EndId="1370" type="0">
</Transition>
<Transition StartId="1369" EndId="1368" type="0">
</Transition>
<Transition StartId="1370" EndId="1366" type="0">
</Transition>
<Transition StartId="1371" EndId="1367" type="0">
</Transition>
<Transition StartId="1372" EndId="1378" type="0">
</Transition>
<Transition StartId="1375" EndId="2" type="0">
</Transition>
<Transition StartId="1377" EndId="1372" type="6">
</Transition>
<Transition StartId="1378" EndId="1342" type="0">
</Transition>
</Transitions>
</Process>

