<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3019" pbltext="DEP113">
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
<Variable id="CAN_SND_ID" type="3" data="0x755" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75D" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="310" top="4" right="410" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="140" top="534" right="240" bottom="566"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="比对零件号">
<Rect left="440" top="384" right="540" bottom="416"/>
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
        --num = tostring(string.sub(recvTel,1,4));
        engine.println("PDCU读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="15" name="DEP621" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="580" top="384" right="680" bottom="416"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="1.01.25";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("PDCU读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="5" name="DEP629" type="8" flags="97"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="发送VIN">
<Rect left="720" top="384" right="820" bottom="416"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP625" type="8" flags="97"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="检查VIN">
<Rect left="720" top="444" right="820" bottom="476"/>
<Line1Text Enable="1" Text="比对VIN"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
end</Script><assessment no="7" name="DEP626" type="8" flags="97"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="乘客门检测">
<Rect left="310" top="54" right="410" bottom="86"/>
<TitleText Enable="1" Text="PDCU乘客门检测"/>
<Script></Script></Activity>
<Activity id="187" ActivityType="3" flags="0" name="清DTC">
<Rect left="580" top="594" right="680" bottom="626"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP115" type="8" flags="97"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="连接ECU">
<Rect left="310" top="114" right="410" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="切诊断">
<Rect left="310" top="224" right="410" bottom="256"/>
<Line1Text Enable="1" Text="打开扩展会话"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP1119" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="1" name="安全访问种子">
<Rect left="310" top="284" right="410" bottom="316"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP117" type="8" flags="97"/>
</Activity>
<Activity id="191" ActivityType="3" flags="0" name="发送key">
<Rect left="310" top="384" right="410" bottom="416"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP118" type="8" flags="97"/>
</Activity>
<Activity id="192" ActivityType="13" flags="0" name="计算">
<Rect left="310" top="334" right="410" bottom="366"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30640275"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="通讯">
<Rect left="310" top="164" right="410" bottom="196"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end

</Script><assessment no="2" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="日期读取">
<Rect left="860" top="444" right="960" bottom="476"/>
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
<Rect left="860" top="384" right="960" bottom="416"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="280" ActivityType="3" flags="0" name="结束通讯">
<Rect left="140" top="114" right="240" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="414" ActivityType="3" flags="0" name="通讯失败">
<Rect left="140" top="164" right="240" bottom="196"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="415" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="534" right="926" bottom="566"/>
</Activity>
<Activity id="417" ActivityType="3" flags="0" name="延时50MS">
<Rect left="580" top="444" right="680" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="418" ActivityType="3" flags="0" name="清DTC">
<Rect left="460" top="234" right="560" bottom="266"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="66" name="DEP115" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="186" type="0">
</Transition>
<Transition StartId="4" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="417" type="0">
</Transition>
<Transition StartId="174" EndId="176" type="0">
</Transition>
<Transition StartId="176" EndId="279" type="0">
</Transition>
<Transition StartId="186" EndId="188" type="0">
</Transition>
<Transition StartId="187" EndId="2" type="0">
</Transition>
<Transition StartId="188" EndId="193" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="192" type="0">
</Transition>
<Transition StartId="191" EndId="4" type="0">
</Transition>
<Transition StartId="192" EndId="191" type="0">
</Transition>
<Transition StartId="193" EndId="414" type="4">
</Transition>
<Transition StartId="193" EndId="418" type="0">
</Transition>
<Transition StartId="194" EndId="415" type="0">
</Transition>
<Transition StartId="279" EndId="194" type="0">
</Transition>
<Transition StartId="280" EndId="188" type="0">
</Transition>
<Transition StartId="414" EndId="280" type="0">
</Transition>
<Transition StartId="414" EndId="280" type="0">
</Transition>
<Transition StartId="414" EndId="2" type="5">
</Transition>
<Transition StartId="415" EndId="2" type="0">
</Transition>
<Transition StartId="417" EndId="174" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="417" EndId="2" type="0">
</Transition>
<Transition StartId="418" EndId="189" type="0">
</Transition>
</Transitions>
</Process>

