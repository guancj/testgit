<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164">
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
<Rect left="420" top="44" right="520" bottom="76"/>
<Script></Script><TitleText Enable="1" Text="读取发动机VIN码"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="420" top="454" right="520" bottom="486"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="13" flags="0" name="扩展会话">
<Rect left="420" top="194" right="520" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="6" ActivityType="13" flags="1" name="读VIN码">
<Rect left="420" top="264" right="520" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取VIN"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x90&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="处理VIN">
<Rect left="420" top="324" right="520" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="处理VIN码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>VIN = recvTel:sub(4,-1)
VIN = tostring(VIN)
local strVIN = VIN:sub(1,1)


if(#VIN == 17 and strVIN == "L") then
	engine.LastError = 0
	engine.VIN = VIN
        engine.ResultVid=VIN
	engine.SetLineText(2,VIN)
        engine.KNR = string.sub(VIN,10)
	engine.Delay(500)
else
	engine.LastError = 1
end

print("VIN:"..engine.VIN)
print("KNR:"..engine.KNR)
print("ResultVid:"..engine.ResultVid)
</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="420" top="384" right="520" bottom="416"/>
<Line2Text Enable="1" Text="结束通讯"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="读取VIN失败">
<Rect left="700" top="264" right="800" bottom="296"/>
<Script>engine.SetLineText(0,"发动机读VIN码失败!!!")
engine.SetLineText(1,"请扫描VIN码")

#INPUT DString_Write_VIN


engine.println("扫码:"..tostring(DString_Write_VIN));

</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="VIN处理">
<Rect left="700" top="334" right="800" bottom="366"/>
<Script>DString_Write_VIN=string.upper(DString_Write_VIN)
engine.VIN = DString_Write_VIN
engine.KNR = string.sub(DString_Write_VIN,10)
engine.ResultVid=DString_Write_VIN
engine.SetLineText(2,DString_Write_VIN);
engine.SelectLayout(0);
engine.ShowMessage();
engine.LastError = 1

print("VIN:"..engine.VIN)
print("KNR:"..engine.KNR)
print("ResultVid:"..engine.ResultVid)</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="204" right="766" bottom="236"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="VIN码长度有误，重新扫描">
<Rect left="850" top="264" right="950" bottom="296"/>
<Line1Text Enable="1" Text="VIN码长度有误"/>
<Line2Text Enable="1" Text="请重新扫描"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="通讯失败">
<Rect left="290" top="194" right="390" bottom="226"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="211" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="290" top="124" right="390" bottom="156"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="420" top="124" right="520" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="连接ECU"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="215" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="560" top="264" right="660" bottom="296"/>
<Line2Text Enable="1" Text="结束通讯"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="214" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="3">
</Transition>
<Transition StartId="4" EndId="22" type="4">
</Transition>
<Transition StartId="6" EndId="7" type="3">
</Transition>
<Transition StartId="6" EndId="215" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="3">
</Transition>
<Transition StartId="7" EndId="215" type="0">
</Transition>
<Transition StartId="8" EndId="2" type="0">
</Transition>
<Transition StartId="9" EndId="18" type="1">
<Expression>((#DString_Write_VIN==17) or (#DString_Write_VIN==8)) </Expression></Transition>
<Transition StartId="9" EndId="21" type="0">
</Transition>
<Transition StartId="18" EndId="2" type="0">
</Transition>
<Transition StartId="19" EndId="9" type="0">
</Transition>
<Transition StartId="21" EndId="19" type="0">
</Transition>
<Transition StartId="22" EndId="211" type="0">
</Transition>
<Transition StartId="22" EndId="215" type="5">
</Transition>
<Transition StartId="211" EndId="214" type="0">
</Transition>
<Transition StartId="214" EndId="4" type="0">
</Transition>
<Transition StartId="215" EndId="9" type="0">
</Transition>
</Transitions>
</Process>

