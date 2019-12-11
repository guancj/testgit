<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1237" pbltext="DEP813">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_MCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_MCU_PowerOff_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_ReO_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_IGBT_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_MG_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_MCU_SPEC_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="spec_data" type="8" dir="0" data="spec_data"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AA" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7CA" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="246" right="346" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="987" top="1011" right="1087" bottom="1043"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电机控制系统">
<Rect left="246" top="186" right="346" bottom="218"/>
<TitleText Enable="1" Text="电机控制系统（MCU）"/>
<Script>engine.println("SPEC_DATA:"..spec_data);</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="245" top="334" right="345" bottom="366"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP804" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="247" top="237" right="347" bottom="269"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="246" top="387" right="346" bottom="419"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP1103" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="245" top="436" right="345" bottom="468"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="247" top="539" right="347" bottom="571"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP805" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="384" top="201" right="484" bottom="233"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then 
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==11)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
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
end</Script><assessment no="4" name="DEP806" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="419" top="143" right="451" bottom="175"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="559" top="144" right="591" bottom="176"/>
</Activity>
<Activity id="15" ActivityType="3" flags="1" name="读软件号">
<Rect left="529" top="197" right="629" bottom="229"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13" or DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="1331C100";
        else
	        StandValue="1331C100";
        end
        DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
        engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	--if("13316101" == DString1) then 
	if(StandValue~="")then
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
		engine.println("不比对软件版本号");
	end  
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP807" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="524" top="245" right="624" bottom="277"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="668" top="195" right="768" bottom="227"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95

DString1=hexstr(@3-@18);
engine.println("软件版本号:"..DString1);
engine.SetLineText(3,DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="6" name="DEP808" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="667" top="246" right="767" bottom="278"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="701" top="143" right="733" bottom="175"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="801" top="201" right="901" bottom="233"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP809" type="8" flags="1"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="803" top="301" right="903" bottom="333"/>
<Line1Text Enable="1" Text="读VIN码"/>
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
end</Script><assessment no="8" name="DEP810" type="8" flags="1"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="日期读取">
<Rect left="964" top="298" right="1064" bottom="330"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="发送时间">
<Rect left="965" top="199" right="1065" bottom="231"/>
<Line1Text Enable="1" Text="发日期"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="9" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="832" top="143" right="864" bottom="175"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="清除四行">
<Rect left="1262" top="252" right="1362" bottom="284"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1132" top="253" right="1232" bottom="285"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1262" top="194" right="1362" bottom="226"/>
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
end</Script><assessment no="12" name="DEP812" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="写配置码">
<Rect left="1132" top="196" right="1232" bottom="228"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 str2hex(VariCoding,1) str2hex(VariCoding,3)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP811" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="1165" top="141" right="1197" bottom="173"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="1000" top="142" right="1032" bottom="174"/>
</Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="1474" top="140" right="1506" bottom="172"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="407" top="539" right="439" bottom="571"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="986" top="945" right="1086" bottom="977"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="延时300MS">
<Rect left="800" top="253" right="900" bottom="285"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="964" top="249" right="1064" bottom="281"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="39" ActivityType="5" flags="0" name="C131_HCU高压下电">
<Rect left="220" top="1802" right="320" bottom="1834"/>
<SubProcesses>
<SubProcess id="C131_HCU_HighVoltage_PowerOff">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="Write">
<Rect left="374" top="752" right="474" bottom="784"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="写 ResolverOffse"/>
<Script>--#COMM 0x2E 0x11 0x2A ? ? 

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
--engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="延时300MS">
<Rect left="375" top="802" right="475" bottom="834"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="Read">
<Rect left="375" top="852" right="475" bottom="884"/>
<Line1Text Enable="1" Text="读 ResolverOffset"/>
<Script>#COMM 0x22 0x11 0x2A 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="28" name="DEP268" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="ResolverOffset Information">
<Rect left="375" top="691" right="475" bottom="723"/>
<Script></Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时300MS">
<Rect left="609" top="810" right="709" bottom="842"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="Check IGBT temperature">
<Rect left="609" top="695" right="709" bottom="727"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="Read">
<Rect left="836" top="754" right="936" bottom="786"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="写 MG temperature"/>
<Script>#COMM 0x22 0x11 0x1A
if(@0==0x62)then
local StringResHex;
local DecValue;
--StringResHex= string.char(@3)
DecValue = @3*1-40;
engine.println("DecValue"..DecValue);
if (DecValue&lt;110) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.StatValue=DecValue;
engine.StatUpper=110;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="30" name="DEP1105" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="延时300MS">
<Rect left="837" top="807" right="937" bottom="839"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="Check MG temperature">
<Rect left="837" top="695" right="937" bottom="727"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="高压下电">
<Rect left="219" top="1752" right="319" bottom="1784"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="Read">
<Rect left="609" top="755" right="709" bottom="787"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 IGBT temperature"/>
<Script>#COMM 0x22 0x11 0x11 
if(@0==0x62)then
local StringResHex;
local DecValue;
--StringResHex= string.char(@3)
--engine.println("StringResHex"..StringResHex)
DecValue = @3*1 - 40;
engine.println("DecValue"..DecValue);
if (DecValue&lt;110) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.StatValue=DecValue;
engine.StatUpper=110;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="29" name="DEP1104" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="1021" top="627" right="1053" bottom="659"/>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="408" top="626" right="440" bottom="658"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="642" top="627" right="674" bottom="659"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="870" top="626" right="902" bottom="658"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="1687" right="286" bottom="1719"/>
</Activity>
<Activity id="61" ActivityType="13" flags="0" name="seedtokey">
<Rect left="246" top="489" right="346" bottom="521"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A79796C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="清DTC">
<Rect left="219" top="1960" right="319" bottom="1992"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="连接ECU">
<Rect left="221" top="1858" right="321" bottom="1890"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="切诊断">
<Rect left="220" top="2013" right="320" bottom="2045"/>
<Script>#COMM 0x10 0x03
</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="219" top="2062" right="319" bottom="2094"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="发送key">
<Rect left="218" top="2165" right="318" bottom="2197"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="67" ActivityType="13" flags="0" name="seedtokey">
<Rect left="219" top="2113" right="319" bottom="2145"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A79796C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1440" top="292" right="1540" bottom="324"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="写旋变角">
<Rect left="1440" top="250" right="1540" bottom="282"/>
<Line1Text Enable="1" Text="写旋变角"/>
<Script>engine.println("旋变角"..spec_112A);
if(spec_112A ~="")then
#COMM 0x2e 0x11 0x2A hex2bin(spec_112A)

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_112A;
end</Script><assessment no="31" name="DEP1135" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="读">
<Rect left="1440" top="336" right="1540" bottom="368"/>
<Line1Text Enable="1" Text="比对旋变角"/>
<Script>if(spec_112A ~="")then
#COMM 0x22 0x11 0x2A
	engine.println("旋变角标准值"..spec_112A);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@4);
		engine.println("读到旋变角:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_112A)) then
			engine.SetLineText(2,"比对成功");
			engine.println("比对成功");
			engine.LastError = 0;
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对旋变角失败");
			engine.println("比对旋变角败");
		end
		engine.StatValue= DString_Read_Config_Code_From_ECU;
		engine.StatPoint=spec_112A;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_112A;
end
</Script><assessment no="32" name="DEP1143" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="4" flags="0" name="路由节点">
<Rect left="1591" top="141" right="1623" bottom="173"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="通讯">
<Rect left="247" top="287" right="347" bottom="319"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP803" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="通讯失败">
<Rect left="124" top="287" right="224" bottom="319"/>
<Line1Text Enable="1" Text="MCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="158" top="944" right="190" bottom="976"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="通讯">
<Rect left="220" top="1910" right="320" bottom="1942"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
</Script><assessment no="13" name="DEP803" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="通讯失败">
<Rect left="88" top="1911" right="188" bottom="1943"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="结束通讯">
<Rect left="124" top="232" right="224" bottom="264"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="78" ActivityType="5" flags="0" name="C131_HCU高压下电">
<Rect left="124" top="133" right="224" bottom="165"/>
<SubProcesses>
<SubProcess id="C131_HCU_HighVoltage_PowerOff">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="高压下电">
<Rect left="246" top="74" right="346" bottom="106"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="80" ActivityType="4" flags="0" name="路由节点">
<Rect left="1296" top="140" right="1328" bottom="172"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="结束通讯">
<Rect left="89" top="1859" right="189" bottom="1891"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="123" top="1965" right="155" bottom="1997"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="提取特性数据">
<Rect left="1439" top="195" right="1539" bottom="227"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>spec_0105=hexstr(string.sub(spec_data,1,21))..string.sub(spec_data,22,145)..hexstr(string.sub(spec_data,146,146))..string.sub(spec_data,147,270)..hexstr(string.sub(spec_data,271,271))..string.sub(spec_data,272,395)..hexstr(string.sub(spec_data,396,396))..string.sub(spec_data,397,520)..hexstr(string.sub(spec_data,521,521))..string.sub(spec_data,522,645)..hexstr(string.sub(spec_data,646,646))..string.sub(spec_data,647,770)..hexstr(string.sub(spec_data,771,776));
print("spec_0105:"..spec_0105);

spec_0109=string.sub(spec_data,777,808);
print("spec_0109:"..spec_0109);

spec_010B=string.sub(spec_data,809,816);
print("spec_010B:"..spec_010B);

spec_112A="";
spec_112A=string.sub(spec_data,817,820);
print("spec_112A:"..spec_112A);

spec_0101=hexstr(string.sub(spec_data,821,841))..string.sub(spec_data,842,965)..hexstr(string.sub(spec_data,966,966))..string.sub(spec_data,967,1090)..hexstr(string.sub(spec_data,1091,1096));
print("spec_0101:"..spec_0101);


spec_0103=string.sub(spec_data,1097,1100);
print("spec_0103:"..spec_0103);</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="清DTC">
<Rect left="1440" top="386" right="1540" bottom="418"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP1223" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1442" top="432" right="1542" bottom="464"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="是否写MCU特性数据">
<Rect left="1440" top="73" right="1540" bottom="105"/>
<Line1Text Enable="1" Text="是否写MCU特性数据？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="1388" top="141" right="1420" bottom="173"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1558" top="538" right="1658" bottom="570"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="1392" top="197" right="1424" bottom="229"/>
</Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="1393" top="336" right="1425" bottom="368"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="延时300MS">
<Rect left="804" top="352" right="904" bottom="384"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="发送VIN">
<Rect left="804" top="402" right="904" bottom="434"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="98" name="DEP809" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="延时300MS">
<Rect left="807" top="445" right="907" bottom="477"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="读VIN">
<Rect left="807" top="495" right="907" bottom="527"/>
<Line1Text Enable="1" Text="读VIN码"/>
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
end</Script><assessment no="99" name="DEP810" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="79" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="72" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="61" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="1">
<Expression>C131_MCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_MCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="19" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="24" type="0">
</Transition>
<Transition StartId="19" EndId="17" type="1">
<Expression>C131_MCU_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="24" type="0">
</Transition>
<Transition StartId="20" EndId="37" type="0">
</Transition>
<Transition StartId="21" EndId="30" type="0">
</Transition>
<Transition StartId="21" EndId="92" type="4">
</Transition>
<Transition StartId="22" EndId="29" type="0">
</Transition>
<Transition StartId="23" EndId="38" type="0">
</Transition>
<Transition StartId="24" EndId="20" type="1">
<Expression>C131_MCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="25" EndId="87" type="0">
</Transition>
<Transition StartId="26" EndId="80" type="0">
</Transition>
<Transition StartId="27" EndId="25" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="1">
<Expression>C131_MCU_WD_Execute_Flag==true and DString_C131_VariCoding~="" and DString_C131_VariCoding~="MCU00_varicoding" and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="29" EndId="80" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_MCU_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="31" EndId="83" type="1">
<Expression>C131_MCU_SPEC_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or CarTNC_Is_Hrid(DString_C131_Car_Tpye))</Expression></Transition>
<Transition StartId="31" EndId="71" type="0">
</Transition>
<Transition StartId="35" EndId="57" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="39" EndId="63" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="0">
</Transition>
<Transition StartId="42" EndId="57" type="0">
</Transition>
<Transition StartId="43" EndId="40" type="0">
</Transition>
<Transition StartId="45" EndId="58" type="0">
</Transition>
<Transition StartId="47" EndId="53" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="54" type="0">
</Transition>
<Transition StartId="51" EndId="48" type="0">
</Transition>
<Transition StartId="52" EndId="39" type="0">
</Transition>
<Transition StartId="53" EndId="45" type="0">
</Transition>
<Transition StartId="54" EndId="36" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="56" EndId="43" type="1">
<Expression>C131_MCU_ReO_Execute_Flag == true</Expression></Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="57" EndId="47" type="1">
<Expression>C131_MCU_IGBT_Execute_Flag == true</Expression></Transition>
<Transition StartId="58" EndId="54" type="0">
</Transition>
<Transition StartId="58" EndId="51" type="1">
<Expression>C131_MCU_MG_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="52" type="1">
<Expression>C131_MCU_PowerOff_Execute_Flag == true</Expression></Transition>
<Transition StartId="61" EndId="8" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="63" EndId="75" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="66" type="0">
</Transition>
<Transition StartId="68" EndId="70" type="0">
</Transition>
<Transition StartId="69" EndId="68" type="0">
</Transition>
<Transition StartId="70" EndId="90" type="0">
</Transition>
<Transition StartId="71" EndId="88" type="0">
</Transition>
<Transition StartId="72" EndId="4" type="3">
</Transition>
<Transition StartId="72" EndId="73" type="4">
</Transition>
<Transition StartId="73" EndId="74" type="5">
</Transition>
<Transition StartId="73" EndId="77" type="0">
</Transition>
<Transition StartId="74" EndId="36" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="4">
</Transition>
<Transition StartId="75" EndId="62" type="3">
</Transition>
<Transition StartId="76" EndId="82" type="5">
</Transition>
<Transition StartId="76" EndId="81" type="0">
</Transition>
<Transition StartId="77" EndId="5" type="0">
</Transition>
<Transition StartId="78" EndId="3" type="0">
</Transition>
<Transition StartId="79" EndId="78" type="1">
<Expression>C131_MCU_PowerOff_Execute_Flag == true</Expression></Transition>
<Transition StartId="79" EndId="3" type="0">
</Transition>
<Transition StartId="80" EndId="27" type="1">
<Expression>(C131_MCU_WD_Execute_Flag==true or VMTLOC=="FIN") and DString_C131_VariCoding~="" and DString_C131_VariCoding~="MCU00_varicoding"</Expression></Transition>
<Transition StartId="80" EndId="87" type="0">
</Transition>
<Transition StartId="81" EndId="63" type="0">
</Transition>
<Transition StartId="83" EndId="69" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="86" EndId="31" type="0">
</Transition>
<Transition StartId="86" EndId="71" type="5">
</Transition>
<Transition StartId="87" EndId="31" type="0">
</Transition>
<Transition StartId="87" EndId="86" type="1">
<Expression>VMTLOC == "REP"</Expression></Transition>
<Transition StartId="88" EndId="35" type="0">
</Transition>
<Transition StartId="89" EndId="69" type="1">
<Expression>spec_112A~=""</Expression></Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="71" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="30" type="0">
</Transition>
</Transitions>
</Process>

