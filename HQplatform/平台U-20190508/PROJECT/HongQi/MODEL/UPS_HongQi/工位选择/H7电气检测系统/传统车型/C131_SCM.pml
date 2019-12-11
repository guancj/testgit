<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1135" pbltext="DEP377">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_SCM_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SCM_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_SCM_AD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x76E" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x78E" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="111" top="12" right="211" bottom="44"/>
<Script>engine.println("DString_C131_Partnumber:"..DString_C131_Partnumber);</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="475" top="1163" right="575" bottom="1195"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="114" top="167" right="214" bottom="199"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1758" name="DEP207" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1334" top="365" right="1434" bottom="397"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="112" top="68" right="212" bottom="100"/>
<TitleText Enable="1" Text="电子助力转向(SCM)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="切诊断">
<Rect left="113" top="215" right="213" bottom="247"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1759" name="DEP1101" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="114" top="263" right="214" bottom="295"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1778" name="DEP209" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="发送key">
<Rect left="113" top="360" right="213" bottom="392"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="发送KEY"/>
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


</Script><assessment no="1779" name="DEP210" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="比对零件号">
<Rect left="233" top="69" right="333" bottom="101"/>
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
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
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
end</Script><assessment no="1" name="DEP378" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="4" flags="0" name="路由节点">
<Rect left="267" top="14" right="299" bottom="46"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="读硬件号">
<Rect left="353" top="66" right="453" bottom="98"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP379" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="延时300MS">
<Rect left="354" top="116" right="454" bottom="148"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="28" ActivityType="4" flags="0" name="路由节点">
<Rect left="387" top="13" right="419" bottom="45"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="650" top="13" right="682" bottom="45"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="525" top="12" right="557" bottom="44"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="492" top="65" right="592" bottom="97"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP380" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="延时300MS">
<Rect left="491" top="113" right="591" bottom="145"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="778" top="12" right="810" bottom="44"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="741" top="119" right="841" bottom="151"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13")then
		StandValue="1.6.0";
	elseif(DString_C131_Car_Tpye=="CH1JM11")then
		StandValue="";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7);
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
end</Script><assessment no="5" name="DEP382" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="读软件号">
<Rect left="610" top="64" right="710" bottom="96"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP381" type="8" flags="97"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="延时300MS">
<Rect left="610" top="114" right="710" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="延时300MS">
<Rect left="743" top="167" right="843" bottom="199"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="发送VIN">
<Rect left="863" top="71" right="963" bottom="103"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP383" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="检查VIN">
<Rect left="863" top="120" right="963" bottom="152"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=bytesStr(@3-@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (string.match(DString1,bytesStr(DString_Write_VIN))) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString_Write_VIN;
	engine.StatPoint=DString1
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP384" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="日期读取">
<Rect left="988" top="119" right="1088" bottom="151"/>
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
<Activity id="72" ActivityType="3" flags="0" name="发送时间">
<Rect left="988" top="69" right="1088" bottom="101"/>
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
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="896" top="11" right="928" bottom="43"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="1023" top="12" right="1055" bottom="44"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="写配置码">
<Rect left="1110" top="70" right="1210" bottom="102"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP385" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1238" top="68" right="1338" bottom="100"/>
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
</Script><assessment no="13" name="DEP386" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="4" flags="0" name="路由节点">
<Rect left="1143" top="13" right="1175" bottom="45"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1110" top="120" right="1210" bottom="152"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="1273" top="13" right="1305" bottom="45"/>
</Activity>
<Activity id="112" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="113" top="312" right="213" bottom="344"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x62514039"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="请将电子转向柱置于中间位置">
<Rect left="467" top="417" right="567" bottom="449"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将电子转向柱置于中间位置"/>
<Line3Text Enable="1" Text="开始吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="118" ActivityType="3" flags="1" name="电子转向柱向前运动了吗？">
<Rect left="468" top="511" right="568" bottom="543"/>
<Line1Text Enable="1" Text="电子转向柱向前运动了吗？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
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
</Script><assessment no="14" name="DEP764" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="发送向前">
<Rect left="467" top="464" right="567" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 向前运动中..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xF1 0x00
#DELAY 1000</Script><assessment no="20" name="DEP1249" type="8" flags="97"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="复位">
<Rect left="468" top="556" right="568" bottom="588"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 复位..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xF1 0x00
#DELAY 1000</Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="电子转向柱向后运动了吗？">
<Rect left="470" top="659" right="570" bottom="691"/>
<Line1Text Enable="1" Text="电子转向柱向后运动了吗？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
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
</Script><assessment no="15" name="DEP765" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="发送向后">
<Rect left="469" top="614" right="569" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 向后运动中..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xF1 0x01
#DELAY 1000</Script><assessment no="21" name="DEP1250" type="8" flags="97"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="复位">
<Rect left="471" top="704" right="571" bottom="736"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 复位..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xF1 0x01
#DELAY 1000</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="电子转向柱向上运动了吗？">
<Rect left="471" top="809" right="571" bottom="841"/>
<Line1Text Enable="1" Text="电子转向柱向上运动了吗？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
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

</Script><assessment no="16" name="DEP766" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="发送向上">
<Rect left="471" top="764" right="571" bottom="796"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 向上运动中..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xF1 0x02
#DELAY 1000</Script><assessment no="22" name="DEP1251" type="8" flags="97"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="复位">
<Rect left="472" top="855" right="572" bottom="887"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 复位..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xF1 0x02
#DELAY 1000</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="电子转向柱向下运动了吗？">
<Rect left="473" top="961" right="573" bottom="993"/>
<Line1Text Enable="1" Text="电子转向柱向下运动了吗？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
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
</Script><assessment no="17" name="DEP767" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="发送向下">
<Rect left="472" top="912" right="572" bottom="944"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 向下运动中..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xF1 0x03
#DELAY 1000</Script><assessment no="23" name="DEP1252" type="8" flags="97"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="复位">
<Rect left="473" top="1008" right="573" bottom="1040"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="电子转向柱 复位..."/>
<Line3Text Enable="1"/>
<Script>#COMM 0x31 0x02 0xF1 0x03
#DELAY 1000</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="请将电子转向柱置于中间位置">
<Rect left="474" top="1054" right="574" bottom="1086"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请手动将电子转向柱调回原位"/>
<Line3Text Enable="1" Text="OK？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="474" top="1101" right="574" bottom="1133"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="通讯">
<Rect left="113" top="118" right="213" bottom="150"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1775" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="通讯失败">
<Rect top="121" right="100" bottom="153"/>
<Line1Text Enable="1" Text="SCM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="35" top="1161" right="67" bottom="1193"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2" top="74" right="102" bottom="106"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1368" top="14" right="1400" bottom="46"/>
</Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="502" top="365" right="534" bottom="397"/>
</Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="637" top="698" right="669" bottom="730"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="改脸">
<Rect left="740" top="68" right="840" bottom="100"/>
<Script></Script></Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="428" top="31" right="460" bottom="63"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="10" type="0">
</Transition>
<Transition StartId="3" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="145" type="0">
</Transition>
<Transition StartId="10" EndId="140" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="112" type="0">
</Transition>
<Transition StartId="14" EndId="22" type="0">
</Transition>
<Transition StartId="21" EndId="28" type="0">
</Transition>
<Transition StartId="22" EndId="21" type="1">
<Expression>C131_SCM_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="22" EndId="28" type="0">
</Transition>
<Transition StartId="25" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="30" type="0">
</Transition>
<Transition StartId="28" EndId="30" type="0">
</Transition>
<Transition StartId="29" EndId="42" type="0">
</Transition>
<Transition StartId="29" EndId="49" type="1">
<Expression>C131_SCM_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="1">
<Expression>C131_SCM_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="29" type="0">
</Transition>
<Transition StartId="42" EndId="147" type="1">
<Expression>C131_SCM_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="42" EndId="74" type="0">
</Transition>
<Transition StartId="43" EndId="61" type="0">
</Transition>
<Transition StartId="49" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="42" type="0">
</Transition>
<Transition StartId="61" EndId="74" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="85" type="0">
</Transition>
<Transition StartId="67" EndId="91" type="0">
</Transition>
<Transition StartId="72" EndId="67" type="0">
</Transition>
<Transition StartId="74" EndId="65" type="1">
<Expression>C131_SCM_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="74" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="72" type="1">
<Expression>C131_SCM_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="85" EndId="91" type="0">
</Transition>
<Transition StartId="89" EndId="110" type="0">
</Transition>
<Transition StartId="90" EndId="144" type="0">
</Transition>
<Transition StartId="91" EndId="89" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_SCM_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="91" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="90" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_SCM_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="111" EndId="144" type="0">
</Transition>
<Transition StartId="112" EndId="14" type="0">
</Transition>
<Transition StartId="117" EndId="122" type="0">
</Transition>
<Transition StartId="118" EndId="123" type="0">
</Transition>
<Transition StartId="122" EndId="118" type="0">
</Transition>
<Transition StartId="123" EndId="126" type="0">
</Transition>
<Transition StartId="125" EndId="127" type="0">
</Transition>
<Transition StartId="126" EndId="125" type="0">
</Transition>
<Transition StartId="127" EndId="129" type="0">
</Transition>
<Transition StartId="128" EndId="130" type="0">
</Transition>
<Transition StartId="129" EndId="128" type="0">
</Transition>
<Transition StartId="130" EndId="132" type="0">
</Transition>
<Transition StartId="131" EndId="133" type="0">
</Transition>
<Transition StartId="132" EndId="131" type="0">
</Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="1" type="0">
</Transition>
<Transition StartId="140" EndId="3" type="3">
</Transition>
<Transition StartId="140" EndId="141" type="4">
</Transition>
<Transition StartId="141" EndId="143" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="5">
</Transition>
<Transition StartId="142" EndId="1" type="0">
</Transition>
<Transition StartId="143" EndId="10" type="0">
</Transition>
<Transition StartId="144" EndId="9" type="0">
</Transition>
<Transition StartId="145" EndId="117" type="1">
<Expression>C131_SCM_AD_Execute_Flag == true</Expression></Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="135" type="0">
</Transition>
<Transition StartId="147" EndId="43" type="0">
</Transition>
<Transition StartId="148" EndId="25" type="1">
<Expression>C131_SCM_HN_Execute_Flag == true</Expression></Transition>
</Transitions>
</Process>

