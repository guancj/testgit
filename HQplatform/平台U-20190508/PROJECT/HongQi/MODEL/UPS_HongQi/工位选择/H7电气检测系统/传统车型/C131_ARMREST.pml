<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1130" pbltext="DEP649">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_ARMREST_Panel_Switch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_dif_config" type="8" dir="0" data="DString_C131_dif_config_ARMREST"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_ARMREST_RR_Backrest_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_RL_Backrest_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_RR_Massaging_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_RL_Masaging_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_ARMREST_HN_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x761" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x781" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="209" top="69" right="309" bottom="101"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="584" top="2521" right="684" bottom="2553"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="后中扶手(ARMREST)">
<Rect left="209" top="123" right="309" bottom="155"/>
<TitleText Enable="1" Text="后中扶手 (ARMREST)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="210" top="280" right="310" bottom="312"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2701" name="DEP1090" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="座椅调节">
<Rect left="590" top="612" right="690" bottom="644"/>
<Line1Text Enable="1" Text="两侧开关控制靠背向前，向后"/>
<Line2Text Enable="1" Text="座椅可以被调节吗？"/>
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
</Script><assessment no="12" name="DEP659" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="DVD开启">
<Rect left="589" top="658" right="689" bottom="690"/>
<Line1Text Enable="1" Text="按后中扶手上的MODE 开关"/>
<Line2Text Enable="1" Text="DVD开启了吗？"/>
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
</Script><assessment no="13" name="DEP660" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="空调开启">
<Rect left="588" top="705" right="688" bottom="737"/>
<Line1Text Enable="1" Text="按后中扶手上的AUTO开关"/>
<Line2Text Enable="1" Text="空调开了吗？"/>
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
</Script><assessment no="14" name="DEP661" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="排风口开启">
<Rect left="585" top="752" right="685" bottom="784"/>
<Line1Text Enable="1" Text="拨动后出风口开关"/>
<Line2Text Enable="1" Text="排风口有风送出吗？"/>
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
</Script><assessment no="15" name="DEP662" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="4" flags="0" name="路由节点">
<Rect left="620" top="809" right="652" bottom="841"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="620" top="871" right="652" bottom="903"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="手动确认">
<Rect left="586" top="935" right="686" bottom="967"/>
<Strategy NokTime="0" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="请调节右后背向前移动"/>
<Line2Text Enable="1" Text="右后靠背向前移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="16" name="DEP664" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="手动确认">
<Rect left="585" top="982" right="685" bottom="1014"/>
<Line1Text Enable="1" Text="请调节右后靠背向后移动"/>
<Line2Text Enable="1" Text="右后靠背自动向后移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="17" name="DEP663" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="M左边后靠正面">
<Rect left="585" top="1096" right="685" bottom="1128"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背向前移动"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x00 0x03 0x02
</Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="620" top="1038" right="652" bottom="1070"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="手动确认">
<Rect left="585" top="1141" right="685" bottom="1173"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="左后靠背向前移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="18" name="DEP666" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="M左后靠反面">
<Rect left="584" top="1187" right="684" bottom="1219"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背向后移动"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x00 0x03 0x03</Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="手动确认">
<Rect left="582" top="1234" right="682" bottom="1266"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="左后靠背自动向后移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="19" name="DEP665" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="802" top="1042" right="834" bottom="1074"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="618" top="1404" right="650" bottom="1436"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="H右后靠正面">
<Rect left="584" top="1453" right="684" bottom="1485"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背向前移动"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x01 0x03 0x02
</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="手动确认">
<Rect left="583" top="1503" right="683" bottom="1535"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="右后靠背向前移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="20" name="DEP664" type="8" flags="97"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="H右后靠反面">
<Rect left="583" top="1558" right="683" bottom="1590"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背向后移动"/>
<Script>--#COMM 0x2f  0x02 0x01 0x03 0x03
</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="手动确认">
<Rect left="585" top="1603" right="685" bottom="1635"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="右后靠背自动向后移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="21" name="DEP663" type="8" flags="97"/>
</Activity>
<Activity id="55" ActivityType="4" flags="0" name="路由节点">
<Rect left="617" top="1719" right="649" bottom="1751"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="H右靠背按摩">
<Rect left="583" top="1781" right="683" bottom="1813"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节右后靠背按摩器"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x03 0x03 0x01
</Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="手动确认">
<Rect left="584" top="1832" right="684" bottom="1864"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="右后座椅按摩器自动动作了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="22" name="DEP667" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="4" flags="0" name="路由节点">
<Rect left="619" top="1888" right="651" bottom="1920"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="H左后靠正面">
<Rect left="586" top="1948" right="686" bottom="1980"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后靠背向前移动了吗？"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x00 0x03 0x02
</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="手动确认">
<Rect left="587" top="2003" right="687" bottom="2035"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="左后靠背自动向前移动？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="23" name="DEP666" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="H左后靠反面">
<Rect left="586" top="2052" right="686" bottom="2084"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背向后移动"/>
<Script>--#COMM 0x2f  0x02 0x00 0x03 0x03

</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="手动确认">
<Rect left="587" top="2105" right="687" bottom="2137"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="右后靠背向后移动了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="24" name="DEP665" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="4" flags="0" name="路由节点">
<Rect left="621" top="2169" right="653" bottom="2201"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="H左靠背按摩">
<Rect left="586" top="2237" right="686" bottom="2269"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请调节左后靠背按摩器"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x2f  0x02 0x02 0x03 0x01
</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="手动确认">
<Rect left="586" top="2292" right="686" bottom="2324"/>
<Line1Text Enable="1" Text="请注意！"/>
<Line2Text Enable="1" Text="左后座椅按摩器动作了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="25" name="DEP668" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="清除显示">
<Rect left="585" top="2459" right="685" bottom="2491"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="检测失败">
<Rect left="470" top="936" right="570" bottom="968"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="检测失败">
<Rect left="471" top="983" right="571" bottom="1015"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="检测失败">
<Rect left="465" top="1142" right="565" bottom="1174"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="检测失败">
<Rect left="462" top="1233" right="562" bottom="1265"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="检测失败">
<Rect left="463" top="1503" right="563" bottom="1535"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="94" ActivityType="3" flags="0" name="检测失败">
<Rect left="463" top="1603" right="563" bottom="1635"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="检测失败">
<Rect left="465" top="1833" right="565" bottom="1865"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="检测失败">
<Rect left="466" top="1998" right="566" bottom="2030"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="检测失败">
<Rect left="465" top="2105" right="565" bottom="2137"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="检测失败">
<Rect left="463" top="2289" right="563" bottom="2321"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="连接ECU">
<Rect left="208" top="185" right="308" bottom="217"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="切诊断">
<Rect left="209" top="330" right="309" bottom="362"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2702" name="DEP1091" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="208" top="375" right="308" bottom="407"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2703" name="DEP1092" type="8" flags="97"/>
</Activity>
<Activity id="103" ActivityType="13" flags="0" name="计算key">
<Rect left="208" top="422" right="308" bottom="454"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB1DFE0C2"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="发送key">
<Rect left="207" top="467" right="307" bottom="499"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2704" name="DEP1093" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="比对零件号">
<Rect left="320" top="143" right="420" bottom="175"/>
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
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==12)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	else
	end
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
end</Script><assessment no="1" name="DEP650" type="8" flags="105"/>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="94" right="386" bottom="126"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="读硬件号">
<Rect left="450" top="144" right="550" bottom="176"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@5);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP651" type="8" flags="97"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="延时300MS">
<Rect left="450" top="184" right="550" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="114" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="94" right="516" bottom="126"/>
</Activity>
<Activity id="115" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="94" right="766" bottom="126"/>
</Activity>
<Activity id="116" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="94" right="646" bottom="126"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="580" top="134" right="680" bottom="166"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@10);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP652" type="8" flags="105"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="读软件号">
<Rect left="700" top="144" right="800" bottom="176"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@5);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP653" type="8" flags="105"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="延时300MS">
<Rect left="700" top="194" right="800" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="820" top="144" right="920" bottom="176"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Partnumber=="3610715AMH")then
		StandValue="RMAR_V3.48";
	elseif(DString_C131_Partnumber=="3610715BMH")then
		StandValue="RMAR_V3.48";
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
		engine.println("不比对软件版本号");
	end                                     
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="5" name="DEP654" type="8" flags="105"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="延时300MS">
<Rect left="820" top="194" right="920" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="94" right="886" bottom="126"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1350" top="144" right="1450" bottom="176"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP655" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1340" top="194" right="1440" bottom="226"/>
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
end</Script><assessment no="7" name="DEP656" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="日期读取">
<Rect left="1460" top="194" right="1560" bottom="226"/>
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
<Activity id="126" ActivityType="3" flags="0" name="发送时间">
<Rect left="1460" top="144" right="1560" bottom="176"/>
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
<Activity id="127" ActivityType="4" flags="0" name="路由节点">
<Rect left="1384" top="94" right="1416" bottom="126"/>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="延时300MS">
<Rect left="580" top="184" right="680" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1590" top="194" right="1690" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="130" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1700" top="144" right="1800" bottom="176"/>
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
end</Script><assessment no="11" name="DEP658" type="8" flags="97"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="写配置码">
<Rect left="1590" top="144" right="1690" bottom="176"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP657" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="4" flags="0" name="路由节点">
<Rect left="1624" top="94" right="1656" bottom="126"/>
</Activity>
<Activity id="133" ActivityType="4" flags="0" name="路由节点">
<Rect left="1504" top="94" right="1536" bottom="126"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1810" top="564" right="1910" bottom="596"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="138" ActivityType="4" flags="0" name="路由节点">
<Rect left="799" top="672" right="831" bottom="704"/>
</Activity>
<Activity id="140" ActivityType="4" flags="0" name="路由节点">
<Rect left="617" top="1290" right="649" bottom="1322"/>
</Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="618" top="1662" right="650" bottom="1694"/>
</Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="620" top="2347" right="652" bottom="2379"/>
</Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="94" right="1766" bottom="126"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="通讯">
<Rect left="210" top="232" right="310" bottom="264"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2700" name="DEP785" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1" top="233" right="101" bottom="265"/>
<Line1Text Enable="1" Text="ARMREST 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="2459" right="66" bottom="2491"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="结束通讯">
<Rect top="185" right="100" bottom="217"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="1844" top="94" right="1876" bottom="126"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="695" top="964" right="727" bottom="996"/>
</Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="708" top="1156" right="740" bottom="1188"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="617" top="1345" right="649" bottom="1377"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="1559" right="766" bottom="1591"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="2029" right="746" bottom="2061"/>
</Activity>
<Activity id="155" ActivityType="4" flags="0" name="路由节点">
<Rect left="713" top="1801" right="745" bottom="1833"/>
</Activity>
<Activity id="156" ActivityType="4" flags="0" name="路由节点">
<Rect left="720" top="2258" right="752" bottom="2290"/>
</Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="802" top="1346" right="834" bottom="1378"/>
</Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="799" top="2403" right="831" bottom="2435"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="619" top="2404" right="651" bottom="2436"/>
</Activity>
<Activity id="160" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="557" right="656" bottom="589"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="混动车型">
<Rect left="950" top="144" right="1050" bottom="176"/>
<Script></Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="950" top="194" right="1050" bottom="226"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM23")then
		StandValue="RMAR_V3.2";
	elseif(DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1LM13")then
		StandValue="RMAR_V3.1";
	elseif(DString_C131_Car_Tpye=="CH1MM21")then
		StandValue="RMAR_V3.2";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
	engine.SetLineText(3,DString1);
	--if("RMAR_V3.2" == DString1) then    
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


</Script><assessment no="5" name="DEP654" type="8" flags="105"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="延时300MS">
<Rect left="950" top="244" right="1050" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="94" right="1016" bottom="126"/>
</Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="354" right="1136" bottom="386"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="改脸">
<Rect left="1090" top="144" right="1190" bottom="176"/>
<Script></Script></Activity>
<Activity id="167" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1090" top="194" right="1190" bottom="226"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM20")then
		StandValue="RMAR_V3.2";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
	elseif(DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1FM30")then
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
        elseif(DString_C131_Car_Tpye=="CH1AM43" or DString_C131_Car_Tpye=="CH1DM16")then
		StandValue="RMAR_V3.2";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
        elseif(DString_C131_Car_Tpye=="CH1GM23")then
		StandValue="RMAR_V3.3";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
        elseif(DString_C131_Car_Tpye=="CH1CM30" )then
		StandValue="RMAR_V3.2";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
        elseif(DString_C131_Car_Tpye=="CH1GM40" )then
		StandValue="RMAR_V3.3";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11); 
	elseif(DString_C131_Car_Tpye=="CH1AM46" )then
		StandValue="RMAR_V3.2";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11); 
	elseif(DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11); 
	elseif(DString_C131_Car_Tpye=="CH1BM35" )then
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11); 
	elseif(DString_C131_Car_Tpye=="CH1CM33" )then
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11); 
	elseif(DString_C131_Car_Tpye=="CH1CM32" )then
		StandValue="RMAR_V3.2";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);        
	else
		StandValue="RMAR_V3.1";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("RMAR_V3.2" == DString1) then  
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


</Script><assessment no="5" name="DEP654" type="8" flags="105"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1090" top="244" right="1190" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="94" right="1156" bottom="126"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="19年型">
<Rect left="1220" top="144" right="1320" bottom="176"/>
<Script></Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1220" top="194" right="1320" bottom="226"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue=LibGeneral.ARMRESTsoftVerNum(DString_C131_Car_Tpye);
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
end</Script><assessment no="5" name="DEP654" type="8" flags="105"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1220" top="244" right="1320" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="94" right="1286" bottom="126"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="99" type="0">
</Transition>
<Transition StartId="3" EndId="100" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>(DString_C131_dif_config_ARMREST == "1") and (DString_C131_Car_Tpye ~= "CH1GM11") and (DString_C131_Car_Tpye ~= "CH1GM12")</Expression></Transition>
<Transition StartId="12" EndId="40" type="0">
</Transition>
<Transition StartId="13" EndId="16" type="1">
<Expression>C131_ARMREST_RR_Backrest_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="150" type="0">
</Transition>
<Transition StartId="16" EndId="22" type="6">
</Transition>
<Transition StartId="16" EndId="89" type="0">
</Transition>
<Transition StartId="22" EndId="90" type="0">
</Transition>
<Transition StartId="22" EndId="26" type="6">
</Transition>
<Transition StartId="25" EndId="27" type="0">
</Transition>
<Transition StartId="26" EndId="25" type="1">
<Expression>C131_ARMREST_RL_Backrest_Execute_Flag == true</Expression></Transition>
<Transition StartId="26" EndId="151" type="0">
</Transition>
<Transition StartId="27" EndId="31" type="6">
</Transition>
<Transition StartId="27" EndId="91" type="0">
</Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="140" type="6">
</Transition>
<Transition StartId="32" EndId="92" type="0">
</Transition>
<Transition StartId="40" EndId="152" type="0">
</Transition>
<Transition StartId="41" EndId="44" type="1">
<Expression>C131_ARMREST_RR_Backrest_Execute_Flag == true</Expression></Transition>
<Transition StartId="41" EndId="153" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="93" type="0">
</Transition>
<Transition StartId="45" EndId="50" type="6">
</Transition>
<Transition StartId="50" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="141" type="6">
</Transition>
<Transition StartId="51" EndId="94" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="1">
<Expression>C131_ARMREST_RR_Massaging_Execute_Flag == true</Expression></Transition>
<Transition StartId="55" EndId="155" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="61" type="6">
</Transition>
<Transition StartId="57" EndId="95" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="1">
<Expression>C131_ARMREST_RL_Backrest_Execute_Flag == true</Expression></Transition>
<Transition StartId="61" EndId="154" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="96" type="0">
</Transition>
<Transition StartId="63" EndId="68" type="6">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="97" type="0">
</Transition>
<Transition StartId="69" EndId="72" type="6">
</Transition>
<Transition StartId="72" EndId="73" type="1">
<Expression>C131_ARMREST_RL_Masaging_Execute_Flag == true</Expression></Transition>
<Transition StartId="72" EndId="156" type="0">
</Transition>
<Transition StartId="73" EndId="75" type="0">
</Transition>
<Transition StartId="75" EndId="98" type="0">
</Transition>
<Transition StartId="75" EndId="143" type="6">
</Transition>
<Transition StartId="80" EndId="1" type="0">
</Transition>
<Transition StartId="89" EndId="22" type="0">
</Transition>
<Transition StartId="90" EndId="26" type="0">
</Transition>
<Transition StartId="91" EndId="31" type="0">
</Transition>
<Transition StartId="92" EndId="140" type="0">
</Transition>
<Transition StartId="93" EndId="50" type="0">
</Transition>
<Transition StartId="94" EndId="141" type="0">
</Transition>
<Transition StartId="95" EndId="61" type="0">
</Transition>
<Transition StartId="96" EndId="68" type="0">
</Transition>
<Transition StartId="97" EndId="72" type="0">
</Transition>
<Transition StartId="98" EndId="143" type="0">
</Transition>
<Transition StartId="99" EndId="145" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="103" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="114" type="0">
</Transition>
<Transition StartId="111" EndId="110" type="1">
<Expression>C131_ARMREST_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="111" EndId="114" type="0">
</Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="116" type="0">
</Transition>
<Transition StartId="114" EndId="116" type="0">
</Transition>
<Transition StartId="114" EndId="112" type="1">
<Expression>C131_ARMREST_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="115" EndId="118" type="1">
<Expression>C131_ARMREST_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="115" EndId="122" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="1">
<Expression>C131_ARMREST_HVP_Execute_Flag== true</Expression></Transition>
<Transition StartId="116" EndId="115" type="0">
</Transition>
<Transition StartId="117" EndId="128" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="122" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="165" type="0">
</Transition>
<Transition StartId="122" EndId="120" type="1">
<Expression>C131_ARMREST_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)  and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="122" EndId="164" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="133" type="0">
</Transition>
<Transition StartId="125" EndId="132" type="0">
</Transition>
<Transition StartId="126" EndId="125" type="0">
</Transition>
<Transition StartId="127" EndId="123" type="1">
<Expression>C131_ARMREST_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="127" EndId="133" type="0">
</Transition>
<Transition StartId="128" EndId="115" type="0">
</Transition>
<Transition StartId="129" EndId="144" type="0">
</Transition>
<Transition StartId="130" EndId="149" type="0">
</Transition>
<Transition StartId="131" EndId="129" type="0">
</Transition>
<Transition StartId="132" EndId="131" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_ARMREST_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="132" EndId="144" type="0">
</Transition>
<Transition StartId="133" EndId="126" type="1">
<Expression>C131_ARMREST_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="133" EndId="132" type="0">
</Transition>
<Transition StartId="137" EndId="160" type="0">
</Transition>
<Transition StartId="138" EndId="12" type="0">
</Transition>
<Transition StartId="140" EndId="152" type="0">
</Transition>
<Transition StartId="141" EndId="55" type="0">
</Transition>
<Transition StartId="143" EndId="159" type="0">
</Transition>
<Transition StartId="144" EndId="130" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_ARMREST_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="144" EndId="149" type="0">
</Transition>
<Transition StartId="145" EndId="3" type="3">
</Transition>
<Transition StartId="145" EndId="146" type="4">
</Transition>
<Transition StartId="146" EndId="148" type="0">
</Transition>
<Transition StartId="146" EndId="147" type="5">
</Transition>
<Transition StartId="147" EndId="80" type="0">
</Transition>
<Transition StartId="148" EndId="99" type="0">
</Transition>
<Transition StartId="149" EndId="137" type="0">
</Transition>
<Transition StartId="150" EndId="26" type="0">
</Transition>
<Transition StartId="151" EndId="140" type="0">
</Transition>
<Transition StartId="152" EndId="41" type="1">
<Expression>(DString_C131_dif_config_ARMREST == "2") and (DString_C131_Car_Tpye ~= "CH1GM11") and (DString_C131_Car_Tpye ~= "CH1GM12")</Expression></Transition>
<Transition StartId="152" EndId="157" type="0">
</Transition>
<Transition StartId="153" EndId="55" type="0">
</Transition>
<Transition StartId="154" EndId="72" type="0">
</Transition>
<Transition StartId="155" EndId="61" type="0">
</Transition>
<Transition StartId="156" EndId="143" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="158" EndId="159" type="0">
</Transition>
<Transition StartId="159" EndId="80" type="0">
</Transition>
<Transition StartId="160" EndId="6" type="1">
<Expression>C131_ARMREST_Panel_Switch_Execute_Flag == true</Expression></Transition>
<Transition StartId="160" EndId="138" type="0">
</Transition>
<Transition StartId="161" EndId="162" type="0">
</Transition>
<Transition StartId="162" EndId="163" type="0">
</Transition>
<Transition StartId="163" EndId="165" type="0">
</Transition>
<Transition StartId="164" EndId="161" type="1">
<Expression>C131_ARMREST_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="164" EndId="169" type="0">
</Transition>
<Transition StartId="165" EndId="127" type="0">
</Transition>
<Transition StartId="166" EndId="167" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="165" type="0">
</Transition>
<Transition StartId="169" EndId="166" type="1">
<Expression>C131_ARMREST_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="169" EndId="174" type="0">
</Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="165" type="0">
</Transition>
<Transition StartId="174" EndId="171" type="1">
<Expression>C131_ARMREST_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="174" EndId="127" type="0">
</Transition>
</Transitions>
</Process>

