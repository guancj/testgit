<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3020" pbltext="DEP107">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="DDCU_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x754" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="500" top="284" right="600" bottom="316"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="350" top="814" right="450" bottom="846"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="262" ActivityType="3" flags="1" name="比对零件号">
<Rect left="630" top="664" right="730" bottom="696"/>
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
        engine.println("GW读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="7" name="DEP552" type="8" flags="97"/>
</Activity>
<Activity id="273" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="770" top="664" right="870" bottom="696"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="1.01.25";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("DDCU读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="11" name="DEP556" type="8" flags="97"/>
</Activity>
<Activity id="274" ActivityType="3" flags="0" name="延时50MS">
<Rect left="770" top="724" right="870" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="276" ActivityType="3" flags="0" name="发送VIN">
<Rect left="900" top="664" right="1000" bottom="696"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="12" name="DEP557" type="8" flags="97"/>
</Activity>
<Activity id="277" ActivityType="3" flags="0" name="读VIN">
<Rect left="900" top="724" right="1000" bottom="756"/>
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
end</Script><assessment no="13" name="DEP558" type="8" flags="97"/>
</Activity>
<Activity id="278" ActivityType="3" flags="0" name="日期读取">
<Rect left="1030" top="724" right="1130" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="279" ActivityType="3" flags="0" name="发送时间">
<Rect left="1030" top="664" right="1130" bottom="696"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="405" ActivityType="3" flags="0" name="司机门 (DDCU)">
<Rect left="500" top="344" right="600" bottom="376"/>
<TitleText Enable="1" Text="司机门 (DDCU)"/>
<Script></Script></Activity>
<Activity id="406" ActivityType="3" flags="0" name="清DTC">
<Rect left="770" top="864" right="870" bottom="896"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP109" type="8" flags="97"/>
</Activity>
<Activity id="407" ActivityType="3" flags="0" name="连接ECU">
<Rect left="500" top="394" right="600" bottom="426"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="408" ActivityType="3" flags="0" name="切诊断">
<Rect left="500" top="514" right="600" bottom="546"/>
<Line1Text Enable="1" Text="打开扩展会话"/>
<Script>#COMM 0x10 0x03


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1081" type="8" flags="97"/>
</Activity>
<Activity id="409" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="500" top="564" right="600" bottom="596"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP111" type="8" flags="97"/>
</Activity>
<Activity id="410" ActivityType="3" flags="0" name="发送key">
<Rect left="500" top="664" right="600" bottom="696"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP112" type="8" flags="97"/>
</Activity>
<Activity id="411" ActivityType="13" flags="0" name="计算">
<Rect left="500" top="614" right="600" bottom="646"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30530264"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="412" ActivityType="3" flags="0" name="通讯">
<Rect left="500" top="444" right="600" bottom="476"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="413" ActivityType="3" flags="0" name="结束通讯">
<Rect left="350" top="394" right="450" bottom="426"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="414" ActivityType="3" flags="0" name="通讯失败">
<Rect left="350" top="444" right="450" bottom="476"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="419" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="814" right="1096" bottom="846"/>
</Activity>
<Activity id="420" ActivityType="3" flags="0" name="清DTC">
<Rect left="650" top="484" right="750" bottom="516"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP109" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="405" type="0">
</Transition>
<Transition StartId="262" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="274" type="0">
</Transition>
<Transition StartId="274" EndId="276" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="274" EndId="2" type="0">
</Transition>
<Transition StartId="276" EndId="277" type="0">
</Transition>
<Transition StartId="277" EndId="279" type="0">
</Transition>
<Transition StartId="278" EndId="419" type="0">
</Transition>
<Transition StartId="279" EndId="278" type="0">
</Transition>
<Transition StartId="405" EndId="407" type="0">
</Transition>
<Transition StartId="406" EndId="2" type="0">
</Transition>
<Transition StartId="407" EndId="412" type="0">
</Transition>
<Transition StartId="408" EndId="409" type="0">
</Transition>
<Transition StartId="409" EndId="411" type="0">
</Transition>
<Transition StartId="410" EndId="262" type="0">
</Transition>
<Transition StartId="411" EndId="410" type="0">
</Transition>
<Transition StartId="412" EndId="414" type="4">
</Transition>
<Transition StartId="412" EndId="420" type="0">
</Transition>
<Transition StartId="413" EndId="407" type="0">
</Transition>
<Transition StartId="414" EndId="413" type="0">
</Transition>
<Transition StartId="414" EndId="413" type="0">
</Transition>
<Transition StartId="414" EndId="2" type="5">
</Transition>
<Transition StartId="419" EndId="2" type="0">
</Transition>
<Transition StartId="420" EndId="408" type="0">
</Transition>
</Transitions>
</Process>

