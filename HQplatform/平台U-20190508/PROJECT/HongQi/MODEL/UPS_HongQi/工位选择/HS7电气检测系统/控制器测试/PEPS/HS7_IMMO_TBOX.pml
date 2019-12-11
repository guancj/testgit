<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3038" pbltext="DEP2108">
<Parameters>
<Variable id="peps_key_all" type="8" dir="0" data="peps_key_all"/>
<Variable id="incode1" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="incode2" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="sc1" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="sc2" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="sc3" type="8" dir="0" data="&quot;&quot;"/>
</Parameters>
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="690" top="64" right="790" bottom="96"/>
<Script>DString_Write_VIN = engine.VIN</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="690" top="1674" right="790" bottom="1706"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="TBOX防盗">
<Rect left="690" top="124" right="790" bottom="156"/>
<TitleText Enable="1" Text="TBOX防盗"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="690" top="364" right="790" bottom="396"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
if(@0==0x67)then
     engine.LastError=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="发送key">
<Rect left="690" top="484" right="790" bottom="516"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if(@0==0x67)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="计算key">
<Rect left="690" top="424" right="790" bottom="456"/>
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
<Rect left="690" top="304" right="790" bottom="336"/>
<Line1Text Enable="1" Text="切诊断"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="读VIN">
<Rect left="690" top="544" right="790" bottom="576"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90 


</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="请求随机数">
<Rect left="690" top="704" right="790" bottom="736"/>
<Line1Text Enable="1" Text="获取随机数"/>
<Script>#COMM 0x31 0x01 0xFF 0xFA</Script><assessment no="8" name="DEP169" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="随机数结果">
<Rect left="690" top="764" right="790" bottom="796"/>
<Line1Text Enable="1" Text="随机数比对"/>
<Script>#COMM 0x31 0x03 0xFF 0xFA
engine.println("PEPS Random code1:"..string.format("%02x%02x%02x",@4,@5,@6))
engine.println("PEPS Random code to INT:"..@6*256*256+@5*256+@4)

randm=string.char(@4,@5,@6)
</Script><assessment no="9" name="DEP170" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="读VIN">
<Rect left="690" top="654" right="790" bottom="686"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script><assessment no="7" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="dll_1">
<Rect left="690" top="934" right="790" bottom="966"/>
<FunctionRef id="Secure_compute1">
<Parameters>
<Parameter id="strInCode" value="vin"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="SC">
<Rect left="690" top="994" right="790" bottom="1026"/>
<Line1Text Enable="1"/>
<Script>s1 = strOutCode:byte(1)
s2 = strOutCode:byte(2)
s3 = strOutCode:byte(3)
print(string.format("%02x%02x%02x",s1,s2,s3))


</Script></Activity>
<Activity id="16" ActivityType="13" flags="0" name="dll_3">
<Rect left="690" top="1054" right="790" bottom="1086"/>
<FunctionRef id="Secure_compute3">
<Parameters>
<Parameter id="pucOutCode" value="randm"/>
<Parameter id="pucAuth" value="strOutCode"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="写VIN">
<Rect left="690" top="604" right="790" bottom="636"/>
<Script>#COMM 0x2E 0xF1 0x90 DString_Write_VIN</Script><assessment no="6" name="DEP168" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="读VIN">
<Rect left="690" top="824" right="790" bottom="856"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90

vin=string.char(@15,@16,@17,@18,@19)
engine.println("Last 5 VIN for caculate:"..vin)</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="显示随机数和VIN">
<Rect left="690" top="884" right="790" bottom="916"/>
<Script>engine.SetLineText(0,"PEPS 随机数");
engine.SetLineText(1,""..hexstr(randm));
engine.SetLineText(2,"车辆VIN码");
engine.SetLineText(3,""..vin);
#DELAY 2000

</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="InCode">
<Rect left="690" top="1114" right="790" bottom="1146"/>
<Script>engine.println(ret)
incode1=bit32.rshift(ret,8)
incode2=bit32.band(ret,0xff)</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="发送SC和Incode">
<Rect left="690" top="1164" right="790" bottom="1196"/>
<Line1Text Enable="1" Text="发送SC Incode"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.println("incode1:"..incode1.."incode2:"..incode1.."sc1:"..sc1.."sc2:"..sc2.."sc3:"..sc3);
#COMM 0x31 0x01 0xff 0xfb incode1 incode2 sc1 sc2 sc3
if(@0==0x71)then
     engine.LastError=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP1230" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="解锁">
<Rect left="690" top="1224" right="790" bottom="1256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x03 0xff 0xfb
if(@0==0x71)then
if(@4==0x00) then
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
<Activity id="23" ActivityType="3" flags="0" name="安全解除失败">
<Rect left="570" top="1224" right="670" bottom="1256"/>
<Line1Text Enable="1" Text="对不起"/>
<Line2Text Enable="1" Text="安全解除失败"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="安全解除">
<Rect left="690" top="1274" right="790" bottom="1306"/>
<Line1Text Enable="1" Text="安全解除"/>
<Line2Text Enable="1"/>
<Script></Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="发送">
<Rect left="690" top="1324" right="790" bottom="1356"/>
<Script>#COMM 0x31 0x01 0xff 0xfc
</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时">
<Rect left="690" top="1374" right="790" bottom="1406"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="GET key from peps">
<Rect left="690" top="1424" right="790" bottom="1456"/>
<Script>#COMM 0x31 0x03 0xff 0xfc
peps_SK1 = @4
peps_SK2 = @5
peps_SK3 = @6
peps_SK4 = @7
peps_SK5 = @8
peps_SK6 = @9

</Script><assessment no="11" name="DEP2109" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="连接TBOX">
<Rect left="690" top="1544" right="790" bottom="1576"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="结束通讯">
<Rect left="690" top="1484" right="790" bottom="1516"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="454" top="1484" right="486" bottom="1516"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="连接ECU">
<Rect left="690" top="184" right="790" bottom="216"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="通讯">
<Rect left="690" top="244" right="790" bottom="276"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="通讯失败">
<Rect left="420" top="244" right="520" bottom="276"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#STOPCOMM
#PRESSBUTTON</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="结束通讯">
<Rect left="420" top="184" right="520" bottom="216"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="5" flags="0" name="HS7_IMMO_Comm_TBOX">
<Rect left="690" top="1604" right="790" bottom="1636"/>
<SubProcesses>
<SubProcess id="HS7_IMMO_Comm_TBOX">
<Parameters>
<Parameter id="S1" value="sc1"/>
<Parameter id="S2" value="sc2"/>
<Parameter id="S3" value="sc3"/>
<Parameter id="peps_key_all" value="peps_key_all"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="62" type="0">
</Transition>
<Transition StartId="4" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="7" type="0">
</Transition>
<Transition StartId="9" EndId="4" type="0">
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
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="29" type="0">
</Transition>
<Transition StartId="28" EndId="74" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="0">
</Transition>
<Transition StartId="61" EndId="29" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="4">
</Transition>
<Transition StartId="63" EndId="9" type="3">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="64" EndId="61" type="5">
</Transition>
<Transition StartId="65" EndId="62" type="0">
</Transition>
<Transition StartId="74" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

