<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1131" pbltext="DEP125">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_Partnumber_RRDCU"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber_RRDCU"/>
<Variable id="C131_RRDCU_Check_The_Door_Lights_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Check_The_Door_Window_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Check_The_Door_Lock_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Check_The_Switches_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Check_Central_Lock_Switch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Check_Mechanical_Key_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Window_Initialization_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_Window_Learning_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_RRDCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75C" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77C" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="207" top="43" right="307" bottom="75"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="811" top="2085" right="911" bottom="2117"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="右后门 (RRDCU)">
<Rect left="208" top="95" right="308" bottom="127"/>
<TitleText Enable="1" Text="右后门(RRDCU)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="207" top="236" right="307" bottom="268"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1314" name="DEP127" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="4" flags="0" name="条件1">
<Rect left="842" top="422" right="874" bottom="454"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="自动测试">
<Rect left="807" top="489" right="907" bottom="521"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门门灯打开"/>
<Script>#COMM 0x2f 0x02 0x14 0x03 0x01</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="右后门灯打开">
<Rect left="806" top="535" right="906" bottom="567"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2b
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP678" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="自动测试">
<Rect left="805" top="580" right="905" bottom="612"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门门灯关闭"/>
<Script>#COMM 0x2f 0x02 0x14 0x03 0x00</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="右后门灯关闭">
<Rect left="805" top="627" right="905" bottom="659"/>
<Strategy TotalTime="5" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2b
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
  engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP679" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="Doors_lights_ReturnControlToECU">
<Rect left="804" top="675" right="904" bottom="707"/>
<Script>#COMM 0x2f 0x02 0x14 0x00








</Script></Activity>
<Activity id="14" ActivityType="4" flags="0" name="条件2">
<Rect left="837" top="725" right="869" bottom="757"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="自动测试">
<Rect left="804" top="795" right="904" bottom="827"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门玻璃降"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x02
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="RRDCU 自动降右后门玻璃">
<Rect left="804" top="840" right="904" bottom="872"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP680" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="Window_down_stop">
<Rect left="805" top="890" right="905" bottom="922"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x00








</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="自动测试">
<Rect left="804" top="935" right="904" bottom="967"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门玻璃升"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x01








</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="RRDCU 自动升右后门玻璃">
<Rect left="804" top="981" right="904" bottom="1013"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP681" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="Window_up_stop">
<Rect left="805" top="1027" right="905" bottom="1059"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x00









</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="804" top="1073" right="904" bottom="1105"/>
<Script>#COMM   0x2f  0x02 0x13 0x00








</Script></Activity>
<Activity id="23" ActivityType="4" flags="0" name="条件3">
<Rect left="151" top="2303" right="183" bottom="2335"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="自动测试">
<Rect left="117" top="2349" right="217" bottom="2381"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动上锁"/>
<Script>#COMM 0x2f 0x02 0x12 0x03 0x01</Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="RRDCU 右后门锁定">
<Rect left="116" top="2396" right="216" bottom="2428"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2a
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="自动测试">
<Rect left="118" top="2441" right="218" bottom="2473"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动解锁"/>
<Script>#COMM 0x2f 0x02 0x12 0x03 0x00</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="RRDCU 右后门解锁">
<Rect left="118" top="2487" right="218" bottom="2519"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2a
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="Doors_lock_ReturnControlToECU">
<Rect left="115" top="2534" right="215" bottom="2566"/>
<Script>#COMM   0x2f  0x02 0x12 0x00








</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="115" top="2638" right="215" bottom="2670"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="30" ActivityType="4" flags="0" name="条件4">
<Rect left="149" top="2585" right="181" bottom="2617"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="手动测试">
<Rect left="115" top="2685" right="215" bottom="2717"/>
<Line1Text Enable="1" Text="手动下降"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="RRDCU 手动降右后门玻璃">
<Rect left="115" top="2732" right="215" bottom="2764"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="手动测试">
<Rect left="117" top="2781" right="217" bottom="2813"/>
<Line1Text Enable="1" Text="手动下降"/>
<Line2Text Enable="1" Text="手动右后门门玻璃降Level 2"/>
<Script></Script></Activity>
<Activity id="34" ActivityType="3" flags="0" name="RRDCU 手动降右后门玻璃">
<Rect left="118" top="2829" right="218" bottom="2861"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32
if (@3==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="手动测试">
<Rect left="119" top="2878" right="219" bottom="2910"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="右后门玻璃升Level 1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="RRDCU 手动升右后门玻璃">
<Rect left="120" top="2926" right="220" bottom="2958"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="手动上升">
<Rect left="120" top="2972" right="220" bottom="3004"/>
<Line1Text Enable="1" Text="手动上升"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 2"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="4" flags="0" name="条件5">
<Rect left="415" top="2846" right="447" bottom="2878"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="手动测试">
<Rect left="382" top="2896" right="482" bottom="2928"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机中控锁 锁定"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 4000</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="RRDCU 右后门锁定">
<Rect left="382" top="2941" right="482" bottom="2973"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="手动测试">
<Rect left="382" top="2988" right="482" bottom="3020"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机中控锁 解锁"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="RRDCU 右后门解锁">
<Rect left="382" top="3033" right="482" bottom="3065"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="条件6">
<Rect left="416" top="3083" right="448" bottom="3115"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="手动测试">
<Rect left="383" top="3129" right="483" bottom="3161"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="请用钥匙锁车门"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="PDCU 副驾驶门锁定">
<Rect left="382" top="3175" right="482" bottom="3207"/>
<Strategy NokTime="0" RetryTimeOut="15"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="钥匙解锁手动测试">
<Rect left="381" top="3222" right="481" bottom="3254"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="拨动相应开关"/>
<Line3Text Enable="1" Text="请用钥匙解锁车门"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="门解锁">
<Rect left="380" top="3266" right="480" bottom="3298"/>
<Strategy TotalTime="150" ExpectedTime="2" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="382" top="3313" right="482" bottom="3345"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="手动完成上升、下降、再上升的循环">
<Rect left="807" top="1434" right="907" bottom="1466"/>
<Strategy NokTime="0" RetryTimeOut="600"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="自动完成上升、下降、再上升的循环"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
   engine.println("人工操作点击确定！");   
engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.println("人工操作点击放弃！");  
engine.StatValue="人工操作点击放弃！";
else
end
</Script><assessment no="333" name="DEP1095" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="808" top="1560" right="908" bottom="1592"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("右后门自动上升下降")</Script></Activity>
<Activity id="61" ActivityType="4" flags="0" name="条件8">
<Rect left="841" top="1483" right="873" bottom="1515"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="右后玻璃升 第一次自动测试">
<Rect left="809" top="1760" right="909" bottom="1792"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="右后玻璃升 第一次"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="16" name="DEP681" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="RRDCU 自动升右后门玻璃">
<Rect left="809" top="1810" right="909" bottom="1842"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="发送下降停止">
<Rect left="809" top="1710" right="909" bottom="1742"/>
<Script>#COMM   0x2f 0x02 0x13 0x03 0x00
#DELAY 1000







</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="发送上升停止">
<Rect left="809" top="1858" right="909" bottom="1890"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x00
#DELAY 1000







</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="右后玻璃升 第二次自动测试">
<Rect left="367" top="2810" right="467" bottom="2842"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="自动升降共2次"/>
<Line3Text Enable="1" Text="右后玻璃升 第二次"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x01
</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="RRDCU 自动升右后门玻璃">
<Rect left="367" top="2713" right="467" bottom="2745"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="发送上升停止">
<Rect left="369" top="2620" right="469" bottom="2652"/>
<Script>#COMM   0x2f 0x02 0x13 0x03 0x00








</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="延时">
<Rect left="368" top="2667" right="468" bottom="2699"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="延时">
<Rect left="370" top="2573" right="470" bottom="2605"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="右后玻璃降 自动测试">
<Rect left="370" top="2525" right="470" bottom="2557"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="自动升降共2次"/>
<Line3Text Enable="1" Text="右后玻璃降 第二次"/>
<Script>#COMM    0x2f 0x02 0x13 0x03 0x02</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="延时">
<Rect left="369" top="2477" right="469" bottom="2509"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="RRDCU 自动降右后门玻璃">
<Rect left="369" top="2432" right="469" bottom="2464"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29

if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
engine.println(" engine.LastError=".. engine.LastError);</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="延时">
<Rect left="370" top="2385" right="470" bottom="2417"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="发送下降停止">
<Rect left="371" top="2339" right="471" bottom="2371"/>
<Script>#COMM   0x2f 0x02 0x13 0x03 0x00








</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="Doors_window_ReturnControlToECU">
<Rect left="810" top="1909" right="910" bottom="1941"/>
<Script>#COMM   0x2f 0x02 0x13 0x00








</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="读学习状态">
<Rect left="810" top="1962" right="910" bottom="1994"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM   0x22 0x01 0x29

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script><assessment no="19" name="DEP683" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="811" top="2019" right="911" bottom="2051"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="95" ActivityType="4" flags="0" name="路由节点">
<Rect left="841" top="1383" right="873" bottom="1415"/>
</Activity>
<Activity id="97" ActivityType="4" flags="0" name="路由节点">
<Rect left="499" top="3198" right="531" bottom="3230"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="检测失败">
<Rect left="693" top="538" right="793" bottom="570"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="检测失败">
<Rect left="693" top="626" right="793" bottom="658"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="检测失败">
<Rect left="692" top="841" right="792" bottom="873"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="检测失败">
<Rect left="689" top="981" right="789" bottom="1013"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="检测失败">
<Rect left="3" top="2397" right="103" bottom="2429"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="检测失败">
<Rect left="5" top="2487" right="105" bottom="2519"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="检测失败">
<Rect left="2" top="2829" right="102" bottom="2861"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="6" top="2926" right="106" bottom="2958"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="检测失败">
<Rect left="268" top="2942" right="368" bottom="2974"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="120" ActivityType="4" flags="0" name="路由节点">
<Rect left="507" top="2959" right="539" bottom="2991"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="检测失败">
<Rect left="268" top="3266" right="368" bottom="3298"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="124" ActivityType="4" flags="0" name="路由节点">
<Rect left="416" top="3368" right="448" bottom="3400"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="检测失败">
<Rect left="693" top="1662" right="793" bottom="1694"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="检测失败">
<Rect left="696" top="1810" right="796" bottom="1842"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="延时">
<Rect left="494" top="2809" right="594" bottom="2841"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="检测失败">
<Rect left="482" top="2667" right="582" bottom="2699"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="检测失败">
<Rect left="483" top="2433" right="583" bottom="2465"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="连接ECU">
<Rect left="206" top="140" right="306" bottom="172"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="检测失败">
<Rect left="269" top="3033" right="369" bottom="3065"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="切诊断">
<Rect left="208" top="284" right="308" bottom="316"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1315" name="DEP1094" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="208" top="331" right="308" bottom="363"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1316" name="DEP129" type="8" flags="97"/>
</Activity>
<Activity id="137" ActivityType="13" flags="0" name="计算key">
<Rect left="209" top="380" right="309" bottom="412"/>
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
<Activity id="138" ActivityType="3" flags="0" name="发送key">
<Rect left="208" top="426" right="308" bottom="458"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1317" name="DEP130" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="4" flags="0" name="路由节点">
<Rect left="234" top="2436" right="266" bottom="2468"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="检测失败">
<Rect top="2733" right="100" bottom="2765"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="143" ActivityType="3" flags="0" name="延时">
<Rect left="367" top="2759" right="467" bottom="2791"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="926" top="935" right="958" bottom="967"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="922" top="1433" right="954" bottom="1465"/>
</Activity>
<Activity id="153" ActivityType="3" flags="0" name="比对零件号">
<Rect left="320" top="144" right="420" bottom="176"/>
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
end</Script><assessment no="1" name="DEP669" type="8" flags="105"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="94" right="386" bottom="126"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="读硬件号">
<Rect left="440" top="144" right="540" bottom="176"/>
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
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP670" type="8" flags="105"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="延时300MS">
<Rect left="440" top="194" right="540" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="94" right="506" bottom="126"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="94" right="766" bottom="126"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="94" right="646" bottom="126"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="580" top="154" right="680" bottom="186"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP671" type="8" flags="105"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="读软件号">
<Rect left="700" top="144" right="800" bottom="176"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP672" type="8" flags="105"/>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="延时300MS">
<Rect left="700" top="194" right="800" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="840" top="144" right="940" bottom="176"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="2.00";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	--if("2.00" == DString1) then 
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

</Script><assessment no="5" name="DEP673" type="8" flags="105"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="延时300MS">
<Rect left="840" top="194" right="940" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="94" right="906" bottom="126"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1360" top="144" right="1460" bottom="176"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP674" type="8" flags="97"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1360" top="194" right="1460" bottom="226"/>
<Line1Text Enable="1" Text="比对VIN码"/>
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
end</Script><assessment no="7" name="DEP675" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="日期读取">
<Rect left="1480" top="194" right="1580" bottom="226"/>
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
<Activity id="169" ActivityType="3" flags="0" name="发送时间">
<Rect left="1480" top="144" right="1580" bottom="176"/>
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
<Activity id="170" ActivityType="4" flags="0" name="路由节点">
<Rect left="1394" top="94" right="1426" bottom="126"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="延时300MS">
<Rect left="580" top="194" right="680" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1610" top="194" right="1710" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1720" top="154" right="1820" bottom="186"/>
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
end</Script><assessment no="11" name="DEP677" type="8" flags="97"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="写配置码">
<Rect left="1610" top="144" right="1710" bottom="176"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP676" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="1644" top="94" right="1676" bottom="126"/>
</Activity>
<Activity id="176" ActivityType="4" flags="0" name="路由节点">
<Rect left="1514" top="94" right="1546" bottom="126"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1830" top="424" right="1930" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="178" ActivityType="4" flags="0" name="路由节点">
<Rect left="1754" top="94" right="1786" bottom="126"/>
</Activity>
<Activity id="183" ActivityType="4" flags="0" name="路由节点">
<Rect left="929" top="1731" right="961" bottom="1763"/>
</Activity>
<Activity id="184" ActivityType="4" flags="0" name="路由节点">
<Rect left="838" top="1121" right="870" bottom="1153"/>
</Activity>
<Activity id="185" ActivityType="3" flags="0" name="手动测试">
<Rect left="805" top="1191" right="905" bottom="1223"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="右后门中控门锁 锁定"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="右后门中控门锁 锁定">
<Rect left="805" top="1241" right="905" bottom="1273"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x28
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP786" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="检测失败">
<Rect left="685" top="1244" right="785" bottom="1276"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="188" ActivityType="3" flags="0" name="手动测试">
<Rect left="804" top="1288" right="904" bottom="1320"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="右后门中控门锁 解锁"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="右后门中控门锁 解锁">
<Rect left="804" top="1335" right="904" bottom="1367"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0x01 0x28
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP787" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="检测失败">
<Rect left="688" top="1336" right="788" bottom="1368"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="922" top="1262" right="954" bottom="1294"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="通讯">
<Rect left="207" top="191" right="307" bottom="223"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1313" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="通讯失败">
<Rect left="93" top="194" right="193" bottom="226"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="194" ActivityType="4" flags="0" name="路由节点">
<Rect left="127" top="2019" right="159" bottom="2051"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="右后玻璃降 第一次自动测试">
<Rect left="807" top="1611" right="907" bottom="1643"/>
<Line1Text Enable="1" Text="自动升降"/>
<Line2Text Enable="1" Text="右后玻璃降 第一次"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f 0x02 0x13 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY 1000</Script><assessment no="17" name="DEP680" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="RRDCU 自动降右后门玻璃">
<Rect left="808" top="1659" right="908" bottom="1691"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="500"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29

if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="结束通讯">
<Rect left="94" top="140" right="194" bottom="172"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="198" ActivityType="4" flags="0" name="路由节点">
<Rect left="1864" top="94" right="1896" bottom="126"/>
</Activity>
<Activity id="199" ActivityType="3" flags="0" name="混动车型">
<Rect left="960" top="144" right="1060" bottom="176"/>
<Script></Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="950" top="194" right="1050" bottom="226"/>
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

</Script><assessment no="5" name="DEP673" type="8" flags="105"/>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="延时300MS">
<Rect left="960" top="244" right="1060" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="202" ActivityType="4" flags="0" name="路由节点">
<Rect left="994" top="94" right="1026" bottom="126"/>
</Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="294" right="1146" bottom="326"/>
</Activity>
<Activity id="204" ActivityType="4" flags="0" name="路由节点">
<Rect left="929" top="580" right="961" bottom="612"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="改脸">
<Rect left="1080" top="144" right="1180" bottom="176"/>
<Script></Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1080" top="194" right="1180" bottom="226"/>
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

</Script><assessment no="5" name="DEP673" type="8" flags="105"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1080" top="244" right="1180" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="208" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="94" right="1146" bottom="126"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="19年型">
<Rect left="1220" top="144" right="1320" bottom="176"/>
<Script></Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1220" top="194" right="1320" bottom="226"/>
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
end</Script><assessment no="5" name="DEP673" type="8" flags="105"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1220" top="244" right="1320" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="94" right="1286" bottom="126"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="131" type="0">
</Transition>
<Transition StartId="4" EndId="134" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="1">
<Expression>C131_RRDCU_Check_The_Door_Lights_Execute_Flag == true</Expression></Transition>
<Transition StartId="7" EndId="204" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="3">
</Transition>
<Transition StartId="9" EndId="103" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="3">
</Transition>
<Transition StartId="11" EndId="105" type="4">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_RRDCU_Check_The_Door_Window_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="148" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="3">
</Transition>
<Transition StartId="16" EndId="106" type="4">
</Transition>
<Transition StartId="17" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="3">
</Transition>
<Transition StartId="20" EndId="108" type="4">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="184" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="1">
<Expression>C131_RRDCU_Check_The_Door_Lock_Execute_Flag == true</Expression></Transition>
<Transition StartId="23" EndId="139" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="3">
</Transition>
<Transition StartId="25" EndId="111" type="4">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="3">
</Transition>
<Transition StartId="27" EndId="113" type="4">
</Transition>
<Transition StartId="28" EndId="30" type="0">
</Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="30" EndId="29" type="1">
<Expression>C131_RRDCU_Check_The_Switches_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="33" type="3">
</Transition>
<Transition StartId="32" EndId="140" type="4">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="3">
</Transition>
<Transition StartId="34" EndId="116" type="4">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="3">
</Transition>
<Transition StartId="36" EndId="117" type="4">
</Transition>
<Transition StartId="43" EndId="47" type="1">
<Expression>C131_RRDCU_Check_Central_Lock_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="43" EndId="120" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="3">
</Transition>
<Transition StartId="48" EndId="119" type="4">
</Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="51" type="3">
</Transition>
<Transition StartId="50" EndId="132" type="4">
</Transition>
<Transition StartId="51" EndId="52" type="1">
<Expression>C131_RRDCU_Check_Mechanical_Key_Execute_Flag == true</Expression></Transition>
<Transition StartId="51" EndId="97" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="3">
</Transition>
<Transition StartId="55" EndId="123" type="4">
</Transition>
<Transition StartId="56" EndId="124" type="0">
</Transition>
<Transition StartId="57" EndId="61" type="0">
</Transition>
<Transition StartId="60" EndId="195" type="0">
</Transition>
<Transition StartId="61" EndId="60" type="1">
<Expression>C131_RRDCU_Window_Learning_Execute_Flag == true</Expression></Transition>
<Transition StartId="61" EndId="183" type="0">
</Transition>
<Transition StartId="66" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="75" type="3">
</Transition>
<Transition StartId="68" EndId="126" type="4">
</Transition>
<Transition StartId="69" EndId="66" type="0">
</Transition>
<Transition StartId="75" EndId="86" type="0">
</Transition>
<Transition StartId="76" EndId="143" type="0">
</Transition>
<Transition StartId="77" EndId="79" type="3">
</Transition>
<Transition StartId="77" EndId="128" type="4">
</Transition>
<Transition StartId="78" EndId="80" type="0">
</Transition>
<Transition StartId="79" EndId="78" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="3">
</Transition>
<Transition StartId="83" EndId="129" type="4">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="86" EndId="91" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="2" type="0">
</Transition>
<Transition StartId="95" EndId="57" type="1">
<Expression>C131_RRDCU_Window_Initialization_Execute_Flag == true</Expression></Transition>
<Transition StartId="95" EndId="150" type="0">
</Transition>
<Transition StartId="97" EndId="56" type="0">
</Transition>
<Transition StartId="103" EndId="10" type="0">
</Transition>
<Transition StartId="105" EndId="12" type="0">
</Transition>
<Transition StartId="106" EndId="17" type="0">
</Transition>
<Transition StartId="108" EndId="21" type="0">
</Transition>
<Transition StartId="111" EndId="26" type="0">
</Transition>
<Transition StartId="113" EndId="28" type="0">
</Transition>
<Transition StartId="116" EndId="35" type="0">
</Transition>
<Transition StartId="117" EndId="37" type="0">
</Transition>
<Transition StartId="119" EndId="49" type="0">
</Transition>
<Transition StartId="120" EndId="51" type="0">
</Transition>
<Transition StartId="123" EndId="56" type="0">
</Transition>
<Transition StartId="125" EndId="69" type="0">
</Transition>
<Transition StartId="126" EndId="75" type="0">
</Transition>
<Transition StartId="127" EndId="76" type="0">
</Transition>
<Transition StartId="128" EndId="79" type="0">
</Transition>
<Transition StartId="129" EndId="84" type="0">
</Transition>
<Transition StartId="131" EndId="192" type="0">
</Transition>
<Transition StartId="132" EndId="51" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="154" type="0">
</Transition>
<Transition StartId="139" EndId="30" type="0">
</Transition>
<Transition StartId="140" EndId="33" type="0">
</Transition>
<Transition StartId="143" EndId="77" type="0">
</Transition>
<Transition StartId="148" EndId="184" type="0">
</Transition>
<Transition StartId="150" EndId="61" type="0">
</Transition>
<Transition StartId="153" EndId="157" type="0">
</Transition>
<Transition StartId="154" EndId="153" type="1">
<Expression>C131_RRDCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="154" EndId="157" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="159" type="0">
</Transition>
<Transition StartId="157" EndId="155" type="1">
<Expression>C131_RRDCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="157" EndId="159" type="0">
</Transition>
<Transition StartId="158" EndId="161" type="1">
<Expression>C131_RRDCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="158" EndId="165" type="0">
</Transition>
<Transition StartId="159" EndId="160" type="1">
<Expression>C131_RRDCU_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="159" EndId="158" type="0">
</Transition>
<Transition StartId="160" EndId="171" type="0">
</Transition>
<Transition StartId="161" EndId="162" type="0">
</Transition>
<Transition StartId="162" EndId="165" type="0">
</Transition>
<Transition StartId="163" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="203" type="0">
</Transition>
<Transition StartId="165" EndId="163" type="1">
<Expression>C131_RRDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="165" EndId="202" type="0">
</Transition>
<Transition StartId="166" EndId="167" type="0">
</Transition>
<Transition StartId="167" EndId="176" type="0">
</Transition>
<Transition StartId="168" EndId="175" type="0">
</Transition>
<Transition StartId="169" EndId="168" type="0">
</Transition>
<Transition StartId="170" EndId="166" type="1">
<Expression>C131_RRDCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="170" EndId="176" type="0">
</Transition>
<Transition StartId="171" EndId="158" type="0">
</Transition>
<Transition StartId="172" EndId="178" type="0">
</Transition>
<Transition StartId="173" EndId="198" type="0">
</Transition>
<Transition StartId="174" EndId="172" type="0">
</Transition>
<Transition StartId="175" EndId="174" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_RRDCU_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="175" EndId="178" type="0">
</Transition>
<Transition StartId="176" EndId="169" type="1">
<Expression>C131_RRDCU_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="176" EndId="175" type="0">
</Transition>
<Transition StartId="177" EndId="7" type="0">
</Transition>
<Transition StartId="178" EndId="173" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_RRDCU_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="178" EndId="198" type="0">
</Transition>
<Transition StartId="183" EndId="92" type="0">
</Transition>
<Transition StartId="184" EndId="185" type="1">
<Expression>C131_RRDCU_Check_Central_Lock_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="184" EndId="191" type="0">
</Transition>
<Transition StartId="185" EndId="186" type="0">
</Transition>
<Transition StartId="186" EndId="187" type="4">
</Transition>
<Transition StartId="186" EndId="188" type="3">
</Transition>
<Transition StartId="187" EndId="188" type="0">
</Transition>
<Transition StartId="188" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="4">
</Transition>
<Transition StartId="189" EndId="95" type="3">
</Transition>
<Transition StartId="190" EndId="95" type="0">
</Transition>
<Transition StartId="191" EndId="95" type="0">
</Transition>
<Transition StartId="192" EndId="4" type="3">
</Transition>
<Transition StartId="192" EndId="193" type="4">
</Transition>
<Transition StartId="193" EndId="197" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="5">
</Transition>
<Transition StartId="194" EndId="92" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="125" type="4">
</Transition>
<Transition StartId="196" EndId="69" type="3">
</Transition>
<Transition StartId="197" EndId="131" type="0">
</Transition>
<Transition StartId="198" EndId="177" type="0">
</Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="0">
</Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="202" EndId="208" type="0">
</Transition>
<Transition StartId="202" EndId="199" type="1">
<Expression>C131_RRDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="203" EndId="170" type="0">
</Transition>
<Transition StartId="204" EndId="14" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="203" type="0">
</Transition>
<Transition StartId="208" EndId="205" type="1">
<Expression>C131_RRDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="208" EndId="265" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="211" type="0">
</Transition>
<Transition StartId="211" EndId="203" type="0">
</Transition>
<Transition StartId="265" EndId="209" type="1">
<Expression>C131_RRDCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="265" EndId="170" type="0">
</Transition>
</Transitions>
</Process>

