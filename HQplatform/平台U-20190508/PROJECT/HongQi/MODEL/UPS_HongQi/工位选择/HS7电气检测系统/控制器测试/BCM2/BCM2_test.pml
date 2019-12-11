<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3028" pbltext="DEP55">
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
<Rect left="1170" top="694" right="1270" bottom="726"/>
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
<Activity id="3" ActivityType="3" flags="0" name="车身控制器2">
<Rect left="210" top="74" right="310" bottom="106"/>
<TitleText Enable="1" Text="车身控制器2"/>
<Script></Script></Activity>
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
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="210" top="384" right="310" bottom="416"/>
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
</Script><assessment no="23" name="DEP58" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="发送key">
<Rect left="210" top="534" right="310" bottom="566"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP59" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="13" flags="0" name="计算">
<Rect left="210" top="464" right="310" bottom="496"/>
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
<Script>#COMM 0x10 0x03</Script><assessment no="21" name="DEP56" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="打开刹车灯">
<Rect left="370" top="224" right="470" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察刹车灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x01  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP1123" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="打开左后雾灯">
<Rect left="370" top="384" right="470" bottom="416"/>
<Line2Text Enable="1" Text="注意观察后雾灯点亮"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x02 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="39" name="DEP1124" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="打开后位置灯">
<Rect left="370" top="544" right="470" bottom="576"/>
<Line2Text Enable="1" Text="注意观察示宽灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="40" name="DEP1129" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="打开倒车灯">
<Rect left="560" top="144" right="660" bottom="176"/>
<Line2Text Enable="1" Text="注意观察倒车灯点亮"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x04 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="41" name="DEP1125" type="8" flags="97"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="打开牌照灯">
<Rect left="560" top="284" right="660" bottom="316"/>
<Line2Text Enable="1" Text="注意观察牌照灯点亮"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x05   
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="42" name="DEP1130" type="8" flags="97"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="打开高位刹车灯">
<Rect left="560" top="414" right="660" bottom="446"/>
<Line2Text Enable="1" Text="注意观察高位刹车灯点亮"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x2f 0x02 0x27 0x03 0x01 
-- engine.Delay(1000)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="43" name="DEP1126" type="8" flags="97"/>
</Activity>
<Activity id="224" ActivityType="3" flags="0" name="关闭刹车灯发送指令">
<Rect left="560" top="554" right="660" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="关闭高位刹车灯指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f  0x02  0x27  0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="230" ActivityType="3" flags="0" name="打开转向灯">
<Rect left="780" top="144" right="880" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察后部转向灯点亮"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xd0 0x08  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="44" name="DEP1127" type="8" flags="97"/>
</Activity>
<Activity id="235" ActivityType="3" flags="0" name="自动打开后雨刷">
<Rect left="780" top="294" right="880" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="注意观察后雨刷动作"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM  0x2F 0x02 0x34 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="45" name="DEP2206" type="8" flags="97"/>
</Activity>
<Activity id="513" ActivityType="3" flags="0" name="读取后雨刷打开状态">
<Rect left="780" top="374" right="880" bottom="406"/>
<Strategy TotalTime="10" NokTime="10" RetryTimeOut="5" DelayTime="500"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x25
engine.SetLineText(1,"#L=后雨刷打开#R=bmpok");
if (@3==0x01) then
	engine.LastError = 0;
        engine.TestResult = 0;
else
	engine.LastError = 1;
	engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP2207" type="8" flags="97"/>
</Activity>
<Activity id="515" ActivityType="3" flags="0" name="自动关闭后雨刷">
<Rect left="780" top="454" right="880" bottom="486"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动关闭后雨刷"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x34 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="46" name="DEP2310" type="8" flags="97"/>
</Activity>
<Activity id="516" ActivityType="3" flags="0" name="后雨刷关闭结果">
<Rect left="780" top="534" right="880" bottom="566"/>
<Strategy TotalTime="10" NokTime="10" RetryTimeOut="5" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x25
engine.SetLineText(1,"#L=后雨刷关闭#R=bmpok");
if (@3==0x00) then
	engine.LastError = 0;
	engine.TestResult = 0;
else
	engine.LastError = 1;
	engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP2208" type="8" flags="97"/>
</Activity>
<Activity id="517" ActivityType="3" flags="0" name="返回控制">
<Rect left="780" top="614" right="880" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x34 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="遮阳打开检测自动测试">
<Rect left="970" top="144" right="1070" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开遮阳板"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x03 0x01
engine.Delay(15000)</Script><assessment no="47" name="DEP2306" type="8" flags="97"/>
</Activity>
<Activity id="524" ActivityType="3" flags="0" name="遮阳检测结果">
<Rect left="970" top="224" right="1070" bottom="256"/>
<Script>#COMM 0x22 0x01 0x24
if (@3==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=遮阳板开关打开#R=bmpok");
else
  engine.LastError = 1;
 
   engine.SetLineText(1,"#L=遮阳板开关打开#R=bmpnok");
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP2307" type="8" flags="97"/>
</Activity>
<Activity id="526" ActivityType="3" flags="0" name="遮阳关闭检测自动测试">
<Rect left="970" top="384" right="1070" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动关闭遮阳板开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x03 0x00
engine.Delay(18000)</Script><assessment no="48" name="DEP2308" type="8" flags="97"/>
</Activity>
<Activity id="527" ActivityType="3" flags="0" name="遮阳检测结果">
<Rect left="970" top="464" right="1070" bottom="496"/>
<Script>#COMM 0x22 0x01 0x24
if (@3==0x00) then
  engine.LastError = 0;
   engine.SetLineText(1,"#L=遮阳板开关关闭#R=bmpok");
else
  engine.LastError = 1;
  engine.TestResult = 1;
     engine.SetLineText(1,"#L=遮阳板开关关闭#R=bmpnok");
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP2309" type="8" flags="97"/>
</Activity>
<Activity id="528" ActivityType="3" flags="0" name="ControlToECU">
<Rect left="970" top="544" right="1070" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x00</Script></Activity>
<Activity id="531" ActivityType="3" flags="0" name="打开后风扇加热状态">
<Rect left="1170" top="224" right="1270" bottom="256"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="20" DelayTime="300"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请打开后风窗加热开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x19
engine.SetLineText(2,@3);
if(@3==0x01)then
	engine.LastError = 0;
        engine.TestResult = 0;         
else
	engine.LastError = 1;
        engine.TestResult = 1;         
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="36" name="DEP2311" type="8" flags="97"/>
</Activity>
<Activity id="535" ActivityType="3" flags="0" name="读取后风扇加热状态">
<Rect left="1350" top="134" right="1450" bottom="166"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Line2Text Enable="1" Text="请手动将ACP_F后风扇加热关闭"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x19
if(@3==0x00)then
	engine.LastError = 0; 
        engine.SetLineText(2,"#L=后风扇加热关闭#R=bmpok");      
else
	engine.LastError = 1;
        engine.SetLineText(2,"#L=后风扇加热关闭#R=bmpnok"); 
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="37" name="DEP2312" type="8" flags="97"/>
</Activity>
<Activity id="544" ActivityType="3" flags="1" name="手动确认">
<Rect left="370" top="304" right="470" bottom="336"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=刹车灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="25" name="DEP684" type="8" flags="97"/>
</Activity>
<Activity id="562" ActivityType="3" flags="0" name="手动确认">
<Rect left="370" top="464" right="470" bottom="496"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=左后雾灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="26" name="DEP685" type="8" flags="97"/>
</Activity>
<Activity id="563" ActivityType="3" flags="0" name="手动确认">
<Rect left="370" top="624" right="470" bottom="656"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=示宽灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="27" name="DEP686" type="8" flags="97"/>
</Activity>
<Activity id="564" ActivityType="3" flags="0" name="手动确认">
<Rect left="560" top="214" right="660" bottom="246"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=倒车灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="28" name="DEP687" type="8" flags="97"/>
</Activity>
<Activity id="565" ActivityType="3" flags="0" name="手动确认">
<Rect left="560" top="344" right="660" bottom="376"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=牌照灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="29" name="DEP688" type="8" flags="97"/>
</Activity>
<Activity id="567" ActivityType="3" flags="0" name="手动确认">
<Rect left="780" top="224" right="880" bottom="256"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=后转向灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="31" name="DEP689" type="8" flags="97"/>
</Activity>
<Activity id="569" ActivityType="3" flags="0" name="普通节点">
<Rect left="370" top="144" right="470" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请走到车尾部检测灯光状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="570" ActivityType="3" flags="0" name="手动确认">
<Rect left="560" top="484" right="660" bottom="516"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script> engine.SetLineText(1,"#L=高位刹车灯是否点亮#R=bmpeye");
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="30" name="DEP60" type="8" flags="97"/>
</Activity>
<Activity id="571" ActivityType="3" flags="0" name="ControlToECU">
<Rect left="970" top="294" right="1070" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x33 0x00</Script></Activity>
<Activity id="573" ActivityType="3" flags="0" name="关闭后风扇加热状态">
<Rect left="1170" top="294" right="1270" bottom="326"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="20" DelayTime="300"/>
<Line2Text Enable="1" Text="请关闭后风窗加热开关"/>
<Script>#COMM 0x22 0x01 0x19
engine.SetLineText(2,@3);
if(@3==0x00)then
	engine.LastError = 0;  
        engine.TestResult = 0;
else
	engine.LastError = 1;
        engine.TestResult = 1;                 
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="49" name="DEP2312" type="8" flags="97"/>
</Activity>
<Activity id="574" ActivityType="3" flags="0" name="通讯失败">
<Rect left="20" top="224" right="120" bottom="256"/>
<Line1Text Enable="1" Text="BCM2 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="575" ActivityType="3" flags="0" name="结束通讯">
<Rect left="20" top="144" right="120" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="576" ActivityType="4" flags="0" name="路由节点">
<Rect left="54" top="694" right="86" bottom="726"/>
</Activity>
<Activity id="577" ActivityType="3" flags="0" name="切诊断">
<Rect left="210" top="314" right="310" bottom="346"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1085" type="8" flags="97"/>
</Activity>
<Activity id="578" ActivityType="3" flags="0" name="检查后风窗加热状态">
<Rect left="1170" top="154" right="1270" bottom="186"/>
<Line1Text Enable="1" Text="请到驾驶室内"/>
<Line2Text Enable="1" Text="准备检查后风窗加热开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="88" type="0">
</Transition>
<Transition StartId="7" EndId="87" type="0">
</Transition>
<Transition StartId="72" EndId="569" type="0">
</Transition>
<Transition StartId="87" EndId="72" type="0">
</Transition>
<Transition StartId="88" EndId="577" type="3">
</Transition>
<Transition StartId="88" EndId="574" type="4">
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
<Transition StartId="222" EndId="570" type="0">
</Transition>
<Transition StartId="224" EndId="230" type="0">
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
<Transition StartId="517" EndId="578" type="0">
</Transition>
<Transition StartId="523" EndId="524" type="0">
</Transition>
<Transition StartId="524" EndId="571" type="0">
</Transition>
<Transition StartId="526" EndId="527" type="0">
</Transition>
<Transition StartId="527" EndId="528" type="0">
</Transition>
<Transition StartId="531" EndId="573" type="0">
</Transition>
<Transition StartId="544" EndId="197" type="0">
</Transition>
<Transition StartId="562" EndId="213" type="0">
</Transition>
<Transition StartId="563" EndId="216" type="0">
</Transition>
<Transition StartId="564" EndId="219" type="0">
</Transition>
<Transition StartId="565" EndId="222" type="0">
</Transition>
<Transition StartId="567" EndId="235" type="0">
</Transition>
<Transition StartId="569" EndId="194" type="0">
</Transition>
<Transition StartId="570" EndId="224" type="0">
</Transition>
<Transition StartId="571" EndId="526" type="0">
</Transition>
<Transition StartId="573" EndId="2" type="0">
</Transition>
<Transition StartId="574" EndId="575" type="0">
</Transition>
<Transition StartId="574" EndId="576" type="5">
</Transition>
<Transition StartId="575" EndId="5" type="0">
</Transition>
<Transition StartId="576" EndId="2" type="0">
</Transition>
<Transition StartId="577" EndId="7" type="0">
</Transition>
<Transition StartId="578" EndId="531" type="0">
</Transition>
</Transitions>
</Process>

