<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1013" pbltext="DEP180">
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="142" top="11" right="242" bottom="43"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="257" top="471" right="357" bottom="503"/>
<Script>#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="强制上电">
<Rect left="141" top="57" right="241" bottom="89"/>
<TitleText Enable="1" Text="整车强制上电"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="切诊断">
<Rect left="138" top="210" right="238" bottom="242"/>
<Script>#COMM 0x10 0x03 </Script></Activity>
<Activity id="6" ActivityType="3" flags="1" name="上电">
<Rect left="140" top="415" right="240" bottom="447"/>
<Line1Text Enable="1" Text="整车强制供电"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x2f 0x01 0x41 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP99" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="延时10s">
<Rect left="140" top="472" right="240" bottom="504"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 10000</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="138" top="260" right="238" bottom="292"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算key">
<Rect left="139" top="312" right="239" bottom="344"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="139" top="362" right="239" bottom="394"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5601" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="连接ECU">
<Rect left="140" top="111" right="240" bottom="143"/>
<Line1Text Enable="1" Text="连接 ECU"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="通讯">
<Rect left="139" top="162" right="239" bottom="194"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2001" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="通讯失败">
<Rect left="258" top="163" right="358" bottom="195"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="结束通讯">
<Rect left="259" top="111" right="359" bottom="143"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="11" type="0">
</Transition>
<Transition StartId="4" EndId="8" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="2" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="6" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="4" type="3">
</Transition>
<Transition StartId="12" EndId="13" type="4">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="2" type="5">
</Transition>
<Transition StartId="14" EndId="11" type="0">
</Transition>
</Transitions>
</Process>

