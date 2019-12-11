<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1134" pbltext="DEP1206">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_PLGM_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_PLGM_Open_With_Button_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_Anti_Pinch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_Anti_Collsion_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_Open_With_Kick_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PLGM_Open_With_Key_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="DString_C131_VariCoding1" type="8" dir="0" data="DString_C131_VariCoding1"/>
<Variable id="DString_C131_Partnumber1" type="8" dir="0" data="DString_C131_Partnumber1"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x793" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="122" right="222" bottom="32"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="523" top="1806" right="623" bottom="1838"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="电动尾门">
<Rect left="123" top="57" right="223" bottom="89"/>
<TitleText Enable="1" Text="电动尾门控制器（PLGM）"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="123" top="203" right="223" bottom="235"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1758" name="DEP201" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1710" top="364" right="1810" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="122" top="106" right="222" bottom="138"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="切诊断">
<Rect left="124" top="249" right="224" bottom="281"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1756" name="DEP1100" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="123" top="296" right="223" bottom="328"/>
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
</Script><assessment no="1759" name="DEP203" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="发送key">
<Rect left="123" top="391" right="223" bottom="423"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="发送KEY"/>
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
engine.StatValue=hexstr(StringRes);


</Script><assessment no="1760" name="DEP204" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="比对零件号">
<Rect left="240" top="64" right="340" bottom="96"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber.." or "..DString_C131_Partnumber1);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
        DString1 = engine.GetResponseString(3,14);
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
        engine.println("读到零件号长度:"..string.len(DString1));
	
	if (DString1 == DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber);
                engine.StatValue=DString1;
        elseif(DString1 == DString_C131_Partnumber1)then 
                engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber1);
                engine.StatValue=DString1;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
                engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber1);
                engine.StatValue=DString1;
	end
	if(DString_C131_Partnumber ~= "" and  DString_C131_Partnumber ~= nil) then 
	engine.StatPoint=DString_C131_Partnumber;
	end 
        if(DString_C131_Partnumber1 ~= "" and  DString_C131_Partnumber1 ~= nil) then 
	engine.StatPoint=DString_C131_Partnumber1;
        end 
        
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP387" type="8" flags="105"/>
</Activity>
<Activity id="22" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="14" right="306" bottom="46"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="读硬件号">
<Rect left="360" top="64" right="460" bottom="96"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP388" type="8" flags="105"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="延时300MS">
<Rect left="360" top="114" right="460" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="28" ActivityType="4" flags="0" name="路由节点">
<Rect left="394" top="14" right="426" bottom="46"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="14" right="666" bottom="46"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="14" right="536" bottom="46"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="480" top="64" right="580" bottom="96"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP389" type="8" flags="105"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="延时300MS">
<Rect left="470" top="114" right="570" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="764" top="14" right="796" bottom="46"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="730" top="64" right="830" bottom="96"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="03.19#08";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
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
end</Script><assessment no="5" name="DEP391" type="8" flags="105"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="读软件号">
<Rect left="600" top="64" right="700" bottom="96"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP390" type="8" flags="105"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="延时300MS">
<Rect left="600" top="114" right="700" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="延时300MS">
<Rect left="730" top="124" right="830" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1250" top="64" right="1350" bottom="96"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP392" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1250" top="114" right="1350" bottom="146"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读到VIN值:"..DString1);
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
end</Script><assessment no="7" name="DEP393" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="日期读取">
<Rect left="1370" top="114" right="1470" bottom="146"/>
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
<Rect left="1370" top="64" right="1470" bottom="96"/>
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
<Rect left="1284" top="14" right="1316" bottom="46"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="1404" top="14" right="1436" bottom="46"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="写配置码">
<Rect left="1490" top="74" right="1590" bottom="106"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP394" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1620" top="64" right="1720" bottom="96"/>
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
end</Script><assessment no="13" name="DEP395" type="8" flags="105"/>
</Activity>
<Activity id="91" ActivityType="4" flags="0" name="路由节点">
<Rect left="1524" top="14" right="1556" bottom="46"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1490" top="124" right="1590" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="1654" top="14" right="1686" bottom="46"/>
</Activity>
<Activity id="112" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="123" top="345" right="223" bottom="377"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xC2F1F1E4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="确定后备箱是关闭状态">
<Rect left="514" top="395" right="614" bottom="427"/>
<Line1Text Enable="1" Text="确定后备箱是关闭状态"/>
<Line2Text Enable="1" Text="OK?"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="关闭后备箱门">
<Rect left="515" top="445" right="615" bottom="477"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="按下再抬起行李箱室内开关(间隔时常大于500ms）"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x01)
if (aa==0x01) then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP750" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="后备箱锁状态">
<Rect left="515" top="490" right="615" bottom="522"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="后备箱锁状态"/>
<Script>#COMM 0x22 0x01 0x02
if (@3==0x01) then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end
engine.SetLineText(3,@4);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP753" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="后备箱灯状态">
<Rect left="515" top="536" right="615" bottom="568"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="后备箱灯状态"/>
<Script>#COMM 0x22 0x01 0x03
if (@3==0x01) then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP751" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="确定后备箱开启">
<Rect left="516" top="583" right="616" bottom="615"/>
<Line1Text Enable="1" Text="后备箱开启？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
</Script><assessment no="17" name="DEP1051" type="8" flags="97"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="检测失败">
<Rect left="402" top="398" right="502" bottom="430"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="确定后备箱是完全开启状态">
<Rect left="521" top="742" right="621" bottom="774"/>
<Line1Text Enable="1" Text="确定后备箱是完全开启状态"/>
<Line2Text Enable="1" Text="确定？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="130" ActivityType="3" flags="0" name="检测失败">
<Rect left="406" top="743" right="506" bottom="775"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="681" right="586" bottom="713"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="按下行李箱门内侧开关">
<Rect left="520" top="789" right="620" bottom="821"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="按下再抬起行李箱内侧开关(间隔时常大于500ms）"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x04)
if (aa==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP754" type="8" flags="97"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="行李箱开启状态">
<Rect left="519" top="836" right="619" bottom="868"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="行李箱开启状态"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x05) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(2,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP755" type="8" flags="97"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="检测失败">
<Rect left="406" top="837" right="506" bottom="869"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="检测失败">
<Rect left="406" top="789" right="506" bottom="821"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="139" ActivityType="3" flags="0" name="行李箱门关闭一段距离后停止">
<Rect left="520" top="886" right="620" bottom="918"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="行李箱关闭一半时，阻止关门"/>
<Line2Text Enable="1" Text="行李箱门停止，蜂鸣器响"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x01
engine.println("防夹")
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP1053" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="检测失败">
<Rect left="406" top="885" right="506" bottom="917"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="检查防夹报警输出状态">
<Rect left="519" top="938" right="619" bottom="970"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="检查防夹报警输出状态"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x06
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP758" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="检测失败">
<Rect left="405" top="941" right="505" bottom="973"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="143" ActivityType="3" flags="0" name="再次按下行李箱内侧开关">
<Rect left="520" top="986" right="620" bottom="1018"/>
<Line1Text Enable="1" Text="再次按下行李箱内侧开关"/>
<Line2Text Enable="1" Text="行李箱开启了吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=行李箱关闭了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=行李箱关闭了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="23" name="DEP1054" type="8" flags="97"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="确定后备箱是关闭状态，车门是解锁状态">
<Rect left="521" top="1103" right="621" bottom="1135"/>
<Line1Text Enable="1" Text="行李箱处于关闭状态、四个车门均处于解锁状态"/>
<Line2Text Enable="1" Text="确定？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="627" top="488" right="659" bottom="520"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="636" top="903" right="668" bottom="935"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="检测失败">
<Rect left="410" top="1102" right="510" bottom="1134"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="150" ActivityType="3" flags="0" name="按下行李箱门外侧开关">
<Rect left="522" top="1149" right="622" bottom="1181"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="按下行李箱外侧开关(按下时间大于500ms）"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x04
local aa=bit32.band(@3,0x02)
if (aa==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP760" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="行李箱开启状态">
<Rect left="523" top="1198" right="623" bottom="1230"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="行李箱开启状态"/>
<Script>#COMM 0x22 0x01 0x01
if (@3==0x04) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP755" type="8" flags="97"/>
</Activity>
<Activity id="153" ActivityType="3" flags="0" name="行李箱门关闭一段距离后停止">
<Rect left="522" top="1247" right="622" bottom="1279"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="行李箱开启一半时，阻止开门"/>
<Line2Text Enable="1" Text="行李箱停止，蜂鸣器响"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x01
--engine.println("防撞")
if (@3==0x00) then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP1055" type="8" flags="97"/>
</Activity>
<Activity id="154" ActivityType="3" flags="0" name="检查防撞报警输出状态">
<Rect left="523" top="1297" right="623" bottom="1329"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="检查防撞报警输出状态"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x07
--engine.println("防撞警报")
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(3,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --engine.TestResult = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@4);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP761" type="8" flags="97"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="再次按下行李箱内侧开关">
<Rect left="523" top="1344" right="623" bottom="1376"/>
<Line1Text Enable="1" Text="再次按下行李箱外侧开关"/>
<Line2Text Enable="1" Text="行李箱关闭了吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script><assessment no="28" name="DEP759" type="8" flags="97"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="携带智能钥匙，触发脚踢开关">
<Rect left="522" top="1446" right="622" bottom="1478"/>
<Line1Text Enable="1" Text="请下电，确保行李箱处于关闭状态"/>
<Line2Text Enable="1" Text="携带智能钥匙，触发脚踢开关"/>
<Line3Text Enable="1" Text="行李箱开启了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(2,"#L=行李箱开启了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(2,"#L=行李箱开启了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="29" name="DEP762" type="8" flags="97"/>
</Activity>
<Activity id="157" ActivityType="3" flags="0" name="检测失败">
<Rect left="410" top="1150" right="510" bottom="1182"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="158" ActivityType="3" flags="0" name="检测失败">
<Rect left="411" top="1199" right="511" bottom="1231"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="检测失败">
<Rect left="411" top="1247" right="511" bottom="1279"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="161" ActivityType="3" flags="0" name="检测失败">
<Rect left="411" top="1300" right="511" bottom="1332"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="检测失败">
<Rect left="411" top="1343" right="511" bottom="1375"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="164" ActivityType="4" flags="0" name="路由节点">
<Rect left="556" top="1395" right="588" bottom="1427"/>
</Activity>
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="655" top="1189" right="687" bottom="1221"/>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="555" top="1046" right="587" bottom="1078"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="按遥控钥匙行李箱关闭开关">
<Rect left="522" top="1591" right="622" bottom="1623"/>
<Line1Text Enable="1" Text="确保行李箱处于关闭状态"/>
<Line2Text Enable="1" Text="关闭行李箱"/>
<Line3Text Enable="1" Text="OK？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="168" ActivityType="3" flags="0" name="使用智能钥匙，打开行李箱">
<Rect left="522" top="1639" right="622" bottom="1671"/>
<Line1Text Enable="1" Text="下电，行李箱处于关闭状态"/>
<Line2Text Enable="1" Text="按下遥控钥匙行李箱开启按钮大于2s"/>
<Line3Text Enable="1" Text="行李箱开启了吗，行李箱点亮了吗？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=行李箱开启了吗，行李箱点亮了吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=行李箱开启了吗，行李箱点亮了吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="30" name="DEP763" type="8" flags="97"/>
</Activity>
<Activity id="170" ActivityType="4" flags="0" name="路由节点">
<Rect left="557" top="1494" right="589" bottom="1526"/>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="522" top="1736" right="622" bottom="1768"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="173" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="1615" right="696" bottom="1647"/>
</Activity>
<Activity id="174" ActivityType="4" flags="0" name="路由节点">
<Rect left="647" top="1447" right="679" bottom="1479"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="549" top="348" right="581" bottom="380"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="检测失败">
<Rect left="400" top="536" right="500" bottom="568"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="通讯">
<Rect left="123" top="153" right="223" bottom="185"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1757" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9" top="154" right="109" bottom="186"/>
<Line1Text Enable="1" Text="PLGM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="42" top="1807" right="74" bottom="1839"/>
</Activity>
<Activity id="180" ActivityType="3" flags="0" name="结束通讯">
<Rect left="8" top="106" right="108" bottom="138"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="181" ActivityType="4" flags="0" name="路由节点">
<Rect left="556" top="1543" right="588" bottom="1575"/>
</Activity>
<Activity id="185" ActivityType="3" flags="0" name="确定后备箱灯点亮">
<Rect left="519" top="628" right="619" bottom="660"/>
<Line1Text Enable="1" Text="后备箱灯点亮？"/>
<Line2Text Enable="1" Text="确定？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
</Script><assessment no="33" name="DEP1052" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="14" right="1776" bottom="46"/>
</Activity>
<Activity id="191" ActivityType="3" flags="0" name="混动车型">
<Rect left="860" top="74" right="960" bottom="106"/>
<Script></Script></Activity>
<Activity id="192" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="860" top="114" right="960" bottom="146"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23")then
	  StandValue="168A2-9400-001-16";
          DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);	
	elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="168A2-9400-001-16";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);	
	else	       
          StandValue="168A2-9400-001-15";
          DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	end             
	StandValue1="YQHQ1-180425-S100";
        DString2=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue .. " or "..StandValue1);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("168A2-9400-001-14" == DString1)then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
                elseif(StandValue1==DString2) then
                        engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString2.."  "..StandValue1);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue .." or "..StandValue1;
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
</Script><assessment no="5" name="DEP391" type="8" flags="97"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="延时300MS">
<Rect left="860" top="164" right="960" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="194" ActivityType="4" flags="0" name="路由节点">
<Rect left="894" top="14" right="926" bottom="46"/>
</Activity>
<Activity id="195" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="244" right="1046" bottom="276"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="改脸">
<Rect left="980" top="74" right="1080" bottom="106"/>
<Script></Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="980" top="124" right="1080" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30")then
		StandValue="168A2-9400-001-16";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="168A2-9400-001-16";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="168A2-9400-001-16";
                DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="168A2-9400-001-16";
                DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="168A2-9400-001-16";
                DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	else
		--StandValue="168A2-9400-001-15";
                StandValue="168A2-9400-001-16";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	end
        StandValue1="YQHQ1-180425-S110";
        DString2=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue .. " or "..StandValue1);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("168A2-9400-001-14" == DString1)then
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
                elseif(StandValue1==DString2) then
                        engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString2.."  "..StandValue1);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue .." or "..StandValue1;
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
</Script><assessment no="5" name="DEP391" type="8" flags="105"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="延时300MS">
<Rect left="980" top="174" right="1080" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="199" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="14" right="1046" bottom="46"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1490" top="244" right="1590" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="202" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1490" top="184" right="1590" bottom="216"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x11 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP1282" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="19年型">
<Rect left="1110" top="74" right="1210" bottom="106"/>
<Script></Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1110" top="254" right="1210" bottom="286"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue= "168A2-9400-001-16"
        StandValue1 = "YQHQ1-180425-S110"
        engine.println("软件版本号标准值:"..StandValue);
        engine.println("软件版本号标准值1:"..StandValue1);
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
                DString1 = engine.GetResponseString(3,-1);
		engine.SetLineText(3,DString1);
		engine.println("软件版本号:"..DString1);
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		elseif(StandValue1==DString1) then
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString2.."  "..StandValue1);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
                        engine.StatValue=DString1;
			engine.StatPoint=StandValue;
		end

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
end</Script><assessment no="5" name="DEP391" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1110" top="174" right="1210" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="1144" top="14" right="1176" bottom="46"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1110" top="124" right="1210" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue= "168A2-9400-001-16";
StandValue1="YQHQ1-180425-S110";
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1QM30" or DString_C131_Car_Tpye=="CH1QM40" or DString_C131_Car_Tpye=="CH1QM50" or DString_C131_Car_Tpye=="CNDA01A" or DString_C131_Car_Tpye == "CH1PM30" or DString_C131_Car_Tpye == "CH1PM20")then

        DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(1,StandValue);
        engine.SetLineText(2,StandValue1);
	engine.println("软件版本号标准值:"..StandValue .. " or "..StandValue1);
	--engine.SetLineText(3,DString1);
	engine.println("获取软件版本号:"..DString1);
	if(StandValue == DString1 or StandValue1 == DString1)then                                
		engine.LastError = 0;
		engine.println("比对软件版本号成功:"..DString1);   
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对软件版本号失败"..DString1);
	end
                engine.StatValue=DString1;
		engine.StatPoint=StandValue .." or "..StandValue1;     
	else
              engine.LastError = 0;
              engine.println("不比对软件版本号");
	end

else
	engine.LastError = 1;
	engine.TestResult = 1;
        DString2=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.StatValue=DString2
end</Script><assessment no="5" name="DEP391" type="8" flags="105"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="10" type="0">
</Transition>
<Transition StartId="3" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="175" type="0">
</Transition>
<Transition StartId="10" EndId="177" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="112" type="0">
</Transition>
<Transition StartId="14" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="28" type="0">
</Transition>
<Transition StartId="22" EndId="21" type="1">
<Expression>C131_PLGM_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="22" EndId="28" type="0">
</Transition>
<Transition StartId="25" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="30" type="0">
</Transition>
<Transition StartId="28" EndId="25" type="1">
<Expression>C131_PLGM_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="28" EndId="30" type="0">
</Transition>
<Transition StartId="29" EndId="49" type="1">
<Expression>C131_PLGM_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="29" EndId="42" type="0">
</Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="1">
<Expression>C131_PLGM_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="29" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="1">
<Expression>C131_PLGM_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="42" EndId="194" type="0">
</Transition>
<Transition StartId="43" EndId="61" type="0">
</Transition>
<Transition StartId="49" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="42" type="0">
</Transition>
<Transition StartId="61" EndId="195" type="0">
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
<Expression>C131_PLGM_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="74" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="72" type="1">
<Expression>C131_PLGM_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="85" EndId="91" type="0">
</Transition>
<Transition StartId="89" EndId="110" type="0">
</Transition>
<Transition StartId="90" EndId="190" type="0">
</Transition>
<Transition StartId="91" EndId="89" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_PLGM_WD_Execute_Flag == true) and VMTLOC ~= "RIN")  </Expression></Transition>
<Transition StartId="91" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="202" type="0">
</Transition>
<Transition StartId="111" EndId="90" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PLGM_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="111" EndId="190" type="0">
</Transition>
<Transition StartId="112" EndId="14" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="6">
</Transition>
<Transition StartId="117" EndId="127" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="176" type="4">
</Transition>
<Transition StartId="124" EndId="126" type="3">
</Transition>
<Transition StartId="126" EndId="185" type="0">
</Transition>
<Transition StartId="127" EndId="118" type="0">
</Transition>
<Transition StartId="129" EndId="130" type="0">
</Transition>
<Transition StartId="129" EndId="132" type="6">
</Transition>
<Transition StartId="130" EndId="132" type="0">
</Transition>
<Transition StartId="131" EndId="129" type="1">
<Expression>C131_PLGM_Anti_Pinch_Execute_Flag == true</Expression></Transition>
<Transition StartId="131" EndId="148" type="0">
</Transition>
<Transition StartId="132" EndId="135" type="4">
</Transition>
<Transition StartId="132" EndId="133" type="3">
</Transition>
<Transition StartId="133" EndId="134" type="4">
</Transition>
<Transition StartId="133" EndId="139" type="3">
</Transition>
<Transition StartId="134" EndId="139" type="0">
</Transition>
<Transition StartId="135" EndId="133" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="4">
</Transition>
<Transition StartId="139" EndId="141" type="3">
</Transition>
<Transition StartId="140" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="4">
</Transition>
<Transition StartId="141" EndId="143" type="3">
</Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="143" EndId="166" type="0">
</Transition>
<Transition StartId="146" EndId="149" type="0">
</Transition>
<Transition StartId="146" EndId="150" type="6">
</Transition>
<Transition StartId="147" EndId="131" type="0">
</Transition>
<Transition StartId="148" EndId="166" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="151" type="3">
</Transition>
<Transition StartId="150" EndId="157" type="4">
</Transition>
<Transition StartId="151" EndId="153" type="3">
</Transition>
<Transition StartId="151" EndId="158" type="4">
</Transition>
<Transition StartId="153" EndId="160" type="4">
</Transition>
<Transition StartId="153" EndId="154" type="3">
</Transition>
<Transition StartId="154" EndId="161" type="4">
</Transition>
<Transition StartId="154" EndId="155" type="3">
</Transition>
<Transition StartId="155" EndId="162" type="0">
</Transition>
<Transition StartId="155" EndId="164" type="6">
</Transition>
<Transition StartId="156" EndId="170" type="0">
</Transition>
<Transition StartId="157" EndId="151" type="0">
</Transition>
<Transition StartId="158" EndId="153" type="0">
</Transition>
<Transition StartId="160" EndId="154" type="0">
</Transition>
<Transition StartId="161" EndId="155" type="0">
</Transition>
<Transition StartId="162" EndId="164" type="0">
</Transition>
<Transition StartId="164" EndId="156" type="1">
<Expression>C131_PLGM_Open_With_Kick_Execute_Flag == true</Expression></Transition>
<Transition StartId="164" EndId="174" type="0">
</Transition>
<Transition StartId="165" EndId="164" type="0">
</Transition>
<Transition StartId="166" EndId="146" type="1">
<Expression>C131_PLGM_Anti_Collsion_Execute_Flag == true</Expression></Transition>
<Transition StartId="166" EndId="165" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="172" type="0">
</Transition>
<Transition StartId="170" EndId="173" type="0">
</Transition>
<Transition StartId="170" EndId="181" type="0">
</Transition>
<Transition StartId="172" EndId="1" type="0">
</Transition>
<Transition StartId="173" EndId="172" type="0">
</Transition>
<Transition StartId="174" EndId="170" type="0">
</Transition>
<Transition StartId="175" EndId="117" type="1">
<Expression>C131_PLGM_Open_With_Button_Execute_Flag == true</Expression></Transition>
<Transition StartId="175" EndId="147" type="0">
</Transition>
<Transition StartId="176" EndId="126" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="4">
</Transition>
<Transition StartId="177" EndId="3" type="3">
</Transition>
<Transition StartId="178" EndId="180" type="0">
</Transition>
<Transition StartId="178" EndId="179" type="5">
</Transition>
<Transition StartId="179" EndId="1" type="0">
</Transition>
<Transition StartId="180" EndId="10" type="0">
</Transition>
<Transition StartId="181" EndId="167" type="1">
<Expression>C131_PLGM_Open_With_Key_Execute_Flag == true</Expression></Transition>
<Transition StartId="185" EndId="131" type="0">
</Transition>
<Transition StartId="190" EndId="9" type="0">
</Transition>
<Transition StartId="191" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="195" type="0">
</Transition>
<Transition StartId="194" EndId="191" type="1">
<Expression>C131_PLGM_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="194" EndId="199" type="0">
</Transition>
<Transition StartId="195" EndId="74" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="195" type="0">
</Transition>
<Transition StartId="199" EndId="196" type="1">
<Expression>C131_PLGM_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="199" EndId="206" type="0">
</Transition>
<Transition StartId="200" EndId="111" type="0">
</Transition>
<Transition StartId="202" EndId="200" type="0">
</Transition>
<Transition StartId="203" EndId="207" type="0">
</Transition>
<Transition StartId="205" EndId="195" type="0">
</Transition>
<Transition StartId="206" EndId="203" type="1">
<Expression>C131_PLGM_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="206" EndId="74" type="0">
</Transition>
<Transition StartId="207" EndId="205" type="0">
</Transition>
</Transitions>
</Process>

