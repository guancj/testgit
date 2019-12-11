<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x720" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x728" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="390" top="84" right="490" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="190" top="4664" right="290" bottom="4696"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="安全气囊(ACU)">
<Rect left="390" top="144" right="490" bottom="176"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="390" top="284" right="490" bottom="316"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="390" top="194" right="490" bottom="226"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="390" top="334" right="490" bottom="366"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="390" top="374" right="490" bottom="406"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="390" top="424" right="490" bottom="456"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB9ED8BFE"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="390" top="484" right="490" bottom="516"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="通讯">
<Rect left="390" top="234" right="490" bottom="266"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1506" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="通讯失败">
<Rect left="190" top="234" right="290" bottom="266"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="结束通讯">
<Rect left="190" top="194" right="290" bottom="226"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="安全气囊ChangMode测试">
<Rect left="540" top="484" right="640" bottom="516"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="安全气囊ChangMode测试"/>
<Line3Text Enable="1" Text="Write ACU  Normal  Mode (F100)"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x2e 0xf1 0x00 0x03
if (@0==0x6E) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="394" ActivityType="3" flags="0" name="检测失败">
<Rect left="680" top="484" right="780" bottom="516"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="395" ActivityType="3" flags="0" name="等待5S">
<Rect left="540" top="544" right="640" bottom="576"/>
<Line1Text Enable="1" Text="安全气囊ChangMode测试"/>
<Line3Text Enable="1" Text="等待5S"/>
<Script>--#COMM 0x2f 0xfa 0xfa 0x02

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
--engine.StatValue=hexstr(StringRes);

#DELAY 5000







</Script></Activity>
<Activity id="396" ActivityType="3" flags="0" name="安全气囊ChangMode测试">
<Rect left="540" top="604" right="640" bottom="636"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="安全气囊ChangMode测试"/>
<Line3Text Enable="1" Text="Read ACU  Normal  Mode (F100)"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0xf1 0x00
if (@3==0x03) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="397" ActivityType="3" flags="0" name="检测失败">
<Rect left="690" top="604" right="790" bottom="636"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="398" ActivityType="3" flags="0" name="关闭安全气囊警示灯">
<Rect left="540" top="664" right="640" bottom="696"/>
<Script>#COMM 0x2f 0xc0 0x00 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="407" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="724" right="640" bottom="756"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="408" ActivityType="3" flags="0" name="示警灯灭手动确认">
<Rect left="540" top="774" right="640" bottom="806"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯灭了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="409" ActivityType="3" flags="0" name="返回控制权">
<Rect left="540" top="974" right="640" bottom="1006"/>
<Script>#COMM 0x2f 0xC0 0x00 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="410" ActivityType="3" flags="0" name="打开安全气囊提示灯">
<Rect left="540" top="824" right="640" bottom="856"/>
<Script>#COMM 0x2f 0xc0 0x00 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="413" ActivityType="3" flags="0" name="示警灯亮手动确认">
<Rect left="540" top="924" right="640" bottom="956"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="414" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="864" right="640" bottom="896"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="415" ActivityType="3" flags="0" name="检测失败">
<Rect left="390" top="834" right="490" bottom="866"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="416" ActivityType="3" flags="0" name="关闭乘客位安全气囊警示灯">
<Rect left="540" top="1034" right="640" bottom="1066"/>
<Line1Text Enable="1" Text="请确认关闭乘客位安全气囊警示灯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>engine.Delay(5000);</Script></Activity>
<Activity id="418" ActivityType="3" flags="0" name="打开安全气囊提示灯">
<Rect left="540" top="1154" right="640" bottom="1186"/>
<Script>#COMM 0x2f 0xc0 0x01 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="420" ActivityType="3" flags="0" name="示警灯亮手动确认">
<Rect left="540" top="1254" right="640" bottom="1286"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="421" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="1204" right="640" bottom="1236"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="422" ActivityType="3" flags="0" name="检测失败">
<Rect left="690" top="1334" right="790" bottom="1366"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="423" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="1094" right="640" bottom="1126"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="424" ActivityType="3" flags="0" name="关闭安全气囊警示灯">
<Rect left="540" top="1314" right="640" bottom="1346"/>
<Script>#COMM 0x2f 0xc0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="425" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="1364" right="640" bottom="1396"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="426" ActivityType="3" flags="0" name="示警灯灭手动确认">
<Rect left="540" top="1414" right="640" bottom="1446"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯灭了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="427" ActivityType="3" flags="0" name="返回控制权">
<Rect left="540" top="1474" right="640" bottom="1506"/>
<Script>#COMM 0x2f 0xC0 0x01 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="428" ActivityType="3" flags="0" name="延时">
<Rect left="540" top="1524" right="640" bottom="1556"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="429" ActivityType="3" flags="0" name="确认关闭乘客位安全气囊警示灯">
<Rect left="540" top="1574" right="640" bottom="1606"/>
<Line1Text Enable="1" Text="请确认关闭乘客位安全气囊警示灯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(5000);</Script></Activity>
<Activity id="430" ActivityType="3" flags="0" name="碰撞输出测试">
<Rect left="800" top="1574" right="900" bottom="1606"/>
<Line1Text Enable="1" Text="请将所有车门锁住"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>engine.Delay(5000);</Script></Activity>
<Activity id="431" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="1684" right="1040" bottom="1716"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="432" ActivityType="3" flags="0" name="发送崩溃输出信号">
<Rect left="800" top="1624" right="900" bottom="1656"/>
<Script>#COMM 0x2f 0xc0 0x02 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="433" ActivityType="3" flags="0" name="check所有的门锁状态">
<Rect left="800" top="1684" right="900" bottom="1716"/>
<Line1Text Enable="1" Text="所有车门是解锁的吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="434" ActivityType="3" flags="0" name="发送正面碰撞输出信号">
<Rect left="800" top="1734" right="900" bottom="1766"/>
<Script>#COMM 0x2f 0xc0 0x02 0x03 0x02

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="435" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="1794" right="1040" bottom="1826"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="436" ActivityType="3" flags="0" name="check所有的门锁状态">
<Rect left="800" top="1794" right="900" bottom="1826"/>
<Line1Text Enable="1" Text="所有车门是解锁的吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="437" ActivityType="3" flags="0" name="发送驾驶员侧碰撞输出信号">
<Rect left="800" top="1844" right="900" bottom="1876"/>
<Script>#COMM 0x2f 0xc0 0x02 0x03 0x04

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="438" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="1894" right="1040" bottom="1926"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="439" ActivityType="3" flags="0" name="check所有的门锁状态">
<Rect left="800" top="1894" right="900" bottom="1926"/>
<Line1Text Enable="1" Text="所有车门是解锁的吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="440" ActivityType="3" flags="0" name="乘客侧碰撞信号输出">
<Rect left="800" top="1954" right="900" bottom="1986"/>
<Script>#COMM 0x2f 0xc0 0x02 0x03 0x08

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="441" ActivityType="3" flags="0" name="检测失败">
<Rect left="950" top="2014" right="1050" bottom="2046"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="442" ActivityType="3" flags="0" name="check所有的门锁状态">
<Rect left="800" top="2014" right="900" bottom="2046"/>
<Line1Text Enable="1" Text="所有车门是锁的吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="446" ActivityType="3" flags="0" name="发送硬件侧崩溃输出信号">
<Rect left="800" top="2084" right="900" bottom="2116"/>
<Script>#COMM 0x2f 0xc0 0x02 0x03 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="447" ActivityType="3" flags="0" name="检测失败">
<Rect left="950" top="2134" right="1050" bottom="2166"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="448" ActivityType="3" flags="0" name="check所有的门锁状态">
<Rect left="800" top="2134" right="900" bottom="2166"/>
<Line1Text Enable="1" Text="所有车门是锁的吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="449" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="2204" right="866" bottom="2236"/>
</Activity>
<Activity id="450" ActivityType="3" flags="0" name="系牢驾驶位、副驾驶和第二排座椅的安全带">
<Rect left="1440" top="2164" right="1540" bottom="2196"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="系牢驾驶位、副驾驶和第二排座椅的安全带"/>
<Script>
#DELAY 10000</Script></Activity>
<Activity id="465" ActivityType="3" flags="0" name="安全带系牢检测">
<Rect left="1440" top="2214" right="1540" bottom="2246"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x29 0x02
vValue1 = bit32.extract(tonumber(@6))
vValue2 = bit32.extract(tonumber(@7))
vValue3 = bit32.extract(tonumber(@8))
if (@3==0x22 and vValue1 == 3 and vValue2 == 3 and vValue3 == 3) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="466" ActivityType="3" flags="0" name="检测失败">
<Rect left="1560" top="2214" right="1660" bottom="2246"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="467" ActivityType="3" flags="0" name="松开驾驶位、副驾驶和第二排座椅的安全带">
<Rect left="1440" top="2274" right="1540" bottom="2306"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="松开驾驶位、副驾驶和第二排座椅的安全带"/>
<Script>
#DELAY 10000</Script></Activity>
<Activity id="468" ActivityType="3" flags="0" name="安全带松开检测">
<Rect left="1440" top="2324" right="1540" bottom="2356"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x29 0x02
vValue1 = bit32.extract(tonumber(@6))
vValue2 = bit32.extract(tonumber(@7))
vValue3 = bit32.extract(tonumber(@8))
if (@3==0x22 and vValue1 == 2 and vValue2 == 2 and vValue3 == 2) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="469" ActivityType="3" flags="0" name="检测失败">
<Rect left="1570" top="2324" right="1670" bottom="2356"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="470" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4084" right="866" bottom="4116"/>
</Activity>
<Activity id="471" ActivityType="3" flags="0" name="关闭所有SBR Lamp">
<Rect left="800" top="4144" right="900" bottom="4176"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="关闭所有SBR Lamp"/>
<Script>
#DELAY 10000</Script></Activity>
<Activity id="475" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="4264" right="1030" bottom="4296"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="478" ActivityType="3" flags="0" name="打开所有SBR Lamp">
<Rect left="800" top="4204" right="900" bottom="4236"/>
<Script>#COMM 0x2f 0xc0 0x03 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="479" ActivityType="3" flags="0" name="打开所有SBR Lamp">
<Rect left="800" top="4264" right="900" bottom="4296"/>
<Line1Text Enable="1" Text="所有SBR Lamp打开了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="480" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="4384" right="1030" bottom="4416"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="481" ActivityType="3" flags="0" name="关闭所有SBR Lamp">
<Rect left="800" top="4324" right="900" bottom="4356"/>
<Script>#COMM 0x2f 0xc0 0x03 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="482" ActivityType="3" flags="0" name="关闭所有SBR Lamp">
<Rect left="800" top="4384" right="900" bottom="4416"/>
<Line1Text Enable="1" Text="所有SBR Lamp关闭了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="483" ActivityType="3" flags="0" name="Return Control to ECU">
<Rect left="800" top="4444" right="900" bottom="4476"/>
<Script>#COMM 0x2f 0xc0 0x03 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script></Activity>
<Activity id="484" ActivityType="3" flags="0" name="关闭所有SBR Lamp">
<Rect left="800" top="4504" right="900" bottom="4536"/>
<Line1Text Enable="1" Text="SBR Lamp关闭了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="485" ActivityType="3" flags="0" name="检测失败">
<Rect left="920" top="4504" right="1020" bottom="4536"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="486" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4564" right="866" bottom="4596"/>
</Activity>
<Activity id="487" ActivityType="3" flags="0" name="读DTC">
<Rect left="800" top="4614" right="900" bottom="4646"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0xFF
--dtc_size=@@;
--dtc=hexstr(@3-@dtc_size);
if (@0==0x59 and @3 == 0x9A and @4 == 0x10 and @5 == 0x1F and engine.GetResponseSize() == 6) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="490" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="4614" right="1040" bottom="4646"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="491" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4664" right="866" bottom="4696"/>
</Activity>
<Activity id="492" ActivityType="3" flags="0" name="驾驶位安全带系上检测">
<Rect left="800" top="2254" right="900" bottom="2286"/>
<Line1Text Enable="1" Text="自动检测"/>
<Line3Text Enable="1" Text="请系好驾驶位安全带"/>
<Script></Script></Activity>
<Activity id="493" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="2314" right="900" bottom="2346"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="494" ActivityType="3" flags="0" name="驾驶位安全带状态读取">
<Rect left="800" top="2364" right="900" bottom="2396"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@3,4,3) == 0x02)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="496" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="2364" right="1030" bottom="2396"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="497" ActivityType="3" flags="0" name="副驾驶位安全带系上检测">
<Rect left="800" top="2614" right="900" bottom="2646"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请将副驾驶位安全带系上"/>
<Script></Script></Activity>
<Activity id="498" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="2664" right="900" bottom="2696"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="499" ActivityType="3" flags="0" name="副驾驶位安全带状态读取">
<Rect left="800" top="2724" right="900" bottom="2756"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@3,0,3) == 0x02)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="500" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="2724" right="1030" bottom="2756"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="501" ActivityType="3" flags="0" name="后排左侧安全带系上检测">
<Rect left="800" top="2954" right="900" bottom="2986"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排左侧安全带系上"/>
<Script></Script></Activity>
<Activity id="502" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3004" right="900" bottom="3036"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="503" ActivityType="3" flags="0" name="后排左侧安全带状态读取">
<Rect left="800" top="3064" right="900" bottom="3096"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@4,0,3) == 0x02)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="504" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="3064" right="1040" bottom="3096"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="505" ActivityType="3" flags="0" name="后排中间安全带系上检测">
<Rect left="800" top="3294" right="900" bottom="3326"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排中间安全带系上"/>
<Script></Script></Activity>
<Activity id="506" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3344" right="900" bottom="3376"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="507" ActivityType="3" flags="0" name="后排中间安全带状态读取">
<Rect left="800" top="3404" right="900" bottom="3436"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@5,0,3) == 0x02)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="508" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="3404" right="1030" bottom="3436"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="509" ActivityType="3" flags="0" name="后排右侧安全带系上检测">
<Rect left="800" top="3644" right="900" bottom="3676"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排右侧安全带系上"/>
<Script></Script></Activity>
<Activity id="510" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3694" right="900" bottom="3726"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="511" ActivityType="3" flags="0" name="后排右侧安全带状态读取">
<Rect left="800" top="3754" right="900" bottom="3786"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@6,0,3) == 0x02)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="512" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="3754" right="1030" bottom="3786"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="513" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="4004" right="866" bottom="4036"/>
</Activity>
<Activity id="514" ActivityType="3" flags="0" name="驾驶位安全带解开检测">
<Rect left="800" top="2434" right="900" bottom="2466"/>
<Line1Text Enable="1" Text="自动检测"/>
<Line3Text Enable="1" Text="请解开驾驶位安全带"/>
<Script></Script></Activity>
<Activity id="515" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="2494" right="900" bottom="2526"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="516" ActivityType="3" flags="0" name="驾驶位安全带状态读取">
<Rect left="800" top="2544" right="900" bottom="2576"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@3,4,3) == 0x03)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="517" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="2544" right="1030" bottom="2576"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="518" ActivityType="3" flags="0" name="副驾驶位安全带解开检测">
<Rect left="800" top="2784" right="900" bottom="2816"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请将副驾驶位安全带解开"/>
<Script></Script></Activity>
<Activity id="519" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="2834" right="900" bottom="2866"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="520" ActivityType="3" flags="0" name="副驾驶位安全带状态读取">
<Rect left="800" top="2894" right="900" bottom="2926"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@3,0,3) == 0x03)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="521" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="2894" right="1030" bottom="2926"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="522" ActivityType="3" flags="0" name="后排左侧安全带解开检测">
<Rect left="800" top="3124" right="900" bottom="3156"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排左侧安全带解开"/>
<Script></Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3174" right="900" bottom="3206"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="524" ActivityType="3" flags="0" name="后排左侧安全带状态读取">
<Rect left="800" top="3234" right="900" bottom="3266"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@4,0,3) == 0x03)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="525" ActivityType="3" flags="0" name="检测失败">
<Rect left="940" top="3234" right="1040" bottom="3266"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="526" ActivityType="3" flags="0" name="后排中间安全带解开检测">
<Rect left="800" top="3464" right="900" bottom="3496"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排中间安全带解开"/>
<Script></Script></Activity>
<Activity id="527" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3514" right="900" bottom="3546"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="528" ActivityType="3" flags="0" name="后排中间安全带状态读取">
<Rect left="800" top="3574" right="900" bottom="3606"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@5,0,3) == 0x03)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="529" ActivityType="3" flags="0" name="检测失败">
<Rect left="950" top="3574" right="1050" bottom="3606"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="530" ActivityType="3" flags="0" name="后排右侧安全带解开检测">
<Rect left="800" top="3824" right="900" bottom="3856"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="请后排右侧安全带解开"/>
<Script></Script></Activity>
<Activity id="531" ActivityType="3" flags="0" name="延时2S">
<Rect left="800" top="3874" right="900" bottom="3906"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="532" ActivityType="3" flags="0" name="后排右侧安全带状态读取">
<Rect left="800" top="3934" right="900" bottom="3966"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x22 0x29 0x02


if(bit32.extract(@6,0,3) == 0x03)then
engine.LastError = 0;
else
engine.LastError = 1;
end     
    engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="533" ActivityType="3" flags="0" name="检测失败">
<Rect left="930" top="3934" right="1030" bottom="3966"/>
<Script>engine.TestResult = 1;</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="4" EndId="7" type="0">
</Transition>
<Transition StartId="6" EndId="11" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="40" type="0">
</Transition>
<Transition StartId="11" EndId="4" type="3">
</Transition>
<Transition StartId="11" EndId="33" type="4">
</Transition>
<Transition StartId="33" EndId="39" type="0">
</Transition>
<Transition StartId="33" EndId="2" type="5">
</Transition>
<Transition StartId="39" EndId="6" type="0">
</Transition>
<Transition StartId="40" EndId="394" type="0">
</Transition>
<Transition StartId="40" EndId="395" type="3">
</Transition>
<Transition StartId="394" EndId="395" type="0">
</Transition>
<Transition StartId="395" EndId="396" type="0">
</Transition>
<Transition StartId="396" EndId="397" type="0">
</Transition>
<Transition StartId="396" EndId="398" type="3">
</Transition>
<Transition StartId="397" EndId="398" type="0">
</Transition>
<Transition StartId="398" EndId="407" type="0">
</Transition>
<Transition StartId="407" EndId="408" type="0">
</Transition>
<Transition StartId="408" EndId="410" type="0">
</Transition>
<Transition StartId="408" EndId="415" type="4">
</Transition>
<Transition StartId="409" EndId="416" type="0">
</Transition>
<Transition StartId="410" EndId="414" type="0">
</Transition>
<Transition StartId="413" EndId="409" type="0">
</Transition>
<Transition StartId="413" EndId="415" type="4">
</Transition>
<Transition StartId="414" EndId="413" type="0">
</Transition>
<Transition StartId="415" EndId="409" type="0">
</Transition>
<Transition StartId="416" EndId="423" type="0">
</Transition>
<Transition StartId="418" EndId="421" type="0">
</Transition>
<Transition StartId="420" EndId="422" type="4">
</Transition>
<Transition StartId="420" EndId="424" type="0">
</Transition>
<Transition StartId="421" EndId="420" type="0">
</Transition>
<Transition StartId="422" EndId="427" type="0">
</Transition>
<Transition StartId="423" EndId="418" type="0">
</Transition>
<Transition StartId="424" EndId="425" type="0">
</Transition>
<Transition StartId="425" EndId="426" type="0">
</Transition>
<Transition StartId="426" EndId="422" type="4">
</Transition>
<Transition StartId="426" EndId="427" type="0">
</Transition>
<Transition StartId="427" EndId="428" type="0">
</Transition>
<Transition StartId="428" EndId="429" type="0">
</Transition>
<Transition StartId="429" EndId="430" type="0">
</Transition>
<Transition StartId="430" EndId="432" type="0">
</Transition>
<Transition StartId="431" EndId="434" type="0">
</Transition>
<Transition StartId="432" EndId="433" type="0">
</Transition>
<Transition StartId="433" EndId="431" type="4">
</Transition>
<Transition StartId="433" EndId="434" type="0">
</Transition>
<Transition StartId="434" EndId="436" type="0">
</Transition>
<Transition StartId="435" EndId="437" type="0">
</Transition>
<Transition StartId="436" EndId="435" type="4">
</Transition>
<Transition StartId="436" EndId="437" type="0">
</Transition>
<Transition StartId="437" EndId="439" type="0">
</Transition>
<Transition StartId="438" EndId="440" type="0">
</Transition>
<Transition StartId="439" EndId="438" type="4">
</Transition>
<Transition StartId="439" EndId="440" type="0">
</Transition>
<Transition StartId="440" EndId="442" type="0">
</Transition>
<Transition StartId="441" EndId="446" type="0">
</Transition>
<Transition StartId="442" EndId="441" type="4">
</Transition>
<Transition StartId="442" EndId="446" type="0">
</Transition>
<Transition StartId="446" EndId="448" type="0">
</Transition>
<Transition StartId="447" EndId="449" type="0">
</Transition>
<Transition StartId="448" EndId="447" type="4">
</Transition>
<Transition StartId="448" EndId="449" type="0">
</Transition>
<Transition StartId="449" EndId="492" type="0">
</Transition>
<Transition StartId="450" EndId="465" type="0">
</Transition>
<Transition StartId="465" EndId="466" type="4">
</Transition>
<Transition StartId="465" EndId="467" type="0">
</Transition>
<Transition StartId="466" EndId="467" type="0">
</Transition>
<Transition StartId="467" EndId="468" type="0">
</Transition>
<Transition StartId="468" EndId="469" type="4">
</Transition>
<Transition StartId="470" EndId="471" type="0">
</Transition>
<Transition StartId="471" EndId="478" type="0">
</Transition>
<Transition StartId="475" EndId="481" type="0">
</Transition>
<Transition StartId="478" EndId="479" type="0">
</Transition>
<Transition StartId="479" EndId="475" type="4">
</Transition>
<Transition StartId="479" EndId="481" type="0">
</Transition>
<Transition StartId="480" EndId="483" type="0">
</Transition>
<Transition StartId="481" EndId="482" type="0">
</Transition>
<Transition StartId="482" EndId="480" type="4">
</Transition>
<Transition StartId="482" EndId="483" type="0">
</Transition>
<Transition StartId="483" EndId="484" type="0">
</Transition>
<Transition StartId="484" EndId="485" type="4">
</Transition>
<Transition StartId="484" EndId="486" type="0">
</Transition>
<Transition StartId="485" EndId="486" type="0">
</Transition>
<Transition StartId="486" EndId="487" type="0">
</Transition>
<Transition StartId="487" EndId="490" type="4">
</Transition>
<Transition StartId="487" EndId="491" type="0">
</Transition>
<Transition StartId="490" EndId="491" type="0">
</Transition>
<Transition StartId="491" EndId="2" type="0">
</Transition>
<Transition StartId="492" EndId="493" type="0">
</Transition>
<Transition StartId="493" EndId="494" type="0">
</Transition>
<Transition StartId="494" EndId="496" type="4">
</Transition>
<Transition StartId="494" EndId="514" type="0">
</Transition>
<Transition StartId="496" EndId="514" type="0">
</Transition>
<Transition StartId="497" EndId="498" type="0">
</Transition>
<Transition StartId="498" EndId="499" type="0">
</Transition>
<Transition StartId="499" EndId="500" type="4">
</Transition>
<Transition StartId="499" EndId="518" type="0">
</Transition>
<Transition StartId="500" EndId="518" type="0">
</Transition>
<Transition StartId="501" EndId="502" type="0">
</Transition>
<Transition StartId="502" EndId="503" type="0">
</Transition>
<Transition StartId="503" EndId="504" type="4">
</Transition>
<Transition StartId="503" EndId="522" type="0">
</Transition>
<Transition StartId="504" EndId="522" type="0">
</Transition>
<Transition StartId="505" EndId="506" type="0">
</Transition>
<Transition StartId="506" EndId="507" type="0">
</Transition>
<Transition StartId="507" EndId="508" type="4">
</Transition>
<Transition StartId="507" EndId="526" type="0">
</Transition>
<Transition StartId="508" EndId="526" type="0">
</Transition>
<Transition StartId="509" EndId="510" type="0">
</Transition>
<Transition StartId="510" EndId="511" type="0">
</Transition>
<Transition StartId="511" EndId="512" type="4">
</Transition>
<Transition StartId="511" EndId="530" type="0">
</Transition>
<Transition StartId="512" EndId="530" type="0">
</Transition>
<Transition StartId="513" EndId="470" type="0">
</Transition>
<Transition StartId="514" EndId="515" type="0">
</Transition>
<Transition StartId="515" EndId="516" type="0">
</Transition>
<Transition StartId="516" EndId="517" type="4">
</Transition>
<Transition StartId="516" EndId="497" type="0">
</Transition>
<Transition StartId="517" EndId="497" type="0">
</Transition>
<Transition StartId="518" EndId="519" type="0">
</Transition>
<Transition StartId="519" EndId="520" type="0">
</Transition>
<Transition StartId="520" EndId="521" type="4">
</Transition>
<Transition StartId="520" EndId="501" type="0">
</Transition>
<Transition StartId="521" EndId="501" type="0">
</Transition>
<Transition StartId="522" EndId="523" type="0">
</Transition>
<Transition StartId="523" EndId="524" type="0">
</Transition>
<Transition StartId="524" EndId="525" type="4">
</Transition>
<Transition StartId="524" EndId="505" type="0">
</Transition>
<Transition StartId="525" EndId="505" type="0">
</Transition>
<Transition StartId="526" EndId="527" type="0">
</Transition>
<Transition StartId="527" EndId="528" type="0">
</Transition>
<Transition StartId="528" EndId="529" type="4">
</Transition>
<Transition StartId="528" EndId="509" type="0">
</Transition>
<Transition StartId="529" EndId="509" type="0">
</Transition>
<Transition StartId="530" EndId="531" type="0">
</Transition>
<Transition StartId="531" EndId="532" type="0">
</Transition>
<Transition StartId="532" EndId="533" type="4">
</Transition>
<Transition StartId="532" EndId="513" type="0">
</Transition>
<Transition StartId="533" EndId="513" type="0">
</Transition>
</Transitions>
</Process>

