<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1133" pbltext="DEP41">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_BCM1_Lamp_Combination_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Wiper_Washer_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Truck_Release_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Tand_Lid_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_All_Inner_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Hazard_Function_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Interior_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Reading_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Engine_Lid_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Beam_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Front_Fog_Lamp_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_Wipers_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM1_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_BCM1_Charger_Lid_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75E" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77E" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="143" top="1" right="243" bottom="33"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="728" top="4055" right="828" bottom="4087"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="144" top="59" right="244" bottom="91"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="清DTC">
<Rect left="143" top="204" right="243" bottom="236"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1728" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="大灯关闭手动测试">
<Rect left="711" top="394" right="811" bottom="426"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="大灯关闭"/>
<Script></Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="BCM1 大灯开关关闭">
<Rect left="712" top="440" right="812" bottom="472"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="大灯开关关闭"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x13
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="BCM1 示宽灯">
<Rect left="713" top="492" right="813" bottom="524"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="示宽灯"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x13
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="14" name="DEP695" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="BCM1 近光灯">
<Rect left="715" top="540" right="815" bottom="572"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="近光灯"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="15" name="DEP696" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="BCM1 自动头灯">
<Rect left="716" top="586" right="816" bottom="618"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="自动头灯"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x2D
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP697" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="BCM1 大灯开关关闭">
<Rect left="717" top="637" right="817" bottom="669"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="大灯关闭"/>
<Script>#COMM 0x22 0x01 0x2D
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="17" name="DEP694" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="前雾灯关闭手动测试">
<Rect left="716" top="688" right="816" bottom="720"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="BCM1 前雾灯关">
<Rect left="717" top="733" right="817" bottom="765"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Script>#COMM 0x22 0x01 0x12
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP698" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="BCM1 前雾灯开">
<Rect left="716" top="782" right="816" bottom="814"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="打开前雾灯"/>
<Script>#COMM 0x22 0x01 0x12
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP699" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="BCM1 前雾灯关">
<Rect left="716" top="833" right="816" bottom="865"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="前雾灯关闭"/>
<Script>#COMM 0x22 0x01 0x12
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP698" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="BCM1 转向灯关">
<Rect left="717" top="881" right="817" bottom="913"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="转向灯关闭"/>
<Script>#COMM 0x22 0x01 0x16
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP700" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="BCM1 左转向灯">
<Rect left="717" top="929" right="817" bottom="961"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="打开左转向灯"/>
<Script>#COMM 0x22 0x01 0x16
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP701" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="BCM1 右转向灯">
<Rect left="718" top="990" right="818" bottom="1022"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="右转向灯打开"/>
<Script>#COMM 0x22 0x01 0x17
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP702" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="BCM1 转向灯关">
<Rect left="718" top="1038" right="818" bottom="1070"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="3600" DelayTime="100"/>
<Line2Text Enable="1" Text="转向灯关闭"/>
<Script>#COMM 0x22 0x01 0x17
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP700" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="BCM1 远光灯关">
<Rect left="718" top="1088" right="818" bottom="1120"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="远光灯关闭"/>
<Script>#COMM 0x22 0x01 0x10
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP703" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="BCM1 远光灯开">
<Rect left="718" top="1136" right="818" bottom="1168"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="远光灯开"/>
<Script>#COMM 0x22 0x01 0x10
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP704" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="BCM1 远光灯关">
<Rect left="719" top="1186" right="819" bottom="1218"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="远光灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x10
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP703" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="721" top="1234" right="821" bottom="1266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="1283" right="786" bottom="1315"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="普通节点">
<Rect left="720" top="1349" right="820" bottom="1381"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="BCM1 雨刷关">
<Rect left="720" top="1398" right="820" bottom="1430"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script>#COMM 0x22 0x01 0x1E
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP705" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="BCM1 雨刷在INT档">
<Rect left="721" top="1444" right="821" bottom="1476"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="雨刷拨到INT档"/>
<Script>#COMM 0x22 0x01 0x1E
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP706" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="BCM1 雨刷低速">
<Rect left="722" top="1494" right="822" bottom="1526"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="雨刷拨到低速挡"/>
<Script>#COMM 0x22 0x01 0x1B
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP707" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="BCM1 雨刷高速">
<Rect left="723" top="1543" right="823" bottom="1575"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="雨刷拨到高速档"/>
<Script>#COMM 0x22 0x01 0x1C
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP708" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="BCM1 雨刷关">
<Rect left="724" top="1592" right="824" bottom="1624"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x1C
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP705" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="723" top="1641" right="823" bottom="1673"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="油箱盖释放手动确认">
<Rect left="723" top="1714" right="823" bottom="1746"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="请按油箱盖释放按钮"/>
<Line2Text Enable="1" Text="#L=油箱盖打开了吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=油箱盖打开了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=油箱盖打开了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script><assessment no="33" name="DEP709" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="758" top="1762" right="790" bottom="1794"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="室内照明灯手动确认">
<Rect left="723" top="1828" right="823" bottom="1860"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开室内照明灯"/>
<Line2Text Enable="1" Text="#L=室内照明灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script><assessment no="34" name="DEP46" type="8" flags="97"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="左前化妆镜灯手动确认">
<Rect left="723" top="1874" right="823" bottom="1906"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开左前化妆镜灯"/>
<Line2Text Enable="1" Text="#L=化妆镜灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="35" name="DEP47" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="左前阅读灯手动确认">
<Rect left="724" top="1921" right="824" bottom="1953"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开左前阅读灯"/>
<Line2Text Enable="1" Text="#L=阅读灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="36" name="DEP48" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="左后化妆镜灯手动确认">
<Rect left="725" top="1967" right="825" bottom="1999"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开左后化妆镜灯"/>
<Line2Text Enable="1" Text="#L=化妆镜灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="37" name="DEP49" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="左后阅读灯手动确认">
<Rect left="726" top="2013" right="826" bottom="2045"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开左后阅读灯"/>
<Line2Text Enable="1" Text="#L=阅读灯灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="38" name="DEP50" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="右后化妆镜灯手动确认">
<Rect left="727" top="2060" right="827" bottom="2092"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开右后化妆镜灯"/>
<Line2Text Enable="1" Text="#L=化妆镜灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="39" name="DEP51" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="右后阅读灯手动确认">
<Rect left="728" top="2107" right="828" bottom="2139"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开右后阅读灯"/>
<Line2Text Enable="1" Text="#L=阅读灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=室内照明灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="40" name="DEP52" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="右前化妆镜灯手动确认">
<Rect left="728" top="2154" right="828" bottom="2186"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开右前化妆镜灯"/>
<Line2Text Enable="1" Text="#L=化妆镜灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="41" name="DEP53" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="右前阅读灯手动确认">
<Rect left="727" top="2202" right="827" bottom="2234"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请打开右前阅读灯"/>
<Line2Text Enable="1" Text="#L=阅读灯可以点亮吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=阅读灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=阅读灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="42" name="DEP54" type="8" flags="97"/>
</Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="761" top="2254" right="793" bottom="2286"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="危险报警灯开关手动确认">
<Rect left="726" top="2325" right="826" bottom="2357"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="按危险报警灯开关"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯闪烁吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯闪烁吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯闪烁吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="43" name="DEP710" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="关闭危险报警灯手动确认">
<Rect left="726" top="2372" right="826" bottom="2404"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="关闭危险报警灯"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯灭了吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯灭了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=仪表盘报警灯灭了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="44" name="DEP711" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="4" flags="0" name="路由节点">
<Rect left="761" top="2421" right="793" bottom="2453"/>
</Activity>
<Activity id="86" ActivityType="3" flags="0" name="切诊断 ">
<Rect left="727" top="2488" right="827" bottom="2520"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x01 0x03
</Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="安全访问">
<Rect left="727" top="2537" right="827" bottom="2569"/>
<Script>#COMM 0x27 0x01
</Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="内顶发送">
<Rect left="727" top="2585" right="827" bottom="2617"/>
<Script>#COMM 0x31 0x01 0xC0 0x03</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="内顶灯亮手动确认">
<Rect left="728" top="2633" right="828" bottom="2665"/>
<Line1Text Enable="1" Text="内顶灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="45" name="DEP712" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="4" flags="0" name="路由节点">
<Rect left="763" top="2683" right="795" bottom="2715"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="阅读发送">
<Rect left="728" top="2753" right="828" bottom="2785"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xC0 0x04</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="手动确认">
<Rect left="729" top="2800" right="829" bottom="2832"/>
<Line1Text Enable="1" Text="阅读灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="46" name="DEP713" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="761" top="2852" right="793" bottom="2884"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="BCM1 引擎盖开">
<Rect left="730" top="3134" right="830" bottom="3166"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开引擎盖"/>
<Script>#COMM 0x22 0x01 0x2A
if(@0==0x62)then
if(@3==0x01)then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(2,@3);
else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
  engine.LastError = 1;
  engine.TestResult = 1;
end</Script><assessment no="47" name="DEP714" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="BCM1 引擎盖关">
<Rect left="730" top="3194" right="830" bottom="3226"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请关闭引擎盖"/>
<Script>#COMM 0x22 0x01 0x2A
if(@0==0x62)then
if(@3==0x00)then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
  engine.SetLineText(2,@3);
else
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
  engine.TestResult = 1;
  engine.LastError = 1;
end</Script><assessment no="48" name="DEP715" type="8" flags="97"/>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="759" top="3263" right="791" bottom="3295"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="走到车前">
<Rect left="723" top="3337" right="823" bottom="3369"/>
<Line1Text Enable="1" Text="请走到车的前面"/>
<Line2Text Enable="1" Text="准备检查大灯状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="发送打开大灯指令">
<Rect left="724" top="3384" right="824" bottom="3416"/>
<Script>--#COMM 0x31 0x01 0x3F
#COMM 0x31 0x01 0xC0 0x01</Script><assessment no="70" name="DEP1233" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="手动确认">
<Rect left="722" top="3432" right="822" bottom="3464"/>
<Line1Text Enable="1" Text="大灯亮了吗?"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end
</Script><assessment no="49" name="DEP2367" type="8" flags="97"/>
</Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="757" top="3484" right="789" bottom="3516"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="手动确认">
<Rect left="724" top="3552" right="824" bottom="3584"/>
<Line1Text Enable="1" Text="请注意观察前雾灯"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="发送">
<Rect left="724" top="3600" right="824" bottom="3632"/>
<Script>#COMM 0x31 0x01 0xC0 0x02</Script><assessment no="71" name="DEP1234" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="手动确认">
<Rect left="725" top="3647" right="825" bottom="3679"/>
<Line1Text Enable="1" Text="前雾灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end
</Script><assessment no="50" name="DEP2368" type="8" flags="97"/>
</Activity>
<Activity id="114" ActivityType="4" flags="0" name="路由节点">
<Rect left="760" top="3708" right="792" bottom="3740"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="手动确认">
<Rect left="726" top="3774" right="826" bottom="3806"/>
<Line1Text Enable="1" Text="请注意观察雨刷"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="发送">
<Rect left="725" top="3823" right="825" bottom="3855"/>
<Script>#COMM 0x31 0x01 0xC0 0x00
</Script><assessment no="72" name="DEP1235" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="手动确认">
<Rect left="726" top="3876" right="826" bottom="3908"/>
<Line1Text Enable="1" Text="雨刷工作了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃！";
else
end
</Script><assessment no="51" name="DEP2369" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="清空显示">
<Rect left="727" top="3996" right="827" bottom="4028"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="连接ECU">
<Rect left="143" top="110" right="243" bottom="142"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="切诊断">
<Rect left="144" top="254" right="244" bottom="286"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1729" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="144" top="304" right="244" bottom="336"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1740" name="DEP44" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="发送key">
<Rect left="144" top="401" right="244" bottom="433"/>
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
</Script><assessment no="1743" name="DEP45" type="8" flags="97"/>
</Activity>
<Activity id="127" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="144" top="354" right="244" bottom="386"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8E9BBD8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="129" ActivityType="4" flags="0" name="路由节点">
<Rect left="745" top="320" right="777" bottom="352"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="比对零件号">
<Rect left="280" top="84" right="380" bottom="116"/>
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
end</Script><assessment no="1" name="DEP249" type="8" flags="105"/>
</Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="314" top="24" right="346" bottom="56"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="读硬件号">
<Rect left="400" top="84" right="500" bottom="116"/>
<Line1Text Enable="1" Text="读硬件号"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP250" type="8" flags="105"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="延时300MS">
<Rect left="400" top="134" right="500" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="140" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="24" right="466" bottom="56"/>
</Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="704" top="24" right="736" bottom="56"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="24" right="596" bottom="56"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="530" top="84" right="630" bottom="116"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@9-@11);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP251" type="8" flags="105"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="延时300MS">
<Rect left="530" top="124" right="630" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="152" ActivityType="3" flags="0" name="读软件号">
<Rect left="670" top="84" right="770" bottom="116"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@10);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP252" type="8" flags="105"/>
</Activity>
<Activity id="154" ActivityType="3" flags="0" name="延时300MS">
<Rect left="670" top="134" right="770" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="159" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="930" top="84" right="1030" bottom="116"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="03.19#08";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("03.19#08" == DString1)then 
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
end</Script><assessment no="5" name="DEP253" type="8" flags="105"/>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="延时300MS">
<Rect left="930" top="134" right="1030" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="24" right="996" bottom="56"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1490" top="84" right="1590" bottom="116"/>
<Line1Text Enable="1"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP254" type="8" flags="97"/>
</Activity>
<Activity id="165" ActivityType="3" flags="0" name="读VIN">
<Rect left="1490" top="134" right="1590" bottom="166"/>
<Line1Text Enable="1"/>
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
end</Script><assessment no="7" name="DEP255" type="8" flags="97"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="日期读取">
<Rect left="1620" top="134" right="1720" bottom="166"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="发送时间">
<Rect left="1620" top="84" right="1720" bottom="116"/>
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
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="1524" top="24" right="1556" bottom="56"/>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1980" top="324" right="2080" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1740" top="134" right="1840" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1880" top="84" right="1980" bottom="116"/>
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
</Script><assessment no="12" name="DEP258" type="8" flags="105"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="写配置码">
<Rect left="1740" top="84" right="1840" bottom="116"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP257" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="4" flags="0" name="路由节点">
<Rect left="1774" top="24" right="1806" bottom="56"/>
</Activity>
<Activity id="190" ActivityType="4" flags="0" name="路由节点">
<Rect left="1654" top="24" right="1686" bottom="56"/>
</Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="24" right="1956" bottom="56"/>
</Activity>
<Activity id="192" ActivityType="4" flags="0" name="路由节点">
<Rect left="863" top="772" right="895" bottom="804"/>
</Activity>
<Activity id="193" ActivityType="4" flags="0" name="路由节点">
<Rect left="884" top="1474" right="916" bottom="1506"/>
</Activity>
<Activity id="195" ActivityType="4" flags="0" name="路由节点">
<Rect left="843" top="1715" right="875" bottom="1747"/>
</Activity>
<Activity id="196" ActivityType="4" flags="0" name="路由节点">
<Rect left="847" top="2009" right="879" bottom="2041"/>
</Activity>
<Activity id="197" ActivityType="4" flags="0" name="路由节点">
<Rect left="841" top="2347" right="873" bottom="2379"/>
</Activity>
<Activity id="198" ActivityType="4" flags="0" name="路由节点">
<Rect left="846" top="2556" right="878" bottom="2588"/>
</Activity>
<Activity id="199" ActivityType="4" flags="0" name="路由节点">
<Rect left="839" top="2772" right="871" bottom="2804"/>
</Activity>
<Activity id="201" ActivityType="4" flags="0" name="路由节点">
<Rect left="839" top="3376" right="871" bottom="3408"/>
</Activity>
<Activity id="202" ActivityType="4" flags="0" name="路由节点">
<Rect left="840" top="3595" right="872" bottom="3627"/>
</Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="850" top="3829" right="882" bottom="3861"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="通讯">
<Rect left="142" top="157" right="242" bottom="189"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1727" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="3" flags="0" name="通讯失败">
<Rect left="26" top="161" right="126" bottom="193"/>
<Line1Text Enable="1" Text="BCM1 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="209" ActivityType="4" flags="0" name="路由节点">
<Rect left="65" top="3997" right="97" bottom="4029"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="结束通讯">
<Rect left="24" top="115" right="124" bottom="147"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="212" ActivityType="4" flags="0" name="路由节点">
<Rect left="861" top="2971" right="893" bottom="3003"/>
</Activity>
<Activity id="214" ActivityType="3" flags="0" name="BCM1 引擎盖开">
<Rect left="726" top="2924" right="826" bottom="2956"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按下充电口盖按钮，时间大于1秒"/>
<Script>#COMM 0x22 0x01 0x39
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  
end
  engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="60" name="DEP1041" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="BCM1 引擎盖关">
<Rect left="728" top="2971" right="828" bottom="3003"/>
<Strategy TotalTime="3000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请松开充电口盖按钮"/>
<Script>#COMM 0x22 0x01 0x39
if (@3==0x00) then
  engine.LastError = 0;
 engine.println(" 充电盖".. engine.LastError);
else
  engine.LastError = 1;
engine.TestResult = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="61" name="DEP1042" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="关闭充电口盖">
<Rect left="729" top="3020" right="829" bottom="3052"/>
<Line1Text Enable="1" Text="请关闭充电口盖"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="2014" top="24" right="2046" bottom="56"/>
</Activity>
<Activity id="223" ActivityType="4" flags="0" name="路由节点">
<Rect left="761" top="3066" right="793" bottom="3098"/>
</Activity>
<Activity id="224" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="3154" right="936" bottom="3186"/>
</Activity>
<Activity id="225" ActivityType="3" flags="0" name="混动车型">
<Rect left="790" top="74" right="890" bottom="106"/>
<Script></Script></Activity>
<Activity id="226" ActivityType="3" flags="0" name="读软件号">
<Rect left="790" top="124" right="890" bottom="156"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
engine.println("不比对软件号");
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP252" type="8" flags="105"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="延时300MS">
<Rect left="790" top="174" right="890" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="24" right="856" bottom="56"/>
</Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="224" right="866" bottom="256"/>
</Activity>
<Activity id="230" ActivityType="3" flags="0" name="混动车型">
<Rect left="1070" top="84" right="1170" bottom="116"/>
<Script></Script></Activity>
<Activity id="231" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1070" top="134" right="1170" bottom="166"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95

if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23")then
	  --StandValue="04.00#06.09";
          StandValue="04.00#06.11";
          DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);		
	elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="04.00#06.11";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);	
	else	       
           --StandValue="04.00#06.09";
          StandValue="04.00#06.11";	
          DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	end             
	  engine.SetLineText(3,DString1);
	  engine.println("软件版本号:"..DString1);
          engine.SetLineText(2,StandValue);
	  engine.println("软件版本号标准值:"..StandValue);
		
        
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

</Script><assessment no="5" name="DEP253" type="8" flags="105"/>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1070" top="194" right="1170" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="233" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="24" right="1136" bottom="56"/>
</Activity>
<Activity id="234" ActivityType="4" flags="0" name="路由节点">
<Rect left="1224" top="284" right="1256" bottom="316"/>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="清屏幕颜色">
<Rect left="726" top="3935" right="826" bottom="3967"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="改脸">
<Rect left="1220" top="84" right="1320" bottom="116"/>
<Script></Script></Activity>
<Activity id="238" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1220" top="144" right="1320" bottom="176"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="04.00#06.09";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="04.00#06.09";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
        elseif(DString_C131_Car_Tpye=="CH1BM34")then
		StandValue="04.00#06.11";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="04.00#06.11";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="04.00#06.11";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="04.00#06.11";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	else
		StandValue="04.00#06.11";
                --StandValue="04.00#06.09";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("04.00#06" == DString1) then 
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

</Script><assessment no="5" name="DEP253" type="8" flags="105"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1220" top="194" right="1320" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="24" right="1286" bottom="56"/>
</Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="633" top="766" right="665" bottom="798"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="19年型">
<Rect left="1350" top="84" right="1450" bottom="116"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1350" top="144" right="1450" bottom="176"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="04.00#06.11"
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
end</Script><assessment no="5" name="DEP253" type="8" flags="105"/>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1350" top="194" right="1450" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="1384" top="24" right="1416" bottom="56"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="122" type="0">
</Transition>
<Transition StartId="5" EndId="123" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="241" type="1">
<Expression>DString_C131_Car_Tpye == "CH1CM29" or DString_C131_Car_Tpye == "CH1BM33" or DString_C131_Car_Tpye == "CH1JM11" or (DString_C131_Car_Tpye=="CH1CM31" or DString_C131_Car_Tpye=="CH1BM34" or DString_C131_Car_Tpye=="CH1JM12")</Expression></Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="40" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="1">
<Expression> C131_BCM1_Wiper_Washer_Execute_Flag == true</Expression></Transition>
<Transition StartId="41" EndId="193" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="58" type="1">
<Expression>C131_BCM1_Tand_Lid_Execute_Flag == true</Expression></Transition>
<Transition StartId="48" EndId="195" type="0">
</Transition>
<Transition StartId="58" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="1">
<Expression>C131_BCM1_All_Inner_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="60" EndId="196" type="0">
</Transition>
<Transition StartId="61" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="1">
<Expression>C131_BCM1_Hazard_Function_Execute_Flag == true</Expression></Transition>
<Transition StartId="78" EndId="197" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="86" type="1">
<Expression>C131_BCM1_Interior_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="83" EndId="198" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="92" type="1">
<Expression>C131_BCM1_Reading_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="90" EndId="199" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="214" type="1">
<Expression>C131_BCM1_Charger_Lid_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1KM21" or DString_C131_Car_Tpye=="CH1KM11")</Expression></Transition>
<Transition StartId="94" EndId="212" type="0">
</Transition>
<Transition StartId="97" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="103" type="1">
<Expression>C131_BCM1_Beam_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="102" EndId="201" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="108" type="1">
<Expression>(C131_BCM1_Front_Fog_Lamp_Execute_Flag == true) and (DString_C131_Car_Tpye ~= "CH1CM29") and (DString_C131_Car_Tpye ~="CH1JM11") and (DString_C131_Car_Tpye~="CH1CM31" and DString_C131_Car_Tpye~="CH1JM12"and DString_C131_Car_Tpye~="CH1BM34")</Expression></Transition>
<Transition StartId="107" EndId="202" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="0">
</Transition>
<Transition StartId="109" EndId="110" type="0">
</Transition>
<Transition StartId="110" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="1">
<Expression>C131_BCM1_Wipers_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="114" EndId="203" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="236" type="0">
</Transition>
<Transition StartId="119" EndId="2" type="0">
</Transition>
<Transition StartId="122" EndId="207" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="127" type="0">
</Transition>
<Transition StartId="126" EndId="136" type="0">
</Transition>
<Transition StartId="127" EndId="126" type="0">
</Transition>
<Transition StartId="129" EndId="8" type="1">
<Expression>C131_BCM1_Lamp_Combination_Execute_Flag == true</Expression></Transition>
<Transition StartId="129" EndId="192" type="0">
</Transition>
<Transition StartId="135" EndId="140" type="0">
</Transition>
<Transition StartId="136" EndId="135" type="1">
<Expression>C131_BCM1_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="136" EndId="140" type="0">
</Transition>
<Transition StartId="137" EndId="139" type="0">
</Transition>
<Transition StartId="139" EndId="142" type="0">
</Transition>
<Transition StartId="140" EndId="137" type="1">
<Expression>C131_BCM1_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="140" EndId="142" type="0">
</Transition>
<Transition StartId="141" EndId="152" type="1">
<Expression>C131_BCM1_SN_Execute_Flag == true and (LibGeneral.CarTNC_Isnot_Hrid(DString_C131_Car_Tpye) or LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))</Expression></Transition>
<Transition StartId="141" EndId="228" type="0">
</Transition>
<Transition StartId="142" EndId="143" type="1">
<Expression>C131_BCM1_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="142" EndId="141" type="0">
</Transition>
<Transition StartId="143" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="141" type="0">
</Transition>
<Transition StartId="152" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="229" type="0">
</Transition>
<Transition StartId="159" EndId="162" type="0">
</Transition>
<Transition StartId="162" EndId="234" type="0">
</Transition>
<Transition StartId="163" EndId="159" type="1">
<Expression>C131_BCM1_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="163" EndId="233" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="190" type="0">
</Transition>
<Transition StartId="166" EndId="189" type="0">
</Transition>
<Transition StartId="168" EndId="166" type="0">
</Transition>
<Transition StartId="169" EndId="164" type="1">
<Expression>C131_BCM1_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="169" EndId="190" type="0">
</Transition>
<Transition StartId="184" EndId="129" type="0">
</Transition>
<Transition StartId="185" EndId="191" type="0">
</Transition>
<Transition StartId="186" EndId="222" type="0">
</Transition>
<Transition StartId="188" EndId="185" type="0">
</Transition>
<Transition StartId="189" EndId="188" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_BCM1_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="189" EndId="191" type="0">
</Transition>
<Transition StartId="190" EndId="168" type="1">
<Expression>C131_BCM1_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="190" EndId="189" type="0">
</Transition>
<Transition StartId="191" EndId="186" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_BCM1_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="191" EndId="222" type="0">
</Transition>
<Transition StartId="192" EndId="41" type="0">
</Transition>
<Transition StartId="193" EndId="48" type="0">
</Transition>
<Transition StartId="195" EndId="60" type="0">
</Transition>
<Transition StartId="196" EndId="78" type="0">
</Transition>
<Transition StartId="197" EndId="83" type="0">
</Transition>
<Transition StartId="198" EndId="90" type="0">
</Transition>
<Transition StartId="199" EndId="94" type="0">
</Transition>
<Transition StartId="201" EndId="107" type="0">
</Transition>
<Transition StartId="202" EndId="114" type="0">
</Transition>
<Transition StartId="203" EndId="236" type="0">
</Transition>
<Transition StartId="207" EndId="5" type="3">
</Transition>
<Transition StartId="207" EndId="208" type="4">
</Transition>
<Transition StartId="208" EndId="210" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="5">
</Transition>
<Transition StartId="209" EndId="119" type="0">
</Transition>
<Transition StartId="210" EndId="122" type="0">
</Transition>
<Transition StartId="212" EndId="223" type="0">
</Transition>
<Transition StartId="214" EndId="216" type="0">
</Transition>
<Transition StartId="216" EndId="221" type="0">
</Transition>
<Transition StartId="221" EndId="223" type="0">
</Transition>
<Transition StartId="222" EndId="184" type="0">
</Transition>
<Transition StartId="223" EndId="97" type="1">
<Expression>C131_BCM1_Engine_Lid_Execute_Flag == true</Expression></Transition>
<Transition StartId="223" EndId="224" type="0">
</Transition>
<Transition StartId="224" EndId="102" type="0">
</Transition>
<Transition StartId="225" EndId="226" type="0">
</Transition>
<Transition StartId="226" EndId="227" type="0">
</Transition>
<Transition StartId="227" EndId="229" type="0">
</Transition>
<Transition StartId="228" EndId="163" type="0">
</Transition>
<Transition StartId="228" EndId="225" type="1">
<Expression>C131_BCM1_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="229" EndId="163" type="0">
</Transition>
<Transition StartId="230" EndId="231" type="0">
</Transition>
<Transition StartId="231" EndId="232" type="0">
</Transition>
<Transition StartId="232" EndId="234" type="0">
</Transition>
<Transition StartId="233" EndId="230" type="1">
<Expression>C131_BCM1_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="233" EndId="240" type="0">
</Transition>
<Transition StartId="234" EndId="169" type="0">
</Transition>
<Transition StartId="236" EndId="119" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="234" type="0">
</Transition>
<Transition StartId="240" EndId="237" type="1">
<Expression>C131_BCM1_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="240" EndId="245" type="0">
</Transition>
<Transition StartId="241" EndId="18" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="234" type="0">
</Transition>
<Transition StartId="245" EndId="169" type="0">
</Transition>
<Transition StartId="245" EndId="242" type="1">
<Expression>C131_BCM1_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

