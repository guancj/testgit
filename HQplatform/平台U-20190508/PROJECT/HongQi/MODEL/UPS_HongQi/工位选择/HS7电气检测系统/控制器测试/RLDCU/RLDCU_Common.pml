<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3021" pbltext="DEP119">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="RLDCU_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x756" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="780" top="144" right="880" bottom="176"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="560" top="724" right="660" bottom="756"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="左后门 (RLDCU)">
<Rect left="780" top="204" right="880" bottom="236"/>
<TitleText Enable="1" Text="左后门 (RLDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="940" top="774" right="1040" bottom="806"/>
<Line1Text Enable="1" Text="RLDCU 第一次清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="780" top="244" right="880" bottom="276"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="780" top="364" right="880" bottom="396"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="780" top="414" right="880" bottom="446"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP123" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="发送key">
<Rect left="780" top="524" right="880" bottom="556"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP124" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="13" flags="0" name="计算">
<Rect left="780" top="474" right="880" bottom="506"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x41641375"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="通讯">
<Rect left="780" top="294" right="880" bottom="326"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end

</Script><assessment no="1" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="通讯失败">
<Rect left="560" top="294" right="660" bottom="326"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="结束通讯">
<Rect left="560" top="244" right="660" bottom="276"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="146" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="940" top="574" right="1040" bottom="606"/>
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP593" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="延时50MS">
<Rect left="940" top="624" right="1040" bottom="656"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 50</Script></Activity>
<Activity id="149" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1070" top="574" right="1170" bottom="606"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin


if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP594" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="读VIN">
<Rect left="1070" top="624" right="1170" bottom="656"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	--DString1=bytesStr(@3-@19);
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
end</Script><assessment no="12" name="DEP595" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="日期读取">
<Rect left="1210" top="624" right="1310" bottom="656"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="152" ActivityType="3" flags="0" name="发送时间">
<Rect left="1210" top="574" right="1310" bottom="606"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="1244" top="724" right="1276" bottom="756"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="比对零件号">
<Rect left="780" top="574" right="880" bottom="606"/>
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
        engine.println("RLDCU读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP589" type="8" flags="97"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="清DTC">
<Rect left="910" top="354" right="1010" bottom="386"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP121" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="2" type="0">
</Transition>
<Transition StartId="5" EndId="93" type="0">
</Transition>
<Transition StartId="6" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="91" type="0">
</Transition>
<Transition StartId="90" EndId="163" type="0">
</Transition>
<Transition StartId="91" EndId="90" type="0">
</Transition>
<Transition StartId="93" EndId="94" type="4">
</Transition>
<Transition StartId="93" EndId="164" type="0">
</Transition>
<Transition StartId="94" EndId="132" type="0">
</Transition>
<Transition StartId="94" EndId="2" type="5">
</Transition>
<Transition StartId="132" EndId="5" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="147" EndId="149" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="147" EndId="2" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="152" type="0">
</Transition>
<Transition StartId="151" EndId="162" type="0">
</Transition>
<Transition StartId="152" EndId="151" type="0">
</Transition>
<Transition StartId="162" EndId="2" type="0">
</Transition>
<Transition StartId="163" EndId="146" type="0">
</Transition>
<Transition StartId="164" EndId="6" type="0">
</Transition>
</Transitions>
</Process>

