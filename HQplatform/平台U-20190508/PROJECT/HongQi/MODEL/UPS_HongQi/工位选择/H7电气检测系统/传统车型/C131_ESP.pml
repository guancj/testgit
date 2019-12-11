<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1120" pbltext="DEP63">
<Parameters>
<Variable id="C131_ESP_Brake_Light_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="C131_ESP_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ESP_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ESP_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ESP_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ESP_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ESP_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="128" right="228" bottom="32"/>
<Script>engine.println("EPS...");</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="484" top="678" right="584" bottom="710"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="车辆电子稳定系统">
<Rect left="129" top="61" right="229" bottom="93"/>
<TitleText Enable="1" Text="车辆电子稳定系统 (ESP)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="130" top="208" right="230" bottom="240"/>
<Line1Text Enable="1" Text="ESP 第一次清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3301" name="DEP65" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="检测失败">
<Rect left="370" top="513" right="470" bottom="545"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="切回默认会话，否则EPB会报故障">
<Rect left="578" top="562" right="678" bottom="594"/>
<Line1Text Enable="1" Text="返回默认会话"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x10 0x01
#DELAY 300</Script><assessment no="13" name="DEP1236" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="485" top="620" right="585" bottom="652"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="17" ActivityType="4" flags="0" name="路由节点">
<Rect left="520" top="562" right="552" bottom="594"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="连接ECU">
<Rect left="130" top="112" right="230" bottom="144"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="ESP 检测刹车灯信号开">
<Rect left="486" top="456" right="586" bottom="488"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="踩刹车踏板"/>
<Script>--#COMM 0x22 0x3F
#COMM 0x22 0xfd 0x01
if (@4==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="11" name="DEP484" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="ESP 检测刹车灯信号关">
<Rect left="486" top="510" right="586" bottom="542"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="松刹车踏板"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3F
#COMM 0x22 0xfd 0x01
if (@4==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.println(" engine.LastError=".. engine.LastError);
 engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="12" name="DEP485" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="切诊断">
<Rect left="131" top="254" right="231" bottom="286"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3302" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="131" top="304" right="231" bottom="336"/>
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
<Activity id="26" ActivityType="3" flags="0" name="发送key">
<Rect left="130" top="396" right="230" bottom="428"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
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
</Script><assessment no="3304" name="DEP67" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="13" flags="0" name="ESP计算">
<Rect left="130" top="351" right="230" bottom="383"/>
<FunctionRef id="sec_esp">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="519" top="402" right="551" bottom="434"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="比对零件号">
<Rect left="250" top="74" right="350" bottom="106"/>
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
end</Script><assessment no="1" name="DEP268" type="8" flags="105"/>
</Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="14" right="316" bottom="46"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="14" right="436" bottom="46"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="读软件号">
<Rect left="370" top="64" right="470" bottom="96"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then	
	if(DString_C131_Car_Tpye=="CH1CM29")then
		StandValue="10120000";
		DString1=hexstr(@3-@6);
        elseif (DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="07350100";
		DString1=hexstr(@3-@6);
        else
       
	StandValue="1012";
        DString1=hexstr(@3-@4);
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
        end      
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
</Script><assessment no="2" name="DEP269" type="8" flags="105"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="延时300MS">
<Rect left="370" top="134" right="470" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1020" top="74" right="1120" bottom="106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="092075";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=hexstr(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
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
end</Script><assessment no="3" name="DEP270" type="8" flags="105"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1020" top="134" right="1120" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="63" ActivityType="4" flags="0" name="路由节点">
<Rect left="1054" top="14" right="1086" bottom="46"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1650" top="74" right="1750" bottom="106"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP271" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="读VIN">
<Rect left="1650" top="134" right="1750" bottom="166"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	--DString1=bytesStr(@3-@19);
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
end</Script><assessment no="5" name="DEP272" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="日期读取">
<Rect left="1780" top="134" right="1880" bottom="166"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="7" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="发送时间">
<Rect left="1780" top="74" right="1880" bottom="106"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="1684" top="14" right="1716" bottom="46"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="2080" top="404" right="2180" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1900" top="134" right="2000" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="检查配置码">
<Rect left="2010" top="84" right="2110" bottom="116"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@4);
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
end</Script><assessment no="10" name="DEP275" type="8" flags="105"/>
</Activity>
<Activity id="88" ActivityType="3" flags="1" name="写配置码">
<Rect left="1900" top="84" right="2000" bottom="116"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP274" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="1934" top="14" right="1966" bottom="46"/>
</Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="1814" top="14" right="1846" bottom="46"/>
</Activity>
<Activity id="92" ActivityType="4" flags="0" name="路由节点">
<Rect left="2044" top="14" right="2076" bottom="46"/>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="通讯">
<Rect left="131" top="159" right="231" bottom="191"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3300" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="通讯失败">
<Rect left="17" top="159" right="117" bottom="191"/>
<Line1Text Enable="1" Text="ESP 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="95" ActivityType="4" flags="0" name="路由节点">
<Rect left="50" top="620" right="82" bottom="652"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="结束通讯">
<Rect left="19" top="111" right="119" bottom="143"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="清DTC">
<Rect left="1900" top="174" right="2000" bottom="206"/>
<Line1Text Enable="1" Text="ESP  第二次清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="33" name="DEP1059" type="8" flags="97"/>
</Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="605" top="487" right="637" bottom="519"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="检测失败">
<Rect left="366" top="456" right="466" bottom="488"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="2124" top="14" right="2156" bottom="46"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="混动车型">
<Rect left="1150" top="74" right="1250" bottom="106"/>
<Script></Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1150" top="124" right="1250" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="093497";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=bin2hex(@3-@5);
	engine.println("软件版本号:"..DString1);
	engine.SetLineText(3,DString1);
	--if("093497" == DString1) then  
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
end</Script><assessment no="3" name="DEP270" type="8" flags="105"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1150" top="184" right="1250" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="104" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="14" right="1216" bottom="46"/>
</Activity>
<Activity id="105" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="264" right="1346" bottom="296"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="混动车型">
<Rect left="500" top="64" right="600" bottom="96"/>
<Script></Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="读软件号">
<Rect left="500" top="134" right="600" bottom="166"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="07039913";
engine.SetLineText(2,StandValue);
engine.println("软件号标准值:"..StandValue);
if(@0==0x62)then
	--DString1=hexstr(@3-@4);
	DString1=bin2hex(@3-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("07039913" == DString1) then 
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
end</Script><assessment no="2" name="DEP269" type="8" flags="105"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="延时300MS">
<Rect left="500" top="184" right="600" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="109" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="14" right="566" bottom="46"/>
</Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="274" right="646" bottom="306"/>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="85" top="208" right="117" bottom="240"/>
</Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="451" right="196" bottom="483"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="改脸">
<Rect left="630" top="74" right="730" bottom="106"/>
<Script></Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="读软件号">
<Rect left="630" top="134" right="730" bottom="166"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
        if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="07340100";
		DString1=bin2hex(@3-@6);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="07350100";
		DString1=bin2hex(@3-@6);
	elseif(( DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"))then
		StandValue="0732";
		DString1=bin2hex(@3-@4);
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="1012";
                DString1=bin2hex(@3-@4);
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="1012";
                DString1=bin2hex(@3-@4);
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="1012";
                DString1=bin2hex(@3-@4);
	else
		StandValue="1012";
		DString1=bin2hex(@3-@4);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	--DString1=hexstr(@3-@4);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("07039913" == DString1) then 
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
end</Script><assessment no="2" name="DEP269" type="8" flags="105"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="延时300MS">
<Rect left="630" top="184" right="730" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="116" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="14" right="696" bottom="46"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="改脸">
<Rect left="1280" top="74" right="1380" bottom="106"/>
<Script></Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1280" top="124" right="1380" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="096746";
		DString1=bin2hex(@3-@5);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="096016";
		DString1=bin2hex(@3-@5);
	elseif(( DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"))then
		StandValue="092981";
                DString1=bin2hex(@3-@5);
	else
		StandValue="092075";
		DString1=bin2hex(@3-@5);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.println("软件版本号:"..DString1);
	engine.SetLineText(3,DString1);
	--if("093497" == DString1) then  
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
end
</Script><assessment no="3" name="DEP270" type="8" flags="105"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1280" top="184" right="1380" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="120" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="14" right="1346" bottom="46"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="19年型">
<Rect left="750" top="74" right="850" bottom="106"/>
<Script></Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="读软件号">
<Rect left="750" top="134" right="850" bottom="166"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	StandValue="10120000";
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=bin2hex(@3-@6);
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
end</Script><assessment no="2" name="DEP269" type="8" flags="105"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="延时300MS">
<Rect left="750" top="184" right="850" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="124" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="14" right="816" bottom="46"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="19年型">
<Rect left="1400" top="74" right="1500" bottom="106"/>
<Script></Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1400" top="124" right="1500" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="092075";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=hexstr(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
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
end</Script><assessment no="3" name="DEP270" type="8" flags="105"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1400" top="194" right="1500" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="1434" top="14" right="1466" bottom="46"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1410" top="314" right="1510" bottom="346"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue = "092075"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.println("软件版本号:"..DString1);
	engine.SetLineText(3,DString1);

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
end
</Script><assessment no="3" name="DEP270" type="8" flags="97"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="19年型V6">
<Rect left="1520" top="74" right="1620" bottom="106"/>
<Script></Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1520" top="124" right="1620" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="096016";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=hexstr(@3-@5);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
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
end</Script><assessment no="3" name="DEP270" type="8" flags="105"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1520" top="194" right="1620" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="133" ActivityType="4" flags="0" name="路由节点">
<Rect left="1554" top="14" right="1586" bottom="46"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="19年型_V6">
<Rect left="880" top="74" right="980" bottom="106"/>
<Script></Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="读软件号">
<Rect left="880" top="134" right="980" bottom="166"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	StandValue="07380000";
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=bin2hex(@3-@6);
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
end</Script><assessment no="2" name="DEP269" type="8" flags="105"/>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="延时300MS">
<Rect left="880" top="184" right="980" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="14" right="946" bottom="46"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="18" type="0">
</Transition>
<Transition StartId="3" EndId="23" type="1">
<Expression>VMTLOC == "TR2" or VMTLOC=="REP"</Expression></Transition>
<Transition StartId="3" EndId="111" type="0">
</Transition>
<Transition StartId="9" EndId="17" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="1" type="0">
</Transition>
<Transition StartId="17" EndId="12" type="1">
<Expression>VMTLOC == "TR2" or VMTLOC=="REP"</Expression></Transition>
<Transition StartId="17" EndId="13" type="0">
</Transition>
<Transition StartId="18" EndId="93" type="0">
</Transition>
<Transition StartId="20" EndId="99" type="4">
</Transition>
<Transition StartId="20" EndId="22" type="3">
</Transition>
<Transition StartId="22" EndId="17" type="3">
</Transition>
<Transition StartId="22" EndId="9" type="4">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="28" type="0">
</Transition>
<Transition StartId="26" EndId="112" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="30" EndId="20" type="1">
<Expression>C131_ESP_Brake_Light_Execute_Flag == true</Expression></Transition>
<Transition StartId="30" EndId="98" type="0">
</Transition>
<Transition StartId="35" EndId="41" type="0">
</Transition>
<Transition StartId="36" EndId="35" type="1">
<Expression>C131_ESP_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="36" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="52" type="1">
<Expression>C131_ESP_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="41" EndId="109" type="0">
</Transition>
<Transition StartId="52" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="110" type="0">
</Transition>
<Transition StartId="59" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="105" type="0">
</Transition>
<Transition StartId="63" EndId="59" type="1">
<Expression>C131_ESP_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="63" EndId="104" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="90" type="0">
</Transition>
<Transition StartId="66" EndId="89" type="0">
</Transition>
<Transition StartId="68" EndId="66" type="0">
</Transition>
<Transition StartId="69" EndId="64" type="1">
<Expression>C131_ESP_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="69" EndId="90" type="0">
</Transition>
<Transition StartId="84" EndId="30" type="0">
</Transition>
<Transition StartId="85" EndId="97" type="0">
</Transition>
<Transition StartId="86" EndId="100" type="0">
</Transition>
<Transition StartId="88" EndId="85" type="0">
</Transition>
<Transition StartId="89" EndId="88" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_ESP_WD_Execute_Flag== true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="89" EndId="92" type="0">
</Transition>
<Transition StartId="90" EndId="68" type="1">
<Expression>C131_ESP_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="90" EndId="89" type="0">
</Transition>
<Transition StartId="92" EndId="86" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_ESP_WD_Execute_Flag== true  or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="92" EndId="100" type="0">
</Transition>
<Transition StartId="93" EndId="3" type="3">
</Transition>
<Transition StartId="93" EndId="94" type="4">
</Transition>
<Transition StartId="94" EndId="96" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="5">
</Transition>
<Transition StartId="95" EndId="13" type="0">
</Transition>
<Transition StartId="96" EndId="18" type="0">
</Transition>
<Transition StartId="97" EndId="92" type="0">
</Transition>
<Transition StartId="98" EndId="17" type="0">
</Transition>
<Transition StartId="99" EndId="22" type="0">
</Transition>
<Transition StartId="100" EndId="84" type="0">
</Transition>
<Transition StartId="101" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="103" type="0">
</Transition>
<Transition StartId="103" EndId="105" type="0">
</Transition>
<Transition StartId="104" EndId="120" type="0">
</Transition>
<Transition StartId="104" EndId="101" type="1">
<Expression>C131_ESP_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="105" EndId="69" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="110" type="0">
</Transition>
<Transition StartId="109" EndId="116" type="0">
</Transition>
<Transition StartId="109" EndId="106" type="1">
<Expression>C131_ESP_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="110" EndId="63" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="36" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="110" type="0">
</Transition>
<Transition StartId="116" EndId="113" type="1">
<Expression>C131_ESP_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="116" EndId="124" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="105" type="0">
</Transition>
<Transition StartId="120" EndId="117" type="1">
<Expression>C131_ESP_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="120" EndId="128" type="0">
</Transition>
<Transition StartId="121" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="110" type="0">
</Transition>
<Transition StartId="124" EndId="137" type="0">
</Transition>
<Transition StartId="124" EndId="121" type="1">
<Expression>C131_ESP_SN_Execute_Flag == true and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="127" type="0">
</Transition>
<Transition StartId="127" EndId="105" type="0">
</Transition>
<Transition StartId="128" EndId="133" type="0">
</Transition>
<Transition StartId="128" EndId="125" type="1">
<Expression>C131_ESP_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="130" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="132" type="0">
</Transition>
<Transition StartId="132" EndId="105" type="0">
</Transition>
<Transition StartId="133" EndId="130" type="1">
<Expression>C131_ESP_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="133" EndId="69" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="110" type="0">
</Transition>
<Transition StartId="137" EndId="134" type="1">
<Expression>C131_ESP_SN_Execute_Flag == true and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="137" EndId="63" type="0">
</Transition>
</Transitions>
</Process>

