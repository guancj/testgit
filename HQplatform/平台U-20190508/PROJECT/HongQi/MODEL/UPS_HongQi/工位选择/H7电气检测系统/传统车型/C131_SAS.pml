<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1116" pbltext="DEP79">
<Parameters>
<Variable id="C131_SAS_Funciton_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_SAS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SAS_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="P2Max" type="3" data="5000" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="2" right="102" bottom="32"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="634" top="1030" right="734" bottom="1062"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="转角传感器(SAS)">
<Rect left="1" top="58" right="101" bottom="90"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect top="198" right="100" bottom="230"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1507" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="左转速度手动确认">
<Rect left="632" top="423" right="732" bottom="455"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="向左打方向盘到极限位置"/>
<Line3Text Enable="1" Text="方向盘左转速度"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="检测失败">
<Rect left="497" top="919" right="597" bottom="951"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="SAS左转速度">
<Rect left="633" top="480" right="733" bottom="512"/>
<Strategy TotalTime="150" ExpectedTime="5" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Script>
#COMM 0x22 0xd1 0x02
if(@0==0x62)then

if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
LeftSensor=resu;
engine.println(" LeftSensor="..LeftSensor);

if (1&lt;LeftSensor and LeftSensor&lt;300) then
  engine.LastError = 0;
  engine.StatValue=LeftSensor;
--OK=OK+1; 
else
  engine.LastError = 1;
  engine.StatValue=LeftSensor;
  engine.StatLower=1;
  engine.StatUpper=300.0;
  --NOK=NOK+1;
end
--engine.SetLineText(3,LeftSensor);
engine.SetLineText(3,"#L=BMPBAR,".."1"..",".."300"..",".."1"..","..tostring(LeftSensor));

else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="12" name="DEP456" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="左转角度手动确认">
<Rect left="633" top="535" right="733" bottom="567"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="向左打方向盘到极限位置"/>
<Line3Text Enable="1" Text="方向盘左转极限位置"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="SAS 左转位置">
<Rect left="632" top="593" right="732" bottom="625"/>
<Strategy TotalTime="150" ExpectedTime="5" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Script>#COMM 0x22 0xd1 0x01
if(@0==0x62)then

if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
Lposition=resu;
engine.println("Lposition="..Lposition);
if (500&lt;Lposition and Lposition&lt;600) then
  engine.LastError = 0;
  engine.StatValue=Lposition;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=Lposition;
  engine.StatLower=500.0;
  engine.StatUpper=600.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,Lposition);
engine.SetLineText(3,"#L=BMPBAR,".."500"..",".."600"..",".."1"..","..tostring(Lposition));

else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="13" name="DEP457" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="右转速度手动确认">
<Rect left="632" top="648" right="732" bottom="680"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="向右打方向盘到极限位置"/>
<Line3Text Enable="1" Text="方向盘右转速度"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="SAS右转速度">
<Rect left="631" top="706" right="731" bottom="738"/>
<Strategy TotalTime="150" ExpectedTime="5" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Script>
#COMM 0x22 0xd1 0x02
if(@0==0x62)then

if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
RightSensor=resu;
engine.println("RightSensor="..RightSensor);
if (-300&lt;RightSensor and RightSensor&lt;-1) then
  engine.LastError = 0;
  engine.StatValue=RightSensor;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=RightSensor;
  engine.StatLower=-300.0;
  engine.StatUpper=-1.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,RightSensor);
engine.SetLineText(3,"#L=BMPBAR,".."-300"..",".."-1"..",".."1"..","..tostring(RightSensor));

else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP458" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="右转角度手动确认">
<Rect left="631" top="762" right="731" bottom="794"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="向右打方向盘到极限位置"/>
<Line3Text Enable="1" Text="方向盘右转极限位置"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="SAS 右转位置">
<Rect left="630" top="819" right="730" bottom="851"/>
<Strategy TotalTime="200" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>
#COMM 0x22 0xd1 0x01
if(@0==0x62)then

if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
Rposition=resu;
engine.println("Rposition="..Rposition);
if (-600&lt;Rposition and Rposition&lt;-500) then
  engine.LastError = 0;
  engine.StatValue=Rposition;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=Rposition;
  engine.StatLower=-600.0;
  engine.StatUpper=-500.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,Rposition);
engine.SetLineText(3,"#L=BMPBAR,".."-600"..",".."-500"..",".."1"..","..tostring(Rposition));

else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="15" name="DEP459" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="方向盘0角度状态手动确认">
<Rect left="633" top="867" right="733" bottom="899"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请摆正方向盘"/>
<Line3Text Enable="1" Text="方向盘0角度状态"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="SAS 0角度">
<Rect left="633" top="920" right="733" bottom="952"/>
<Strategy TotalTime="200" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>
#COMM 0x22 0xd1 0x01
if(@0==0x62)then

if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
Angle0=resu;
engine.println("Angle0="..Angle0);
if (-10&lt;Angle0 and Angle0&lt;10) then
  engine.LastError = 0;
  engine.StatValue=Angle0;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=Angle0;
  engine.StatLower=-10.0;
  engine.StatUpper=10.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,Angle0);
engine.SetLineText(3,"#L=BMPBAR,".."-10"..",".."10"..",".."1"..","..tostring(Angle0));

else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP460" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="清空行">
<Rect left="633" top="978" right="733" bottom="1010"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1" top="106" right="101" bottom="138"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="检测失败">
<Rect left="504" top="477" right="604" bottom="509"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="检测失败">
<Rect left="503" top="593" right="603" bottom="625"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="检测失败">
<Rect left="496" top="703" right="596" bottom="735"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="检测失败">
<Rect left="505" top="814" right="605" bottom="846"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="切诊断">
<Rect left="2" top="246" right="102" bottom="278"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1508" name="DEP1089" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="2" top="295" right="102" bottom="327"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1510" name="DEP83" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="13" flags="0" name="计算">
<Rect left="2" top="345" right="102" bottom="377"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x6C8A9B7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="39" ActivityType="4" flags="0" name="路由节点">
<Rect left="786" top="424" right="818" bottom="456"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="发送key">
<Rect left="2" top="398" right="102" bottom="430"/>
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

engine.Delay(150)</Script><assessment no="1511" name="DEP83" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="比对零件号">
<Rect left="220" top="58" right="320" bottom="90"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(3000)
#COMM 0x22 0xF1 0x87
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
end</Script><assessment no="1" name="DEP341" type="8" flags="105"/>
</Activity>
<Activity id="45" ActivityType="4" flags="0" name="路由节点">
<Rect left="255" top="4" right="287" bottom="36"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="读硬件号">
<Rect left="346" top="54" right="446" bottom="86"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP342" type="8" flags="105"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="延时300MS">
<Rect left="346" top="104" right="446" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="381" top="5" right="413" bottom="37"/>
</Activity>
<Activity id="50" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="3" right="666" bottom="35"/>
</Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="502" top="4" right="534" bottom="36"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="467" top="53" right="567" bottom="85"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@4);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP343" type="8" flags="105"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="延时300MS">
<Rect left="466" top="100" right="566" bottom="132"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="55" ActivityType="4" flags="0" name="路由节点">
<Rect left="767" top="4" right="799" bottom="36"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="732" top="55" right="832" bottom="87"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="0007";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0007" == DString1)then
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
</Script><assessment no="5" name="DEP345" type="8" flags="105"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="读软件号">
<Rect left="599" top="54" right="699" bottom="86"/>
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
</Script><assessment no="4" name="DEP344" type="8" flags="105"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="延时300MS">
<Rect left="599" top="107" right="699" bottom="139"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="延时300MS">
<Rect left="732" top="105" right="832" bottom="137"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1280" top="54" right="1380" bottom="86"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP346" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1280" top="114" right="1380" bottom="146"/>
<Line1Text Enable="1" Text="比对VIN码"/>
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
end</Script><assessment no="7" name="DEP347" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="日期读取">
<Rect left="1390" top="114" right="1490" bottom="146"/>
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
<Activity id="77" ActivityType="3" flags="0" name="发送时间">
<Rect left="1390" top="54" right="1490" bottom="86"/>
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
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="4" right="1346" bottom="36"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1800" top="424" right="1900" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1510" top="114" right="1610" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1660" top="54" right="1760" bottom="86"/>
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
end</Script><assessment no="11" name="DEP349" type="8" flags="97"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="写配置码">
<Rect left="1510" top="54" right="1610" bottom="86"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP348" type="8" flags="97"/>
</Activity>
<Activity id="86" ActivityType="4" flags="0" name="路由节点">
<Rect left="1544" top="4" right="1576" bottom="36"/>
</Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="4" right="1456" bottom="36"/>
</Activity>
<Activity id="88" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="4" right="1726" bottom="36"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="通讯">
<Rect left="1" top="152" right="101" bottom="184"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1506" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="通讯失败">
<Rect left="113" top="153" right="213" bottom="185"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="4" flags="0" name="路由节点">
<Rect left="148" top="979" right="180" bottom="1011"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="结束通讯">
<Rect left="111" top="110" right="211" bottom="142"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="94" ActivityType="4" flags="0" name="路由节点">
<Rect left="1834" top="4" right="1866" bottom="36"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="混动车型">
<Rect left="866" top="55" right="966" bottom="87"/>
<Script></Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="866" top="102" right="966" bottom="134"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="0007";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0007" == DString1)then
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
</Script><assessment no="5" name="DEP345" type="8" flags="105"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="延时300MS">
<Rect left="866" top="152" right="966" bottom="184"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="98" ActivityType="4" flags="0" name="路由节点">
<Rect left="900" top="4" right="932" bottom="36"/>
</Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="264" right="1076" bottom="296"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="改脸">
<Rect left="986" top="55" right="1086" bottom="87"/>
<Script></Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="986" top="102" right="1086" bottom="134"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="0007";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="0007";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="0007";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="0007";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="0007";
	else
		StandValue="0007";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("0007" == DString1)then
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
</Script><assessment no="5" name="DEP345" type="8" flags="105"/>
</Activity>
<Activity id="102" ActivityType="3" flags="0" name="延时300MS">
<Rect left="986" top="152" right="1086" bottom="184"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="103" ActivityType="4" flags="0" name="路由节点">
<Rect left="1020" top="5" right="1052" bottom="37"/>
</Activity>
<Activity id="104" ActivityType="3" flags="0" name="19年型">
<Rect left="1100" top="54" right="1200" bottom="86"/>
<Script></Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1100" top="104" right="1200" bottom="136"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="0007";
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
		engine.println("软件版本号标准值:"..StandValue);
		engine.SetLineText(3,DString1);
		DString1 = engine.GetResponseString(3,2+#StandValue);
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
end


</Script><assessment no="5" name="DEP345" type="8" flags="105"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1100" top="154" right="1200" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="191" ActivityType="4" flags="0" name="路由节点">
<Rect left="1134" top="4" right="1166" bottom="36"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="27" type="0">
</Transition>
<Transition StartId="3" EndId="33" type="0">
</Transition>
<Transition StartId="10" EndId="13" type="0">
</Transition>
<Transition StartId="11" EndId="26" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="3">
</Transition>
<Transition StartId="13" EndId="29" type="4">
</Transition>
<Transition StartId="14" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="20" type="3">
</Transition>
<Transition StartId="18" EndId="30" type="4">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="21" EndId="31" type="4">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="3">
</Transition>
<Transition StartId="23" EndId="32" type="4">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="3">
</Transition>
<Transition StartId="25" EndId="11" type="4">
</Transition>
<Transition StartId="26" EndId="1" type="0">
</Transition>
<Transition StartId="27" EndId="89" type="0">
</Transition>
<Transition StartId="29" EndId="14" type="0">
</Transition>
<Transition StartId="30" EndId="20" type="0">
</Transition>
<Transition StartId="31" EndId="22" type="0">
</Transition>
<Transition StartId="32" EndId="24" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="40" type="0">
</Transition>
<Transition StartId="39" EndId="26" type="0">
</Transition>
<Transition StartId="39" EndId="10" type="1">
<Expression>C131_SAS_Funciton_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="40" EndId="45" type="0">
</Transition>
<Transition StartId="44" EndId="49" type="0">
</Transition>
<Transition StartId="45" EndId="44" type="1">
<Expression>C131_SAS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="45" EndId="49" type="0">
</Transition>
<Transition StartId="46" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="51" type="0">
</Transition>
<Transition StartId="49" EndId="46" type="1">
<Expression>C131_SAS_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="49" EndId="51" type="0">
</Transition>
<Transition StartId="50" EndId="55" type="0">
</Transition>
<Transition StartId="50" EndId="61" type="1">
<Expression>C131_SAS_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="51" EndId="52" type="1">
<Expression>C131_SAS_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="51" EndId="50" type="0">
</Transition>
<Transition StartId="52" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="50" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="1">
<Expression>C131_SAS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="55" EndId="98" type="0">
</Transition>
<Transition StartId="56" EndId="65" type="0">
</Transition>
<Transition StartId="61" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="55" type="0">
</Transition>
<Transition StartId="65" EndId="99" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="87" type="0">
</Transition>
<Transition StartId="75" EndId="86" type="0">
</Transition>
<Transition StartId="77" EndId="75" type="0">
</Transition>
<Transition StartId="78" EndId="73" type="1">
<Expression>C131_SAS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="78" EndId="87" type="0">
</Transition>
<Transition StartId="81" EndId="39" type="0">
</Transition>
<Transition StartId="82" EndId="88" type="0">
</Transition>
<Transition StartId="83" EndId="94" type="0">
</Transition>
<Transition StartId="85" EndId="82" type="0">
</Transition>
<Transition StartId="86" EndId="85" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_SAS_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="86" EndId="88" type="0">
</Transition>
<Transition StartId="87" EndId="77" type="1">
<Expression>C131_SAS_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="87" EndId="86" type="0">
</Transition>
<Transition StartId="88" EndId="83" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_SAS_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="88" EndId="94" type="0">
</Transition>
<Transition StartId="89" EndId="3" type="3">
</Transition>
<Transition StartId="89" EndId="90" type="4">
</Transition>
<Transition StartId="90" EndId="92" type="0">
</Transition>
<Transition StartId="90" EndId="91" type="5">
</Transition>
<Transition StartId="91" EndId="26" type="0">
</Transition>
<Transition StartId="92" EndId="27" type="0">
</Transition>
<Transition StartId="94" EndId="81" type="0">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="99" type="0">
</Transition>
<Transition StartId="98" EndId="95" type="1">
<Expression>C131_SAS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="98" EndId="103" type="0">
</Transition>
<Transition StartId="99" EndId="78" type="0">
</Transition>
<Transition StartId="100" EndId="101" type="0">
</Transition>
<Transition StartId="101" EndId="102" type="0">
</Transition>
<Transition StartId="102" EndId="99" type="0">
</Transition>
<Transition StartId="103" EndId="100" type="1">
<Expression>C131_SAS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="103" EndId="191" type="0">
</Transition>
<Transition StartId="104" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="99" type="0">
</Transition>
<Transition StartId="191" EndId="104" type="1">
<Expression>C131_SAS_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="191" EndId="78" type="0">
</Transition>
</Transitions>
</Process>

