<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1299" pbltext="DEP181">
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
<Rect left="318" top="76" right="418" bottom="108"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="436" top="541" right="536" bottom="573"/>
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
<Activity id="3" ActivityType="3" flags="0" name="整车强制下电">
<Rect left="317" top="124" right="417" bottom="156"/>
<TitleText Enable="1" Text="整车强制下电"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="切诊断">
<Rect left="318" top="260" right="418" bottom="292"/>
<Script>#COMM 0x10 0x03 </Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="关电">
<Rect left="321" top="443" right="421" bottom="475"/>
<Script>#COMM 0x2f 0x01 0x41 0x03 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5700" name="DEP181" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="清空显示">
<Rect left="321" top="492" right="421" bottom="524"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="1" name="蓝牙模块连接器完好吗？">
<Rect left="321" top="540" right="421" bottom="572"/>
<Line1Text Enable="1" Text="蓝牙模块连接器完好吗？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(2,"#L=OK？#R=BMPOK");
   engine.LastError = 0;
   
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(2,"#L=OK？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="5701" name="DEP182" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="319" top="307" right="419" bottom="339"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5703" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="计算key">
<Rect left="319" top="351" right="419" bottom="383"/>
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
<Activity id="11" ActivityType="3" flags="0" name="发送key">
<Rect left="318" top="401" right="418" bottom="433"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5702" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="连接ECU">
<Rect left="317" top="169" right="417" bottom="201"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="通讯">
<Rect left="318" top="213" right="418" bottom="245"/>
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
<Activity id="14" ActivityType="3" flags="0" name="通讯失败">
<Rect left="436" top="213" right="536" bottom="245"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="结束通讯">
<Rect left="437" top="168" right="537" bottom="200"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="12" type="0">
</Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="2" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="6" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="4" type="3">
</Transition>
<Transition StartId="13" EndId="14" type="4">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="14" EndId="2" type="5">
</Transition>
<Transition StartId="15" EndId="12" type="0">
</Transition>
</Transitions>
</Process>

