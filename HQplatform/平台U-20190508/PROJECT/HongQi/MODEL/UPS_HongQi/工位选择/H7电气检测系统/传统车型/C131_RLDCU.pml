<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1126" pbltext="DEP119">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_RLDCU_Check_The_Door_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_Check_The_Door_Lock_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_Check_The_Switches_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_Window_Initialization_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_Window_Learning_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_Check_The_Door_Window_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RLDCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75B" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="110" top="2" right="210" bottom="34"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="441" top="2002" right="541" bottom="2034"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="左后门 (RLDCU)">
<Rect left="111" top="57" right="211" bottom="89"/>
<TitleText Enable="1" Text="左后门 (RLDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="112" top="200" right="212" bottom="232"/>
<Line1Text Enable="1" Text="RLDCU 第一次清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1314" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="左后门门灯打开自动测试">
<Rect left="441" top="591" right="541" bottom="623"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="左后门门灯打开"/>
<Script>#COMM 0x2F 0x02 0x11 0x03 0x01</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="左后门门灯关闭自动测试">
<Rect left="443" top="688" right="543" bottom="720"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="左后门门灯关闭"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2F 0x02 0x11 0x03 0x00</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="Doors_lights_ReturnControlToECU">
<Rect left="442" top="784" right="542" bottom="816"/>
<Script>#COMM 0x2f  0x02 0x11 0x00</Script></Activity>
<Activity id="14" ActivityType="4" flags="0" name="2*">
<Rect left="477" top="845" right="509" bottom="877"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="左后门玻璃降自动测试">
<Rect left="442" top="902" right="542" bottom="934"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="左后门玻璃降"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x10 0x03 0x02
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="RLDCU 自动升左后门玻璃">
<Rect left="443" top="950" right="543" bottom="982"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x25
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP600" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="玻璃下降停止">
<Rect left="443" top="998" right="543" bottom="1030"/>
<Line2Text Enable="1" Text="玻璃下降停止"/>
<Script>#COMM 0x2F 0x02 0x10 0x03 0x00
</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="RLDCU 自动降左后门玻璃">
<Rect left="443" top="1103" right="543" bottom="1135"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x25
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP601" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="上升停止">
<Rect left="443" top="1149" right="543" bottom="1181"/>
<Script>#COMM 0x2f  0x02 0x10 0x03 0x00</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="443" top="1196" right="543" bottom="1228"/>
<Script>#COMM 0x2F 0x02 0x10 0x00</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="左后门自动上锁自动测试">
<Rect left="271" top="2316" right="371" bottom="2348"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="左后门自动上锁"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0F 0x03 0x01
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="RLDCU 左后门锁定">
<Rect left="272" top="2363" right="372" bottom="2395"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x26
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
  engine.SetLineText(3,@3);</Script><assessment group="13" no="17" name="DEP602" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="Doors_lock_ReturnControlToECU">
<Rect left="271" top="2501" right="371" bottom="2533"/>
<Script>#COMM 0x2F  0x02 0x0F 0x00
</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="272" top="2554" right="372" bottom="2586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="左后门玻璃降 Level 1手动测试">
<Rect left="271" top="2599" right="371" bottom="2631"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="左后门玻璃降 Level 1"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="RLDCU 手动降左后门玻璃">
<Rect left="272" top="2644" right="372" bottom="2676"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x31
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
  --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment group="13" no="19" name="DEP604" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="左后门玻璃降 Level 2自动测试">
<Rect left="274" top="2691" right="374" bottom="2723"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门玻璃降 Level 2"/>
<Line3Text Enable="1"/>
<Script></Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="RLDCU 自动降左后门玻璃">
<Rect left="273" top="2739" right="373" bottom="2771"/>
<Strategy TotalTime="15" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x31
if (@3==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
  --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
  engine.SetLineText(3,@3);</Script><assessment group="13" no="20" name="DEP600" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="左后门玻璃升 Level 1手动测试">
<Rect left="273" top="2785" right="373" bottom="2817"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="RLDCU 手动升左后门玻璃">
<Rect left="273" top="2831" right="373" bottom="2863"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x31
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
  engine.SetLineText(3,@3);</Script><assessment group="13" no="21" name="DEP605" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="手动上升">
<Rect left="273" top="2878" right="373" bottom="2910"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门玻璃升 Level 2"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="RLDCU 自动升左后门玻璃">
<Rect left="273" top="2927" right="373" bottom="2959"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x31
if (@3==0x03) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
  --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
  engine.SetLineText(3,@3);</Script><assessment group="13" no="22" name="DEP601" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="左后门门灯打开自动测试">
<Rect left="941" top="2380" right="1041" bottom="2412"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门门灯打开"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="左后门灯打开">
<Rect left="942" top="2430" right="1042" bottom="2462"/>
<Strategy TotalTime="150" ExpectedTime="2" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x27
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment block="113" group="13" no="1310" name="左后门灯打开" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="门灯关闭手动测试">
<Rect left="942" top="2479" right="1042" bottom="2511"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="左后门门灯关闭"/>
<Script></Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="左后门灯关闭">
<Rect left="943" top="2526" right="1043" bottom="2558"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x27
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment block="113" group="13" no="1313" name="左后门灯关闭" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="5*">
<Rect left="475" top="1247" right="507" bottom="1279"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="440" top="1305" right="540" bottom="1337"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="手动测试">
<Rect left="440" top="1352" right="540" bottom="1384"/>
<Strategy NokTime="0" RetryTimeOut="600" DelayTime="100"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="自动完成上升、下降、再上升的循环"/>
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
end</Script><assessment no="44" name="DEP1117" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="4" flags="0" name="6*">
<Rect left="473" top="1412" right="505" bottom="1444"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="440" top="1472" right="540" bottom="1504"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="自动下降自动测试">
<Rect left="440" top="1526" right="540" bottom="1558"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="左后玻璃降 第一次"/>
<Line3Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x10 0x03 0x02
#DELAY 1000</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="RLDCU 自动升左后门玻璃">
<Rect left="439" top="1722" right="539" bottom="1754"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x25
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP601" type="8" flags="97"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="发送下降停止">
<Rect left="437" top="1620" right="537" bottom="1652"/>
<Script>#COMM 0x2F 0x02 0x10 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="自动上升自动测试">
<Rect left="438" top="1672" right="538" bottom="1704"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="左后玻璃升 第一次"/>
<Line3Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x10 0x03 0x01

#DELAY 1000</Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="发送上升停止">
<Rect left="440" top="1782" right="540" bottom="1814"/>
<Script>#COMM 0x2F 0x02 0x10 0x03 0x00
#DELAY 1000</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="第二次上升自动测试">
<Rect left="684" top="2382" right="784" bottom="2414"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="自动升降共2次"/>
<Line3Text Enable="1" Text="左后玻璃升 第二次"/>
<Script>#COMM  0x2F 0x02 0x10 0x03 0x01
#DELAY 1000</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="RLDCU 自动升左后门玻璃">
<Rect left="684" top="2432" right="784" bottom="2464"/>
<Strategy TotalTime="15" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
  --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment group="13" no="0" type="8" flags="97"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="发送上升停止">
<Rect left="685" top="2482" right="785" bottom="2514"/>
<Script>#COMM 0x2f 0x02 0x10 0x03 0x00 </Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="延时">
<Rect left="687" top="2530" right="787" bottom="2562"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="自动下降自动测试">
<Rect left="688" top="2578" right="788" bottom="2610"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="自动升降共2次"/>
<Line3Text Enable="1" Text="左后玻璃降 第二次"/>
<Script>#COMM  0x2f 0x02 0x10 0x03 0x02
#DELAY 1000</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="检测左后门玻璃">
<Rect left="687" top="2625" right="787" bottom="2657"/>
<Strategy TotalTime="15" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
  --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);</Script><assessment group="13" no="1304" name="RLDCU 自动降左后门玻璃" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="第二次下降停止">
<Rect left="687" top="2672" right="787" bottom="2704"/>
<Script>--#DELAY 1000
#COMM 0x2f 0x02 0x10 0x03 0x00
</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="读RL状态">
<Rect left="439" top="1894" right="539" bottom="1926"/>
<Line1Text Enable="1" Text="读RLDCU状态"/>
<Script>#COMM 0x22 0x01 0x25 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="25" name="DEP607" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="440" top="1949" right="540" bottom="1981"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="自动测试">
<Rect left="444" top="1052" right="544" bottom="1084"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="左后门玻璃升"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x10 0x03 0x01
</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="解锁自动测试">
<Rect left="271" top="2408" right="371" bottom="2440"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="左后门自动解锁"/>
<Line4Text Enable="1"/>
<Script>#COMM  0x2F 0x02 0x0F 0x03 0x00
</Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="左后门解锁检测">
<Rect left="271" top="2455" right="371" bottom="2487"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x26
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
  engine.SetLineText(3,@3);</Script><assessment group="13" no="18" name="DEP603" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="连接ECU">
<Rect left="111" top="104" right="211" bottom="136"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="检测失败">
<Rect left="326" top="740" right="426" bottom="772"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="检测失败">
<Rect left="329" top="951" right="429" bottom="983"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="检测失败">
<Rect left="330" top="1104" right="430" bottom="1136"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="检测失败">
<Rect left="157" top="2364" right="257" bottom="2396"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="检测失败">
<Rect left="158" top="2455" right="258" bottom="2487"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="检测失败">
<Rect left="158" top="2647" right="258" bottom="2679"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="检测失败">
<Rect left="158" top="2740" right="258" bottom="2772"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="检测失败">
<Rect left="159" top="2834" right="259" bottom="2866"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="检测失败">
<Rect left="156" top="2930" right="256" bottom="2962"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="检测失败">
<Rect left="1056" top="2431" right="1156" bottom="2463"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="检测失败">
<Rect left="1076" top="2525" right="1176" bottom="2557"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="检测失败">
<Rect left="326" top="1573" right="426" bottom="1605"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="检测失败">
<Rect left="324" top="1721" right="424" bottom="1753"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="检测失败">
<Rect left="801" top="2430" right="901" bottom="2462"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="检测失败">
<Rect left="802" top="2624" right="902" bottom="2656"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="切诊断">
<Rect left="112" top="247" right="212" bottom="279"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1315" name="DEP1078" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="113" top="293" right="213" bottom="325"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1316" name="DEP123" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="发送key">
<Rect left="114" top="392" right="214" bottom="424"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1317" name="DEP124" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="13" flags="0" name="计算">
<Rect left="114" top="342" right="214" bottom="374"/>
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
<Activity id="94" ActivityType="3" flags="0" name="ECU重置">
<Rect left="439" top="1838" right="539" bottom="1870"/>
<Line1Text Enable="1" Text="ECU重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f 0x02 0x10 0x00 </Script></Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="477" top="536" right="509" bottom="568"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="检测失败">
<Rect left="324" top="642" right="424" bottom="674"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="左后门门灯打开">
<Rect left="442" top="641" right="542" bottom="673"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x27
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
  engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP598" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="左后门门灯关闭">
<Rect left="443" top="739" right="543" bottom="771"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x27
if (@3==0x00) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
  engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP599" type="8" flags="97"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="比对零件号">
<Rect left="230" top="62" right="330" bottom="94"/>
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
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
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
end</Script><assessment no="1" name="DEP589" type="8" flags="105"/>
</Activity>
<Activity id="103" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="6" right="296" bottom="38"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="读硬件号">
<Rect left="354" top="58" right="454" bottom="90"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP590" type="8" flags="105"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时300MS">
<Rect left="354" top="102" right="454" bottom="134"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="387" top="5" right="419" bottom="37"/>
</Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="630" top="5" right="662" bottom="37"/>
</Activity>
<Activity id="108" ActivityType="4" flags="0" name="路由节点">
<Rect left="507" top="6" right="539" bottom="38"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="472" top="59" right="572" bottom="91"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP591" type="8" flags="105"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时300MS">
<Rect left="470" top="106" right="570" bottom="138"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="读软件号">
<Rect left="595" top="61" right="695" bottom="93"/>
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
</Script><assessment no="4" name="DEP592" type="8" flags="105"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="延时300MS">
<Rect left="596" top="111" right="696" bottom="143"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="733" top="55" right="833" bottom="87"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="2.00";
		--if("2.00" == DString1) then                    
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.00";
		--if("2.00" == DString1) then       
	else
		StandValue="2.00";
		--if("2.00" == DString1)then    
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
end</Script><assessment no="5" name="DEP593" type="8" flags="105"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="延时300MS">
<Rect left="734" top="105" right="834" bottom="137"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="115" ActivityType="4" flags="0" name="路由节点">
<Rect left="768" top="5" right="800" bottom="37"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1700" top="534" right="1800" bottom="566"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1270" top="54" right="1370" bottom="86"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP594" type="8" flags="97"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="读VIN">
<Rect left="1270" top="104" right="1370" bottom="136"/>
<Line1Text Enable="1" Text="读VIN"/>
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
end</Script><assessment no="7" name="DEP595" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="日期读取">
<Rect left="1390" top="104" right="1490" bottom="136"/>
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
<Activity id="120" ActivityType="3" flags="0" name="发送时间">
<Rect left="1380" top="54" right="1480" bottom="86"/>
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
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="4" right="1336" bottom="36"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1500" top="104" right="1600" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1610" top="54" right="1710" bottom="86"/>
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
</Script><assessment no="12" name="DEP597" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="写配置码">
<Rect left="1500" top="54" right="1600" bottom="86"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2E 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)
--engine.StatValue=VariCoding;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP596" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="4" flags="0" name="路由节点">
<Rect left="1534" top="4" right="1566" bottom="36"/>
</Activity>
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="4" right="1456" bottom="36"/>
</Activity>
<Activity id="127" ActivityType="4" flags="0" name="路由节点">
<Rect left="1644" top="4" right="1676" bottom="36"/>
</Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="308" top="2978" right="340" bottom="3010"/>
</Activity>
<Activity id="129" ActivityType="4" flags="0" name="路由节点">
<Rect left="390" top="2316" right="422" bottom="2348"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="通讯">
<Rect left="112" top="153" right="212" bottom="185"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1313" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="通讯失败">
<Rect top="156" right="100" bottom="188"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="132" ActivityType="4" flags="0" name="路由节点">
<Rect left="36" top="1948" right="68" bottom="1980"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="RLDCU 自动降左后门玻璃">
<Rect left="437" top="1572" right="537" bottom="1604"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="RLDCU 自动降左后门玻璃" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="结束通讯">
<Rect top="103" right="100" bottom="135"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="4" right="1766" bottom="36"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="混动车型">
<Rect left="861" top="53" right="961" bottom="85"/>
<Script></Script></Activity>
<Activity id="138" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="861" top="104" right="961" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="3.00";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
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


</Script><assessment no="5" name="DEP593" type="8" flags="105"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="延时300MS">
<Rect left="861" top="157" right="961" bottom="189"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="140" ActivityType="4" flags="0" name="路由节点">
<Rect left="896" top="4" right="928" bottom="36"/>
</Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="1029" top="204" right="1061" bottom="236"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="563" top="689" right="595" bottom="721"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="1330" right="596" bottom="1362"/>
</Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="557" top="1672" right="589" bottom="1704"/>
</Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="570" top="1051" right="602" bottom="1083"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="改脸">
<Rect left="996" top="55" right="1096" bottom="87"/>
<Script></Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="996" top="106" right="1096" bottom="138"/>
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
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="3.00";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="3.00";
	else
		StandValue="3.00";
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


</Script><assessment no="5" name="DEP593" type="8" flags="105"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="延时300MS">
<Rect left="996" top="159" right="1096" bottom="191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="1029" top="5" right="1061" bottom="37"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="19年型">
<Rect left="1130" top="54" right="1230" bottom="86"/>
<Script></Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1130" top="104" right="1230" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue= "3.00"
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
end</Script><assessment no="5" name="DEP593" type="8" flags="105"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1130" top="154" right="1230" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1164" top="4" right="1196" bottom="36"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="71" type="0">
</Transition>
<Transition StartId="4" EndId="88" type="0">
</Transition>
<Transition StartId="7" EndId="98" type="0">
</Transition>
<Transition StartId="10" EndId="99" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_RLDCU_Check_The_Door_Window_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="145" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="3">
</Transition>
<Transition StartId="16" EndId="74" type="4">
</Transition>
<Transition StartId="17" EndId="68" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="3">
</Transition>
<Transition StartId="19" EndId="75" type="4">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="41" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="69" type="3">
</Transition>
<Transition StartId="24" EndId="76" type="4">
</Transition>
<Transition StartId="25" EndId="27" type="1">
<Expression>C131_RLDCU_Check_The_Switches_Execute_Flag == true</Expression></Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="3">
</Transition>
<Transition StartId="29" EndId="78" type="4">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="3">
</Transition>
<Transition StartId="31" EndId="79" type="4">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="3">
</Transition>
<Transition StartId="33" EndId="80" type="4">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="128" type="3">
</Transition>
<Transition StartId="35" EndId="81" type="4">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="3">
</Transition>
<Transition StartId="37" EndId="82" type="4">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="83" type="4">
</Transition>
<Transition StartId="41" EndId="42" type="1">
<Expression>C131_RLDCU_Window_Initialization_Execute_Flag == true</Expression></Transition>
<Transition StartId="41" EndId="143" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="1">
<Expression>C131_RLDCU_Window_Learning_Execute_Flag == true</Expression></Transition>
<Transition StartId="44" EndId="144" type="0">
</Transition>
<Transition StartId="45" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="134" type="0">
</Transition>
<Transition StartId="49" EndId="54" type="3">
</Transition>
<Transition StartId="49" EndId="85" type="4">
</Transition>
<Transition StartId="50" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="49" type="0">
</Transition>
<Transition StartId="54" EndId="94" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="3">
</Transition>
<Transition StartId="56" EndId="86" type="4">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="3">
</Transition>
<Transition StartId="60" EndId="87" type="4">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
<Transition StartId="68" EndId="19" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="25" type="3">
</Transition>
<Transition StartId="70" EndId="77" type="4">
</Transition>
<Transition StartId="71" EndId="130" type="0">
</Transition>
<Transition StartId="73" EndId="12" type="0">
</Transition>
<Transition StartId="74" EndId="17" type="0">
</Transition>
<Transition StartId="75" EndId="20" type="0">
</Transition>
<Transition StartId="76" EndId="69" type="0">
</Transition>
<Transition StartId="77" EndId="25" type="0">
</Transition>
<Transition StartId="78" EndId="30" type="0">
</Transition>
<Transition StartId="79" EndId="32" type="0">
</Transition>
<Transition StartId="80" EndId="34" type="0">
</Transition>
<Transition StartId="81" EndId="128" type="0">
</Transition>
<Transition StartId="82" EndId="38" type="0">
</Transition>
<Transition StartId="84" EndId="50" type="0">
</Transition>
<Transition StartId="85" EndId="54" type="0">
</Transition>
<Transition StartId="86" EndId="57" type="0">
</Transition>
<Transition StartId="87" EndId="61" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="0">
</Transition>
<Transition StartId="89" EndId="92" type="0">
</Transition>
<Transition StartId="91" EndId="103" type="0">
</Transition>
<Transition StartId="92" EndId="91" type="0">
</Transition>
<Transition StartId="94" EndId="65" type="0">
</Transition>
<Transition StartId="96" EndId="7" type="1">
<Expression>C131_RLDCU_Check_The_Door_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="96" EndId="142" type="0">
</Transition>
<Transition StartId="97" EndId="10" type="0">
</Transition>
<Transition StartId="98" EndId="97" type="4">
</Transition>
<Transition StartId="98" EndId="10" type="3">
</Transition>
<Transition StartId="99" EndId="12" type="3">
</Transition>
<Transition StartId="99" EndId="73" type="4">
</Transition>
<Transition StartId="102" EndId="106" type="0">
</Transition>
<Transition StartId="103" EndId="102" type="1">
<Expression>C131_RLDCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="103" EndId="106" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="108" type="0">
</Transition>
<Transition StartId="106" EndId="104" type="1">
<Expression>C131_RLDCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="106" EndId="108" type="0">
</Transition>
<Transition StartId="107" EndId="111" type="1">
<Expression>C131_RLDCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="107" EndId="115" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="1">
<Expression>C131_RLDCU_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="108" EndId="107" type="0">
</Transition>
<Transition StartId="109" EndId="110" type="0">
</Transition>
<Transition StartId="110" EndId="107" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="115" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="141" type="0">
</Transition>
<Transition StartId="115" EndId="113" type="1">
<Expression>C131_RLDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="115" EndId="140" type="0">
</Transition>
<Transition StartId="116" EndId="96" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="126" type="0">
</Transition>
<Transition StartId="119" EndId="125" type="0">
</Transition>
<Transition StartId="120" EndId="119" type="0">
</Transition>
<Transition StartId="121" EndId="117" type="1">
<Expression>C131_RLDCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="121" EndId="126" type="0">
</Transition>
<Transition StartId="122" EndId="127" type="0">
</Transition>
<Transition StartId="123" EndId="136" type="0">
</Transition>
<Transition StartId="124" EndId="122" type="0">
</Transition>
<Transition StartId="125" EndId="124" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_RLDCU_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="125" EndId="127" type="0">
</Transition>
<Transition StartId="126" EndId="120" type="1">
<Expression>C131_RLDCU_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="126" EndId="125" type="0">
</Transition>
<Transition StartId="127" EndId="123" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_RLDCU_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="127" EndId="136" type="0">
</Transition>
<Transition StartId="129" EndId="23" type="1">
<Expression>C131_RLDCU_Check_The_Door_Lock_Execute_Flag == true</Expression></Transition>
<Transition StartId="130" EndId="4" type="3">
</Transition>
<Transition StartId="130" EndId="131" type="4">
</Transition>
<Transition StartId="131" EndId="132" type="5">
</Transition>
<Transition StartId="131" EndId="135" type="0">
</Transition>
<Transition StartId="132" EndId="66" type="0">
</Transition>
<Transition StartId="134" EndId="50" type="3">
</Transition>
<Transition StartId="134" EndId="84" type="4">
</Transition>
<Transition StartId="135" EndId="71" type="0">
</Transition>
<Transition StartId="136" EndId="116" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="139" type="0">
</Transition>
<Transition StartId="139" EndId="141" type="0">
</Transition>
<Transition StartId="140" EndId="149" type="0">
</Transition>
<Transition StartId="140" EndId="137" type="1">
<Expression>C131_RLDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="141" EndId="121" type="0">
</Transition>
<Transition StartId="142" EndId="14" type="0">
</Transition>
<Transition StartId="143" EndId="44" type="0">
</Transition>
<Transition StartId="144" EndId="66" type="0">
</Transition>
<Transition StartId="145" EndId="41" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="0">
</Transition>
<Transition StartId="147" EndId="148" type="0">
</Transition>
<Transition StartId="148" EndId="141" type="0">
</Transition>
<Transition StartId="149" EndId="146" type="1">
<Expression>C131_RLDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="149" EndId="265" type="0">
</Transition>
<Transition StartId="150" EndId="163" type="0">
</Transition>
<Transition StartId="163" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="141" type="0">
</Transition>
<Transition StartId="265" EndId="150" type="1">
<Expression>C131_RLDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="265" EndId="121" type="0">
</Transition>
</Transitions>
</Process>

