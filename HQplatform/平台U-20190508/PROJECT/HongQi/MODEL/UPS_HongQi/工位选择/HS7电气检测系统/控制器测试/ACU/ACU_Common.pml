<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3006" pbltext="DEP1616">
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
<Variable id="CAN_SND_ID" type="3" data="0x720" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x728" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="410" top="44" right="510" bottom="76"/>
<Script>--engine.registerPacket(1,3000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="784" right="310" bottom="816"/>
<Script>#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="安全气囊(ACU)">
<Rect left="410" top="94" right="510" bottom="126"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="410" top="144" right="510" bottom="176"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="410" top="304" right="510" bottom="336"/>
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

end</Script><assessment no="3" name="DEP1619" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="410" top="344" right="510" bottom="376"/>
<Line1Text Enable="1" Text="安全访问"/>
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

end</Script><assessment no="4" name="DEP1620" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="410" top="394" right="510" bottom="426"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB9ED8BFE"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="410" top="444" right="510" bottom="476"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
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

end</Script><assessment no="5" name="DEP1621" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="通讯">
<Rect left="410" top="204" right="510" bottom="236"/>
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

end</Script><assessment no="1" name="DEP1617" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="通讯失败">
<Rect left="210" top="204" right="310" bottom="236"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="结束通讯">
<Rect left="210" top="144" right="310" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="比对零件号">
<Rect left="620" top="444" right="720" bottom="476"/>
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
	engine.println("ACU读到零件号:"..DString1);
	
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="6" name="DEP1622" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="820" top="444" right="920" bottom="476"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="05.00190614";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("ACU读取软件版本号:"..num)
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1626" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时50MS">
<Rect left="820" top="514" right="920" bottom="546"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="发送VIN">
<Rect left="950" top="444" right="1050" bottom="476"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

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
end </Script><assessment no="11" name="DEP1627" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="950" top="514" right="1050" bottom="546"/>
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="12" name="DEP1628" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="1080" top="514" right="1180" bottom="546"/>
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

end</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="发送时间">
<Rect left="1080" top="444" right="1180" bottom="476"/>
<Line1Text Enable="1" Text="发送时间"/>
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

end</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1620" top="664" right="1720" bottom="696"/>
<Line1Text Enable="1" Text="延时500ms"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="写配置码">
<Rect left="1620" top="274" right="1720" bottom="306"/>
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
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end 
#DELAY 100</Script><assessment no="13" name="DEP1629" type="8" flags="97"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1620" top="724" right="1720" bottom="756"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=engine.GetResponseString(3,2+#DString_VariCoding);
        DString_Read_Config_Code_From_ECU=LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="14" name="DEP1630" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="读取模式">
<Rect left="1210" top="444" right="1310" bottom="476"/>
<Line1Text Enable="1" Text="获取模式"/>
<Script>local StringRes;
#COMM 0x22 0xF1 0x00
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
StringRes = StringRes:sub(4,4)
StringRes = string.byte(StringRes)
print("facMode:"..StringRes)
if (StringRes == 0x03) then
	factoryMode = 0
elseif (StringRes == 0x01) then
	factoryMode = 1
else
end
</Script></Activity>
<Activity id="121" ActivityType="3" flags="0" name="模式转换">
<Rect left="1210" top="514" right="1310" bottom="546"/>
<Line1Text Enable="1" Text="模式转换"/>
<Line2Text Enable="1" Text="等待5秒"/>
<Script>
engine.Delay(700);
local StringRes;
#COMM 0x2E 0xF1 0x00 0x01
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

end</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="1654" top="784" right="1686" bottom="816"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="请下电">
<Rect left="1620" top="384" right="1720" bottom="416"/>
<Line1Text Enable="1" Text="请确保下电"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="等待5秒">
<Rect left="1620" top="434" right="1720" bottom="466"/>
<Line1Text Enable="1" Text="5秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="194" ActivityType="3" flags="0" name="请上电">
<Rect left="1620" top="484" right="1720" bottom="516"/>
<Line1Text Enable="1" Text="请上电，开始检测"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1620" top="544" right="1720" bottom="576"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="通讯">
<Rect left="1620" top="604" right="1720" bottom="636"/>
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

end</Script><assessment no="1" name="DEP1617" type="8" flags="97"/>
</Activity>
<Activity id="202" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1750" top="604" right="1850" bottom="636"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="203" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1750" top="544" right="1850" bottom="576"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="清DTC">
<Rect left="410" top="254" right="510" bottom="286"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1618" type="8" flags="97"/>
</Activity>
<Activity id="1074" ActivityType="3" flags="0" name="正常模式转换">
<Rect left="820" top="574" right="920" bottom="606"/>
<Line1Text Enable="1" Text="模式转换"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(700);
local StringRes;
#COMM 0x2E 0xF1 0x00 0x03
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
</Script><assessment no="24" name="DEP2211" type="8" flags="97"/>
</Activity>
<Activity id="1075" ActivityType="3" flags="0" name="读取模式">
<Rect left="820" top="724" right="920" bottom="756"/>
<Line1Text Enable="1" Text="获取模式状态"/>
<Script>local StringRes;
#COMM 0x22 0xF1 0x00
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
StringRes = StringRes:sub(4,4)
StringRes = string.byte(StringRes)
if (StringRes == 0x03) then
        engine.println("正常模式:"..StringRes)
        engine.LastError = 0 ;
        factoryMode = 0
        engine.StatValue = "正常模式:"..StringRes ;
elseif (StringRes == 0x01) then
	engine.println("工厂模式"..StringRes)
        engine.LastError = 1 ;
        factoryMode = 1
        engine.StatValue = "工厂模式："..StringRes;
else

end

</Script><assessment no="26" name="DEP2469" type="8" flags="97"/>
</Activity>
<Activity id="1076" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1350" top="444" right="1450" bottom="476"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="1077" ActivityType="3" flags="0" name="切诊断">
<Rect left="1350" top="554" right="1450" bottom="586"/>
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

end</Script></Activity>
<Activity id="1078" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="1350" top="614" right="1450" bottom="646"/>
<Line1Text Enable="1" Text="安全访问"/>
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

end</Script></Activity>
<Activity id="1079" ActivityType="13" flags="0" name="计算">
<Rect left="1350" top="674" right="1450" bottom="706"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB9ED8BFE"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1080" ActivityType="3" flags="0" name="发送key">
<Rect left="1350" top="724" right="1450" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
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

end</Script></Activity>
<Activity id="1081" ActivityType="3" flags="0" name="通讯">
<Rect left="1350" top="504" right="1450" bottom="536"/>
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

end</Script></Activity>
<Activity id="1082" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1480" top="504" right="1580" bottom="536"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="1083" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1480" top="444" right="1580" bottom="476"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="1089" ActivityType="3" flags="0" name="等待5秒">
<Rect left="1210" top="634" right="1310" bottom="666"/>
<Line1Text Enable="1" Text="模式转换中..."/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="1090" ActivityType="3" flags="0" name="STOPCOMM">
<Rect left="1210" top="574" right="1310" bottom="606"/>
<Script>
#STOPCOMM</Script></Activity>
<Activity id="1091" ActivityType="3" flags="0" name="STOPCOMM">
<Rect left="1620" top="334" right="1720" bottom="366"/>
<Script>
#STOPCOMM</Script></Activity>
<Activity id="1092" ActivityType="3" flags="0" name="清DTC">
<Rect left="1090" top="784" right="1190" bottom="816"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1618" type="8" flags="97"/>
</Activity>
<Activity id="1093" ActivityType="3" flags="0" name="模式转换失败">
<Rect left="820" top="644" right="920" bottom="676"/>
<Line1Text Enable="1" Text="模式转换失败，是否重试？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="1095" ActivityType="3" flags="0" name="比对零件号">
<Rect left="1090" top="724" right="1190" bottom="756"/>
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
	engine.println("ACU读到零件号:"..DString1);
	
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="6" name="DEP1622" type="8" flags="97"/>
</Activity>
<Activity id="1096" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="960" top="724" right="1060" bottom="756"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="05.00190614";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("ACU读取软件版本号:"..num)
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1626" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="32" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="42" type="0">
</Transition>
<Transition StartId="10" EndId="1074" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="32" EndId="38" type="4">
</Transition>
<Transition StartId="32" EndId="204" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="38" EndId="2" type="5">
</Transition>
<Transition StartId="39" EndId="6" type="0">
</Transition>
<Transition StartId="42" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="105" EndId="2" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="109" type="0">
</Transition>
<Transition StartId="108" EndId="117" type="0">
</Transition>
<Transition StartId="109" EndId="108" type="0">
</Transition>
<Transition StartId="110" EndId="115" type="0">
</Transition>
<Transition StartId="112" EndId="1091" type="0">
</Transition>
<Transition StartId="115" EndId="131" type="0">
</Transition>
<Transition StartId="117" EndId="121" type="1">
<Expression>factoryMode == 0</Expression></Transition>
<Transition StartId="117" EndId="112" type="0">
</Transition>
<Transition StartId="121" EndId="1090" type="0">
</Transition>
<Transition StartId="131" EndId="1092" type="0">
</Transition>
<Transition StartId="133" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="202" type="4">
</Transition>
<Transition StartId="201" EndId="110" type="0">
</Transition>
<Transition StartId="202" EndId="203" type="0">
</Transition>
<Transition StartId="202" EndId="131" type="5">
</Transition>
<Transition StartId="203" EndId="200" type="0">
</Transition>
<Transition StartId="204" EndId="7" type="0">
</Transition>
<Transition StartId="1074" EndId="1090" type="0">
</Transition>
<Transition StartId="1075" EndId="2" type="0">
</Transition>
<Transition StartId="1075" EndId="1093" type="1">
<Expression>factoryMode == 1</Expression></Transition>
<Transition StartId="1076" EndId="1081" type="0">
</Transition>
<Transition StartId="1077" EndId="1078" type="0">
</Transition>
<Transition StartId="1078" EndId="1079" type="0">
</Transition>
<Transition StartId="1079" EndId="1080" type="0">
</Transition>
<Transition StartId="1080" EndId="112" type="0">
</Transition>
<Transition StartId="1080" EndId="1095" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="1081" EndId="1082" type="4">
</Transition>
<Transition StartId="1081" EndId="1077" type="0">
</Transition>
<Transition StartId="1082" EndId="1083" type="0">
</Transition>
<Transition StartId="1083" EndId="1076" type="0">
</Transition>
<Transition StartId="1089" EndId="1076" type="0">
</Transition>
<Transition StartId="1090" EndId="1089" type="0">
</Transition>
<Transition StartId="1091" EndId="133" type="0">
</Transition>
<Transition StartId="1092" EndId="2" type="0">
</Transition>
<Transition StartId="1093" EndId="1074" type="6">
</Transition>
<Transition StartId="1093" EndId="2" type="5">
</Transition>
<Transition StartId="1095" EndId="1096" type="0">
</Transition>
<Transition StartId="1096" EndId="1075" type="0">
</Transition>
</Transitions>
</Process>

