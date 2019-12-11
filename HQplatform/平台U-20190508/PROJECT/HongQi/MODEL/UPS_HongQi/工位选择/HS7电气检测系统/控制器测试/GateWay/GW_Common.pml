<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3001" pbltext="DEP18">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="GW_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x780" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x788" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="44" right="460" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="190" top="684" right="290" bottom="716"/>
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
<Activity id="3" ActivityType="3" flags="0" name="网关 (GATEWAY)">
<Rect left="360" top="104" right="460" bottom="136"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="360" top="154" right="460" bottom="186"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
engine.println("车型："..engine.CarType);</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="切诊断">
<Rect left="360" top="314" right="460" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x10 0x03

local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="3" name="DEP1097" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="360" top="364" right="460" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5

local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="4" name="DEP22" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="计算">
<Rect left="360" top="414" right="460" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FACCE9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="发送key">
<Rect left="360" top="464" right="460" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3

local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="5" name="DEP23" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="3" flags="1" name="通讯">
<Rect left="360" top="204" right="460" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xf1 0x87

local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="1" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="304" ActivityType="3" flags="0" name="通讯失败">
<Rect left="190" top="204" right="290" bottom="236"/>
<Line1Text Enable="1" Text="GATEWAY 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="305" ActivityType="3" flags="0" name="结束通讯">
<Rect left="190" top="154" right="290" bottom="186"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="307" ActivityType="3" flags="0" name="比对零件号">
<Rect left="490" top="464" right="590" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="比对零件号"/>
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
        engine.println("GW读取零件号:"..num)
	if(DString_Partnumber ~= num)then
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
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP322" type="8" flags="97"/>
</Activity>
<Activity id="313" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="620" top="464" right="720" bottom="496"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="04.51#01_HS7";
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
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP326" type="8" flags="97"/>
</Activity>
<Activity id="314" ActivityType="3" flags="0" name="延时50MS">
<Rect left="620" top="514" right="720" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="316" ActivityType="3" flags="0" name="写VIN码">
<Rect left="750" top="464" right="850" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写入VIN"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(3,DString_Write_VIN);
#COMM 0x2E 0xF1 0x90 DString_Write_VIN

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end </Script><assessment no="11" name="DEP327" type="8" flags="97"/>
</Activity>
<Activity id="317" ActivityType="3" flags="0" name="检查VIN">
<Rect left="750" top="514" right="850" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取VIN"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,engine.VIN);
engine.println("VIN标准值:"..engine.VIN);
if(engine.LastError == 0)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (DString1 == engine.VIN) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Write_VIN;
	
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="17" name="DEP328" type="8" flags="97"/>
</Activity>
<Activity id="318" ActivityType="3" flags="0" name="日期读取">
<Rect left="880" top="514" right="980" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end
</Script></Activity>
<Activity id="319" ActivityType="3" flags="0" name="写入时间">
<Rect left="880" top="464" right="980" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写入时间"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="15" name="DEP2097" type="8" flags="97"/>
</Activity>
<Activity id="320" ActivityType="3" flags="0" name="写配置">
<Rect left="1020" top="464" right="1120" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写配置码2"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>HorLConfig=DString_VariCoding;
engine.SetLineText(3,HorLConfig);
engine.println("配置码:"..HorLConfig);
#COMM 0x2e 0x01 0x01 hex2bin(HorLConfig)
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="12" name="DEP329" type="8" flags="97"/>
</Activity>
<Activity id="321" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1430" top="464" right="1530" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="比对配置码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x01
engine.println("配置码标准值:"..DString_VariCoding);

if(engine.LastError == 0)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (DString_Read_Config_Code_From_ECU == DString_VariCoding) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.SetLineText(2,"比对配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_VariCoding;
	
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="13" name="DEP330" type="8" flags="97"/>
</Activity>
<Activity id="322" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1020" top="514" right="1120" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="327" ActivityType="4" flags="0" name="路由节点">
<Rect left="1464" top="684" right="1496" bottom="716"/>
</Activity>
<Activity id="328" ActivityType="3" flags="0" name="写车型">
<Rect left="1150" top="464" right="1250" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写入车型"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local carType = engine.CarType
engine.SetLineText(3,carType);

#COMM 0x2e 0xF1 0xA0 carType 0x00 0x00 0x00 0x00
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="25" name="DEP1181" type="8" flags="97"/>
</Activity>
<Activity id="329" ActivityType="3" flags="0" name="车型比对">
<Rect left="1150" top="514" right="1250" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车型比对"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA0

if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(engine.CarType)));
        engine.println("GW读取车型:"..num)
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
engine.StatPoint = engine.CarType;</Script><assessment no="26" name="DEP1182" type="8" flags="97"/>
</Activity>
<Activity id="330" ActivityType="3" flags="0" name="普通节点">
<Rect left="190" top="304" right="290" bottom="336"/>
<Script>engine.LastError = 1 ;</Script></Activity>
<Activity id="331" ActivityType="3" flags="0" name="清DTC">
<Rect left="360" top="254" right="460" bottom="286"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="332" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1280" top="524" right="1380" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="333" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1280" top="584" right="1380" bottom="616"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x11 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP2489" type="8" flags="97"/>
</Activity>
<Activity id="334" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1280" top="644" right="1380" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="335" ActivityType="3" flags="0" name="清DTC">
<Rect left="1280" top="464" right="1380" bottom="496"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="336" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="490" top="514" right="590" bottom="546"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="31.04#01_TXZC";
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
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP326" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="208" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="307" type="0">
</Transition>
<Transition StartId="208" EndId="304" type="4">
</Transition>
<Transition StartId="208" EndId="331" type="0">
</Transition>
<Transition StartId="304" EndId="305" type="0">
</Transition>
<Transition StartId="304" EndId="330" type="5">
</Transition>
<Transition StartId="305" EndId="5" type="0">
</Transition>
<Transition StartId="307" EndId="313" type="0">
</Transition>
<Transition StartId="307" EndId="336" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="313" EndId="314" type="0">
</Transition>
<Transition StartId="314" EndId="2" type="0">
</Transition>
<Transition StartId="314" EndId="316" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="316" EndId="317" type="0">
</Transition>
<Transition StartId="317" EndId="319" type="0">
</Transition>
<Transition StartId="318" EndId="320" type="0">
</Transition>
<Transition StartId="319" EndId="318" type="0">
</Transition>
<Transition StartId="320" EndId="322" type="0">
</Transition>
<Transition StartId="321" EndId="327" type="0">
</Transition>
<Transition StartId="322" EndId="328" type="0">
</Transition>
<Transition StartId="322" EndId="329" type="1">
<Expression>engine.WorkPlace == "TR2"</Expression></Transition>
<Transition StartId="327" EndId="2" type="0">
</Transition>
<Transition StartId="328" EndId="329" type="0">
</Transition>
<Transition StartId="329" EndId="335" type="0">
</Transition>
<Transition StartId="330" EndId="2" type="0">
</Transition>
<Transition StartId="331" EndId="204" type="0">
</Transition>
<Transition StartId="332" EndId="333" type="0">
</Transition>
<Transition StartId="333" EndId="334" type="0">
</Transition>
<Transition StartId="334" EndId="321" type="0">
</Transition>
<Transition StartId="335" EndId="332" type="0">
</Transition>
<Transition StartId="336" EndId="314" type="0">
</Transition>
</Transitions>
</Process>

