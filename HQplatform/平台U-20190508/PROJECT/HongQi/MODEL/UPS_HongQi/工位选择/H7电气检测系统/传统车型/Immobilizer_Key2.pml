<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1012" pbltext="DEP178">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="rematch_firkey" type="3" dir="1" data="rematch_firkey"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="301" top="31" right="401" bottom="63"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="470" top="1534" right="570" bottom="1566"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="请求随机数">
<Rect left="302" top="655" right="402" bottom="687"/>
<Line1Text Enable="1" Text="获取随机数"/>
<Script>#COMM 0x31 0x01 0xFF 0xFA
engine.SetLineText(3,string.format("%02x%02x%02x",@4,@5,@6));
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.SetLineText(3,DString_Write_VIN);
--engine.StatValue=hexstr(StringRes);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP169" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="随机数比对">
<Rect left="303" top="712" right="403" bottom="744"/>
<Line1Text Enable="1" Text="随机数比对"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x03 0xFF 0xFA

engine.println("PEPS Random code1:"..string.format("%02x%02x%02x",@4,@5,@6))
engine.println("PEPS Random code to INT:"..@6*256*256+@5*256+@4)

randm=string.char(@4,@5,@6)
--engine.StatValue=randm;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP170" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="读VIN">
<Rect left="302" top="761" right="402" bottom="793"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)
--engine.StatValue=vin;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="9" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="dll_1">
<Rect left="303" top="816" right="403" bottom="848"/>
<FunctionRef id="Secure_compute1">
<Parameters>
<Parameter id="strInCode" value="vin"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="SC">
<Rect left="304" top="871" right="404" bottom="903"/>
<Line1Text Enable="1" Text="计算SC"/>
<Script>sc=hexstr(strOutCode)
sc1=hex2dec(sc,1)
sc2=hex2dec(sc,3)
sc3=hex2dec(sc,5)

sc_hex= string.char(sc1,sc2,sc3)
engine.println("sc_hex:"..sc_hex)
engine.println("SC code after caculate 10: " .. sc3*256*256+sc2*256+sc1);
engine.println("c131 immo string 2 hex str:"..string.format("%02x%02x%02x",sc3,sc2,sc1))
string.format("%02x%02x%02x",@4,@5,@6)
engine.StatValue=sc1..","..sc2..","..sc3;
</Script><assessment no="10" name="DEP171" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="dll_3">
<Rect left="304" top="925" right="404" bottom="957"/>
<FunctionRef id="Secure_compute3">
<Parameters>
<Parameter id="pucOutCode" value="randm"/>
<Parameter id="pucAuth" value="sc_hex"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="InCode">
<Rect left="303" top="979" right="403" bottom="1011"/>
<Line1Text Enable="1" Text="计算Incode"/>
<Script>engine.println(ret)
incode1=bit32.rshift(ret,8)
incode2=bit32.band(ret,0xff)
engine.StatValue=incode1..","..incode2;</Script><assessment no="11" name="DEP172" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="发送SC和Incode">
<Rect left="304" top="1038" right="404" bottom="1070"/>
<Line1Text Enable="1" Text="发送SC Incode"/>
<Script>#COMM  0x31 0x01 0xff 0xfb incode1 incode2 sc1 sc2 sc3
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP196" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="解锁">
<Rect left="304" top="1095" right="404" bottom="1127"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="匹配遥控钥匙"/>
<Script>#COMM 0x31 0x03 0xff 0xfb

if (@4==0x00) then
  engine.LastError = 0;
  engine.println("解锁成功");
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP173" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="检测失败">
<Rect left="469" top="1096" right="569" bottom="1128"/>
<Line2Text Enable="1" Text="解锁失败"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="是否清空信息">
<Rect left="175" top="1096" right="275" bottom="1128"/>
<Line1Text Enable="1" Text="清空 PEPS 钥匙信息"/>
<Line2Text Enable="1" Text="#L=清空按确认，否则按放弃#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="清空">
<Rect left="176" top="1151" right="276" bottom="1183"/>
<Line1Text Enable="1" Text="清空PEPS信息"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xFF 0xf7
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="清空">
<Rect left="176" top="1213" right="276" bottom="1245"/>
<Line1Text Enable="1" Text="清空PEPS信息"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x03 0xFF 0xf7
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="开始匹配">
<Rect left="303" top="1154" right="403" bottom="1186"/>
<Line1Text Enable="1" Text="开始匹配钥匙"/>
<Line2Text Enable="1" Text="#L=请将第2把钥匙靠近防盗线圈#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonRText Enable="1" Text="开始匹配"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送指令">
<Rect left="304" top="1208" right="404" bottom="1240"/>
<Line1Text Enable="1" Text="匹配遥控钥匙"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xFF 0xf8
</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="匹配遥控钥匙">
<Rect left="305" top="1314" right="405" bottom="1346"/>
<Strategy TotalTime="6" NokTime="0" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="PEPS 安全解除"/>
<Script>#COMM 0x31 0x03 0xff 0xf8
rek_flag=0;
rematch_firkey=0;
if(@0==0x71)then

  DVciResult=@4
  if (@4==0x00) then
    engine.LastError = 0;
  else
    engine.LastError = 1;
    if(DVciResult==0x01)then
      rek_flag=1;
      engine.SetLineText(2,"钥匙已经匹配过，请按 放弃")
      engine.println("钥匙已经匹配过，请按 放弃")  

    elseif(DVciResult==0x02)then
      engine.SetLineText(2,"SK写入到CID失败,重试吗？")
      engine.println("SK写入到CID失败,重试吗？")

    elseif(DVciResult==0x03)then
      engine.SetLineText(2,"PKE 通讯失败，重试吗？")
      engine.println("PKE 通讯失败，重试吗？")

    elseif(DVciResult==0x04)then
      engine.SetLineText(2,"读IDE失败，重试吗？")
      engine.println("读IDE失败，重试吗？")

    elseif(DVciResult==0x07)then
      engine.SetLineText(2,"安全解除未通过！")
      engine.println("安全解除未通过！")

    end
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP178" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="匹配成功">
<Rect left="305" top="1367" right="405" bottom="1399"/>
<Line1Text Enable="1" Text="匹配成功"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--engine.SetLineText(2,"匹配成功");
#DELAY 2000</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="匹配失败">
<Rect left="468" top="1314" right="568" bottom="1346"/>
<Line1Text Enable="1" Text="匹配失败！是否重新匹配？"/>
<ButtonLText Enable="1" Text="放弃匹配"/>
<ButtonRText Enable="1" Text="重新匹配"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="清除所有行和标题">
<Rect left="469" top="1368" right="569" bottom="1400"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="25" ActivityType="3" flags="1" name="匹配第二把钥匙">
<Rect left="301" top="89" right="401" bottom="121"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Line1Text Enable="1" Text="匹配 第 2 把 钥匙"/>
<Line2Text Enable="1" Text="#L=OK?#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确认匹配"/>
<Script>--#DELATY 1000
</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="301" top="332" right="401" bottom="364"/>
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
<Activity id="27" ActivityType="13" flags="0" name="计算key">
<Rect left="301" top="387" right="401" bottom="419"/>
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
<Activity id="28" ActivityType="3" flags="0" name="发送key">
<Rect left="301" top="439" right="401" bottom="471"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="检测失败">
<Rect left="469" top="440" right="569" bottom="472"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="读VIN">
<Rect left="301" top="492" right="401" bottom="524"/>
<Line1Text Enable="1" Text="读车辆VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.SetLineText(3,DString_Write_VIN);</Script><assessment no="4" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="发送VIN">
<Rect left="301" top="545" right="401" bottom="577"/>
<Line1Text Enable="1" Text="写VIN"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>vin=DString_Write_VIN;
#COMM 0x2E 0xF1 0x90  string.byte(vin,1) string.byte(vin,2) string.byte(vin,3) string.byte(vin,4) string.byte(vin,5) string.byte(vin,6) string.byte(vin,7) string.byte(vin,8) string.byte(vin,9) string.byte(vin,10) string.byte(vin,11) string.byte(vin,12) string.byte(vin,13) string.byte(vin,14) string.byte(vin,15) string.byte(vin,16) string.byte(vin,17)
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP168" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="读VIN">
<Rect left="301" top="600" right="401" bottom="632"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.SetLineText(3,vin);</Script><assessment no="6" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="切诊断">
<Rect left="302" top="279" right="402" bottom="311"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="倒计时5s">
<Rect left="305" top="1260" right="405" bottom="1292"/>
<Script>--#DELAY 5000
for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end
</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="中断通讯">
<Rect left="587" top="1314" right="687" bottom="1346"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="621" top="89" right="653" bottom="121"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="连接ECU">
<Rect left="302" top="152" right="402" bottom="184"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 300
#COMMINIT
</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="通讯">
<Rect left="301" top="217" right="401" bottom="249"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="通讯失败">
<Rect left="155" top="218" right="255" bottom="250"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="44" ActivityType="3" flags="0" name="结束通讯">
<Rect left="156" top="149" right="256" bottom="181"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="1534" right="136" bottom="1566"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="99" top="219" right="131" bottom="251"/>
</Activity>
<Activity id="47" ActivityType="4" flags="0" name="路由节点">
<Rect left="589" top="1201" right="621" bottom="1233"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="从第一把重新匹配">
<Rect left="434" top="1238" right="534" bottom="1270"/>
<Line1Text Enable="1" Text="从第一把钥匙重新匹配？"/>
<ButtonLText Enable="1" Text="放弃匹配"/>
<ButtonRText Enable="1" Text="重新匹配"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   rematch_firkey=1;
   engine.println("返回值=钥匙已经匹配过，选择从第一把钥匙重新匹配，rematch_firkey="..rematch_firkey);
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   rematch_firkey=0;
   engine.LastError = 1;
   engine.println("返回值=钥匙已经匹配过，不选择从第一把钥匙重新匹配，rematch_firkey="..rematch_firkey);
else
end
</Script></Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="418" top="1314" right="450" bottom="1346"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="25" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="4">
</Transition>
<Transition StartId="14" EndId="19" type="3">
</Transition>
<Transition StartId="15" EndId="23" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="5">
</Transition>
<Transition StartId="16" EndId="17" type="6">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="6">
</Transition>
<Transition StartId="20" EndId="38" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="21" EndId="49" type="4">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="5">
</Transition>
<Transition StartId="23" EndId="39" type="0">
</Transition>
<Transition StartId="24" EndId="2" type="0">
</Transition>
<Transition StartId="25" EndId="41" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="4">
</Transition>
<Transition StartId="28" EndId="30" type="3">
</Transition>
<Transition StartId="29" EndId="15" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="3" type="0">
</Transition>
<Transition StartId="36" EndId="26" type="0">
</Transition>
<Transition StartId="38" EndId="21" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="4">
</Transition>
<Transition StartId="42" EndId="36" type="3">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="43" EndId="46" type="5">
</Transition>
<Transition StartId="44" EndId="41" type="0">
</Transition>
<Transition StartId="45" EndId="2" type="0">
</Transition>
<Transition StartId="46" EndId="45" type="0">
</Transition>
<Transition StartId="47" EndId="19" type="0">
</Transition>
<Transition StartId="48" EndId="24" type="0">
</Transition>
<Transition StartId="49" EndId="48" type="1">
<Expression>rek_flag == 1</Expression></Transition>
<Transition StartId="49" EndId="23" type="0">
</Transition>
</Transitions>
</Process>

