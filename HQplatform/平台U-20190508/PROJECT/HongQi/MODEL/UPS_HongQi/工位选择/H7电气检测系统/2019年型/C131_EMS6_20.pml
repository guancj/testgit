<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1113" pbltext="DEP142">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_EMS_After_Roller_Check_Execute_Flag" type="11" dir="0" data="true"/>
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
<Rect left="590" top="2224" right="690" bottom="2256"/>
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
<Rect left="590" top="354" right="690" bottom="386"/>
<Line1Text Enable="1" Text="关闭空调！"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="EMS冷却液温度(空调关)">
<Rect left="590" top="404" right="690" bottom="436"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x02 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
temperature=resu;

if (90.0&lt;temperature and temperature&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;

else
  engine.LastError = 1;
  engine.StatValue=temperature; 
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="590" top="464" right="690" bottom="496"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发动机检测 (EMS)"/>
<Line2Text Enable="1" Text="发动机怠速"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x02 0x04

if(@0==0x62)then

  Mult=10;
  Smd=0;
  UTG=0;
  OTG=2550;

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
<Rect left="470" top="354" right="570" bottom="386"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="检测失败">
<Rect left="470" top="404" right="570" bottom="436"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="检测失败">
<Rect left="470" top="464" right="570" bottom="496"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="EMS冷却液温度(空调关)">
<Rect left="590" top="514" right="690" bottom="546"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x02 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
temperature=resu;
engine.println("temperature="..temperature);
if (90.0&lt;temperature and temperature&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;

 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="470" top="514" right="570" bottom="546"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="实际点火角">
<Rect left="590" top="574" right="690" bottom="606"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="实际点火角"/>
<Script>#COMM 0x22 0x02 0x36

if(@0==0x62)then
  Mult=0.75;
  Smd=0;
  UTG=-96;
  OTG=95.25;
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
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu).."#R=KW");</Script><assessment no="17" name="DEP431" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="检测失败">
<Rect left="470" top="574" right="570" bottom="606"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="EMS 冷却液温度(空调关)">
<Rect left="590" top="624" right="690" bottom="656"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x02 0x2f

if(@0==0x62)then
resu = ((@3*0.75)-48) * 1.0;
speed=resu;

if (90.0&lt;speed and speed&lt;143.25) then
  engine.LastError = 0;
  engine.StatValue=speed;

 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=speed;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="470" top="624" right="570" bottom="656"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="EMS 电子节气门开度">
<Rect left="590" top="674" right="690" bottom="706"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="电子节气门开度"/>
<Script>#COMM 0x22 0x02 0x0b

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

else
  engine.LastError = 1;
  engine.StatValue=position_angle;
  engine.StatLower=0;
  engine.StatUpper=4.0;

end

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
<Rect left="470" top="674" right="570" bottom="706"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="EMS 冷却液温度(空调关)">
<Rect left="590" top="734" right="690" bottom="766"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x02 0x2F

if(@0==0x62)then

resu = ((@3* 0.75 ) - 48) * 1.0;
temperature=resu;

if (90 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;

else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="470" top="734" right="570" bottom="766"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="EMS 进气量">
<Rect left="590" top="784" right="690" bottom="816"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="进气量"/>
<Script>#COMM 0x22 0x02 0x20

if(@0==0x62)then

resu = ( (@3* 4 ) ) * 1.0;
speed=resu;

if (9 &lt; speed and speed&lt; 17.0) then
  engine.LastError = 0;
  engine.StatValue=speed;

else
  engine.LastError = 1;
  engine.StatValue=speed;
  engine.StatLower=9.0;
  engine.StatUpper=17.0;

end

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
<Rect left="470" top="784" right="570" bottom="816"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="EMS 冷却液温度">
<Rect left="590" top="834" right="690" bottom="866"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x02 0x2F

if(@0==0x62)then

resu = ((@3 * 0.75 ) -48) * 1.0;
temperature=resu;

if (90.0 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;

else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="470" top="834" right="570" bottom="866"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="EMS 喷油时间">
<Rect left="590" top="884" right="690" bottom="916"/>
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

else
  engine.LastError = 1;
  engine.StatValue=time;
  engine.StatLower=2.0;
  engine.StatUpper=4.0;

end

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
<Rect left="480" top="884" right="580" bottom="916"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="打开空调手动测试">
<Rect left="590" top="934" right="690" bottom="966"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开空调"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="590" top="984" right="690" bottom="1016"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="44" ActivityType="3" flags="0" name="检测失败">
<Rect left="470" top="934" right="570" bottom="966"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="发动机温度">
<Rect left="590" top="1034" right="690" bottom="1066"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="发动机冷却液温度"/>
<Script>#COMM 0x22 0x02 0x2f

if(@0==0x62)then
resu = ( (@3 * 0.75  ) - 48) * 1.0;
temperature=resu;

if (90.0 &lt; temperature and temperature&lt; 143.25) then
  engine.LastError = 0;
  engine.StatValue=temperature;

else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=90.0;
  engine.StatUpper=143.25;

end

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
<Rect left="480" top="1034" right="580" bottom="1066"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="590" top="1084" right="690" bottom="1116"/>
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
<Rect left="470" top="1084" right="570" bottom="1116"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="请将档位切换到 P自动测试">
<Rect left="590" top="1144" right="690" bottom="1176"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请将档位切换到 P"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="590" top="1184" right="690" bottom="1216"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x00) then
  engine.LastError = 0;

else
  engine.LastError = 1;

end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP437" type="8" flags="97"/>
</Activity>
<Activity id="53" ActivityType="3" flags="0" name="开空调时P档发动机怠速自动测试">
<Rect left="590" top="1234" right="690" bottom="1266"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时P档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="590" top="1294" right="690" bottom="1326"/>
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
<Rect left="470" top="1294" right="570" bottom="1326"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="档位切换到R自动测试">
<Rect left="590" top="1344" right="690" bottom="1376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到R"/>
<Line3Text Enable="1" Text="清保持踩刹车踏板"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="590" top="1384" right="690" bottom="1416"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x07) then
  engine.LastError = 0;

else
  engine.LastError = 1;

end

engine.SetLineText(3,@3);--显示距离结果


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="28" name="DEP439" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1394" right="580" bottom="1426"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="开R档发动机怠速自动测试">
<Rect left="590" top="1434" right="690" bottom="1466"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时R档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="590" top="1484" right="690" bottom="1516"/>
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
<Rect left="590" top="1534" right="690" bottom="1566"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请将档位切换到 N"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1484" right="580" bottom="1516"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="590" top="1584" right="690" bottom="1616"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x00) then
  engine.LastError = 0;

else
  engine.LastError = 1;

end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="30" name="DEP441" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="N档发动机怠速自动测试">
<Rect left="590" top="1634" right="690" bottom="1666"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时N档发动机怠速"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1584" right="580" bottom="1616"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="590" top="1684" right="690" bottom="1716"/>
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
<Rect left="590" top="1724" right="690" bottom="1756"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到D"/>
<Line3Text Enable="1" Text="请保持踩刹车踏板"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script></Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1684" right="580" bottom="1716"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="P_Position_Engine_Speed_Check_AC_On">
<Rect left="590" top="1774" right="690" bottom="1806"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32

if (@3==0x01) then
  engine.LastError = 0;

else
  engine.LastError = 1;
  engine.StatValue=@3;

end

engine.SetLineText(3,@3);--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP443" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="590" top="1824" right="690" bottom="1856"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="D档发动机怠速自动测试">
<Rect left="590" top="1874" right="690" bottom="1906"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="开空调时D档发动机怠速"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="发动机速度检测">
<Rect left="590" top="1924" right="690" bottom="1956"/>
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
<Rect left="590" top="1964" right="690" bottom="1996"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1774" right="580" bottom="1806"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="1924" right="580" bottom="1956"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="踩刹车踏板挂P档手动测试">
<Rect left="590" top="2014" right="690" bottom="2046"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请踩刹车踏板，挂P档"/>
<Line3Text Enable="1" Text="OK？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="手动测试">
<Rect left="590" top="2064" right="690" bottom="2096"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="关闭空调"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
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
<Parameter id="mask" value="0xD508AC12"/>
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
<Rect left="470" top="1184" right="570" bottom="1216"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="354" right="756" bottom="386"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="590" top="2124" right="690" bottom="2156"/>
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
<Rect left="240" top="74" right="340" bottom="106"/>
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
<Rect left="274" top="14" right="306" bottom="46"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="读硬件号">
<Rect left="370" top="74" right="470" bottom="106"/>
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
<Activity id="140" ActivityType="3" flags="0" name="延时50MS">
<Rect left="370" top="124" right="470" bottom="156"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="14" right="436" bottom="46"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="14" right="696" bottom="46"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="524" top="14" right="556" bottom="46"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="490" top="74" right="590" bottom="106"/>
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
<Activity id="146" ActivityType="3" flags="0" name="延时50MS">
<Rect left="490" top="124" right="590" bottom="156"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="153" ActivityType="3" flags="0" name="读软件号">
<Rect left="630" top="74" right="730" bottom="106"/>
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
<Activity id="155" ActivityType="3" flags="0" name="延时50MS">
<Rect left="630" top="124" right="730" bottom="156"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="770" top="74" right="870" bottom="106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="5" name="DEP292" type="8" flags="105"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="延时50MS">
<Rect left="770" top="124" right="870" bottom="156"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="14" right="836" bottom="46"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="发送VIN">
<Rect left="920" top="74" right="1020" bottom="106"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP293" type="8" flags="1"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="日期读取">
<Rect left="1050" top="144" right="1150" bottom="176"/>
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
<Rect left="920" top="124" right="1020" bottom="156"/>
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
<Rect left="1050" top="74" right="1150" bottom="106"/>
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
<Rect left="954" top="14" right="986" bottom="46"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1160" top="354" right="1260" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="1084" top="14" right="1116" bottom="46"/>
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
<Rect left="120" top="154" right="220" bottom="186"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="2224" right="196" bottom="2256"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="结束通讯">
<Rect left="117" top="100" right="217" bottom="132"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="普通节点">
<Rect left="2379" top="2154" right="2479" bottom="2186"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="14" right="1226" bottom="46"/>
</Activity>
<Activity id="270" ActivityType="3" flags="0" name="延时50ms">
<Rect left="920" top="174" right="1020" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 50</Script></Activity>
<Activity id="274" ActivityType="3" flags="0" name="读DTC">
<Rect left="590" top="2174" right="690" bottom="2206"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0c
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="113" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="281" ActivityType="3" flags="0" name="写车型">
<Rect left="920" top="234" right="1020" bottom="266"/>
<Line1Text Enable="1" Text="写车型代码"/>
<Script>engine.SetLineText(3,DString_C131_Car_Tpye);
if(LibGeneral.EMSwriteCarType(DString_C131_Car_Tpye))then
#COMM 0x2E 0xF1 0xA0 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
else
#COMM 0x2E 0xF1 0xA1 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="282" ActivityType="3" flags="0" name="检查VIN">
<Rect left="920" top="294" right="1020" bottom="326"/>
<Line1Text Enable="1" Text="比对车型代码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if(LibGeneral.EMSwriteCarType(DString_C131_Car_Tpye))then
#COMM 0x22 0xF1 0xA0
else
#COMM 0x22 0xF1 0xA1
end
engine.SetLineText(2,DString_C131_Car_Tpye);
engine.println("车型标准值:"..DString_C131_Car_Tpye);
if(@0==0x62)then
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
end</Script></Activity>
<Activity id="283" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="2124" right="756" bottom="2156"/>
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
<Transition StartId="77" EndId="132" type="0">
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
<Expression>C131_EMS_After_Roller_Check_Execute_Flag == true and engine.WorkPlace == "ROL"</Expression></Transition>
<Transition StartId="131" EndId="283" type="0">
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
<Expression>C131_EMS_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="142" EndId="164" type="0">
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
<Transition StartId="155" EndId="164" type="0">
</Transition>
<Transition StartId="160" EndId="163" type="0">
</Transition>
<Transition StartId="163" EndId="171" type="0">
</Transition>
<Transition StartId="164" EndId="160" type="1">
<Expression>C131_EMS_SVP_Execute_Flag == true </Expression></Transition>
<Transition StartId="164" EndId="171" type="0">
</Transition>
<Transition StartId="166" EndId="169" type="0">
</Transition>
<Transition StartId="168" EndId="243" type="0">
</Transition>
<Transition StartId="169" EndId="270" type="0">
</Transition>
<Transition StartId="170" EndId="168" type="0">
</Transition>
<Transition StartId="171" EndId="166" type="1">
<Expression>C131_EMS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="171" EndId="180" type="0">
</Transition>
<Transition StartId="173" EndId="131" type="0">
</Transition>
<Transition StartId="180" EndId="170" type="1">
<Expression>C131_EMS_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="180" EndId="243" type="0">
</Transition>
<Transition StartId="195" EndId="5" type="3">
</Transition>
<Transition StartId="195" EndId="196" type="4">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="5">
</Transition>
<Transition StartId="197" EndId="2" type="0">
</Transition>
<Transition StartId="198" EndId="3" type="0">
</Transition>
<Transition StartId="243" EndId="173" type="0">
</Transition>
<Transition StartId="270" EndId="281" type="0">
</Transition>
<Transition StartId="274" EndId="2" type="0">
</Transition>
<Transition StartId="281" EndId="282" type="0">
</Transition>
<Transition StartId="282" EndId="180" type="0">
</Transition>
<Transition StartId="283" EndId="132" type="0">
</Transition>
</Transitions>
</Process>

