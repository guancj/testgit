<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1021" pbltext="DEP954">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="310" top="27" right="410" bottom="59"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="1554" right="170" bottom="1586"/>
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
<Activity id="3" ActivityType="3" flags="0" name="点火开关位置自动测试">
<Rect left="312" top="332" right="412" bottom="364"/>
<Line1Text Enable="1" Text="打开点火开关"/>
<Line2Text Enable="1" Text="#L=然后按确认#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="1" name="点火开关位置">
<Rect left="313" top="398" right="413" bottom="430"/>
<Strategy TotalTime="30" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x2A
if(@0==0x62)then
if(@3==0x02) then
  engine.LastError = 0;
elseif(@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(2,@3);
engine.StatValue=@3;
engine.StatPoint=2;

else
     engine.LastError = 1;
     engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP719" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="清空显示">
<Rect left="313" top="455" right="413" bottom="487"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="314" top="580" right="414" bottom="612"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="313" top="688" right="413" bottom="720"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算key">
<Rect left="314" top="634" right="414" bottom="666"/>
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
<Activity id="10" ActivityType="3" flags="0" name="切诊断">
<Rect left="314" top="516" right="414" bottom="548"/>
<Line1Text Enable="1" Text="切诊断"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP1229" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="读VIN">
<Rect left="313" top="742" right="413" bottom="774"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="请求随机数">
<Rect left="312" top="798" right="412" bottom="830"/>
<Line1Text Enable="1" Text="获取随机数"/>
<Script>--#COMM 0x31 0x01 0xFF 0x3F
#COMM 0x31 0x01 0xFF 0xFA</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="随机数检查">
<Rect left="312" top="856" right="412" bottom="888"/>
<Line1Text Enable="1" Text="随机数比对"/>
<Script>--#COMM 0x31 0x03 0xFF 0x3F
#COMM 0x31 0x03 0xFF 0xFA

engine.println("PEPS Random code1:"..string.format("%02x%02x%02x",@4,@5,@6))
engine.println("PEPS Random code to INT:"..@6*256*256+@5*256+@4)

randm=string.char(@4,@5,@6)
--randm=@6*256*256+@5*256+@4;
engine.println("randm="..randm);</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="读VIN">
<Rect left="312" top="913" right="412" bottom="945"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script></Activity>
<Activity id="15" ActivityType="13" flags="0" name="dll_1">
<Rect left="313" top="969" right="413" bottom="1001"/>
<Line1Text Enable="1" Text="计算SC"/>
<FunctionRef id="Secure_compute1">
<Parameters>
<Parameter id="strInCode" value="vin"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="SC">
<Rect left="312" top="1021" right="412" bottom="1053"/>
<Script>sc=hexstr(strOutCode)
sc1=hex2dec(sc,1)
sc2=hex2dec(sc,3)
sc3=hex2dec(sc,5)

sc_hex= string.char(sc1,sc2,sc3)
--sc_hex= sc3*256*256+sc2*256+sc1
engine.println("sc_hex:"..sc_hex)
engine.println("SC code after caculate 10: " .. sc3*256*256+sc2*256+sc1);
engine.println("c131 immo string 2 hex str:"..string.format("%02x%02x%02x",sc3,sc2,sc1))</Script></Activity>
<Activity id="17" ActivityType="13" flags="0" name="dll_3">
<Rect left="312" top="1074" right="412" bottom="1106"/>
<Line1Text Enable="1" Text="计算Incode"/>
<FunctionRef id="Secure_compute3">
<Parameters>
<Parameter id="pucOutCode" value="randm"/>
<Parameter id="pucAuth" value="sc_hex"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="InCode">
<Rect left="313" top="1127" right="413" bottom="1159"/>
<Script>engine.println(ret)
incode1=bit32.rshift(ret,8)
incode2=bit32.band(ret,0xff)
--engine.StatValue=incode1..","..incode2;

--engine.println(ret)
--hexret=string.sub(string.format("%#X",ret),3);
--engine.println("hexret="..hexret);
--if string.len(hexret) == 3 then 
--        last_byte = string.sub(hexret,2);
--        engine.println("last_byte="..last_byte);
--        mid_byte = string.sub(hexret,1,1);
--        engine.println("mid_byte="..mid_byte);
--        first_byte = "0"..mid_byte;
--        engine.println("first_byte="..first_byte);
       
--        hexret = first_byte..last_byte;
--        engine.println("hexret in 'FFF'= "..hexret);
--end
</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="发送SC和Incode">
<Rect left="312" top="1182" right="412" bottom="1214"/>
<Line1Text Enable="1" Text="发送SC Incode"/>
<Script>#COMM  0x31 0x01 0xff 0xfb incode1 incode2 sc1 sc2 sc3
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP1230" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="解锁">
<Rect left="313" top="1236" right="413" bottom="1268"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="匹配遥控钥匙"/>
<Script>#COMM 0x31 0x03 0xff 0xfB

if(@0==0x71)then
if (@4==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@4;
engine.StatPoint=0;

else
     engine.LastError = 1;
     engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP173" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="发送匹配命令">
<Rect left="312" top="1342" right="412" bottom="1374"/>
<Script>#COMM 0x31 0x01 0xff 0xF6
if(@0==0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="6" name="DEP954" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="延时">
<Rect left="311" top="1392" right="411" bottom="1424"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="PEPS ESCL">
<Rect left="310" top="1449" right="410" bottom="1481"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="PEPS 匹配 ESCL"/>
<Script>#COMM 0x31 0x03 0xFF 0xF6
if(@0==0x71)then
if(@4==0x00) then
  engine.SetLineText(2,"匹配成功");
  engine.StatValue=@4;
  engine.LastError = 0;
#DELAY 1000
elseif (@4==0x01) then
  engine.LastError = 0;
  engine.SetLineText(2,"ESCL不在初始状态");
  engine.StatValue=@4;
  engine.StatPoint=0;
#DELAY 1000
elseif (@4==0x02) then
  engine.SetLineText(2,"ESCL在初始状态但反扫描激活");
  engine.LastError = 1;
  engine.StatValue=@4;
  engine.StatPoint=0;
#DELAY 1000
elseif (@4==0x03) then
  engine.SetLineText(2,"ESCL没有响应");
  engine.LastError = 1;
  engine.StatValue=@4;
  engine.StatPoint=0;
#DELAY 1000
elseif (@4==0x04) then
  engine.SetLineText(2,"ESCL初始化不合格");
  engine.LastError = 1;
  engine.StatValue=@4;
  engine.StatPoint=0;
#DELAY 1000
elseif (@4==0x07) then
  engine.SetLineText(2,"安全解除未通过");
  engine.LastError = 1;
  engine.StatValue=@4;
  engine.StatPoint=0;
#DELAY 1000
else
  engine.LastError = 1;
  engine.StatValue=@4;
  engine.StatPoint=0;
end
engine.SetLineText(3,@4);

else
     engine.LastError = 1;
     engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP1221" type="8" flags="99"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="延时">
<Rect left="311" top="1499" right="411" bottom="1531"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="匹配成功">
<Rect left="312" top="1553" right="412" bottom="1585"/>
<Line3Text Enable="1" Text="匹配成功"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="安全解除失败">
<Rect left="176" top="1239" right="276" bottom="1271"/>
<Line1Text Enable="1" Text="对不起"/>
<Line2Text Enable="1" Text="安全解除失败"/>
<Script></Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="安全解除">
<Rect left="312" top="1287" right="412" bottom="1319"/>
<Line1Text Enable="1" Text="安全解除"/>
<Script></Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="检测失败">
<Rect left="178" top="1450" right="278" bottom="1482"/>
<Line3Text Enable="1" Text="匹配失败"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="电子转向柱防盗">
<Rect left="311" top="81" right="411" bottom="113"/>
<TitleText Enable="1" Text="电子转向柱防盗"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="电子转向柱防盗">
<Rect left="310" top="180" right="410" bottom="212"/>
<Line1Text Enable="1" Text="电子转向柱防盗"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK？#R=BMPNOK");
   engine.LastError = 1;
else
end</Script></Activity>
<Activity id="37" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="184" right="136" bottom="216"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="连接ECU">
<Rect left="310" top="235" right="410" bottom="267"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="通讯">
<Rect left="311" top="279" right="411" bottom="311"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local StringRes;
#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
     StringRes = engine.GetResponseString(0,engine.GetResponseSize());
     engine.StatValue=hexstr(StringRes);
elseif(@0 == 0x7f) then
     engine.LastError = 1;
     engine.StatValue = "Negative response"     
else
     engine.LastError = 1;
     engine.StatValue = "Communication not connection"
end
</Script><assessment no="2" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="通讯失败">
<Rect left="178" top="279" right="278" bottom="311"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="结束通讯">
<Rect left="177" top="234" right="277" bottom="266"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="VIN码确认">
<Rect left="310" top="134" right="410" bottom="166"/>
<Line1Text Enable="1" Text="请核对车辆VIN码，正确吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(3,DString_Write_VIN);
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
</Script><assessment no="16" name="DEP2320" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="35" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="10" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="32" type="3">
</Transition>
<Transition StartId="20" EndId="31" type="4">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="3">
</Transition>
<Transition StartId="24" EndId="33" type="4">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="2" type="0">
</Transition>
<Transition StartId="31" EndId="2" type="0">
</Transition>
<Transition StartId="32" EndId="21" type="0">
</Transition>
<Transition StartId="33" EndId="2" type="0">
</Transition>
<Transition StartId="35" EndId="42" type="0">
</Transition>
<Transition StartId="36" EndId="38" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="4">
</Transition>
<Transition StartId="37" EndId="2" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="3" type="3">
</Transition>
<Transition StartId="39" EndId="40" type="4">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="40" EndId="37" type="5">
</Transition>
<Transition StartId="41" EndId="38" type="0">
</Transition>
<Transition StartId="42" EndId="36" type="0">
</Transition>
<Transition StartId="42" EndId="37" type="4">
</Transition>
</Transitions>
</Process>

