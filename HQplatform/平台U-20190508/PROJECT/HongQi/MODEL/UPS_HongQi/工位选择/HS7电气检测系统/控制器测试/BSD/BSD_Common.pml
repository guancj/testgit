<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3018" pbltext="DEP869">
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
<Variable id="CAN_SND_ID" type="3" data="0x734" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x73C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="180" top="4" right="280" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="50" top="534" right="150" bottom="566"/>
<Script>#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="盲区探测控制单元(BSD)">
<Rect left="180" top="54" right="280" bottom="86"/>
<TitleText Enable="1" Text="盲区探测控制单元(BSD)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="590" top="604" right="690" bottom="636"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP871" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="180" top="114" right="280" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="180" top="284" right="280" bottom="316"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1112" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="180" top="334" right="280" bottom="366"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP872" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="180" top="424" right="280" bottom="456"/>
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
</Script><assessment no="5" name="DEP1738" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="180" top="384" right="280" bottom="416"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xDB0FAD20"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="通讯">
<Rect left="180" top="164" right="280" bottom="196"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="通讯失败">
<Rect left="50" top="164" right="150" bottom="196"/>
<Line1Text Enable="1" Text="BSD控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="结束通讯">
<Rect left="50" top="114" right="150" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="比对零件号">
<Rect left="320" top="424" right="420" bottom="456"/>
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
        engine.println("BSD读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP873" type="8" flags="97"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="450" top="424" right="550" bottom="456"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA9
SoftwareNumber ="S101_36";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("BSD读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP875" type="8" flags="97"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="延时50MS">
<Rect left="450" top="474" right="550" bottom="506"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="174" ActivityType="3" flags="0" name="发送VIN">
<Rect left="590" top="424" right="690" bottom="456"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP876" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="检查VIN">
<Rect left="590" top="474" right="690" bottom="506"/>
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
end</Script><assessment no="12" name="DEP877" type="8" flags="97"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="日期读取">
<Rect left="720" top="474" right="820" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="发送时间">
<Rect left="720" top="424" right="820" bottom="456"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="178" ActivityType="3" flags="0" name="延时500ms">
<Rect left="850" top="474" right="950" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="181" ActivityType="3" flags="1" name="检查配置码">
<Rect left="980" top="424" right="1080" bottom="456"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xf1 0xa1
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
end</Script><assessment no="14" name="DEP878" type="8" flags="97"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="写配置码">
<Rect left="850" top="424" right="950" bottom="456"/>
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
end </Script><assessment no="13" name="DEP879" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="534" right="1046" bottom="566"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="清DTC">
<Rect left="180" top="224" right="280" bottom="256"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP2444" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="清DTC">
<Rect left="590" top="534" right="690" bottom="566"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP2444" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="2" type="0">
</Transition>
<Transition StartId="5" EndId="10" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="91" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="0">
</Transition>
<Transition StartId="10" EndId="75" type="4">
</Transition>
<Transition StartId="10" EndId="188" type="0">
</Transition>
<Transition StartId="75" EndId="90" type="0">
</Transition>
<Transition StartId="75" EndId="2" type="5">
</Transition>
<Transition StartId="90" EndId="5" type="0">
</Transition>
<Transition StartId="91" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="174" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="173" EndId="175" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="175" EndId="177" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="175" EndId="2" type="0">
</Transition>
<Transition StartId="176" EndId="186" type="0">
</Transition>
<Transition StartId="177" EndId="176" type="0">
</Transition>
<Transition StartId="178" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="187" type="0">
</Transition>
<Transition StartId="186" EndId="178" type="0">
</Transition>
<Transition StartId="187" EndId="189" type="0">
</Transition>
<Transition StartId="188" EndId="6" type="0">
</Transition>
<Transition StartId="189" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

