<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693">
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
<Variable id="CAN_SND_ID" type="3" data="0x726" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72E" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" right="200" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="100" top="654" right="200" bottom="686"/>
<Script>#STOPCOMM
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="100" top="74" right="200" bottom="106"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="100" top="194" right="200" bottom="226"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1696" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="1020" top="304" right="1120" bottom="336"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1697" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="1020" top="374" right="1120" bottom="406"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xEC20BE31"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="1020" top="444" right="1120" bottom="476"/>
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
#DELAY  50</Script><assessment no="5" name="DEP1698" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="通讯">
<Rect left="100" top="134" right="200" bottom="166"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="建立通讯";
end

</Script><assessment no="1" name="DEP1694" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="通讯失败">
<Rect left="280" top="134" right="380" bottom="166"/>
<Line1Text Enable="1" Text="全景控制单元(AVM)控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="结束通讯">
<Rect left="280" top="74" right="380" bottom="106"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="比对零件号">
<Rect left="100" top="254" right="200" bottom="286"/>
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
#DELAY  50</Script><assessment no="6" name="DEP1699" type="8" flags="105"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="1020" top="234" right="1120" bottom="266"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@4);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script><assessment no="8" name="DEP1701" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="490" top="414" right="590" bottom="446"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--SoftwareNumber ="AVSC0.13";
--SoftwareNumber1 ="AVSC0.14 ";
if(engine.LastError == 0 ) then 
	if(engine.CarType == "DAPYHACC0000" or engine.CarType == "DAPYHACC0001")then
		StandValue="FAH7MC0.02";
	elseif(engine.CarType == "DAPSHACC0000" or engine.CarType == "DAPSHACC0001")then
		StandValue="FAH7HC0.02";
	else
	       engine.println("不比对软件版本号");
	end
        
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("AVM读取软件版本号:"..num)
	if(SoftwareNumber ~= num or SoftwareNumber1 ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1703" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="100" top="444" right="200" bottom="476"/>
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
#DELAY  50</Script><assessment no="12" name="DEP1705" type="8" flags="105"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="100" top="514" right="200" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script></Activity>
<Activity id="115" ActivityType="5" flags="0" name="AVM_ReadDTC">
<Rect left="20" top="584" right="120" bottom="616"/>
<SubProcesses>
<SubProcess id="AVM_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="清DTC">
<Rect left="230" top="194" right="330" bottom="226"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="55" name="DEP1695" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="4" flags="0" name="路由节点">
<Rect left="314" top="574" right="346" bottom="606"/>
</Activity>
<Activity id="334" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="100" top="344" right="200" bottom="376"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
if(LibGeneral.CarTNC_HS7_M_plus(engine.CarType) == true)then
		StandValue="FAH7MS0.07";
                StandValue1="FAH7MS0.08";
elseif(LibGeneral.CarTNC_HS7_H(engine.CarType) == true)then
		StandValue="FAH7HS0.09";
                StandValue1="FAH7HS0.08";
else
	       engine.println("不比对软件版本号");
end
	--[[if(engine.CarType == "DAPYHACC0000" or engine.CarType == "DAPYHACC0003" or engine.CarType == "DAPYHACC0001" or engine.CarType == "DAPYHACC0002")then
		StandValue="FAH7MS0.07";
	elseif(engine.CarType == "DAPSHACC0000" or engine.CarType == "DAPSHACC0001" or engine.CarType == "DAPSHACC0003" or engine.CarType == "DAPSHACC0002")then
		StandValue="FAH7HS0.09";
                StandValue1="FAH7HS0.08";
	else
	       engine.println("不比对软件版本号");
	end
        ]]--
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1 = engine.GetResponseString(3,2+#StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1 or StandValue1 == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
                if(LibGeneral.CarTNC_HS7_M_plus(engine.CarType) == true)then
		engine.StatPoint=StandValue.."或"..StandValue1;
                end
                if(LibGeneral.CarTNC_HS7_H(engine.CarType) == true)then
                engine.StatPoint=StandValue.."或"..StandValue1;
                end
	else
		engine.println("不比对软件版本号");
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="10" name="DEP1703" type="8" flags="105"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="11" type="0">
</Transition>
<Transition StartId="6" EndId="14" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="4">
</Transition>
<Transition StartId="11" EndId="118" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="333" type="5">
</Transition>
<Transition StartId="13" EndId="5" type="0">
</Transition>
<Transition StartId="14" EndId="334" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="2" type="0">
</Transition>
<Transition StartId="115" EndId="2" type="0">
</Transition>
<Transition StartId="118" EndId="6" type="0">
</Transition>
<Transition StartId="333" EndId="2" type="0">
</Transition>
<Transition StartId="334" EndId="107" type="0">
</Transition>
</Transitions>
</Process>

