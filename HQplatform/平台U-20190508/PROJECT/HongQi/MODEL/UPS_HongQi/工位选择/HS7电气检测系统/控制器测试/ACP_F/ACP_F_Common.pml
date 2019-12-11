<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3031" pbltext="DEP1743">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x742" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74A" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="44" right="530" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="110" top="764" right="210" bottom="796"/>
<Script>#STOPCOMM
</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="前中控开关(ACP_F)">
<Rect left="430" top="104" right="530" bottom="136"/>
<TitleText Enable="1" Text="前中控开关(ACP_F)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="430" top="164" right="530" bottom="196"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT

engine.Delay(200)</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="430" top="344" right="530" bottom="376"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1745" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="430" top="464" right="530" bottom="496"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1746" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="13" flags="0" name="计算">
<Rect left="430" top="524" right="530" bottom="556"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x85A857B9"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送key">
<Rect left="430" top="584" right="530" bottom="616"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1747" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="通讯">
<Rect left="430" top="224" right="530" bottom="256"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.StatValue="通讯失败"
end
</Script><assessment no="1" name="DEP1744" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="通讯失败">
<Rect left="110" top="224" right="210" bottom="256"/>
<Line1Text Enable="1" Text="ACP_F 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="结束通讯">
<Rect left="110" top="164" right="210" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="比对零件号">
<Rect left="590" top="584" right="690" bottom="616"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,"目标值："..DString_Partnumber);
engine.println("零件号标准值:"..DString_Partnumber);
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Partnumber)));
        engine.println("ACP-F读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP1748" type="8" flags="97"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="590" top="584" right="690" bottom="616"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="V1.00.03_190615";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("ACP-F读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1752" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时50MS">
<Rect left="590" top="644" right="690" bottom="676"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="发送VIN">
<Rect left="750" top="584" right="850" bottom="616"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP1753" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="750" top="644" right="850" bottom="676"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
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
end</Script><assessment no="12" name="DEP1754" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="910" top="644" right="1010" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="发送时间">
<Rect left="910" top="584" right="1010" bottom="616"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="399" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="764" right="1136" bottom="796"/>
</Activity>
<Activity id="400" ActivityType="3" flags="0" name="清DTC">
<Rect left="430" top="284" right="530" bottom="316"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1757" type="8" flags="97"/>
</Activity>
<Activity id="401" ActivityType="3" flags="0" name="写配置码">
<Rect left="1070" top="584" right="1170" bottom="616"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0xF1 0xA1 VariCoding

if(engine.LastError == 0 ) then 
engine.StatValue=DString_VariCoding;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end </Script><assessment no="13" name="DEP1755" type="8" flags="97"/>
</Activity>
<Activity id="402" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1230" top="584" right="1330" bottom="616"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (DString_Read_Config_Code_From_ECU == DString_VariCoding) then
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
	engine.StatPoint=DString_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP1756" type="8" flags="97"/>
</Activity>
<Activity id="403" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1070" top="644" right="1170" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="404" ActivityType="3" flags="0" name="清DTC">
<Rect left="590" top="764" right="690" bottom="796"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1757" type="8" flags="97"/>
</Activity>
<Activity id="405" ActivityType="3" flags="0" name="循环请求Seed为安全访问">
<Rect left="270" top="584" right="370" bottom="616"/>
<Script>times=times+1;</Script></Activity>
<Activity id="406" ActivityType="3" flags="0" name="变量声明">
<Rect left="430" top="404" right="530" bottom="436"/>
<Script>times=0;</Script></Activity>
<Activity id="408" ActivityType="3" flags="0" name="延时5000MS">
<Rect left="270" top="464" right="370" bottom="496"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  5000</Script></Activity>
<Activity id="409" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="644" right="496" bottom="676"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="37" type="0">
</Transition>
<Transition StartId="7" EndId="406" type="0">
</Transition>
<Transition StartId="8" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="92" type="0">
</Transition>
<Transition StartId="36" EndId="405" type="4">
</Transition>
<Transition StartId="37" EndId="40" type="4">
</Transition>
<Transition StartId="37" EndId="400" type="0">
</Transition>
<Transition StartId="40" EndId="43" type="0">
</Transition>
<Transition StartId="40" EndId="2" type="5">
</Transition>
<Transition StartId="43" EndId="6" type="0">
</Transition>
<Transition StartId="92" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="105" EndId="399" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="109" type="0">
</Transition>
<Transition StartId="108" EndId="401" type="0">
</Transition>
<Transition StartId="109" EndId="108" type="0">
</Transition>
<Transition StartId="399" EndId="404" type="0">
</Transition>
<Transition StartId="400" EndId="7" type="0">
</Transition>
<Transition StartId="401" EndId="403" type="0">
</Transition>
<Transition StartId="402" EndId="399" type="0">
</Transition>
<Transition StartId="403" EndId="402" type="0">
</Transition>
<Transition StartId="404" EndId="2" type="0">
</Transition>
<Transition StartId="405" EndId="408" type="0">
</Transition>
<Transition StartId="405" EndId="409" type="1">
<Expression>times &gt;= 2 </Expression></Transition>
<Transition StartId="406" EndId="8" type="0">
</Transition>
<Transition StartId="408" EndId="8" type="0">
</Transition>
<Transition StartId="409" EndId="92" type="0">
</Transition>
</Transitions>
</Process>

