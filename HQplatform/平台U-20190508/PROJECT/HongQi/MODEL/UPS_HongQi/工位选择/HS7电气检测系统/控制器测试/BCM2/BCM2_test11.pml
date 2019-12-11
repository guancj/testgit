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
<Variable id="CAN_SND_ID" type="3" data="0x751" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x759" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" right="310" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1360" top="214" right="1460" bottom="246"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车身控制器2">
<Rect left="210" top="74" right="310" bottom="106"/>
<TitleText Enable="1" Text="车身控制器2"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="210" top="304" right="310" bottom="336"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="210" top="144" right="310" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="90" top="394" right="190" bottom="426"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="210" top="474" right="310" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
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
</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="发送key">
<Rect left="210" top="634" right="310" bottom="666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
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
<Activity id="87" ActivityType="13" flags="0" name="计算">
<Rect left="210" top="554" right="310" bottom="586"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8EACBD9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="通讯">
<Rect left="210" top="224" right="310" bottom="256"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="通讯失败">
<Rect left="60" top="184" right="160" bottom="216"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.TestResult = 1;
engine.SetLineText(1,"通讯失败，程序退出")
#STOPCOMM
engine.Delay(300)</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="走到车的后面">
<Rect left="390" top="154" right="490" bottom="186"/>
<Line1Text Enable="1" Text="请走到车的后面，准备检查尾灯状态"/>
<Line2Text Enable="1" Text="请注意观察后部刹车灯"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="打开刹车灯">
<Rect left="390" top="314" right="490" bottom="346"/>
<Script>#COMM 0x31 0x01 0xd0 0x01  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="打开左后雾灯">
<Rect left="390" top="554" right="490" bottom="586"/>
<Script>#COMM 0x31 0x01 0xd0 0x02 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="打开后位置灯">
<Rect left="580" top="234" right="680" bottom="266"/>
<Script>#COMM 0x31 0x01 0xd0 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="216" ActivityType="3" flags="0" name="打开倒车灯">
<Rect left="580" top="474" right="680" bottom="506"/>
<Script>#COMM 0x31 0x01 0xd0 0x04 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="219" ActivityType="3" flags="0" name="打开牌照灯">
<Rect left="770" top="154" right="870" bottom="186"/>
<Script>#COMM 0x31 0x01 0xd0 0x05   
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script></Activity>
<Activity id="221" ActivityType="3" flags="0" name="观察高位刹车灯">
<Rect left="770" top="314" right="870" bottom="346"/>
<Line1Text Enable="1" Text="请注意观察后部高位刹车灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = -1;
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="222" ActivityType="3" flags="0" name="打开高位刹车灯">
<Rect left="770" top="394" right="870" bottom="426"/>
<Line1Text Enable="1" Text="自动检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="打开高位刹车灯"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x27 0x03 0x01 
engine.Delay(1000)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="223" ActivityType="3" flags="0" name="高位刹车灯确认">
<Rect left="770" top="474" right="870" bottom="506"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Script>#COMM 0x22 0x01 0x15
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
 engine.TestResult = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="关闭刹车灯发送指令">
<Rect left="770" top="554" right="870" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f  0x02  0x27  0x00</Script></Activity>
<Activity id="227" ActivityType="3" flags="0" name="观察转向灯">
<Rect left="770" top="634" right="870" bottom="666"/>
<Line1Text Enable="1" Text="请注意观察后部转向灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="230" ActivityType="3" flags="0" name="打开转向灯">
<Rect left="970" top="154" right="1070" bottom="186"/>
<Line1Text Enable="1" Text="自动检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="打开后部转向灯"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xd0 0x08  


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="235" ActivityType="3" flags="0" name="后雨刷打开自动测试">
<Rect left="970" top="304" right="1070" bottom="336"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="后雨刷打开自动测试"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x34 0x03 0x01
engine.Delay(500)</Script></Activity>
<Activity id="513" ActivityType="3" flags="0" name="后雨刷打开结果">
<Rect left="970" top="394" right="1070" bottom="426"/>
<Strategy TotalTime="10" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="515" ActivityType="3" flags="0" name="后雨刷关闭自动测试">
<Rect left="970" top="464" right="1070" bottom="496"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="后雨刷关闭自动测试"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x34 0x03 0x00</Script></Activity>
<Activity id="516" ActivityType="3" flags="0" name="后雨刷关闭结果">
<Rect left="970" top="544" right="1070" bottom="576"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="517" ActivityType="3" flags="0" name="返回控制">
<Rect left="970" top="624" right="1070" bottom="656"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x34 0x00</Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="遮阳打开检测自动测试">
<Rect left="1160" top="144" right="1260" bottom="176"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="遮阳板打开检测测试"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x03 0x01
engine.Delay(5000)</Script></Activity>
<Activity id="524" ActivityType="3" flags="0" name="遮阳检测结果">
<Rect left="1160" top="224" right="1260" bottom="256"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Script>#COMM 0x22 0x01 0x24
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="526" ActivityType="3" flags="0" name="遮阳关闭检测自动测试">
<Rect left="1160" top="304" right="1260" bottom="336"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="遮阳检测自动测试"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x03 0x00
engine.Delay(5000)</Script></Activity>
<Activity id="527" ActivityType="3" flags="0" name="遮阳检测结果">
<Rect left="1160" top="384" right="1260" bottom="416"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Script>#COMM 0x22 0x01 0x24
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="528" ActivityType="3" flags="0" name="ControlToECU">
<Rect left="1160" top="464" right="1260" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x00</Script></Activity>
<Activity id="529" ActivityType="3" flags="0" name="后玻璃加热功能检测">
<Rect left="1160" top="544" right="1260" bottom="576"/>
<TitleText Enable="1" Text="车身控制器2"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="后玻璃加热功能检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="531" ActivityType="3" flags="0" name="读取后风扇加热状态">
<Rect left="1160" top="624" right="1260" bottom="656"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Line2Text Enable="1" Text="请将ACP_F后风扇加热打开"/>
<Script>#COMM 0x22 0x01 0x19
if(@3==0x01)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="535" ActivityType="3" flags="0" name="读取后风扇加热状态">
<Rect left="1360" top="134" right="1460" bottom="166"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Line2Text Enable="1" Text="请将ACP_F后风扇加热关闭"/>
<Script>#COMM 0x22 0x01 0x19
if(@3==0x00)then
	engine.LastError = 0;       
else
	engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="538" ActivityType="3" flags="0" name="观察牌照灯">
<Rect left="580" top="634" right="680" bottom="666"/>
<Line1Text Enable="1" Text="请注意观察牌照灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="539" ActivityType="3" flags="0" name="观察倒车灯">
<Rect left="580" top="394" right="680" bottom="426"/>
<Line1Text Enable="1" Text="请注意观察倒车灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="540" ActivityType="3" flags="0" name="观察后位置">
<Rect left="580" top="154" right="680" bottom="186"/>
<Line1Text Enable="1" Text="请注意观察后位置灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="541" ActivityType="3" flags="0" name="观察左后雾灯">
<Rect left="390" top="474" right="490" bottom="506"/>
<Line1Text Enable="1" Text="请注意观察左后雾灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="542" ActivityType="3" flags="0" name="观察刹车灯灯">
<Rect left="390" top="234" right="490" bottom="266"/>
<Line1Text Enable="1" Text="请注意观察刹车灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="544" ActivityType="3" flags="0" name="手动确认">
<Rect left="390" top="394" right="490" bottom="426"/>
<Line1Text Enable="1" Text="刹车灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
<Activity id="562" ActivityType="3" flags="0" name="手动确认">
<Rect left="390" top="634" right="490" bottom="666"/>
<Line1Text Enable="1" Text="左后雾灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
<Activity id="563" ActivityType="3" flags="0" name="手动确认">
<Rect left="580" top="314" right="680" bottom="346"/>
<Line1Text Enable="1" Text="后位置灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
<Activity id="564" ActivityType="3" flags="0" name="手动确认">
<Rect left="580" top="554" right="680" bottom="586"/>
<Line1Text Enable="1" Text="倒车灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
<Activity id="565" ActivityType="3" flags="0" name="手动确认">
<Rect left="770" top="234" right="870" bottom="266"/>
<Line1Text Enable="1" Text="牌照灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
<Activity id="567" ActivityType="3" flags="0" name="手动确认">
<Rect left="970" top="234" right="1070" bottom="266"/>
<Line1Text Enable="1" Text="左右转向灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
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
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="7" type="0">
</Transition>
<Transition StartId="5" EndId="88" type="0">
</Transition>
<Transition StartId="5" EndId="90" type="4">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="87" type="0">
</Transition>
<Transition StartId="72" EndId="160" type="0">
</Transition>
<Transition StartId="87" EndId="72" type="0">
</Transition>
<Transition StartId="88" EndId="4" type="3">
</Transition>
<Transition StartId="88" EndId="90" type="0">
</Transition>
<Transition StartId="160" EndId="542" type="0">
</Transition>
<Transition StartId="194" EndId="544" type="0">
</Transition>
<Transition StartId="197" EndId="562" type="0">
</Transition>
<Transition StartId="213" EndId="563" type="0">
</Transition>
<Transition StartId="216" EndId="564" type="0">
</Transition>
<Transition StartId="219" EndId="565" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="223" type="0">
</Transition>
<Transition StartId="223" EndId="224" type="0">
</Transition>
<Transition StartId="224" EndId="227" type="0">
</Transition>
<Transition StartId="227" EndId="230" type="0">
</Transition>
<Transition StartId="230" EndId="567" type="0">
</Transition>
<Transition StartId="235" EndId="513" type="0">
</Transition>
<Transition StartId="513" EndId="515" type="0">
</Transition>
<Transition StartId="515" EndId="516" type="0">
</Transition>
<Transition StartId="516" EndId="517" type="0">
</Transition>
<Transition StartId="517" EndId="523" type="0">
</Transition>
<Transition StartId="523" EndId="524" type="0">
</Transition>
<Transition StartId="524" EndId="526" type="0">
</Transition>
<Transition StartId="526" EndId="527" type="0">
</Transition>
<Transition StartId="527" EndId="528" type="0">
</Transition>
<Transition StartId="528" EndId="529" type="0">
</Transition>
<Transition StartId="529" EndId="531" type="0">
</Transition>
<Transition StartId="531" EndId="535" type="0">
</Transition>
<Transition StartId="535" EndId="2" type="0">
</Transition>
<Transition StartId="538" EndId="219" type="0">
</Transition>
<Transition StartId="539" EndId="216" type="0">
</Transition>
<Transition StartId="540" EndId="213" type="0">
</Transition>
<Transition StartId="541" EndId="197" type="0">
</Transition>
<Transition StartId="542" EndId="194" type="0">
</Transition>
<Transition StartId="544" EndId="541" type="0">
</Transition>
<Transition StartId="562" EndId="540" type="0">
</Transition>
<Transition StartId="563" EndId="539" type="0">
</Transition>
<Transition StartId="564" EndId="538" type="0">
</Transition>
<Transition StartId="565" EndId="221" type="0">
</Transition>
<Transition StartId="567" EndId="235" type="0">
</Transition>
</Transitions>
</Process>

