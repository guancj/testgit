<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3027" pbltext="DEP41">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x750" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x758" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="143" top="1" right="243" bottom="33"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="700" top="2124" right="800" bottom="2156"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="车身控制器1 (BCM1)">
<Rect left="144" top="59" right="244" bottom="91"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="4" right="766" bottom="36"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="普通节点">
<Rect left="700" top="74" right="800" bottom="106"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="雨刷关闭"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="BCM1 雨刷关">
<Rect left="700" top="124" right="800" bottom="156"/>
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
<Rect left="700" top="174" right="800" bottom="206"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line2Text Enable="1" Text="雨刷拨到INT档"/>
<Script>#COMM 0x22 0x01 0x1E
engine.SetLineText(3,@3);
if (@3==0x01) then
	engine.LastError = 0;
else
	engine.LastError = 1;
	engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP706" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="BCM1 雨刷低速">
<Rect left="700" top="224" right="800" bottom="256"/>
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
<Rect left="700" top="264" right="800" bottom="296"/>
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
<Rect left="700" top="314" right="800" bottom="346"/>
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
<Rect left="700" top="364" right="800" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="4" flags="0" name="路由节点">
<Rect left="1114" top="4" right="1146" bottom="36"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="室内照明灯手动确认">
<Rect left="1080" top="74" right="1180" bottom="106"/>
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
<Rect left="1080" top="114" right="1180" bottom="146"/>
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
<Rect left="1080" top="164" right="1180" bottom="196"/>
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
<Rect left="1080" top="204" right="1180" bottom="236"/>
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
<Rect left="1080" top="254" right="1180" bottom="286"/>
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
<Rect left="1080" top="314" right="1180" bottom="346"/>
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
<Rect left="1080" top="364" right="1180" bottom="396"/>
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
<Rect left="1080" top="414" right="1180" bottom="446"/>
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
<Rect left="1080" top="464" right="1180" bottom="496"/>
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
<Activity id="79" ActivityType="3" flags="0" name="危险报警灯开关">
<Rect left="700" top="414" right="800" bottom="446"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请打开危险报警灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
#COMM 0x22 0x01 0x27
engine.SetLineText(2,"读取报警灯按下状态："..@3);
if(@0 == 0x62)then
	if(@3 == 0x01)then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;		
        end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="43" name="DEP710" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="关闭危险报警灯">
<Rect left="700" top="574" right="800" bottom="606"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取危险报警灯关闭状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
#COMM 0x22 0x01 0x27
engine.SetLineText(2,"读取报警灯按下状态："..@3);
if(@0 == 0x62)then
	if(@3 == 0x00)then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;		
        end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="44" name="DEP711" type="8" flags="97"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="发送前排室内灯打开指令">
<Rect left="700" top="684" right="800" bottom="716"/>
<Line1Text Enable="1" Text="确认四门关闭"/>
<Line2Text Enable="1" Text="请打开前排室内灯DOOR开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="前排室内灯亮手动确认">
<Rect left="700" top="804" right="800" bottom="836"/>
<Line1Text Enable="1" Text="前排室内灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue = "人工操作点击确定";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue = "人工操作点击放弃";
else
end
</Script><assessment no="45" name="DEP712" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="发送阅读灯打开指令">
<Rect left="700" top="894" right="800" bottom="926"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>#COMM 0x31 0x01 0xC0 0x04
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="手动确认">
<Rect left="700" top="944" right="800" bottom="976"/>
<Line1Text Enable="1" Text="阅读灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue = "人工操作点击确定";
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
     engine.StatValue = "人工操作点击放弃";
else
end
</Script><assessment no="46" name="DEP713" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="BCM1 引擎盖开">
<Rect left="550" top="1264" right="650" bottom="1296"/>
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
<Rect left="550" top="1324" right="650" bottom="1356"/>
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
<Activity id="103" ActivityType="3" flags="0" name="走到车前">
<Rect left="700" top="1364" right="800" bottom="1396"/>
<Line1Text Enable="1" Text="请走到车的前面"/>
<Line2Text Enable="1" Text="准备检查大灯状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "Blue";
#PRESSBUTTON</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="发送打开大灯指令">
<Rect left="700" top="1414" right="800" bottom="1446"/>
<Script>#COMM 0x31 0x01 0xC0 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="70" name="DEP1233" type="8" flags="97"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="手动确认">
<Rect left="700" top="1464" right="800" bottom="1496"/>
<Line1Text Enable="1" Text="大灯亮了吗?"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
<Activity id="108" ActivityType="3" flags="0" name="手动确认">
<Rect left="700" top="1524" right="800" bottom="1556"/>
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
<Activity id="109" ActivityType="3" flags="0" name="发送雾灯打开指令">
<Rect left="700" top="1574" right="800" bottom="1606"/>
<Script>#COMM 0x31 0x01 0xC0 0x02

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="71" name="DEP1234" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="1" name="手动确认">
<Rect left="700" top="1624" right="800" bottom="1656"/>
<Line1Text Enable="1" Text="前雾灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
</Script><assessment no="177" name="DEP2368" type="8" flags="97"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="手动确认">
<Rect left="470" top="1654" right="570" bottom="1686"/>
<Line1Text Enable="1" Text="请注意观察前雨刷"/>
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
<Activity id="116" ActivityType="3" flags="0" name="发送前雨刷工作指令">
<Rect left="470" top="1724" right="570" bottom="1756"/>
<Script>#COMM 0x31 0x01 0xC0 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="72" name="DEP1235" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="手动确认">
<Rect left="470" top="1794" right="570" bottom="1826"/>
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
<Rect left="700" top="2064" right="800" bottom="2096"/>
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
<Rect left="140" top="214" right="240" bottom="246"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1729" name="DEP1087" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="140" top="264" right="240" bottom="296"/>
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
<Rect left="140" top="364" right="240" bottom="396"/>
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
<Rect left="140" top="314" right="240" bottom="346"/>
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
<Activity id="196" ActivityType="4" flags="0" name="路由节点">
<Rect left="1264" top="274" right="1296" bottom="306"/>
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
<Rect left="54" top="2064" right="86" bottom="2096"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="结束通讯">
<Rect left="24" top="115" right="124" bottom="147"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="清屏幕颜色">
<Rect left="700" top="2014" right="800" bottom="2046"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="252" ActivityType="3" flags="0" name="后雨刷打开">
<Rect left="470" top="1904" right="570" bottom="1936"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="请打开后雨刷"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x3D
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x01) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="54" name="DEP2399" type="8" flags="97"/>
</Activity>
<Activity id="253" ActivityType="3" flags="0" name="后洗涤器按钮打开">
<Rect left="470" top="1964" right="570" bottom="1996"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1" Text="请按下后洗涤器按钮"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x3C
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x01) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="55" name="DEP2400" type="8" flags="97"/>
</Activity>
<Activity id="254" ActivityType="3" flags="0" name="后雨刷按钮和后洗涤器按钮检查">
<Rect left="470" top="1854" right="570" bottom="1886"/>
<Script></Script></Activity>
<Activity id="255" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="1564" right="536" bottom="1596"/>
</Activity>
<Activity id="256" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="700" top="464" right="800" bottom="496"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯打开吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="700" top="624" right="800" bottom="656"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="#L=仪表盘报警灯灭了吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="喇叭按下">
<Rect left="1230" top="464" right="1330" bottom="496"/>
<Strategy TotalTime="600" NokTime="600" RetryTimeOut="180" DelayTime="300"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请按下喇叭"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
#COMM 0x22 0x01 0x2C
engine.SetLineText(2,"读取喇叭按下状态："..@3);
if(@0 == 0x62)then
	if(@3 == 0x01)then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;		
        end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="53" name="DEP2398" type="8" flags="97"/>
</Activity>
<Activity id="260" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="1230" top="514" right="1330" bottom="546"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="#L=喇叭响了吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="自动检查-日间行车灯">
<Rect left="700" top="1744" right="800" bottom="1776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送日间行车灯关闭指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x14 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="56" name="DEP2402" type="8" flags="97"/>
</Activity>
<Activity id="263" ActivityType="3" flags="0" name="读取日间行车灯状态">
<Rect left="700" top="1804" right="800" bottom="1836"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="10" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取日间行车灯关闭状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x37
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="57" name="DEP2403" type="8" flags="97"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="自动检查-日间行车灯">
<Rect left="700" top="1854" right="800" bottom="1886"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送日间行车灯打开指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x14 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="58" name="DEP2401" type="8" flags="97"/>
</Activity>
<Activity id="265" ActivityType="3" flags="0" name="读取日间行车灯状态">
<Rect left="700" top="1904" right="800" bottom="1936"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="10" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取日间行车灯打开状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x37
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x01) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="59" name="DEP2403" type="8" flags="97"/>
</Activity>
<Activity id="266" ActivityType="3" flags="0" name="返回控制权">
<Rect left="700" top="1954" right="800" bottom="1986"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x14 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="80" name="DEP2404" type="8" flags="97"/>
</Activity>
<Activity id="267" ActivityType="3" flags="0" name="日间行车灯">
<Rect left="700" top="1674" right="800" bottom="1706"/>
<Script></Script></Activity>
<Activity id="268" ActivityType="3" flags="0" name="自动检查-氛围灯">
<Rect left="700" top="1104" right="800" bottom="1136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送氛围灯打开指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x17 0x03 0x04
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="81" name="DEP2405" type="8" flags="97"/>
</Activity>
<Activity id="269" ActivityType="3" flags="0" name="读取氛围灯状态">
<Rect left="700" top="1154" right="800" bottom="1186"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="10" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取氛围灯打开状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x3E
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x04) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="82" name="DEP2407" type="8" flags="97"/>
</Activity>
<Activity id="270" ActivityType="3" flags="0" name="自动检查-氛围灯">
<Rect left="700" top="1204" right="800" bottom="1236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送氛围灯关闭指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x17 0x03 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="83" name="DEP2406" type="8" flags="97"/>
</Activity>
<Activity id="271" ActivityType="3" flags="0" name="读取氛围灯状态">
<Rect left="700" top="1254" right="800" bottom="1286"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="10" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取氛围灯关闭状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x3E
engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if (@3 == 0x00) then
		engine.LastError = 0;
		engine.TestResult = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="84" name="DEP2407" type="8" flags="97"/>
</Activity>
<Activity id="272" ActivityType="3" flags="0" name="返回控制权">
<Rect left="700" top="1304" right="800" bottom="1336"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x02 0x17 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="85" name="DEP2404" type="8" flags="97"/>
</Activity>
<Activity id="273" ActivityType="3" flags="0" name="氛围灯">
<Rect left="700" top="1054" right="800" bottom="1086"/>
<Script></Script></Activity>
<Activity id="276" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="44" right="646" bottom="76"/>
</Activity>
<Activity id="281" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1194" right="616" bottom="1226"/>
</Activity>
<Activity id="285" ActivityType="3" flags="0" name="发送前排室内灯打开指令">
<Rect left="700" top="744" right="800" bottom="776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请注意观察室内灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
#COMM 0x31 0x01 0xC0 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="287" ActivityType="3" flags="0" name="观察后排阅读灯">
<Rect left="700" top="854" right="800" bottom="886"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请注意观察后排左右阅读灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="288" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="700" top="514" right="800" bottom="546"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请关闭危险报警灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script></Activity>
<Activity id="289" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="1144" right="946" bottom="1176"/>
</Activity>
<Activity id="290" ActivityType="3" flags="0" name="延迟1秒">
<Rect left="880" top="1604" right="980" bottom="1636"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="延时1s">
<Rect left="700" top="1004" right="800" bottom="1036"/>
<Script>engine.Delay(1000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="122" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="0">
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
<Transition StartId="48" EndId="79" type="0">
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
<Transition StartId="70" EndId="259" type="0">
</Transition>
<Transition StartId="79" EndId="256" type="0">
</Transition>
<Transition StartId="80" EndId="258" type="0">
</Transition>
<Transition StartId="88" EndId="285" type="0">
</Transition>
<Transition StartId="89" EndId="287" type="0">
</Transition>
<Transition StartId="92" EndId="93" type="0">
</Transition>
<Transition StartId="93" EndId="291" type="0">
</Transition>
<Transition StartId="93" EndId="289" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType)</Expression></Transition>
<Transition StartId="97" EndId="99" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="105" type="0">
</Transition>
<Transition StartId="105" EndId="108" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="0">
</Transition>
<Transition StartId="109" EndId="290" type="0">
</Transition>
<Transition StartId="110" EndId="267" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="254" type="0">
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
<Transition StartId="126" EndId="48" type="0">
</Transition>
<Transition StartId="127" EndId="126" type="0">
</Transition>
<Transition StartId="196" EndId="259" type="0">
</Transition>
<Transition StartId="207" EndId="208" type="4">
</Transition>
<Transition StartId="207" EndId="123" type="0">
</Transition>
<Transition StartId="208" EndId="210" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="5">
</Transition>
<Transition StartId="209" EndId="119" type="0">
</Transition>
<Transition StartId="210" EndId="122" type="0">
</Transition>
<Transition StartId="236" EndId="119" type="0">
</Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="253" EndId="267" type="0">
</Transition>
<Transition StartId="254" EndId="252" type="0">
</Transition>
<Transition StartId="255" EndId="115" type="1">
<Expression>C131_BCM1_Wipers_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="256" EndId="288" type="0">
</Transition>
<Transition StartId="258" EndId="88" type="0">
</Transition>
<Transition StartId="259" EndId="260" type="0">
</Transition>
<Transition StartId="262" EndId="263" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="265" type="0">
</Transition>
<Transition StartId="265" EndId="266" type="0">
</Transition>
<Transition StartId="266" EndId="236" type="0">
</Transition>
<Transition StartId="267" EndId="262" type="0">
</Transition>
<Transition StartId="268" EndId="269" type="0">
</Transition>
<Transition StartId="269" EndId="270" type="0">
</Transition>
<Transition StartId="270" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="272" EndId="103" type="0">
</Transition>
<Transition StartId="273" EndId="268" type="0">
</Transition>
<Transition StartId="276" EndId="42" type="1">
<Expression> C131_BCM1_Wiper_Washer_Execute_Flag == true</Expression></Transition>
<Transition StartId="281" EndId="97" type="1">
<Expression>C131_BCM1_Engine_Lid_Execute_Flag == true</Expression></Transition>
<Transition StartId="285" EndId="89" type="0">
</Transition>
<Transition StartId="287" EndId="92" type="0">
</Transition>
<Transition StartId="288" EndId="80" type="0">
</Transition>
<Transition StartId="289" EndId="103" type="0">
</Transition>
<Transition StartId="290" EndId="110" type="0">
</Transition>
<Transition StartId="291" EndId="273" type="0">
</Transition>
</Transitions>
</Process>

