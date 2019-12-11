<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3025" pbltext="DEP1174">
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="550" top="64" right="650" bottom="96"/>
<Script></Script><TitleText Enable="1" Text="T-BOX"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="550" top="594" right="650" bottom="626"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="550" top="124" right="650" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="连接ECU"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="扩展会话">
<Rect left="550" top="184" right="650" bottom="216"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP1188" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="安全访问">
<Rect left="550" top="244" right="650" bottom="276"/>
<Line2Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xA7DB79EC"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP2111" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="EOL后台">
<Rect left="550" top="304" right="650" bottom="336"/>
<Line2Text Enable="1" Text="开启后台通讯"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xE7\x62&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP2112" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="延时15s">
<Rect left="550" top="374" right="650" bottom="406"/>
<Line2Text Enable="1" Text="等待15秒后读取结果"/>
<Script>for t=15,1,-1 do
engine.SetLineText(3,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="EOL后台检测结果">
<Rect left="550" top="444" right="650" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local ncount = 0

repeat
	ncount = ncount + 1
	recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xE7\x62")

	result = recvTel:sub(5,5)

	result = string.byte(result)

	engine.Delay(200)
until (result == 0 or ncount  == 13)

if (result == 0) then
	engine.LastError = 0
else
	engine.LastError = 1
end
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP2113" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="550" top="504" right="650" bottom="536"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="人工按下E-call开关">
<Rect left="880" top="234" right="980" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请按下E-call开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="读按钮状态">
<Rect left="880" top="294" right="980" bottom="326"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="180" DelayTime="300"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x60 0xDB
if(@0 == 0x62)then
	if(@3 == 0x01)then
		engine.LastError = 0;
                engine.TestResult = 0;
		engine.SetLineText(2,"读取按钮状态：已按下");
		engine.println("读取按钮状态：已按下");
	else
		engine.LastError = 1;
                engine.TestResult = 1;
		engine.SetLineText(2,"读取按钮状态：未按下");
		engine.println("读取按钮状态：未按下");
        end
else
	engine.TestResult = 1;
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="22" name="DEP2442" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="读指示灯状态">
<Rect left="880" top="354" right="980" bottom="386"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="180" DelayTime="300"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x60 0xDC
if(@0 == 0x62)then
	if(@3 == 0x01)then
		engine.LastError = 0;
                engine.TestResult = 0;
		engine.SetLineText(3,"读取指示灯状态：已点亮");
		engine.println("读取指示灯状态：已点亮");
	else
		engine.LastError = 1;
                engine.TestResult = 1;
		engine.SetLineText(2,"读取指示灯状态：未点亮");
		engine.println("读取指示灯状态：未点亮");
        end
else
	engine.TestResult = 1;
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="23" name="DEP2443" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="人工检查拨通状态并挂断">
<Rect left="880" top="404" right="980" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="人工检查拨通状态，然后请挂断"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="读指示灯状态">
<Rect left="880" top="464" right="980" bottom="496"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="180" DelayTime="300"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x60 0xDC
if(@0 == 0x62)then
	if(@3 == 0x01)then
		engine.LastError = 0;
                engine.TestResult = 0;
		engine.SetLineText(3,"读取指示灯状态：已点亮");
		engine.println("读取指示灯状态：已点亮");
	else
		engine.LastError = 1;
                engine.TestResult = 1;
		engine.SetLineText(2,"读取指示灯状态：未点亮");
		engine.println("读取指示灯状态：未点亮");
        end
else
	engine.TestResult = 1;
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="24" name="DEP2443" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="E-CALL功能检查">
<Rect left="880" top="184" right="980" bottom="216"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="通讯失败">
<Rect left="410" top="184" right="510" bottom="216"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="结束通讯">
<Rect left="410" top="124" right="510" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="504" right="476" bottom="536"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="设置循环变量">
<Rect left="720" top="244" right="820" bottom="276"/>
<Script>send_ok = 0;</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="累计次数">
<Rect left="720" top="444" right="820" bottom="476"/>
<Script>send_ok = send_ok + 1;</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="4" EndId="29" type="4">
</Transition>
<Transition StartId="6" EndId="41" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="42" type="4">
</Transition>
<Transition StartId="11" EndId="2" type="0">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="28" EndId="22" type="0">
</Transition>
<Transition StartId="29" EndId="39" type="0">
</Transition>
<Transition StartId="29" EndId="40" type="5">
</Transition>
<Transition StartId="39" EndId="3" type="0">
</Transition>
<Transition StartId="40" EndId="11" type="0">
</Transition>
<Transition StartId="41" EndId="7" type="0">
</Transition>
<Transition StartId="42" EndId="11" type="1">
<Expression>send_ok &gt;= 3</Expression></Transition>
<Transition StartId="42" EndId="7" type="0">
</Transition>
</Transitions>
</Process>

