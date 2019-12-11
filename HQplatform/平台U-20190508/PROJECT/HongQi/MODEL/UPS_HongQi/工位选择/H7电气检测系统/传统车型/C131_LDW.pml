<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1115" pbltext="DEP12">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_LDW_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_LDW_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x72A" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x730" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect top="6" right="100" bottom="38"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1660" top="324" right="1760" bottom="356"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="前视(LDW)">
<Rect left="1" top="61" right="101" bottom="93"/>
<TitleText Enable="1" Text="前视(LDW)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="2" top="208" right="102" bottom="240"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>--#COMM 0x19 0x02 0x09
#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2701" name="DEP14" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="安全访问种子">
<Rect top="310" right="100" bottom="342"/>
<Strategy TotalTime="5" NokTime="5" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
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

end</Script><assessment no="2714" name="DEP16" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect top="423" right="100" bottom="455"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2715" name="DEP16" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ldw计算">
<Rect left="1" top="367" right="101" bottom="399"/>
<FunctionRef id="sec_acc_ldw">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="连接ECU">
<Rect left="2" top="114" right="102" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT

</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="比对零件号">
<Rect left="230" top="64" right="330" bottom="96"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
	if(string.len(DString_C131_Partnumber)==11) then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	else
	end
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	if (DString1==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="1" name="DEP314" type="8" flags="105"/>
</Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="3" right="296" bottom="35"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="读硬件号">
<Rect left="356" top="57" right="456" bottom="89"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@2-@17);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP315" type="8" flags="105"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="延时300MS">
<Rect left="356" top="108" right="456" bottom="140"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="23" ActivityType="4" flags="0" name="路由节点">
<Rect left="390" top="4" right="422" bottom="36"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="647" top="4" right="679" bottom="36"/>
</Activity>
<Activity id="25" ActivityType="4" flags="0" name="路由节点">
<Rect left="516" top="4" right="548" bottom="36"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="483" top="59" right="583" bottom="91"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@2-@17);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP316" type="8" flags="105"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="延时300MS">
<Rect left="482" top="110" right="582" bottom="142"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="读软件号">
<Rect left="613" top="58" right="713" bottom="90"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="0D0300070100";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=hexstr(@3-@8);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0D0300070100" == DString1) then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP317" type="8" flags="105"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="延时300MS">
<Rect left="613" top="109" right="713" bottom="141"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1100" top="64" right="1200" bottom="96"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="";
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
		engine.println("软件版本号标准值:"..StandValue);
		engine.SetLineText(3,DString1);
		DString1 = engine.GetResponseString(3,2+#StandValue);
		engine.println("软件版本号:"..DString1);
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
		engine.println("不比对软件版本号");
                
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP318" type="8" flags="105"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1100" top="114" right="1200" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="4" right="1166" bottom="36"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1220" top="64" right="1320" bottom="96"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP319" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1220" top="104" right="1320" bottom="136"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
end</Script><assessment no="7" name="DEP320" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="日期读取">
<Rect left="1340" top="114" right="1440" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="发送时间">
<Rect left="1340" top="64" right="1440" bottom="96"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="4" right="1286" bottom="36"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1660" top="264" right="1760" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1460" top="114" right="1560" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1580" top="54" right="1680" bottom="86"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="写配置码">
<Rect left="1460" top="54" right="1560" bottom="86"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP321" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="4" right="1526" bottom="36"/>
</Activity>
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="4" right="1406" bottom="36"/>
</Activity>
<Activity id="62" ActivityType="4" flags="0" name="路由节点">
<Rect left="1614" top="4" right="1646" bottom="36"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="切诊断">
<Rect top="261" right="100" bottom="293"/>
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

end</Script><assessment no="2702" name="DEP1084" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="通讯">
<Rect left="1" top="162" right="101" bottom="194"/>
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

end</Script><assessment no="2700" name="DEP13" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="通讯失败">
<Rect left="113" top="161" right="213" bottom="193"/>
<Line1Text Enable="1" Text="LDW 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="146" top="262" right="178" bottom="294"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="结束通讯">
<Rect left="117" top="117" right="217" bottom="149"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="4" right="1726" bottom="36"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="混动车型">
<Rect left="741" top="57" right="841" bottom="89"/>
<Script></Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="读软件号">
<Rect left="741" top="108" right="841" bottom="140"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="0D0300070100";
engine.SetLineText(2,StandValue);
engine.println("软件号标准值:"..StandValue);
if(@0==0x62)then
	DString1=hexstr(@3-@8);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0D0300070100" == DString1) then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="4" name="DEP317" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="延时300MS">
<Rect left="741" top="159" right="841" bottom="191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="72" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="4" right="806" bottom="36"/>
</Activity>
<Activity id="73" ActivityType="4" flags="0" name="路由节点">
<Rect left="908" top="224" right="940" bottom="256"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="改脸">
<Rect left="873" top="57" right="973" bottom="89"/>
<Script></Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="读软件号">
<Rect left="873" top="108" right="973" bottom="140"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="0D0300070100";
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="0D0300070100";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="0D0300070100";	--/O 1330710
	else
		StandValue="0D0300070100";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=hexstr(@3-@8);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0D0300070100" == DString1) then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="4" name="DEP317" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="延时300MS">
<Rect left="873" top="159" right="973" bottom="191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="910" top="4" right="942" bottom="36"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="19年型">
<Rect left="990" top="54" right="1090" bottom="86"/>
<Script></Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="读软件号">
<Rect left="990" top="104" right="1090" bottom="136"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="0D0300070100";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=hexstr(@3-@8);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0D0300070100" == DString1) then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP317" type="8" flags="105"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="延时300MS">
<Rect left="990" top="154" right="1090" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="81" ActivityType="4" flags="0" name="路由节点">
<Rect left="1024" top="4" right="1056" bottom="36"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="读软件号">
<Rect left="1000" top="284" right="1100" bottom="316"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94

if(@0==0x62)then
	StandValue="28429168";
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
		engine.println("软件号标准值:"..StandValue);
		DString1=hexstr(@3-@6);
		engine.SetLineText(3,DString1);
		engine.println("软件号:"..DString1);
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                       
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="4" name="DEP317" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="12" type="0">
</Transition>
<Transition StartId="4" EndId="63" type="0">
</Transition>
<Transition StartId="8" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="19" type="0">
</Transition>
<Transition StartId="11" EndId="10" type="0">
</Transition>
<Transition StartId="12" EndId="64" type="0">
</Transition>
<Transition StartId="18" EndId="23" type="0">
</Transition>
<Transition StartId="19" EndId="18" type="1">
<Expression>C131_LDW_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="23" type="0">
</Transition>
<Transition StartId="20" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="25" type="0">
</Transition>
<Transition StartId="23" EndId="20" type="1">
<Expression>C131_LDW_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="23" EndId="25" type="0">
</Transition>
<Transition StartId="24" EndId="35" type="1">
<Expression>C131_LDW_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="24" EndId="72" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="1">
<Expression>C131_LDW_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="25" EndId="24" type="0">
</Transition>
<Transition StartId="26" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="24" type="0">
</Transition>
<Transition StartId="35" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="73" type="0">
</Transition>
<Transition StartId="42" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="52" type="0">
</Transition>
<Transition StartId="46" EndId="42" type="1">
<Expression>C131_LDW_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="46" EndId="52" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="61" type="0">
</Transition>
<Transition StartId="49" EndId="60" type="0">
</Transition>
<Transition StartId="51" EndId="49" type="0">
</Transition>
<Transition StartId="52" EndId="47" type="1">
<Expression>C131_LDW_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="52" EndId="61" type="0">
</Transition>
<Transition StartId="55" EndId="2" type="0">
</Transition>
<Transition StartId="56" EndId="62" type="0">
</Transition>
<Transition StartId="57" EndId="68" type="0">
</Transition>
<Transition StartId="59" EndId="56" type="0">
</Transition>
<Transition StartId="60" EndId="59" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_LDW_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="60" EndId="62" type="0">
</Transition>
<Transition StartId="61" EndId="51" type="1">
<Expression>C131_LDW_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="61" EndId="60" type="0">
</Transition>
<Transition StartId="62" EndId="57" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_LDW_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="62" EndId="68" type="0">
</Transition>
<Transition StartId="63" EndId="8" type="0">
</Transition>
<Transition StartId="64" EndId="4" type="3">
</Transition>
<Transition StartId="64" EndId="65" type="4">
</Transition>
<Transition StartId="65" EndId="67" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="5">
</Transition>
<Transition StartId="66" EndId="55" type="0">
</Transition>
<Transition StartId="67" EndId="12" type="0">
</Transition>
<Transition StartId="68" EndId="55" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="73" type="0">
</Transition>
<Transition StartId="72" EndId="69" type="1">
<Expression>C131_LDW_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="72" EndId="77" type="0">
</Transition>
<Transition StartId="73" EndId="46" type="0">
</Transition>
<Transition StartId="74" EndId="75" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="73" type="0">
</Transition>
<Transition StartId="77" EndId="74" type="1">
<Expression>C131_LDW_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="77" EndId="81" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="73" type="0">
</Transition>
<Transition StartId="81" EndId="46" type="0">
</Transition>
<Transition StartId="81" EndId="78" type="1">
<Expression>C131_LDW_SN_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

