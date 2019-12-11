<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3022" pbltext="DEP125">
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
<Variable id="CAN_SND_ID" type="3" data="0x757" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75F" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="780" top="84" right="880" bottom="116"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="630" top="674" right="730" bottom="706"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="右后门 (RRDCU)">
<Rect left="780" top="134" right="880" bottom="166"/>
<TitleText Enable="1" Text="右后门(RRDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="920" top="734" right="1020" bottom="766"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP127" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="780" top="184" right="880" bottom="216"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="780" top="304" right="880" bottom="336"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1094" type="8" flags="97"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="780" top="354" right="880" bottom="386"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP129" type="8" flags="97"/>
</Activity>
<Activity id="136" ActivityType="13" flags="0" name="计算key">
<Rect left="780" top="404" right="880" bottom="436"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x41751386"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="发送key">
<Rect left="780" top="454" right="880" bottom="486"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP130" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="通讯">
<Rect left="780" top="234" right="880" bottom="266"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="通讯失败">
<Rect left="630" top="234" right="730" bottom="266"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="结束通讯">
<Rect left="630" top="184" right="730" bottom="216"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="比对零件号">
<Rect left="780" top="524" right="880" bottom="556"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_Partnumber);
engine.println("零件号标准值:"..DString_Partnumber);
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Partnumber)));
        engine.println("RRDCU读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP669" type="8" flags="97"/>
</Activity>
<Activity id="218" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="920" top="524" right="1020" bottom="556"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="1.01.25";
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP673" type="8" flags="97"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="延时50MS">
<Rect left="920" top="574" right="1020" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="221" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1050" top="524" right="1150" bottom="556"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
--engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP674" type="8" flags="97"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1050" top="574" right="1150" bottom="606"/>
<Line1Text Enable="1" Text="比对VIN码"/>
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
end</Script><assessment no="12" name="DEP675" type="8" flags="97"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="日期读取">
<Rect left="1190" top="574" right="1290" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="228" ActivityType="3" flags="0" name="发送时间">
<Rect left="1190" top="524" right="1290" bottom="556"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="674" right="1256" bottom="706"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="清DTC">
<Rect left="900" top="294" right="1000" bottom="326"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="44" name="DEP127" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="2" type="0">
</Transition>
<Transition StartId="5" EndId="139" type="0">
</Transition>
<Transition StartId="6" EndId="133" type="0">
</Transition>
<Transition StartId="133" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="195" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="4">
</Transition>
<Transition StartId="139" EndId="242" type="0">
</Transition>
<Transition StartId="140" EndId="194" type="0">
</Transition>
<Transition StartId="140" EndId="2" type="5">
</Transition>
<Transition StartId="194" EndId="5" type="0">
</Transition>
<Transition StartId="195" EndId="218" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="221" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="219" EndId="2" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="228" type="0">
</Transition>
<Transition StartId="227" EndId="241" type="0">
</Transition>
<Transition StartId="228" EndId="227" type="0">
</Transition>
<Transition StartId="241" EndId="2" type="0">
</Transition>
<Transition StartId="242" EndId="6" type="0">
</Transition>
</Transitions>
</Process>

