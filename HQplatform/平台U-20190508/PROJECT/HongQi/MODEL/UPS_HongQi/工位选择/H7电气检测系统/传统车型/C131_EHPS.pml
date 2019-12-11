<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1119" pbltext="DEP4">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_EHPS_Motor_Speed_Ctrl_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_EHPS_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C1" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="114" top="12" right="214" bottom="44"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="338" top="754" right="438" bottom="786"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="电子助力转向 (EHPS)">
<Rect left="115" top="60" right="215" bottom="92"/>
<TitleText Enable="1" Text="电子液压助力转向（EHPS）"/>
<Script>engine.println("DString_C131_Partnumber_ehps:"..DString_C131_Partnumber);
engine.println("DString_C131_VariCoding_ehps:"..DString_C131_VariCoding);</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="118" top="201" right="218" bottom="233"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3401" name="DEP5" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="助力泵开">
<Rect left="470" top="571" right="570" bottom="603"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="助力泵开"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>--#COMM 0x31 0x01 0x02 0x00 0x16 0x3f
#COMM 0x31 0x01 0x02 0x00 0x16 0xA8
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);





</Script><assessment no="12" name="DEP790" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="EHPS 读助力泵转速">
<Rect left="470" top="630" right="570" bottom="662"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="读助力泵转速"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x03 0x02 0x00
if(@0==0x71)then
resu =(@4*256+@5)*1.0+0.0;

if (5650&lt;resu and resu&lt;5950) then
  engine.LastError = 0;
  engine.StatValue=resu;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=resu;
  engine.StatLower=5650.0;
  engine.StatUpper=5950.0;
end
--engine.SetLineText(3,"转速"..resu);
engine.SetLineText(3,"#L=BMPBAR,".."5650.0"..",".."5950.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="13" name="DEP7" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="EHPS 结束控制助力泵">
<Rect left="470" top="691" right="570" bottom="723"/>
<Line1Text Enable="1" Text="助力泵关"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x02 0x02 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP9" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="339" top="692" right="439" bottom="724"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="检测失败">
<Rect left="585" top="628" right="685" bottom="660"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="连接ECU">
<Rect left="120" top="114" right="220" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="切诊断">
<Rect left="118" top="248" right="218" bottom="280"/>
<Script>--#COMM 0x10 0x03
#COMM 0x10 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3402" name="DEP1075" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="118" top="296" right="218" bottom="328"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3417" name="DEP195" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="发送key">
<Rect left="119" top="394" right="219" bottom="426"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3418" name="DEP6" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="13" flags="0" name="计算key">
<Rect left="119" top="344" right="219" bottom="376"/>
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
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="501" top="328" right="533" bottom="360"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="比对零件号">
<Rect left="250" top="74" right="350" bottom="106"/>
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
</Script><assessment no="1" name="DEP306" type="8" flags="105"/>
</Activity>
<Activity id="36" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="24" right="316" bottom="56"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="读硬件号">
<Rect left="370" top="74" right="470" bottom="106"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP307" type="8" flags="105"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="延时300MS">
<Rect left="370" top="134" right="470" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="404" top="24" right="436" bottom="56"/>
</Activity>
<Activity id="41" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="24" right="696" bottom="56"/>
</Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="24" right="576" bottom="56"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="510" top="74" right="610" bottom="106"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@15);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP308" type="8" flags="105"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="延时300MS">
<Rect left="510" top="124" right="610" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="读软件号">
<Rect left="630" top="74" right="730" bottom="106"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP309" type="8" flags="105"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="延时300MS">
<Rect left="630" top="124" right="730" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="750" top="74" right="850" bottom="106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="0603";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=hexstr(@3-@4);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0603" == DString1)then
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
end</Script><assessment no="5" name="DEP310" type="8" flags="105"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="延时300MS">
<Rect left="750" top="124" right="850" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="63" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="24" right="816" bottom="56"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1250" top="74" right="1350" bottom="106"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP311" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1250" top="124" right="1350" bottom="156"/>
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
end</Script><assessment no="7" name="DEP312" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="日期读取">
<Rect left="1370" top="124" right="1470" bottom="156"/>
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
<Activity id="68" ActivityType="3" flags="0" name="发送时间">
<Rect left="1370" top="74" right="1470" bottom="106"/>
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
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="1284" top="24" right="1316" bottom="56"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1600" top="124" right="1700" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1490" top="124" right="1590" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1600" top="74" right="1700" bottom="106"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码:"..DString_C131_VariCoding);
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

</Script><assessment no="11" name="DEP367" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="写配置码">
<Rect left="1490" top="74" right="1590" bottom="106"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP313" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="1524" top="24" right="1556" bottom="56"/>
</Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="1404" top="24" right="1436" bottom="56"/>
</Activity>
<Activity id="79" ActivityType="4" flags="0" name="路由节点">
<Rect left="1634" top="24" right="1666" bottom="56"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="通讯失败">
<Rect top="164" right="100" bottom="196"/>
<Line1Text Enable="1" Text="EHPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="36" top="691" right="68" bottom="723"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="切诊断">
<Rect left="466" top="373" right="566" bottom="405"/>
<Script>--#COMM 0x10 0x03
#COMM 0x10 0x03</Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="466" top="424" right="566" bottom="456"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3417" name="DEP195" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="发送key">
<Rect left="471" top="519" right="571" bottom="551"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3418" name="DEP6" type="8" flags="97"/>
</Activity>
<Activity id="86" ActivityType="13" flags="0" name="计算key">
<Rect left="468" top="472" right="568" bottom="504"/>
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
<Activity id="87" ActivityType="3" flags="0" name="结束通讯">
<Rect top="109" right="100" bottom="141"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="88" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="24" right="1776" bottom="56"/>
</Activity>
<Activity id="89" ActivityType="4" flags="0" name="路由节点">
<Rect left="373" top="327" right="405" bottom="359"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="混动车型">
<Rect left="1000" top="74" right="1100" bottom="106"/>
<Script></Script></Activity>
<Activity id="93" ActivityType="4" flags="0" name="路由节点">
<Rect left="1034" top="24" right="1066" bottom="56"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1000" top="124" right="1100" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="0603";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=hexstr(@3-@4);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0603" == DString1)then
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
</Script><assessment no="5" name="DEP310" type="8" flags="105"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1000" top="174" right="1100" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="97" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="244" right="1186" bottom="276"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="334" right="1776" bottom="366"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="改脸">
<Rect left="1120" top="74" right="1220" bottom="106"/>
<Script></Script></Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="24" right="1186" bottom="56"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1120" top="124" right="1220" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="0603";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="0603";
         elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="0603";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="0603";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="0603";
	else
		StandValue="0603";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=hexstr(@3-@4);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0603" == DString1)then
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
</Script><assessment no="5" name="DEP310" type="8" flags="105"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1120" top="174" right="1220" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="19年型">
<Rect left="870" top="74" right="970" bottom="106"/>
<Script></Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="870" top="124" right="970" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="0603";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=hexstr(@3-@4);
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
</Script><assessment no="5" name="DEP310" type="8" flags="105"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="延时300MS">
<Rect left="870" top="174" right="970" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="108" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="24" right="936" bottom="56"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="22" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="4" EndId="24" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="3">
</Transition>
<Transition StartId="17" EndId="20" type="4">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="2" type="0">
</Transition>
<Transition StartId="20" EndId="18" type="0">
</Transition>
<Transition StartId="22" EndId="4" type="0">
</Transition>
<Transition StartId="22" EndId="87" type="4">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="28" type="0">
</Transition>
<Transition StartId="27" EndId="36" type="0">
</Transition>
<Transition StartId="28" EndId="27" type="0">
</Transition>
<Transition StartId="28" EndId="27" type="0">
</Transition>
<Transition StartId="31" EndId="83" type="1">
<Expression>C131_EHPS_Motor_Speed_Ctrl_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="89" type="0">
</Transition>
<Transition StartId="35" EndId="40" type="0">
</Transition>
<Transition StartId="36" EndId="40" type="0">
</Transition>
<Transition StartId="36" EndId="35" type="1">
<Expression>C131_EHPS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="37" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="42" type="0">
</Transition>
<Transition StartId="40" EndId="37" type="1">
<Expression>C131_EHPS_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="40" EndId="42" type="0">
</Transition>
<Transition StartId="41" EndId="52" type="1">
<Expression>C131_EHPS_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="41" EndId="63" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="1">
<Expression>C131_EHPS_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="42" EndId="41" type="0">
</Transition>
<Transition StartId="43" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="41" type="0">
</Transition>
<Transition StartId="52" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="63" type="0">
</Transition>
<Transition StartId="59" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="97" type="0">
</Transition>
<Transition StartId="63" EndId="59" type="1">
<Expression>C131_EHPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="63" EndId="108" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="78" type="0">
</Transition>
<Transition StartId="66" EndId="77" type="0">
</Transition>
<Transition StartId="68" EndId="66" type="0">
</Transition>
<Transition StartId="69" EndId="64" type="1">
<Expression>C131_EHPS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="69" EndId="78" type="0">
</Transition>
<Transition StartId="72" EndId="88" type="0">
</Transition>
<Transition StartId="73" EndId="79" type="0">
</Transition>
<Transition StartId="74" EndId="72" type="0">
</Transition>
<Transition StartId="76" EndId="73" type="0">
</Transition>
<Transition StartId="77" EndId="76" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_EHPS_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="77" EndId="79" type="0">
</Transition>
<Transition StartId="78" EndId="68" type="1">
<Expression>C131_EHPS_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="78" EndId="77" type="0">
</Transition>
<Transition StartId="79" EndId="74" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_EHPS_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="79" EndId="88" type="0">
</Transition>
<Transition StartId="81" EndId="87" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="5">
</Transition>
<Transition StartId="82" EndId="19" type="0">
</Transition>
<Transition StartId="83" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="86" type="0">
</Transition>
<Transition StartId="85" EndId="16" type="0">
</Transition>
<Transition StartId="86" EndId="85" type="0">
</Transition>
<Transition StartId="88" EndId="100" type="0">
</Transition>
<Transition StartId="89" EndId="19" type="0">
</Transition>
<Transition StartId="90" EndId="95" type="0">
</Transition>
<Transition StartId="93" EndId="90" type="1">
<Expression>C131_EHPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="93" EndId="102" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="69" type="0">
</Transition>
<Transition StartId="100" EndId="31" type="0">
</Transition>
<Transition StartId="101" EndId="103" type="0">
</Transition>
<Transition StartId="102" EndId="101" type="1">
<Expression>C131_EHPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="102" EndId="69" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="97" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="97" type="0">
</Transition>
<Transition StartId="108" EndId="93" type="0">
</Transition>
<Transition StartId="108" EndId="105" type="1">
<Expression>C131_EHPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

