<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1124" pbltext="DEP85">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_EPB_Assembly_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_Switch_and_LED_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EPB_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C3" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="145" right="245" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="589" top="705" right="689" bottom="737"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电子驻车(EPB)">
<Rect left="144" top="58" right="244" bottom="90"/>
<TitleText Enable="1" Text="电子驻车(EPB)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="144" top="208" right="244" bottom="240"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2601" name="DEP87" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="请关闭电子驻车手动测试">
<Rect left="589" top="293" right="689" bottom="325"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请关闭电子驻车"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="EPB左侧驻车检测">
<Rect left="590" top="339" right="690" bottom="371"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0C

if (@3==0x55) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,string.format("%02X",@3));--显示结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP480" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="检测失败">
<Rect left="480" top="386" right="580" bottom="418"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="请关闭电子驻车手动测试">
<Rect left="591" top="385" right="691" bottom="417"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请关闭电子驻车"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="EPB右侧驻车检测">
<Rect left="590" top="434" right="690" bottom="466"/>
<Strategy TotalTime="15" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0D

if (@3==0x55) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"OkCount"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end

engine.SetLineText(3,string.format("%02X",@3));--显示结果

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP481" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="EPB驻车灯和仪表盘亮">
<Rect left="589" top="592" right="689" bottom="624"/>
<Line1Text Enable="1" Text="请打开电子驻车"/>
<Line2Text Enable="1" Text="#L=开关灯和仪表板驻车灯亮了吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
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

</Script><assessment no="15" name="DEP482" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="588" top="646" right="688" bottom="678"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="623" top="487" right="655" bottom="519"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="连接ECU">
<Rect left="145" top="111" right="245" bottom="143"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="仪表板驻车灯灭">
<Rect left="589" top="537" right="689" bottom="569"/>
<Line1Text Enable="1" Text="请关闭电子驻车"/>
<Line2Text Enable="1" Text="#L=开关灯和仪表板驻车灯灭了吗？#R=BMPEYE"/>
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

</Script><assessment no="16" name="DEP483" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="切诊断">
<Rect left="143" top="260" right="243" bottom="292"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2602" name="DEP1083" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="142" top="313" right="242" bottom="345"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2620" name="DEP89" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="发送key">
<Rect left="142" top="414" right="242" bottom="446"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="3"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2621" name="DEP89" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="13" flags="0" name="EPB计算">
<Rect left="142" top="364" right="242" bottom="396"/>
<FunctionRef id="sec_epb">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="246" right="656" bottom="278"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="比对零件号">
<Rect left="270" top="74" right="370" bottom="106"/>
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
end
</Script><assessment no="1" name="DEP350" type="8" flags="105"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="14" right="336" bottom="46"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="读硬件号">
<Rect left="400" top="64" right="500" bottom="96"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);
engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP351" type="8" flags="105"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="延时300MS">
<Rect left="400" top="114" right="500" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="14" right="466" bottom="46"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="14" right="726" bottom="46"/>
</Activity>
<Activity id="47" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="14" right="606" bottom="46"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="540" top="64" right="640" bottom="96"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@5);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP352" type="8" flags="105"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="延时300MS">
<Rect left="540" top="114" right="640" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="14" right="866" bottom="46"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="800" top="74" right="900" bottom="106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="X052";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("X052" == DString1)then
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
</Script><assessment no="5" name="DEP354" type="8" flags="105"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="读软件号">
<Rect left="670" top="64" right="770" bottom="96"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@5);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);
engine.StatValue=DString1;

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP353" type="8" flags="105"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="延时300MS">
<Rect left="660" top="114" right="760" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="延时300MS">
<Rect left="800" top="114" right="900" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1380" top="64" right="1480" bottom="96"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90  string.byte(vin,1) string.byte(vin,2) string.byte(vin,3) string.byte(vin,4) string.byte(vin,5) string.byte(vin,6) string.byte(vin,7) string.byte(vin,8) string.byte(vin,9) string.byte(vin,10) string.byte(vin,11) string.byte(vin,12) string.byte(vin,13) string.byte(vin,14) string.byte(vin,15) string.byte(vin,16) string.byte(vin,17)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP355" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1380" top="114" right="1480" bottom="146"/>
<Line1Text Enable="1" Text="比对VIN"/>
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
end</Script><assessment no="7" name="DEP356" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="日期读取">
<Rect left="1500" top="114" right="1600" bottom="146"/>
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
<Activity id="73" ActivityType="3" flags="0" name="发送时间">
<Rect left="1500" top="64" right="1600" bottom="96"/>
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
<Rect left="1414" top="14" right="1446" bottom="46"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1950" top="254" right="2050" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1610" top="114" right="1710" bottom="146"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1730" top="64" right="1830" bottom="96"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@7);
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
end</Script><assessment no="12" name="DEP358" type="8" flags="105"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="写配置码">
<Rect left="1610" top="64" right="1710" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9)


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP357" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="1644" top="14" right="1676" bottom="46"/>
</Activity>
<Activity id="83" ActivityType="4" flags="0" name="路由节点">
<Rect left="1534" top="14" right="1566" bottom="46"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="清DTC">
<Rect left="1610" top="164" right="1710" bottom="196"/>
<Line1Text Enable="1" Text="EPB清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="11" name="DEP87" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="1884" top="14" right="1916" bottom="46"/>
</Activity>
<Activity id="86" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1850" top="64" right="1950" bottom="96"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@7);
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
end</Script><assessment no="12" name="DEP358" type="8" flags="105"/>
</Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="1984" top="14" right="2016" bottom="46"/>
</Activity>
<Activity id="88" ActivityType="4" flags="0" name="路由节点">
<Rect left="709" top="363" right="741" bottom="395"/>
</Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="705" top="595" right="737" bottom="627"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="通讯">
<Rect left="145" top="161" right="245" bottom="193"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2600" name="DEP86" type="8" flags="97"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="通讯失败">
<Rect left="32" top="164" right="132" bottom="196"/>
<Line1Text Enable="1" Text="EPB 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="92" ActivityType="4" flags="0" name="路由节点">
<Rect left="67" top="647" right="99" bottom="679"/>
</Activity>
<Activity id="93" ActivityType="3" flags="0" name="结束通讯">
<Rect left="31" top="116" right="131" bottom="148"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="1764" top="14" right="1796" bottom="46"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="混动车型">
<Rect left="1090" top="64" right="1190" bottom="96"/>
<Script></Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1090" top="114" right="1190" bottom="146"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="X052";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("X052" == DString1)then
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
</Script><assessment no="5" name="DEP354" type="8" flags="105"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1090" top="164" right="1190" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="14" right="1156" bottom="46"/>
</Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="234" right="1336" bottom="266"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="改脸">
<Rect left="1220" top="64" right="1320" bottom="96"/>
<Script></Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1220" top="114" right="1320" bottom="146"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="X052";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="X052";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="X052";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="X052";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="X052";
	else
		StandValue="X052";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("X052" == DString1)then
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
</Script><assessment no="5" name="DEP354" type="8" flags="105"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1220" top="164" right="1320" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="103" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="14" right="1286" bottom="46"/>
</Activity>
<Activity id="238" ActivityType="3" flags="0" name="19年型">
<Rect left="950" top="74" right="1050" bottom="106"/>
<Script></Script></Activity>
<Activity id="239" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="950" top="124" right="1050" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="X052";

	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1 = engine.GetResponseString(3,2+#StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("X052" == DString1)then
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
</Script><assessment no="5" name="DEP354" type="8" flags="105"/>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="延时300MS">
<Rect left="950" top="174" right="1050" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="984" top="14" right="1016" bottom="46"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="28" type="0">
</Transition>
<Transition StartId="4" EndId="30" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="4">
</Transition>
<Transition StartId="10" EndId="14" type="3">
</Transition>
<Transition StartId="12" EndId="26" type="0">
</Transition>
<Transition StartId="14" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="12" type="4">
</Transition>
<Transition StartId="16" EndId="26" type="3">
</Transition>
<Transition StartId="21" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="2" type="0">
</Transition>
<Transition StartId="26" EndId="29" type="1">
<Expression>C131_EPB_Switch_and_LED_Execute_Flag == true</Expression></Transition>
<Transition StartId="26" EndId="89" type="0">
</Transition>
<Transition StartId="28" EndId="90" type="0">
</Transition>
<Transition StartId="29" EndId="21" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="34" type="0">
</Transition>
<Transition StartId="33" EndId="41" type="0">
</Transition>
<Transition StartId="34" EndId="33" type="0">
</Transition>
<Transition StartId="36" EndId="9" type="1">
<Expression>C131_EPB_Assembly_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="36" EndId="88" type="0">
</Transition>
<Transition StartId="40" EndId="45" type="0">
</Transition>
<Transition StartId="41" EndId="40" type="1">
<Expression>C131_EPB_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="41" EndId="45" type="0">
</Transition>
<Transition StartId="42" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="47" type="0">
</Transition>
<Transition StartId="45" EndId="42" type="1">
<Expression>C131_EPB_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="45" EndId="47" type="0">
</Transition>
<Transition StartId="46" EndId="57" type="1">
<Expression>C131_EPB_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="46" EndId="51" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="1">
<Expression>C131_EPB_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="47" EndId="46" type="0">
</Transition>
<Transition StartId="48" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="46" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="1">
<Expression>C131_EPB_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="51" EndId="241" type="0">
</Transition>
<Transition StartId="52" EndId="61" type="0">
</Transition>
<Transition StartId="57" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="51" type="0">
</Transition>
<Transition StartId="61" EndId="99" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="83" type="0">
</Transition>
<Transition StartId="71" EndId="82" type="0">
</Transition>
<Transition StartId="73" EndId="71" type="0">
</Transition>
<Transition StartId="74" EndId="69" type="1">
<Expression>C131_EPB_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="74" EndId="83" type="0">
</Transition>
<Transition StartId="77" EndId="36" type="0">
</Transition>
<Transition StartId="78" EndId="84" type="0">
</Transition>
<Transition StartId="79" EndId="85" type="0">
</Transition>
<Transition StartId="81" EndId="78" type="0">
</Transition>
<Transition StartId="82" EndId="81" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_EPB_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="82" EndId="94" type="0">
</Transition>
<Transition StartId="83" EndId="73" type="1">
<Expression>C131_EPB_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="83" EndId="82" type="0">
</Transition>
<Transition StartId="84" EndId="94" type="0">
</Transition>
<Transition StartId="85" EndId="86" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="85" EndId="87" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="77" type="0">
</Transition>
<Transition StartId="88" EndId="26" type="0">
</Transition>
<Transition StartId="89" EndId="2" type="0">
</Transition>
<Transition StartId="90" EndId="4" type="3">
</Transition>
<Transition StartId="90" EndId="91" type="4">
</Transition>
<Transition StartId="91" EndId="93" type="0">
</Transition>
<Transition StartId="91" EndId="92" type="5">
</Transition>
<Transition StartId="92" EndId="23" type="0">
</Transition>
<Transition StartId="93" EndId="28" type="0">
</Transition>
<Transition StartId="94" EndId="85" type="0">
</Transition>
<Transition StartId="94" EndId="79" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_EPB_WD_Execute_Flag == true)</Expression></Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="99" type="0">
</Transition>
<Transition StartId="98" EndId="95" type="1">
<Expression>C131_EPB_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) </Expression></Transition>
<Transition StartId="98" EndId="103" type="0">
</Transition>
<Transition StartId="99" EndId="74" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="99" type="0">
</Transition>
<Transition StartId="103" EndId="100" type="1">
<Expression>C131_EPB_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="103" EndId="74" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="240" type="0">
</Transition>
<Transition StartId="240" EndId="99" type="0">
</Transition>
<Transition StartId="241" EndId="238" type="1">
<Expression>C131_EPB_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="241" EndId="98" type="0">
</Transition>
</Transitions>
</Process>

