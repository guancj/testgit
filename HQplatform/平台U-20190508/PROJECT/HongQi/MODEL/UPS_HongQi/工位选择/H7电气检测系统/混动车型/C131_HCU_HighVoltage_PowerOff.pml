<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1203" pbltext="DEP958">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="148" right="248" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="6" top="502" right="106" bottom="534"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="高压下电">
<Rect left="357" top="61" right="457" bottom="93"/>
<Line1Text Enable="1" Text="高压下电"/>
<Script>#COMM 0x2F 0x02 0x0B 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP958" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="检测高压下电">
<Rect left="357" top="173" right="457" bottom="205"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="检测高压下电"/>
<Script>#COMM 0x22 0x01 0xAC
if (@3==0x01) then
  engine.LastError = 0;
  engine.println(" HCU 高压下电成功engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.println(" HCU 高压正电失败engine.LastError=".. engine.LastError);
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP961" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="延时200MS">
<Rect left="357" top="122" right="457" bottom="154"/>
<Line1Text Enable="1"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="清除结束">
<Rect left="6" top="442" right="106" bottom="474"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="357" top="229" right="457" bottom="261"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="200"/>
<Line1Text Enable="1" Text="ReturnControlToECU"/>
<Script>#COMM 0x2F 0x02 0x0B 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="连接ECU">
<Rect left="147" top="54" right="247" bottom="86"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="212" top="293" right="312" bottom="325"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP959" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="211" top="402" right="311" bottom="434"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP960" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="seedtokey">
<Rect left="211" top="349" right="311" bottom="381"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A68795B"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="切诊断">
<Rect left="148" top="160" right="248" bottom="192"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="33" name="DEP1106" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="通讯">
<Rect left="149" top="106" right="249" bottom="138"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6" top="103" right="106" bottom="135"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="15" ActivityType="4" flags="0" name="路由节点">
<Rect left="392" top="442" right="424" bottom="474"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="判断高压上电状态">
<Rect left="147" top="218" right="247" bottom="250"/>
<Line1Text Enable="1" Text="判断高压上电状态"/>
<Script>#COMM 0x22 0x01 0xac
if (@3==0x02) then
  engine.LastError = 0;
  engine.println(" HCU 处于高压上电状态");
else
  engine.LastError = 1;
  engine.println(" HCU 不处于高压上电状态");
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="普通节点">
<Rect left="89" top="293" right="189" bottom="325"/>
<Line1Text Enable="1" Text="不处于高压上电状态"/>
<Script>#COMM 0x22 0x01 0xac
if (@3==0x02) then
  engine.LastError = 0;
  engine.println(" HCU 处于高压上电状态");
else
  engine.LastError = 1;
  engine.println(" HCU 不处于高压上电状态");
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="结束通讯">
<Rect left="5" top="55" right="105" bottom="87"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="8" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="7" type="0">
</Transition>
<Transition StartId="5" EndId="4" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="0">
</Transition>
<Transition StartId="7" EndId="15" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="3" type="0">
</Transition>
<Transition StartId="11" EndId="10" type="0">
</Transition>
<Transition StartId="12" EndId="16" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="3">
</Transition>
<Transition StartId="13" EndId="14" type="4">
</Transition>
<Transition StartId="14" EndId="18" type="0">
</Transition>
<Transition StartId="14" EndId="6" type="5">
</Transition>
<Transition StartId="15" EndId="6" type="0">
</Transition>
<Transition StartId="16" EndId="9" type="3">
</Transition>
<Transition StartId="16" EndId="17" type="4">
</Transition>
<Transition StartId="17" EndId="6" type="0">
</Transition>
<Transition StartId="18" EndId="8" type="0">
</Transition>
</Transitions>
</Process>

