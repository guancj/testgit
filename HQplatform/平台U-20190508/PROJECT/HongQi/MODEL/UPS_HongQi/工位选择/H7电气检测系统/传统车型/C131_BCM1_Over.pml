<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1133" pbltext="DEP41">
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
<Variable id="CAN_SND_ID" type="3" data="0x75E" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="160" top="84" right="260" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="160" top="844" right="260" bottom="876"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="BCM1 引擎盖关">
<Rect left="160" top="524" right="260" bottom="556"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="240" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请关闭引擎盖"/>
<Script>#COMM 0x22 0x01 0x2A
if(@0==0x62)then
if(@3==0x00)then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(2,@3);
else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
  engine.TestResult = 1;
  engine.LastError = 1;
end</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="160" top="134" right="260" bottom="166"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="连接ECU">
<Rect left="160" top="184" right="260" bottom="216"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="通讯">
<Rect left="160" top="244" right="260" bottom="276"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="结束通讯">
<Rect left="30" top="184" right="130" bottom="216"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="211" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="244" right="130" bottom="276"/>
<Line1Text Enable="1" Text="BCM1 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="212" ActivityType="3" flags="0" name="切诊断">
<Rect left="160" top="304" right="260" bottom="336"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="160" top="354" right="260" bottom="386"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="214" ActivityType="3" flags="0" name="发送key">
<Rect left="160" top="464" right="260" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="215" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="160" top="404" right="260" bottom="436"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="手动确认">
<Rect left="160" top="594" right="260" bottom="626"/>
<Line1Text Enable="1" Text="请注意观察雨刷"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="217" ActivityType="3" flags="0" name="发送">
<Rect left="160" top="654" right="260" bottom="686"/>
<Script>#COMM 0x31 0x01 0xC0 0x00
</Script></Activity>
<Activity id="218" ActivityType="3" flags="0" name="手动确认">
<Rect left="160" top="714" right="260" bottom="746"/>
<Line1Text Enable="1" Text="雨刷工作了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="219" ActivityType="3" flags="0" name="清屏幕颜色">
<Rect left="160" top="774" right="260" bottom="806"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="844" right="96" bottom="876"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="100" type="0">
</Transition>
<Transition StartId="3" EndId="216" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="211" type="4">
</Transition>
<Transition StartId="123" EndId="212" type="0">
</Transition>
<Transition StartId="208" EndId="101" type="0">
</Transition>
<Transition StartId="211" EndId="208" type="0">
</Transition>
<Transition StartId="211" EndId="220" type="5">
</Transition>
<Transition StartId="212" EndId="213" type="0">
</Transition>
<Transition StartId="212" EndId="213" type="0">
</Transition>
<Transition StartId="213" EndId="215" type="0">
</Transition>
<Transition StartId="214" EndId="3" type="0">
</Transition>
<Transition StartId="215" EndId="214" type="0">
</Transition>
<Transition StartId="216" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="218" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="2" type="0">
</Transition>
<Transition StartId="220" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

