<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1023" pbltext="DEP888">
<Parameters>
<Variable id="read_value1" type="3" dir="0" data="read_value1"/>
<Variable id="read_value2" type="3" dir="0" data="read_value2"/>
<Variable id="read_value3" type="3" dir="0" data="read_value3"/>
<Variable id="read_value4" type="3" dir="0" data="read_value4"/>
<Variable id="read_value5" type="3" dir="0" data="read_value5"/>
<Variable id="read_value6" type="3" dir="0" data="read_value6"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Rect left="379" top="66" right="479" bottom="98"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="2396" right="480" bottom="2428"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="发动机防盗">
<Rect left="379" top="131" right="479" bottom="163"/>
<TitleText Enable="1" Text="发动机防盗"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="378" top="408" right="478" bottom="440"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
if(@0==0x67) then
  engine.LastError = 0;
else
  engine.TestResult = 1; 
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="发送key">
<Rect left="378" top="531" right="478" bottom="563"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.TestResult = 1; 
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="计算key">
<Rect left="377" top="469" right="477" bottom="501"/>
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
<Activity id="9" ActivityType="3" flags="0" name="切诊断">
<Rect left="378" top="349" right="478" bottom="381"/>
<Line1Text Enable="1" Text="切诊断"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP1229" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="读VIN">
<Rect left="379" top="591" right="479" bottom="623"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90 


</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="请求随机数">
<Rect left="378" top="780" right="478" bottom="812"/>
<Line1Text Enable="1" Text="获取随机数"/>
<Script>--#COMM 0x31 0x01 0xFF 0x3F
#COMM 0x31 0x01 0xFF 0xFA</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="随机数检查">
<Rect left="377" top="839" right="477" bottom="871"/>
<Line1Text Enable="1" Text="随机数比对"/>
<Script>--#COMM 0x31 0x03 0xFF 0x3F
#COMM 0x31 0x03 0xFF 0xFA
engine.println("PEPS Random code1:"..string.format("%02x%02x%02x",@4,@5,@6))
engine.println("PEPS Random code to INT:"..@6*256*256+@5*256+@4)

randm=string.char(@4,@5,@6)
</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="读VIN">
<Rect left="378" top="718" right="478" bottom="750"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script></Activity>
<Activity id="14" ActivityType="13" flags="0" name="dll_1">
<Rect left="376" top="1013" right="476" bottom="1045"/>
<FunctionRef id="Secure_compute1">
<Parameters>
<Parameter id="strInCode" value="vin"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="SC">
<Rect left="375" top="1071" right="475" bottom="1103"/>
<Line1Text Enable="1"/>
<Script>sc=hexstr(strOutCode)
sc1=hex2dec(sc,1)
sc2=hex2dec(sc,3)
sc3=hex2dec(sc,5)

sc_hex= string.char(sc1,sc2,sc3)
engine.println("sc_hex:"..sc_hex)
engine.println("SC code after caculate 10: " .. sc3*256*256+sc2*256+sc1);
engine.println("c131 immo string 2 hex str:"..string.format("%02x%02x%02x",sc3,sc2,sc1))</Script></Activity>
<Activity id="16" ActivityType="13" flags="0" name="dll_3">
<Rect left="376" top="1127" right="476" bottom="1159"/>
<FunctionRef id="Secure_compute3">
<Parameters>
<Parameter id="pucOutCode" value="randm"/>
<Parameter id="pucAuth" value="sc_hex"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="写VIN">
<Rect left="378" top="655" right="478" bottom="687"/>
<Script>vin=DString_Write_VIN
#COMM 0x2E 0xF1 0x90 string.byte(vin,1) string.byte(vin,2) string.byte(vin,3) string.byte(vin,4) string.byte(vin,5) string.byte(vin,6) string.byte(vin,7) string.byte(vin,8) string.byte(vin,9) string.byte(vin,10) string.byte(vin,11) string.byte(vin,12) string.byte(vin,13) string.byte(vin,14) string.byte(vin,15) string.byte(vin,16) string.byte(vin,17)</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="读VIN">
<Rect left="377" top="901" right="477" bottom="933"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="显示随机数和VIN">
<Rect left="377" top="954" right="477" bottom="986"/>
<Script>engine.SetLineText(0,"PEPS 随机数");
engine.SetLineText(1,""..randm);
engine.SetLineText(2,"车辆VIN码");
engine.SetLineText(3,""..vin);
#DELAY 2000

</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="InCode">
<Rect left="377" top="1180" right="477" bottom="1212"/>
<Script>engine.println(ret)
incode1=bit32.rshift(ret,8)
incode2=bit32.band(ret,0xff)</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="发送SC和Incode">
<Rect left="376" top="1242" right="476" bottom="1274"/>
<Line1Text Enable="1" Text="发送SC Incode"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x31 0x01 0xff 0xfb incode1 incode2 sc1 sc2 sc3
if(@0==0x71)then
     engine.LastError=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP1230" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="解锁">
<Rect left="377" top="1294" right="477" bottom="1326"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x03 0xff 0xfb
if(@0==0x71)then
if (@4==0x00) then
  engine.LastError = 0;
else
  engine.TestResult = 1; 
  engine.LastError = 1;
end
engine.StatValue=@4;
engine.StatPoint=0;

else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP1231" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="安全解除失败">
<Rect left="230" top="1291" right="330" bottom="1323"/>
<Line1Text Enable="1" Text="对不起"/>
<Line2Text Enable="1" Text="安全解除失败"/>
<Script></Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="安全解除">
<Rect left="378" top="1343" right="478" bottom="1375"/>
<Line1Text Enable="1" Text="安全解除"/>
<Line2Text Enable="1"/>
<Script></Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="发送">
<Rect left="378" top="1400" right="478" bottom="1432"/>
<Script>#COMM 0x31 0x01 0xff 0xfc
--#COMM 0x31 0x01 0xff 0xf6</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时">
<Rect left="377" top="1457" right="477" bottom="1489"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="GET key from peps">
<Rect left="377" top="1513" right="477" bottom="1545"/>
<Script>#COMM 0x31 0x03 0xff 0xfc
--#COMM 0x31 0x03 0xff 0xf6
peps_key_value1 = @4
peps_key_value2 = @5
peps_key_value3 = @6
peps_key_value4 = @7
peps_key_value5 = @8
peps_key_value6 = @9
peps_key_all=hexstr(@4-@9)
</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="连接HCU">
<Rect left="377" top="1628" right="477" bottom="1660"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="结束通讯">
<Rect left="377" top="1572" right="477" bottom="1604"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="连接ECU">
<Rect left="377" top="1858" right="477" bottom="1890"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="34" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="377" top="1973" right="477" bottom="2005"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5</Script><assessment no="15" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="发送key">
<Rect left="378" top="2078" right="478" bottom="2110"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script><assessment no="16" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="13" flags="0" name="计算key">
<Rect left="377" top="2025" right="477" bottom="2057"/>
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
<Activity id="37" ActivityType="3" flags="0" name="切诊断">
<Rect left="377" top="1918" right="477" bottom="1950"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="PEPS匹配EMS">
<Rect left="378" top="2253" right="478" bottom="2285"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="PEPS 匹配 HCU"/>
<Script>#COMM 0x31 0x03 0xff 0xFD
if(@0==0x71)then

if (@4==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.StatValue=@4;
engine.StatPoint=0;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP953" type="8" flags="99"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="结束通讯">
<Rect left="379" top="2306" right="479" bottom="2338"/>
<Line3Text Enable="1" Text="匹配成功"/>
<Script>#DELAY 1000
</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="匹配失败确认">
<Rect left="505" top="2253" right="605" bottom="2285"/>
<Line1Text Enable="1" Text="发动机防盗匹配失败"/>
<Line2Text Enable="1" Text="重试吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="242" right="566" bottom="274"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="HCU BACK TO PEPS">
<Rect left="378" top="2138" right="478" bottom="2170"/>
<Script>engine.println("EMS_read_all"..EMS_read_all);
read_value1 = hex2dec(EMS_read_all,1); 
read_value2 = hex2dec(EMS_read_all,3);
read_value3 = hex2dec(EMS_read_all,5);
read_value4 = hex2dec(EMS_read_all,7);
read_value5 = hex2dec(EMS_read_all,9);
read_value6 = hex2dec(EMS_read_all,11);
#COMM 0x31 0x01 0xFF 0xFD read_value1 read_value2 read_value3 read_value4 read_value5 read_value6</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="延时">
<Rect left="379" top="2194" right="479" bottom="2226"/>
<Script>#DELAY 700</Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="普通节点">
<Rect left="376" top="1681" right="476" bottom="1713"/>
<Line1Text Enable="1" Text="连接HCU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="普通节点">
<Rect left="377" top="1802" right="477" bottom="1834"/>
<Line1Text Enable="1" Text="连接PEPS"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 500
engine.println("EMS_read_all"..EMS_read_all);
</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="发动机防盗">
<Rect left="378" top="184" right="478" bottom="216"/>
<Line1Text Enable="1" Text="混动控制器防盗"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
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
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="125" top="183" right="157" bottom="215"/>
</Activity>
<Activity id="62" ActivityType="5" flags="0" name="IMMO_HCU_Comm_HCU">
<Rect left="377" top="1745" right="477" bottom="1777"/>
<SubProcesses>
<SubProcess id="IMMO_HCU_Comm_HCU">
<Parameters>
<Parameter id="peps_key_all" value="peps_key_all"/>
<Parameter id="compare_sucess_flag"/>
<Parameter id="HCU_read_all" ret="EMS_read_all"/>
<Parameter id="CommErr" value="0" ret="CommErr"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="连接ECU">
<Rect left="379" top="243" right="479" bottom="275"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="通讯">
<Rect left="378" top="298" right="478" bottom="330"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="通讯失败">
<Rect left="250" top="297" right="350" bottom="329"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="结束通讯">
<Rect left="251" top="244" right="351" bottom="276"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="263" top="2396" right="295" bottom="2428"/>
</Activity>
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="124" top="2395" right="156" bottom="2427"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="普通节点">
<Rect left="230" top="1745" right="330" bottom="1777"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="4" name="DEP859" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="60" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="7" type="0">
</Transition>
<Transition StartId="9" EndId="6" type="0">
</Transition>
<Transition StartId="10" EndId="17" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="18" type="0">
</Transition>
<Transition StartId="13" EndId="11" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="20" type="0">
</Transition>
<Transition StartId="17" EndId="13" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="14" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="4">
</Transition>
<Transition StartId="22" EndId="24" type="3">
</Transition>
<Transition StartId="23" EndId="70" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="29" type="0">
</Transition>
<Transition StartId="28" EndId="57" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="0">
</Transition>
<Transition StartId="33" EndId="37" type="0">
</Transition>
<Transition StartId="34" EndId="36" type="0">
</Transition>
<Transition StartId="35" EndId="55" type="0">
</Transition>
<Transition StartId="36" EndId="35" type="0">
</Transition>
<Transition StartId="37" EndId="34" type="0">
</Transition>
<Transition StartId="40" EndId="42" type="3">
</Transition>
<Transition StartId="40" EndId="48" type="4">
</Transition>
<Transition StartId="42" EndId="2" type="0">
</Transition>
<Transition StartId="48" EndId="2" type="5">
</Transition>
<Transition StartId="48" EndId="51" type="6">
</Transition>
<Transition StartId="51" EndId="64" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="40" type="0">
</Transition>
<Transition StartId="57" EndId="62" type="0">
</Transition>
<Transition StartId="59" EndId="33" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="4">
</Transition>
<Transition StartId="60" EndId="64" type="0">
</Transition>
<Transition StartId="61" EndId="69" type="0">
</Transition>
<Transition StartId="62" EndId="59" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="62" EndId="70" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="4">
</Transition>
<Transition StartId="65" EndId="9" type="3">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="66" EndId="61" type="5">
</Transition>
<Transition StartId="67" EndId="64" type="0">
</Transition>
<Transition StartId="68" EndId="2" type="0">
</Transition>
<Transition StartId="69" EndId="68" type="0">
</Transition>
<Transition StartId="70" EndId="68" type="0">
</Transition>
</Transitions>
</Process>

