<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3036" pbltext="DEP1818">
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
<Variable id="CAN_SND_ID" type="3" data="0x730" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="280" top="4" right="380" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="ALS(智能大灯控制器)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="280" top="904" right="380" bottom="936"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="280" top="64" right="380" bottom="96"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="280" top="144" right="380" bottom="176"/>
<Line2Text Enable="1" Text="扩展会话"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP1819" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="280" top="224" right="380" bottom="256"/>
<Line2Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xFD31CF42"/>
</Parameters>
</FunctionRef>
<assessment no="5" name="DEP1823" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="控制执行器到最小位置">
<Rect left="280" top="294" right="380" bottom="326"/>
<Line2Text Enable="1" Text="控制执行器到最小位置"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC1\x00\x03\x01&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP2445" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="控制执行器到中间位置">
<Rect left="280" top="414" right="380" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="控制执行器到中间位置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC1\x00\x03\x02&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP2447" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="控制执行器到最大位置">
<Rect left="280" top="544" right="380" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="控制执行器到最大位置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC1\x00\x03\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP2449" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="判断最小位置">
<Rect left="280" top="354" right="380" bottom="386"/>
<Script>local ncount
ncount = 0
repeat
	local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x2B\xA7")

	local comVal = recvTel:sub(4,5)

	comVal = LibGeneral.binStr2Int(comVal)
	print("ALS执行器最小位置:"..comVal)
	engine.Delay(500)
        ncount = ncount + 1
until(ncount &lt; 10)</Script><assessment no="31" name="DEP2446" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="判断中间位置">
<Rect left="280" top="484" right="380" bottom="516"/>
<Script>local ncount
ncount = 0
repeat
	local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x2B\xA7")

	local comVal = recvTel:sub(4,5)

	comVal = LibGeneral.binStr2Int(comVal)
	print("ALS执行器中间位置:"..comVal)
	engine.Delay(500)
        ncount = ncount + 1
until(ncount &lt; 10)</Script><assessment no="34" name="DEP2448" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="判断最大位置">
<Rect left="280" top="604" right="380" bottom="636"/>
<Script>local ncount
ncount = 0
repeat
	local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x2B\xA7")

	local comVal = recvTel:sub(4,5)

	comVal = LibGeneral.binStr2Int(comVal)
	print("ALS执行器最大位置:"..comVal)
	engine.Delay(500)
        ncount = ncount + 1
until(ncount &lt; 10)</Script><assessment no="36" name="DEP2450" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="280" top="844" right="380" bottom="876"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="返回控制">
<Rect left="280" top="664" right="380" bottom="696"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC1\x00\x00&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="37" name="DEP2451" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="前轴高度传感器值">
<Rect left="280" top="724" right="380" bottom="756"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x2B\xA1")

local comVal = recvTel:sub(4,5)

comVal = LibGeneral.binStr2Int(comVal)
engine.SetLineText(1,"前轴高度传感器值"..comVal)
print("前轴高度传感器值:"..comVal)
engine.Delay(50)
</Script><assessment no="38" name="DEP2452" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="后轴高度传感器值">
<Rect left="280" top="784" right="380" bottom="816"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x2B\xA0")

local comVal = recvTel:sub(4,5)

comVal = LibGeneral.binStr2Int(comVal)
engine.SetLineText(1,"前轴高度传感器值".. comVal)
print("后轴高度传感器值:"..comVal)
engine.Delay(50)
</Script><assessment no="39" name="DEP2453" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="140" top="64" right="240" bottom="96"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="3" flags="0" name="通讯失败">
<Rect left="140" top="144" right="240" bottom="176"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="215" ActivityType="4" flags="0" name="路由节点">
<Rect left="174" top="844" right="206" bottom="876"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="214" type="4">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="9" type="0">
</Transition>
<Transition StartId="7" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="7" type="0">
</Transition>
<Transition StartId="10" EndId="8" type="0">
</Transition>
<Transition StartId="11" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="2" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="12" type="0">
</Transition>
<Transition StartId="16" EndId="3" type="0">
</Transition>
<Transition StartId="214" EndId="16" type="0">
</Transition>
<Transition StartId="214" EndId="215" type="5">
</Transition>
<Transition StartId="215" EndId="12" type="0">
</Transition>
</Transitions>
</Process>

