<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1033" pbltext="DEP1227">
<Parameters>
<Variable id="CommErr" type="3" dir="1" data="0"/>
<Variable id="tempValue" type="3" dir="1" data="0"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="75" top="24" right="175" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="79" top="446" right="179" bottom="478"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="76" top="149" right="176" bottom="181"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="切诊断">
<Rect left="77" top="267" right="177" bottom="299"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1027" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="读变速箱温度">
<Rect left="78" top="324" right="178" bottom="356"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="300" DelayTime="100"/>
<Line1Text Enable="1" Text="读变速箱温度"/>
<Script>#COMM 0x22 0x01 0x25
if(@0==0x62)then
DecValue = (@3*256+@4)*0.125;
print("变速箱水温DecValue"..DecValue);
if (DecValue&gt;=20 and DecValue&lt;=90) then
  engine.LastError = 0;
  tempValue=0;
else
  engine.LastError = 1;
  tempValue=1; 
end
    engine.StatValue=DecValue;
    engine.StatLower=20;
    engine.StatUpper=90;
  engine.SetLineText(1,"变速箱水温");
  engine.SetLineText(2,DecValue);
else
  engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="3" name="DEP1028" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="双离合变速器（DCT）">
<Rect left="76" top="92" right="176" bottom="124"/>
<TitleText Enable="1" Text="双离合变速器（DCT）"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="通讯失败">
<Rect left="196" top="205" right="296" bottom="237"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="结束通讯">
<Rect left="195" top="150" right="295" bottom="182"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="通讯">
<Rect left="77" top="206" right="177" bottom="238"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
     CommErr=0;
else
     engine.LastError = 1;
     CommErr=1;
end
</Script><assessment no="1313" name="DEP151" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="清空显示">
<Rect left="78" top="384" right="178" bottom="416"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="通讯失败">
<Rect left="201" top="325" right="301" bottom="357"/>
<Line2Text Enable="1" Text="变速箱水温不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="7" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="3">
</Transition>
<Transition StartId="5" EndId="12" type="4">
</Transition>
<Transition StartId="7" EndId="3" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="11" type="5">
</Transition>
<Transition StartId="9" EndId="3" type="0">
</Transition>
<Transition StartId="10" EndId="8" type="4">
</Transition>
<Transition StartId="10" EndId="4" type="3">
</Transition>
<Transition StartId="11" EndId="2" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="0">
</Transition>
</Transitions>
</Process>

