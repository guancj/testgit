<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="398" top="16" right="498" bottom="48"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="405" top="886" right="505" bottom="918"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="400" top="125" right="500" bottom="157"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="401" top="175" right="501" bottom="207"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="发送key">
<Rect left="401" top="284" right="501" bottom="316"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="6" ActivityType="13" flags="0" name="计算">
<Rect left="402" top="226" right="502" bottom="258"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x7D8AAC7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="连接ECU">
<Rect left="399" top="70" right="499" bottom="102"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="400" top="342" right="500" bottom="374"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="车辆速度"/>
<Script>#COMM 0x22 0x01 0x08
resu = ((@3 * 256 + @4) * 0.0078125 )  ;

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
else
   engine.LastError = 1;
end

engine.SetLineText(3,resu.."RPM");</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="发动机怠速">
<Rect left="400" top="393" right="500" bottom="425"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="发动机怠速"/>
<Script>#COMM 0x22 0x01 0x04

if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=0;
  OTG=250;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=800;
  OTG=900;
end

if(@3&gt;128)then
  resu = (( (@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (( (@3 * 256 + @4) * Mult ) + Smd)*1;
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
else
   engine.LastError = 1;
end

engine.SetLineText(3,resu.."RPM");</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="水温">
<Rect left="401" top="445" right="501" bottom="477"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="发动机水温"/>
<Script>--#COMM 0x22 0x01 0x06
#COMM 0x22 0x01 0x03
resu = ((@3* 0.75 ) -48) * 1.0;
temperature=resu;

if (5.25 &lt; temperature and temperature&lt; 100.25) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,"发动机温度"..temperature.."C");</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="气温">
<Rect left="401" top="497" right="501" bottom="529"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="进气温度"/>
<Script>--#COMM 0x22 0x01 0x0D
#COMM 0x22 0x01 0x0d

resu = ((@3* 0.75 ) - 48) * 1.0;
temperature=resu;

if (5.25 &lt; temperature and temperature&lt; 100.25) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,"发动机进气温度"..temperature.."C");</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="电子油门踏板开度">
<Rect left="401" top="557" right="501" bottom="589"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="电子油门踏板开度"/>
<Script>#COMM 0x22 0x01 0x10
resu = ((@3 * 256 + @4) * 0.001525879 );
if (0.0 &lt; temperature and temperature&lt; 14.9) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="电瓶电压">
<Rect left="402" top="610" right="502" bottom="642"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测EMS"/>
<Line3Text Enable="1" Text="电瓶电压"/>
<Script>--#COMM 0x22 0x01 0x03
#COMM 0x22 0x01 0x0A
resu = ((@3 * 256 + @4) * 0.000390625 ) ;
voltage=resu;

if (10.0 &lt; voltage and voltage&lt; 14.0) then
  engine.LastError = 0;

else
  engine.LastError = 1;

end
engine.SetLineText(3,"电瓶电压"..voltage.."V");</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="清空显示">
<Rect left="402" top="664" right="502" bottom="696"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="关闭点火开关，然后再">
<Rect left="403" top="712" right="503" bottom="744"/>
<Line1Text Enable="1" Text="关闭点火开关，然后再"/>
<Line2Text Enable="1" Text="打开点火开关"/>
<Script></Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="发动机自学习中">
<Rect left="403" top="762" right="503" bottom="794"/>
<Line1Text Enable="1" Text="PEPS 匹配 EMS"/>
<Line2Text Enable="1" Text="发动机自学习中"/>
<Line3Text Enable="1" Text="请耐心等待30s"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="普通节点">
<Rect left="404" top="818" right="504" bottom="850"/>
<Line1Text Enable="1" Text="请耐心等待"/>
<Script></Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="检测失败">
<Rect left="281" top="343" right="381" bottom="375"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="检测失败">
<Rect left="278" top="393" right="378" bottom="425"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="检测失败">
<Rect left="279" top="446" right="379" bottom="478"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="检测失败">
<Rect left="281" top="496" right="381" bottom="528"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="检测失败">
<Rect left="281" top="558" right="381" bottom="590"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="检测失败">
<Rect left="284" top="613" right="384" bottom="645"/>
<Script>engine.TestResult = 1;</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="7" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="8" type="0">
</Transition>
<Transition StartId="6" EndId="5" type="0">
</Transition>
<Transition StartId="7" EndId="3" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="3">
</Transition>
<Transition StartId="8" EndId="18" type="4">
</Transition>
<Transition StartId="9" EndId="10" type="3">
</Transition>
<Transition StartId="9" EndId="19" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="3">
</Transition>
<Transition StartId="10" EndId="20" type="4">
</Transition>
<Transition StartId="11" EndId="12" type="3">
</Transition>
<Transition StartId="11" EndId="21" type="4">
</Transition>
<Transition StartId="12" EndId="13" type="3">
</Transition>
<Transition StartId="12" EndId="22" type="4">
</Transition>
<Transition StartId="13" EndId="14" type="3">
</Transition>
<Transition StartId="13" EndId="23" type="4">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="2" type="0">
</Transition>
<Transition StartId="18" EndId="9" type="0">
</Transition>
<Transition StartId="19" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="11" type="0">
</Transition>
<Transition StartId="21" EndId="12" type="0">
</Transition>
<Transition StartId="22" EndId="13" type="0">
</Transition>
<Transition StartId="23" EndId="14" type="0">
</Transition>
</Transitions>
</Process>

