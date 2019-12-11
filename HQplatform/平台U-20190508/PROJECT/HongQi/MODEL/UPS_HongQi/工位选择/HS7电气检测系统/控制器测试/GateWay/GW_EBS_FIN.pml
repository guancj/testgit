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
<Rect left="620" top="504" right="720" bottom="536"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
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
<Activity id="7" ActivityType="3" flags="0" name="比对ID">
<Rect left="620" top="424" right="720" bottom="456"/>
<Line2Text Enable="1" Text="ID比对"/>
<Script>if(recvTel:byte(4) == 56) then
	engine.LastError = 0
        engine.SetLineText(2,"比对成功");
        engine.println("比对成功:"..@3);
else
	engine.LastError = 0
         engine.SetLineText(2,"比对失败");
         engine.println("比对失败:"..@3);
end
DString1 =recvTel:byte(4)
engine.StatValue=hexstr(recvTel );
engine.StatPoint= "0x38,20190713号确定更改失败也合格" ;</Script><assessment no="4" name="DEP2107" type="8" flags="105"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="通讯失败">
<Rect left="330" top="164" right="430" bottom="196"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="209" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="330" top="94" right="430" bottom="126"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="306" ActivityType="3" flags="0" name="通讯后等2秒">
<Rect left="620" top="184" right="720" bottom="216"/>
<Script>#DELAY 2000
v = 1;</Script></Activity>
<Activity id="307" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="504" right="396" bottom="536"/>
</Activity>
<Activity id="895" ActivityType="3" flags="0" name="读ID">
<Rect left="620" top="284" right="720" bottom="316"/>
<Line2Text Enable="1" Text="读ID"/>
<Script>request = "\x00\xB2"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,request)

if(engine.LastError == 0) then
	engine.LastError = 0
 --       engine.SetLineText(2,"读取ID成功");
        engine.println("读取ID成功:"..@3);
else
	engine.LastError =1
 --        engine.SetLineText(2,"读取ID失败");
         engine.println("读取ID失败,20190713号确定更改失败也合格:"..@3);
end
if(v == 3)then
engine.LastError =0
engine.println("读取ID失败,20190713号确定更改失败也合格:"..@3);
end</Script><assessment no="3" name="DEP2106" type="8" flags="97"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="计数">
<Rect left="770" top="284" right="870" bottom="316"/>
<Line2Text Enable="1" Text="读ID失败，自动重试"/>
<Script>v = v+1;
engine.Delay(1000);</Script></Activity>
<Activity id="897" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="364" right="836" bottom="396"/>
</Activity>
<Activity id="898" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="354" right="606" bottom="386"/>
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
<Transition StartId="9" EndId="307" type="5">
</Transition>
<Transition StartId="209" EndId="3" type="0">
</Transition>
<Transition StartId="306" EndId="895" type="0">
</Transition>
<Transition StartId="307" EndId="2" type="0">
</Transition>
<Transition StartId="895" EndId="7" type="1">
<Expression>engine.LastError == 0 or v == 3</Expression></Transition>
<Transition StartId="895" EndId="898" type="0">
</Transition>
<Transition StartId="895" EndId="896" type="1">
<Expression>engine.LastError ~= 0 and v ~= 3</Expression></Transition>
<Transition StartId="896" EndId="897" type="0">
</Transition>
<Transition StartId="897" EndId="895" type="0">
</Transition>
<Transition StartId="898" EndId="7" type="0">
</Transition>
</Transitions>
</Process>

