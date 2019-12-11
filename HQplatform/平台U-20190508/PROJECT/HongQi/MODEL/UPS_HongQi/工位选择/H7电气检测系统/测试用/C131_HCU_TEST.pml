<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="175" pbltext="DEP858">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_HCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_HCU_PowerOff_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_ReO_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_IGBT_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_MG_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Read_BMS_Info_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Open_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Close_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SPEC_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_ActiveTransport_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_InactiveTransport_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="115" top="68" right="215" bottom="100"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1247" top="1651" right="1347" bottom="1683"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="混动控制系统">
<Rect left="114" top="121" right="214" bottom="153"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Script>engine.println("SPEC_DATA:"..spec_data);</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="116" top="277" right="216" bottom="309"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="115" top="171" right="215" bottom="203"/>
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
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="252" top="128" right="352" bottom="160"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Script>#COMM 0x22 0xF1 0x87
if(@0==0x62)then
    
if(string.len(DString_C131_Partnumber)==10)then
    DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
elseif(string.len(DString_C131_Partnumber)==11)then
    DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
else
end

if (DString1==DString_C131_Partnumber) then
  engine.LastError = 0;
  engine.println("MCU 比对零件号成功"..DString1..DString_C131_Partnumber);
  engine.StatValue=DString1;
  engine.StatPoint=DString_C131_Partnumber
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("MCU 比对零件号失败"..DString1..DString_C131_Partnumber);
  engine.StatValue=DString1;
  engine.StatPoint=DString_C131_Partnumber
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP862" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="287" top="77" right="319" bottom="109"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="566" top="76" right="598" bottom="108"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读硬件号">
<Rect left="532" top="134" right="632" bottom="166"/>
<Line1Text Enable="1" Text="读硬件号"/>
<Script>#COMM 0x22 0xF1 0x93
   
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);
--engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="6" name="DEP863" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="531" top="182" right="631" bottom="214"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="394" top="128" right="494" bottom="160"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="xxHPHEV0422C0201"
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
    DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
    engine.SetLineText(3,DString1);
    engine.println("软件版本号:"..DString1);
--if("xxHPHEV041BC0201" == DString1)then
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
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP864" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="394" top="183" right="494" bottom="215"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="429" top="76" right="461" bottom="108"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="672" top="132" right="772" bottom="164"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP865" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="674" top="232" right="774" bottom="264"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
if(@0==0x62)then
DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
engine.println("读的VIN值:"..DString1);
if (string.match(DString1,DString_Write_VIN)) then
  engine.LastError = 0;
  engine.println("比对成功");
  engine.StatValue=DString_Write_VIN;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("比对失败");
  engine.StatValue=DString1;
  engine.StatPoint=DString_Write_VIN;
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="8" name="DEP866" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="日期读取">
<Rect left="832" top="232" right="932" bottom="264"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="发送时间">
<Rect left="833" top="133" right="933" bottom="165"/>
<Line1Text Enable="1" Text="发日期"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
--engine.StatValue=date;</Script><assessment no="9" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="706" top="75" right="738" bottom="107"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="清除四行">
<Rect left="1135" top="182" right="1235" bottom="214"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1000" top="186" right="1100" bottom="218"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1136" top="130" right="1236" bottom="162"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
  DString_Read_Config_Code_From_ECU=hexstr(@3-@6);
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
</Script><assessment no="12" name="DEP868" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="写配置码">
<Rect left="1000" top="130" right="1100" bottom="162"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
--#COMM 0x2e 0x01 0x00 str2hex(VariCoding,1) str2hex(VariCoding,3)
--engine.StatValue=VariCoding;
#COMM 0x2e 0x01 0x00 hex2bin(VariCoding)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP867" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="1033" top="75" right="1065" bottom="107"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="868" top="76" right="900" bottom="108"/>
</Activity>
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="126" top="565" right="158" bottom="597"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1248" top="1587" right="1348" bottom="1619"/>
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
<Rect left="671" top="184" right="771" bottom="216"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="832" top="183" right="932" bottom="215"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="959" top="805" right="1059" bottom="837"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="Check Battery always open Relay">
<Rect left="959" top="690" right="1059" bottom="722"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="2F">
<Rect left="1121" top="749" right="1221" bottom="781"/>
<Line1Text Enable="1" Text="关闭双蓄电池常开继电器"/>
<Script>#COMM 0x2f 0x02 0x0c 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP1000" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1122" top="802" right="1222" bottom="834"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="Check Battery always close Relay">
<Rect left="1122" top="690" right="1222" bottom="722"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="Check Engine warm water pump">
<Rect left="261" top="693" right="361" bottom="725"/>
<Script></Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="2F">
<Rect left="959" top="750" right="1059" bottom="782"/>
<Line1Text Enable="1" Text="打开双蓄电池常开继电器"/>
<Script>#COMM 0x2f 0x02 0x0d 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="37" name="DEP999" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="1283" top="632" right="1315" bottom="664"/>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="639" top="630" right="671" bottom="662"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="992" top="632" right="1024" bottom="664"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="1157" top="633" right="1189" bottom="665"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="296" top="628" right="328" bottom="660"/>
</Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="1169" top="75" right="1201" bottom="107"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1698" top="184" right="1798" bottom="216"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="激活车辆运输模式">
<Rect left="1699" top="126" right="1799" bottom="158"/>
<Line1Text Enable="1" Text="激活车辆运输模式"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("激活车辆运输模式");

#COMM 0x2e 0x01 0x06 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="55" name="DEP1045" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="74" right="1766" bottom="106"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1873" top="183" right="1973" bottom="215"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="取消车辆运输模式">
<Rect left="1873" top="124" right="1973" bottom="156"/>
<Line1Text Enable="1" Text="取消车辆运输模式"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
engine.println("取消车辆运输模式");

#COMM 0x2e 0x01 0x06 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="48" name="DEP1048" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="1907" top="75" right="1939" bottom="107"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="2F">
<Rect left="260" top="750" right="360" bottom="782"/>
<Line1Text Enable="1" Text="设置发动机暖水泵值"/>
<Script>#COMM 0x2f 0x02 0x02 0x03 0x4e 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP995" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="126" top="629" right="158" bottom="661"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="Read BMS Information">
<Rect left="92" top="687" right="192" bottom="719"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="读主负继电器故障">
<Rect left="92" top="745" right="192" bottom="777"/>
<Line1Text Enable="1" Text="读主负继电器故障"/>
<Script>#COMM 0x22 0x01 0x4f
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=0;

engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP895" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="读预充继电器故障">
<Rect left="91" top="798" right="191" bottom="830"/>
<Line1Text Enable="1" Text="读预充继电器故障"/>
<Script>#COMM 0x22 0x01 0x50
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=0;
engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="17" name="DEP896" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="读主正继电器故障">
<Rect left="92" top="856" right="192" bottom="888"/>
<Line1Text Enable="1" Text="读主正继电器故障"/>
<Script>#COMM 0x22 0x01 0x53
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=0;
engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="18" name="DEP897" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="读电池SOC">
<Rect left="91" top="911" right="191" bottom="943"/>
<Line1Text Enable="1" Text="读电池SOC"/>
<Script>#COMM 0x22 0x01 0x55
if(@0==0x62)then

res=@3*256+@4;
res=res*0.1;
if (res &gt;= 20 and res &lt;= 70) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

engine.println("电池SOC百分比:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=20;
engine.StatUpper=70;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP898" type="8" flags="99"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="读电池温度">
<Rect left="90" top="969" right="190" bottom="1001"/>
<Line1Text Enable="1" Text="读电池温度"/>
<Script>#COMM 0x22 0x01 0x56
if(@0==0x62)then

res=@3-40;
if (res &gt;= -30 and res &lt;= 55) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("电池温度:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=-30;
engine.StatUpper=55;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="21" name="DEP899" type="8" flags="97"/>
</Activity>
<Activity id="86" ActivityType="3" flags="0" name="电池状态">
<Rect left="89" top="1027" right="189" bottom="1059"/>
<Line1Text Enable="1" Text="电池状态"/>
<Script>#COMM 0x22 0x01 0x4d
if(@0==0x62)then

res=@3;
if (res==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=0;

engine.println("电池状态:"..res);
engine.SetLineText(2,res);
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="22" name="DEP900" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="BMS主控制器软件版本号">
<Rect left="89" top="1089" right="189" bottom="1121"/>
<Line1Text Enable="1" Text="BMS主控制器软件版本号"/>
<Script>#COMM 0x22 0x01 0xDC
StandValue=0x02;
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
   DString1=@3;
   engine.SetLineText(3,DString1); 
   engine.println("HCU读BMS软件版本号:"..DString1);
--if(0x01 == DString1) then  
if(StandValue == DString1)then                           
   engine.LastError = 0;
   engine.println("比对BMS软件版本号成功"..DString1.."  "..StandValue);
else
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.println("比对BMS软件版本号失败"..DString1.."  "..StandValue);
end
engine.StatValue=DString1;
engine.StatPoint=StandValue;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="23" name="DEP901" type="8" flags="97"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="BMS从控制器软件版本号">
<Rect left="90" top="1148" right="190" bottom="1180"/>
<Line1Text Enable="1" Text="BMS从控制器软件版本号"/>
<Script>#COMM 0x22 0x01 0xDD
if(@0==0x62)then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes)
end

</Script><assessment no="24" name="DEP902" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="BMS从控制器硬件版本号">
<Rect left="88" top="1253" right="188" bottom="1285"/>
<Line1Text Enable="1" Text="BMS从控制器硬件版本号"/>
<Script>#COMM 0x22 0x01 0xDF
if(@0==0x62)then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes)
end

</Script><assessment no="26" name="DEP904" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="电池总成电压">
<Rect left="89" top="1308" right="189" bottom="1340"/>
<Line1Text Enable="1" Text="电池总成电压"/>
<Script>#COMM 0x22 0x01 0xE0
if(@0==0x62)then

res=@3*256+@4;
res=res;
if (res &gt;= 221 and res &lt;= 403) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("电池总成电压:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=221;
engine.StatUpper=403;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="27" name="DEP905" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="最大单体电压">
<Rect left="90" top="1362" right="190" bottom="1394"/>
<Line1Text Enable="1" Text="最大单体电压"/>
<Script>#COMM 0x22 0x01 0xE1
if(@0==0x62)then

res=@3*256+@4;
res=res*0.01;
if (res &gt;= 2.3 and res &lt;= 4.2) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("最大单体电压:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=2.3;
engine.StatUpper=4.2;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="29" name="DEP906" type="8" flags="97"/>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="最大单体电压位置">
<Rect left="91" top="1417" right="191" bottom="1449"/>
<Line1Text Enable="1" Text="最大单体电压位置"/>
<Script>#COMM 0x22 0x01 0xE2
if(@0==0x62)then

res=@3+1;
if (res &gt;= 1 and res &lt;= 96) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("最大单体电压位置:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=1;
engine.StatUpper=96;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="30" name="DEP907" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="最小单体电压">
<Rect left="90" top="1472" right="190" bottom="1504"/>
<Line1Text Enable="1" Text="最小单体电压"/>
<Script>#COMM 0x22 0x01 0xE3
if(@0==0x62)then

res=@3*256+@4;
res=res*0.01;
if (res &gt;= 2.3 and res &lt;= 4.2) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("最小单体电压:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=2.3;
engine.StatUpper=4.2;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="31" name="DEP908" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="最小单体电压位置">
<Rect left="89" top="1524" right="189" bottom="1556"/>
<Line1Text Enable="1" Text="最小单体电压位置"/>
<Script>#COMM 0x22 0x01 0xE4
if(@0==0x62)then

res=@3+1;
if (res &gt;= 1 and res &lt;= 96) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("最小单体电压位置:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=1;
engine.StatUpper=96;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="32" name="DEP909" type="8" flags="97"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="259" top="866" right="359" bottom="898"/>
<Script>#COMM 0x2f 0x02 0x02 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="Check LT E-Water pump">
<Rect left="424" top="695" right="524" bottom="727"/>
<Script></Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="2F">
<Rect left="423" top="752" right="523" bottom="784"/>
<Line1Text Enable="1" Text="打开低温冷却水泵"/>
<Script>#COMM 0x2f 0x02 0x03 0x03 0x4e 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP996" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="420" top="863" right="520" bottom="895"/>
<Script>#COMM 0x2f 0x02 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="458" top="629" right="490" bottom="661"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="958" top="862" right="1058" bottom="894"/>
<Script>#COMM 0x2f 0x02 0x0d 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="1122" top="860" right="1222" bottom="892"/>
<Script>#COMM 0x2f 0x02 0x0c 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="104" ActivityType="4" flags="0" name="路由节点">
<Rect left="1356" top="75" right="1388" bottom="107"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1321" top="227" right="1421" bottom="259"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="写C0离合器液压模块特性数据">
<Rect left="1343" top="178" right="1443" bottom="210"/>
<Line1Text Enable="1" Text="写C0离合器液压模块特性数据"/>
<Script>engine.println("C0离合器液压模块特性数据"..spec_0101);
#COMM 0x2e 0x01 0x01 hex2bin(spec_0101)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="39" name="DEP1136" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="读">
<Rect left="1322" top="275" right="1422" bottom="307"/>
<Line1Text Enable="1" Text="比对C0离合器液压模块特性数据"/>
<Script>#COMM 0x22 0x01 0x01
if(@0==0x62)then
   DString_Read_Spec_Data_From_ECU=hexstr(@3-@154);
engine.println("液压模块特性数据:"..DString_Read_Spec_Data_From_ECU);
engine.println(spec_0101);
if (string.match(DString_Read_Spec_Data_From_ECU,spec_0101)) then
  engine.SetLineText(2,"比对成功");
  engine.println("比对成功");
  engine.LastError = 0;
  engine.StatValue= DString_Read_Spec_Data_From_ECU;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对液压模块特性数据失败");
  engine.println("比对液压模块特性数据失败");
  engine.StatValue= DString_Read_Config_Code_From_ECU;
  engine.StatPoint=spec_0101;
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="40" name="DEP1144" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="4" flags="0" name="路由节点">
<Rect left="2012" top="74" right="2044" bottom="106"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1323" top="382" right="1423" bottom="414"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="写C0离合器压力电流自学习数据">
<Rect left="1322" top="327" right="1422" bottom="359"/>
<Line1Text Enable="1" Text="写C0离合器压力电流自学习数据"/>
<Script>engine.println("c0离合器压力电流自学习数据"..spec_0102);
#COMM 0x2e 0x01 0x02 hex2bin(spec_0102)
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="41" name="DEP1137" type="8" flags="97"/>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="读">
<Rect left="1323" top="433" right="1423" bottom="465"/>
<Line1Text Enable="1" Text="比对C0离合器压力电流自学习数据"/>
<Script>#COMM 0x22 0x01 0x02
if(@0==0x62)then
   DString_Read_Spec_Data_From_ECU=hexstr(@3-@64);
engine.println("c0离合器压力电流自学习数据:"..DString_Read_Spec_Data_From_ECU);
engine.println(spec_data);
if (string.match(DString_Read_Spec_Data_From_ECU,spec_0102)) then
  engine.SetLineText(2,"比对成功");
  engine.println("比对成功");
  engine.LastError = 0;
  engine.StatValue= DString_Read_Spec_Data_From_ECU;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对c0离合器压力电流自学习数据失败");
  engine.println("比对c0离合器压力电流自学习数据失败");
  engine.StatValue= DString_Read_Config_Code_From_ECU;
  engine.StatPoint=spec_0102;
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="42" name="DEP1145" type="8" flags="97"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1323" top="536" right="1423" bottom="568"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="写C0离合器kisspoint数据">
<Rect left="1324" top="487" right="1424" bottom="519"/>
<Line1Text Enable="1" Text="写C0离合器kisspoint数据"/>
<Script>engine.println("C0离合器kisspoint数据"..spec_0103);

#COMM 0x2e 0x01 0x03 hex2bin(spec_0103)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="43" name="DEP1138" type="8" flags="97"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="读C0离合器kisspoint数据">
<Rect left="1551" top="667" right="1651" bottom="699"/>
<Line1Text Enable="1" Text="比对C0离合器kisspoint数据"/>
<Script>#COMM 0x22 0x01 0x03
local kisspoint_flag;
kisspoint_flag=0;
if(@0==0x62)then
   DString_Read_Spec_Data_From_ECU=hexstr(@3-@4);
engine.println("C0离合器kisspoint数据:"..DString_Read_Spec_Data_From_ECU);
engine.println(spec_0103);
if (string.match(DString_Read_Spec_Data_From_ECU,spec_0103)) then
  engine.SetLineText(2,"比对成功");
  engine.println("比对成功");
  engine.LastError = 0;
  kisspoint_flag=1;
  engine.StatValue= DString_Read_Spec_Data_From_ECU;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  kisspoint_flag=0;
  engine.SetLineText(2,"比对C0离合器kisspoint数据失败");
  engine.println("比对C0离合器kisspoint数据失败");
  engine.StatValue= DString_Read_Config_Code_From_ECU;
  engine.StatPoint=spec_0103;
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
engine.println("是否能激活车辆运输模式标志位，kisspoint_flag="..kisspoint_flag);</Script><assessment no="44" name="DEP1146" type="8" flags="99"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="通讯">
<Rect left="115" top="222" right="215" bottom="254"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1" top="221" right="101" bottom="253"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="结束通讯">
<Rect top="170" right="100" bottom="202"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="BMS主控制器硬件版本号">
<Rect left="89" top="1204" right="189" bottom="1236"/>
<Line1Text Enable="1" Text="BMS主控制器硬件版本号"/>
<Script>#COMM 0x22 0x01 0xDE
StandValue=0x01;
engine.println("硬件版本号标准值:"..StandValue);
if(@0==0x62)then
   DString1=@3;
   engine.SetLineText(3,DString1);
   engine.println("HCU读BMS硬件版本号:"..DString1);
--if(0x01 == DString1) then    
if(StandValue == DString1)then                            
   engine.LastError = 0;;
   engine.println("比对BMS硬件版本号成功"..DString1.."  "..StandValue);
else
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.println("比对BMS硬件版本号失败"..DString1.."  "..StandValue);
end
engine.StatValue=DString1;
engine.StatPoint=StandValue;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="25" name="DEP903" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="2F">
<Rect left="603" top="744" right="703" bottom="776"/>
<Line1Text Enable="1" Text="set Motor Urgency Control value"/>
<Script>#COMM 0x2f 0x02 0x04 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP997" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="604" top="804" right="704" bottom="836"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="Check Motor Urgency Control">
<Rect left="604" top="690" right="704" bottom="722"/>
<Line1Text Enable="1" Text="Check Motor Urgency Control"/>
<Script></Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="604" top="857" right="704" bottom="889"/>
<Script>#COMM 0x2f 0x02 0x04 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="2F">
<Rect left="779" top="745" right="879" bottom="777"/>
<Line1Text Enable="1" Text="set  Battery Urgency Control value"/>
<Script>#COMM 0x2f 0x02 0x05 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="36" name="DEP998" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="779" top="800" right="879" bottom="832"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="Check Battery Urgency Control">
<Rect left="780" top="691" right="880" bottom="723"/>
<Line1Text Enable="1" Text="Check Battery Urgency Control"/>
<Script></Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="780" top="858" right="880" bottom="890"/>
<Script>#COMM 0x2f 0x02 0x05 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="813" top="631" right="845" bottom="663"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="车辆运输模式状态">
<Rect left="1699" top="238" right="1799" bottom="270"/>
<Line1Text Enable="1" Text="读取车辆运输模式"/>
<Script>
engine.println("读取车辆运输模式");

#COMM 0x22 0x01 0x06
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"激活车辆运输模式失败");
  engine.println("激活车辆运输模式失败");
  --engine.StatValue= @3;
  --engine.StatPoint=0x01;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="56" name="DEP1047" type="8" flags="99"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="车辆运输模式状态">
<Rect left="1872" top="238" right="1972" bottom="270"/>
<Line1Text Enable="1" Text="读取车辆运输模式"/>
<Script>
engine.println("读取车辆运输模式");

#COMM 0x22 0x01 0x06
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"取消车辆运输模式失败");
  engine.println("取消车辆运输模式失败");
  --engine.StatValue= @3;
  --engine.StatPoint=0x01;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="47" name="DEP1048" type="8" flags="99"/>
</Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="36" top="1586" right="68" bottom="1618"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="提取特性数据">
<Rect left="1322" top="132" right="1422" bottom="164"/>
<Line1Text Enable="1" Text="写入特性数据"/>
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

spec_112A=string.sub(spec_data,817,820);
print("spec_112A:"..spec_112A);

spec_0101="";
spec_0101=hexstr(string.sub(spec_data,821,841))..string.sub(spec_data,842,965)..hexstr(string.sub(spec_data,966,966))..string.sub(spec_data,967,1090)..hexstr(string.sub(spec_data,1091,1096));
--spec_0101="3137303234313041354B585830594D4442585858000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003132333400";
print("spec_0101:"..spec_0101);

spec_0103="";
spec_0103=string.sub(spec_data,1097,1100);
--spec_0103="0FDF";
print("spec_0103:"..spec_0103);

spec_0102="";
spec_0102=string.sub(spec_data,1101,1224);
--spec_0102="0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
print("spec_0102:"..spec_0102);

spec_F1A2=string.sub(spec_data,1225,1240);
print("spec_F1A2:"..spec_F1A2);

spec_010A=string.sub(spec_data,1241,1880);
print("spec_010A:"..spec_010A);


</Script></Activity>
<Activity id="133" ActivityType="4" flags="0" name="路由节点">
<Rect left="1271" top="382" right="1303" bottom="414"/>
</Activity>
<Activity id="134" ActivityType="4" flags="0" name="路由节点">
<Rect left="1271" top="274" right="1303" bottom="306"/>
</Activity>
<Activity id="135" ActivityType="4" flags="0" name="路由节点">
<Rect left="1270" top="534" right="1302" bottom="566"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="258" top="807" right="358" bottom="839"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="421" top="807" right="521" bottom="839"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1549" top="321" right="1649" bottom="353"/>
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
<Activity id="141" ActivityType="3" flags="0" name="切诊断">
<Rect left="1551" top="414" right="1651" bottom="446"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="50" name="DEP1177" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="1550" top="464" right="1650" bottom="496"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="51" name="DEP1178" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="发送key">
<Rect left="1549" top="567" right="1649" bottom="599"/>
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
</Script><assessment no="52" name="DEP1179" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="13" flags="0" name="seedtokey">
<Rect left="1549" top="514" right="1649" bottom="546"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A68795B"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="请下电">
<Rect left="1547" top="127" right="1647" bottom="159"/>
<Line1Text Enable="1" Text="请下电"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON

#STOPCOMM
</Script></Activity>
<Activity id="148" ActivityType="3" flags="0" name="等待20秒">
<Rect left="1548" top="177" right="1648" bottom="209"/>
<Line1Text Enable="1" Text="15秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=15,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="149" ActivityType="3" flags="0" name="请上电">
<Rect left="1548" top="227" right="1648" bottom="259"/>
<Line1Text Enable="1" Text="请上电"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="150" ActivityType="3" flags="0" name="上电缓冲3秒钟">
<Rect left="1548" top="273" right="1648" bottom="305"/>
<Line1Text Enable="1" Text="等待上电中"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="151" ActivityType="3" flags="0" name="通讯">
<Rect left="1550" top="368" right="1650" bottom="400"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="49" name="DEP1180" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="读C0离合器压力电流自学习数据">
<Rect left="1550" top="618" right="1650" bottom="650"/>
<Line1Text Enable="1" Text="比对C0离合器压力电流自学习数据"/>
<Script>#COMM 0x22 0x01 0x02
if(@0==0x62)then
   DString_Read_Spec_Data_From_ECU=hexstr(@3-@64);
engine.println("c0离合器压力电流自学习数据:"..DString_Read_Spec_Data_From_ECU);
engine.println(spec_0102);
if (string.match(DString_Read_Spec_Data_From_ECU,spec_0102)) then
  engine.SetLineText(2,"比对成功");
  engine.println("比对成功");
  engine.LastError = 0;
  engine.StatValue= DString_Read_Spec_Data_From_ECU;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对c0离合器压力电流自学习数据失败");
  engine.println("比对c0离合器压力电流自学习数据失败");
  engine.StatValue= DString_Read_Config_Code_From_ECU;
  engine.StatPoint=spec_0102;
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="42" name="DEP1145" type="8" flags="97"/>
</Activity>
<Activity id="154" ActivityType="3" flags="0" name="是否写HCU特性数据">
<Rect left="1321" top="11" right="1421" bottom="43"/>
<Line1Text Enable="1" Text="是否写HCU特性数据？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="1278" top="75" right="1310" bottom="107"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1979" top="564" right="2079" bottom="596"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="157" ActivityType="3" flags="0" name="读电池SOC">
<Rect left="325" top="912" right="425" bottom="944"/>
<Line1Text Enable="1" Text="读电池SOC"/>
<Script>#COMM 0x22 0x01 0x55
if(@0==0x62)then

res=@3*256+@4;
res=res*0.1;
if (res &gt;= 30 and res &lt;= 70) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

engine.println("电池SOC百分比:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=30;
engine.StatUpper=70;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP898" type="8" flags="99"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="48" top="908" right="80" bottom="940"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="读电池SOC">
<Rect left="202" top="912" right="302" bottom="944"/>
<Line1Text Enable="1" Text="读电池SOC"/>
<Script>#COMM 0x22 0x01 0x55
if(@0==0x62)then

res=@3*256+@4;
res=res*0.1;
if (res &gt;= 20 and res &lt;= 70) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

engine.println("电池SOC百分比:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=20;
engine.StatUpper=70;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP898" type="8" flags="99"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="1272" top="132" right="1304" bottom="164"/>
</Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="1301" top="180" right="1333" bottom="212"/>
</Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1289" top="420" right="1321" bottom="452"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="切诊断">
<Rect left="117" top="339" right="217" bottom="371"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="73" name="DEP1106" type="8" flags="97"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="116" top="389" right="216" bottom="421"/>
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
<Activity id="171" ActivityType="3" flags="0" name="发送key">
<Rect left="115" top="486" right="215" bottom="518"/>
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
</Script><assessment no="3" name="DEP861" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="13" flags="0" name="seedtokey">
<Rect left="115" top="435" right="215" bottom="467"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A68795B"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="169" type="0">
</Transition>
<Transition StartId="5" EndId="115" type="0">
</Transition>
<Transition StartId="12" EndId="19" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="1">
<Expression>C131_HCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="19" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_HCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="24" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="24" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="14" type="0">
</Transition>
<Transition StartId="19" EndId="17" type="1">
<Expression>C131_HCU_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="14" type="0">
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
<Expression>C131_HCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="25" EndId="155" type="0">
</Transition>
<Transition StartId="26" EndId="66" type="0">
</Transition>
<Transition StartId="27" EndId="25" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="1">
<Expression>C131_HCU_WD_Execute_Flag==true and DString_C131_VariCoding~="" and DString_C131_VariCoding~="HCU00_varicoding" and VMTLOC ~= "RIN" </Expression></Transition>
<Transition StartId="29" EndId="66" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_HCU_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="35" EndId="77" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="45" EndId="101" type="0">
</Transition>
<Transition StartId="47" EndId="53" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="102" type="0">
</Transition>
<Transition StartId="51" EndId="48" type="0">
</Transition>
<Transition StartId="52" EndId="75" type="0">
</Transition>
<Transition StartId="53" EndId="45" type="0">
</Transition>
<Transition StartId="54" EndId="36" type="0">
</Transition>
<Transition StartId="56" EndId="128" type="0">
</Transition>
<Transition StartId="56" EndId="122" type="1">
<Expression>C131_HCU_Check_Motor_Urgency_Control_Execute_Flag==true</Expression></Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="57" EndId="47" type="1">
<Expression>C131_HCU_Check_Battery_Open_Execute_Flag == true</Expression></Transition>
<Transition StartId="58" EndId="54" type="0">
</Transition>
<Transition StartId="58" EndId="51" type="1">
<Expression>C131_HCU_Check_Battery_Close_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="52" type="1">
<Expression>C131_HCU_Check_Warm_Water_Pump_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="100" type="0">
</Transition>
<Transition StartId="66" EndId="27" type="1">
<Expression>C131_HCU_WD_Execute_Flag==true and DString_C131_VariCoding~="" and DString_C131_VariCoding~="HCU00_varicoding"</Expression></Transition>
<Transition StartId="66" EndId="155" type="0">
</Transition>
<Transition StartId="67" EndId="129" type="0">
</Transition>
<Transition StartId="69" EndId="67" type="0">
</Transition>
<Transition StartId="70" EndId="74" type="0">
</Transition>
<Transition StartId="70" EndId="69" type="1">
<Expression>C131_HCU_ActiveTransport_Execute_Flag==true</Expression></Transition>
<Transition StartId="71" EndId="130" type="0">
</Transition>
<Transition StartId="73" EndId="71" type="0">
</Transition>
<Transition StartId="74" EndId="73" type="1">
<Expression>C131_HCU_InactiveTransport_Execute_Flag==true</Expression></Transition>
<Transition StartId="74" EndId="108" type="0">
</Transition>
<Transition StartId="75" EndId="137" type="0">
</Transition>
<Transition StartId="77" EndId="60" type="0">
</Transition>
<Transition StartId="77" EndId="79" type="1">
<Expression>C131_HCU_Read_BMS_Info_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11")</Expression></Transition>
<Transition StartId="79" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="1">
<Expression>VMTLOC=="TR2"</Expression></Transition>
<Transition StartId="83" EndId="157" type="1">
<Expression>VMTLOC=="FIN"</Expression></Transition>
<Transition StartId="83" EndId="158" type="0">
</Transition>
<Transition StartId="83" EndId="160" type="1">
<Expression>VMTLOC=="FUN"</Expression></Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="118" type="0">
</Transition>
<Transition StartId="89" EndId="91" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="60" type="0">
</Transition>
<Transition StartId="96" EndId="100" type="0">
</Transition>
<Transition StartId="97" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="138" type="0">
</Transition>
<Transition StartId="99" EndId="56" type="0">
</Transition>
<Transition StartId="100" EndId="56" type="0">
</Transition>
<Transition StartId="100" EndId="97" type="1">
<Expression>C131_HCU_Check_LT_E_Water_Pump_Execute_Flag</Expression></Transition>
<Transition StartId="101" EndId="58" type="0">
</Transition>
<Transition StartId="102" EndId="54" type="0">
</Transition>
<Transition StartId="104" EndId="132" type="1">
<Expression>C131_HCU_SPEC_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21")</Expression></Transition>
<Transition StartId="104" EndId="70" type="0">
</Transition>
<Transition StartId="105" EndId="107" type="0">
</Transition>
<Transition StartId="106" EndId="105" type="0">
</Transition>
<Transition StartId="107" EndId="134" type="0">
</Transition>
<Transition StartId="108" EndId="156" type="0">
</Transition>
<Transition StartId="109" EndId="133" type="0">
</Transition>
<Transition StartId="110" EndId="109" type="0">
</Transition>
<Transition StartId="112" EndId="135" type="0">
</Transition>
<Transition StartId="113" EndId="112" type="0">
</Transition>
<Transition StartId="115" EndId="4" type="3">
</Transition>
<Transition StartId="115" EndId="116" type="4">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="116" EndId="131" type="5">
</Transition>
<Transition StartId="117" EndId="5" type="0">
</Transition>
<Transition StartId="118" EndId="89" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="123" type="0">
</Transition>
<Transition StartId="122" EndId="119" type="0">
</Transition>
<Transition StartId="123" EndId="128" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="127" type="0">
</Transition>
<Transition StartId="126" EndId="124" type="0">
</Transition>
<Transition StartId="127" EndId="57" type="0">
</Transition>
<Transition StartId="128" EndId="126" type="1">
<Expression>C131_HCU_Check_Battery_Urgency_Control_Execute_Flag==true</Expression></Transition>
<Transition StartId="128" EndId="57" type="0">
</Transition>
<Transition StartId="129" EndId="74" type="0">
</Transition>
<Transition StartId="130" EndId="108" type="0">
</Transition>
<Transition StartId="131" EndId="36" type="0">
</Transition>
<Transition StartId="132" EndId="163" type="0">
</Transition>
<Transition StartId="133" EndId="135" type="0">
</Transition>
<Transition StartId="134" EndId="110" type="1">
<Expression>spec_0102~=""</Expression></Transition>
<Transition StartId="134" EndId="133" type="0">
</Transition>
<Transition StartId="135" EndId="146" type="0">
</Transition>
<Transition StartId="137" EndId="96" type="0">
</Transition>
<Transition StartId="138" EndId="99" type="0">
</Transition>
<Transition StartId="140" EndId="151" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="144" type="0">
</Transition>
<Transition StartId="143" EndId="152" type="0">
</Transition>
<Transition StartId="144" EndId="143" type="0">
</Transition>
<Transition StartId="146" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="149" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="140" type="0">
</Transition>
<Transition StartId="151" EndId="141" type="0">
</Transition>
<Transition StartId="152" EndId="70" type="0">
</Transition>
<Transition StartId="154" EndId="104" type="0">
</Transition>
<Transition StartId="154" EndId="70" type="5">
</Transition>
<Transition StartId="155" EndId="154" type="1">
<Expression>VMTLOC == "REP"</Expression></Transition>
<Transition StartId="155" EndId="104" type="0">
</Transition>
<Transition StartId="156" EndId="35" type="0">
</Transition>
<Transition StartId="157" EndId="85" type="0">
</Transition>
<Transition StartId="158" EndId="85" type="0">
</Transition>
<Transition StartId="160" EndId="85" type="0">
</Transition>
<Transition StartId="163" EndId="134" type="0">
</Transition>
<Transition StartId="164" EndId="106" type="1">
<Expression>spec_0101~=""</Expression></Transition>
<Transition StartId="165" EndId="113" type="1">
<Expression>spec_0103~=""</Expression></Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="170" EndId="172" type="0">
</Transition>
<Transition StartId="171" EndId="13" type="0">
</Transition>
<Transition StartId="172" EndId="171" type="0">
</Transition>
</Transitions>
</Process>

