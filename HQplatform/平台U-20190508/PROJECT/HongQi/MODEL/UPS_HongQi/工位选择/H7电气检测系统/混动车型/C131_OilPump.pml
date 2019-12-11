<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1139" pbltext="DEP825">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_OilPump_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_OilPump_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_OilPump_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_OilPump_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_OilPump_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_OilPump_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_OilPump_SpeedControl_Execute_Flag" type="11" dir="0" data="false"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7B1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7D1" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="129" right="229" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1244" top="596" right="1344" bottom="628"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="油泵系统">
<Rect left="129" top="55" right="229" bottom="87"/>
<TitleText Enable="1" Text="油泵系统（OilPump）"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="128" top="215" right="228" bottom="247"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP827" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="130" top="105" right="230" bottom="137"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="128" top="268" right="228" bottom="300"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="33" name="DEP1108" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="127" top="320" right="227" bottom="352"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3303" name="DEP66" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="126" top="424" right="226" bottom="456"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP828" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="268" top="65" right="368" bottom="97"/>
<Line1Text Enable="1" Text="比对零件号"/>
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
end</Script><assessment no="4" name="DEP829" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="302" top="11" right="334" bottom="43"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="442" top="12" right="474" bottom="44"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读软件号">
<Rect left="408" top="64" right="508" bottom="96"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP830" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="407" top="112" right="507" bottom="144"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="551" top="65" right="651" bottom="97"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="V2.3";
engine.println("软件版本号标准值:"..StandValue); 
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("V2.3" == DString1)then
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
end</Script><assessment no="6" name="DEP831" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="551" top="115" right="651" bottom="147"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="11" right="616" bottom="43"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="687" top="63" right="787" bottom="95"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP832" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="686" top="166" right="786" bottom="198"/>
<Line1Text Enable="1" Text="读VIN码"/>
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
end</Script><assessment no="8" name="DEP833" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="读日期">
<Rect left="847" top="166" right="947" bottom="198"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="写日期">
<Rect left="848" top="67" right="948" bottom="99"/>
<Line1Text Enable="1" Text="写日期"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="9" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="721" top="9" right="753" bottom="41"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="延时300ms">
<Rect left="1014" top="114" right="1114" bottom="146"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1131" top="65" right="1231" bottom="97"/>
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
end</Script><assessment no="12" name="DEP835" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="写配置码">
<Rect left="1015" top="64" right="1115" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2bin(VariCoding)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP834" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="1048" top="9" right="1080" bottom="41"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="883" top="10" right="915" bottom="42"/>
</Activity>
<Activity id="31" ActivityType="4" flags="0" name="路由节点">
<Rect left="1166" top="10" right="1198" bottom="42"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1244" top="517" right="1344" bottom="549"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="延时300MS">
<Rect left="686" top="115" right="786" bottom="147"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="847" top="117" right="947" bottom="149"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="56" ActivityType="13" flags="0" name="seedtokey">
<Rect left="127" top="373" right="227" bottom="405"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x7D9BAC8E"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="通讯">
<Rect left="129" top="160" right="229" bottom="192"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP826" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="通讯失败">
<Rect left="12" top="157" right="112" bottom="189"/>
<Line1Text Enable="1" Text="OilPump 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="结束通讯">
<Rect left="12" top="102" right="112" bottom="134"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="Check the auxilary oil pump motor">
<Rect left="208" top="1150" right="308" bottom="1182"/>
<Script></Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="普通节点">
<Rect left="207" top="1204" right="307" bottom="1236"/>
<Line1Text Enable="1" Text="请启动发动机，并挂到N档"/>
<Line2Text Enable="1" Text="OK？"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="控制转速到1500rpm">
<Rect left="206" top="1257" right="306" bottom="1289"/>
<Line1Text Enable="1" Text="自动控制"/>
<Line2Text Enable="1" Text="转速增加到1500rpm"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f 0x01 0x25 0x03 0x0e
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP891" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="读取转速">
<Rect left="207" top="1308" right="307" bottom="1340"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="读取转速"/>
<Script>#COMM 0x22 0x01 0x33
if(@0==0x62)then
speedValue=@3*100;
if(speedValue&gt;=1450 and speedValue&lt;=1550)then
  engine.LastError = 0;
  engine.println("控制转速成功");
  engine.StatValue=speedValue;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("控制转速失败");
  engine.StatValue=speedValue;
  engine.StatLower=1450;
  engine.StatUpper=1550;
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP893" type="8" flags="97"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="取消控制转速到1500rpm">
<Rect left="207" top="1362" right="307" bottom="1394"/>
<Line1Text Enable="1" Text="取消自动控制"/>
<Line2Text Enable="1" Text="转速增加到1500rpm"/>
<Script>#COMM 0x2f 0x01 0x25 0x00 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="15" name="DEP892" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="读取转速">
<Rect left="207" top="1415" right="307" bottom="1447"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="读取转速"/>
<Script>#COMM 0x22 0x01 0x33
speedValue=@3*100;
if(speedValue&gt;=0 and speedValue&lt;=10)then
  engine.LastError = 0;
  engine.println("取消控制转速成功");
  engine.StatValue=speedValue;
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.println("取消控制转速失败");
  engine.StatValue=speedValue;
  engine.StatLower=0;
  engine.StatUpper=10;
end</Script><assessment no="16" name="DEP894" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="检测结束请重新上电！">
<Rect left="207" top="1467" right="307" bottom="1499"/>
<Line1Text Enable="1" Text="检测结束请重新上电！"/>
<Line2Text Enable="1" Text="OK？"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="70" ActivityType="4" flags="0" name="路由节点">
<Rect left="1277" top="9" right="1309" bottom="41"/>
</Activity>
<Activity id="71" ActivityType="4" flags="0" name="路由节点">
<Rect left="46" top="516" right="78" bottom="548"/>
</Activity>
<Activity id="72" ActivityType="4" flags="0" name="路由节点">
<Rect left="80" top="212" right="112" bottom="244"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="57" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="56" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="1">
<Expression>C131_OilPump_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_OilPump_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="19" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="24" type="0">
</Transition>
<Transition StartId="19" EndId="17" type="1">
<Expression>C131_OilPump_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="24" type="0">
</Transition>
<Transition StartId="20" EndId="37" type="0">
</Transition>
<Transition StartId="21" EndId="30" type="0">
</Transition>
<Transition StartId="22" EndId="29" type="0">
</Transition>
<Transition StartId="23" EndId="38" type="0">
</Transition>
<Transition StartId="24" EndId="20" type="1">
<Expression>C131_OilPump_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="26" EndId="31" type="0">
</Transition>
<Transition StartId="27" EndId="70" type="0">
</Transition>
<Transition StartId="28" EndId="26" type="0">
</Transition>
<Transition StartId="29" EndId="28" type="1">
<Expression>C131_OilPump_WD_Execute_Flag==true and DString_C131_VariCoding~="" and DString_C131_VariCoding~="OLP00_varicoding" and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_OilPump_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="31" EndId="27" type="1">
<Expression>(C131_OilPump_WD_Execute_Flag==true or VMTLOC=="FIN") and DString_C131_VariCoding~="" and DString_C131_VariCoding~="OLP00_varicoding"</Expression></Transition>
<Transition StartId="31" EndId="70" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="56" EndId="8" type="0">
</Transition>
<Transition StartId="57" EndId="4" type="3">
</Transition>
<Transition StartId="57" EndId="58" type="4">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="58" EndId="71" type="5">
</Transition>
<Transition StartId="59" EndId="5" type="0">
</Transition>
<Transition StartId="60" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="69" type="0">
</Transition>
<Transition StartId="70" EndId="36" type="0">
</Transition>
<Transition StartId="71" EndId="36" type="0">
</Transition>
<Transition StartId="72" EndId="4" type="1">
<Expression>VMTLOC~="FIN"</Expression></Transition>
<Transition StartId="72" EndId="6" type="0">
</Transition>
</Transitions>
</Process>

