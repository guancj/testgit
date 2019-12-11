<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1143" pbltext="DEP869">
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
<Variable id="CAN_SND_ID" type="3" data="0x72b" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X731" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="132" right="232" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1280" top="564" right="1380" bottom="596"/>
<Script>#STOPCOMM
</Script><TitleText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="BSD 控制系统">
<Rect left="132" top="54" right="232" bottom="86"/>
<TitleText Enable="1" Text="BSD 系统（BSD）"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="130" top="261" right="230" bottom="293"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP871" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="130" top="160" right="230" bottom="192"/>
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
<Rect left="131" top="314" right="231" bottom="346"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP1112" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="130" top="363" right="230" bottom="395"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3303" name="DEP66" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="130" top="460" right="230" bottom="492"/>
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
</Script><assessment no="3" name="DEP872" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="270" top="114" right="370" bottom="146"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Script>--#COMM 0x22 0xF1 0x87
#COMM 0x22 0x01 0x87
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
end</Script><assessment no="4" name="DEP873" type="8" flags="105"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="64" right="336" bottom="96"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="444" top="64" right="476" bottom="96"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读软件号">
<Rect left="410" top="114" right="510" bottom="146"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP874" type="8" flags="105"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="410" top="164" right="510" bottom="196"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="550" top="174" right="650" bottom="206"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13")then
		StandValue="S101_27";
	elseif(DString_C131_Car_Tpye=="CH1JM11")then
		StandValue="S101_27";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="S101_31";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="S101_31";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="S101_31";
	elseif(LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))then
		StandValue="S101_31";
	else
		StandValue="S101_31";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	--DString1=bin2hex(@3-@22);
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
	DString1=string.char(@8,@9,@10,@11,@12,@13,@14);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("47312E3920543030315F303520543030315F3035" == DString1) then 
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
end</Script><assessment no="6" name="DEP875" type="8" flags="105"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="550" top="224" right="650" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="64" right="616" bottom="96"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="730" top="124" right="830" bottom="156"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP876" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="730" top="224" right="830" bottom="256"/>
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
end</Script><assessment no="8" name="DEP877" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="日期读取">
<Rect left="890" top="224" right="990" bottom="256"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="发送时间">
<Rect left="890" top="124" right="990" bottom="156"/>
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
<Rect left="764" top="64" right="796" bottom="96"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1060" top="164" right="1160" bottom="196"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1170" top="124" right="1270" bottom="156"/>
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
end</Script><assessment no="12" name="DEP878" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="写配置码">
<Rect left="1060" top="114" right="1160" bottom="146"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 str2hex(VariCoding,1) str2hex(VariCoding,3)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP879" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="1094" top="64" right="1126" bottom="96"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="64" right="956" bottom="96"/>
</Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="1204" top="64" right="1236" bottom="96"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1280" top="504" right="1380" bottom="536"/>
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
<Rect left="730" top="174" right="830" bottom="206"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="890" top="174" right="990" bottom="206"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="56" ActivityType="13" flags="0" name="seedtokey">
<Rect left="131" top="412" right="231" bottom="444"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0xD3F102E4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="通讯">
<Rect left="129" top="210" right="229" bottom="242"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6" top="211" right="106" bottom="243"/>
<Line1Text Enable="1" Text="BSD 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="结束通讯">
<Rect left="6" top="160" right="106" bottom="192"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="64" right="1346" bottom="96"/>
</Activity>
<Activity id="62" ActivityType="4" flags="0" name="路由节点">
<Rect left="40" top="499" right="72" bottom="531"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="改脸">
<Rect left="550" top="114" right="650" bottom="146"/>
<Script></Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="4008">
<Rect left="1210" top="284" right="1310" bottom="316"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>--vin=DString_Write_VIN;
--engine.SetLineText(3,vin);
--#COMM 0x2E 0xF1 0x90 vin
#COMM 0x31 0x01 0x40 0x08 0x02


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP876" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="57" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="56" type="0">
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
<Transition StartId="19" EndId="63" type="1">
<Expression>C131_MCU_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="24" type="0">
</Transition>
<Transition StartId="20" EndId="37" type="0">
</Transition>
<Transition StartId="21" EndId="30" type="0">
</Transition>
<Transition StartId="22" EndId="29" type="0">
</Transition>
<Transition StartId="23" EndId="38" type="0">
</Transition>
<Transition StartId="24" EndId="20" type="1">
<Expression>C131_MCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="26" EndId="31" type="0">
</Transition>
<Transition StartId="27" EndId="61" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="1">
<Expression>DString_C131_VariCoding~="" and DString_C131_VariCoding~="BSD00_varicoding" and C131_BSD_WD_Execute_Flag==true and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_MCU_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="31" EndId="27" type="1">
<Expression>(DString_C131_VariCoding~="" and DString_C131_VariCoding~="BSD00_varicoding" and (C131_BSD_WD_Execute_Flag==true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="31" EndId="61" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="56" EndId="8" type="0">
</Transition>
<Transition StartId="57" EndId="4" type="3">
</Transition>
<Transition StartId="57" EndId="58" type="4">
</Transition>
<Transition StartId="58" EndId="62" type="5">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="5" type="0">
</Transition>
<Transition StartId="61" EndId="36" type="0">
</Transition>
<Transition StartId="62" EndId="36" type="0">
</Transition>
<Transition StartId="63" EndId="17" type="0">
</Transition>
</Transitions>
</Process>

