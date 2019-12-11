<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="pHndl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="isOK" type="8" dir="1" data=""/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" top="84" right="310" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="514" right="310" bottom="546"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="请鸣笛">
<Rect left="210" top="144" right="310" bottom="176"/>
<Line1Text Enable="1" Text="喇叭检测"/>
<Line2Text Enable="1" Text="请鸣笛"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_1 = nil;
Pram_3re = 1</Script></Activity>
<Activity id="8" ActivityType="4" flags="0" name="路由节点">
<Rect left="364" top="264" right="396" bottom="296"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="喇叭测量值比对">
<Rect left="210" top="304" right="310" bottom="336"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="112"/>
<Parameter id="LowerLimit" value="93"/>
<Parameter id="MeasValue" value="LouderSpeak_value"/>
<Parameter id="RightViewText" value="&quot;喇叭分贝&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;db&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="9" name="DEP1458" type="8" flags="105"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="IDT报文获取">
<Rect left="210" top="204" right="310" bottom="236"/>
<Line1Text Enable="1" Text="喇叭检测"/>
<Line2Text Enable="1" Text="请鸣笛"/>
<Script>local idt_tel = engine.UdpHandleVarGet(pHndl, "_LASTREVTEL");

print("LouderSpeakRev:"..LibGeneral.hex2str(idt_tel))

LouderSpeak_value = string.byte(idt_tel:sub(41,41));

engine.println("##### value : " .. LouderSpeak_value .. "\n");

</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="普通节点">
<Rect left="70" top="254" right="170" bottom="286"/>
<Line1Text Enable="1" Text="喇叭检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_3re = Pram_3re + 1
engine.Delay(3000)</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="普通节点">
<Rect left="210" top="374" right="310" bottom="406"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>if(engine.LastError == 0)then
    engine.LastError = 0
elseif( engine.LastError ~= 0 and Pram_3re ~= 3)then
ret = false
elseif( engine.LastError ~= 0 and Pram_3re == 3)then
ret = true
isOK = 3
else
isOK = 3
end</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="重新测试判断">
<Rect left="70" top="454" right="170" bottom="486"/>
<Line1Text Enable="1" Text="喇叭测量失败"/>
<Line2Text Enable="1" Text="是否重新测试？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
Pram_3re = 0
elseif(engine.LButtonPressed==true)then
isOK = 3
else
end
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="10" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="9" EndId="12" type="0">
</Transition>
<Transition StartId="10" EndId="9" type="0">
</Transition>
<Transition StartId="11" EndId="10" type="0">
</Transition>
<Transition StartId="12" EndId="2" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="1">
<Expression>ret == false</Expression></Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="13" EndId="2" type="0">
</Transition>
<Transition StartId="13" EndId="11" type="6">
</Transition>
</Transitions>
</Process>

