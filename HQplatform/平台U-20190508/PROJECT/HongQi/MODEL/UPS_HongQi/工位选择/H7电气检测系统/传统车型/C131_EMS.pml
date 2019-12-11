<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1113" pbltext="DEP142">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_EMS_After_Roller_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Engine_Displacement" type="8" dir="0" data="DString_C131_Engine_Displacement"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="C131_EMS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_ConfigInfo" type="8" dir="0" data="DString_C131_ConfigInfo"/>
<Variable id="C131_EMS_Sensor_Test_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EMS_Actuator_Test_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="4" right="104" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="625" top="4771" right="725" bottom="4803"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="4" top="102" right="104" bottom="134"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="发动机检测 (EMS)">
<Rect left="3" top="54" right="103" bottom="86"/>
<TitleText Enable="1" Text="发动机检测 (EMS)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="清DTC">
<Rect left="5" top="198" right="105" bottom="230"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3003" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="关闭空调">
<Rect left="615" top="680" right="715" bottom="712"/>
<Line1Text Enable="1" Text="关闭空调！"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="EMS冷却液温度(空调关)">
<Rect left="615" top="734" right="715" bottom="766"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
temperature=resu;

if (90.0&lt;temperature and temperature&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature; 
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature);
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(temperature));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP428" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="D_EMS发动机怠速(空调关)">
<Rect left="615" top="789" right="715" bottom="821"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测 (EMS)"/>
<Line2Text Enable="1" Text="发动机怠速"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if( (DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993") )then
  Mult=0.25;
  Smd=0;
  UTG=650;
  OTG=750;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=700;
  OTG=800;

end
engine.println(DString_C131_Engine_Displacement)

if(@3&gt;128)then
  resu = (( (@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (((@3 * 256 + @4) * Mult ) + Smd);
end
engine.println("resu="..resu);

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="15" name="DEP429" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="检测失败">
<Rect left="498" top="680" right="598" bottom="712"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="检测失败">
<Rect left="498" top="735" right="598" bottom="767"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="检测失败">
<Rect left="501" top="790" right="601" bottom="822"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="EMS冷却液温度(空调关)">
<Rect left="616" top="845" right="716" bottom="877"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x01 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
temperature=resu;
engine.println("temperature="..temperature);
if (90.0&lt;temperature and temperature&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature.."C");
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(temperature).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP430" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="检测失败">
<Rect left="498" top="845" right="598" bottom="877"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="实际点火角">
<Rect left="616" top="897" right="716" bottom="929"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="实际点火角"/>
<Script>#COMM 0x22 0x01 0x36

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=-6;
  OTG=10;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=-6;
  OTG=6;
end

if(@3&gt;128)then
  resu = (( (@3 - 256) * Mult ) + Smd);
else
  resu = (  (@3 * Mult) + Smd );
end
engine.println("resu="..resu);

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.SetLineText(3,resu.."KW");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=KW");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="17" name="DEP431" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="检测失败">
<Rect left="504" top="898" right="604" bottom="930"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="EMS 冷却液温度(空调关)">
<Rect left="615" top="953" right="715" bottom="985"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x01 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
speed=resu;

if (90.0&lt;speed and speed&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=speed;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=speed;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,speed.."C");
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(speed).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="18" name="DEP430" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="检测失败">
<Rect left="503" top="954" right="603" bottom="986"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="EMS 电子节气门开度">
<Rect left="615" top="1003" right="715" bottom="1035"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="电子节气门开度"/>
<Script>#COMM 0x22 0x01 0x0b

if(@0==0x62)then
if(@3 &gt;= 128) then
   resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
else
   resu = (((@3* 256 +@4) * 0.024414063 ) +0) * 1.0;
end
position_angle=resu;

if (0 &lt; position_angle and position_angle&lt; 4.0) then
  engine.LastError = 0;
  engine.StatValue=position_angle;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=position_angle;
  engine.StatLower=0;
  engine.StatUpper=4.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,position_angle.."DK");
engine.SetLineText(3,"#L=BMPBAR,".."0.0"..",".."4.0"..",".."1"..","..tostring(position_angle).."#R=DK");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="19" name="DEP432" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="检测失败">
<Rect left="502" top="1004" right="602" bottom="1036"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="EMS 冷却液温度(空调关)">
<Rect left="616" top="1056" right="716" bottom="1088"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x01 0x2F

if(@0==0x62)then
--resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
resu = ((@3* 0.75 ) - 48) * 1.0;
temperature=resu;

if (90 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature.."C");
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(temperature).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP430" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="检测失败">
<Rect left="503" top="1059" right="603" bottom="1091"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="EMS 进气量">
<Rect left="617" top="1113" right="717" bottom="1145"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="进气量"/>
<Script>#COMM 0x22 0x01 0x20

if(@0==0x62)then
--resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
resu = ( (@3* 4 ) ) * 1.0;
speed=resu;

if (9 &lt; speed and speed&lt; 17.0) then
  engine.LastError = 0;
  engine.StatValue=speed;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=speed;
  engine.StatLower=9.0;
  engine.StatUpper=17.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,speed.."kg/h");
engine.SetLineText(3,"#L=BMPBAR,".."9.0"..",".."17.0"..",".."1"..","..tostring(speed).."kg/h");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="21" name="DEP433" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="检测失败">
<Rect left="500" top="1112" right="600" bottom="1144"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="EMS 冷却液温度">
<Rect left="618" top="1161" right="718" bottom="1193"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x01 0x2F

if(@0==0x62)then
--resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
resu = ((@3 * 0.75 ) -48) * 1.0;
temperature=resu;

if (90.0 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature.."C");
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(temperature).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="22" name="DEP430" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="检测失败">
<Rect left="500" top="1160" right="600" bottom="1192"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="EMS 喷油时间">
<Rect left="618" top="1215" right="718" bottom="1247"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="喷油时间"/>
<Script>#COMM 0x22 0x01 0x6D

if(@0==0x62)then
resu =  ( (@3 * 256 + @4) * 0.016 ) ;
time=resu;

if (2.0 &lt; time and time&lt; 4.0) then
  engine.LastError = 0;
 engine.StatValue=time;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=time;
  engine.StatLower=2.0;
  engine.StatUpper=4.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3, time.."ms");
engine.SetLineText(3,"#L=BMPBAR,".."2.0"..",".."4.0"..",".."1"..","..tostring(time).."#R=ms");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="23" name="DEP434" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="检测失败">
<Rect left="505" top="1214" right="605" bottom="1246"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="打开空调手动测试">
<Rect left="618" top="1264" right="718" bottom="1296"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开空调"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="618" top="1314" right="718" bottom="1346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="44" ActivityType="3" flags="0" name="检测失败">
<Rect left="502" top="1269" right="602" bottom="1301"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="发动机温度">
<Rect left="618" top="1364" right="718" bottom="1396"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x01 0x2f

if(@0==0x62)then
resu = ( (@3 * 0.75  ) - 48) * 1.0;
temperature=resu;

if (90.0 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature.."C");
engine.SetLineText(3,"#L=BMPBAR,".."90.0"..",".."143.25"..",".."1"..","..tostring(temperature).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="24" name="DEP435" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="检测失败">
<Rect left="505" top="1365" right="605" bottom="1397"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="619" top="1414" right="719" bottom="1446"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="开空调时发动机怠速"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=750;
  OTG=850;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=800;
  OTG=900;
end

if(@3&gt;128)then
  resu = (( (@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (( (@3 * 256 + @4) * Mult ) + Smd)*1;
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="25" name="DEP436" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="检测失败">
<Rect left="504" top="1415" right="604" bottom="1447"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="请将档位切换到 P自动测试">
<Rect left="618" top="1466" right="718" bottom="1498"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请将档位切换到 P"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="617" top="1513" right="717" bottom="1545"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.StatValue=@3;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP437" type="8" flags="97"/>
</Activity>
<Activity id="53" ActivityType="3" flags="0" name="开空调时P档发动机怠速自动测试">
<Rect left="617" top="1565" right="717" bottom="1597"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时P档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="616" top="1616" right="716" bottom="1648"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=750;
  OTG=850;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=800;
  OTG=900;
end

if(@3&gt;128)then
  resu = (((@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (((@3 * 256 + @4) * Mult ) + Smd);
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="27" name="DEP438" type="8" flags="97"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="检测失败">
<Rect left="502" top="1617" right="602" bottom="1649"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="档位切换到R自动测试">
<Rect left="617" top="1666" right="717" bottom="1698"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到R"/>
<Line3Text Enable="1" Text="清保持踩刹车踏板"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="618" top="1714" right="718" bottom="1746"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x07) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.StatValue=@3;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,@3);--显示距离结果


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="28" name="DEP439" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="检测失败">
<Rect left="506" top="1718" right="606" bottom="1750"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="开R档发动机怠速自动测试">
<Rect left="619" top="1765" right="719" bottom="1797"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时R档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="618" top="1813" right="718" bottom="1845"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=650;
  OTG=750;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=730;
  OTG=830;
end

if(@3&gt;128)then
  resu = (((@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (((@3 * 256 + @4) * Mult ) + Smd);
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="29" name="DEP440" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="档位切换到 N自动测试">
<Rect left="619" top="1860" right="719" bottom="1892"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请将档位切换到 N"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="检测失败">
<Rect left="507" top="1814" right="607" bottom="1846"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="619" top="1907" right="719" bottom="1939"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.StatValue=@3;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="30" name="DEP441" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="N档发动机怠速自动测试">
<Rect left="620" top="1957" right="720" bottom="1989"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时N档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="检测失败">
<Rect left="507" top="1909" right="607" bottom="1941"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="619" top="2007" right="719" bottom="2039"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=750;
  OTG=850;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=800;
  OTG=900;
end

if(@3&gt;128)then
  resu = (((@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (((@3 * 256 + @4) * Mult ) + Smd);
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="31" name="DEP442" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="档位切换到D手动测试">
<Rect left="619" top="2054" right="719" bottom="2086"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到D"/>
<Line3Text Enable="1" Text="请保持踩刹车踏板"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="检测失败">
<Rect left="507" top="2006" right="607" bottom="2038"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="620" top="2104" right="720" bottom="2136"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=@3;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP443" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="621" top="2151" right="721" bottom="2183"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="D档发动机怠速自动测试">
<Rect left="622" top="2199" right="722" bottom="2231"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时D档发动机怠速"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="621" top="2250" right="721" bottom="2282"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if(@0==0x62)then
if((DString_C131_Engine_Displacement == "2.494") or (DString_C131_Engine_Displacement == "2.993"))then
  Mult=0.25;
  Smd=0;
  UTG=650;
  OTG=750;
elseif(DString_C131_Engine_Displacement == "1.955")then
  Mult=0.25;
  Smd=0;
  UTG=730;
  OTG=830;
end

if(@3&gt;128)then
  resu = ( ( (@3 * 256 + @4 - 65536) * Mult ) + Smd);
else
  resu = (( (@3 * 256 + @4) * Mult ) + Smd);
end

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
--engine.SetLineText(3,resu.."RPM");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=RPM");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="33" name="DEP444" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="620" top="2295" right="720" bottom="2327"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="检测失败">
<Rect left="508" top="2105" right="608" bottom="2137"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="检测失败">
<Rect left="509" top="2250" right="609" bottom="2282"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="踩刹车踏板挂P档手动测试">
<Rect left="619" top="2344" right="719" bottom="2376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请踩刹车踏板，挂P档"/>
<Line3Text Enable="1" Text="OK？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="手动测试">
<Rect left="619" top="2391" right="719" bottom="2423"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="关闭空调"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="发动机冷却液温度自动测试">
<Rect left="619" top="3030" right="719" bottom="3062"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机冷却液温度"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="发动机冷却液温度">
<Rect left="619" top="3077" right="719" bottom="3109"/>
<Script>#COMM 0x22 0xdd 0x03
if(@0==0x62)then
resu = @3*1-40 ;
oilTmp=resu;
engine.println("发动机冷却液温度".. oilTmp);

if (oilTmp&gt;=15 and oilTmp&lt;=40) then
  engine.LastError = 0;
  engine.StatValue=temperature;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=temperature;
  engine.StatLower=15;
   engine.StatUpper=40;
end
engine.SetLineText(3,"#L=BMPBAR,".."15.0"..",".."40.0"..",".."1"..","..tostring(temperature).."#R=C");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="34" name="DEP1062" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="气压自动测试">
<Rect left="620" top="2877" right="720" bottom="2909"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="气压"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="检测失败">
<Rect left="506" top="3079" right="606" bottom="3111"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="气压">
<Rect left="620" top="2924" right="720" bottom="2956"/>
<Script>#COMM 0x22 0x01 0x09
if(@0==0x62)then
resu = (@3 * 256 + @4) * 0.0829175;
airPressure=resu;
engine.println("气压".. airPressure);
if (airPressure&gt;=930 and airPressure&lt;= 1050.0) then
  engine.LastError = 0;
  engine.StatValue=airPressure;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=airPressure
  engine.StatLower=930;
   engine.StatUpper=1050;
end
engine.SetLineText(3,"#L=BMPBAR,".."930.0"..",".."1050.0"..",".."1"..","..tostring(airPressure).."#R=pa");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="55" name="DEP446" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="检测失败">
<Rect left="502" top="2927" right="602" bottom="2959"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="发动机进气温度自动测试">
<Rect left="619" top="2709" right="719" bottom="2741"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机进气温度"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="进气温度">
<Rect left="620" top="2767" right="720" bottom="2799"/>
<Script>#COMM 0x22 0x01 0x07
if(@0==0x62)then

resu = (@3 * 256 + @4) ;
resu=Signed_bit16(resu);
resu = resu * 0.0078125 ;
temperature=resu;
engine.println(" 进气温度".. temperature);
if ( temperature &gt;=15 and temperature&lt;= 40) then
  engine.LastError = 0;
  engine.StatValue=temperature;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=temperature;
  engine.StatLower=15.0;
  engine.StatUpper=40.0;
end
engine.SetLineText(3,"#L=BMPBAR,".."15.0"..",".."40.0"..",".."1"..","..tostring(temperature).."#R=C");
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="36" name="DEP447" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="检测失败">
<Rect left="498" top="2766" right="598" bottom="2798"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="上游节气阀压力自动测试">
<Rect left="623" top="3407" right="723" bottom="3439"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="上游节气阀压力"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="上游节气阀压力">
<Rect left="623" top="3454" right="723" bottom="3486"/>
<Script>#COMM 0x22 0xfd 0x07
if(@0==0x62)then
resu = (@3 * 256 + @4) * 0.0829175 ;
temperature=resu;

engine.println(" 上游节气阀压力".. temperature);
if (temperature&gt;=930 and temperature&lt;=1050) then
  engine.LastError = 0;
  engine.StatValue=temperature;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=temperature;
  engine.StatLower=930;
  engine.StatUpper=1050.0;
end
engine.SetLineText(3,"#L=BMPBAR,".."930.0"..",".."1050.0"..",".."1"..","..tostring(temperature).."#R=pa");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="38" name="DEP1065" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="检测失败">
<Rect left="501" top="3455" right="601" bottom="3487"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="625" top="3881" right="725" bottom="3913"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="748" top="2448" right="780" bottom="2480"/>
</Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="652" top="2448" right="684" bottom="2480"/>
</Activity>
<Activity id="113" ActivityType="4" flags="0" name="路由节点">
<Rect left="747" top="2926" right="779" bottom="2958"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="电瓶电压自动测试">
<Rect left="620" top="2556" right="720" bottom="2588"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="电瓶电压"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="电瓶电压">
<Rect left="619" top="2605" right="719" bottom="2637"/>
<Script>#COMM 0x22 0x01 0x03
if(@0==0x62)then
resu = @3*0.1015625 + 0;
voltage=resu;

engine.println("电瓶电压".. voltage);

if (voltage&gt;=11 and voltage &lt;= 18) then
  engine.LastError = 0;
  engine.StatValue=voltage;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=voltage;
  engine.StatLower=11.0;
  engine.StatUpper=18.0;
end
engine.SetLineText(3,"#L=BMPBAR,".."11.0"..",".."18.0"..",".."1"..","..tostring(voltage).."#R=V");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="41" name="DEP452" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="501" top="2605" right="601" bottom="2637"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="4" top="298" right="104" bottom="330"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3034" name="DEP146" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="13" flags="0" name="计算key">
<Rect left="4" top="348" right="104" bottom="380"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x7D8AAC7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="发送key">
<Rect left="4" top="396" right="104" bottom="428"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3035" name="DEP147" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="4" top="249" right="104" bottom="281"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3004" name="DEP1098" type="8" flags="97"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="检测失败">
<Rect left="502" top="1515" right="602" bottom="1547"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="750" top="680" right="782" bottom="712"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="629" top="4675" right="729" bottom="4707"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="比对零件号">
<Rect left="230" top="74" right="330" bottom="106"/>
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
	elseif(string.len(DString_C131_Partnumber)==12)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	elseif(string.len(DString_C131_Partnumber)==13)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15);
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
end</Script><assessment no="1" name="DEP288" type="8" flags="105"/>
</Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="262" top="8" right="294" bottom="40"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="读硬件号">
<Rect left="355" top="61" right="455" bottom="93"/>
<Line1Text Enable="1" Text="读硬件号"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@10);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP289" type="8" flags="105"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="延时300MS">
<Rect left="355" top="112" right="455" bottom="144"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="390" top="9" right="422" bottom="41"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="658" top="8" right="690" bottom="40"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="513" top="9" right="545" bottom="41"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="479" top="65" right="579" bottom="97"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@12);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="3" name="DEP290" type="8" flags="105"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="延时300MS">
<Rect left="479" top="112" right="579" bottom="144"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="153" ActivityType="3" flags="0" name="读软件号">
<Rect left="625" top="62" right="725" bottom="94"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	--[[
	if(DString_C131_Partnumber == "3601015-0ML") then  
	DString1=string.char(@5,@6,@7,@8,@9,@10,@11,@12);
	else
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	end
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	]]--
	--[[
	if(DString_C131_Partnumber == "3601015-MC-A" )then
		StandValue="F01R0ADR69";
		--if("F01R0ADR69" == DString1) then    
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(DString_C131_Partnumber == "3601015-0MK")then
		StandValue="F01R0ADR68";
		--if("F01R0ADR68" == DString1) then  
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(DString_C131_Partnumber == "3601015-0ML" )then	--None
		StandValue="P408A240";
		--if("P408A240" == DString1) then    
		DString1=string.char(@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(DString_C131_Partnumber == "3601015-0NH")then
		StandValue="F01R0ADN35";
		--if("F01R0ADN35" == DString1) then  
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
	elseif(DString_C131_Partnumber == "3601015-MN")then	--None
		StandValue="F01R0ADR68";
		--if("F01R0ADR68" == DString1) then   
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
	else
		StandValue="";
	end
	]]--
	if(DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1GM12")then	--3601015-MC-A
		--StandValue="F01R0ADR69";
                StandValue="F01R0ADC8P";
	elseif(DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32")then	--3601015-0MK
		--StandValue="F01R0ADR68";
                StandValue="F01R0ADC8N";
	elseif(DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1BM32")then	--3601015-0NH
		StandValue="F01R0ADN35";
        elseif(DString_C131_Car_Tpye=="CMNA02A" or DString_C131_Car_Tpye=="CMBNA01A" or DString_C131_Car_Tpye=="CH1QM30" or DString_C131_Car_Tpye=="CH1QM40" or DString_C131_Car_Tpye=="CH1QM50")then
                StandValue="F01R0ADN1B";   
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
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

</Script><assessment no="4" name="DEP291" type="8" flags="105"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="延时300MS">
<Rect left="625" top="117" right="725" bottom="149"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="865" top="62" right="965" bottom="94"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="5" name="DEP292" type="8" flags="105"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="延时300MS">
<Rect left="864" top="116" right="964" bottom="148"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="899" top="9" right="931" bottom="41"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1263" top="60" right="1363" bottom="92"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP293" type="8" flags="1"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="日期读取">
<Rect left="1383" top="110" right="1483" bottom="142"/>
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
<Activity id="169" ActivityType="3" flags="0" name="比对VIN">
<Rect left="1263" top="110" right="1363" bottom="142"/>
<Line1Text Enable="1" Text="比对VIN"/>
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
end</Script><assessment no="7" name="DEP294" type="8" flags="1"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="发送时间">
<Rect left="1393" top="60" right="1493" bottom="92"/>
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
<Activity id="171" ActivityType="4" flags="0" name="路由节点">
<Rect left="1296" top="8" right="1328" bottom="40"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="2011" top="680" right="2111" bottom="712"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="174" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1511" top="113" right="1611" bottom="145"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="175" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1627" top="66" right="1727" bottom="98"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
engine.println("VMTLOC:"..VMTLOC);
if(@0==0x62)then
	if(string.len(DString_C131_VariCoding)==4)then
		DString_Read_Config_Code_From_ECU=hexstr(@3-@4);
	elseif(string.len(DString_C131_VariCoding)==6)then
		DString_Read_Config_Code_From_ECU=hexstr(@3-@5);
	else
	end   
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
</Script><assessment no="11" name="DEP296" type="8" flags="97"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="写配置码">
<Rect left="1512" top="62" right="1612" bottom="94"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2bin(VariCoding)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP295" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="1546" top="10" right="1578" bottom="42"/>
</Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="1419" top="8" right="1451" bottom="40"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1748" top="111" right="1848" bottom="143"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1862" top="63" right="1962" bottom="95"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA2
engine.println("配置码2标准值:"..DString_C131_ConfigInfo);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@7);
	engine.println("配置码2:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_ConfigInfo)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对配置码2失败");
		engine.println("比对配置码2失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_ConfigInfo;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="13" name="DEP369" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="写配置码2">
<Rect left="1749" top="63" right="1849" bottom="95"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>ConfigInfo=DString_C131_ConfigInfo;
engine.SetLineText(3,ConfigInfo);
engine.println("配置码2"..ConfigInfo);
#COMM 0x2e 0xF1 0xA2 hex2dec(ConfigInfo,1) hex2dec(ConfigInfo,3) hex2dec(ConfigInfo,5) hex2dec(ConfigInfo,7) hex2dec(ConfigInfo,9)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="12" name="DEP368" type="8" flags="97"/>
</Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="1784" top="11" right="1816" bottom="43"/>
</Activity>
<Activity id="193" ActivityType="4" flags="0" name="路由节点">
<Rect left="1895" top="10" right="1927" bottom="42"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="通讯">
<Rect left="4" top="150" right="104" bottom="182"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3000" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="117" top="150" right="217" bottom="182"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="4" flags="0" name="路由节点">
<Rect left="149" top="4360" right="181" bottom="4392"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="结束通讯">
<Rect left="117" top="100" right="217" bottom="132"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="201" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="2661" right="686" bottom="2693"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="自动驾驶">
<Rect left="629" top="4452" right="729" bottom="4484"/>
<Line1Text Enable="1" Text="驾驶请求测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xf0 0x10 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="66" name="DEP1066" type="8" flags="97"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="读状态">
<Rect left="628" top="4499" right="728" bottom="4531"/>
<Strategy TotalTime="10000" NokTime="0" RetryTimeOut="50" DelayTime="100"/>
<Line1Text Enable="1" Text="30秒内依次缓慢执行以下操作"/>
<Line2Text Enable="1" Text="制动踏板-&gt;油门踏板-&gt;挂P或N档-&gt;推拉定速巡航拨杆"/>
<Script>#COMM 0x31 0x03 0xf0 0x10 
if(@0==0x62)then
engine.println("驾驶请求测试状态".. @4);
if(@4==0x02)then
  engine.LastError = 0;
  --engine.StatValue=@4;
else
  engine.LastError = 0;
  --engine.LastError = 1;
  --engine.StatValue=@4;
  --engine.StatPoint=2;
end
engine.SetLineText(3,@4);
else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

for t=30,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end
</Script><assessment no="67" name="DEP1067" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="退出请求">
<Rect left="629" top="4555" right="729" bottom="4587"/>
<Line1Text Enable="1" Text="退出请求"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xf0 0x10

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="653" top="2821" right="685" bottom="2853"/>
</Activity>
<Activity id="207" ActivityType="4" flags="0" name="路由节点">
<Rect left="653" top="2981" right="685" bottom="3013"/>
</Activity>
<Activity id="208" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="3131" right="686" bottom="3163"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="多种进气压力自动测试">
<Rect left="621" top="3191" right="721" bottom="3223"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="多种进气压力"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="多种进气压力">
<Rect left="621" top="3236" right="721" bottom="3268"/>
<Script>#COMM 0x22 0xdd 0x06
if(@0==0x62)then
airPressure=@3;
engine.println("多种进气压力".. airPressure);
if (airPressure&gt;=97 and airPressure&lt;= 105.0) then
  engine.LastError = 0;
  engine.StatValue=airPressure;
else
  --engine.LastError = 1;
  engine.LastError = 0;
  engine.StatValue=airPressure
  engine.StatLower=97;
   engine.StatUpper=105;
end
engine.SetLineText(3,"#L=BMPBAR,".."97.0"..",".."105.0"..",".."1"..","..tostring(airPressure).."#R=pa");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="35" name="DEP1063" type="8" flags="97"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="检测失败">
<Rect left="498" top="3237" right="598" bottom="3269"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="212" ActivityType="4" flags="0" name="路由节点">
<Rect left="656" top="3292" right="688" bottom="3324"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="658" top="3504" right="690" bottom="3536"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="659" top="3554" right="691" bottom="3586"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="蓝图混动发动机检测">
<Rect left="628" top="4400" right="728" bottom="4432"/>
<Script></Script></Activity>
<Activity id="222" ActivityType="3" flags="0" name="检测失败">
<Rect left="512" top="4500" right="612" bottom="4532"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="223" ActivityType="3" flags="0" name="制动器测试">
<Rect left="625" top="3615" right="725" bottom="3647"/>
<Script></Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="制动器测试">
<Rect left="624" top="3664" right="724" bottom="3696"/>
<Line1Text Enable="1" Text="制动器测试请求"/>
<Script>#COMM 0x31 0x01 0xf0 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="68" name="DEP1068" type="8" flags="97"/>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="读状态">
<Rect left="625" top="3714" right="725" bottom="3746"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5"/>
<Script>#COMM 0x31 0x03 0xf0 0x00 

if(@0==0x71)then
engine.println("制动器测试状态:"..@4.." "..@5.." "..@6);
if (@4==0x02) then
  engine.LastError = 0;
else
  --engine.LastError = 1;
end
engine.SetLineText(3,tostring(@3)..tostring(@4)..tostring(@5));
  engine.StatValue=@4;
  engine.StatPoint=2;
else
  engine.TestResult = 1;
  engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="69" name="DEP1069" type="8" flags="97"/>
</Activity>
<Activity id="226" ActivityType="3" flags="0" name="退出请求">
<Rect left="625" top="3768" right="725" bottom="3800"/>
<Line1Text Enable="1" Text="退出请求"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xf0 0x00 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="227" ActivityType="3" flags="0" name="检测失败">
<Rect left="509" top="3713" right="609" bottom="3745"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="228" ActivityType="3" flags="0" name="一次启动设置">
<Rect left="624" top="3988" right="724" bottom="4020"/>
<Script></Script></Activity>
<Activity id="229" ActivityType="3" flags="0" name="一次启动设置">
<Rect left="624" top="4040" right="724" bottom="4072"/>
<Line1Text Enable="1" Text="一次启动设置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xf0 0x16

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="70" name="DEP1070" type="8" flags="97"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="退出请求">
<Rect left="624" top="4092" right="724" bottom="4124"/>
<Line1Text Enable="1" Text="退出请求"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="232" ActivityType="3" flags="0" name="检测失败">
<Rect left="513" top="4040" right="613" bottom="4072"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="普通节点">
<Rect left="2379" top="2154" right="2479" bottom="2186"/>
<Script></Script></Activity>
<Activity id="234" ActivityType="3" flags="0" name="刹车真空泵检测">
<Rect left="624" top="4138" right="724" bottom="4170"/>
<Script></Script></Activity>
<Activity id="235" ActivityType="3" flags="0" name="刹车真空泵检测">
<Rect left="626" top="4186" right="726" bottom="4218"/>
<Line1Text Enable="1" Text="刹车真空泵检测"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xf0 0x1d

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="71" name="DEP1071" type="8" flags="97"/>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="退出请求">
<Rect left="627" top="4239" right="727" bottom="4271"/>
<Line1Text Enable="1" Text="退出请求"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="检测失败">
<Rect left="514" top="4186" right="614" bottom="4218"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="660" top="3822" right="692" bottom="3854"/>
</Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="653" top="2501" right="685" bottom="2533"/>
</Activity>
<Activity id="242" ActivityType="4" flags="0" name="路由节点">
<Rect left="1662" top="10" right="1694" bottom="42"/>
</Activity>
<Activity id="243" ActivityType="4" flags="0" name="路由节点">
<Rect left="2045" top="11" right="2077" bottom="43"/>
</Activity>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="659" top="3934" right="691" bottom="3966"/>
</Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="4117" right="786" bottom="4149"/>
</Activity>
<Activity id="246" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="989" top="112" right="1089" bottom="144"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13" or DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="10378152AA";
        else
	        StandValue="10357833AA";
	end
        engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	DString1=@3-@12;
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("10357833AA" == DString1)then
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

</Script><assessment no="5" name="DEP292" type="8" flags="105"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="延时300MS">
<Rect left="989" top="164" right="1089" bottom="196"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="1023" top="10" right="1055" bottom="42"/>
</Activity>
<Activity id="249" ActivityType="3" flags="0" name="混动车型">
<Rect left="989" top="62" right="1089" bottom="94"/>
<Script></Script></Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="1156" top="218" right="1188" bottom="250"/>
</Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="662" top="4342" right="694" bottom="4374"/>
</Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="753" top="3688" right="785" bottom="3720"/>
</Activity>
<Activity id="253" ActivityType="3" flags="0" name="写车型">
<Rect left="1463" top="182" right="1563" bottom="214"/>
<Line1Text Enable="1" Text="写车型代码"/>
<Script>engine.SetLineText(3,DString_C131_Car_Tpye);
if(DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1GM12" or DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1BM32" or DString_C131_Car_Tpye=="CH1BM33")then
#COMM 0x2E 0xF1 0xA0 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
else
#COMM 0x2E 0xF1 0xA1 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="81" name="DEP1183" type="8" flags="97"/>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1565" top="230" right="1665" bottom="262"/>
<Line1Text Enable="1" Text="比对车型代码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if(DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1GM12" or DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29")then
#COMM 0x22 0xF1 0xA0
else
#COMM 0x22 0xF1 0xA1
end
engine.SetLineText(2,DString_C131_Car_Tpye);
engine.println("车型标准值:"..DString_C131_Car_Tpye);
if(@0==0x62)then
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
	DString1=@3-@9;
	engine.SetLineText(3,DString1);
	engine.println("读到车型代值:"..DString1);
	if (string.match(DString1,DString_C131_Car_Tpye)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Car_Tpye;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="82" name="DEP1184" type="8" flags="97"/>
</Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="656" top="3338" right="688" bottom="3370"/>
</Activity>
<Activity id="257" ActivityType="3" flags="0" name="30秒内">
<Rect left="507" top="3666" right="607" bottom="3698"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请在30秒内，依次完成以下操作"/>
<Line3Text Enable="1" Text="踩刹车踏板，油门踏板，挂P档或N档，拨动巡航按钮"/>
<Script></Script></Activity>
<Activity id="259" ActivityType="4" flags="0" name="路由节点">
<Rect left="662" top="4295" right="694" bottom="4327"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="758" top="4497" right="790" bottom="4529"/>
</Activity>
<Activity id="261" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1121" top="115" right="1221" bottom="147"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="10378390AA";
	elseif(DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or (DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"))then
		StandValue="10378390AA";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="10357833AA";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=@3-@12;
	--DString1=bin2hex(@3-@7);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("10357833AA" == DString1)then
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

</Script><assessment no="5" name="DEP292" type="8" flags="105"/>
</Activity>
<Activity id="262" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1121" top="167" right="1221" bottom="199"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="263" ActivityType="4" flags="0" name="路由节点">
<Rect left="1156" top="9" right="1188" bottom="41"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="改脸">
<Rect left="1121" top="65" right="1221" bottom="97"/>
<Script></Script></Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="785" top="8" right="817" bottom="40"/>
</Activity>
<Activity id="266" ActivityType="3" flags="0" name="读软件号">
<Rect left="750" top="117" right="850" bottom="149"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or (DString_C131_Car_Tpye=="CH1GM30" or DString_C131_Car_Tpye=="CH1GM23"))then	--3601015-MC-A
		StandValue="F01R0ADF2S";
	elseif(DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or (DString_C131_Car_Tpye=="CH1AM43" or DString_C131_Car_Tpye=="CH1AM44"))then
		StandValue="F01R0ADF2T";
	elseif(DString_C131_Car_Tpye=="CH1BM33" or DString_C131_Car_Tpye=="CH1BM34")then	--3601015-0NH
		StandValue="F01R0ADF2U";
        elseif(DString_C131_Car_Tpye=="CH1CM30" or DString_C131_Car_Tpye=="CH1CM31")then	--3601015-0NH
		StandValue="F01R0ADF2U";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="F01R0ADF2S";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="F01R0ADF2T";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="F01R0ADF2U";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);   
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

</Script><assessment no="4" name="DEP291" type="8" flags="105"/>
</Activity>
<Activity id="267" ActivityType="3" flags="0" name="延时300MS">
<Rect left="750" top="164" right="850" bottom="196"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="268" ActivityType="3" flags="0" name="改脸">
<Rect left="751" top="63" right="851" bottom="95"/>
<Script></Script></Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="783" top="218" right="815" bottom="250"/>
</Activity>
<Activity id="270" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1267" top="157" right="1367" bottom="189"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="271" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1268" top="206" right="1368" bottom="238"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="50" name="DEP293" type="8" flags="97"/>
</Activity>
<Activity id="272" ActivityType="3" flags="0" name="比对VIN">
<Rect left="1269" top="267" right="1369" bottom="299"/>
<Line1Text Enable="1" Text="比对VIN"/>
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
end</Script><assessment no="51" name="DEP294" type="8" flags="97"/>
</Activity>
<Activity id="273" ActivityType="4" flags="0" name="路由节点">
<Rect left="1409" top="161" right="1441" bottom="193"/>
</Activity>
<Activity id="274" ActivityType="3" flags="0" name="读DTC">
<Rect left="627" top="4719" right="727" bottom="4751"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0c
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="113" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="275" ActivityType="3" flags="0" name="油门踏板开度">
<Rect left="910" top="4634" right="1010" bottom="4666"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="电子油门踏板开度"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="276" ActivityType="3" flags="0" name="油门踏板开度">
<Rect left="914" top="4689" right="1014" bottom="4721"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x10
if(@0==0x62)then
resu = @3*256+@4;
throttlePos=resu*0.001525879;
engine.println("油门踏板开度"..throttlePos);
if (throttlePos &gt;= 50) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,"#L=BMPBAR,".."50"..",".."100"..",".."1"..","..tostring(throttlePos).."#R=DK");
engine.StatValue=throttlePos;
engine.StatLower=50;
engine.StatUpper=100;
else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="99" name="DEP1284" type="8" flags="97"/>
</Activity>
<Activity id="278" ActivityType="3" flags="0" name="IG ON状态确认">
<Rect left="915" top="4534" right="1015" bottom="4566"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请将车辆置于IG ON状态"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script><assessment no="40" name="DEP52" type="8" flags="97"/>
</Activity>
<Activity id="279" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="4619" right="696" bottom="4651"/>
</Activity>
<Activity id="280" ActivityType="3" flags="0" name="踩加速踏板确认">
<Rect left="918" top="4583" right="1018" bottom="4615"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请踩加速踏板"/>
<Line2Text Enable="1" Text="#L=持续1秒，开度大于50#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script><assessment no="40" name="DEP52" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="195" type="0">
</Transition>
<Transition StartId="4" EndId="3" type="0">
</Transition>
<Transition StartId="5" EndId="124" type="0">
</Transition>
<Transition StartId="8" EndId="10" type="0">
</Transition>
<Transition StartId="8" EndId="14" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="3">
</Transition>
<Transition StartId="10" EndId="15" type="4">
</Transition>
<Transition StartId="12" EndId="16" type="4">
</Transition>
<Transition StartId="12" EndId="18" type="3">
</Transition>
<Transition StartId="14" EndId="10" type="0">
</Transition>
<Transition StartId="15" EndId="12" type="0">
</Transition>
<Transition StartId="16" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="21" type="3">
</Transition>
<Transition StartId="18" EndId="20" type="4">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="24" type="3">
</Transition>
<Transition StartId="21" EndId="23" type="4">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="27" type="3">
</Transition>
<Transition StartId="24" EndId="26" type="4">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="30" type="3">
</Transition>
<Transition StartId="27" EndId="29" type="4">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="33" type="3">
</Transition>
<Transition StartId="30" EndId="32" type="4">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="36" type="3">
</Transition>
<Transition StartId="33" EndId="35" type="4">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="39" type="3">
</Transition>
<Transition StartId="36" EndId="38" type="4">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="4">
</Transition>
<Transition StartId="39" EndId="41" type="3">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="0">
</Transition>
<Transition StartId="41" EndId="44" type="0">
</Transition>
<Transition StartId="42" EndId="45" type="0">
</Transition>
<Transition StartId="44" EndId="42" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="4">
</Transition>
<Transition StartId="45" EndId="48" type="3">
</Transition>
<Transition StartId="46" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="4">
</Transition>
<Transition StartId="48" EndId="50" type="3">
</Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="3">
</Transition>
<Transition StartId="52" EndId="130" type="4">
</Transition>
<Transition StartId="53" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="55" type="4">
</Transition>
<Transition StartId="54" EndId="56" type="3">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="4">
</Transition>
<Transition StartId="57" EndId="59" type="3">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="3">
</Transition>
<Transition StartId="60" EndId="62" type="4">
</Transition>
<Transition StartId="61" EndId="63" type="0">
</Transition>
<Transition StartId="62" EndId="61" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="3">
</Transition>
<Transition StartId="63" EndId="65" type="4">
</Transition>
<Transition StartId="64" EndId="66" type="0">
</Transition>
<Transition StartId="65" EndId="64" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="3">
</Transition>
<Transition StartId="66" EndId="68" type="4">
</Transition>
<Transition StartId="67" EndId="69" type="0">
</Transition>
<Transition StartId="68" EndId="67" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="3">
</Transition>
<Transition StartId="69" EndId="74" type="4">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="3">
</Transition>
<Transition StartId="72" EndId="75" type="4">
</Transition>
<Transition StartId="73" EndId="76" type="0">
</Transition>
<Transition StartId="74" EndId="70" type="0">
</Transition>
<Transition StartId="75" EndId="73" type="0">
</Transition>
<Transition StartId="76" EndId="77" type="0">
</Transition>
<Transition StartId="77" EndId="112" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="208" type="3">
</Transition>
<Transition StartId="81" EndId="83" type="4">
</Transition>
<Transition StartId="82" EndId="84" type="0">
</Transition>
<Transition StartId="83" EndId="208" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="4">
</Transition>
<Transition StartId="84" EndId="207" type="3">
</Transition>
<Transition StartId="85" EndId="207" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="206" type="3">
</Transition>
<Transition StartId="87" EndId="90" type="4">
</Transition>
<Transition StartId="90" EndId="206" type="0">
</Transition>
<Transition StartId="91" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="219" type="3">
</Transition>
<Transition StartId="93" EndId="95" type="4">
</Transition>
<Transition StartId="95" EndId="219" type="0">
</Transition>
<Transition StartId="101" EndId="244" type="0">
</Transition>
<Transition StartId="110" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="112" EndId="241" type="1">
<Expression>C131_EMS_Sensor_Test_Execute_Flag==true and (( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" ) or ( DString_C131_Car_Tpye == "CH1DM14") or ( DString_C131_Car_Tpye == "CH1DM15") or ( DString_C131_Car_Tpye == "CH1LM21" ) or ( DString_C131_Car_Tpye == "CH1LM11") or ( DString_C131_Car_Tpye == "CH1MM21") or ( DString_C131_Car_Tpye == "CH1FM12") or ( DString_C131_Car_Tpye == "CH1FM13")) or LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) or (DString_C131_Car_Tpye == "CH1DM16" or DString_C131_Car_Tpye == "CH1DM17" or DString_C131_Car_Tpye == "CH1FM20" or DString_C131_Car_Tpye == "CH1FM30")</Expression></Transition>
<Transition StartId="113" EndId="220" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="201" type="3">
</Transition>
<Transition StartId="115" EndId="117" type="4">
</Transition>
<Transition StartId="117" EndId="201" type="0">
</Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="137" type="0">
</Transition>
<Transition StartId="124" EndId="120" type="0">
</Transition>
<Transition StartId="130" EndId="53" type="0">
</Transition>
<Transition StartId="131" EndId="8" type="1">
<Expression>(C131_EMS_After_Roller_Check_Execute_Flag == true) and ( DString_C131_Car_Tpye ~= "CH1DM11" ) and ( DString_C131_Car_Tpye ~= "CH1DM13") and ( DString_C131_Car_Tpye ~= "CH1DM14" ) and ( DString_C131_Car_Tpye ~= "CH1DM15") and ( DString_C131_Car_Tpye ~= "CH1LM21" ) and ( DString_C131_Car_Tpye ~= "CH1LM11") and ( DString_C131_Car_Tpye ~= "CH1MM21") and ( DString_C131_Car_Tpye ~= "CH1FM12" ) and ( DString_C131_Car_Tpye ~= "CH1FM13" ) and LibGeneral.CarTNC_Isnot_Hrid(DString_C131_Car_Tpye) and (DString_C131_Car_Tpye ~= "CH1DM16" and DString_C131_Car_Tpye ~= "CH1DM17" and DString_C131_Car_Tpye ~= "CH1FM20" and DString_C131_Car_Tpye ~= "CH1FM30")</Expression></Transition>
<Transition StartId="131" EndId="110" type="0">
</Transition>
<Transition StartId="132" EndId="274" type="0">
</Transition>
<Transition StartId="136" EndId="141" type="0">
</Transition>
<Transition StartId="137" EndId="136" type="1">
<Expression>C131_EMS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="137" EndId="141" type="0">
</Transition>
<Transition StartId="138" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="143" type="0">
</Transition>
<Transition StartId="141" EndId="138" type="1">
<Expression>C131_EMS_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="141" EndId="143" type="0">
</Transition>
<Transition StartId="142" EndId="153" type="1">
<Expression>C131_EMS_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="142" EndId="265" type="0">
</Transition>
<Transition StartId="143" EndId="144" type="1">
<Expression>C131_EMS_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="143" EndId="142" type="0">
</Transition>
<Transition StartId="144" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="142" type="0">
</Transition>
<Transition StartId="153" EndId="155" type="0">
</Transition>
<Transition StartId="155" EndId="269" type="0">
</Transition>
<Transition StartId="160" EndId="163" type="0">
</Transition>
<Transition StartId="163" EndId="250" type="0">
</Transition>
<Transition StartId="164" EndId="160" type="1">
<Expression>C131_EMS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="164" EndId="248" type="0">
</Transition>
<Transition StartId="166" EndId="169" type="0">
</Transition>
<Transition StartId="168" EndId="178" type="0">
</Transition>
<Transition StartId="169" EndId="273" type="0">
</Transition>
<Transition StartId="169" EndId="270" type="4">
</Transition>
<Transition StartId="170" EndId="168" type="0">
</Transition>
<Transition StartId="171" EndId="166" type="1">
<Expression>C131_EMS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="171" EndId="180" type="0">
</Transition>
<Transition StartId="173" EndId="131" type="0">
</Transition>
<Transition StartId="174" EndId="242" type="0">
</Transition>
<Transition StartId="175" EndId="191" type="0">
</Transition>
<Transition StartId="177" EndId="174" type="0">
</Transition>
<Transition StartId="178" EndId="177" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_EMS_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="178" EndId="242" type="0">
</Transition>
<Transition StartId="180" EndId="170" type="1">
<Expression>C131_EMS_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="180" EndId="178" type="0">
</Transition>
<Transition StartId="188" EndId="193" type="0">
</Transition>
<Transition StartId="189" EndId="243" type="0">
</Transition>
<Transition StartId="190" EndId="188" type="0">
</Transition>
<Transition StartId="191" EndId="190" type="1">
<Expression>(DString_C131_ConfigInfo~= "") and (C131_EMS_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="191" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="189" type="1">
<Expression>(DString_C131_ConfigInfo~= "") and (C131_EMS_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="193" EndId="243" type="0">
</Transition>
<Transition StartId="195" EndId="5" type="3">
</Transition>
<Transition StartId="195" EndId="196" type="4">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="5">
</Transition>
<Transition StartId="197" EndId="279" type="0">
</Transition>
<Transition StartId="198" EndId="3" type="0">
</Transition>
<Transition StartId="201" EndId="86" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="3">
</Transition>
<Transition StartId="204" EndId="222" type="4">
</Transition>
<Transition StartId="205" EndId="279" type="0">
</Transition>
<Transition StartId="206" EndId="82" type="0">
</Transition>
<Transition StartId="207" EndId="80" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="212" type="3">
</Transition>
<Transition StartId="210" EndId="211" type="4">
</Transition>
<Transition StartId="211" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="255" type="0">
</Transition>
<Transition StartId="219" EndId="220" type="0">
</Transition>
<Transition StartId="220" EndId="223" type="1">
<Expression>VMTLOC ~="FUN" and (C131_EMS_Actuator_Test_Execute_Flag==true and (( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" ) or ( DString_C131_Car_Tpye == "CH1LM21" ) or ( DString_C131_Car_Tpye == "CH1LM11") or ( DString_C131_Car_Tpye == "CH1MM21")) or LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye))</Expression></Transition>
<Transition StartId="220" EndId="252" type="0">
</Transition>
<Transition StartId="221" EndId="203" type="0">
</Transition>
<Transition StartId="222" EndId="205" type="0">
</Transition>
<Transition StartId="223" EndId="224" type="0">
</Transition>
<Transition StartId="224" EndId="257" type="0">
</Transition>
<Transition StartId="225" EndId="226" type="3">
</Transition>
<Transition StartId="225" EndId="227" type="4">
</Transition>
<Transition StartId="226" EndId="238" type="0">
</Transition>
<Transition StartId="227" EndId="226" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="232" type="4">
</Transition>
<Transition StartId="229" EndId="231" type="3">
</Transition>
<Transition StartId="231" EndId="234" type="0">
</Transition>
<Transition StartId="232" EndId="231" type="0">
</Transition>
<Transition StartId="234" EndId="235" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="4">
</Transition>
<Transition StartId="235" EndId="236" type="3">
</Transition>
<Transition StartId="236" EndId="259" type="0">
</Transition>
<Transition StartId="237" EndId="236" type="0">
</Transition>
<Transition StartId="238" EndId="101" type="0">
</Transition>
<Transition StartId="241" EndId="114" type="0">
</Transition>
<Transition StartId="242" EndId="175" type="1">
<Expression>(DString_C131_VariCoding ~= "")and (C131_EMS_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="242" EndId="191" type="0">
</Transition>
<Transition StartId="243" EndId="173" type="0">
</Transition>
<Transition StartId="244" EndId="228" type="1">
<Expression>VMTLOC ~="FUN" and ((C131_EMS_After_Roller_Check_Execute_Flag == true) and ((DString_C131_Car_Tpye == "CH1DM11") or (DString_C131_Car_Tpye == "CH1DM13") or (DString_C131_Car_Tpye == "CH1LM21") or (DString_C131_Car_Tpye == "CH1LM11") or (DString_C131_Car_Tpye == "CH1MM21")) or LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye))</Expression></Transition>
<Transition StartId="244" EndId="245" type="0">
</Transition>
<Transition StartId="245" EndId="259" type="0">
</Transition>
<Transition StartId="246" EndId="247" type="0">
</Transition>
<Transition StartId="247" EndId="250" type="0">
</Transition>
<Transition StartId="248" EndId="249" type="1">
<Expression>C131_EMS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="248" EndId="263" type="0">
</Transition>
<Transition StartId="249" EndId="246" type="0">
</Transition>
<Transition StartId="250" EndId="171" type="0">
</Transition>
<Transition StartId="251" EndId="221" type="1">
<Expression>(VMTLOC=="TR2") and (( DString_C131_Car_Tpye == "CH1DM11") or ( DString_C131_Car_Tpye == "CH1DM13") or ( DString_C131_Car_Tpye == "CH1DM14") or ( DString_C131_Car_Tpye == "CH1DM15") or ( DString_C131_Car_Tpye == "CH1LM11") or ( DString_C131_Car_Tpye == "CH1LM21") or ( DString_C131_Car_Tpye == "CH1MM21") or ( DString_C131_Car_Tpye == "CH1FM12") or ( DString_C131_Car_Tpye == "CH1FM13") or LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) or DString_C131_Car_Tpye == "CH1DM16" or DString_C131_Car_Tpye == "CH1DM17" or DString_C131_Car_Tpye == "CH1FM20" or DString_C131_Car_Tpye == "CH1FM30")</Expression></Transition>
<Transition StartId="251" EndId="260" type="0">
</Transition>
<Transition StartId="252" EndId="238" type="0">
</Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="180" type="0">
</Transition>
<Transition StartId="255" EndId="91" type="0">
</Transition>
<Transition StartId="257" EndId="225" type="0">
</Transition>
<Transition StartId="259" EndId="251" type="0">
</Transition>
<Transition StartId="260" EndId="279" type="0">
</Transition>
<Transition StartId="261" EndId="262" type="0">
</Transition>
<Transition StartId="262" EndId="250" type="0">
</Transition>
<Transition StartId="263" EndId="171" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="1">
<Expression>C131_EMS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="264" EndId="261" type="0">
</Transition>
<Transition StartId="265" EndId="268" type="1">
<Expression>C131_EMS_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="265" EndId="164" type="0">
</Transition>
<Transition StartId="266" EndId="267" type="0">
</Transition>
<Transition StartId="267" EndId="269" type="0">
</Transition>
<Transition StartId="268" EndId="266" type="0">
</Transition>
<Transition StartId="269" EndId="164" type="0">
</Transition>
<Transition StartId="270" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="272" EndId="273" type="0">
</Transition>
<Transition StartId="273" EndId="253" type="1">
<Expression>DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1GM12" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1BM33"</Expression></Transition>
<Transition StartId="273" EndId="180" type="0">
</Transition>
<Transition StartId="274" EndId="2" type="0">
</Transition>
<Transition StartId="275" EndId="276" type="0">
</Transition>
<Transition StartId="276" EndId="132" type="0">
</Transition>
<Transition StartId="278" EndId="280" type="0">
</Transition>
<Transition StartId="279" EndId="132" type="0">
</Transition>
<Transition StartId="279" EndId="278" type="1">
<Expression>VMTLOC=="REP" and DString_C131_Car_Tpye~="CH1MM41"</Expression></Transition>
<Transition StartId="280" EndId="275" type="0">
</Transition>
</Transitions>
</Process>

