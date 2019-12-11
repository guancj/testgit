<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1122" pbltext="DEP31">
<Parameters>
<Variable id="C131_AT_Shift_L_Position_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_Tip_Mode_Switch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_Vehicle_Speed_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_Oil_Temperature_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_Shift_Solenoid_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_Linear_Solenoid_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_AT_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AT_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="140" right="240" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="546" top="2507" right="646" bottom="2539"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="自动变速器(AT)">
<Rect left="139" top="54" right="239" bottom="86"/>
<TitleText Enable="1" Text="自动变速器 (AT)"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="AT 挂 P 档">
<Rect left="529" top="296" right="629" bottom="328"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到P档"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x19

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP504" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="AT 挂 R 档">
<Rect left="530" top="342" right="630" bottom="374"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到R档"/>
<Script>#COMM 0x22 0x01 0x19
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP505" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="AT 挂 N 档">
<Rect left="530" top="388" right="630" bottom="420"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到N档"/>
<Script>#COMM 0x22 0x01 0x19


if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP506" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="AT 挂 D 档">
<Rect left="530" top="433" right="630" bottom="465"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到D档"/>
<Script>#COMM 0x22 0x01 0x19


if (@3==0x03) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP507" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="AT 挂 S 档">
<Rect left="531" top="478" right="631" bottom="510"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到S档"/>
<Script>#COMM 0x22 0x01 0x19


if (@3==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP508" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="AT 挂 TIP 档">
<Rect left="531" top="526" right="631" bottom="558"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到手动模式"/>
<Script>#COMM 0x22 0x01 0x19

if (@3==0x05) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP509" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="AT 挂 ECO 档">
<Rect left="531" top="573" right="631" bottom="605"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到经济模式"/>
<Script>#COMM 0x22 0x01 0x25

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP510" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="AT 切换到 Sport 模式">
<Rect left="531" top="620" right="631" bottom="652"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到S档"/>
<Script>#COMM 0x22 0x01 0x25
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP511" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="AT 切换到 Tip 模式">
<Rect left="532" top="667" right="632" bottom="699"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到手动模式"/>
<Script>#COMM 0x22 0x01 0x25

if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP512" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="AT Tip 到 Tip 模式">
<Rect left="532" top="774" right="632" bottom="806"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到手动模式"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x23
if (@3==0x20) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP513" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="AT Tip 到 Tip + 模式">
<Rect left="533" top="819" right="633" bottom="851"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动模式加档"/>
<Script>#COMM 0x22 0x01 0x23
if (@3==0x60) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP477" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="AT Tip 到 Tip 模式">
<Rect left="533" top="867" right="633" bottom="899"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将档位切换到手动模式"/>
<Script>#COMM 0x22 0x01 0x23

if (@3==0x20) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP513" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="AT Tip到Tip-模式">
<Rect left="533" top="913" right="633" bottom="945"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动模式减档"/>
<Script>#COMM 0x22 0x01 0x23


if (@3==0xA0) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP478" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="AT挂P档">
<Rect left="535" top="1018" right="635" bottom="1050"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请切换到P档"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x19


if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP504" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="AT 读车速">
<Rect left="536" top="1065" right="636" bottom="1097"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="有效车辆速度"/>
<Script>#COMM 0x22 0x01 0x18

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP514" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="AT 读油温">
<Rect left="537" top="1167" right="637" bottom="1199"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="油温检测"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x19

if ((@3==0x00) or (@3==0x02)) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP515" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="发送">
<Rect left="536" top="1267" right="636" bottom="1299"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="发送">
<Rect left="536" top="1315" right="636" bottom="1347"/>
<Script>#COMM 0x2f  0x02 0x04 0x03 0x01</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="AT 挂档电磁阀A测试">
<Rect left="537" top="1360" right="637" bottom="1392"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="换挡电磁阀A"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP516" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="发送">
<Rect left="537" top="1406" right="637" bottom="1438"/>
<Script>#COMM 0x2f  0x02 0x04 0x03 0x02</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="AT 挂档电磁阀B测试">
<Rect left="538" top="1450" right="638" bottom="1482"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="换挡电磁阀B"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP517" type="8" flags="97"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="发送">
<Rect left="539" top="1497" right="639" bottom="1529"/>
<Script>#COMM 0x2f  0x02 0x04 0x03 0x04</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="AT 挂档电磁阀C测试">
<Rect left="539" top="1542" right="639" bottom="1574"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="换挡电磁阀C"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP518" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="发送">
<Rect left="540" top="1588" right="640" bottom="1620"/>
<Script>#COMM 0x2f  0x02 0x04 0x03 0x08</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="AT 挂档电磁阀D测试">
<Rect left="540" top="1635" right="640" bottom="1667"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="换挡电磁阀D"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x08) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP519" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="发送">
<Rect left="540" top="1683" right="640" bottom="1715"/>
<Script>#COMM 0x2f  0x02 0x04 0x03 0x10</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="AT 挂档电磁阀测试">
<Rect left="540" top="1729" right="640" bottom="1761"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="换挡电磁阀Relay"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x10) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,"显示读取结果"..OK);
 engine.println("engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP520" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="恢复为默认">
<Rect left="540" top="1775" right="640" bottom="1807"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x04 0x00</Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="发送">
<Rect left="539" top="1867" right="639" bottom="1899"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x00 0x03 0x32</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="AT 挂档电磁阀A电流测试">
<Rect left="541" top="1916" right="641" bottom="1948"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="线性电磁阀A电流"/>
<Script>#COMM 0x22 0x01 0x02

if (@3==0x32) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP521" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="恢复为默认">
<Rect left="541" top="1962" right="641" bottom="1994"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f  0x02 0x00 0x00</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="发送">
<Rect left="542" top="2007" right="642" bottom="2039"/>
<Script>#COMM 0x2f  0x02 0x01 0x03 0x32</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="AT 挂档电磁阀B电流测试">
<Rect left="543" top="2055" right="643" bottom="2087"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="线性电磁阀B电流"/>
<Script>#COMM 0x22 0x01 0x03


if (@3==0x32) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP522" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="恢复为默认">
<Rect left="544" top="2100" right="644" bottom="2132"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f  0x02 0x01 0x00</Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="发送">
<Rect left="545" top="2145" right="645" bottom="2177"/>
<Script>#COMM 0x2f  0x02 0x02 0x03 0x32</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="AT 挂档电磁阀C电流测试">
<Rect left="546" top="2193" right="646" bottom="2225"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="线性电磁阀C电流"/>
<Script>#COMM 0x22 0x01 0x04


if (@3==0x32) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="36" name="DEP523" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="恢复为默认">
<Rect left="546" top="2239" right="646" bottom="2271"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f  0x02 0x02 0x00 </Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="发送">
<Rect left="546" top="2285" right="646" bottom="2317"/>
<Script>#COMM 0x2f  0x02 0x03 0x03 0x32 </Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="AT 挂档电磁阀D电流测试">
<Rect left="547" top="2332" right="647" bottom="2364"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line3Text Enable="1" Text="线性电磁阀D电流"/>
<Script>#COMM 0x22 0x01 0x05

if (@3==0x32) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(3,@3..OK);
  engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="37" name="DEP524" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="恢复为默认">
<Rect left="548" top="2378" right="648" bottom="2410"/>
<Script>#COMM 0x2f  0x02 0x03 0x00</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="547" top="2428" right="647" bottom="2460"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="96" ActivityType="4" flags="0" name="条件一">
<Rect left="564" top="242" right="596" bottom="274"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="条件二">
<Rect left="566" top="724" right="598" bottom="756"/>
</Activity>
<Activity id="101" ActivityType="4" flags="0" name="条件4">
<Rect left="570" top="1115" right="602" bottom="1147"/>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="条件三">
<Rect left="568" top="966" right="600" bottom="998"/>
</Activity>
<Activity id="103" ActivityType="4" flags="0" name="条件5">
<Rect left="570" top="1219" right="602" bottom="1251"/>
</Activity>
<Activity id="104" ActivityType="4" flags="0" name="条件6">
<Rect left="574" top="1820" right="606" bottom="1852"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="连接ECU">
<Rect left="139" top="101" right="239" bottom="133"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT

</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="检测失败">
<Rect left="645" top="913" right="745" bottom="945"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="检测失败">
<Rect left="650" top="1062" right="750" bottom="1094"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="检测失败">
<Rect left="651" top="1167" right="751" bottom="1199"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="检测失败">
<Rect left="651" top="1541" right="751" bottom="1573"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="检测失败">
<Rect left="660" top="2332" right="760" bottom="2364"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="检测失败">
<Rect left="640" top="296" right="740" bottom="328"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="检测失败">
<Rect left="643" top="341" right="743" bottom="373"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="121" ActivityType="3" flags="0" name="检测失败">
<Rect left="644" top="389" right="744" bottom="421"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="检测失败">
<Rect left="642" top="432" right="742" bottom="464"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="检测失败">
<Rect left="642" top="477" right="742" bottom="509"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="检测失败">
<Rect left="642" top="527" right="742" bottom="559"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="检测失败">
<Rect left="642" top="574" right="742" bottom="606"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="检测失败">
<Rect left="643" top="620" right="743" bottom="652"/>
<Script>engine.TestResult =1;
</Script></Activity>
<Activity id="127" ActivityType="3" flags="0" name="检测失败">
<Rect left="645" top="666" right="745" bottom="698"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="检测失败">
<Rect left="644" top="775" right="744" bottom="807"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="检测失败">
<Rect left="645" top="818" right="745" bottom="850"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="130" ActivityType="3" flags="0" name="检测失败">
<Rect left="645" top="867" right="745" bottom="899"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="检测失败">
<Rect left="649" top="1360" right="749" bottom="1392"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="检测失败">
<Rect left="652" top="1451" right="752" bottom="1483"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="检测失败">
<Rect left="651" top="1635" right="751" bottom="1667"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="检测失败">
<Rect left="652" top="1729" right="752" bottom="1761"/>
<Script>engine.TestResult =1;
</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="检测失败">
<Rect left="653" top="1917" right="753" bottom="1949"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="检测失败">
<Rect left="656" top="2055" right="756" bottom="2087"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="137" ActivityType="3" flags="0" name="检测失败">
<Rect left="658" top="2192" right="758" bottom="2224"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="144" ActivityType="3" flags="0" name="清DTC">
<Rect left="140" top="198" right="240" bottom="230"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3101" name="DEP33" type="8" flags="97"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="切诊断">
<Rect left="141" top="245" right="241" bottom="277"/>
<Script>#COMM 0x10 0x02

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3009" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="142" top="295" right="242" bottom="327"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3103" name="DEP34" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="发送key">
<Rect left="144" top="393" right="244" bottom="425"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key3 key2 key1 key0
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3102" name="DEP35" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="13" flags="0" name="计算">
<Rect left="143" top="343" right="243" bottom="375"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB1CEE0B1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="比对零件号">
<Rect left="251" top="108" right="351" bottom="140"/>
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
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15);
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
end</Script><assessment no="1" name="DEP229" type="8" flags="105"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="285" top="45" right="317" bottom="77"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="读硬件号">
<Rect left="369" top="108" right="469" bottom="140"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@13);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1120" type="8" flags="105"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="延时300MS">
<Rect left="369" top="162" right="469" bottom="194"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="167" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="44" right="436" bottom="76"/>
</Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="680" top="43" right="712" bottom="75"/>
</Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="540" top="44" right="572" bottom="76"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="505" top="110" right="605" bottom="142"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@12);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP232" type="8" flags="105"/>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="延时300MS">
<Rect left="504" top="163" right="604" bottom="195"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="读软件号">
<Rect left="650" top="104" right="750" bottom="136"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@13);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP233" type="8" flags="105"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="延时300MS">
<Rect left="650" top="164" right="750" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="950" top="104" right="1050" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	--[[
	if(DString_C131_Partnumber == "3611015-0MK-A" )then
		StandValue="B400000100";
		--if("B400000100" == DString1) then    
	elseif(DString_C131_Partnumber == "3611015-0MK-B" )then	--From 3611015-0MK-A
		StandValue="B400000101";
		--if("B400000101" == DString1) then     
	elseif(DString_C131_Partnumber == "3611015-0ML" )then		--None
		StandValue="B400000405";
		--if("B400000405" == DString1) then  
	elseif(DString_C131_Partnumber == "3611015-0NH-A" )then
		StandValue="B400000201";
		--if("B400000201" == DString1)then    
	else
		StandValue="";
	end
	]]--
	if(DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1AM12")then	--3611015-0MK-B
		StandValue="B400000101";
	elseif(DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1BM32")then	--3611015-0NH-A
		StandValue="B400000201";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
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
		engine.println("不比软件版本号");
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

                                                          

</Script><assessment no="5" name="DEP234" type="8" flags="105"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="延时300MS">
<Rect left="950" top="164" right="1050" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="190" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="44" right="1016" bottom="76"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1670" top="244" right="1770" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="205" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1200" top="104" right="1300" bottom="136"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP235" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="读VIN">
<Rect left="1200" top="164" right="1300" bottom="196"/>
<Line1Text Enable="1" Text="读VIN"/>
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
end</Script><assessment no="7" name="DEP236" type="8" flags="97"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="日期读取">
<Rect left="1320" top="164" right="1420" bottom="196"/>
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
<Activity id="209" ActivityType="3" flags="0" name="发送时间">
<Rect left="1320" top="104" right="1420" bottom="136"/>
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
<Activity id="210" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="44" right="1266" bottom="76"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1450" top="154" right="1550" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="212" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1570" top="104" right="1670" bottom="136"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@4);
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
</Script><assessment no="12" name="DEP239" type="8" flags="105"/>
</Activity>
<Activity id="214" ActivityType="3" flags="0" name="写配置码">
<Rect left="1450" top="104" right="1550" bottom="136"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
--#COMM 0x2e 0x01 0x00 str2hex(VariCoding,1) str2hex(VariCoding,3)
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP238" type="8" flags="97"/>
</Activity>
<Activity id="215" ActivityType="4" flags="0" name="路由节点">
<Rect left="1484" top="44" right="1516" bottom="76"/>
</Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1354" top="44" right="1386" bottom="76"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="1604" top="44" right="1636" bottom="76"/>
</Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="468" top="478" right="500" bottom="510"/>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="486" top="848" right="518" bottom="880"/>
</Activity>
<Activity id="223" ActivityType="4" flags="0" name="路由节点">
<Rect left="490" top="1042" right="522" bottom="1074"/>
</Activity>
<Activity id="224" ActivityType="4" flags="0" name="路由节点">
<Rect left="486" top="1171" right="518" bottom="1203"/>
</Activity>
<Activity id="225" ActivityType="4" flags="0" name="路由节点">
<Rect left="476" top="1499" right="508" bottom="1531"/>
</Activity>
<Activity id="226" ActivityType="4" flags="0" name="路由节点">
<Rect left="481" top="2145" right="513" bottom="2177"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="通讯">
<Rect left="140" top="149" right="240" bottom="181"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3100" name="DEP32" type="8" flags="97"/>
</Activity>
<Activity id="228" ActivityType="3" flags="0" name="通讯失败">
<Rect left="28" top="150" right="128" bottom="182"/>
<Line1Text Enable="1" Text="AT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="63" top="2427" right="95" bottom="2459"/>
</Activity>
<Activity id="230" ActivityType="3" flags="0" name="结束通讯">
<Rect left="27" top="100" right="127" bottom="132"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="231" ActivityType="3" flags="0" name="检测失败">
<Rect left="650" top="1015" right="750" bottom="1047"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="232" ActivityType="4" flags="0" name="路由节点">
<Rect left="1704" top="44" right="1736" bottom="76"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1080" top="164" right="1180" bottom="196"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1BM33" or DString_C131_Car_Tpye=="CH1CM31" or DString_C131_Car_Tpye=="CH1BM34")then	--3611015-0NH-A
		StandValue="B400000201";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
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
		engine.println("不比软件版本号");
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end                                              </Script><assessment no="5" name="DEP234" type="8" flags="97"/>
</Activity>
<Activity id="234" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1080" top="214" right="1180" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="235" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="44" right="1146" bottom="76"/>
</Activity>
<Activity id="236" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="284" right="1136" bottom="316"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="改脸">
<Rect left="1080" top="104" right="1180" bottom="136"/>
<Script></Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="844" top="44" right="876" bottom="76"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="810" top="164" right="910" bottom="196"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="B400000301";

	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1 = engine.GetResponseString(3,2+#StandValue);
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
		engine.println("不比软件版本号");
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end                                              </Script><assessment no="5" name="DEP234" type="8" flags="105"/>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="19年型">
<Rect left="810" top="104" right="910" bottom="136"/>
<Script></Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="延时50MS">
<Rect left="810" top="214" right="910" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="108" type="0">
</Transition>
<Transition StartId="8" EndId="10" type="3">
</Transition>
<Transition StartId="8" EndId="119" type="4">
</Transition>
<Transition StartId="10" EndId="12" type="3">
</Transition>
<Transition StartId="10" EndId="120" type="4">
</Transition>
<Transition StartId="12" EndId="14" type="3">
</Transition>
<Transition StartId="12" EndId="121" type="4">
</Transition>
<Transition StartId="14" EndId="18" type="3">
</Transition>
<Transition StartId="14" EndId="122" type="4">
</Transition>
<Transition StartId="18" EndId="21" type="3">
</Transition>
<Transition StartId="18" EndId="123" type="4">
</Transition>
<Transition StartId="21" EndId="24" type="3">
</Transition>
<Transition StartId="21" EndId="124" type="4">
</Transition>
<Transition StartId="24" EndId="26" type="3">
</Transition>
<Transition StartId="24" EndId="125" type="4">
</Transition>
<Transition StartId="26" EndId="28" type="3">
</Transition>
<Transition StartId="26" EndId="126" type="4">
</Transition>
<Transition StartId="28" EndId="100" type="3">
</Transition>
<Transition StartId="28" EndId="127" type="4">
</Transition>
<Transition StartId="31" EndId="35" type="3">
</Transition>
<Transition StartId="31" EndId="128" type="4">
</Transition>
<Transition StartId="35" EndId="37" type="3">
</Transition>
<Transition StartId="35" EndId="129" type="4">
</Transition>
<Transition StartId="37" EndId="39" type="3">
</Transition>
<Transition StartId="37" EndId="130" type="4">
</Transition>
<Transition StartId="39" EndId="102" type="3">
</Transition>
<Transition StartId="39" EndId="109" type="4">
</Transition>
<Transition StartId="41" EndId="43" type="3">
</Transition>
<Transition StartId="41" EndId="231" type="4">
</Transition>
<Transition StartId="43" EndId="101" type="3">
</Transition>
<Transition StartId="43" EndId="110" type="4">
</Transition>
<Transition StartId="46" EndId="103" type="3">
</Transition>
<Transition StartId="46" EndId="111" type="4">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="3">
</Transition>
<Transition StartId="51" EndId="131" type="4">
</Transition>
<Transition StartId="52" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="3">
</Transition>
<Transition StartId="55" EndId="132" type="4">
</Transition>
<Transition StartId="56" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="61" type="3">
</Transition>
<Transition StartId="59" EndId="112" type="4">
</Transition>
<Transition StartId="61" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="3">
</Transition>
<Transition StartId="64" EndId="133" type="4">
</Transition>
<Transition StartId="65" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="69" type="3">
</Transition>
<Transition StartId="67" EndId="134" type="4">
</Transition>
<Transition StartId="69" EndId="104" type="0">
</Transition>
<Transition StartId="70" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="75" type="3">
</Transition>
<Transition StartId="73" EndId="135" type="4">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="3">
</Transition>
<Transition StartId="79" EndId="136" type="4">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="3">
</Transition>
<Transition StartId="84" EndId="137" type="4">
</Transition>
<Transition StartId="85" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="90" type="3">
</Transition>
<Transition StartId="88" EndId="115" type="4">
</Transition>
<Transition StartId="90" EndId="91" type="0">
</Transition>
<Transition StartId="91" EndId="2" type="0">
</Transition>
<Transition StartId="96" EndId="8" type="1">
<Expression>C131_AT_Shift_L_Position_Execute_Flag == true</Expression></Transition>
<Transition StartId="96" EndId="221" type="0">
</Transition>
<Transition StartId="100" EndId="31" type="1">
<Expression>C131_AT_Tip_Mode_Switch_Execute_Flag == 1</Expression></Transition>
<Transition StartId="100" EndId="222" type="0">
</Transition>
<Transition StartId="101" EndId="46" type="1">
<Expression>C131_AT_Oil_Temperature_Execute_Flag == true</Expression></Transition>
<Transition StartId="101" EndId="224" type="0">
</Transition>
<Transition StartId="102" EndId="41" type="1">
<Expression>C131_AT_Vehicle_Speed_Execute_Flag == true</Expression></Transition>
<Transition StartId="102" EndId="223" type="0">
</Transition>
<Transition StartId="103" EndId="48" type="1">
<Expression>C131_AT_Shift_Solenoid_Execute_Flag == true</Expression></Transition>
<Transition StartId="103" EndId="225" type="0">
</Transition>
<Transition StartId="104" EndId="70" type="1">
<Expression>C131_AT_Linear_Solenoid_Execute_Flag == true</Expression></Transition>
<Transition StartId="104" EndId="226" type="0">
</Transition>
<Transition StartId="108" EndId="227" type="0">
</Transition>
<Transition StartId="109" EndId="102" type="0">
</Transition>
<Transition StartId="110" EndId="101" type="0">
</Transition>
<Transition StartId="111" EndId="103" type="0">
</Transition>
<Transition StartId="112" EndId="61" type="0">
</Transition>
<Transition StartId="115" EndId="90" type="0">
</Transition>
<Transition StartId="119" EndId="10" type="0">
</Transition>
<Transition StartId="120" EndId="12" type="0">
</Transition>
<Transition StartId="121" EndId="14" type="0">
</Transition>
<Transition StartId="122" EndId="18" type="0">
</Transition>
<Transition StartId="123" EndId="21" type="0">
</Transition>
<Transition StartId="124" EndId="24" type="0">
</Transition>
<Transition StartId="125" EndId="26" type="0">
</Transition>
<Transition StartId="126" EndId="28" type="0">
</Transition>
<Transition StartId="127" EndId="100" type="0">
</Transition>
<Transition StartId="128" EndId="35" type="0">
</Transition>
<Transition StartId="129" EndId="37" type="0">
</Transition>
<Transition StartId="130" EndId="39" type="0">
</Transition>
<Transition StartId="131" EndId="52" type="0">
</Transition>
<Transition StartId="132" EndId="56" type="0">
</Transition>
<Transition StartId="133" EndId="65" type="0">
</Transition>
<Transition StartId="134" EndId="69" type="0">
</Transition>
<Transition StartId="135" EndId="75" type="0">
</Transition>
<Transition StartId="136" EndId="80" type="0">
</Transition>
<Transition StartId="137" EndId="85" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="149" type="0">
</Transition>
<Transition StartId="148" EndId="163" type="0">
</Transition>
<Transition StartId="149" EndId="148" type="0">
</Transition>
<Transition StartId="162" EndId="167" type="0">
</Transition>
<Transition StartId="163" EndId="162" type="1">
<Expression>C131_AT_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="163" EndId="167" type="0">
</Transition>
<Transition StartId="164" EndId="166" type="0">
</Transition>
<Transition StartId="166" EndId="169" type="0">
</Transition>
<Transition StartId="167" EndId="164" type="1">
<Expression>C131_AT_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="167" EndId="169" type="0">
</Transition>
<Transition StartId="168" EndId="179" type="1">
<Expression>C131_AT_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="168" EndId="238" type="0">
</Transition>
<Transition StartId="169" EndId="170" type="1">
<Expression>C131_AT_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="169" EndId="168" type="0">
</Transition>
<Transition StartId="170" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="168" type="0">
</Transition>
<Transition StartId="179" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="238" type="0">
</Transition>
<Transition StartId="186" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="236" type="0">
</Transition>
<Transition StartId="190" EndId="186" type="1">
<Expression>C131_AT_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="190" EndId="235" type="0">
</Transition>
<Transition StartId="204" EndId="96" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="218" type="0">
</Transition>
<Transition StartId="207" EndId="215" type="0">
</Transition>
<Transition StartId="209" EndId="207" type="0">
</Transition>
<Transition StartId="210" EndId="205" type="1">
<Expression>C131_AT_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="210" EndId="218" type="0">
</Transition>
<Transition StartId="211" EndId="220" type="0">
</Transition>
<Transition StartId="212" EndId="232" type="0">
</Transition>
<Transition StartId="214" EndId="211" type="0">
</Transition>
<Transition StartId="215" EndId="214" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_AT_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="215" EndId="220" type="0">
</Transition>
<Transition StartId="218" EndId="209" type="1">
<Expression>C131_AT_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="218" EndId="215" type="0">
</Transition>
<Transition StartId="220" EndId="212" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_AT_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="220" EndId="232" type="0">
</Transition>
<Transition StartId="221" EndId="100" type="0">
</Transition>
<Transition StartId="222" EndId="102" type="0">
</Transition>
<Transition StartId="223" EndId="101" type="0">
</Transition>
<Transition StartId="224" EndId="103" type="0">
</Transition>
<Transition StartId="225" EndId="104" type="0">
</Transition>
<Transition StartId="226" EndId="91" type="0">
</Transition>
<Transition StartId="227" EndId="144" type="3">
</Transition>
<Transition StartId="227" EndId="228" type="4">
</Transition>
<Transition StartId="228" EndId="230" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="5">
</Transition>
<Transition StartId="229" EndId="91" type="0">
</Transition>
<Transition StartId="230" EndId="108" type="0">
</Transition>
<Transition StartId="231" EndId="43" type="0">
</Transition>
<Transition StartId="232" EndId="204" type="0">
</Transition>
<Transition StartId="233" EndId="234" type="0">
</Transition>
<Transition StartId="234" EndId="236" type="0">
</Transition>
<Transition StartId="235" EndId="237" type="1">
<Expression>C131_AT_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="235" EndId="210" type="0">
</Transition>
<Transition StartId="236" EndId="210" type="0">
</Transition>
<Transition StartId="237" EndId="233" type="0">
</Transition>
<Transition StartId="238" EndId="190" type="0">
</Transition>
<Transition StartId="238" EndId="240" type="1">
<Expression>C131_AT_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="239" EndId="241" type="0">
</Transition>
<Transition StartId="240" EndId="239" type="0">
</Transition>
<Transition StartId="241" EndId="236" type="0">
</Transition>
</Transitions>
</Process>

