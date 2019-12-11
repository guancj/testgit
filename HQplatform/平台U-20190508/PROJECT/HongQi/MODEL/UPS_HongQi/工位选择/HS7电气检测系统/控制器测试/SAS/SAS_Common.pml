<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3008" pbltext="DEP79">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="SAS_partnumber"/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="HS7_SAS_VIN_Execute_Flag" type="11" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect top="2" right="100" bottom="34"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="120" top="914" right="220" bottom="946"/>
<Script>#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="转角传感器(SAS)">
<Rect left="121" top="2" right="221" bottom="34"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="120" top="63" right="220" bottom="95"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="120" top="244" right="220" bottom="276"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1089" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="120" top="304" right="220" bottom="336"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP83" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="13" flags="0" name="计算">
<Rect left="120" top="364" right="220" bottom="396"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x6C8A9B7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送key">
<Rect left="120" top="424" right="220" bottom="456"/>
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

engine.Delay(150)</Script><assessment no="5" name="DEP84" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="通讯">
<Rect left="120" top="123" right="220" bottom="155"/>
<Script>#COMM 0x10 0x03

if(@0 == 0x50)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="123" right="370" bottom="155"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="结束通讯">
<Rect left="270" top="63" right="370" bottom="95"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="比对零件号">
<Rect left="120" top="484" right="220" bottom="516"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(3000)
#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_Partnumber);
engine.println("零件号标准值:"..DString_Partnumber);
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Partnumber)));
        engine.println("SAS读取零件号:"..num)
	if(DString_Partnumber ~= num)then
		engine.LastError = 1;
	end 
        engine.StatValue =num
        engine.StatPoint = DString_Partnumber;
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP341" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="120" top="544" right="220" bottom="576"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="0007";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("SAS读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP345" type="8" flags="97"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="发送VIN">
<Rect left="120" top="614" right="220" bottom="646"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end 
engine.Delay(500)</Script><assessment no="11" name="DEP346" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="125" top="674" right="225" bottom="706"/>
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
end
engine.Delay(50)</Script><assessment no="12" name="DEP347" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="120" top="794" right="220" bottom="826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="发送时间">
<Rect left="120" top="734" right="220" bottom="766"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script></Activity>
<Activity id="115" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="914" right="336" bottom="946"/>
</Activity>
<Activity id="117" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="544" right="286" bottom="576"/>
</Activity>
<Activity id="118" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="854" right="286" bottom="886"/>
</Activity>
<Activity id="119" ActivityType="3" flags="1" name="清DTC">
<Rect left="121" top="186" right="221" bottom="218"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP81" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="39" type="0">
</Transition>
<Transition StartId="7" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="92" type="0">
</Transition>
<Transition StartId="39" EndId="42" type="4">
</Transition>
<Transition StartId="39" EndId="119" type="0">
</Transition>
<Transition StartId="42" EndId="91" type="0">
</Transition>
<Transition StartId="42" EndId="115" type="5">
</Transition>
<Transition StartId="91" EndId="6" type="0">
</Transition>
<Transition StartId="92" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="117" type="0">
</Transition>
<Transition StartId="101" EndId="106" type="1">
<Expression>DString_Write_VIN ~= "" and HS7_SAS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="109" type="0">
</Transition>
<Transition StartId="108" EndId="2" type="0">
</Transition>
<Transition StartId="109" EndId="108" type="0">
</Transition>
<Transition StartId="115" EndId="2" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="2" type="0">
</Transition>
<Transition StartId="119" EndId="7" type="0">
</Transition>
</Transitions>
</Process>

