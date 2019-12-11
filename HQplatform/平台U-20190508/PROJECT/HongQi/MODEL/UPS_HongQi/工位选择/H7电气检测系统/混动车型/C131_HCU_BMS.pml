<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1071" pbltext="DEP1222">
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
<Rect left="1064" top="11" right="1164" bottom="43"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="2196" top="1594" right="2296" bottom="1626"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="混动控制系统">
<Rect left="1063" top="64" right="1163" bottom="96"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Script>engine.println("SPEC_DATA:"..spec_data);</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="1065" top="220" right="1165" bottom="252"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1064" top="114" right="1164" bottom="146"/>
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
<Rect left="1065" top="276" right="1165" bottom="308"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="73" name="DEP1106" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="1064" top="326" right="1164" bottom="358"/>
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
<Rect left="1063" top="423" right="1163" bottom="455"/>
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
<Activity id="35" ActivityType="4" flags="0" name="路由节点">
<Rect left="1097" top="494" right="1129" bottom="526"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="2197" top="1530" right="2297" bottom="1562"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1929" top="733" right="2029" bottom="765"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="Check Battery always open Relay">
<Rect left="1929" top="618" right="2029" bottom="650"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="2F">
<Rect left="2091" top="677" right="2191" bottom="709"/>
<Line1Text Enable="1" Text="关闭双蓄电池常开继电器"/>
<Script>#COMM 0x2f 0x02 0x0c 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="38" name="DEP1000" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="2092" top="730" right="2192" bottom="762"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="Check Battery always close Relay">
<Rect left="2092" top="618" right="2192" bottom="650"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="Check Engine warm water pump">
<Rect left="1231" top="621" right="1331" bottom="653"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="2F">
<Rect left="1929" top="678" right="2029" bottom="710"/>
<Line1Text Enable="1" Text="打开双蓄电池常开继电器"/>
<Script>#COMM 0x2f 0x02 0x0d 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="37" name="DEP999" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="2253" top="560" right="2285" bottom="592"/>
</Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="1609" top="558" right="1641" bottom="590"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="路由节点">
<Rect left="1962" top="560" right="1994" bottom="592"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="2127" top="561" right="2159" bottom="593"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="1266" top="556" right="1298" bottom="588"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="2F">
<Rect left="1230" top="678" right="1330" bottom="710"/>
<Line1Text Enable="1" Text="设置发动机暖水泵值"/>
<Script>#COMM 0x2f 0x02 0x02 0x03 0x4e 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP995" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="1096" top="557" right="1128" bottom="589"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="Read BMS Information">
<Rect left="1062" top="615" right="1162" bottom="647"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="读主负继电器故障">
<Rect left="1062" top="673" right="1162" bottom="705"/>
<Line1Text Enable="1" Text="读主负继电器故障"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x4f
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
engine.StatValue=@3;
engine.StatPoint=0x00;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP895" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="读预充继电器故障">
<Rect left="1061" top="726" right="1161" bottom="758"/>
<Line1Text Enable="1" Text="读预充继电器故障"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x50
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
engine.StatValue=@3;
engine.StatPoint=0x00;
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
<Rect left="1062" top="784" right="1162" bottom="816"/>
<Line1Text Enable="1" Text="读主正继电器故障"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x53
if(@0==0x62)then

if(@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.println("主负继电器故障:"..@3);
engine.SetLineText(3,@3);
engine.StatValue=@3;
engine.StatPoint=0x00;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="18" name="DEP897" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="读电池SOC">
<Rect left="1061" top="839" right="1161" bottom="871"/>
<Line1Text Enable="1" Text="读电池SOC"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x55
if(@0==0x62)then

res=@3*256+@4;
res=res*0.1;
if (res &gt;= 35 and res &lt;= 70) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
      engine.StatValue=res;
end

engine.println("电池SOC百分比:"..res);
engine.SetLineText(3,res);
engine.StatValue=res;
engine.StatLower=35;
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
<Rect left="1060" top="897" right="1160" bottom="929"/>
<Line1Text Enable="1" Text="读电池温度"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Rect left="1059" top="955" right="1159" bottom="987"/>
<Line1Text Enable="1" Text="电池状态"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x4d
if(@0==0x62)then

res=@3;
if (res==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.println("电池状态:"..res);
engine.SetLineText(2,res);
engine.StatValue=@3;
engine.StatPoint=0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="22" name="DEP900" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="BMS主控制器软件版本号">
<Rect left="1059" top="1017" right="1159" bottom="1049"/>
<Line1Text Enable="1" Text="BMS主控制器软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xDC
if(@0==0x62)then
DString1=@3;

engine.SetLineText(3,DString1);
engine.println("软件版本号:"..DString1);
   if(0x06 == DString1) then                             
      engine.LastError = 0;
      engine.println("比软件版本号成功");
   else
      engine.LastError = 1;
      engine.TestResult = 1;
      engine.println("比软件版本号失败");
   end
	engine.StatValue=DString1;
	engine.StatPoint=0x05;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="23" name="DEP901" type="8" flags="99"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="BMS从控制器软件版本号">
<Rect left="1060" top="1076" right="1160" bottom="1108"/>
<Line1Text Enable="1" Text="BMS从控制器软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xDD
if(@0==0x62)then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes)


</Script><assessment no="24" name="DEP902" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="BMS从控制器硬件版本号">
<Rect left="1058" top="1181" right="1158" bottom="1213"/>
<Line1Text Enable="1" Text="BMS从控制器硬件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xDF
if(@0==0x62)then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes)


</Script><assessment no="26" name="DEP904" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="电池总成电压">
<Rect left="1059" top="1236" right="1159" bottom="1268"/>
<Line1Text Enable="1" Text="电池总成电压"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Rect left="1060" top="1290" right="1160" bottom="1322"/>
<Line1Text Enable="1" Text="最大单体电压"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Rect left="1061" top="1345" right="1161" bottom="1377"/>
<Line1Text Enable="1" Text="最大单体电压位置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xE2
if(@0==0x62)then

res=@3+1;
if (res &gt;= 1 and res &lt;= 96) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.println("最大单体电压:"..res);
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
<Rect left="1061" top="1400" right="1161" bottom="1432"/>
<Line1Text Enable="1" Text="最小单体电压"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Rect left="1060" top="1452" right="1160" bottom="1484"/>
<Line1Text Enable="1" Text="最小单体电压位置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xE4
if(@0==0x62)then

res=@3 + 1;
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
<Rect left="1229" top="794" right="1329" bottom="826"/>
<Script>#COMM 0x2f 0x02 0x02 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="Check LT E-Water pump">
<Rect left="1394" top="623" right="1494" bottom="655"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="2F">
<Rect left="1393" top="680" right="1493" bottom="712"/>
<Line1Text Enable="1" Text="打开低温冷却水泵"/>
<Script>#COMM 0x2f 0x02 0x03 0x03 0x4e 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP996" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="1390" top="791" right="1490" bottom="823"/>
<Script>#COMM 0x2f 0x02 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="1428" top="557" right="1460" bottom="589"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="1928" top="790" right="2028" bottom="822"/>
<Script>#COMM 0x2f 0x02 0x0d 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="2092" top="788" right="2192" bottom="820"/>
<Script>#COMM 0x2f 0x02 0x0c 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="103" ActivityType="13" flags="0" name="seedtokey">
<Rect left="1063" top="372" right="1163" bottom="404"/>
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
<Activity id="115" ActivityType="3" flags="0" name="通讯">
<Rect left="1064" top="165" right="1164" bottom="197"/>
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
<Rect left="950" top="164" right="1050" bottom="196"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="结束通讯">
<Rect left="949" top="113" right="1049" bottom="145"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="BMS主控制器硬件版本号">
<Rect left="1059" top="1130" right="1159" bottom="1162"/>
<Line1Text Enable="1" Text="BMS主控制器硬件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0xDE
if(@0==0x62)then
DString1=@3;

engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
   if(0x01 == DString1) then                             
      engine.LastError = 0;
      engine.println("比硬件版本号成功");
   else
      engine.LastError = 1;
      engine.TestResult = 1;
      engine.println("比硬件版本号失败");
   end
      engine.StatValue=DString1;
      engine.StatPoint=0x01;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="25" name="DEP903" type="8" flags="99"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="2F">
<Rect left="1573" top="672" right="1673" bottom="704"/>
<Line1Text Enable="1" Text="set Motor Urgency Control value"/>
<Script>#COMM 0x2f 0x02 0x04 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP997" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1574" top="732" right="1674" bottom="764"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="Check Motor Urgency Control">
<Rect left="1574" top="618" right="1674" bottom="650"/>
<Line1Text Enable="1" Text="Check Motor Urgency Control"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="1574" top="785" right="1674" bottom="817"/>
<Script>#COMM 0x2f 0x02 0x04 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="2F">
<Rect left="1749" top="673" right="1849" bottom="705"/>
<Line1Text Enable="1" Text="set  Battery Urgency Control value"/>
<Script>#COMM 0x2f 0x02 0x05 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="36" name="DEP998" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1749" top="728" right="1849" bottom="760"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="Check Battery Urgency Control">
<Rect left="1750" top="619" right="1850" bottom="651"/>
<Line1Text Enable="1" Text="Check Battery Urgency Control"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="ReturnControltoECU">
<Rect left="1750" top="786" right="1850" bottom="818"/>
<Script>#COMM 0x2f 0x02 0x05 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="1783" top="559" right="1815" bottom="591"/>
</Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="985" top="1529" right="1017" bottom="1561"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1228" top="735" right="1328" bottom="767"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1391" top="735" right="1491" bottom="767"/>
<Line1Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="1032" top="569" right="1064" bottom="601"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="1209" top="591" right="1241" bottom="623"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="1374" top="587" right="1406" bottom="619"/>
</Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="1534" top="589" right="1566" bottom="621"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="1718" top="585" right="1750" bottom="617"/>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="1909" top="591" right="1941" bottom="623"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="2070" top="588" right="2102" bottom="620"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="115" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="103" type="0">
</Transition>
<Transition StartId="8" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="77" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
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
<Transition StartId="56" EndId="122" type="0">
</Transition>
<Transition StartId="57" EndId="47" type="0">
</Transition>
<Transition StartId="58" EndId="51" type="0">
</Transition>
<Transition StartId="60" EndId="52" type="0">
</Transition>
<Transition StartId="75" EndId="137" type="0">
</Transition>
<Transition StartId="77" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
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
<Transition StartId="100" EndId="97" type="0">
</Transition>
<Transition StartId="101" EndId="58" type="0">
</Transition>
<Transition StartId="102" EndId="54" type="0">
</Transition>
<Transition StartId="103" EndId="8" type="0">
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
<Transition StartId="128" EndId="126" type="0">
</Transition>
<Transition StartId="131" EndId="36" type="0">
</Transition>
<Transition StartId="137" EndId="96" type="0">
</Transition>
<Transition StartId="138" EndId="99" type="0">
</Transition>
<Transition StartId="152" EndId="79" type="1">
<Expression>C131_HCU_Read_BMS_Info_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11")</Expression></Transition>
<Transition StartId="153" EndId="52" type="1">
<Expression>C131_HCU_Check_Warm_Water_Pump_Execute_Flag == true</Expression></Transition>
<Transition StartId="154" EndId="97" type="1">
<Expression>C131_HCU_Check_LT_E_Water_Pump_Execute_Flag</Expression></Transition>
<Transition StartId="155" EndId="122" type="1">
<Expression>C131_HCU_Check_Motor_Urgency_Control_Execute_Flag==true</Expression></Transition>
<Transition StartId="156" EndId="126" type="1">
<Expression>C131_HCU_Check_Battery_Urgency_Control_Execute_Flag==true</Expression></Transition>
<Transition StartId="157" EndId="47" type="1">
<Expression>C131_HCU_Check_Battery_Open_Execute_Flag == true</Expression></Transition>
<Transition StartId="158" EndId="51" type="1">
<Expression>C131_HCU_Check_Battery_Close_Execute_Flag == true</Expression></Transition>
</Transitions>
</Process>

