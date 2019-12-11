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
<Rect left="240" top="14" right="340" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="240" top="894" right="340" bottom="926"/>
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
<Activity id="3" ActivityType="3" flags="0" name="安全气囊(ACU)">
<Rect left="240" top="74" right="340" bottom="106"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="240" top="124" right="340" bottom="156"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="240" top="284" right="340" bottom="316"/>
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
<Rect left="240" top="344" right="340" bottom="376"/>
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
<Rect left="240" top="404" right="340" bottom="436"/>
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
<Rect left="240" top="454" right="340" bottom="486"/>
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

end
#DELAY  50</Script><assessment no="5" name="DEP1621" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="通讯">
<Rect left="240" top="174" right="340" bottom="206"/>
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
<Activity id="42" ActivityType="3" flags="0" name="比对零件号">
<Rect left="240" top="514" right="340" bottom="546"/>
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
#DELAY  50</Script><assessment no="6" name="DEP1622" type="8" flags="105"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="240" top="584" right="340" bottom="616"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--SoftwareNumber ="05.00190614";
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1626" type="8" flags="105"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="240" top="644" right="340" bottom="676"/>
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="12" name="DEP1628" type="8" flags="105"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="240" top="704" right="340" bottom="736"/>
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
<Activity id="115" ActivityType="3" flags="0" name="检查配置码">
<Rect left="240" top="764" right="340" bottom="796"/>
<Line1Text Enable="1" Text="比对配置码"/>
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
end</Script><assessment no="14" name="DEP1630" type="8" flags="105"/>
</Activity>
<Activity id="134" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="894" right="136" bottom="926"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="模式转换">
<Rect left="550" top="764" right="650" bottom="796"/>
<Line1Text Enable="1" Text="ACU模式转换"/>
<Line2Text Enable="1" Text="等待5秒"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(700);
#COMM 0x2E 0xF1 0x00 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP2211" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="清DTC">
<Rect left="240" top="224" right="340" bottom="256"/>
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
<Activity id="333" ActivityType="3" flags="0" name="通讯失败">
<Rect left="70" top="174" right="170" bottom="206"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="334" ActivityType="3" flags="0" name="结束通讯">
<Rect left="70" top="124" right="170" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="335" ActivityType="3" flags="0" name="读取模式">
<Rect left="240" top="834" right="340" bottom="866"/>
<Line1Text Enable="1" Text="获取ACU模式"/>
<Script>local StringRes;
#COMM 0x22 0xF1 0x00
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
StringRes = StringRes:sub(4,4)
StringRes = string.byte(StringRes)
if (StringRes == 0x03) then
        engine.println("正常模式:"..StringRes)
        engine.LastError = 0 ;
        engine.StatValue = "正常模式:"..StringRes ;
elseif (StringRes == 0x01) then
	engine.println("工厂模式"..StringRes)
        engine.LastError = 1 ;
        engine.StatValue = "工厂模式："..StringRes;
else

end

</Script><assessment no="25" name="DEP2468" type="8" flags="97"/>
</Activity>
<Activity id="1088" ActivityType="3" flags="0" name="连接ECU">
<Rect left="700" top="784" right="800" bottom="816"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="1093" ActivityType="3" flags="0" name="通讯">
<Rect left="700" top="834" right="800" bottom="866"/>
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
<Activity id="1095" ActivityType="3" flags="0" name="通讯失败">
<Rect left="860" top="834" right="960" bottom="866"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="1096" ActivityType="3" flags="0" name="结束通讯">
<Rect left="860" top="784" right="960" bottom="816"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="1097" ActivityType="3" flags="0" name="等待5秒">
<Rect left="700" top="724" right="800" bottom="756"/>
<Line1Text Enable="1" Text="模式转换中..."/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="1098" ActivityType="3" flags="0" name="读取模式">
<Rect left="410" top="764" right="510" bottom="796"/>
<Line1Text Enable="1" Text="获取ACU模式"/>
<Script>local StringRes;
#COMM 0x22 0xF1 0x00
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
StringRes = StringRes:sub(4,4)
StringRes = string.byte(StringRes)
if (StringRes == 0x03) then
        engine.println("正常模式:"..StringRes)
        engine.LastError = 0 ;
        engine.StatValue = "正常模式:"..StringRes ;
        factoryMode = 0
elseif (StringRes == 0x01) then
	engine.println("工厂模式"..StringRes)
        engine.LastError = 1 ;
        engine.StatValue = "工厂模式："..StringRes;
        factoryMode = 1
else

end

</Script><assessment no="25" name="DEP2468" type="8" flags="97"/>
</Activity>
<Activity id="1099" ActivityType="3" flags="0" name="STOPCOMM">
<Rect left="700" top="664" right="800" bottom="696"/>
<Script>
#STOPCOMM</Script></Activity>
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
<Transition StartId="32" EndId="333" type="4">
</Transition>
<Transition StartId="32" EndId="206" type="0">
</Transition>
<Transition StartId="42" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="335" type="0">
</Transition>
<Transition StartId="115" EndId="1098" type="1">
<Expression>engine.WorkPlace == "REP"</Expression></Transition>
<Transition StartId="134" EndId="2" type="0">
</Transition>
<Transition StartId="200" EndId="1099" type="0">
</Transition>
<Transition StartId="206" EndId="7" type="0">
</Transition>
<Transition StartId="333" EndId="334" type="0">
</Transition>
<Transition StartId="333" EndId="134" type="5">
</Transition>
<Transition StartId="334" EndId="6" type="0">
</Transition>
<Transition StartId="335" EndId="2" type="0">
</Transition>
<Transition StartId="1088" EndId="1093" type="0">
</Transition>
<Transition StartId="1093" EndId="1095" type="4">
</Transition>
<Transition StartId="1093" EndId="335" type="0">
</Transition>
<Transition StartId="1095" EndId="1096" type="0">
</Transition>
<Transition StartId="1096" EndId="1088" type="0">
</Transition>
<Transition StartId="1097" EndId="1088" type="0">
</Transition>
<Transition StartId="1098" EndId="200" type="1">
<Expression>factoryMode == 1</Expression></Transition>
<Transition StartId="1098" EndId="2" type="0">
</Transition>
<Transition StartId="1099" EndId="1097" type="0">
</Transition>
</Transitions>
</Process>

