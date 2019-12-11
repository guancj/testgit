<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3033" pbltext="DEP1773">
<Parameters>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding1" type="8" dir="0" data=""/>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="380" right="480" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="190" top="614" right="290" bottom="646"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="5" ActivityType="3" flags="1" name="连接ECU">
<Rect left="380" top="44" right="480" bottom="76"/>
<TitleText Enable="1" Text="IVI(车载娱乐)"/>
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
<Rect left="380" top="214" right="480" bottom="246"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1776" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="380" top="264" right="480" bottom="296"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1777" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="发送key">
<Rect left="380" top="364" right="480" bottom="396"/>
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
</Script><assessment no="5" name="DEP1778" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="13" flags="0" name="计算">
<Rect left="380" top="314" right="480" bottom="346"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x96B968CA"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="通讯">
<Rect left="380" top="94" right="480" bottom="126"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1" name="DEP1774" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="写配置码A1">
<Rect left="1060" top="364" right="1160" bottom="396"/>
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
end </Script><assessment no="13" name="DEP2509" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="检查配置码A1">
<Rect left="1200" top="364" right="1300" bottom="396"/>
<Line1Text Enable="1" Text="比对配置码"/>
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
end</Script><assessment no="15" name="DEP2511" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="写配置码A2">
<Rect left="1060" top="424" right="1160" bottom="456"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding1;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0xF1 0xA2 VariCoding

if(engine.LastError == 0 ) then 
engine.StatValue=DString_VariCoding1;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end 

#DELAY 500
</Script><assessment no="14" name="DEP2510" type="8" flags="97"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="检查配置码A2">
<Rect left="1200" top="424" right="1300" bottom="456"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA2
engine.println("配置码标准值1:"..DString_VariCoding1);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding1)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (DString_Read_Config_Code_From_ECU == DString_VariCoding1) then
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
	engine.StatPoint=DString_VariCoding1;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP2512" type="8" flags="97"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="比对零件号">
<Rect left="510" top="364" right="610" bottom="396"/>
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
        engine.println("读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP1779" type="8" flags="97"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="364" right="730" bottom="396"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="1600r"
SoftwareNumber1 ="1700r"
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("IVI读取软件版本号:"..num)
	if(SoftwareNumber ~= num and SoftwareNumber1 ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber.."或"..SoftwareNumber1;</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
<Activity id="202" ActivityType="3" flags="0" name="写VIN">
<Rect left="800" top="364" right="900" bottom="396"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP1784" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="检查VIN">
<Rect left="800" top="424" right="900" bottom="456"/>
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
end</Script><assessment no="12" name="DEP1785" type="8" flags="97"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="读取编程时间">
<Rect left="920" top="424" right="1020" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script></Activity>
<Activity id="205" ActivityType="3" flags="0" name="写编程时间">
<Rect left="920" top="364" right="1020" bottom="396"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="通讯失败">
<Rect left="190" top="94" right="290" bottom="126"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="305" ActivityType="3" flags="0" name="结束通讯">
<Rect left="190" top="44" right="290" bottom="76"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="307" ActivityType="3" flags="0" name="写车型">
<Rect left="1330" top="364" right="1430" bottom="396"/>
<Script>local carType = engine.CarType
engine.SetLineText(3,carType);

#COMM 0x2e 0xF1 0xA5 carType 0x00 0x00 0x00 0x00 0x00 0x00 

if(engine.LastError == 0 ) then 
engine.StatValue = carType
else
recvTel = @0-;
engine.StatValue = LibGeneral.hex2str(recvTel)
end</Script><assessment no="17" name="DEP2200" type="8" flags="97"/>
</Activity>
<Activity id="308" ActivityType="3" flags="0" name="车型比对">
<Rect left="1330" top="424" right="1430" bottom="456"/>
<Script>#COMM 0x22 0xF1 0xA5

if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(engine.CarType)));
        engine.println("IVI读取车型:"..num)
	if(engine.CarType ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end

engine.StatPoint = engine.CarType;

--[[local carType1 = engine.CarType
if(@0==0x62)then
        DString1 = engine.GetResponseString(3,-1)
        engine.SetLineText(3,DString1);
        print("IVI CarTye:"..DString1)
        engine.StatValue = DString1;
        engine.StatPoint = carType1;
	if(engine.CarType == DString1)then                          
		engine.LastError = 0;
		engine.println("比对车型成功:"..DString1);
	else
		engine.LastError = 1;
		engine.println("比对车型失败:"..DString1);
	end
else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
]]--</Script><assessment no="19" name="DEP2201" type="8" flags="97"/>
</Activity>
<Activity id="309" ActivityType="3" flags="0" name="清DTC">
<Rect left="380" top="164" right="480" bottom="196"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1775" type="8" flags="97"/>
</Activity>
<Activity id="310" ActivityType="3" flags="0" name="清DTC">
<Rect left="1480" top="614" right="1580" bottom="646"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1775" type="8" flags="97"/>
</Activity>
<Activity id="311" ActivityType="3" flags="0" name="证书申请">
<Rect left="1480" top="364" right="1580" bottom="396"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xE7 0x20
--jd_rel = @0-;
if (@0 == 0x71)then
       if(@4 == 0x00)then
       engine.LastError = 0;
       engine.SetLineText(2,"证书申请成功");
       engine.println("证书申请成功");
 --      engine.StatValue = "证书申请成功";
       else
       engine.LastError = 1;
       engine.SetLineText(2,"证书申请失败");
       engine.println("证书申请失败");
       end
else
engine.LastError = 1;
engine.SetLineText(2,"证书申请失败");
engine.println("证书申请失败");
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP2506" type="8" flags="97"/>
</Activity>
<Activity id="312" ActivityType="3" flags="0" name="等待10秒">
<Rect left="1480" top="424" right="1580" bottom="456"/>
<Line1Text Enable="1" Text="证书申请中，请等待10秒"/>
<Script>for t=10,1,-1 do
engine.SetLineText(1,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="313" ActivityType="3" flags="0" name="获取证书申请结果">
<Rect left="1480" top="484" right="1580" bottom="516"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="25" DelayTime="2000"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x03 0xE7 0x20
--jd_str = @0-;
if(@0 ==  0x71)then
	if(@4 == 0x00)then
		engine.LastError = 0;
                engine.TestResult = 0;
                engine.SetLineText(2,"获取证书申请结果成功");
                engine.println("获取证书申请结果成功"); 
        else
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.SetLineText(2,"获取证书申请结果失败，自动重新申请");
                engine.println("获取证书申请结果失败");        
	end
else
	engine.LastError = 1;
        engine.TestResult = 1;
        engine.SetLineText(2,"获取证书申请结果失败，自动重新申请");
        engine.println("获取证书申请结果失败");  

end
        local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP2507" type="8" flags="97"/>
</Activity>
<Activity id="314" ActivityType="4" flags="0" name="路由节点">
<Rect left="1674" top="274" right="1706" bottom="306"/>
</Activity>
<Activity id="315" ActivityType="4" flags="0" name="路由节点">
<Rect left="1094" top="284" right="1126" bottom="316"/>
</Activity>
<Activity id="316" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="284" right="1396" bottom="316"/>
</Activity>
<Activity id="1169" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="630" top="264" right="730" bottom="296"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="0960r";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("IVI读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
<Activity id="1170" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="364" right="786" bottom="396"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="88" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="87" type="0">
</Transition>
<Transition StartId="72" EndId="193" type="0">
</Transition>
<Transition StartId="87" EndId="72" type="0">
</Transition>
<Transition StartId="88" EndId="207" type="4">
</Transition>
<Transition StartId="88" EndId="309" type="0">
</Transition>
<Transition StartId="90" EndId="190" type="0">
</Transition>
<Transition StartId="189" EndId="192" type="0">
</Transition>
<Transition StartId="190" EndId="189" type="0">
</Transition>
<Transition StartId="192" EndId="307" type="0">
</Transition>
<Transition StartId="192" EndId="2" type="1">
<Expression>engine.WorkPlace == "TR1"</Expression></Transition>
<Transition StartId="193" EndId="198" type="0">
</Transition>
<Transition StartId="193" EndId="1169" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="198" EndId="1170" type="0">
</Transition>
<Transition StartId="202" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="205" type="0">
</Transition>
<Transition StartId="204" EndId="90" type="0">
</Transition>
<Transition StartId="204" EndId="315" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="205" EndId="204" type="0">
</Transition>
<Transition StartId="207" EndId="305" type="0">
</Transition>
<Transition StartId="207" EndId="2" type="5">
</Transition>
<Transition StartId="305" EndId="5" type="0">
</Transition>
<Transition StartId="307" EndId="308" type="0">
</Transition>
<Transition StartId="308" EndId="311" type="1">
<Expression>LibGeneral.CarTNC_HS7_H(engine.CarType)</Expression></Transition>
<Transition StartId="308" EndId="310" type="0">
</Transition>
<Transition StartId="309" EndId="6" type="0">
</Transition>
<Transition StartId="310" EndId="2" type="0">
</Transition>
<Transition StartId="311" EndId="312" type="0">
</Transition>
<Transition StartId="312" EndId="313" type="0">
</Transition>
<Transition StartId="313" EndId="310" type="0">
</Transition>
<Transition StartId="315" EndId="316" type="0">
</Transition>
<Transition StartId="316" EndId="307" type="0">
</Transition>
<Transition StartId="1169" EndId="1170" type="0">
</Transition>
<Transition StartId="1170" EndId="202" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="1170" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

