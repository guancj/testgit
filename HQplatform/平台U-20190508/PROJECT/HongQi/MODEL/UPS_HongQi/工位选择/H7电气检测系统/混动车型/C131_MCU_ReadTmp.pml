<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1032" pbltext="DEP1226">
<Parameters>
<Variable id="CommErr" type="3" dir="1" data="0"/>
<Variable id="tempValue" type="8" dir="1" data="0"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AA" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7CA" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="127" right="227" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="128" top="451" right="228" bottom="483"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电机控制系统（MCU）">
<Rect left="127" top="55" right="227" bottom="87"/>
<TitleText Enable="1" Text="电机控制系统（MCU）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="128" top="115" right="228" bottom="147"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="127" top="235" right="227" bottom="267"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1025" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="128" top="388" right="228" bottom="420"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="读电机温度">
<Rect left="127" top="298" right="227" bottom="330"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="300" DelayTime="100"/>
<Line1Text Enable="1" Text="读电机温度"/>
<Script>#COMM 0x22 0x11 0x1A
if(@0==0x62)then
local StringResHex
local DecValue
DecValue = @3*1-40;
print("电机水温DecValue"..DecValue);
if (DecValue&gt;=20 and DecValue&lt;=70) then
  engine.LastError = 0;
  tempValue=0;
else
  engine.LastError = 1;
  tempValue=1;
end
    engine.StatValue=DecValue;
    engine.StatLower=20;
    engine.StatUpper=70;
  engine.SetLineText(1,"电机水温");
  engine.SetLineText(2,DecValue);  
else
  engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP1026" type="8" flags="97"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10" top="169" right="110" bottom="201"/>
<Line1Text Enable="1" Text="MCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="结束通讯">
<Rect left="11" top="115" right="111" bottom="147"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="通讯">
<Rect left="127" top="168" right="227" bottom="200"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP803" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="电机水温不正常，退出">
<Rect left="10" top="299" right="110" bottom="331"/>
<Line2Text Enable="1" Text="电机水温不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="64" type="0">
</Transition>
<Transition StartId="6" EndId="48" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="48" EndId="36" type="3">
</Transition>
<Transition StartId="48" EndId="65" type="4">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="62" EndId="36" type="5">
</Transition>
<Transition StartId="63" EndId="5" type="0">
</Transition>
<Transition StartId="64" EndId="6" type="3">
</Transition>
<Transition StartId="64" EndId="62" type="4">
</Transition>
<Transition StartId="65" EndId="36" type="0">
</Transition>
</Transitions>
</Process>

