<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3030" pbltext="DEP211">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="PLGM_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x76C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="640" top="74" right="740" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="744" right="580" bottom="776"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电动尾门">
<Rect left="640" top="134" right="740" bottom="166"/>
<TitleText Enable="1" Text="电动尾门控制器（PLGM）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="910" top="774" right="1010" bottom="806"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP201" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="640" top="184" right="740" bottom="216"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="640" top="324" right="740" bottom="356"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1100" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="640" top="374" right="740" bottom="406"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
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
</Script><assessment no="4" name="DEP203" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="发送key">
<Rect left="640" top="474" right="740" bottom="506"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="5" name="DEP204" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="640" top="424" right="740" bottom="456"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xC2F1F1E4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="通讯">
<Rect left="640" top="234" right="740" bottom="266"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.StatValue="通讯失败"
end
</Script><assessment no="1" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="通讯失败">
<Rect left="480" top="234" right="580" bottom="266"/>
<Line1Text Enable="1" Text="PLGM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="结束通讯">
<Rect left="480" top="184" right="580" bottom="216"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="比对零件号">
<Rect left="770" top="474" right="870" bottom="506"/>
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
        engine.println("GW读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP387" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="910" top="474" right="1010" bottom="506"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--SoftwareNumber ="SW04";
SoftwareNumber ="0005";
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP391" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="延时50MS">
<Rect left="910" top="524" right="1010" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1040" top="474" right="1140" bottom="506"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP392" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1040" top="524" right="1140" bottom="556"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读到VIN值:"..DString1);
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
end</Script><assessment no="12" name="DEP393" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="日期读取">
<Rect left="1170" top="524" right="1270" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="发送时间">
<Rect left="1170" top="474" right="1270" bottom="506"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="写配置码">
<Rect left="1310" top="474" right="1410" bottom="506"/>
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
end </Script><assessment no="13" name="DEP394" type="8" flags="97"/>
</Activity>
<Activity id="202" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1590" top="664" right="1690" bottom="696"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x00
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
end</Script><assessment no="14" name="DEP395" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1310" top="534" right="1410" bottom="566"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="205" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1450" top="474" right="1550" bottom="506"/>
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
<Activity id="217" ActivityType="3" flags="0" name="延时3000ms">
<Rect left="1450" top="534" right="1550" bottom="566"/>
<Line1Text Enable="1" Text="重启等待3秒"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1474" top="744" right="1506" bottom="776"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1590" top="534" right="1690" bottom="566"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="220" ActivityType="3" flags="0" name="通讯">
<Rect left="1590" top="604" right="1690" bottom="636"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.StatValue="通讯失败"
end
</Script><assessment no="17" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1710" top="604" right="1810" bottom="636"/>
<Line1Text Enable="1" Text="PLGM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="222" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1710" top="534" right="1810" bottom="566"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="223" ActivityType="3" flags="0" name="普通节点">
<Rect left="1760" top="274" right="1860" bottom="306"/>
<Script></Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1590" top="474" right="1690" bottom="506"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="清DTC">
<Rect left="790" top="284" right="890" bottom="316"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP201" type="8" flags="97"/>
</Activity>
<Activity id="226" ActivityType="3" flags="0" name="清DTC">
<Rect left="1310" top="604" right="1410" bottom="636"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP201" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="2" type="0">
</Transition>
<Transition StartId="5" EndId="16" type="0">
</Transition>
<Transition StartId="6" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="180" type="0">
</Transition>
<Transition StartId="14" EndId="13" type="0">
</Transition>
<Transition StartId="16" EndId="114" type="4">
</Transition>
<Transition StartId="16" EndId="225" type="0">
</Transition>
<Transition StartId="114" EndId="179" type="0">
</Transition>
<Transition StartId="114" EndId="2" type="5">
</Transition>
<Transition StartId="179" EndId="5" type="0">
</Transition>
<Transition StartId="180" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="195" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="194" EndId="2" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="197" EndId="199" type="0">
</Transition>
<Transition StartId="198" EndId="197" type="0">
</Transition>
<Transition StartId="199" EndId="203" type="0">
</Transition>
<Transition StartId="202" EndId="218" type="0">
</Transition>
<Transition StartId="203" EndId="226" type="0">
</Transition>
<Transition StartId="205" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="224" type="0">
</Transition>
<Transition StartId="218" EndId="2" type="0">
</Transition>
<Transition StartId="219" EndId="220" type="0">
</Transition>
<Transition StartId="220" EndId="221" type="4">
</Transition>
<Transition StartId="220" EndId="202" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="219" type="0">
</Transition>
<Transition StartId="224" EndId="219" type="0">
</Transition>
<Transition StartId="225" EndId="6" type="0">
</Transition>
<Transition StartId="226" EndId="202" type="0">
</Transition>
</Transitions>
</Process>

