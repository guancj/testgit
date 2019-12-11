<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1140" pbltext="DEP836">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_BMS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_BMS_OpenAllRelay_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_LVBatteryVoltage_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_SlaveSoftwareVersion_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_BatteryStatus_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_BatteryPackVoltage_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_ModuleTempMax_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_ModuleTempMin_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CellVoltageMin_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CellVoltageMax_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_BatteryPackCurrent_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CheckMainPositiveRelay_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CheckMainNegativeRelay_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CheckPreChargeRelay_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CheckFANRelayControl_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BMS_CheckFANPWMControl_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7ac" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7cc" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="164" right="264" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="3213" top="1465" right="3313" bottom="1497"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电池管理系统">
<Rect left="164" top="55" right="264" bottom="87"/>
<TitleText Enable="1" Text="电池管理系统（BMS）"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="167" top="190" right="267" bottom="222"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP838" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="165" top="105" right="265" bottom="137"/>
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
<Rect left="168" top="243" right="268" bottom="275"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="73" name="DEP1109" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="167" top="292" right="267" bottom="324"/>
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
<Rect left="166" top="387" right="266" bottom="419"/>
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
</Script><assessment no="3" name="DEP839" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="303" top="66" right="403" bottom="98"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17);
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
end</Script><assessment no="4" name="DEP840" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="337" top="11" right="369" bottom="43"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="477" top="12" right="509" bottom="44"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读软件号">
<Rect left="444" top="64" right="544" bottom="96"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP841" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="443" top="112" right="543" bottom="144"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="584" top="64" right="684" bottom="96"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
DString1=hexstr(@3-@6);
engine.println("软件版本号:"..DString1);
engine.SetLineText(3,DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP842" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="583" top="117" right="683" bottom="149"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="619" top="11" right="651" bottom="43"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="723" top="64" right="823" bottom="96"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP843" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="722" top="168" right="822" bottom="200"/>
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
end</Script><assessment no="8" name="DEP844" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="日期读取">
<Rect left="882" top="166" right="982" bottom="198"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="发送时间">
<Rect left="883" top="67" right="983" bottom="99"/>
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
<Rect left="756" top="9" right="788" bottom="41"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="清除四行">
<Rect left="1262" top="426" right="1362" bottom="458"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1049" top="118" right="1149" bottom="150"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1167" top="66" right="1267" bottom="98"/>
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
end</Script><assessment no="12" name="DEP846" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="写配置码">
<Rect left="1050" top="64" right="1150" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 str2hex(VariCoding,1) str2hex(VariCoding,3)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP845" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="1083" top="9" right="1115" bottom="41"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="918" top="10" right="950" bottom="42"/>
</Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="1200" top="10" right="1232" bottom="42"/>
</Activity>
<Activity id="34" ActivityType="4" flags="0" name="路由节点">
<Rect left="1200" top="427" right="1232" bottom="459"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="194" top="426" right="226" bottom="458"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="3212" top="1397" right="3312" bottom="1429"/>
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
<Rect left="722" top="116" right="822" bottom="148"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="882" top="117" right="982" bottom="149"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="延时300MS">
<Rect left="292" top="656" right="392" bottom="688"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="LV battery voltage">
<Rect left="292" top="557" right="392" bottom="589"/>
<Script></Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时300MS">
<Rect left="467" top="655" right="567" bottom="687"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="BMS Slave Software Version">
<Rect left="467" top="557" right="567" bottom="589"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="Read Battery Status">
<Rect left="642" top="607" right="742" bottom="639"/>
<Line1Text Enable="1" Text="读电池状态"/>
<Script>#COMM 0x22 0xB0 0x88


--DString1=bytesStr(@3);
engine.println("Battery Status:"..@3);
if (@3 == 0x00) then
  engine.LastError = 0;
  engine.println("Battery Level = 0");
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("Battery Level != 0");
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP965" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="延时300MS">
<Rect left="643" top="656" right="743" bottom="688"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="Battery Status">
<Rect left="642" top="555" right="742" bottom="587"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="Open all relays">
<Rect left="158" top="560" right="258" bottom="592"/>
<Script></Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="Read BMS Slave Version">
<Rect left="467" top="605" right="567" bottom="637"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 BMS Slave Version"/>
<Script>#COMM 0x22 0xB0 0xB2


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP964" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="857" top="492" right="889" bottom="524"/>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="326" top="494" right="358" bottom="526"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="501" top="493" right="533" bottom="525"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="677" top="492" right="709" bottom="524"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="193" top="495" right="225" bottom="527"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="Open all relays">
<Rect left="159" top="611" right="259" bottom="643"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="打开所有继电器"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP962" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="延时300MS">
<Rect left="158" top="659" right="258" bottom="691"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="Read BMS LV Bat Input">
<Rect left="292" top="607" right="392" bottom="639"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 BMS LV Bat Input"/>
<Script>#COMM 0x22 0xb0 0x93
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = @3*0.1
engine.println("DecValue"..DecValue)
if (DecValue&gt;=9 and DecValue&lt;=16) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=9;
  engine.StatUpper=16;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP963" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="Read Battery Pack Voltage">
<Rect left="824" top="606" right="924" bottom="638"/>
<Line1Text Enable="1" Text="读 Battery Pack Voltage"/>
<Script>#COMM 0x22 0xB0 0x81

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP966" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="延时300MS">
<Rect left="824" top="657" right="924" bottom="689"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="Battery Pack Voltage">
<Rect left="824" top="555" right="924" bottom="587"/>
<Script></Script></Activity>
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="1046" top="492" right="1078" bottom="524"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="Read BMS Module Temp Max">
<Rect left="1012" top="605" right="1112" bottom="637"/>
<Line1Text Enable="1" Text="读 BMS Module Temp Max"/>
<Script>#COMM 0x22 0xB0 0x96

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP967" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1012" top="662" right="1112" bottom="694"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="BMS Module Temp Max">
<Rect left="1012" top="550" right="1112" bottom="582"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="1227" top="492" right="1259" bottom="524"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="Read BMS Module Temp Min">
<Rect left="1194" top="608" right="1294" bottom="640"/>
<Line1Text Enable="1" Text="读 BMS Module Temp Min"/>
<Script>#COMM 0x22 0xB0 0x98

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP968" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1194" top="665" right="1294" bottom="697"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="BMS Module Temp Min">
<Rect left="1194" top="553" right="1294" bottom="585"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="1388" top="492" right="1420" bottom="524"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="Read BMS Cell Voltage Min">
<Rect left="1354" top="604" right="1454" bottom="636"/>
<Line1Text Enable="1" Text="读 BMS Cell Voltage Min"/>
<Script>#COMM 0x22 0xB0 0xA3

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP969" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1354" top="661" right="1454" bottom="693"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="BMS Cell Voltage Min">
<Rect left="1354" top="549" right="1454" bottom="581"/>
<Script></Script></Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="1562" top="493" right="1594" bottom="525"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="Read BMS Cell Voltage Max">
<Rect left="1529" top="605" right="1629" bottom="637"/>
<Line1Text Enable="1" Text="读 BMS CBMS Cell Voltage Max"/>
<Script>#COMM 0x22 0xB0 0xA1

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP970" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1529" top="662" right="1629" bottom="694"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="BMS Cell Voltage Max">
<Rect left="1529" top="550" right="1629" bottom="582"/>
<Script></Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1896" top="661" right="1996" bottom="693"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="Battery Pack Current">
<Rect left="1896" top="551" right="1996" bottom="583"/>
<Script></Script></Activity>
<Activity id="88" ActivityType="4" flags="0" name="路由节点">
<Rect left="1931" top="492" right="1963" bottom="524"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="Read Battery Pack Current">
<Rect left="1896" top="608" right="1996" bottom="640"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Battery Pack Current"/>
<Script>#COMM 0x22 0xB0 0x82 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)*0.1-500
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-5 and DecValue&lt;=5) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-5;
  engine.StatUpper=5;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="22" name="DEP971" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2116" top="669" right="2216" bottom="701"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="Check the main positive relay">
<Rect left="2116" top="560" right="2216" bottom="592"/>
<Script></Script></Activity>
<Activity id="92" ActivityType="4" flags="0" name="路由节点">
<Rect left="2149" top="493" right="2181" bottom="525"/>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2116" top="617" right="2216" bottom="649"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="23" name="DEP972" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="Close the Main Positive Relay">
<Rect left="2115" top="725" right="2215" bottom="757"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Close the Main Positive Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x10

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP973" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2115" top="780" right="2215" bottom="812"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2114" top="835" right="2214" bottom="867"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="25" name="DEP974" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="Open the Main Positive Relay">
<Rect left="2113" top="894" right="2213" bottom="926"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Open the Main Positive Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP975" type="8" flags="97"/>
</Activity>
<Activity id="98" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2114" top="946" right="2214" bottom="978"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2113" top="999" right="2213" bottom="1031"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="27" name="DEP976" type="8" flags="97"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2340" top="683" right="2440" bottom="715"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="Check the main negative relay">
<Rect left="2340" top="565" right="2440" bottom="597"/>
<Script></Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="Read Negative bus voltage">
<Rect left="2340" top="622" right="2440" bottom="654"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Negative bus voltage"/>
<Script>#COMM 0x22 0xB0 0x84
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="28" name="DEP977" type="8" flags="97"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="Close the Main Negative Relay">
<Rect left="2341" top="745" right="2441" bottom="777"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Close the Main Negative Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x08

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP978" type="8" flags="97"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2340" top="806" right="2440" bottom="838"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="Read Negative bus voltage">
<Rect left="2341" top="871" right="2441" bottom="903"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Negative bus voltage"/>
<Script>#COMM 0x22 0xB0 0x84 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="30" name="DEP979" type="8" flags="97"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="Open the Main Negative Relay">
<Rect left="2342" top="942" right="2442" bottom="974"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Open the Main Negative Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP980" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2342" top="1006" right="2442" bottom="1038"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="108" ActivityType="3" flags="1" name="Read Negative bus voltage">
<Rect left="2342" top="1067" right="2442" bottom="1099"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Negative bus voltage"/>
<Script>#COMM 0x22 0xB0 0x84 
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="32" name="DEP981" type="8" flags="97"/>
</Activity>
<Activity id="109" ActivityType="4" flags="0" name="路由节点">
<Rect left="2373" top="493" right="2405" bottom="525"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2556" top="679" right="2656" bottom="711"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="Check the pre-charge relay">
<Rect left="2557" top="561" right="2657" bottom="593"/>
<Script></Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2557" top="618" right="2657" bottom="650"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="33" name="DEP972" type="8" flags="97"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="Close the Pre-Charge Relay">
<Rect left="2555" top="742" right="2655" bottom="774"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Close the Pre-Charge Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x04

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP982" type="8" flags="97"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2554" top="803" right="2654" bottom="835"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2555" top="868" right="2655" bottom="900"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="35" name="DEP972" type="8" flags="97"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="Open the Pre-Charge Relay">
<Rect left="2555" top="933" right="2655" bottom="965"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Open the Pre-Charge Relay"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="36" name="DEP983" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2555" top="996" right="2655" bottom="1028"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="Read Positive bus voltage">
<Rect left="2556" top="1056" right="2656" bottom="1088"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Positive bus voltage"/>
<Script>#COMM 0x22 0xB0 0x83
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = (@3*256+@4)
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-50 and DecValue&lt;=50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-50;
  engine.StatUpper=50;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="37" name="DEP972" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="4" flags="0" name="路由节点">
<Rect left="2591" top="493" right="2623" bottom="525"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2555" top="1120" right="2655" bottom="1152"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="121" ActivityType="3" flags="0" name="Return Control to ECU">
<Rect left="2556" top="1180" right="2656" bottom="1212"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Return Control to ECU"/>
<Script>#COMM 0x2F 0xD0 0x01 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP984" type="8" flags="97"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="Check the FAN Relay Control">
<Rect left="2787" top="565" right="2887" bottom="597"/>
<Script></Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="Open the fan relay">
<Rect left="2786" top="632" right="2886" bottom="664"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Open the fan relay"/>
<Script>#COMM 0x2F 0xD0 0x06 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="39" name="DEP985" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2785" top="693" right="2885" bottom="725"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="Read Fan relay control signal">
<Rect left="2786" top="758" right="2886" bottom="790"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Fan relay control signal"/>
<Script>#COMM 0x22 0xB0 0xA9

local StringResHex
local DecValue
DecValue = @3
engine.println("DecValue"..DecValue)
if (DecValue == 0) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
--engine.StatValue=DecValue;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="40" name="DEP986" type="8" flags="97"/>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="Close the fan relay">
<Rect left="2787" top="826" right="2887" bottom="858"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Close the fan relay"/>
<Script>#COMM 0x2F 0xD0 0x06 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="41" name="DEP987" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2787" top="893" right="2887" bottom="925"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2789" top="1023" right="2889" bottom="1055"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="Return Control to ECU">
<Rect left="2790" top="1085" right="2890" bottom="1117"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Return Control to ECU"/>
<Script>#COMM 0x2F 0xD0 0x06 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="43" name="DEP984" type="8" flags="97"/>
</Activity>
<Activity id="133" ActivityType="4" flags="0" name="路由节点">
<Rect left="2821" top="493" right="2853" bottom="525"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="Read Fan relay control signal">
<Rect left="2788" top="955" right="2888" bottom="987"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Fan relay control signal"/>
<Script>#COMM 0x22 0xB0 0xA9

local StringResHex
local DecValue
DecValue = @3
engine.println("DecValue"..DecValue)
if (DecValue == 1) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
--engine.StatValue=DecValue;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="42" name="DEP988" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="Check the FAN PWM Control">
<Rect left="2997" top="561" right="3097" bottom="593"/>
<Script></Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="The FAN PWM Value -&gt; 0%">
<Rect left="2996" top="628" right="3096" bottom="660"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="设置 FAN PWM Value -&gt; 0%"/>
<Script>#COMM 0x2F 0xD0 0x07 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="44" name="DEP989" type="8" flags="97"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2995" top="689" right="3095" bottom="721"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="Read Fan PWM Duty">
<Rect left="2996" top="754" right="3096" bottom="786"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Fan PWM Duty"/>
<Script>#COMM 0x22 0xB0 0xB0
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = @3*0.01
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-0.05 and DecValue &lt;= 0.05) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-0.05;
  engine.StatUpper=0.05;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="45" name="DEP990" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2996" top="1017" right="3096" bottom="1049"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="Return Control to ECU">
<Rect left="2998" top="1259" right="3098" bottom="1291"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="Return Control to ECU"/>
<Script>#COMM 0x2F 0xD0 0x07 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="50" name="DEP984" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="The FAN PWM Value -&gt; 40%">
<Rect left="2996" top="822" right="3096" bottom="854"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="设置 FAN PWM Value -&gt; 40%"/>
<Script>#COMM 0x2F 0xD0 0x07 0x03 0x28

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="46" name="DEP991" type="8" flags="97"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2995" top="892" right="3095" bottom="924"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="146" ActivityType="3" flags="0" name="Read Fan PWM Duty">
<Rect left="2996" top="953" right="3096" bottom="985"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Fan PWM Duty"/>
<Script>#COMM 0x22 0xB0 0xB0
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = @3*0.01
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-0.05 and DecValue &lt;= 0.05) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-0.05;
  engine.StatUpper=0.05;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="47" name="DEP993" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="The FAN PWM Value -&gt; 80%">
<Rect left="2995" top="1082" right="3095" bottom="1114"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="设置 FAN PWM Value -&gt; 80%"/>
<Script>#COMM 0x2F 0xD0 0x07 0x03 0x50

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="48" name="DEP992" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="延时300MS">
<Rect left="2996" top="1135" right="3096" bottom="1167"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="149" ActivityType="3" flags="0" name="Read Fan PWM Duty">
<Rect left="2997" top="1196" right="3097" bottom="1228"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="读 Fan PWM Duty"/>
<Script>#COMM 0x22 0xB0 0xB0
if(@0==0x62)then

local StringResHex
local DecValue
DecValue = @3*0.01
engine.println("DecValue"..DecValue)
if (DecValue&gt;=-0.05 and DecValue &lt;= 0.05) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.StatValue=DecValue;
  engine.StatLower=-0.05;
  engine.StatUpper=0.05;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="49" name="DEP994" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="3031" top="494" right="3063" bottom="526"/>
</Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="3244" top="495" right="3276" bottom="527"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="空节点">
<Rect left="3572" top="1141" right="3672" bottom="1173"/>
<Script></Script></Activity>
<Activity id="153" ActivityType="3" flags="0" name="Open all relays">
<Rect left="1721" top="551" right="1821" bottom="583"/>
<Script></Script></Activity>
<Activity id="154" ActivityType="3" flags="0" name="Open all relays">
<Rect left="1721" top="610" right="1821" bottom="642"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5" DelayTime="200"/>
<Line1Text Enable="1" Text="打开所有继电器"/>
<Script>#COMM 0x2F 0xD0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="155" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1721" top="661" right="1821" bottom="693"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="1754" top="494" right="1786" bottom="526"/>
</Activity>
<Activity id="157" ActivityType="13" flags="0" name="seedtokey">
<Rect left="166" top="342" right="266" bottom="374"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="通讯">
<Rect left="166" top="146" right="266" bottom="178"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP837" type="8" flags="97"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="通讯失败">
<Rect left="44" top="149" right="144" bottom="181"/>
<Line1Text Enable="1" Text="DSCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="结束通讯">
<Rect left="42" top="106" right="142" bottom="138"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="1296" top="11" right="1328" bottom="43"/>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="80" top="1397" right="112" bottom="1429"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="158" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="157" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="1">
<Expression>C131_BMS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_BMS_SN_Execute_Flag == true</Expression></Transition>
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
<Expression>C131_BMS_SVP_Execute_Flag == true</Expression></Transition>
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
<Expression>C131_BMS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="25" EndId="34" type="0">
</Transition>
<Transition StartId="26" EndId="31" type="0">
</Transition>
<Transition StartId="27" EndId="161" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="1">
<Expression>DString_C131_VariCoding ~= "" and DString_C131_VariCoding ~="BMS00_varicoding" and C131_BMS_WD_Execute_Flag==true and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_BMS_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="31" EndId="27" type="1">
<Expression>DString_C131_VariCoding ~= "" and DString_C131_VariCoding ~="BMS00_varicoding" and (C131_BMS_WD_Execute_Flag==true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="31" EndId="161" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="60" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="41" EndId="57" type="0">
</Transition>
<Transition StartId="43" EndId="65" type="0">
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
<Transition StartId="52" EndId="62" type="0">
</Transition>
<Transition StartId="53" EndId="45" type="0">
</Transition>
<Transition StartId="54" EndId="68" type="1">
<Expression>C131_BMS_BatteryPackVoltage_Execute_Flag == true</Expression></Transition>
<Transition StartId="54" EndId="69" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="56" EndId="43" type="1">
<Expression>C131_BMS_LVBatteryVoltage_Execute_Flag == true</Expression></Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="57" EndId="47" type="1">
<Expression>C131_BMS_SlaveSoftwareVersion_Execute_Flag == true</Expression></Transition>
<Transition StartId="58" EndId="54" type="0">
</Transition>
<Transition StartId="58" EndId="51" type="1">
<Expression>C131_BMS_BatteryStatus_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="52" type="1">
<Expression>C131_BMS_OpenAllRelay_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="56" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="56" type="0">
</Transition>
<Transition StartId="65" EndId="41" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="69" type="0">
</Transition>
<Transition StartId="68" EndId="66" type="0">
</Transition>
<Transition StartId="69" EndId="72" type="1">
<Expression>C131_BMS_ModuleTempMax_Execute_Flag == true</Expression></Transition>
<Transition StartId="69" EndId="74" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="74" type="0">
</Transition>
<Transition StartId="72" EndId="70" type="0">
</Transition>
<Transition StartId="74" EndId="77" type="1">
<Expression>C131_BMS_ModuleTempMin_Execute_Flag == ture</Expression></Transition>
<Transition StartId="74" EndId="78" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="78" type="0">
</Transition>
<Transition StartId="77" EndId="75" type="0">
</Transition>
<Transition StartId="78" EndId="81" type="1">
<Expression>C131_BMS_CellVoltageMin_Execute_Flag == true</Expression></Transition>
<Transition StartId="78" EndId="82" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="82" type="0">
</Transition>
<Transition StartId="81" EndId="79" type="0">
</Transition>
<Transition StartId="82" EndId="85" type="1">
<Expression>C131_BMS_CellVoltageMax_Execute_Flag == true</Expression></Transition>
<Transition StartId="82" EndId="156" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="156" type="0">
</Transition>
<Transition StartId="85" EndId="83" type="0">
</Transition>
<Transition StartId="86" EndId="92" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="0">
</Transition>
<Transition StartId="88" EndId="87" type="1">
<Expression>C131_BMS_BatteryPackCurrent_Execute_Flag == true</Expression></Transition>
<Transition StartId="88" EndId="92" type="0">
</Transition>
<Transition StartId="89" EndId="86" type="0">
</Transition>
<Transition StartId="90" EndId="94" type="0">
</Transition>
<Transition StartId="91" EndId="93" type="0">
</Transition>
<Transition StartId="92" EndId="91" type="1">
<Expression>C131_BMS_CheckMainPositiveRelay_Execute_Flag == true</Expression></Transition>
<Transition StartId="92" EndId="109" type="0">
</Transition>
<Transition StartId="93" EndId="90" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="109" type="0">
</Transition>
<Transition StartId="100" EndId="103" type="0">
</Transition>
<Transition StartId="101" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="100" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="119" type="0">
</Transition>
<Transition StartId="109" EndId="119" type="0">
</Transition>
<Transition StartId="109" EndId="101" type="1">
<Expression>C131_BMS_CheckMainNegativeRelay_Execute_Flag == true</Expression></Transition>
<Transition StartId="110" EndId="113" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="110" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="120" type="0">
</Transition>
<Transition StartId="119" EndId="111" type="1">
<Expression>C131_BMS_CheckPreChargeRelay_Execute_Flag == true</Expression></Transition>
<Transition StartId="119" EndId="133" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="133" type="0">
</Transition>
<Transition StartId="123" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="127" type="0">
</Transition>
<Transition StartId="127" EndId="128" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="0">
</Transition>
<Transition StartId="129" EndId="134" type="0">
</Transition>
<Transition StartId="131" EndId="132" type="0">
</Transition>
<Transition StartId="132" EndId="150" type="0">
</Transition>
<Transition StartId="133" EndId="123" type="1">
<Expression>C131_BMS_CheckFANRelayControl_Execute_Flag == true</Expression></Transition>
<Transition StartId="133" EndId="150" type="0">
</Transition>
<Transition StartId="134" EndId="131" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="144" type="0">
</Transition>
<Transition StartId="141" EndId="147" type="0">
</Transition>
<Transition StartId="142" EndId="151" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="141" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="149" type="0">
</Transition>
<Transition StartId="149" EndId="142" type="0">
</Transition>
<Transition StartId="150" EndId="135" type="1">
<Expression>C131_BMS_CheckFANPWMControl_Execute_Flag == true</Expression></Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="36" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="88" type="0">
</Transition>
<Transition StartId="156" EndId="153" type="0">
</Transition>
<Transition StartId="157" EndId="8" type="0">
</Transition>
<Transition StartId="158" EndId="4" type="3">
</Transition>
<Transition StartId="158" EndId="159" type="4">
</Transition>
<Transition StartId="159" EndId="160" type="0">
</Transition>
<Transition StartId="159" EndId="162" type="5">
</Transition>
<Transition StartId="160" EndId="5" type="0">
</Transition>
<Transition StartId="161" EndId="25" type="0">
</Transition>
<Transition StartId="162" EndId="36" type="0">
</Transition>
</Transitions>
</Process>

