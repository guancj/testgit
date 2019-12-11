<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1128" pbltext="DEP620">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_PDCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Check_Mirror_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Check_The_Turn_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Check_The_Door_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Check_The_Door_Window_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Check_The_Switches_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DDCU_Check_Central_Lock_Switch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Window_Initialization_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDCU_Window_Learning_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75A" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77A" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="156" right="256" bottom="32"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="518" top="3629" right="618" bottom="3661"/>
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
<Activity id="2" ActivityType="3" flags="0" name="乘客门检测">
<Rect left="156" top="58" right="256" bottom="90"/>
<TitleText Enable="1" Text="乘客门检测(PDCU)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="158" top="201" right="258" bottom="233"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2813" name="DEP115" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="519" top="3573" right="619" bottom="3605"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="连接ECU">
<Rect left="156" top="105" right="256" bottom="137"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="切诊断">
<Rect left="157" top="250" right="257" bottom="282"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2816" name="DEP1119" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="157" top="300" right="257" bottom="332"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2814" name="DEP117" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="发送key">
<Rect left="157" top="395" right="257" bottom="427"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2815" name="DEP118" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="13" flags="0" name="计算">
<Rect left="157" top="347" right="257" bottom="379"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FBDCEA0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="比对零件号">
<Rect left="274" top="57" right="374" bottom="89"/>
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
        if(DString_C131_Car_Tpye == "CH1GM30")then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
	else
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);             
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
end</Script><assessment no="1" name="DEP621" type="8" flags="105"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="309" top="4" right="341" bottom="36"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="读硬件号">
<Rect left="399" top="55" right="499" bottom="87"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP622" type="8" flags="105"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300MS">
<Rect left="399" top="104" right="499" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="27" ActivityType="4" flags="0" name="路由节点">
<Rect left="433" top="4" right="465" bottom="36"/>
</Activity>
<Activity id="28" ActivityType="4" flags="0" name="路由节点">
<Rect left="573" top="4" right="605" bottom="36"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="540" top="52" right="640" bottom="84"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP623" type="8" flags="105"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="延时300MS">
<Rect left="539" top="102" right="639" bottom="134"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="读软件号">
<Rect left="668" top="53" right="768" bottom="85"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP624" type="8" flags="105"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="延时300MS">
<Rect left="668" top="103" right="768" bottom="135"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="797" top="55" right="897" bottom="87"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="4.10";
		--if("4.10" == DString1) then
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.10";
		--if("2.10" == DString1) then  
	else
		StandValue="2.10";
		--if("2.10" == DString1)then  
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
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
end

                                                          


</Script><assessment no="5" name="DEP629" type="8" flags="105"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="延时300MS">
<Rect left="798" top="105" right="898" bottom="137"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="832" top="4" right="864" bottom="36"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1310" top="54" right="1410" bottom="86"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP625" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1310" top="104" right="1410" bottom="136"/>
<Line1Text Enable="1" Text="比对VIN"/>
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
end</Script><assessment no="7" name="DEP626" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="日期读取">
<Rect left="1420" top="104" right="1520" bottom="136"/>
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
<Activity id="39" ActivityType="3" flags="0" name="发送时间">
<Rect left="1420" top="54" right="1520" bottom="86"/>
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
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="1344" top="4" right="1376" bottom="36"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1750" top="384" right="1850" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1540" top="104" right="1640" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1650" top="54" right="1750" bottom="86"/>
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
</Script><assessment no="11" name="DEP305" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="写配置码">
<Rect left="1540" top="54" right="1640" bottom="86"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP304" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="4" right="1606" bottom="36"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="4" right="1486" bottom="36"/>
</Activity>
<Activity id="47" ActivityType="4" flags="0" name="路由节点">
<Rect left="1684" top="4" right="1716" bottom="36"/>
</Activity>
<Activity id="48" ActivityType="4" flags="0" name="路由节点">
<Rect left="701" top="3" right="733" bottom="35"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="自动测试">
<Rect left="503" top="442" right="603" bottom="474"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴增加"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x01
#DELAY 2000
</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="乘客门倒车镜X轴增加">
<Rect left="503" top="490" right="603" bottom="522"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP768" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="乘客门倒车镜复位">
<Rect left="504" top="539" right="604" bottom="571"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x00
</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="自动测试">
<Rect left="505" top="588" right="605" bottom="620"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴减少"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x02
#DELAY 2000
</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="乘客门倒车镜X轴减少">
<Rect left="505" top="634" right="605" bottom="666"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP769" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="乘客门倒车镜复位">
<Rect left="506" top="681" right="606" bottom="713"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x00
</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="自动测试">
<Rect left="507" top="730" right="607" bottom="762"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴增加"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x03
#DELAY 2000
</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="乘客门倒车镜Y轴增加">
<Rect left="506" top="777" right="606" bottom="809"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP770" type="8" flags="97"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="乘客门倒车镜复位">
<Rect left="507" top="827" right="607" bottom="859"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x00
</Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="自动测试">
<Rect left="507" top="874" right="607" bottom="906"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴减少"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x04
#DELAY 2000
</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="乘客门倒车镜Y轴减少">
<Rect left="508" top="924" right="608" bottom="956"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP771" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="乘客门倒车镜复位">
<Rect left="509" top="971" right="609" bottom="1003"/>
<Strategy NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="司机门倒车镜复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0C 0x03 0x00
</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="510" top="1019" right="610" bottom="1051"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0C 0x00
</Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="检测失败">
<Rect left="390" top="491" right="490" bottom="523"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="检测失败">
<Rect left="393" top="635" right="493" bottom="667"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="检测失败">
<Rect left="392" top="778" right="492" bottom="810"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="检测失败">
<Rect left="394" top="925" right="494" bottom="957"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="自动测试">
<Rect left="511" top="1068" right="611" bottom="1100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜开始加热"/>
<Script>#COMM  0x2F 0x02 0x0E 0x03 0x01
</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="乘客门倒车镜开始加热">
<Rect left="512" top="1116" right="612" bottom="1148"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x21
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  --engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP772" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="自动测试">
<Rect left="513" top="1165" right="613" bottom="1197"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="乘客门倒车镜停止加热"/>
<Script>#COMM 0x2F 0x02 0x0E 0x03 0x00</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="乘客门倒车镜停止加热">
<Rect left="514" top="1215" right="614" bottom="1247"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x21
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  --engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP773" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="Mirror_ReturnControlToECU">
<Rect left="515" top="1263" right="615" bottom="1295"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2F 0x02 0x0E 0x00
--#COMM 0x2F 0x02 0x0D 0x00</Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="检测失败">
<Rect left="399" top="1117" right="499" bottom="1149"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="检测失败">
<Rect left="402" top="1216" right="502" bottom="1248"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="自动测试">
<Rect left="514" top="1375" right="614" bottom="1407"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门转向灯开启"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0A 0x03 0x01</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="乘客门转向灯开启">
<Rect left="515" top="1422" right="615" bottom="1454"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x1E
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP774" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="乘客门转向灯关闭">
<Rect left="515" top="1517" right="615" bottom="1549"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x1E
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP775" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="自动测试">
<Rect left="515" top="1469" right="615" bottom="1501"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门转向灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0A 0x03 0x00</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="Turn_lights_ReturnControlToECU">
<Rect left="515" top="1562" right="615" bottom="1594"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0A 0x00</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="检测失败">
<Rect left="402" top="1422" right="502" bottom="1454"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="检测失败">
<Rect left="402" top="1518" right="502" bottom="1550"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="640" top="820" right="672" bottom="852"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="自动测试">
<Rect left="516" top="1672" right="616" bottom="1704"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门门灯打开"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0B 0x03 0x01</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="乘客门门灯打开">
<Rect left="516" top="1718" right="616" bottom="1750"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x23
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP776" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="自动测试">
<Rect left="517" top="1766" right="617" bottom="1798"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门门灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0B 0x03 0x00</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="乘客门门灯关闭">
<Rect left="517" top="1815" right="617" bottom="1847"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x23
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP777" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="检测失败">
<Rect left="404" top="1719" right="504" bottom="1751"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="检测失败">
<Rect left="404" top="1815" right="504" bottom="1847"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="Door_lights_ReturnControlToECU">
<Rect left="518" top="1864" right="618" bottom="1896"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门门灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0B 0x00</Script></Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="629" top="1457" right="661" bottom="1489"/>
</Activity>
<Activity id="91" ActivityType="4" flags="0" name="路由节点">
<Rect left="548" top="1313" right="580" bottom="1345"/>
</Activity>
<Activity id="92" ActivityType="4" flags="0" name="路由节点">
<Rect left="550" top="1611" right="582" bottom="1643"/>
</Activity>
<Activity id="93" ActivityType="4" flags="0" name="路由节点">
<Rect left="551" top="1912" right="583" bottom="1944"/>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="630" top="1762" right="662" bottom="1794"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="自动测试">
<Rect left="520" top="1969" right="620" bottom="2001"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门玻璃降"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x02
#DELAY 1000</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="乘客门玻璃降">
<Rect left="519" top="2022" right="619" bottom="2054"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x1D
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP778" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="522" top="2066" right="622" bottom="2098"/>
<Line1Text Enable="1" Text="司机门玻璃停止下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x00
</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="自动测试">
<Rect left="522" top="2112" right="622" bottom="2144"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门玻璃升"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x01
#DELAY 1000</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="乘客门玻璃升">
<Rect left="522" top="2158" right="622" bottom="2190"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x1D
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP779" type="8" flags="97"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="Window_up_stop">
<Rect left="523" top="2204" right="623" bottom="2236"/>
<Line1Text Enable="1" Text="司机门玻璃停止下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x00
</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="523" top="2252" right="623" bottom="2284"/>
<Line1Text Enable="1" Text="司机门玻璃停止下降"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x00
</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="检测失败">
<Rect left="407" top="2021" right="507" bottom="2053"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="检测失败">
<Rect left="410" top="2159" right="510" bottom="2191"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="104" ActivityType="4" flags="0" name="路由节点">
<Rect left="551" top="2984" right="583" bottom="3016"/>
</Activity>
<Activity id="105" ActivityType="4" flags="0" name="路由节点">
<Rect left="637" top="2100" right="669" bottom="2132"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="手动自学习">
<Rect left="517" top="3039" right="617" bottom="3071"/>
<Strategy NokTime="0" RetryTimeOut="60000"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="#L=自动完成上升、下降、再上升的循环#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPOK");
   engine.LastError = 0;
   engine.println("人工操作点击确定！");  
engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.println("人工操作点击放弃！");    
engine.StatValue="人工操作点击放弃！";
else
end</Script><assessment no="44" name="DEP1118" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="自动测试">
<Rect left="520" top="3288" right="620" bottom="3320"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="乘客门玻璃升 第一次"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="24" name="DEP779" type="8" flags="97"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="乘客门玻璃升 第一次">
<Rect left="520" top="3332" right="620" bottom="3364"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x1D
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="检测失败">
<Rect left="405" top="3194" right="505" bottom="3226"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="521" top="3241" right="621" bottom="3273"/>
<Line1Text Enable="1" Text="司机门玻璃停止上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="630" top="3038" right="662" bottom="3070"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="检测失败">
<Rect left="406" top="3334" right="506" bottom="3366"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="Window_up_stop">
<Rect left="520" top="3383" right="620" bottom="3415"/>
<Line1Text Enable="1" Text="司机门玻璃停止上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="520" top="3431" right="620" bottom="3463"/>
<Line1Text Enable="1" Text="司机门玻璃停止上升"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x00
#DELAY 1000</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="读PDCU状态">
<Rect left="519" top="3525" right="619" bottom="3557"/>
<Line1Text Enable="1" Text="读DDCU状态"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x1D


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP630" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="4" flags="0" name="路由节点">
<Rect left="640" top="3278" right="672" bottom="3310"/>
</Activity>
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="552" top="3088" right="584" bottom="3120"/>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="537" top="381" right="569" bottom="413"/>
</Activity>
<Activity id="123" ActivityType="4" flags="0" name="路由节点">
<Rect left="558" top="2302" right="590" bottom="2334"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="手动测试">
<Rect left="523" top="2363" right="623" bottom="2395"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="乘客门倒车镜X轴增加">
<Rect left="522" top="2412" right="622" bottom="2444"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP768" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="检测失败">
<Rect left="410" top="2412" right="510" bottom="2444"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="手动测试">
<Rect left="521" top="2460" right="621" bottom="2492"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜X轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="乘客门倒车镜X轴减少">
<Rect left="520" top="2505" right="620" bottom="2537"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP769" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="检测失败">
<Rect left="407" top="2506" right="507" bottom="2538"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="130" ActivityType="3" flags="0" name="手动测试">
<Rect left="519" top="2551" right="619" bottom="2583"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴增加"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="乘客门倒车镜Y轴增加">
<Rect left="519" top="2597" right="619" bottom="2629"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP770" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="检测失败">
<Rect left="405" top="2598" right="505" bottom="2630"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="手动测试">
<Rect left="519" top="2642" right="619" bottom="2674"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门倒车镜Y轴减少"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="乘客门倒车镜Y轴减少">
<Rect left="519" top="2690" right="619" bottom="2722"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x20
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP771" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="检测失败">
<Rect left="405" top="2691" right="505" bottom="2723"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="2742" right="586" bottom="2774"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="手动测试">
<Rect left="519" top="2799" right="619" bottom="2831"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门中控门锁 锁定"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="乘客门中控门锁 锁定">
<Rect left="518" top="2845" right="618" bottom="2877"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x22
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP783" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="检测失败">
<Rect left="404" top="2845" right="504" bottom="2877"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="手动测试">
<Rect left="517" top="2892" right="617" bottom="2924"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="乘客门中控门锁 解锁"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="乘客门中控门锁 解锁">
<Rect left="517" top="2939" right="617" bottom="2971"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x22
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="40" name="DEP784" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="检测失败">
<Rect left="404" top="2938" right="504" bottom="2970"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="638" top="2527" right="670" bottom="2559"/>
</Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="633" top="2861" right="665" bottom="2893"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="通讯">
<Rect left="157" top="153" right="257" bottom="185"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2812" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="通讯失败">
<Rect left="41" top="153" right="141" bottom="185"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="73" top="3364" right="105" bottom="3396"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="自动测试">
<Rect left="519" top="3146" right="619" bottom="3178"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="乘客门玻璃降 第一次"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM  0x2F 0x02 0x09 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="25" name="DEP778" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="乘客门玻璃降 第一次">
<Rect left="518" top="3193" right="618" bottom="3225"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x1D
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="1784" top="4" right="1816" bottom="36"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="混动车型">
<Rect left="913" top="54" right="1013" bottom="86"/>
<Script></Script></Activity>
<Activity id="153" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="913" top="106" right="1013" bottom="138"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--StandValue="3.00";
StandValue="1.00";
if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="1.00";
	else
		StandValue="3.00";
                --StandValue="1.00";
end
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--   if("3.00" == DString1) then
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
                                                          


</Script><assessment no="5" name="DEP629" type="8" flags="105"/>
</Activity>
<Activity id="154" ActivityType="3" flags="0" name="延时300MS">
<Rect left="914" top="160" right="1014" bottom="192"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="946" top="4" right="978" bottom="36"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="1074" top="211" right="1106" bottom="243"/>
</Activity>
<Activity id="157" ActivityType="3" flags="0" name="改脸">
<Rect left="1039" top="54" right="1139" bottom="86"/>
<Script></Script></Activity>
<Activity id="158" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1039" top="106" right="1139" bottom="138"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="3.00";
        elseif(DString_C131_Car_Tpye=="CH1BM34")then
		StandValue="3.00";
        elseif(DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="1.00";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="1.00";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="1.00";
	else
		StandValue="3.00";
                --StandValue="1.00";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("3.00" == DString1) then
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
                                                          


</Script><assessment no="5" name="DEP629" type="8" flags="105"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1040" top="160" right="1140" bottom="192"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="1074" top="3" right="1106" bottom="35"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="结束通讯">
<Rect left="42" top="104" right="142" bottom="136"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="19年型">
<Rect left="1170" top="54" right="1270" bottom="86"/>
<Script></Script></Activity>
<Activity id="263" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1170" top="104" right="1270" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue= LibGeneral.PDCUsoftVerNum(DString_C131_Car_Tpye);
        engine.println("软件版本号标准值:"..StandValue);
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
                DString1 = engine.GetResponseString(3,2+#StandValue);
		engine.SetLineText(3,DString1);
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
end</Script><assessment no="5" name="DEP629" type="8" flags="105"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1170" top="154" right="1270" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1204" top="4" right="1236" bottom="36"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="12" type="0">
</Transition>
<Transition StartId="3" EndId="13" type="0">
</Transition>
<Transition StartId="11" EndId="1" type="0">
</Transition>
<Transition StartId="12" EndId="146" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="17" type="0">
</Transition>
<Transition StartId="16" EndId="24" type="0">
</Transition>
<Transition StartId="17" EndId="16" type="0">
</Transition>
<Transition StartId="23" EndId="27" type="0">
</Transition>
<Transition StartId="24" EndId="23" type="1">
<Expression>C131_PDCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="27" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="28" type="0">
</Transition>
<Transition StartId="27" EndId="25" type="1">
<Expression>C131_PDCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="1">
<Expression>C131_PDCU_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="28" EndId="48" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="48" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="35" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="156" type="0">
</Transition>
<Transition StartId="35" EndId="33" type="1">
<Expression>C131_PDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="35" EndId="155" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="46" type="0">
</Transition>
<Transition StartId="38" EndId="45" type="0">
</Transition>
<Transition StartId="39" EndId="38" type="0">
</Transition>
<Transition StartId="40" EndId="36" type="1">
<Expression>C131_PDCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="40" EndId="46" type="0">
</Transition>
<Transition StartId="41" EndId="122" type="0">
</Transition>
<Transition StartId="42" EndId="47" type="0">
</Transition>
<Transition StartId="43" EndId="151" type="0">
</Transition>
<Transition StartId="44" EndId="42" type="0">
</Transition>
<Transition StartId="45" EndId="44" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PDCU_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="45" EndId="47" type="0">
</Transition>
<Transition StartId="46" EndId="39" type="1">
<Expression>C131_PDCU_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="46" EndId="45" type="0">
</Transition>
<Transition StartId="47" EndId="43" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PDCU_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="47" EndId="151" type="0">
</Transition>
<Transition StartId="48" EndId="31" type="1">
<Expression>C131_PDCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="48" EndId="35" type="0">
</Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="62" type="4">
</Transition>
<Transition StartId="50" EndId="51" type="3">
</Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="63" type="4">
</Transition>
<Transition StartId="53" EndId="54" type="3">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="64" type="4">
</Transition>
<Transition StartId="56" EndId="57" type="3">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="65" type="3">
</Transition>
<Transition StartId="59" EndId="60" type="3">
</Transition>
<Transition StartId="60" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="66" type="0">
</Transition>
<Transition StartId="62" EndId="51" type="0">
</Transition>
<Transition StartId="63" EndId="54" type="0">
</Transition>
<Transition StartId="64" EndId="57" type="0">
</Transition>
<Transition StartId="65" EndId="60" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="3">
</Transition>
<Transition StartId="67" EndId="71" type="4">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="3">
</Transition>
<Transition StartId="69" EndId="72" type="4">
</Transition>
<Transition StartId="70" EndId="91" type="0">
</Transition>
<Transition StartId="71" EndId="68" type="0">
</Transition>
<Transition StartId="72" EndId="70" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="80" type="4">
</Transition>
<Transition StartId="74" EndId="77" type="3">
</Transition>
<Transition StartId="76" EndId="81" type="4">
</Transition>
<Transition StartId="76" EndId="79" type="3">
</Transition>
<Transition StartId="77" EndId="76" type="0">
</Transition>
<Transition StartId="79" EndId="92" type="0">
</Transition>
<Transition StartId="80" EndId="77" type="0">
</Transition>
<Transition StartId="81" EndId="79" type="0">
</Transition>
<Transition StartId="82" EndId="91" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="3">
</Transition>
<Transition StartId="84" EndId="87" type="4">
</Transition>
<Transition StartId="85" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="89" type="3">
</Transition>
<Transition StartId="86" EndId="88" type="4">
</Transition>
<Transition StartId="87" EndId="85" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="93" type="0">
</Transition>
<Transition StartId="90" EndId="92" type="0">
</Transition>
<Transition StartId="91" EndId="73" type="1">
<Expression>C131_PDCU_Check_The_Turn_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="91" EndId="90" type="0">
</Transition>
<Transition StartId="92" EndId="83" type="1">
<Expression>C131_PDCU_Check_The_Door_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="92" EndId="94" type="0">
</Transition>
<Transition StartId="93" EndId="95" type="1">
<Expression>C131_PDCU_Check_The_Door_Window_Execute_Flag == true</Expression></Transition>
<Transition StartId="93" EndId="105" type="0">
</Transition>
<Transition StartId="94" EndId="93" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="102" type="4">
</Transition>
<Transition StartId="96" EndId="97" type="3">
</Transition>
<Transition StartId="97" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="103" type="4">
</Transition>
<Transition StartId="99" EndId="100" type="3">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="123" type="0">
</Transition>
<Transition StartId="102" EndId="97" type="0">
</Transition>
<Transition StartId="103" EndId="100" type="0">
</Transition>
<Transition StartId="104" EndId="106" type="1">
<Expression>C131_PDCU_Window_Initialization_Execute_Flag == true</Expression></Transition>
<Transition StartId="104" EndId="112" type="0">
</Transition>
<Transition StartId="105" EndId="123" type="0">
</Transition>
<Transition StartId="106" EndId="121" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="0">
</Transition>
<Transition StartId="109" EndId="115" type="4">
</Transition>
<Transition StartId="109" EndId="116" type="3">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="108" type="0">
</Transition>
<Transition StartId="112" EndId="121" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="11" type="0">
</Transition>
<Transition StartId="120" EndId="11" type="0">
</Transition>
<Transition StartId="121" EndId="149" type="1">
<Expression>C131_PDCU_Window_Learning_Execute_Flag == true</Expression></Transition>
<Transition StartId="121" EndId="120" type="0">
</Transition>
<Transition StartId="122" EndId="82" type="0">
</Transition>
<Transition StartId="122" EndId="49" type="1">
<Expression>C131_PDCU_Check_Mirror_Execute_Flag == true</Expression></Transition>
<Transition StartId="123" EndId="124" type="1">
<Expression>C131_PDCU_Check_The_Switches_Execute_Flag == true</Expression></Transition>
<Transition StartId="123" EndId="144" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="127" type="3">
</Transition>
<Transition StartId="125" EndId="126" type="4">
</Transition>
<Transition StartId="126" EndId="127" type="0">
</Transition>
<Transition StartId="127" EndId="128" type="0">
</Transition>
<Transition StartId="128" EndId="130" type="3">
</Transition>
<Transition StartId="128" EndId="129" type="4">
</Transition>
<Transition StartId="129" EndId="130" type="0">
</Transition>
<Transition StartId="130" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="133" type="3">
</Transition>
<Transition StartId="131" EndId="132" type="4">
</Transition>
<Transition StartId="132" EndId="133" type="0">
</Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="136" type="3">
</Transition>
<Transition StartId="134" EndId="135" type="4">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="1">
<Expression>C131_DDCU_Check_Central_Lock_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="136" EndId="145" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="140" type="3">
</Transition>
<Transition StartId="138" EndId="139" type="4">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="4">
</Transition>
<Transition StartId="141" EndId="104" type="3">
</Transition>
<Transition StartId="142" EndId="104" type="0">
</Transition>
<Transition StartId="144" EndId="136" type="0">
</Transition>
<Transition StartId="145" EndId="104" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="4">
</Transition>
<Transition StartId="146" EndId="3" type="3">
</Transition>
<Transition StartId="147" EndId="161" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="5">
</Transition>
<Transition StartId="148" EndId="11" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="110" type="4">
</Transition>
<Transition StartId="150" EndId="111" type="3">
</Transition>
<Transition StartId="151" EndId="41" type="0">
</Transition>
<Transition StartId="152" EndId="153" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="156" type="0">
</Transition>
<Transition StartId="155" EndId="152" type="1">
<Expression>C131_PDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="155" EndId="160" type="0">
</Transition>
<Transition StartId="156" EndId="40" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="159" EndId="156" type="0">
</Transition>
<Transition StartId="160" EndId="157" type="1">
<Expression>C131_PDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="160" EndId="265" type="0">
</Transition>
<Transition StartId="161" EndId="12" type="0">
</Transition>
<Transition StartId="162" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="156" type="0">
</Transition>
<Transition StartId="265" EndId="162" type="1">
<Expression>C131_PDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="265" EndId="40" type="0">
</Transition>
</Transitions>
</Process>

