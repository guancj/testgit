<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1112" pbltext="DEP101">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_ACC_Motor_Speed_Ctrl_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ACC_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x729" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72F" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect top="74" right="100" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="2060" top="484" right="2160" bottom="516"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="巡航 （ACC）">
<Rect left="4" top="133" right="104" bottom="165"/>
<TitleText Enable="1" Text="巡航 （ACC）"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="2" top="297" right="102" bottom="329"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2801" name="DEP103" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="2060" top="424" right="2160" bottom="456"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="连接ECU">
<Rect left="5" top="203" right="105" bottom="235"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="切诊断">
<Rect left="1" top="351" right="101" bottom="383"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2802" name="DEP1102" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="安全访问种子">
<Rect top="409" right="100" bottom="441"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
--s2=@4
--s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2819" name="DEP105" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="发送key">
<Rect top="510" right="100" bottom="542"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2820" name="DEP106" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="比对零件号">
<Rect left="220" top="154" right="320" bottom="186"/>
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
--[[
	if(string.len(DString_C131_Partnumber)==11) then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	else
	end
        --]]
        DString_tmp=@3-;
        DString1 = string.sub(DString_tmp,1,string.len(DString_C131_Partnumber));
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
end</Script><assessment no="1" name="DEP418" type="8" flags="105"/>
</Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="104" right="286" bottom="136"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="读硬件号">
<Rect left="350" top="154" right="450" bottom="186"/>
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
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP419" type="8" flags="105"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="延时300MS">
<Rect left="350" top="204" right="450" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="104" right="416" bottom="136"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="104" right="686" bottom="136"/>
</Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="104" right="556" bottom="136"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="490" top="154" right="590" bottom="186"/>
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
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP420" type="8" flags="105"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时300MS">
<Rect left="490" top="204" right="590" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="读软件号">
<Rect left="620" top="154" right="720" bottom="186"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	--[[
	if(DString_C131_Partnumber == "3616105-0MK"  )then
		StandValue="060004";
		--if("060004" == DString1) then         
	elseif(DString_C131_Partnumber == "3616105-0ML")then
		StandValue="060000";
		--if("060000" == DString1) then   
	elseif(DString_C131_Partnumber == "3616105-0NH")then
		StandValue="060008";
		--if("060008" == DString1) then        
	else
		StandValue="";
	end
	]]--
	if(DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1AM42")then	--3616105-0MK
		StandValue="060004";
	elseif(DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1BM32")then	--3616105-0NH
		StandValue="060008";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue); 
	DString1=hexstr(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
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
</Script><assessment no="4" name="DEP421" type="8" flags="105"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="延时300MS">
<Rect left="620" top="204" right="720" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1300" top="154" right="1400" bottom="186"/>
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
end</Script><assessment no="5" name="DEP422" type="8" flags="97"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1300" top="204" right="1400" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="63" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="104" right="1366" bottom="136"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1460" top="154" right="1560" bottom="186"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP423" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1460" top="204" right="1560" bottom="236"/>
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
end</Script><assessment no="7" name="DEP424" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="日期读取">
<Rect left="1580" top="204" right="1680" bottom="236"/>
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
<Activity id="68" ActivityType="3" flags="0" name="发送时间">
<Rect left="1580" top="154" right="1680" bottom="186"/>
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
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="104" right="1526" bottom="136"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1820" top="204" right="1920" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1700" top="204" right="1800" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1820" top="154" right="1920" bottom="186"/>
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


</Script><assessment no="11" name="DEP426" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="写配置码">
<Rect left="1700" top="154" right="1800" bottom="186"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP425" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="104" right="1766" bottom="136"/>
</Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="1614" top="104" right="1646" bottom="136"/>
</Activity>
<Activity id="79" ActivityType="4" flags="0" name="路由节点">
<Rect left="1844" top="104" right="1876" bottom="136"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="ACC 写使能">
<Rect left="1960" top="154" right="2060" bottom="186"/>
<Line1Text Enable="1" Text="ACC 写使能"/>
<Script>#COMM 0x2E 0xF1 0xA0 0x01 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP427" type="8" flags="97"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="延时100ms">
<Rect left="1960" top="204" right="2060" bottom="236"/>
<Script>#DELAY 100</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="ACC 读使能">
<Rect left="1960" top="264" right="2060" bottom="296"/>
<Line1Text Enable="1" Text="ACC 读使能"/>
<Script>#COMM 0x22 0xF1 0xA0

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP1114" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="13" flags="0" name="sec_acc_ldw">
<Rect left="1" top="458" right="101" bottom="490"/>
<FunctionRef id="sec_acc_ldw">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="通讯">
<Rect left="2" top="248" right="102" bottom="280"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2812" name="DEP102" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="通讯失败">
<Rect left="116" top="247" right="216" bottom="279"/>
<Line1Text Enable="1" Text="ACC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="86" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="424" right="186" bottom="456"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="结束通讯">
<Rect left="115" top="200" right="215" bottom="232"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="88" ActivityType="4" flags="0" name="路由节点">
<Rect left="1994" top="104" right="2026" bottom="136"/>
</Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="2094" top="104" right="2126" bottom="136"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="混动车型">
<Rect left="750" top="154" right="850" bottom="186"/>
<Script></Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="读软件号">
<Rect left="750" top="204" right="850" bottom="236"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="020015";
engine.SetLineText(2,StandValue);
engine.println("软件号标准值:"..StandValue); 
if(@0==0x62)then
	DString1=bin2hex(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0100150B1E00" == DString1) then
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

</Script><assessment no="4" name="DEP421" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="延时300MS">
<Rect left="750" top="254" right="850" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="93" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="104" right="816" bottom="136"/>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="404" right="1006" bottom="436"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="改脸">
<Rect left="870" top="154" right="970" bottom="186"/>
<Script></Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="读软件号">
<Rect left="870" top="204" right="970" bottom="236"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="020096";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="060008";
        elseif(DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17")then
		StandValue="04001C";
        elseif(DString_C131_Car_Tpye=="CH1BM34" or DString_C131_Car_Tpye=="CH1CM31")then
		StandValue="060008";
        elseif(DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="060004";
	elseif(DString_C131_Car_Tpye=="CH1BM35")then
		StandValue="060008";
	elseif(DString_C131_Car_Tpye=="CH1CM33")then
		StandValue="060008";
	else
		StandValue="060004";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue); 
	DString1=bin2hex(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("0100150B1E00" == DString1) then
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
end</Script><assessment no="4" name="DEP421" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="延时300MS">
<Rect left="870" top="254" right="970" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="104" right="936" bottom="136"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="19年型">
<Rect left="1000" top="154" right="1100" bottom="186"/>
<Script></Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="读软件号">
<Rect left="1000" top="204" right="1100" bottom="236"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	StandValue="060004";
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue); 
	DString1=bin2hex(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);

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
end</Script><assessment no="4" name="DEP421" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1000" top="254" right="1100" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="104" right="1066" bottom="136"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="19年型V6">
<Rect left="1140" top="154" right="1240" bottom="186"/>
<Script></Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="读软件号">
<Rect left="1140" top="204" right="1240" bottom="236"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	StandValue="060008";
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue); 
	DString1=bin2hex(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);

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
end</Script><assessment no="4" name="DEP421" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1140" top="254" right="1240" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="104" right="1206" bottom="136"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="22" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="19" EndId="2" type="0">
</Transition>
<Transition StartId="22" EndId="84" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="83" type="0">
</Transition>
<Transition StartId="27" EndId="36" type="0">
</Transition>
<Transition StartId="35" EndId="40" type="0">
</Transition>
<Transition StartId="36" EndId="40" type="0">
</Transition>
<Transition StartId="36" EndId="35" type="1">
<Expression>C131_ACC_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="37" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="42" type="0">
</Transition>
<Transition StartId="40" EndId="37" type="1">
<Expression>C131_ACC_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="40" EndId="42" type="0">
</Transition>
<Transition StartId="41" EndId="52" type="1">
<Expression>C131_ACC_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)  and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="41" EndId="93" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="1">
<Expression>C131_ACC_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="42" EndId="41" type="0">
</Transition>
<Transition StartId="43" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="41" type="0">
</Transition>
<Transition StartId="52" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="94" type="0">
</Transition>
<Transition StartId="59" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="69" type="0">
</Transition>
<Transition StartId="63" EndId="59" type="1">
<Expression>C131_ACC_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="63" EndId="69" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="78" type="0">
</Transition>
<Transition StartId="66" EndId="77" type="0">
</Transition>
<Transition StartId="68" EndId="66" type="0">
</Transition>
<Transition StartId="69" EndId="64" type="1">
<Expression>C131_ACC_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="69" EndId="78" type="0">
</Transition>
<Transition StartId="73" EndId="79" type="0">
</Transition>
<Transition StartId="74" EndId="72" type="0">
</Transition>
<Transition StartId="76" EndId="73" type="0">
</Transition>
<Transition StartId="77" EndId="76" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_ACC_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="77" EndId="79" type="0">
</Transition>
<Transition StartId="78" EndId="68" type="1">
<Expression>C131_ACC_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="78" EndId="77" type="0">
</Transition>
<Transition StartId="79" EndId="74" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_ACC_WD_Execute_Flag == true or VMTLOC=="FIN")) </Expression></Transition>
<Transition StartId="79" EndId="88" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="89" type="0">
</Transition>
<Transition StartId="83" EndId="27" type="0">
</Transition>
<Transition StartId="84" EndId="4" type="3">
</Transition>
<Transition StartId="84" EndId="85" type="4">
</Transition>
<Transition StartId="85" EndId="87" type="0">
</Transition>
<Transition StartId="85" EndId="86" type="5">
</Transition>
<Transition StartId="86" EndId="19" type="0">
</Transition>
<Transition StartId="87" EndId="22" type="0">
</Transition>
<Transition StartId="88" EndId="72" type="0">
</Transition>
<Transition StartId="88" EndId="80" type="1">
<Expression>VMTLOC=="FUN"</Expression></Transition>
<Transition StartId="88" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="19" type="0">
</Transition>
<Transition StartId="90" EndId="91" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="94" type="0">
</Transition>
<Transition StartId="93" EndId="90" type="1">
<Expression>C131_ACC_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="93" EndId="98" type="0">
</Transition>
<Transition StartId="94" EndId="63" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="94" type="0">
</Transition>
<Transition StartId="98" EndId="95" type="1">
<Expression>C131_ACC_SN_Execute_Flag == true and  LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="98" EndId="102" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="94" type="0">
</Transition>
<Transition StartId="102" EndId="106" type="0">
</Transition>
<Transition StartId="102" EndId="99" type="1">
<Expression>C131_ACC_SN_Execute_Flag == true and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="94" type="0">
</Transition>
<Transition StartId="106" EndId="103" type="1">
<Expression>C131_ACC_SN_Execute_Flag == true and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="106" EndId="63" type="0">
</Transition>
</Transitions>
</Process>

