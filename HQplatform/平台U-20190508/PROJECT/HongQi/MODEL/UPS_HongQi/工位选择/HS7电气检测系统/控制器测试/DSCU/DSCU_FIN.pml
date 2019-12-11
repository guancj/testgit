<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3023" pbltext="DEP157">
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
<Variable id="CAN_SND_ID" type="3" data="0x760" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x768" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="90" top="14" right="190" bottom="46"/>
<Script></Script><TitleText Enable="1" Text="DSCU座椅系统"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="90" top="704" right="190" bottom="736"/>
<Script>#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="156" ActivityType="3" flags="0" name="连接ECU">
<Rect left="90" top="84" right="190" bottom="116"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="157" ActivityType="3" flags="1" name="切诊断">
<Rect left="90" top="214" right="190" bottom="246"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP1077" type="8" flags="97"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="420" top="284" right="520" bottom="316"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP161" type="8" flags="97"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="发送key">
<Rect left="420" top="444" right="520" bottom="476"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP162" type="8" flags="97"/>
</Activity>
<Activity id="160" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="420" top="364" right="520" bottom="396"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA0CEDFB1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="通讯">
<Rect left="90" top="144" right="190" bottom="176"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
       engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP158" type="8" flags="97"/>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="比对零件号">
<Rect left="90" top="374" right="190" bottom="406"/>
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
if(@0==0x62)then
	DString1 = engine.GetResponseString(3,2+#DString_Partnumber);

	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	if (DString1==DString_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="6" name="DEP526" type="8" flags="105"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="420" top="214" right="520" bottom="246"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP528" type="8" flags="97"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="90" top="444" right="190" bottom="476"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="2.07";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("DSCU读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP530" type="8" flags="105"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="读VIN">
<Rect left="90" top="524" right="190" bottom="556"/>
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
end</Script><assessment no="12" name="DEP532" type="8" flags="105"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="日期读取">
<Rect left="90" top="604" right="190" bottom="636"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="144" right="370" bottom="176"/>
<Line1Text Enable="1" Text="DSCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="结束通讯">
<Rect left="270" top="84" right="370" bottom="116"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="222" ActivityType="5" flags="0" name="DSCU_ReadDTC">
<Rect top="644" right="100" bottom="676"/>
<SubProcesses>
<SubProcess id="DSCU_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="清DTC">
<Rect left="90" top="294" right="190" bottom="326"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP159" type="8" flags="97"/>
</Activity>
<Activity id="420" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="704" right="336" bottom="736"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="161" type="0">
</Transition>
<Transition StartId="157" EndId="225" type="0">
</Transition>
<Transition StartId="158" EndId="160" type="0">
</Transition>
<Transition StartId="160" EndId="159" type="0">
</Transition>
<Transition StartId="161" EndId="194" type="4">
</Transition>
<Transition StartId="161" EndId="157" type="0">
</Transition>
<Transition StartId="162" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="2" type="0">
</Transition>
<Transition StartId="194" EndId="195" type="0">
</Transition>
<Transition StartId="194" EndId="420" type="5">
</Transition>
<Transition StartId="195" EndId="156" type="0">
</Transition>
<Transition StartId="222" EndId="2" type="0">
</Transition>
<Transition StartId="225" EndId="162" type="0">
</Transition>
<Transition StartId="420" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

