<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3003" pbltext="DEP31">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="AT_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="520" top="24" right="620" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="400" top="614" right="500" bottom="646"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="自动变速器(AT)">
<Rect left="520" top="84" right="620" bottom="116"/>
<TitleText Enable="1" Text="自动变速器 (AT)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="520" top="144" right="620" bottom="176"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT

</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="切诊断">
<Rect left="520" top="334" right="620" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(50)</Script><assessment no="12" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="520" top="384" right="620" bottom="416"/>
<Line1Text Enable="1" Text="安全访问"/>
<Line2Text Enable="1"/>
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

end</Script><assessment no="13" name="DEP34" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="发送key">
<Rect left="520" top="484" right="620" bottom="516"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(50)
#COMM 0x27 0x02 key0 key1 key2 key3
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

engine.Delay(50)</Script><assessment no="14" name="DEP35" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="13" flags="0" name="计算">
<Rect left="520" top="434" right="620" bottom="466"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x31540365"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="通讯">
<Rect left="520" top="194" right="620" bottom="226"/>
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

end</Script><assessment no="10" name="DEP32" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="1" name="通讯失败">
<Rect left="400" top="194" right="500" bottom="226"/>
<Line1Text Enable="1" Text="AT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="229" ActivityType="3" flags="0" name="结束通讯">
<Rect left="400" top="144" right="500" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="230" ActivityType="3" flags="0" name="比对零件号">
<Rect left="660" top="484" right="760" bottom="516"/>
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
        engine.println("AT读取零件号:"..num)
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
engine.StatPoint = DString_Partnumber;</Script><assessment no="1" name="DEP229" type="8" flags="97"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="800" top="484" right="900" bottom="516"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="99383-07273";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("AT读取软件版本号:"..num)
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
engine.StatPoint = SoftwareNumber;</Script><assessment no="5" name="DEP234" type="8" flags="97"/>
</Activity>
<Activity id="243" ActivityType="3" flags="0" name="延时50MS">
<Rect left="800" top="544" right="900" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="244" ActivityType="3" flags="0" name="发送VIN">
<Rect left="930" top="484" right="1030" bottom="516"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>DString_Write_VIN = engine.VIN;
engine.SetLineText(3,DString_Write_VIN);
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
end </Script><assessment no="6" name="DEP235" type="8" flags="97"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="读VIN">
<Rect left="930" top="544" right="1030" bottom="576"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,engine.VIN);
engine.println("VIN标准值:"..engine.VIN);
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Write_VIN)));
        engine.println("EMS读取VIN:"..num)
        engine.SetLineText(3,num);
	if (num == engine.VIN) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.println("比对失败");
	end
	engine.StatValue=num;
	engine.StatPoint=DString_Write_VIN;
else
        recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.Delay(50)</Script><assessment no="7" name="DEP236" type="8" flags="97"/>
</Activity>
<Activity id="248" ActivityType="3" flags="0" name="日期读取">
<Rect left="1070" top="544" right="1170" bottom="576"/>
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

engine.Delay(50)</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="249" ActivityType="3" flags="0" name="发送时间">
<Rect left="1070" top="484" right="1170" bottom="516"/>
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

end</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="261" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="614" right="1136" bottom="646"/>
</Activity>
<Activity id="262" ActivityType="3" flags="0" name="清DTC">
<Rect left="520" top="274" right="620" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(200)
#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP33" type="8" flags="97"/>
</Activity>
<Activity id="263" ActivityType="3" flags="0" name="确认车辆非点火状态">
<Rect left="670" top="194" right="770" bottom="226"/>
<Line1Text Enable="1" Text="请确认车辆发动机非启动状态？"/>
<Line2Text Enable="1" Text="并处于上电状态"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
   engine.StatValue = "人工点击确定：车辆处于非启动并上电状态";
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.StatValue = "人工点击放弃：车辆处于启动并上电状态";
else
end</Script><assessment no="60" name="DEP2496" type="8" flags="97"/>
</Activity>
<Activity id="1357" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="134" right="706" bottom="166"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="150" type="0">
</Transition>
<Transition StartId="110" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="148" type="0">
</Transition>
<Transition StartId="147" EndId="230" type="0">
</Transition>
<Transition StartId="148" EndId="147" type="0">
</Transition>
<Transition StartId="150" EndId="151" type="4">
</Transition>
<Transition StartId="150" EndId="262" type="0">
</Transition>
<Transition StartId="150" EndId="263" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="151" EndId="229" type="0">
</Transition>
<Transition StartId="151" EndId="2" type="5">
</Transition>
<Transition StartId="229" EndId="5" type="0">
</Transition>
<Transition StartId="230" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="243" EndId="2" type="0">
</Transition>
<Transition StartId="244" EndId="247" type="0">
</Transition>
<Transition StartId="247" EndId="249" type="0">
</Transition>
<Transition StartId="248" EndId="261" type="0">
</Transition>
<Transition StartId="249" EndId="248" type="0">
</Transition>
<Transition StartId="261" EndId="2" type="0">
</Transition>
<Transition StartId="262" EndId="110" type="0">
</Transition>
<Transition StartId="263" EndId="262" type="0">
</Transition>
</Transitions>
</Process>

