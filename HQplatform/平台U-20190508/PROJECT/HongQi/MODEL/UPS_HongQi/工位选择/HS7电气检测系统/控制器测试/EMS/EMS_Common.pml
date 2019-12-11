<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3002" pbltext="DEP142">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="EMS_partnumber"/>
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
<Rect left="280" top="14" right="380" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="110" top="944" right="210" bottom="976"/>
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
<Rect left="280" top="114" right="380" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="连接ECU"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="发动机检测 (EMS)">
<Rect left="280" top="64" right="380" bottom="96"/>
<TitleText Enable="1" Text="发动机检测 (EMS)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="280" top="314" right="380" bottom="346"/>
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

end</Script><assessment no="4" name="DEP146" type="8" flags="97"/>
</Activity>
<Activity id="121" ActivityType="13" flags="0" name="计算key">
<Rect left="280" top="364" right="380" bottom="396"/>
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
<Rect left="280" top="414" right="380" bottom="446"/>
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

end</Script><assessment no="5" name="DEP147" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="280" top="264" right="380" bottom="296"/>
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

end</Script><assessment no="3" name="DEP1232" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="通讯">
<Rect left="280" top="164" right="380" bottom="196"/>
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

end</Script><assessment no="1" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="110" top="164" right="210" bottom="196"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="结束通讯">
<Rect left="110" top="114" right="210" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="比对零件号">
<Rect left="580" top="414" right="680" bottom="446"/>
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
        engine.println("EMS读取零件号:"..num)
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
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP288" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="740" top="414" right="840" bottom="446"/>
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
	if(SoftwareNumber ~= num  and SoftwareNumber1 ~= num)then
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
</Script><assessment no="10" name="DEP292" type="8" flags="97"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="延时50MS">
<Rect left="740" top="494" right="840" bottom="526"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="270" ActivityType="3" flags="0" name="写VIN">
<Rect left="890" top="414" right="990" bottom="446"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Line2Text Enable="1"/>
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
end </Script><assessment no="11" name="DEP293" type="8" flags="97"/>
</Activity>
<Activity id="271" ActivityType="3" flags="0" name="读编程时间">
<Rect left="1030" top="464" right="1130" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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

end</Script><assessment no="19" name="DEP2344" type="8" flags="97"/>
</Activity>
<Activity id="272" ActivityType="3" flags="0" name="比对VIN">
<Rect left="890" top="464" right="990" bottom="496"/>
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
end</Script><assessment no="18" name="DEP2186" type="8" flags="97"/>
</Activity>
<Activity id="273" ActivityType="3" flags="0" name="写编程时间">
<Rect left="1030" top="414" right="1130" bottom="446"/>
<Line1Text Enable="1" Text="发送时间"/>
<Line2Text Enable="1"/>
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

end</Script></Activity>
<Activity id="274" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1160" top="464" right="1260" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="275" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1270" top="414" right="1370" bottom="446"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA1
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
		engine.TestResult = 1;
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
end
</Script><assessment no="13" name="DEP296" type="8" flags="97"/>
</Activity>
<Activity id="276" ActivityType="3" flags="0" name="写配置码">
<Rect left="1160" top="414" right="1260" bottom="446"/>
<Line1Text Enable="1" Text="写配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>VariCoding = DString_VariCoding
engine.SetLineText(3,DString_VariCoding);
engine.println("配置码"..DString_VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0xF1 0xA1 VariCoding
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

end</Script><assessment no="12" name="DEP295" type="8" flags="97"/>
</Activity>
<Activity id="282" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="944" right="1456" bottom="976"/>
</Activity>
<Activity id="283" ActivityType="3" flags="0" name="写车型">
<Rect left="1390" top="414" right="1490" bottom="446"/>
<Line1Text Enable="1" Text="写入车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local carType = engine.CarType
engine.SetLineText(3,carType);

#COMM 0x2e 0xF1 0xA5 carType 0x00 0x00 0x00 0x00 0x00 0x00
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

end</Script><assessment no="25" name="DEP1183" type="8" flags="97"/>
</Activity>
<Activity id="329" ActivityType="3" flags="0" name="车型比对">
<Rect left="1390" top="464" right="1490" bottom="496"/>
<Line1Text Enable="1" Text="车型比对"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA5

if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(engine.CarType)));
        engine.println("EMS读取车型:"..num)
	if(engine.CarType ~= num)then
		engine.LastError = 1;
                engine.println("车型比对失败");
	else
		engine.LastError = 0;
                engine.println("车型比对成功");
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
engine.StatPoint = engine.CarType;</Script><assessment no="26" name="DEP1184" type="8" flags="97"/>
</Activity>
<Activity id="330" ActivityType="3" flags="0" name="清DTC">
<Rect left="400" top="214" right="500" bottom="246"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="331" ActivityType="3" flags="0" name="写配置码">
<Rect left="970" top="264" right="1070" bottom="296"/>
<Line1Text Enable="1" Text="写配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(3,DString_VariCoding);
engine.println("配置码"..DString_VariCoding);
#COMM 0x2e 0xF1 0xA1 hex2bin(DString_VariCoding)
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

end</Script><assessment no="12" name="DEP295" type="8" flags="97"/>
</Activity>
<Activity id="332" ActivityType="3" flags="0" name="清DTC">
<Rect left="740" top="944" right="840" bottom="976"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(200)
#COMM 0x14 0xFF 0xFF 0xFF
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

end</Script><assessment no="27" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="3" flags="0" name="确认车辆非点火状态">
<Rect left="740" top="574" right="840" bottom="606"/>
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
   engine.StatValue = "人工点击放弃：车辆处于非启动并上电状态";
else
end</Script><assessment no="28" name="DEP2514" type="8" flags="97"/>
</Activity>
<Activity id="334" ActivityType="3" flags="0" name="初始化变量">
<Rect left="740" top="654" right="840" bottom="686"/>
<Line1Text Enable="1" Text="！！！请熄火！！！"/>
<Line2Text Enable="1" Text="车辆要处于熄火并上电状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_2 = nil</Script></Activity>
<Activity id="335" ActivityType="3" flags="0" name="LoopEnd">
<Rect left="740" top="854" right="840" bottom="886"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="1289" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="724" right="1056" bottom="756"/>
</Activity>
<Activity id="1295" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="854" right="1056" bottom="886"/>
</Activity>
<Activity id="1296" ActivityType="3" flags="0" name="转速换算">
<Rect left="740" top="724" right="840" bottom="756"/>
<Script>#COMM 0x22 0x02 0x10
DVciResult_rpm = @0-;
vehicle_Rpm = string.sub(DVciResult_rpm,4,5);
vehicle_Rpm = LibGeneral.binStr2Int(vehicle_Rpm)
vehicle_Rpm = vehicle_Rpm * 0.25
engine.println("### 读取转速 vehicle_Rpm ##"..vehicle_Rpm);</Script></Activity>
<Activity id="1300" ActivityType="13" flags="0" name="车辆转速">
<Rect left="740" top="784" right="840" bottom="816"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="300"/>
<Parameter id="LowerLimit" value="0"/>
<Parameter id="MeasValue" value="vehicle_Rpm"/>
<Parameter id="RightViewText" value="&quot;转速&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;Rpm&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP1246" type="8" flags="97"/>
</Activity>
<Activity id="1302" ActivityType="3" flags="0" name="读怠速说明">
<Rect left="870" top="594" right="970" bottom="626"/>
<Script>
--发动起启动状态，会导致AT清故障码失败</Script></Activity>
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
<Transition StartId="123" EndId="199" type="0">
</Transition>
<Transition StartId="124" EndId="6" type="0">
</Transition>
<Transition StartId="125" EndId="196" type="4">
</Transition>
<Transition StartId="125" EndId="330" type="1">
<Expression>engine.WorkPlace ~= "FUN"</Expression></Transition>
<Transition StartId="125" EndId="124" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="196" EndId="2" type="5">
</Transition>
<Transition StartId="197" EndId="3" type="0">
</Transition>
<Transition StartId="199" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="2" type="0">
</Transition>
<Transition StartId="207" EndId="270" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="207" EndId="333" type="1">
<Expression>engine.WorkPlace == "FUN"</Expression></Transition>
<Transition StartId="270" EndId="272" type="0">
</Transition>
<Transition StartId="271" EndId="276" type="0">
</Transition>
<Transition StartId="272" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="271" type="0">
</Transition>
<Transition StartId="274" EndId="275" type="0">
</Transition>
<Transition StartId="275" EndId="283" type="0">
</Transition>
<Transition StartId="276" EndId="274" type="0">
</Transition>
<Transition StartId="282" EndId="332" type="0">
</Transition>
<Transition StartId="283" EndId="329" type="0">
</Transition>
<Transition StartId="329" EndId="282" type="0">
</Transition>
<Transition StartId="330" EndId="124" type="0">
</Transition>
<Transition StartId="332" EndId="2" type="0">
</Transition>
<Transition StartId="333" EndId="334" type="0">
</Transition>
<Transition StartId="334" EndId="1296" type="0">
</Transition>
<Transition StartId="335" EndId="1295" type="1">
<Expression>FinishFlag_2 ==  false</Expression></Transition>
<Transition StartId="335" EndId="332" type="0">
</Transition>
<Transition StartId="1289" EndId="1296" type="0">
</Transition>
<Transition StartId="1295" EndId="1289" type="0">
</Transition>
<Transition StartId="1296" EndId="1300" type="0">
</Transition>
<Transition StartId="1300" EndId="335" type="0">
</Transition>
</Transitions>
</Process>

