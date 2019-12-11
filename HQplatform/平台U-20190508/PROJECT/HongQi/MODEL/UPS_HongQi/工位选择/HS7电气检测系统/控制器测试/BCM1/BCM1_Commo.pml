<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3027" pbltext="DEP41">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="BCM1_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="470" top="54" right="570" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="350" top="674" right="450" bottom="706"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="470" top="104" right="570" bottom="136"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="470" top="154" right="570" bottom="186"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="470" top="314" right="570" bottom="346"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="102" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="470" top="364" right="570" bottom="396"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="103" name="DEP44" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="发送key">
<Rect left="470" top="464" right="570" bottom="496"/>
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
engine.StatValue=hexstr(StringRes);
</Script><assessment no="104" name="DEP45" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="470" top="414" right="570" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="通讯">
<Rect left="470" top="204" right="570" bottom="236"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.StatValue="通讯失败"
end
</Script><assessment no="100" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="通讯失败">
<Rect left="350" top="204" right="450" bottom="236"/>
<Line1Text Enable="1" Text="BCM1 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="209" ActivityType="3" flags="0" name="结束通讯">
<Rect left="350" top="154" right="450" bottom="186"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="比对零件号">
<Rect left="600" top="464" right="700" bottom="496"/>
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
        engine.println("读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        
        
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="105" name="DEP249" type="8" flags="97"/>
</Activity>
<Activity id="222" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="750" top="464" right="850" bottom="496"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="04.11#04_HS7";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("GW读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="106" name="DEP253" type="8" flags="97"/>
</Activity>
<Activity id="223" ActivityType="3" flags="0" name="延时50MS">
<Rect left="750" top="514" right="850" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="发送VIN">
<Rect left="880" top="464" right="980" bottom="496"/>
<Line1Text Enable="1"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="107" name="DEP254" type="8" flags="97"/>
</Activity>
<Activity id="226" ActivityType="3" flags="0" name="读VIN">
<Rect left="880" top="524" right="980" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
end</Script><assessment no="108" name="DEP255" type="8" flags="97"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="日期读取">
<Rect left="1010" top="524" right="1110" bottom="556"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="110" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="228" ActivityType="3" flags="0" name="发送时间">
<Rect left="1010" top="464" right="1110" bottom="496"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="109" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="229" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1140" top="524" right="1240" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="232" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1380" top="464" right="1480" bottom="496"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_VariCoding)) then
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
end
</Script><assessment no="113" name="DEP258" type="8" flags="97"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="写配置码">
<Rect left="1140" top="464" right="1240" bottom="496"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0x01 0x00 VariCoding

if(engine.LastError == 0 ) then 
engine.StatValue=DString_VariCoding;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end </Script><assessment no="111" name="DEP257" type="8" flags="97"/>
</Activity>
<Activity id="234" ActivityType="4" flags="0" name="路由节点">
<Rect left="1414" top="674" right="1446" bottom="706"/>
</Activity>
<Activity id="235" ActivityType="3" flags="0" name="清DTC">
<Rect left="470" top="264" right="570" bottom="296"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="101" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1260" top="524" right="1360" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1260" top="584" right="1360" bottom="616"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x11 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="238" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1260" top="644" right="1360" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="239" ActivityType="3" flags="0" name="清DTC">
<Rect left="1260" top="464" right="1360" bottom="496"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="112" name="DEP43" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="128" type="0">
</Transition>
<Transition StartId="7" EndId="124" type="0">
</Transition>
<Transition StartId="7" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="126" type="0">
</Transition>
<Transition StartId="125" EndId="210" type="0">
</Transition>
<Transition StartId="126" EndId="125" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="4">
</Transition>
<Transition StartId="128" EndId="235" type="0">
</Transition>
<Transition StartId="129" EndId="209" type="0">
</Transition>
<Transition StartId="129" EndId="2" type="5">
</Transition>
<Transition StartId="209" EndId="6" type="0">
</Transition>
<Transition StartId="210" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="223" type="0">
</Transition>
<Transition StartId="223" EndId="224" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="223" EndId="2" type="0">
</Transition>
<Transition StartId="224" EndId="226" type="0">
</Transition>
<Transition StartId="226" EndId="228" type="0">
</Transition>
<Transition StartId="227" EndId="233" type="0">
</Transition>
<Transition StartId="228" EndId="227" type="0">
</Transition>
<Transition StartId="229" EndId="239" type="0">
</Transition>
<Transition StartId="232" EndId="234" type="0">
</Transition>
<Transition StartId="233" EndId="229" type="0">
</Transition>
<Transition StartId="234" EndId="2" type="0">
</Transition>
<Transition StartId="235" EndId="7" type="0">
</Transition>
<Transition StartId="236" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="232" type="0">
</Transition>
<Transition StartId="239" EndId="236" type="0">
</Transition>
</Transitions>
</Process>

