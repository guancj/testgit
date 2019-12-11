<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1121" pbltext="DEP73">
<Parameters>
<Variable id="C131_PDC_System_Self_Checking_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_Function_Activation_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_Read_Sensor_Data_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_Read_Switch_Data_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_PDC_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PDC_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="P3Max" type="3" data="3000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x763" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x783" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="142" top="4" right="242" bottom="36"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="476" top="2874" right="576" bottom="2906"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="倒车雷达(PDC)">
<Rect left="142" top="56" right="242" bottom="88"/>
<TitleText Enable="1" Text="倒车雷达 (PDC)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="141" top="253" right="241" bottom="285"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
if(@0 == 0x54)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2901" name="DEP75" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="手动确认R档">
<Rect left="466" top="1001" right="566" bottom="1033"/>
<Line1Text Enable="1" Text="请熄火，挂R档，位于车外"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON

</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="前左雷达">
<Rect left="467" top="1060" right="567" bottom="1092"/>
<Line1Text Enable="1" Text="请站于前左雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="左前传感器">
<Rect left="467" top="1109" right="567" bottom="1141"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距前左角雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x05
if(@0==0x62)then

if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;
engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="18" name="DEP492" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="PDC自检 ">
<Rect left="466" top="481" right="566" bottom="513"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x31 0x01 0xc0 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP486" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="PDC结束自检 ">
<Rect left="466" top="579" right="566" bottom="611"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>--#COMM 0x31 0x02 0x3f
#COMM 0x31 0x02 0xc0 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP487" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="PDC自检结果 ">
<Rect left="467" top="625" right="567" bottom="657"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x31 0x03  0xc0 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
if(@0==0x71)then
	if (@4==0x00) then
		engine.LastError = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	if (@0==0x7F) then
		if (@1==0x31 and @2==0x33) then
			engine.LastError = 0;
		else
			engine.LastError = 1;
			engine.TestResult = 1;
		end
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
end</Script><assessment no="14" name="DEP488" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="500" top="682" right="532" bottom="714"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="R档DVD后视激活">
<Rect left="465" top="736" right="565" bottom="768"/>
<Line1Text Enable="1" Text="挂R档,DVD后视激活"/>
<Line2Text Enable="1" Text="#L=中控面板PDC开关灯亮？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="15" name="DEP489" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="关闭PDC开关">
<Rect left="466" top="786" right="566" bottom="818"/>
<Line1Text Enable="1" Text="关闭 PDC 开关"/>
<Line2Text Enable="1" Text="#L=中控面板PDC开关灯灭？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="16" name="DEP490" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="P档 关闭倒车">
<Rect left="466" top="834" right="566" bottom="866"/>
<Line1Text Enable="1" Text="挂 P 档"/>
<Line2Text Enable="1" Text="#L=倒车雷达功能关闭？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="17" name="DEP491" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="清空显示">
<Rect left="466" top="883" right="566" bottom="915"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="32" ActivityType="4" flags="0" name="路由节点">
<Rect left="500" top="941" right="532" bottom="973"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="清空显示">
<Rect left="468" top="1159" right="568" bottom="1191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="前中左雷达">
<Rect left="468" top="1212" right="568" bottom="1244"/>
<Line1Text Enable="1" Text="请站于前中左雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="左前中传感器">
<Rect left="469" top="1264" right="569" bottom="1296"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距前中左雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x06
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="19" name="DEP493" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="清空显示">
<Rect left="470" top="1312" right="570" bottom="1344"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="前中右雷达">
<Rect left="470" top="1366" right="570" bottom="1398"/>
<Line1Text Enable="1" Text="请站于前中右雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="右前中传感器">
<Rect left="470" top="1413" right="570" bottom="1445"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距前中右雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x07
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP494" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="清空显示">
<Rect left="471" top="1466" right="571" bottom="1498"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="前右雷达">
<Rect left="470" top="1522" right="570" bottom="1554"/>
<Line1Text Enable="1" Text="请站于前右雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="右前传感器">
<Rect left="471" top="1571" right="571" bottom="1603"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距前右角雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x08
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="21" name="DEP495" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="清空显示">
<Rect left="472" top="1617" right="572" bottom="1649"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="后右雷达">
<Rect left="471" top="1668" right="571" bottom="1700"/>
<Line1Text Enable="1" Text="请站于后右雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="右后传感器">
<Rect left="472" top="1715" right="572" bottom="1747"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距后右角雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0C
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="22" name="DEP496" type="8" flags="97"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="清空显示">
<Rect left="473" top="1767" right="573" bottom="1799"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="后中左雷达">
<Rect left="474" top="1968" right="574" bottom="2000"/>
<Line1Text Enable="1" Text="请站于后中左雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="左后中传感器">
<Rect left="474" top="2017" right="574" bottom="2049"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距后中左雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0a
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="24" name="DEP498" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="清空显示">
<Rect left="474" top="2067" right="574" bottom="2099"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="后左雷达">
<Rect left="474" top="2116" right="574" bottom="2148"/>
<Line1Text Enable="1" Text="请站于后左雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="左后传感器">
<Rect left="474" top="2167" right="574" bottom="2199"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距后左角雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x09
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;
engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="25" name="DEP499" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="清空显示">
<Rect left="473" top="2217" right="573" bottom="2249"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="回车内挂P档">
<Rect left="473" top="2267" right="573" bottom="2299"/>
<Line1Text Enable="1" Text="请回到车内，挂P档"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="清空四行">
<Rect left="472" top="2329" right="572" bottom="2361"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="620" top="1567" right="652" bottom="1599"/>
</Activity>
<Activity id="76" ActivityType="4" flags="0" name="路由节点">
<Rect left="505" top="2387" right="537" bottom="2419"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="打开倒车雷达">
<Rect left="472" top="2440" right="572" bottom="2472"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开倒车雷达开关"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="PDC 开关打开">
<Rect left="472" top="2487" right="572" bottom="2519"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,string.format("%02X",@3));--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="26" name="DEP500" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="倒车雷达PDC">
<Rect left="473" top="2538" right="573" bottom="2570"/>
<Line1Text Enable="1" Text="倒车雷达 (PDC)"/>
<Line2Text Enable="1" Text="#L=PDC 显示灯亮了吗？#R=BMPEYE"/>
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
</Script><assessment no="27" name="DEP501" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="关闭倒车雷达">
<Rect left="475" top="2590" right="575" bottom="2622"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="关闭倒车雷达开关"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="PDC 开关关闭">
<Rect left="475" top="2637" right="575" bottom="2669"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x04

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,string.format("%02X",@3));--显示距离结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP502" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="倒车雷达PDC">
<Rect left="476" top="2688" right="576" bottom="2720"/>
<Line1Text Enable="1" Text="倒车雷达 (PDC)"/>
<Line2Text Enable="1" Text="#L=PDC 显示灯灭了吗？#R=BMPEYE"/>
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
</Script><assessment no="29" name="DEP503" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="清空显示">
<Rect left="475" top="2811" right="575" bottom="2843"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="连接ECU">
<Rect left="141" top="106" right="241" bottom="138"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="延时1500MS">
<Rect left="466" top="534" right="566" bottom="566"/>
<Script>#DELAY 1500</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="检测失败">
<Rect left="348" top="1002" right="448" bottom="1034"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="检测失败">
<Rect left="347" top="1110" right="447" bottom="1142"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="40" name="DEP492" type="8" flags="1"/>
</Activity>
<Activity id="98" ActivityType="3" flags="0" name="检测失败">
<Rect left="349" top="1265" right="449" bottom="1297"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="41" name="DEP493" type="8" flags="1"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="检测失败">
<Rect left="354" top="1413" right="454" bottom="1445"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="42" name="DEP494" type="8" flags="1"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="检测失败">
<Rect left="355" top="1575" right="455" bottom="1607"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="43" name="DEP495" type="8" flags="1"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="检测失败">
<Rect left="356" top="1717" right="456" bottom="1749"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="44" name="DEP496" type="8" flags="1"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="检测失败">
<Rect left="357" top="2020" right="457" bottom="2052"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="46" name="DEP497" type="8" flags="1"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="检测失败">
<Rect left="358" top="2166" right="458" bottom="2198"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="47" name="DEP499" type="8" flags="1"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="检测失败">
<Rect left="357" top="2268" right="457" bottom="2300"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="检测失败">
<Rect left="354" top="2488" right="454" bottom="2520"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="检测失败">
<Rect left="359" top="2637" right="459" bottom="2669"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="切诊断">
<Rect left="142" top="201" right="242" bottom="233"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x10 0x03

if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2903" name="DEP1080" type="8" flags="97"/>
</Activity>
<Activity id="108" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="140" top="354" right="240" bottom="386"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5

if(@0 == 0x67)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2932" name="DEP77" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="发送key">
<Rect left="138" top="458" right="238" bottom="490"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3

if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2933" name="DEP78" type="8" flags="97"/>
</Activity>
<Activity id="111" ActivityType="13" flags="0" name="计算">
<Rect left="139" top="405" right="239" bottom="437"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x6C799B6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="后中雷达">
<Rect left="474" top="1813" right="574" bottom="1845"/>
<Line1Text Enable="1" Text="请站于后右中雷达前约50cm处"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="后中右传感器">
<Rect left="473" top="1858" right="573" bottom="1890"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="障碍物距后右中雷达的距离为"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0B
if(@0==0x62)then
if ((@3&gt;20) and (@3&lt;50)) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatLower=20;
engine.StatUpper=50;

engine.SetLineText(3,@3);--显示距离结果

else
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="23" name="DEP497" type="8" flags="97"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="清空显示">
<Rect left="474" top="1912" right="574" bottom="1944"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="检测失败">
<Rect left="356" top="1857" right="456" bottom="1889"/>
<Script>engine.TestResult = 1;
--engine.LastError = 1;</Script><assessment no="45" name="DEP497" type="8" flags="1"/>
</Activity>
<Activity id="118" ActivityType="4" flags="0" name="路由节点">
<Rect left="497" top="434" right="529" bottom="466"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="比对零件号">
<Rect left="370" top="54" right="470" bottom="86"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="6"/>
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
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
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
end</Script><assessment no="1" name="DEP332" type="8" flags="105"/>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="407" right="439" bottom="32"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="读硬件号">
<Rect left="503" top="53" right="603" bottom="85"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读硬件号"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@16);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="2" name="DEP333" type="8" flags="105"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="延时300MS">
<Rect left="503" top="110" right="603" bottom="142"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="537" top="1" right="569" bottom="33"/>
</Activity>
<Activity id="127" ActivityType="4" flags="0" name="路由节点">
<Rect left="817" top="1" right="849" bottom="33"/>
</Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="682" top="1" right="714" bottom="33"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="649" top="55" right="749" bottom="87"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@16);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP334" type="8" flags="105"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="延时300MS">
<Rect left="648" top="105" right="748" bottom="137"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="132" ActivityType="4" flags="0" name="路由节点">
<Rect left="948" top="2" right="980" bottom="34"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="915" top="52" right="1015" bottom="84"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="SW-C131-ECU-V7";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("SW-C131-ECU-V7" == DString1)then
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
</Script><assessment no="5" name="DEP336" type="8" flags="105"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="读软件号">
<Rect left="782" top="51" right="882" bottom="83"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@16);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP335" type="8" flags="105"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="延时300MS">
<Rect left="782" top="103" right="882" bottom="135"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="延时300MS">
<Rect left="914" top="103" right="1014" bottom="135"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="150" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1430" top="54" right="1530" bottom="86"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP337" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1430" top="104" right="1530" bottom="136"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
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
end</Script><assessment no="7" name="DEP338" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="日期读取">
<Rect left="1550" top="104" right="1650" bottom="136"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
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
<Activity id="154" ActivityType="3" flags="0" name="发送时间">
<Rect left="1550" top="54" right="1650" bottom="86"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
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
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="1464" top="4" right="1496" bottom="36"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1870" top="434" right="1970" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1660" top="104" right="1760" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="161" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1780" top="54" right="1880" bottom="86"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读配置码"/>
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
end</Script><assessment no="11" name="DEP340" type="8" flags="97"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="写配置码">
<Rect left="1670" top="54" right="1770" bottom="86"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP339" type="8" flags="97"/>
</Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="1704" top="4" right="1736" bottom="36"/>
</Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1584" top="4" right="1616" bottom="36"/>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="1814" top="4" right="1846" bottom="36"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="通讯">
<Rect left="140" top="157" right="240" bottom="189"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="3"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2900" name="DEP74" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="通讯失败">
<Rect left="258" top="152" right="358" bottom="184"/>
<Line1Text Enable="1" Text="PDC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="289" top="2811" right="321" bottom="2843"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="结束通讯">
<Rect left="255" top="108" right="355" bottom="140"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="171" ActivityType="3" flags="0" name="清DTC">
<Rect left="1670" top="144" right="1770" bottom="176"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="PDC 清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
</Script><assessment no="30" name="DEP1147" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="4" flags="0" name="路由节点">
<Rect left="1904" top="4" right="1936" bottom="36"/>
</Activity>
<Activity id="173" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="2560" right="646" bottom="2592"/>
</Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="608" top="553" right="640" bottom="585"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="610" top="791" right="642" bottom="823"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="混动车型">
<Rect left="1029" top="54" right="1129" bottom="86"/>
<Script></Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1029" top="108" right="1129" bottom="140"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="SW-C131-ECU-V9";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("SW-C131-ECU-V7" == DString1)then
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
</Script><assessment no="5" name="DEP336" type="8" flags="105"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1031" top="158" right="1131" bottom="190"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="1198" top="206" right="1230" bottom="238"/>
</Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="3" right="1096" bottom="35"/>
</Activity>
<Activity id="181" ActivityType="4" flags="0" name="路由节点">
<Rect left="172" top="515" right="204" bottom="547"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="初始安全访问次数">
<Rect left="141" top="305" right="241" bottom="337"/>
<Script>SATimes=0;
engine.println("初始化安全访问次数："..SATimes);</Script></Activity>
<Activity id="184" ActivityType="3" flags="0" name="累积安全访问次数">
<Rect left="20" top="458" right="120" bottom="490"/>
<Script>SATimes = SATimes + 1;
engine.println("安全访问次数："..SATimes);</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="改脸">
<Rect left="1161" top="55" right="1261" bottom="87"/>
<Script></Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1161" top="109" right="1261" bottom="141"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="SW-C131-ECU-V9";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="SW-C131-ECU-V9";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="SW-C131-ECU-V9";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="SW-C131-ECU-V9";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="SW-C131-ECU-V9";
	else
		StandValue="SW-C131-ECU-V9";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("SW-C131-ECU-V7" == DString1)then
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
</Script><assessment no="5" name="DEP336" type="8" flags="105"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1163" top="159" right="1263" bottom="191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="1197" top="3" right="1229" bottom="35"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="延时1000MS">
<Rect left="333" top="604" right="433" bottom="636"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="190" ActivityType="3" flags="0" name="19年型">
<Rect left="1290" top="54" right="1390" bottom="86"/>
<Script></Script></Activity>
<Activity id="191" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1290" top="104" right="1390" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="SW-C131-ECU-V9"
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
end</Script><assessment no="5" name="DEP336" type="8" flags="105"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1290" top="154" right="1390" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="193" ActivityType="4" flags="0" name="路由节点">
<Rect left="1324" top="4" right="1356" bottom="36"/>
</Activity>
<Activity id="194" ActivityType="3" flags="1" name="延时300MS">
<Rect left="370" top="114" right="470" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="延时300MS">
<Rect left="140" top="584" right="240" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="91" type="0">
</Transition>
<Transition StartId="3" EndId="183" type="0">
</Transition>
<Transition StartId="6" EndId="13" type="6">
</Transition>
<Transition StartId="6" EndId="96" type="0">
</Transition>
<Transition StartId="13" EndId="97" type="0">
</Transition>
<Transition StartId="13" EndId="17" type="6">
</Transition>
<Transition StartId="17" EndId="37" type="3">
</Transition>
<Transition StartId="17" EndId="97" type="4">
</Transition>
<Transition StartId="18" EndId="92" type="0">
</Transition>
<Transition StartId="21" EndId="189" type="0">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="1">
<Expression>C131_PDC_Function_Activation_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="175" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="6" type="1">
<Expression>C131_PDC_Read_Sensor_Data_Execute_Flag == true</Expression></Transition>
<Transition StartId="32" EndId="74" type="0">
</Transition>
<Transition StartId="37" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="6">
</Transition>
<Transition StartId="39" EndId="98" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="3">
</Transition>
<Transition StartId="40" EndId="98" type="4">
</Transition>
<Transition StartId="41" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="99" type="0">
</Transition>
<Transition StartId="43" EndId="45" type="6">
</Transition>
<Transition StartId="45" EndId="46" type="3">
</Transition>
<Transition StartId="45" EndId="99" type="4">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="100" type="0">
</Transition>
<Transition StartId="47" EndId="50" type="6">
</Transition>
<Transition StartId="50" EndId="51" type="3">
</Transition>
<Transition StartId="50" EndId="100" type="4">
</Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="101" type="0">
</Transition>
<Transition StartId="52" EndId="54" type="6">
</Transition>
<Transition StartId="54" EndId="56" type="3">
</Transition>
<Transition StartId="54" EndId="101" type="4">
</Transition>
<Transition StartId="56" EndId="112" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="6">
</Transition>
<Transition StartId="62" EndId="102" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="3">
</Transition>
<Transition StartId="64" EndId="102" type="4">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="103" type="0">
</Transition>
<Transition StartId="66" EndId="69" type="6">
</Transition>
<Transition StartId="69" EndId="70" type="3">
</Transition>
<Transition StartId="69" EndId="103" type="4">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="6">
</Transition>
<Transition StartId="71" EndId="104" type="0">
</Transition>
<Transition StartId="72" EndId="76" type="0">
</Transition>
<Transition StartId="74" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="78" type="1">
<Expression>C131_PDC_Read_Switch_Data_Execute_Flag == true</Expression></Transition>
<Transition StartId="76" EndId="173" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="83" type="3">
</Transition>
<Transition StartId="79" EndId="105" type="4">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="89" type="3">
</Transition>
<Transition StartId="86" EndId="106" type="4">
</Transition>
<Transition StartId="89" EndId="90" type="0">
</Transition>
<Transition StartId="90" EndId="1" type="0">
</Transition>
<Transition StartId="91" EndId="167" type="0">
</Transition>
<Transition StartId="92" EndId="21" type="0">
</Transition>
<Transition StartId="96" EndId="13" type="0">
</Transition>
<Transition StartId="97" EndId="37" type="0">
</Transition>
<Transition StartId="98" EndId="41" type="0">
</Transition>
<Transition StartId="99" EndId="46" type="0">
</Transition>
<Transition StartId="100" EndId="51" type="0">
</Transition>
<Transition StartId="101" EndId="56" type="0">
</Transition>
<Transition StartId="102" EndId="65" type="0">
</Transition>
<Transition StartId="103" EndId="70" type="0">
</Transition>
<Transition StartId="104" EndId="72" type="0">
</Transition>
<Transition StartId="105" EndId="83" type="0">
</Transition>
<Transition StartId="106" EndId="89" type="0">
</Transition>
<Transition StartId="107" EndId="3" type="0">
</Transition>
<Transition StartId="108" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="181" type="3">
</Transition>
<Transition StartId="110" EndId="184" type="4">
</Transition>
<Transition StartId="111" EndId="110" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="0">
</Transition>
<Transition StartId="112" EndId="116" type="0">
</Transition>
<Transition StartId="112" EndId="114" type="6">
</Transition>
<Transition StartId="114" EndId="115" type="3">
</Transition>
<Transition StartId="114" EndId="116" type="4">
</Transition>
<Transition StartId="115" EndId="62" type="0">
</Transition>
<Transition StartId="116" EndId="115" type="0">
</Transition>
<Transition StartId="118" EndId="18" type="1">
<Expression>C131_PDC_System_Self_Checking_Execute_Flag == true</Expression></Transition>
<Transition StartId="118" EndId="174" type="0">
</Transition>
<Transition StartId="121" EndId="194" type="0">
</Transition>
<Transition StartId="122" EndId="126" type="0">
</Transition>
<Transition StartId="122" EndId="121" type="1">
<Expression>C131_PDC_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="123" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="128" type="0">
</Transition>
<Transition StartId="126" EndId="123" type="1">
<Expression>C131_PDC_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="126" EndId="128" type="0">
</Transition>
<Transition StartId="127" EndId="138" type="1">
<Expression>C131_PDC_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="127" EndId="132" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="1">
<Expression>C131_PDC_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="128" EndId="127" type="0">
</Transition>
<Transition StartId="129" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="127" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="1">
<Expression>C131_PDC_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="132" EndId="180" type="0">
</Transition>
<Transition StartId="133" EndId="142" type="0">
</Transition>
<Transition StartId="138" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="132" type="0">
</Transition>
<Transition StartId="142" EndId="179" type="0">
</Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="165" type="0">
</Transition>
<Transition StartId="152" EndId="164" type="0">
</Transition>
<Transition StartId="154" EndId="152" type="0">
</Transition>
<Transition StartId="155" EndId="150" type="1">
<Expression>C131_PDC_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="155" EndId="165" type="0">
</Transition>
<Transition StartId="159" EndId="118" type="0">
</Transition>
<Transition StartId="160" EndId="171" type="0">
</Transition>
<Transition StartId="161" EndId="172" type="0">
</Transition>
<Transition StartId="163" EndId="160" type="0">
</Transition>
<Transition StartId="164" EndId="163" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PDC_WD_Execute_Flag == true) and VMTLOC ~= "FIN"</Expression></Transition>
<Transition StartId="164" EndId="166" type="0">
</Transition>
<Transition StartId="165" EndId="154" type="1">
<Expression>C131_PDC_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="165" EndId="164" type="0">
</Transition>
<Transition StartId="166" EndId="161" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PDC_WD_Execute_Flag == true  or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="166" EndId="172" type="0">
</Transition>
<Transition StartId="167" EndId="107" type="3">
</Transition>
<Transition StartId="167" EndId="168" type="4">
</Transition>
<Transition StartId="168" EndId="169" type="5">
</Transition>
<Transition StartId="168" EndId="170" type="0">
</Transition>
<Transition StartId="169" EndId="90" type="0">
</Transition>
<Transition StartId="170" EndId="91" type="0">
</Transition>
<Transition StartId="171" EndId="166" type="0">
</Transition>
<Transition StartId="172" EndId="159" type="0">
</Transition>
<Transition StartId="173" EndId="90" type="0">
</Transition>
<Transition StartId="174" EndId="24" type="0">
</Transition>
<Transition StartId="175" EndId="32" type="0">
</Transition>
<Transition StartId="176" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="179" type="0">
</Transition>
<Transition StartId="179" EndId="155" type="0">
</Transition>
<Transition StartId="180" EndId="188" type="0">
</Transition>
<Transition StartId="180" EndId="176" type="1">
<Expression>C131_PDC_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="181" EndId="195" type="0">
</Transition>
<Transition StartId="183" EndId="108" type="0">
</Transition>
<Transition StartId="184" EndId="108" type="0">
</Transition>
<Transition StartId="184" EndId="181" type="1">
<Expression>SATimes &gt;= 3</Expression></Transition>
<Transition StartId="185" EndId="186" type="0">
</Transition>
<Transition StartId="186" EndId="187" type="0">
</Transition>
<Transition StartId="187" EndId="179" type="0">
</Transition>
<Transition StartId="188" EndId="185" type="1">
<Expression>C131_PDC_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="188" EndId="193" type="0">
</Transition>
<Transition StartId="189" EndId="22" type="0">
</Transition>
<Transition StartId="190" EndId="191" type="0">
</Transition>
<Transition StartId="191" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="179" type="0">
</Transition>
<Transition StartId="193" EndId="155" type="0">
</Transition>
<Transition StartId="193" EndId="190" type="1">
<Expression>C131_PDC_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="194" EndId="126" type="0">
</Transition>
<Transition StartId="195" EndId="122" type="0">
</Transition>
</Transitions>
</Process>

