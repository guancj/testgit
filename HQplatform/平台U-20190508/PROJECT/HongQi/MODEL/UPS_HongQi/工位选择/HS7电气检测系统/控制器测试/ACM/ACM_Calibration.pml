<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3005" pbltext="DEP1585">
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
<Variable id="CAN_SND_ID" type="3" data="0x7D1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7D9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="340" top="64" right="440" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="340" top="744" right="440" bottom="776"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="ACM">
<Rect left="340" top="114" right="440" bottom="146"/>
<TitleText Enable="1" Text="ACM换挡执行机构"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="连接ECU">
<Rect left="340" top="164" right="440" bottom="196"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="340" top="274" right="440" bottom="306"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1599" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="340" top="334" right="440" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1588" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="340" top="464" right="440" bottom="496"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(500)
</Script><assessment no="5" name="DEP1589" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="340" top="394" right="440" bottom="426"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x42761487"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="通讯">
<Rect left="340" top="214" right="440" bottom="246"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP1586" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="通讯失败">
<Rect left="190" top="214" right="290" bottom="246"/>
<Line1Text Enable="1" Text="ACM控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="结束通讯">
<Rect left="190" top="164" right="290" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="224" top="744" right="256" bottom="776"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="开始标定">
<Rect left="340" top="534" right="440" bottom="566"/>
<Line2Text Enable="1" Text="ACM 开始标定"/>
<Script>#COMM 0x31 0x01 0xDC 0xC0 
if(engine.LastError ==0)then
  if(@4 == 0x00 )then
	engine.LastError = 0
        print("ACM Start Calibration OK")
  else
	engine.LastError = 1
        print("ACM Start Calibration NOK")
  end
else
        engine.LastError = 1
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP2456" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="1" name="标定结果">
<Rect left="340" top="674" right="440" bottom="706"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="25" DelayTime="500"/>
<Line2Text Enable="1" Text="ACM 标定结果"/>
<Script>#COMM 0x31 0x03 0xDC 0xC0
if(engine.LastError ==0)then
if(@4 == 0x00 )then
	engine.LastError = 0
        print("ACM  Calibration OK")
else
	engine.LastError = 1
        print("ACM  Calibration NOK")
end
else
        engine.LastError = 1
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP2457" type="8" flags="97"/>
</Activity>
<Activity id="202" ActivityType="3" flags="0" name="等待2秒">
<Rect left="340" top="604" right="440" bottom="636"/>
<Line2Text Enable="1" Text="请等待2秒"/>
<Script>engine.Delay(2000);
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="20" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="0">
</Transition>
<Transition StartId="15" EndId="6" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="4">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="5">
</Transition>
<Transition StartId="17" EndId="4" type="0">
</Transition>
<Transition StartId="19" EndId="2" type="0">
</Transition>
<Transition StartId="20" EndId="202" type="0">
</Transition>
<Transition StartId="21" EndId="2" type="0">
</Transition>
<Transition StartId="202" EndId="21" type="0">
</Transition>
</Transitions>
</Process>

