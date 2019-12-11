<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="118" pbltext="DEP55">
<Parameters>
<Variable id="C131_BCM2_Brake_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Rear_Fog_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Reverse_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_License_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_HM_Brake_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Turn_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Truck_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Rear_Fog_Switch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Roof_Control_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_Curtain_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_BCM2_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_BCM2_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="C131_BCM2_Position_Lamps_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x6A8" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x628" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="124" top="42" right="224" bottom="74"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="577" top="2635" right="677" bottom="2667"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车身控制器2">
<Rect left="124" top="151" right="224" bottom="183"/>
<TitleText Enable="1" Text="车身控制器2"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="124" top="292" right="224" bottom="324"/>
<Line1Text Enable="1" Text="清BCM2 DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1806" name="DEP57" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="走到车的后面">
<Rect left="577" top="352" right="677" bottom="384"/>
<Line1Text Enable="1" Text="请走到车的后面，准备检查尾灯状态"/>
<Line2Text Enable="1" Text="请注意观察后部刹车灯"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="发送">
<Rect left="577" top="404" right="677" bottom="436"/>
<Script>#COMM 0x31 0x01 0xd0 0x01  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP1123" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="刹车灯确认">
<Rect left="576" top="453" right="676" bottom="485"/>
<Line1Text Enable="1" Text="刹车灯亮了吗"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="12" name="DEP684" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="观察雾灯">
<Rect left="577" top="553" right="677" bottom="585"/>
<Line1Text Enable="1" Text="请注意观察后部雾灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="12" ActivityType="4" flags="0" name="条件2">
<Rect left="611" top="503" right="643" bottom="535"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="条件1">
<Rect left="610" top="304" right="642" bottom="336"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="529" top="413" right="561" bottom="445"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="发送">
<Rect left="578" top="596" right="678" bottom="628"/>
<Script>#COMM 0x31 0x01 0xd0 0x02 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP1124" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="雾灯闪烁确认">
<Rect left="579" top="645" right="679" bottom="677"/>
<Line1Text Enable="1" Text="后雾灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="13" name="DEP685" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="观察倒车灯">
<Rect left="576" top="926" right="676" bottom="958"/>
<Line1Text Enable="1" Text="请注意观察后部倒车灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="条件3">
<Rect left="612" top="695" right="644" bottom="727"/>
</Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="531" top="602" right="563" bottom="634"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="发送">
<Rect left="576" top="973" right="676" bottom="1005"/>
<Script>#COMM 0x31 0x01 0xd0 0x04 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP1125" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="4" flags="0" name="条件4">
<Rect left="608" top="1070" right="640" bottom="1102"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="倒车灯确认">
<Rect left="575" top="1020" right="675" bottom="1052"/>
<Line1Text Enable="1" Text="倒车灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="15" name="DEP1130" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="观察牌照灯">
<Rect left="574" top="1119" right="674" bottom="1151"/>
<Line1Text Enable="1" Text="请注意观察后部牌照灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = 0xFF00FF;--粉色
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="发送">
<Rect left="574" top="1164" right="674" bottom="1196"/>
<Script>#COMM 0x31 0x01 0xd0 0x05   
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="29" name="DEP1130" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="牌照灯亮灭确认">
<Rect left="574" top="1214" right="674" bottom="1246"/>
<Line1Text Enable="1" Text="牌照灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="16" name="DEP688" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="4" flags="0" name="条件5">
<Rect left="609" top="1264" right="641" bottom="1296"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="观察高位刹车灯">
<Rect left="572" top="1311" right="672" bottom="1343"/>
<Line1Text Enable="1" Text="请注意观察后部高位刹车灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="33" ActivityType="4" flags="0" name="路由节点">
<Rect left="525" top="1158" right="557" bottom="1190"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="发送">
<Rect left="572" top="1358" right="672" bottom="1390"/>
<Script>#COMM 0x2f 0x02 0x27 0x03 0x01       
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1811" name="DEP1126" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="高位刹车灯确认">
<Rect left="572" top="1406" right="672" bottom="1438"/>
<Line1Text Enable="1" Text="高位刹车灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="17" name="DEP60" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="关闭刹车灯发送指令">
<Rect left="573" top="1452" right="673" bottom="1484"/>
<Script>#COMM 0x2f  0x02  0x27  0x00   </Script></Activity>
<Activity id="37" ActivityType="4" flags="0" name="条件6">
<Rect left="608" top="1498" right="640" bottom="1530"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="观察转向灯">
<Rect left="575" top="1545" right="675" bottom="1577"/>
<Line1Text Enable="1" Text="请注意观察后部转向灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="39" ActivityType="4" flags="0" name="路由节点">
<Rect left="515" top="1371" right="547" bottom="1403"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="转向灯确认">
<Rect left="576" top="1636" right="676" bottom="1668"/>
<Line1Text Enable="1" Text="转向灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="18" name="DEP689" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="发送">
<Rect left="575" top="1590" right="675" bottom="1622"/>
<Script>#COMM 0x31 0x01 0xd0 0x08  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1127" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="观察后备箱">
<Rect left="577" top="1734" right="677" bottom="1766"/>
<Line1Text Enable="1" Text="请打开后备箱，观察后背箱灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = 0xD15FEE;--紫色
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="44" ActivityType="4" flags="0" name="条件7">
<Rect left="610" top="1687" right="642" bottom="1719"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="发送">
<Rect left="578" top="1785" right="678" bottom="1817"/>
<Script>#COMM 0x31 0x01 0xd0 0x06  
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP1128" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="后备箱确认">
<Rect left="577" top="1833" right="677" bottom="1865"/>
<Line1Text Enable="1" Text="后备箱灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="19" name="DEP690" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="手动拨示宽灯">
<Rect left="577" top="1985" right="677" bottom="2017"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="#L=拨到示宽灯位置!#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="48" ActivityType="4" flags="0" name="条件8">
<Rect left="612" top="1935" right="644" bottom="1967"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="关闭雾灯">
<Rect left="576" top="2032" right="676" bottom="2064"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="雾灯关闭"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="雾灯关闭">
<Rect left="575" top="2079" right="675" bottom="2111"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP693" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="手动确认">
<Rect left="576" top="2126" right="676" bottom="2158"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开后雾灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="打开后雾灯">
<Rect left="575" top="2171" right="675" bottom="2203"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP693" type="8" flags="97"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="手动确认">
<Rect left="575" top="2307" right="675" bottom="2339"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="拨到OFF,关闭位置"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="天窗运动确认">
<Rect left="575" top="2406" right="675" bottom="2438"/>
<Line1Text Enable="1" Text="请手动确认天窗可以运动吗"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
--#DELAY 500</Script><assessment no="23" name="DEP61" type="8" flags="97"/>
</Activity>
<Activity id="57" ActivityType="4" flags="0" name="条件9">
<Rect left="610" top="2358" right="642" bottom="2390"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="530" top="2148" right="562" bottom="2180"/>
</Activity>
<Activity id="59" ActivityType="4" flags="0" name="条件10">
<Rect left="610" top="2456" right="642" bottom="2488"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="天窗升降确认">
<Rect left="575" top="2503" right="675" bottom="2535"/>
<Line1Text Enable="1" Text="请确认天窗可以升降吗"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
--#DELAY 500</Script><assessment no="24" name="DEP62" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="527" top="2411" right="559" bottom="2443"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="575" top="2551" right="675" bottom="2583"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="63" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="2502" right="566" bottom="2534"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="连接ECU">
<Rect left="123" top="198" right="223" bottom="230"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="切诊断">
<Rect left="125" top="339" right="225" bottom="371"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1807" name="DEP1085" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="124" top="385" right="224" bottom="417"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1834" name="DEP58" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="发送key">
<Rect left="123" top="477" right="223" bottom="509"/>
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
</Script><assessment no="1835" name="DEP59" type="8" flags="97"/>
</Activity>
<Activity id="88" ActivityType="13" flags="0" name="计算">
<Rect left="123" top="431" right="223" bottom="463"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x8EACBD9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="比对零件号">
<Rect left="257" top="156" right="357" bottom="188"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
if(@0==0x62)then
    DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
engine.SetLineText(2,DString_C131_Partnumber);
engine.SetLineText(3,DString1);
engine.println("获得:"..DString1);


if (DString1==DString_C131_Partnumber) then
  engine.LastError = 0;
  engine.println("成功"..DString1..DString_C131_Partnumber);
  engine.StatValue=DString1;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("失败"..DString1..DString_C131_Partnumber);
  engine.StatValue=DString1;
engine.StatPoint=DString_C131_Partnumber
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP259" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="290" top="99" right="322" bottom="131"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="读硬件号">
<Rect left="381" top="153" right="481" bottom="185"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
  DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);
--engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP260" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="延时300MS">
<Rect left="380" top="204" right="480" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="415" top="100" right="447" bottom="132"/>
</Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="575" top="95" right="607" bottom="127"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="502" top="254" right="534" bottom="286"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="379" top="254" right="479" bottom="286"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
  DString1=hexstr(@8-@10);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
--engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP261" type="8" flags="97"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="延时300MS">
<Rect left="379" top="305" right="479" bottom="337"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="读软件号">
<Rect left="540" top="149" right="640" bottom="181"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
   DString1=hexstr(@3-@10);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);
--engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP262" type="8" flags="97"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="延时300MS">
<Rect left="536" top="202" right="636" bottom="234"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="663" top="148" right="763" bottom="180"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
   DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
 engine.SetLineText(3,DString1);
 engine.println("软件版本号:"..DString1);
if(( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" ))then
   if("03.21#02" == DString1) then                             
      engine.LastError = 0;
      engine.println("比软件版本号成功"..DString1.."  03.21#02");
      engine.StatValue=DString1;
   else
      engine.LastError = 1;
      engine.TestResult = 1;
      engine.println("比软件版本号失败"..DString1.."  03.21#02");
      engine.StatValue=DString1;
      engine.StatPoint="03.21#02"
   end
else
   if("03.19#04" == DString1) then                            
      engine.LastError = 0;
      engine.println("比软件版本号成功"..DString1.."  03.19#04");
      engine.StatValue=DString1;
   else
      engine.LastError = 1;
      engine.TestResult = 1;
      engine.println("比软件版本号失败"..DString1.."  03.19#04");
      engine.StatValue=DString1;
      engine.StatPoint="03.19#04";
   end
end

else
      engine.LastError = 1;
      engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="5" name="DEP263" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="延时300MS">
<Rect left="665" top="204" right="765" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="697" top="95" right="729" bottom="127"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="发送VIN">
<Rect left="796" top="151" right="896" bottom="183"/>
<Line1Text Enable="1"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP264" type="8" flags="97"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="检查VIN">
<Rect left="796" top="204" right="896" bottom="236"/>
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
  engine.StatValue=DString_Write_VIN;
  engine.StatPoint=DString1
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP265" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="日期读取">
<Rect left="921" top="204" right="1021" bottom="236"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="发送时间">
<Rect left="921" top="152" right="1021" bottom="184"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 
--engine.StatValue=date;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="127" ActivityType="4" flags="0" name="路由节点">
<Rect left="831" top="95" right="863" bottom="127"/>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1264" top="303" right="1364" bottom="335"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="137" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1049" top="204" right="1149" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1170" top="152" right="1270" bottom="184"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>--#COMM 0x22 0x01 0x00
if(@0==0x62)then
   DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
engine.println(DString_C131_VariCoding);
if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
  engine.LastError = 0;
  engine.StatValue= DString_Read_Config_Code_From_ECU;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对配置码失败");
  engine.println("比对配置码失败");
  engine.StatValue= DString_Read_Config_Code_From_ECU;
  engine.StatPoint=DString_C131_VariCoding;
  end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="11" name="DEP267" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="写配置码">
<Rect left="1047" top="153" right="1147" bottom="185"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)
--engine.StatValue=VariCoding;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP266" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="1080" top="96" right="1112" bottom="128"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="956" top="96" right="988" bottom="128"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="1203" top="97" right="1235" bottom="129"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="观察示宽灯">
<Rect left="577" top="742" right="677" bottom="774"/>
<Line1Text Enable="1" Text="请注意观察示宽灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
else
end
</Script></Activity>
<Activity id="146" ActivityType="3" flags="0" name="发送">
<Rect left="576" top="789" right="676" bottom="821"/>
<Script>#COMM 0x31 0x01 0xd0 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP1129" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="示宽灯确认">
<Rect left="576" top="833" right="676" bottom="865"/>
<Line1Text Enable="1" Text="示宽灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "Yellow";
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=OK?#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="14" name="DEP686" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="537" top="786" right="569" bottom="818"/>
</Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="611" top="880" right="643" bottom="912"/>
</Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1590" right="566" bottom="1622"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1780" right="566" bottom="1812"/>
</Activity>
<Activity id="153" ActivityType="3" flags="0" name="手动测试">
<Rect left="575" top="2217" right="675" bottom="2249"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="雾灯关闭"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="154" ActivityType="3" flags="0" name="雾灯关闭">
<Rect left="575" top="2263" right="675" bottom="2295"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP692" type="8" flags="97"/>
</Activity>
<Activity id="157" ActivityType="3" flags="0" name="通讯">
<Rect left="124" top="245" right="224" bottom="277"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1805" name="DEP56" type="8" flags="97"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10" top="248" right="110" bottom="280"/>
<Line1Text Enable="1" Text="BCM2 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="43" top="2636" right="75" bottom="2668"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="结束通讯">
<Rect left="10" top="200" right="110" bottom="232"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="1299" top="98" right="1331" bottom="130"/>
</Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="512" top="971" right="544" bottom="1003"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="1066" top="2346" right="1098" bottom="2378"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="继续测试吗">
<Rect left="836" top="2551" right="936" bottom="2583"/>
<Line1Text Enable="1" Text="继续测试吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="清屏幕颜色">
<Rect left="577" top="1883" right="677" bottom="1915"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="166" ActivityType="3" flags="0" name="通讯">
<Rect left="237" top="244" right="337" bottom="276"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1805" name="DEP56" type="8" flags="97"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="检测OBD">
<Rect left="124" top="95" right="224" bottom="127"/>
<Strategy TotalTime="86400" NokTime="0" RetryTimeOut="86400" DelayTime="1000"/>
<Line1Text Enable="1" Text="检测OBD"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
engine.println("蓝牙连接状态"..engine.VciStatus);
engine.SetLineText(2,engine.VciStatus);
engine.SetLineText(1,"未连接")
if (1 == bit32.band(engine.VciStatus,0x01))then
   engine.LastError=0;
   engine.SetLineText(1,"已连接！")
else
   engine.LastError=1;
   --engine.Speak("请连接蓝牙头")
   --engine.println("提示连接蓝牙头")
end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="167" type="0">
</Transition>
<Transition StartId="3" EndId="69" type="0">
</Transition>
<Transition StartId="4" EndId="84" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="11" EndId="16" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="1">
<Expression>C131_BCM2_Rear_Fog_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="12" EndId="20" type="0">
</Transition>
<Transition StartId="13" EndId="7" type="1">
<Expression>C131_BCM2_Brake_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="12" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="19" type="0">
</Transition>
<Transition StartId="18" EndId="21" type="0">
</Transition>
<Transition StartId="19" EndId="148" type="0">
</Transition>
<Transition StartId="19" EndId="145" type="1">
<Expression>C131_BCM2_Position_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="20" EndId="19" type="0">
</Transition>
<Transition StartId="21" EndId="26" type="0">
</Transition>
<Transition StartId="25" EndId="27" type="1">
<Expression>C131_BCM2_License_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="25" EndId="33" type="0">
</Transition>
<Transition StartId="26" EndId="25" type="0">
</Transition>
<Transition StartId="27" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="1">
<Expression>C131_BCM2_HM_Brake_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="39" type="0">
</Transition>
<Transition StartId="32" EndId="34" type="0">
</Transition>
<Transition StartId="33" EndId="31" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="1">
<Expression>C131_BCM2_Turn_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="37" EndId="151" type="0">
</Transition>
<Transition StartId="38" EndId="42" type="0">
</Transition>
<Transition StartId="39" EndId="37" type="0">
</Transition>
<Transition StartId="40" EndId="44" type="0">
</Transition>
<Transition StartId="42" EndId="40" type="0">
</Transition>
<Transition StartId="43" EndId="45" type="0">
</Transition>
<Transition StartId="44" EndId="43" type="1">
<Expression>C131_BCM2_Truck_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="44" EndId="152" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="165" type="0">
</Transition>
<Transition StartId="47" EndId="49" type="0">
</Transition>
<Transition StartId="48" EndId="47" type="1">
<Expression>C131_BCM2_Rear_Fog_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="48" EndId="58" type="0">
</Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="153" type="0">
</Transition>
<Transition StartId="55" EndId="57" type="0">
</Transition>
<Transition StartId="56" EndId="59" type="0">
</Transition>
<Transition StartId="57" EndId="56" type="1">
<Expression>C131_BCM2_Roof_Control_Execute_Flag == true</Expression></Transition>
<Transition StartId="57" EndId="61" type="0">
</Transition>
<Transition StartId="58" EndId="57" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="1">
<Expression>(C131_BCM2_Curtain_Check_Execute_Flag == true) and ( DString_C131_Car_Tpye ~= "CH1GM11" ) and ( DString_C131_Car_Tpye ~= "CH1GM12" )</Expression></Transition>
<Transition StartId="59" EndId="63" type="0">
</Transition>
<Transition StartId="60" EndId="62" type="0">
</Transition>
<Transition StartId="61" EndId="59" type="0">
</Transition>
<Transition StartId="62" EndId="164" type="0">
</Transition>
<Transition StartId="63" EndId="62" type="0">
</Transition>
<Transition StartId="69" EndId="166" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="88" type="0">
</Transition>
<Transition StartId="87" EndId="94" type="0">
</Transition>
<Transition StartId="88" EndId="87" type="0">
</Transition>
<Transition StartId="93" EndId="98" type="0">
</Transition>
<Transition StartId="94" EndId="93" type="1">
<Expression>C131_BCM2_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="94" EndId="98" type="0">
</Transition>
<Transition StartId="95" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="100" type="0">
</Transition>
<Transition StartId="98" EndId="95" type="1">
<Expression>C131_BCM2_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="98" EndId="100" type="0">
</Transition>
<Transition StartId="99" EndId="110" type="1">
<Expression>C131_BCM2_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="99" EndId="121" type="0">
</Transition>
<Transition StartId="100" EndId="99" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="1">
<Expression>C131_BCM2_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="101" EndId="103" type="0">
</Transition>
<Transition StartId="103" EndId="99" type="0">
</Transition>
<Transition StartId="110" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="121" type="0">
</Transition>
<Transition StartId="117" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="127" type="0">
</Transition>
<Transition StartId="121" EndId="117" type="1">
<Expression>C131_BCM2_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="121" EndId="127" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="142" type="0">
</Transition>
<Transition StartId="124" EndId="141" type="0">
</Transition>
<Transition StartId="126" EndId="124" type="0">
</Transition>
<Transition StartId="127" EndId="122" type="1">
<Expression>C131_BCM2_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="127" EndId="142" type="0">
</Transition>
<Transition StartId="136" EndId="13" type="0">
</Transition>
<Transition StartId="137" EndId="143" type="0">
</Transition>
<Transition StartId="138" EndId="161" type="0">
</Transition>
<Transition StartId="140" EndId="137" type="0">
</Transition>
<Transition StartId="141" EndId="140" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_BCM2_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="141" EndId="143" type="0">
</Transition>
<Transition StartId="142" EndId="126" type="1">
<Expression>C131_BCM2_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="142" EndId="141" type="0">
</Transition>
<Transition StartId="143" EndId="138" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_BCM2_WD_Execute_Flag == true)</Expression></Transition>
<Transition StartId="143" EndId="161" type="0">
</Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="147" EndId="149" type="0">
</Transition>
<Transition StartId="148" EndId="149" type="0">
</Transition>
<Transition StartId="149" EndId="18" type="1">
<Expression>C131_BCM2_Reverse_Lamps_Execute_Flag == true</Expression></Transition>
<Transition StartId="149" EndId="162" type="0">
</Transition>
<Transition StartId="151" EndId="44" type="0">
</Transition>
<Transition StartId="152" EndId="165" type="0">
</Transition>
<Transition StartId="153" EndId="154" type="0">
</Transition>
<Transition StartId="154" EndId="55" type="0">
</Transition>
<Transition StartId="157" EndId="4" type="3">
</Transition>
<Transition StartId="157" EndId="158" type="4">
</Transition>
<Transition StartId="158" EndId="160" type="0">
</Transition>
<Transition StartId="158" EndId="159" type="5">
</Transition>
<Transition StartId="159" EndId="2" type="0">
</Transition>
<Transition StartId="160" EndId="69" type="0">
</Transition>
<Transition StartId="161" EndId="136" type="0">
</Transition>
<Transition StartId="162" EndId="25" type="0">
</Transition>
<Transition StartId="163" EndId="13" type="0">
</Transition>
<Transition StartId="164" EndId="2" type="5">
</Transition>
<Transition StartId="164" EndId="163" type="0">
</Transition>
<Transition StartId="165" EndId="48" type="0">
</Transition>
<Transition StartId="166" EndId="4" type="0">
</Transition>
<Transition StartId="167" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

