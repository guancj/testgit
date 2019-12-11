<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3002" pbltext="DEP142">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="14" right="200" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="100" top="784" right="200" bottom="816"/>
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
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="100" top="114" right="200" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="发动机检测 (EMS)">
<Rect left="100" top="64" right="200" bottom="96"/>
<TitleText Enable="1" Text="发动机检测 (EMS)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="820" top="314" right="920" bottom="346"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP146" type="8" flags="97"/>
</Activity>
<Activity id="121" ActivityType="13" flags="0" name="计算key">
<Rect left="820" top="394" right="920" bottom="426"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x2054F265"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="发送key">
<Rect left="820" top="474" right="920" bottom="506"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP147" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="100" top="284" right="200" bottom="316"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP1232" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="通讯">
<Rect left="100" top="164" right="200" bottom="196"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="240" top="164" right="340" bottom="196"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#STOPCOMM
engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="结束通讯">
<Rect left="240" top="114" right="340" bottom="146"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="比对零件号">
<Rect left="100" top="364" right="200" bottom="396"/>
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
end</Script><assessment no="6" name="DEP288" type="8" flags="105"/>
</Activity>
<Activity id="206" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="100" top="454" right="200" bottom="486"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x81
SoftwareNumber = "3601611-DA01-D";
SoftwareNumber1 = "3601611-DA01-D";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("EMS读取软件版本号:"..num)
	if(SoftwareNumber ~= num and SoftwareNumber1 ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
        engine.StatPoint = SoftwareNumber1.."或"..SoftwareNumber;
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end


--[[
#COMM 0x22 0xF1 0x95
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
--]]

#DELAY  50</Script><assessment no="10" name="DEP292" type="8" flags="105"/>
</Activity>
<Activity id="271" ActivityType="3" flags="0" name="读编程时间">
<Rect left="100" top="614" right="200" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取编程日期"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

#DELAY  50</Script></Activity>
<Activity id="272" ActivityType="3" flags="0" name="比对VIN">
<Rect left="100" top="534" right="200" bottom="566"/>
<Line1Text Enable="1" Text="比对VIN"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (DString1 == DString_Write_VIN) then
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

#DELAY  50</Script><assessment no="14" name="DEP2186" type="8" flags="105"/>
</Activity>
<Activity id="275" ActivityType="3" flags="0" name="检查配置码">
<Rect left="100" top="694" right="200" bottom="726"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
end

#DELAY  50
</Script><assessment no="15" name="DEP2187" type="8" flags="105"/>
</Activity>
<Activity id="292" ActivityType="5" flags="0" name="EMS_ReadDTC">
<Rect left="100" top="854" right="200" bottom="886"/>
<SubProcesses>
<SubProcess id="EMS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="294" ActivityType="3" flags="0" name="清DTC">
<Rect top="214" right="100" bottom="246"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="784" right="296" bottom="816"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="125" type="0">
</Transition>
<Transition StartId="4" EndId="3" type="0">
</Transition>
<Transition StartId="6" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="123" type="0">
</Transition>
<Transition StartId="124" EndId="199" type="0">
</Transition>
<Transition StartId="125" EndId="196" type="4">
</Transition>
<Transition StartId="125" EndId="124" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="196" EndId="333" type="5">
</Transition>
<Transition StartId="197" EndId="3" type="0">
</Transition>
<Transition StartId="199" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="272" type="0">
</Transition>
<Transition StartId="271" EndId="275" type="0">
</Transition>
<Transition StartId="272" EndId="271" type="0">
</Transition>
<Transition StartId="275" EndId="2" type="0">
</Transition>
<Transition StartId="292" EndId="2" type="0">
</Transition>
<Transition StartId="333" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

