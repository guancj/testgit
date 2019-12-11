<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3101" pbltext="DEP2454">
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
<Variable id="CAN_SND_ID" type="3" data="0x790" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x798" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="620" top="34" right="720" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="EBS(蓄电池传感器)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="620" top="804" right="720" bottom="836"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script><TitleText Enable="1"/>
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
<Rect left="620" top="94" right="720" bottom="126"/>
<Line1Text Enable="1" Text="连接EBS"/>
<Line2Text Enable="1"/>
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
<assessment no="1" name="DEP2455" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="写ID">
<Rect left="1310" top="254" right="1410" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写ID"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2E"/>
<Parameter id="resTitle" value="0x6E"/>
<Parameter id="sendTel" value="&apos;\x00\xB2\x38&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP2105" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="读ID">
<Rect left="1310" top="564" right="1410" bottom="596"/>
<Line2Text Enable="1" Text="读ID"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x00\xB2&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP2106" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="比对ID">
<Rect left="620" top="744" right="720" bottom="776"/>
<Line2Text Enable="1" Text="ID比对"/>
<Script>if(engine.LastError == 0 or recvTel_1 == 110) then
	engine.LastError = 0
        engine.SetLineText(2,"比对成功");
        engine.println("比对成功:"..recvTel_1);
else
	engine.LastError =1
         engine.SetLineText(2,"比对失败");
         engine.println("比对失败:"..recvTel_1);
end
DString1 =recvTel:byte(4)
engine.StatValue=hexstr(recvTel );
engine.StatPoint= "写ID回复6E就为合格" ;</Script><assessment no="4" name="DEP2107" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="通讯失败">
<Rect left="210" top="184" right="310" bottom="216"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="209" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="210" top="94" right="310" bottom="126"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="306" ActivityType="3" flags="0" name="通讯后等2秒">
<Rect left="620" top="184" right="720" bottom="216"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="866" ActivityType="4" flags="0" name="路由节点">
<Rect left="244" top="804" right="276" bottom="836"/>
</Activity>
<Activity id="882" ActivityType="3" flags="0" name="读ID">
<Rect left="480" top="544" right="580" bottom="576"/>
<Line2Text Enable="1" Text="读ID"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x00\xB2"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,request)

if(engine.LastError == 0) then
	engine.LastError = 0
       engine.SetLineText(2,"读取ID成功");
        engine.println("读取ID成功:"..@3);
else
	engine.LastError = 1
       engine.SetLineText(2,"读取ID失败");
         engine.println("读取ID失败:"..@3);
end</Script><assessment no="3" name="DEP2106" type="8" flags="97"/>
</Activity>
<Activity id="887" ActivityType="3" flags="0" name="写ID">
<Rect left="620" top="344" right="720" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写ID"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>request = "\x00\xB2\x38"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)
recvTel_1 = @0
if(engine.LastError == 0)then
engine.SetLineText(2,"写入ID成功");
engine.println("写入ID成功:");
else
engine.LastError = 1;
engine.SetLineText(2,"写入ID失败");
engine.println("写入ID失败");
end</Script><assessment no="2" name="DEP2105" type="8" flags="97"/>
</Activity>
<Activity id="888" ActivityType="3" flags="0" name="计数">
<Rect left="420" top="344" right="520" bottom="376"/>
<Line2Text Enable="1" Text="写ID失败，自动重试"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>i = i+1;
engine.Delay(1000);</Script></Activity>
<Activity id="889" ActivityType="3" flags="0" name="计数初始化">
<Rect left="620" top="264" right="720" bottom="296"/>
<Script>i = 1;
v = 1;</Script></Activity>
<Activity id="890" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="444" right="616" bottom="476"/>
</Activity>
<Activity id="891" ActivityType="4" flags="0" name="路由节点">
<Rect left="454" top="404" right="486" bottom="436"/>
</Activity>
<Activity id="892" ActivityType="3" flags="0" name="计数">
<Rect left="310" top="544" right="410" bottom="576"/>
<Line2Text Enable="1" Text="读ID失败，自动重试"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>v = v+1;
engine.Delay(1000);</Script></Activity>
<Activity id="893" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="614" right="376" bottom="646"/>
</Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="614" right="476" bottom="646"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="9" type="4">
</Transition>
<Transition StartId="3" EndId="306" type="0">
</Transition>
<Transition StartId="7" EndId="2" type="0">
</Transition>
<Transition StartId="9" EndId="209" type="0">
</Transition>
<Transition StartId="9" EndId="866" type="5">
</Transition>
<Transition StartId="209" EndId="3" type="0">
</Transition>
<Transition StartId="306" EndId="889" type="0">
</Transition>
<Transition StartId="866" EndId="2" type="0">
</Transition>
<Transition StartId="882" EndId="7" type="1">
<Expression>engine.LastError == 0 or v == 3</Expression></Transition>
<Transition StartId="882" EndId="892" type="1">
<Expression>engine.LastError ~= 0 and v ~= 3</Expression></Transition>
<Transition StartId="882" EndId="894" type="0">
</Transition>
<Transition StartId="887" EndId="888" type="1">
<Expression>engine.LastError ~= 0 and i ~= 5</Expression></Transition>
<Transition StartId="887" EndId="7" type="1">
<Expression>engine.LastError == 0 or i == 5</Expression></Transition>
<Transition StartId="887" EndId="890" type="0">
</Transition>
<Transition StartId="888" EndId="891" type="0">
</Transition>
<Transition StartId="889" EndId="887" type="0">
</Transition>
<Transition StartId="890" EndId="7" type="0">
</Transition>
<Transition StartId="891" EndId="887" type="0">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="893" EndId="882" type="0">
</Transition>
<Transition StartId="894" EndId="7" type="0">
</Transition>
</Transitions>
</Process>

