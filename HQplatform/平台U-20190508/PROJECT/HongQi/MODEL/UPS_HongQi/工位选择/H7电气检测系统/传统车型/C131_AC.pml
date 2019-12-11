<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1111" pbltext="DEP26">
<Parameters>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_AC_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_Funtion_Line_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_AC_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AC_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_Auto_Swing_AC" type="8" dir="0" data="DString_C131_Auto_Swing_AC"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x762" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x782" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="3" top="76" right="103" bottom="108"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="594" top="1978" right="694" bottom="2010"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="空调(AC)">
<Rect left="2" top="137" right="102" bottom="169"/>
<TitleText Enable="1" Text="空调(AC)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="4" top="350" right="104" bottom="382"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="1" name="DEP28" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="AC摇摆电机检查">
<Rect left="592" top="658" right="692" bottom="690"/>
<Line1Text Enable="1" Text="AC摇摆电机检查"/>
<Line2Text Enable="1" Text="开"/>
<Script>#COMM 0x2f 0x20 0x07 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP396" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="倒计时">
<Rect left="591" top="708" right="691" bottom="740"/>
<Line1Text Enable="1" Text="等待35秒"/>
<Line2Text Enable="1"/>
<Script>delay_time=35;
text_line=3;
time_interval=1000;
for i=delay_time,1,-1 do
engine.SetLineText(text_line,"请等待"..i.."s");
#DELAY time_interval
end
</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="自动测试">
<Rect left="590" top="757" right="690" bottom="789"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="AC 摆风机构正在动作"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="摆风结构结束指令">
<Rect left="588" top="854" right="688" bottom="886"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2f 0x20 0x07 0x03 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP397" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="手动确认">
<Rect left="590" top="951" right="690" bottom="983"/>
<Strategy NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="是否完成了2次往复动作?"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
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
end</Script><assessment no="22" name="DEP398" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="发送">
<Rect left="589" top="995" right="689" bottom="1027"/>
<Script>#COMM 0x2f 0x20 0x07 0x00
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="手动确认AUTO开关">
<Rect left="589" top="1097" right="689" bottom="1129"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="按空调 &quot;AUTO&quot; 按钮"/>
<Line2Text Enable="1" Text="#L=AUTO按钮LED灯亮？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
engine.TestResult = 1;
else
end</Script><assessment no="23" name="DEP399" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="4" flags="0" name="路由节点">
<Rect left="623" top="1046" right="655" bottom="1078"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="手动确认AUTO开关">
<Rect left="589" top="1141" right="689" bottom="1173"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="DVD显示 &quot;AUTO&quot; 开启"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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

</Script><assessment no="24" name="DEP400" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="手动确认AUTO开关">
<Rect left="588" top="1189" right="688" bottom="1221"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="后中控板 &quot;AUTO&quot; 灯亮"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
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

</Script><assessment no="25" name="DEP401" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="手动确认AUTO开关">
<Rect left="588" top="1236" right="688" bottom="1268"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="前后中控面板"/>
<Line2Text Enable="1" Text="#L=&quot;温度显示&quot;开启了吗？#R=BMPEYE"/>
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

</Script><assessment no="26" name="DEP402" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="手动调节">
<Rect left="588" top="1281" right="688" bottom="1313"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="用 &quot;前&quot; 旋钮调风量大小"/>
<Line2Text Enable="1" Text="#L=DVD风量档位变化吗？#R=BMPEYE"/>
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

</Script><assessment no="27" name="DEP403" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="手动调节">
<Rect left="588" top="1326" right="688" bottom="1358"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="用 &quot;后&quot; 旋钮调风量大小"/>
<Line2Text Enable="1" Text="#L=DVD风量档位变化吗？#R=BMPEYE"/>
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

</Script><assessment no="28" name="DEP404" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="手动DVD">
<Rect left="588" top="1372" right="688" bottom="1404"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="触摸DVD风量档位"/>
<Line2Text Enable="1" Text="#L=风量大小可被调节吗？#R=BMPEYE"/>
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

</Script><assessment no="29" name="DEP405" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="手动左温度调节">
<Rect left="589" top="1418" right="689" bottom="1450"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="按左侧 &quot;TEMP&quot; 上/下"/>
<Line2Text Enable="1" Text="#L=温度上升和下降吗？#R=BMPEYE"/>
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

</Script><assessment no="30" name="DEP406" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="手动右温度调节">
<Rect left="590" top="1467" right="690" bottom="1499"/>
<Line1Text Enable="1" Text="按右侧 &quot;TEMP&quot; 上/下"/>
<Line2Text Enable="1" Text="#L=温度上升和下降吗？#R=BMPEYE"/>
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

</Script><assessment no="31" name="DEP407" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="SINGLE 模式检测">
<Rect left="590" top="1515" right="690" bottom="1547"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="触摸DVD上 &quot;single&quot; 标志"/>
<Line2Text Enable="1" Text="#L=左右“TEMP”显示一致吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="32" name="DEP408" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="开前除霜">
<Rect left="591" top="1561" right="691" bottom="1593"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="打开前风挡除霜"/>
<Line2Text Enable="1" Text="#L=DVD显示空调除霜了吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="33" name="DEP409" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="关前除霜">
<Rect left="592" top="1609" right="692" bottom="1641"/>
<Line1Text Enable="1" Text="关闭前风挡除霜"/>
<Line2Text Enable="1" Text="#L=DVD显示空调除霜关闭？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="34" name="DEP410" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="DVD屏出风模式">
<Rect left="592" top="1652" right="692" bottom="1684"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请选择DVD屏出风模式"/>
<Line2Text Enable="1" Text="#L=检查DVD屏风出风模式是否有变化#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="35" name="DEP411" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="DVDECO模式">
<Rect left="592" top="1699" right="692" bottom="1731"/>
<Line1Text Enable="1" Text="请触摸DVD屏ECO指示标志"/>
<Line2Text Enable="1" Text="#L=检查DVD屏上ECO模式是否开启#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="36" name="DEP412" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="前中控板">
<Rect left="593" top="1744" right="693" bottom="1776"/>
<Line1Text Enable="1" Text="请按前中控板 上R/F 按钮"/>
<Line2Text Enable="1" Text="#L=检查R/F前中控板上模式状态#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="37" name="DEP413" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="前中控板">
<Rect left="594" top="1789" right="694" bottom="1821"/>
<Line1Text Enable="1" Text="请按前中控板上ION按钮"/>
<Line2Text Enable="1" Text="#L=检查DVD屏上ION模式是否开启#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="38" name="DEP414" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="前中控板">
<Rect left="594" top="1834" right="694" bottom="1866"/>
<Line1Text Enable="1" Text="请按前中控板上SWING按钮"/>
<Line2Text Enable="1" Text="#L=检查中出风口是否摆动#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="39" name="DEP415" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="前中控板">
<Rect left="595" top="1881" right="695" bottom="1913"/>
<Line1Text Enable="1" Text="请按DVD屏或按前后中控板上OFF按钮"/>
<Line2Text Enable="1" Text="#L=检查所有空调状态指示都关闭#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end

</Script><assessment no="40" name="DEP416" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="清标题1-4">
<Rect left="595" top="1929" right="695" bottom="1961"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="723" top="1515" right="755" bottom="1547"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="请等待30">
<Rect left="589" top="806" right="689" bottom="838"/>
<Line1Text Enable="1" Text="等待30秒"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>delay_time=30;
text_line=3;
time_interval=1000;
for i=delay_time,1,-1 do
engine.SetLineText(text_line,"请等待"..i.."s");
#DELAY time_interval
end</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="关闭电机">
<Rect left="589" top="902" right="689" bottom="934"/>
<Script>#COMM 0x2f 0x20 0x07 0x03 0x00
</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="连接ECU">
<Rect left="3" top="202" right="103" bottom="234"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
engine.Delay(60)</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="切诊断">
<Rect left="3" top="305" right="103" bottom="337"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="1901" name="DEP1076" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="4" top="400" right="104" bottom="432"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP29" type="8" flags="97"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="发送key">
<Rect left="4" top="499" right="104" bottom="531"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(60)
#COMM 0x27 0x02 key0 key1 
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="3" name="DEP30" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="13" flags="0" name="计算">
<Rect left="4" top="449" right="104" bottom="481"/>
<FunctionRef id="sec_ac">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="623" top="612" right="655" bottom="644"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="比对零件号">
<Rect left="240" top="204" right="340" bottom="236"/>
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
	if (DString1==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
	else
		engine.LastError = 1;
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
end
engine.Delay(60)</Script><assessment no="4" name="DEP230" type="8" flags="105"/>
</Activity>
<Activity id="95" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="154" right="306" bottom="186"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="读硬件号">
<Rect left="350" top="204" right="450" bottom="236"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);
--engine.StatValue=DString1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="5" name="DEP231" type="8" flags="105"/>
</Activity>
<Activity id="98" ActivityType="3" flags="0" name="延时300MS">
<Rect left="350" top="254" right="450" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="154" right="416" bottom="186"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="154" right="706" bottom="186"/>
</Activity>
<Activity id="101" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="154" right="566" bottom="186"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="500" top="204" right="600" bottom="236"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
--engine.StatValue=DString1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="6" name="DEP219" type="8" flags="105"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="延时300MS">
<Rect left="500" top="264" right="600" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="105" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="154" right="836" bottom="186"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="770" top="204" right="870" bottom="236"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="0073";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
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
end

engine.Delay(60)</Script><assessment no="13" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="读软件号">
<Rect left="640" top="204" right="740" bottom="236"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="7" name="DEP220" type="8" flags="105"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="延时300MS">
<Rect left="640" top="264" right="740" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="延时300MS">
<Rect left="770" top="264" right="870" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1780" top="614" right="1880" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1410" top="214" right="1510" bottom="246"/>
<Line1Text Enable="1" Text="发送VIN"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>vin=DString_Write_VIN;
engine.println(vin)
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="17" name="DEP225" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="读VIN">
<Rect left="1410" top="274" right="1510" bottom="306"/>
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
end

engine.Delay(60)</Script><assessment no="14" name="DEP222" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="日期读取">
<Rect left="1530" top="274" right="1630" bottom="306"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="16" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="发送时间">
<Rect left="1530" top="214" right="1630" bottom="246"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="11" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="1444" top="154" right="1476" bottom="186"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1660" top="274" right="1760" bottom="306"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="149" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1780" top="204" right="1880" bottom="236"/>
<Line1Text Enable="1" Text="检查配置码"/>
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

engine.Delay(60)</Script><assessment no="19" name="DEP228" type="8" flags="105"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="写配置码">
<Rect left="1660" top="204" right="1760" bottom="236"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
--engine.println(DString_C131_VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="18" name="DEP226" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="154" right="1726" bottom="186"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="414" right="1096" bottom="446"/>
</Activity>
<Activity id="161" ActivityType="4" flags="0" name="路由节点">
<Rect left="1564" top="154" right="1596" bottom="186"/>
</Activity>
<Activity id="167" ActivityType="4" flags="0" name="路由节点">
<Rect left="1814" top="154" right="1846" bottom="186"/>
</Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="718" top="841" right="750" bottom="873"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="通讯">
<Rect left="2" top="253" right="102" bottom="285"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="1900" name="DEP27" type="8" flags="101"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="通讯失败">
<Rect left="116" top="254" right="216" bottom="286"/>
<Line1Text Enable="1" Text="AC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="172" ActivityType="4" flags="0" name="路由节点">
<Rect left="152" top="1930" right="184" bottom="1962"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="结束通讯">
<Rect left="117" top="201" right="217" bottom="233"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="1914" top="154" right="1946" bottom="186"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="264" right="990" bottom="296"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--StandValue="0112";
--StandValue="0111";

if(@0==0x62)then

	if(DString_C131_Car_Tpye=="CH1LM23")then
		StandValue="0111";
	elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="0111";
	else
		StandValue="0111";	
	end
        engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0110" == DString1)then
	--if("0111" == DString1)then
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
engine.Delay(60)</Script><assessment no="13" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="176" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="154" right="956" bottom="186"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="延时300MS">
<Rect left="890" top="314" right="990" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="178" ActivityType="3" flags="0" name="混动车型">
<Rect left="890" top="204" right="990" bottom="236"/>
<Script></Script></Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="154" right="1096" bottom="186"/>
</Activity>
<Activity id="180" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1030" top="264" right="1130" bottom="296"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="0100";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="0100";
	elseif((DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye == "CH1DM16" or DString_C131_Car_Tpye == "CH1DM17"))then
		StandValue="0100";	
	else
		StandValue="0081";	
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
end

engine.Delay(60)</Script><assessment no="13" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1030" top="324" right="1130" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="改脸">
<Rect left="1030" top="204" right="1130" bottom="236"/>
<Script></Script></Activity>
<Activity id="186" ActivityType="4" flags="0" name="路由节点">
<Rect left="491" top="1511" right="523" bottom="1543"/>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="492" top="1703" right="524" bottom="1735"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="19年型">
<Rect left="1170" top="204" right="1270" bottom="236"/>
<Script></Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1170" top="264" right="1270" bottom="296"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="0081";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.SetLineText(3,DString1);
        DString1 = engine.GetResponseString(3,2+#StandValue);
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
end</Script><assessment no="13" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1170" top="324" right="1270" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="1204" top="154" right="1236" bottom="186"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="19年型V6">
<Rect left="1280" top="204" right="1380" bottom="236"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1280" top="264" right="1380" bottom="296"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="0200";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.SetLineText(3,DString1);
        DString1 = engine.GetResponseString(3,2+#StandValue);
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
end</Script><assessment no="13" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1280" top="324" right="1380" bottom="356"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="154" right="1346" bottom="186"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="74" type="0">
</Transition>
<Transition StartId="4" EndId="76" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="58" type="0">
</Transition>
<Transition StartId="12" EndId="60" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="17" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="0">
</Transition>
<Transition StartId="17" EndId="16" type="1">
<Expression>C131_AC_Funtion_Line_Execute_Flag == true</Expression></Transition>
<Transition StartId="17" EndId="53" type="0">
</Transition>
<Transition StartId="19" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="187" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="2" type="0">
</Transition>
<Transition StartId="53" EndId="47" type="0">
</Transition>
<Transition StartId="58" EndId="12" type="0">
</Transition>
<Transition StartId="60" EndId="14" type="0">
</Transition>
<Transition StartId="74" EndId="170" type="0">
</Transition>
<Transition StartId="75" EndId="4" type="0">
</Transition>
<Transition StartId="76" EndId="80" type="0">
</Transition>
<Transition StartId="78" EndId="95" type="0">
</Transition>
<Transition StartId="80" EndId="78" type="0">
</Transition>
<Transition StartId="82" EndId="7" type="1">
<Expression>(VMTLOC=="TR1") and ( DString_C131_Auto_Swing_AC == "1") and (( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" ))</Expression></Transition>
<Transition StartId="82" EndId="169" type="0">
</Transition>
<Transition StartId="94" EndId="99" type="0">
</Transition>
<Transition StartId="95" EndId="94" type="1">
<Expression>C131_AC_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="95" EndId="99" type="0">
</Transition>
<Transition StartId="96" EndId="98" type="0">
</Transition>
<Transition StartId="98" EndId="101" type="0">
</Transition>
<Transition StartId="99" EndId="96" type="1">
<Expression>C131_AC_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="99" EndId="101" type="0">
</Transition>
<Transition StartId="100" EndId="111" type="1">
<Expression>C131_AC_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="100" EndId="105" type="0">
</Transition>
<Transition StartId="101" EndId="102" type="1">
<Expression>C131_AC_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="101" EndId="100" type="0">
</Transition>
<Transition StartId="102" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="100" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="1">
<Expression>C131_AC_SVP_Execute_Flag and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="105" EndId="176" type="0">
</Transition>
<Transition StartId="106" EndId="115" type="0">
</Transition>
<Transition StartId="111" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="105" type="0">
</Transition>
<Transition StartId="115" EndId="160" type="0">
</Transition>
<Transition StartId="136" EndId="82" type="0">
</Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="143" EndId="161" type="0">
</Transition>
<Transition StartId="144" EndId="152" type="0">
</Transition>
<Transition StartId="146" EndId="144" type="0">
</Transition>
<Transition StartId="147" EndId="142" type="1">
<Expression>C131_AC_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="147" EndId="161" type="0">
</Transition>
<Transition StartId="148" EndId="167" type="0">
</Transition>
<Transition StartId="149" EndId="174" type="0">
</Transition>
<Transition StartId="151" EndId="148" type="0">
</Transition>
<Transition StartId="152" EndId="151" type="1">
<Expression>((DString_C131_VariCoding ~= "" ) and (C131_AC_WD_Execute_Flag == true) and VMTLOC~="FIN"   )</Expression></Transition>
<Transition StartId="152" EndId="167" type="0">
</Transition>
<Transition StartId="160" EndId="147" type="0">
</Transition>
<Transition StartId="161" EndId="146" type="1">
<Expression>C131_AC_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="161" EndId="152" type="0">
</Transition>
<Transition StartId="167" EndId="149" type="1">
<Expression>((DString_C131_VariCoding ~= "" ) and (C131_AC_WD_Execute_Flag == true or VMTLOC=="FIN")) </Expression></Transition>
<Transition StartId="167" EndId="174" type="0">
</Transition>
<Transition StartId="169" EndId="17" type="0">
</Transition>
<Transition StartId="170" EndId="75" type="3">
</Transition>
<Transition StartId="170" EndId="171" type="4">
</Transition>
<Transition StartId="171" EndId="172" type="5">
</Transition>
<Transition StartId="171" EndId="173" type="0">
</Transition>
<Transition StartId="172" EndId="47" type="0">
</Transition>
<Transition StartId="173" EndId="74" type="0">
</Transition>
<Transition StartId="174" EndId="136" type="0">
</Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="176" EndId="179" type="0">
</Transition>
<Transition StartId="176" EndId="178" type="1">
<Expression>C131_AC_SVP_Execute_Flag and  LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="177" EndId="160" type="0">
</Transition>
<Transition StartId="178" EndId="175" type="0">
</Transition>
<Transition StartId="179" EndId="191" type="0">
</Transition>
<Transition StartId="179" EndId="185" type="1">
<Expression>C131_AC_SVP_Execute_Flag and  LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="180" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="160" type="0">
</Transition>
<Transition StartId="185" EndId="180" type="0">
</Transition>
<Transition StartId="187" EndId="42" type="0">
</Transition>
<Transition StartId="188" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="160" type="0">
</Transition>
<Transition StartId="191" EndId="188" type="1">
<Expression>C131_AC_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="191" EndId="245" type="0">
</Transition>
<Transition StartId="192" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="160" type="0">
</Transition>
<Transition StartId="245" EndId="192" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="245" EndId="147" type="0">
</Transition>
</Transitions>
</Process>

