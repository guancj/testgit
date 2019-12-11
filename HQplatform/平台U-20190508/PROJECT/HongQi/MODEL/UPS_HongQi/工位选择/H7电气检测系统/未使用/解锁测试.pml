<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x4d8" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x6c3" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="125" right="225" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="377" top="1299" right="477" bottom="1331"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="请求随机数">
<Rect left="122" top="519" right="222" bottom="551"/>
<Line1Text Enable="1" Text="获取随机数"/>
<Script>#COMM 0x31 0x01 0xFF 0xFA</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="连接ECU">
<Rect left="123" top="121" right="223" bottom="153"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="随机数比对">
<Rect left="122" top="574" right="222" bottom="606"/>
<Line1Text Enable="1" Text="随机数比对"/>
<Script>#COMM 0x31 0x03 0xFF 0xFA

engine.println("PEPS Random code1:"..string.format("%02x%02x%02x",@4,@5,@6))
engine.println("PEPS Random code to INT:"..@6*256*256+@5*256+@4)

randm=string.char(@4,@5,@6)
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="读VIN">
<Rect left="123" top="632" right="223" bottom="664"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script></Activity>
<Activity id="9" ActivityType="13" flags="0" name="dll_1">
<Rect left="123" top="692" right="223" bottom="724"/>
<FunctionRef id="Secure_compute1">
<Parameters>
<Parameter id="strInCode" value="vin"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="SC">
<Rect left="123" top="747" right="223" bottom="779"/>
<Script>sc=hexstr(strOutCode)
sc1=hex2dec(sc,1)
sc2=hex2dec(sc,3)
sc3=hex2dec(sc,5)

sc_hex= string.char(sc1,sc2,sc3)
engine.println("sc_hex:"..sc_hex)
engine.println("SC code after caculate 10: " .. sc3*256*256+sc2*256+sc1);
engine.println("c131 immo string 2 hex str:"..string.format("%02x%02x%02x",sc3,sc2,sc1))</Script></Activity>
<Activity id="11" ActivityType="13" flags="0" name="dll_3">
<Rect left="122" top="799" right="222" bottom="831"/>
<FunctionRef id="Secure_compute3">
<Parameters>
<Parameter id="pucOutCode" value="randm"/>
<Parameter id="pucAuth" value="sc_hex"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="InCode">
<Rect left="122" top="852" right="222" bottom="884"/>
<Script>engine.println(ret)
incode1=bit32.rshift(ret,8)
incode2=bit32.band(ret,0xff)</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="发送SC和Incode">
<Rect left="121" top="910" right="221" bottom="942"/>
<Line1Text Enable="1" Text="发送SC Incode"/>
<Script>#COMM  0x31 0x01 0xff 0xfb incode1 incode2 sc1 sc2 sc3</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="解锁">
<Rect left="121" top="965" right="221" bottom="997"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="匹配遥控钥匙"/>
<Script>#COMM 0x31 0x03 0xff 0xfb

if (@4==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="检测失败">
<Rect left="377" top="965" right="477" bottom="997"/>
<Line2Text Enable="1" Text="解锁失败"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="是否清空信息">
<Rect left="122" top="1021" right="222" bottom="1053"/>
<Line1Text Enable="1" Text="清空 PEPS 钥匙信息"/>
<Line2Text Enable="1" Text="清空按确认，否则按放弃？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="清空">
<Rect top="1020" right="100" bottom="1052"/>
<Line1Text Enable="1" Text="清空PEPS信息"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xFF 0x3F
#DELAY 1000</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="清空">
<Rect left="1" top="1074" right="101" bottom="1106"/>
<Line1Text Enable="1" Text="清空PEPS信息"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x03 0xFF 0x3F</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="开始匹配">
<Rect left="122" top="1074" right="222" bottom="1106"/>
<Line1Text Enable="1" Text="开始匹配钥匙"/>
<Line2Text Enable="1" Text="第 1 把钥匙靠近防盗线圈"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送指令">
<Rect left="122" top="1129" right="222" bottom="1161"/>
<Strategy NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xFF 0x3F
#DELAY 5000</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="匹配遥控钥匙">
<Rect left="122" top="1185" right="222" bottom="1217"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="PEPS 安全解除"/>
<Script>#COMM 0x31 0x03 0xff 0x3f
DVciResult=@4
if (@4==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="匹配成功">
<Rect left="123" top="1244" right="223" bottom="1276"/>
<Line3Text Enable="1"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="匹配失败">
<Rect left="240" top="1185" right="340" bottom="1217"/>
<Line1Text Enable="1" Text="匹配失败！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="右键"/>
<Script>engine.TestResult = 1;
if(DVciResult==0x01)then
engine.SetLineText(1,"钥匙已经匹配过，请按 放弃")
engine.println("钥匙已经匹配过，请按 放弃")
elseif(DVciResult==0x02)then
engine.SetLineText(1,"SK写入到CID失败,重试吗？")
engine.println("SK写入到CID失败,重试吗？")
elseif(DVciResult==0x03)then
engine.SetLineText(1,"PKE 通讯失败，重试吗？")
engine.println("PKE 通讯失败，重试吗？")
elseif(DVciResult==0x04)then
engine.SetLineText(1,"读IDE失败，重试吗？")
engine.println("读IDE失败，重试吗？")
elseif(DVciResult==0x07)then
engine.SetLineText(1,"安全解除未通过！")
engine.println("安全解除未通过！")
end
#PRESSBUTTON</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="清除所有行和标题">
<Rect left="123" top="1299" right="223" bottom="1331"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="匹配第一把钥匙">
<Rect left="124" top="62" right="224" bottom="94"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Line1Text Enable="1" Text="匹配 第 1 把 钥匙"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="123" top="179" right="223" bottom="211"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5</Script></Activity>
<Activity id="27" ActivityType="13" flags="0" name="计算">
<Rect left="122" top="236" right="222" bottom="268"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA0BDDFA0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="发送key">
<Rect left="122" top="290" right="222" bottom="322"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="检测失败">
<Rect left="378" top="291" right="478" bottom="323"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="读VIN">
<Rect left="123" top="349" right="223" bottom="381"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="发送VIN">
<Rect left="123" top="405" right="223" bottom="437"/>
<Line1Text Enable="1" Text="写VIN"/>
<Script>vin=DString_Write_VIN;
#COMM 0x2E 0xF1 0x90  string.byte(vin,1) string.byte(vin,2) string.byte(vin,3) string.byte(vin,4) string.byte(vin,5) string.byte(vin,6) string.byte(vin,7) string.byte(vin,8) string.byte(vin,9) string.byte(vin,10) string.byte(vin,11) string.byte(vin,12) string.byte(vin,13) string.byte(vin,14) string.byte(vin,15) string.byte(vin,16) string.byte(vin,17)</Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="读VIN">
<Rect left="122" top="462" right="222" bottom="494"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="25" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="26" type="0">
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
<Transition StartId="14" EndId="16" type="3">
</Transition>
<Transition StartId="15" EndId="2" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="6">
</Transition>
<Transition StartId="16" EndId="19" type="5">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="6">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="21" EndId="23" type="4">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="2" type="0">
</Transition>
<Transition StartId="25" EndId="4" type="0">
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
</Transitions>
</Process>

