<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1125" pbltext="DEP551">
<Parameters>
<Variable id="C131_PDCU_Window_Initialization_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_DDCU_Check_Mirror_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_The_Turn_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_The_Door_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_The_Door_Window_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_Mirror_Meantime_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_The_Switches_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_DDCU_Window_Learning_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x759" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x779" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="111" top="5" right="211" bottom="37"/>
<Script>engine.println("VMTLOC:"..VMTLOC);
engine.println("WorkPlace:"..engine.WorkPlace);</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="502" top="4315" right="602" bottom="4347"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="司机门 (DDCU)">
<Rect left="112" top="57" right="212" bottom="89"/>
<TitleText Enable="1" Text="司机门 (DDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="113" top="201" right="213" bottom="233"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1314" name="DEP109" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="手动自学习">
<Rect left="482" top="3647" right="582" bottom="3679"/>
<Strategy NokTime="0" RetryTimeOut="60000"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="#L=自动完成上升、下降、再上升的循环#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPOK");
   engine.LastError = 0;
   engine.println("人工操作点击确定！");  
engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.println("人工操作点击放弃！");   
engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="44" name="DEP1116" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="读DDCU状态">
<Rect left="492" top="4090" right="592" bottom="4122"/>
<Line1Text Enable="1" Text="读DDCU状态"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP588" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="清空显示">
<Rect left="503" top="4237" right="603" bottom="4269"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="连接ECU">
<Rect left="112" top="105" right="212" bottom="137"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="切诊断">
<Rect left="112" top="247" right="212" bottom="279"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1315" name="DEP1081" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="113" top="296" right="213" bottom="328"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1316" name="DEP111" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="发送key">
<Rect left="113" top="391" right="213" bottom="423"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1317" name="DEP112" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="13" flags="0" name="计算">
<Rect left="112" top="342" right="212" bottom="374"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FBDCEA0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="520" top="542" right="552" bottom="574"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="检测失败">
<Rect left="602" top="1830" right="702" bottom="1862"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="检测失败">
<Rect left="603" top="2215" right="703" bottom="2247"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="1784" right="587" bottom="1816"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门门灯打开"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x04 0x03 0x01</Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="司机门门灯打开">
<Rect left="486" top="1831" right="586" bottom="1863"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x17
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP571" type="8" flags="97"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="自动测试">
<Rect left="486" top="1879" right="586" bottom="1911"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门门灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x04 0x03 0x00</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="司机门门灯关闭">
<Rect left="486" top="1925" right="586" bottom="1957"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x17
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP572" type="8" flags="97"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="检测失败">
<Rect left="600" top="1925" right="700" bottom="1957"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="自动测试">
<Rect left="488" top="1212" right="588" bottom="1244"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜开始加热"/>
<Script>#COMM  0x2F 0x02 0x07 0x03 0x01</Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="司机门倒车镜开始加热">
<Rect left="488" top="1259" right="588" bottom="1291"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x15
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  --engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP567" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="检测失败">
<Rect left="603" top="1260" right="703" bottom="1292"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="1305" right="587" bottom="1337"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜停止加热"/>
<Script>#COMM  0x2F 0x02 0x07 0x03 0x00</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="司机门倒车镜停止加热">
<Rect left="487" top="1351" right="587" bottom="1383"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x15
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP568" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="检测失败">
<Rect left="601" top="1352" right="701" bottom="1384"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="Mirror_Heating_ReturnControlToECU">
<Rect left="486" top="1398" right="586" bottom="1430"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x07 0x00</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="自动测试">
<Rect left="486" top="1491" right="586" bottom="1523"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门转向灯开启"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x03 0x03 0x01</Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="司机门转向灯开启">
<Rect left="487" top="1543" right="587" bottom="1575"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x12
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP569" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="检测失败">
<Rect left="599" top="1543" right="699" bottom="1575"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="1593" right="587" bottom="1625"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门转向灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x03 0x03 0x00</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="司机门转向灯关闭">
<Rect left="488" top="1640" right="588" bottom="1672"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x12
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP570" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="检测失败">
<Rect left="602" top="1639" right="702" bottom="1671"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="Turn_lights_ReturnControlToECU">
<Rect left="488" top="1687" right="588" bottom="1719"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x03 0x00</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="自动测试">
<Rect left="488" top="2027" right="588" bottom="2059"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门玻璃降"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x02
#DELAY 1000</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="司机门玻璃降">
<Rect left="487" top="2074" right="587" bottom="2106"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x11
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP573" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="检测失败">
<Rect left="602" top="2073" right="702" bottom="2105"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="487" top="2121" right="587" bottom="2153"/>
<Line1Text Enable="1" Text="司机门玻璃停止下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x00
</Script></Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="523" top="1980" right="555" bottom="2012"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="2169" right="587" bottom="2201"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门玻璃上升"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x01
#DELAY 1000</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="司机门玻璃升">
<Rect left="488" top="2216" right="588" bottom="2248"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x11
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP574" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="487" top="2262" right="587" bottom="2294"/>
<Line1Text Enable="1" Text="司机门玻璃停止上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x00
</Script></Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="522" top="1737" right="554" bottom="1769"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="手动测试">
<Rect left="488" top="2454" right="588" bottom="2486"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="司机门倒车镜X轴增加">
<Rect left="487" top="2503" right="587" bottom="2535"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x14
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP575" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="检测失败">
<Rect left="600" top="2502" right="700" bottom="2534"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="手动测试">
<Rect left="486" top="2551" right="586" bottom="2583"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="司机门倒车镜X轴减少">
<Rect left="485" top="2596" right="585" bottom="2628"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x14
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP576" type="8" flags="97"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="检测失败">
<Rect left="599" top="2596" right="699" bottom="2628"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="手动测试">
<Rect left="484" top="2642" right="584" bottom="2674"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="司机门倒车镜Y轴增加">
<Rect left="484" top="2688" right="584" bottom="2720"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x14
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP577" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="598" top="2687" right="698" bottom="2719"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="手动测试">
<Rect left="484" top="2733" right="584" bottom="2765"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="司机门倒车镜Y轴减少">
<Rect left="484" top="2781" right="584" bottom="2813"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x14
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP578" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="检测失败">
<Rect left="596" top="2781" right="696" bottom="2813"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="521" top="2352" right="553" bottom="2384"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="按司机门座椅记忆开关1">
<Rect left="992" top="2918" right="1092" bottom="2950"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Line1Text Enable="1" Text="按司机门座椅记忆开关1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x19
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment no="33" name="DEP583" type="8" flags="97"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="检测失败">
<Rect left="1106" top="2919" right="1206" bottom="2951"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="124" ActivityType="4" flags="0" name="路由节点">
<Rect left="517" top="2828" right="549" bottom="2860"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="按司机门座椅记忆开关2">
<Rect left="992" top="2966" right="1092" bottom="2998"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Line1Text Enable="1" Text="按司机门座椅记忆开关2"/>
<Script>#COMM 0x22 0x01 0x1A
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment no="34" name="DEP584" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="检测失败">
<Rect left="1106" top="2964" right="1206" bottom="2996"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="按司机门座椅记忆开关3">
<Rect left="992" top="3014" right="1092" bottom="3046"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Line1Text Enable="1" Text="按司机门座椅记忆开关3"/>
<Script>#COMM 0x22 0x01 0x1B
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment no="35" name="DEP585" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="检测失败">
<Rect left="1105" top="3014" right="1205" bottom="3046"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="司机门打开儿童锁">
<Rect left="991" top="3062" right="1091" bottom="3094"/>
<Line1Text Enable="1" Text="司机门儿童锁检测"/>
<Line2Text Enable="1" Text="司机门打开儿童锁，检测状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="司机门关闭儿童锁">
<Rect left="991" top="3106" right="1091" bottom="3138"/>
<Line1Text Enable="1" Text="司机门儿童锁检测"/>
<Line2Text Enable="1" Text="司机门关闭儿童锁，检测状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="自动测试">
<Rect left="483" top="3748" right="583" bottom="3780"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="司机门玻璃降 第一次"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="37" name="DEP587" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="司机门玻璃升">
<Rect left="489" top="3930" right="589" bottom="3962"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x11
if (@3==0x01) then
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
<Activity id="140" ActivityType="3" flags="0" name="检测失败">
<Rect left="599" top="3795" right="699" bottom="3827"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="486" top="3839" right="586" bottom="3871"/>
<Line1Text Enable="1" Text="司机门玻璃停止上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="3885" right="587" bottom="3917"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="司机门玻璃升 第一次"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="36" name="DEP586" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="检测失败">
<Rect left="604" top="3929" right="704" bottom="3961"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="145" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="489" top="3975" right="589" bottom="4007"/>
<Line1Text Enable="1" Text="司机门玻璃停止下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="156" ActivityType="3" flags="0" name="自动测试">
<Rect left="486" top="598" right="586" bottom="630"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴增加"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="157" ActivityType="3" flags="0" name="司机门倒车镜X轴增加">
<Rect left="487" top="649" right="587" bottom="681"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x01 0x14
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP561" type="8" flags="97"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="检测失败">
<Rect left="600" top="649" right="700" bottom="681"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="159" ActivityType="3" flags="0" name="自动测试">
<Rect left="488" top="744" right="588" bottom="776"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜X轴减少"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x02
#DELAY 2000</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="司机门倒车镜复位">
<Rect left="488" top="696" right="588" bottom="728"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x00</Script></Activity>
<Activity id="161" ActivityType="3" flags="0" name="司机门倒车镜X轴减少">
<Rect left="488" top="790" right="588" bottom="822"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x01 0x14
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="RLDCU 自动降左后门玻璃" type="8" flags="97"/>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="司机门倒车镜复位">
<Rect left="487" top="836" right="587" bottom="868"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x00</Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="检测失败">
<Rect left="602" top="834" right="702" bottom="866"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="164" ActivityType="3" flags="0" name="自动测试">
<Rect left="486" top="881" right="586" bottom="913"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴增加"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x03
#DELAY 2000</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="司机门倒车镜Y轴增加">
<Rect left="487" top="929" right="587" bottom="961"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x01 0x14
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP563" type="8" flags="97"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="检测失败">
<Rect left="602" top="929" right="702" bottom="961"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="167" ActivityType="3" flags="0" name="自动测试">
<Rect left="487" top="1023" right="587" bottom="1055"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜Y轴减少"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x04
#DELAY 2000</Script></Activity>
<Activity id="168" ActivityType="3" flags="0" name="司机门倒车镜Y轴减少">
<Rect left="487" top="1069" right="587" bottom="1101"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x01 0x14
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP564" type="8" flags="97"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="司机门倒车镜复位">
<Rect left="487" top="976" right="587" bottom="1008"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x00</Script></Activity>
<Activity id="170" ActivityType="3" flags="0" name="司机门倒车镜复位">
<Rect left="488" top="1114" right="588" bottom="1146"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x05 0x03 0x00</Script></Activity>
<Activity id="171" ActivityType="3" flags="0" name="检测失败">
<Rect left="604" top="1068" right="704" bottom="1100"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="XY_Axis_ReturnControlToECU">
<Rect left="489" top="1164" right="589" bottom="1196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x05 0x00</Script></Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="522" top="2398" right="554" bottom="2430"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="手动测试">
<Rect left="483" top="2883" right="583" bottom="2915"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜折叠"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="司机门倒车镜折叠">
<Rect left="483" top="2930" right="583" bottom="2962"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x13
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP579" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="检测失败">
<Rect left="597" top="2929" right="697" bottom="2961"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="手动测试">
<Rect left="482" top="3260" right="582" bottom="3292"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜展开"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="司机门倒车镜展开">
<Rect left="482" top="3306" right="582" bottom="3338"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x13
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP580" type="8" flags="97"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="检测失败">
<Rect left="596" top="3120" right="696" bottom="3152"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="182" ActivityType="3" flags="0" name="手动测试">
<Rect left="485" top="3075" right="585" bottom="3107"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜开始加热"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="183" ActivityType="3" flags="0" name="司机门倒车镜开始加热">
<Rect left="484" top="3121" right="584" bottom="3153"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x15
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP581" type="8" flags="97"/>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="检测失败">
<Rect left="596" top="3216" right="696" bottom="3248"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="手动测试">
<Rect left="483" top="3169" right="583" bottom="3201"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="司机门倒车镜停止加热"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="司机门倒车镜停止加热">
<Rect left="482" top="3215" right="582" bottom="3247"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x15
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP582" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="检测失败">
<Rect left="599" top="3304" right="699" bottom="3336"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="190" ActivityType="4" flags="0" name="路由节点">
<Rect left="521" top="1444" right="553" bottom="1476"/>
</Activity>
<Activity id="192" ActivityType="4" flags="0" name="路由节点">
<Rect left="513" top="3600" right="545" bottom="3632"/>
</Activity>
<Activity id="193" ActivityType="4" flags="0" name="路由节点">
<Rect left="519" top="3693" right="551" bottom="3725"/>
</Activity>
<Activity id="194" ActivityType="4" flags="0" name="路由节点">
<Rect left="516" top="3367" right="548" bottom="3399"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="比对零件号">
<Rect left="228" top="56" right="328" bottom="88"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
--[[
	if(DString_C131_Car_Tpye == "CH1GM30")then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
	else
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);             
	end
        --]]
	DString_tmp=@3-;
        DString1 = string.sub(DString_tmp,1,string.len(DString_C131_Partnumber));
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	
	if (DString1==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1; 
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP552" type="8" flags="105"/>
</Activity>
<Activity id="198" ActivityType="4" flags="0" name="路由节点">
<Rect left="262" top="3" right="294" bottom="35"/>
</Activity>
<Activity id="199" ActivityType="3" flags="0" name="读硬件号">
<Rect left="354" top="55" right="454" bottom="87"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP553" type="8" flags="105"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="延时300MS">
<Rect left="354" top="99" right="454" bottom="131"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="201" ActivityType="4" flags="0" name="路由节点">
<Rect left="388" top="2" right="420" bottom="34"/>
</Activity>
<Activity id="202" ActivityType="4" flags="0" name="路由节点">
<Rect left="662" top="3" right="694" bottom="35"/>
</Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="521" top="3" right="553" bottom="35"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="488" top="56" right="588" bottom="88"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP554" type="8" flags="105"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="延时300MS">
<Rect left="488" top="103" right="588" bottom="135"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="读软件号">
<Rect left="627" top="51" right="727" bottom="83"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP555" type="8" flags="105"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="延时300MS">
<Rect left="627" top="101" right="727" bottom="133"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="208" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="753" top="51" right="853" bottom="83"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="4.00";
		--if("4.00" == DString1) then              
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.00";
		--if("2.00" == DString1) then   
	else
		StandValue="2.00";
		--if("2.00" == DString1)then              
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end              
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end


                                                          


</Script><assessment no="5" name="DEP556" type="8" flags="105"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="延时300MS">
<Rect left="754" top="101" right="854" bottom="133"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="210" ActivityType="4" flags="0" name="路由节点">
<Rect left="788" top="2" right="820" bottom="34"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1730" top="544" right="1830" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="212" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1290" top="54" right="1390" bottom="86"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP557" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="读VIN">
<Rect left="1290" top="104" right="1390" bottom="136"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	--DString1=bytesStr(@3-@19);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (string.match(DString1,DString_Write_VIN)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Write_VIN;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP558" type="8" flags="97"/>
</Activity>
<Activity id="214" ActivityType="3" flags="0" name="日期读取">
<Rect left="1420" top="104" right="1520" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="215" ActivityType="3" flags="0" name="发送时间">
<Rect left="1420" top="54" right="1520" bottom="86"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="1324" top="4" right="1356" bottom="36"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1540" top="104" right="1640" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="218" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1650" top="104" right="1750" bottom="136"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="12" name="DEP239" type="8" flags="97"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="写配置码">
<Rect left="1540" top="54" right="1640" bottom="86"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2E 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="11" name="DEP238" type="8" flags="97"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="4" right="1606" bottom="36"/>
</Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="4" right="1486" bottom="36"/>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="1684" top="4" right="1716" bottom="36"/>
</Activity>
<Activity id="223" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="488" top="4023" right="588" bottom="4055"/>
<Script>#COMM  0x2F 0x02 0x02 0x00</Script></Activity>
<Activity id="224" ActivityType="4" flags="0" name="路由节点">
<Rect left="427" top="1589" right="459" bottom="1621"/>
</Activity>
<Activity id="225" ActivityType="4" flags="0" name="路由节点">
<Rect left="440" top="1845" right="472" bottom="1877"/>
</Activity>
<Activity id="226" ActivityType="4" flags="0" name="路由节点">
<Rect left="440" top="2138" right="472" bottom="2170"/>
</Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="940" top="2980" right="972" bottom="3012"/>
</Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="431" top="3646" right="463" bottom="3678"/>
</Activity>
<Activity id="230" ActivityType="4" flags="0" name="路由节点">
<Rect left="358" top="2750" right="390" bottom="2782"/>
</Activity>
<Activity id="231" ActivityType="4" flags="0" name="路由节点">
<Rect left="433" top="3885" right="465" bottom="3917"/>
</Activity>
<Activity id="232" ActivityType="4" flags="0" name="路由节点">
<Rect left="419" top="976" right="451" bottom="1008"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="486" top="2308" right="586" bottom="2340"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x02 0x00
</Script></Activity>
<Activity id="234" ActivityType="4" flags="0" name="路由节点">
<Rect left="1029" top="2872" right="1061" bottom="2904"/>
</Activity>
<Activity id="235" ActivityType="3" flags="0" name="手动测试">
<Rect left="482" top="3413" right="582" bottom="3445"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门中控门锁 锁定"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="司机门中控门锁 锁定">
<Rect left="481" top="3459" right="581" bottom="3491"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x18
if (@3==0x01) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="39" name="DEP781" type="8" flags="97"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="检测失败">
<Rect left="595" top="3458" right="695" bottom="3490"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="238" ActivityType="3" flags="0" name="手动测试">
<Rect left="480" top="3506" right="580" bottom="3538"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门中控门锁 解锁"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="239" ActivityType="3" flags="0" name="司机门中控门锁 解锁">
<Rect left="480" top="3553" right="580" bottom="3585"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x18
if (@3==0x02) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="40" name="DEP782" type="8" flags="97"/>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="检测失败">
<Rect left="594" top="3553" right="694" bottom="3585"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="419" top="3488" right="451" bottom="3520"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="手动测试">
<Rect left="484" top="2980" right="584" bottom="3012"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="司机门倒车镜展开"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="司机门倒车镜展开">
<Rect left="484" top="3027" right="584" bottom="3059"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x13
if (@3==0x00) then
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="41" name="DEP580" type="8" flags="97"/>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="检测失败">
<Rect left="598" top="3026" right="698" bottom="3058"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="427" top="2951" right="459" bottom="2983"/>
</Activity>
<Activity id="246" ActivityType="3" flags="0" name="通讯">
<Rect left="113" top="153" right="213" bottom="185"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1313" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1" top="156" right="101" bottom="188"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="4236" right="76" bottom="4268"/>
</Activity>
<Activity id="249" ActivityType="3" flags="0" name="司机门玻璃降">
<Rect left="484" top="3796" right="584" bottom="3828"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x11
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);
#DELAY 1500


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="250" ActivityType="3" flags="0" name="结束通讯">
<Rect top="102" right="100" bottom="134"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="1764" top="4" right="1796" bottom="36"/>
</Activity>
<Activity id="252" ActivityType="3" flags="0" name="混动车型">
<Rect left="873" top="51" right="973" bottom="83"/>
<Script></Script></Activity>
<Activity id="253" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="874" top="103" right="974" bottom="135"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="3.00";
if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="1.00";
	else
		StandValue="3.00";
                --StandValue="1.00";
end
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("3.00" == DString1) then 
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end


                                                          


</Script><assessment no="5" name="DEP556" type="8" flags="105"/>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="延时300MS">
<Rect left="875" top="157" right="975" bottom="189"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="908" top="3" right="940" bottom="35"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="209" right="1066" bottom="241"/>
</Activity>
<Activity id="257" ActivityType="3" flags="0" name="改脸">
<Rect left="997" top="51" right="1097" bottom="83"/>
<Script></Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="998" top="103" right="1098" bottom="135"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="3.00";
        elseif(DString_C131_Car_Tpye=="CH1BM34")then
		StandValue="3.00";
        elseif(DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="1.00";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="1.00";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="1.00";
	else
		StandValue="3.00";
                --StandValue="1.00";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("3.00" == DString1) then 
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end


                                                          


</Script><assessment no="5" name="DEP556" type="8" flags="105"/>
</Activity>
<Activity id="259" ActivityType="3" flags="0" name="延时300MS">
<Rect left="999" top="157" right="1099" bottom="189"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="3" right="1066" bottom="35"/>
</Activity>
<Activity id="261" ActivityType="3" flags="0" name="读DDCU故障码">
<Rect left="504" top="4173" right="604" bottom="4205"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="19年型">
<Rect left="1120" top="54" right="1220" bottom="86"/>
<Script></Script></Activity>
<Activity id="263" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1120" top="104" right="1220" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue= LibGeneral.DDCUsoftVerNum(DString_C131_Car_Tpye);
        engine.println("软件版本号标准值:"..StandValue);
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
                DString1 = engine.GetResponseString(3,2+#StandValue);
		engine.SetLineText(3,DString1);
		engine.println("软件版本号:"..DString1);
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
		engine.println("不比对软件版本号");
                
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP556" type="8" flags="105"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1120" top="154" right="1220" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="4" right="1186" bottom="36"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="13" type="0">
</Transition>
<Transition StartId="4" EndId="14" type="0">
</Transition>
<Transition StartId="4" EndId="14" type="0">
</Transition>
<Transition StartId="4" EndId="14" type="0">
</Transition>
<Transition StartId="7" EndId="193" type="0">
</Transition>
<Transition StartId="8" EndId="261" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="13" EndId="246" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="18" type="0">
</Transition>
<Transition StartId="17" EndId="198" type="0">
</Transition>
<Transition StartId="18" EndId="17" type="0">
</Transition>
<Transition StartId="20" EndId="156" type="1">
<Expression>C131_DDCU_Check_Mirror_Execute_Flag == true</Expression></Transition>
<Transition StartId="20" EndId="232" type="0">
</Transition>
<Transition StartId="32" EndId="79" type="0">
</Transition>
<Transition StartId="56" EndId="105" type="0">
</Transition>
<Transition StartId="76" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="3">
</Transition>
<Transition StartId="78" EndId="32" type="4">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="4">
</Transition>
<Transition StartId="80" EndId="102" type="3">
</Transition>
<Transition StartId="81" EndId="102" type="0">
</Transition>
<Transition StartId="82" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="85" type="3">
</Transition>
<Transition StartId="83" EndId="84" type="4">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="88" type="3">
</Transition>
<Transition StartId="86" EndId="87" type="4">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="190" type="0">
</Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="91" type="4">
</Transition>
<Transition StartId="90" EndId="92" type="3">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="95" type="3">
</Transition>
<Transition StartId="93" EndId="94" type="4">
</Transition>
<Transition StartId="94" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="107" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="100" type="3">
</Transition>
<Transition StartId="97" EndId="99" type="4">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="103" type="0">
</Transition>
<Transition StartId="102" EndId="96" type="1">
<Expression>C131_DDCU_Check_The_Door_Window_Execute_Flag == true</Expression></Transition>
<Transition StartId="102" EndId="226" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="3">
</Transition>
<Transition StartId="104" EndId="56" type="4">
</Transition>
<Transition StartId="105" EndId="233" type="0">
</Transition>
<Transition StartId="107" EndId="225" type="0">
</Transition>
<Transition StartId="107" EndId="76" type="1">
<Expression>C131_DDCU_Check_The_Door_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="108" EndId="109" type="0">
</Transition>
<Transition StartId="109" EndId="111" type="3">
</Transition>
<Transition StartId="109" EndId="110" type="4">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="114" type="3">
</Transition>
<Transition StartId="112" EndId="113" type="4">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="118" type="3">
</Transition>
<Transition StartId="116" EndId="117" type="4">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="124" type="3">
</Transition>
<Transition StartId="119" EndId="120" type="4">
</Transition>
<Transition StartId="120" EndId="124" type="0">
</Transition>
<Transition StartId="121" EndId="230" type="0">
</Transition>
<Transition StartId="121" EndId="175" type="1">
<Expression>C131_DDCU_Check_The_Switches_Execute_Flag == true</Expression></Transition>
<Transition StartId="122" EndId="123" type="4">
</Transition>
<Transition StartId="122" EndId="125" type="3">
</Transition>
<Transition StartId="123" EndId="125" type="0">
</Transition>
<Transition StartId="124" EndId="176" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="124" EndId="245" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="4">
</Transition>
<Transition StartId="125" EndId="128" type="3">
</Transition>
<Transition StartId="126" EndId="128" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="4">
</Transition>
<Transition StartId="128" EndId="134" type="3">
</Transition>
<Transition StartId="129" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="138" EndId="249" type="0">
</Transition>
<Transition StartId="139" EndId="145" type="3">
</Transition>
<Transition StartId="139" EndId="144" type="4">
</Transition>
<Transition StartId="140" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="139" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="223" type="0">
</Transition>
<Transition StartId="156" EndId="157" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="4">
</Transition>
<Transition StartId="157" EndId="160" type="3">
</Transition>
<Transition StartId="158" EndId="160" type="0">
</Transition>
<Transition StartId="159" EndId="161" type="0">
</Transition>
<Transition StartId="160" EndId="159" type="0">
</Transition>
<Transition StartId="161" EndId="162" type="3">
</Transition>
<Transition StartId="161" EndId="163" type="4">
</Transition>
<Transition StartId="162" EndId="164" type="0">
</Transition>
<Transition StartId="163" EndId="162" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="166" type="4">
</Transition>
<Transition StartId="165" EndId="169" type="3">
</Transition>
<Transition StartId="166" EndId="169" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="171" type="4">
</Transition>
<Transition StartId="168" EndId="170" type="3">
</Transition>
<Transition StartId="169" EndId="167" type="0">
</Transition>
<Transition StartId="170" EndId="172" type="0">
</Transition>
<Transition StartId="171" EndId="170" type="0">
</Transition>
<Transition StartId="172" EndId="82" type="0">
</Transition>
<Transition StartId="175" EndId="108" type="1">
<Expression>C131_DDCU_Check_Mirror_Meantime_Execute_Flag == true</Expression></Transition>
<Transition StartId="175" EndId="230" type="0">
</Transition>
<Transition StartId="176" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="242" type="3">
</Transition>
<Transition StartId="177" EndId="178" type="4">
</Transition>
<Transition StartId="178" EndId="242" type="0">
</Transition>
<Transition StartId="179" EndId="180" type="0">
</Transition>
<Transition StartId="180" EndId="187" type="4">
</Transition>
<Transition StartId="180" EndId="194" type="3">
</Transition>
<Transition StartId="181" EndId="185" type="0">
</Transition>
<Transition StartId="182" EndId="183" type="0">
</Transition>
<Transition StartId="183" EndId="185" type="3">
</Transition>
<Transition StartId="183" EndId="181" type="4">
</Transition>
<Transition StartId="184" EndId="179" type="0">
</Transition>
<Transition StartId="185" EndId="186" type="0">
</Transition>
<Transition StartId="186" EndId="184" type="4">
</Transition>
<Transition StartId="186" EndId="179" type="3">
</Transition>
<Transition StartId="187" EndId="194" type="0">
</Transition>
<Transition StartId="190" EndId="89" type="1">
<Expression>C131_DDCU_Check_The_Turn_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="190" EndId="224" type="0">
</Transition>
<Transition StartId="192" EndId="7" type="1">
<Expression>C131_PDCU_Window_Initialization_Execute_Flag == true</Expression></Transition>
<Transition StartId="192" EndId="229" type="0">
</Transition>
<Transition StartId="193" EndId="138" type="1">
<Expression>C131_DDCU_Window_Learning_Execute_Flag == true</Expression></Transition>
<Transition StartId="193" EndId="231" type="0">
</Transition>
<Transition StartId="194" EndId="235" type="1">
<Expression>C131_DDCU_Check_Central_Lock_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="194" EndId="241" type="0">
</Transition>
<Transition StartId="197" EndId="201" type="0">
</Transition>
<Transition StartId="198" EndId="197" type="1">
<Expression>C131_DDCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="198" EndId="201" type="0">
</Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="203" type="0">
</Transition>
<Transition StartId="201" EndId="199" type="1">
<Expression>C131_DDCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="202" EndId="206" type="1">
<Expression>C131_DDCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="202" EndId="210" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="1">
<Expression>C131_DDCU_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="203" EndId="202" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="202" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="210" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="0">
</Transition>
<Transition StartId="209" EndId="256" type="0">
</Transition>
<Transition StartId="210" EndId="208" type="1">
<Expression>C131_DDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="210" EndId="255" type="0">
</Transition>
<Transition StartId="211" EndId="20" type="0">
</Transition>
<Transition StartId="212" EndId="213" type="0">
</Transition>
<Transition StartId="213" EndId="221" type="0">
</Transition>
<Transition StartId="214" EndId="220" type="0">
</Transition>
<Transition StartId="215" EndId="214" type="0">
</Transition>
<Transition StartId="216" EndId="212" type="1">
<Expression>C131_DDCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="216" EndId="221" type="0">
</Transition>
<Transition StartId="217" EndId="222" type="0">
</Transition>
<Transition StartId="218" EndId="251" type="0">
</Transition>
<Transition StartId="219" EndId="217" type="0">
</Transition>
<Transition StartId="220" EndId="219" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_DDCU_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="220" EndId="222" type="0">
</Transition>
<Transition StartId="221" EndId="215" type="1">
<Expression>C131_DDCU_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="221" EndId="220" type="0">
</Transition>
<Transition StartId="222" EndId="218" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_DDCU_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="222" EndId="251" type="0">
</Transition>
<Transition StartId="223" EndId="8" type="0">
</Transition>
<Transition StartId="224" EndId="107" type="0">
</Transition>
<Transition StartId="225" EndId="102" type="0">
</Transition>
<Transition StartId="226" EndId="121" type="0">
</Transition>
<Transition StartId="228" EndId="134" type="0">
</Transition>
<Transition StartId="229" EndId="193" type="0">
</Transition>
<Transition StartId="230" EndId="194" type="0">
</Transition>
<Transition StartId="231" EndId="261" type="0">
</Transition>
<Transition StartId="232" EndId="190" type="0">
</Transition>
<Transition StartId="233" EndId="121" type="0">
</Transition>
<Transition StartId="234" EndId="122" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM21" and DString_C131_Car_Tpye ~= "CH1HM11"</Expression></Transition>
<Transition StartId="234" EndId="228" type="0">
</Transition>
<Transition StartId="235" EndId="236" type="0">
</Transition>
<Transition StartId="236" EndId="238" type="3">
</Transition>
<Transition StartId="236" EndId="237" type="4">
</Transition>
<Transition StartId="237" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="192" type="3">
</Transition>
<Transition StartId="239" EndId="240" type="4">
</Transition>
<Transition StartId="240" EndId="192" type="0">
</Transition>
<Transition StartId="241" EndId="192" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="182" type="3">
</Transition>
<Transition StartId="243" EndId="244" type="4">
</Transition>
<Transition StartId="244" EndId="182" type="0">
</Transition>
<Transition StartId="245" EndId="182" type="0">
</Transition>
<Transition StartId="246" EndId="4" type="3">
</Transition>
<Transition StartId="246" EndId="247" type="4">
</Transition>
<Transition StartId="247" EndId="250" type="0">
</Transition>
<Transition StartId="247" EndId="248" type="5">
</Transition>
<Transition StartId="248" EndId="9" type="0">
</Transition>
<Transition StartId="249" EndId="141" type="3">
</Transition>
<Transition StartId="249" EndId="140" type="4">
</Transition>
<Transition StartId="250" EndId="13" type="0">
</Transition>
<Transition StartId="251" EndId="211" type="0">
</Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="256" type="0">
</Transition>
<Transition StartId="255" EndId="260" type="0">
</Transition>
<Transition StartId="255" EndId="252" type="1">
<Expression>C131_DDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="256" EndId="216" type="0">
</Transition>
<Transition StartId="257" EndId="258" type="0">
</Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="259" EndId="256" type="0">
</Transition>
<Transition StartId="260" EndId="257" type="1">
<Expression>C131_DDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="260" EndId="265" type="0">
</Transition>
<Transition StartId="261" EndId="9" type="0">
</Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="256" type="0">
</Transition>
<Transition StartId="265" EndId="216" type="0">
</Transition>
<Transition StartId="265" EndId="262" type="1">
<Expression>C131_DDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

