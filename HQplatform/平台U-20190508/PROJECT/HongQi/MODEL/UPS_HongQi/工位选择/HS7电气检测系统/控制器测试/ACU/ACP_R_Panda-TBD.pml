<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
<Variable id="DString_SoftwareVersionNumber" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x743" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x74B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="287" top="73" right="387" bottom="105"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1914" top="679" right="2014" bottom="711"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="后中控开关(ACP_R)">
<Rect left="287" top="129" right="387" bottom="161"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="清DTC">
<Rect left="286" top="269" right="386" bottom="301"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="287" top="177" right="387" bottom="209"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="288" top="317" right="388" bottom="349"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="288" top="366" right="388" bottom="398"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="35" ActivityType="13" flags="0" name="计算">
<Rect left="288" top="416" right="388" bottom="448"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x85B957CA"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="发送key">
<Rect left="288" top="469" right="388" bottom="501"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="通讯">
<Rect left="287" top="223" right="387" bottom="255"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="通讯失败">
<Rect left="554" top="229" right="654" bottom="261"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="结束通讯">
<Rect left="552" top="178" right="652" bottom="210"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="比对零件号">
<Rect left="450" top="504" right="550" bottom="536"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="3" DelayTime="200"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_Partnumber);
engine.println("零件号标准值:"..DString_Partnumber);
if(@0==0x62)then
	
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	
	if (DString1==DString_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script></Activity>
<Activity id="94" ActivityType="3" flags="0" name="读硬件号">
<Rect left="580" top="514" right="680" bottom="546"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="延时300MS">
<Rect left="585" top="578" right="685" bottom="610"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="706" top="527" right="806" bottom="559"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="延时300MS">
<Rect left="705" top="574" right="805" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="971" top="529" right="1071" bottom="561"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue=DString_SoftwareVersionNumber;
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
</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="读软件号">
<Rect left="838" top="528" right="938" bottom="560"/>
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
</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="延时300MS">
<Rect left="838" top="581" right="938" bottom="613"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="延时300MS">
<Rect left="971" top="579" right="1071" bottom="611"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1115" top="530" right="1215" bottom="562"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1115" top="584" right="1215" bottom="616"/>
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
end</Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="日期读取">
<Rect left="1236" top="579" right="1336" bottom="611"/>
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
<Activity id="109" ActivityType="3" flags="0" name="发送时间">
<Rect left="1234" top="534" right="1334" bottom="566"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1352" top="578" right="1452" bottom="610"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1465" top="530" right="1565" bottom="562"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_VariCoding)) then
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
	engine.StatPoint=DString_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="写配置码">
<Rect left="1351" top="532" right="1451" bottom="564"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0xF1 0xA1 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1585" top="635" right="1685" bottom="667"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="后左座椅加热buttoncheck">
<Rect left="569" top="745" right="669" bottom="777"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加热按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="570" top="796" right="670" bottom="828"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="292" ActivityType="3" flags="0" name="检测失败">
<Rect left="683" top="796" right="783" bottom="828"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="293" ActivityType="3" flags="0" name="后左座椅加热buttoncheck">
<Rect left="571" top="848" right="671" bottom="880"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加热按钮开至1档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="294" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="572" top="899" right="672" bottom="931"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="295" ActivityType="3" flags="0" name="检测失败">
<Rect left="685" top="899" right="785" bottom="931"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="296" ActivityType="3" flags="0" name="后左座椅加热buttoncheck">
<Rect left="572" top="951" right="672" bottom="983"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加热按钮开至2档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="297" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="573" top="1002" right="673" bottom="1034"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x10) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="298" ActivityType="3" flags="0" name="检测失败">
<Rect left="686" top="1002" right="786" bottom="1034"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="299" ActivityType="3" flags="0" name="后左座椅加热buttoncheck">
<Rect left="570" top="1055" right="670" bottom="1087"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加热按钮开至3档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="300" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="571" top="1106" right="671" bottom="1138"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x11) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="301" ActivityType="3" flags="0" name="检测失败">
<Rect left="684" top="1106" right="784" bottom="1138"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="302" ActivityType="3" flags="0" name="后左座椅加热buttoncheck">
<Rect left="573" top="1157" right="673" bottom="1189"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加热按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="303" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="574" top="1208" right="674" bottom="1240"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="304" ActivityType="3" flags="0" name="检测失败">
<Rect left="687" top="1208" right="787" bottom="1240"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="305" ActivityType="3" flags="0" name="后左座椅制冷buttoncheck">
<Rect left="575" top="1268" right="675" bottom="1300"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅制冷按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="306" ActivityType="3" flags="0" name="后左座椅制冷按钮测试">
<Rect left="576" top="1319" right="676" bottom="1351"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc3
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="307" ActivityType="3" flags="0" name="检测失败">
<Rect left="689" top="1319" right="789" bottom="1351"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="308" ActivityType="3" flags="0" name="后左座椅制冷buttoncheck">
<Rect left="577" top="1371" right="677" bottom="1403"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅制冷按钮开至1档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="309" ActivityType="3" flags="0" name="后左座椅制冷按钮测试">
<Rect left="578" top="1422" right="678" bottom="1454"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc3
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="310" ActivityType="3" flags="0" name="检测失败">
<Rect left="691" top="1422" right="791" bottom="1454"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="311" ActivityType="3" flags="0" name="后左座椅制冷buttoncheck">
<Rect left="578" top="1474" right="678" bottom="1506"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅制冷按钮开至2档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="312" ActivityType="3" flags="0" name="后左座椅制冷按钮测试">
<Rect left="579" top="1525" right="679" bottom="1557"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc3
if (@3==0x10) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="313" ActivityType="3" flags="0" name="检测失败">
<Rect left="692" top="1525" right="792" bottom="1557"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="314" ActivityType="3" flags="0" name="后左座椅制冷buttoncheck">
<Rect left="576" top="1578" right="676" bottom="1610"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅制冷按钮开至3档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="315" ActivityType="3" flags="0" name="后左座椅制冷按钮测试">
<Rect left="577" top="1629" right="677" bottom="1661"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc3
if (@3==0x11) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="316" ActivityType="3" flags="0" name="检测失败">
<Rect left="690" top="1629" right="790" bottom="1661"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="317" ActivityType="3" flags="0" name="后左座椅制冷buttoncheck">
<Rect left="579" top="1680" right="679" bottom="1712"/>
<Line1Text Enable="1" Text="后左座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后左座椅加制冷按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="318" ActivityType="3" flags="0" name="后左座椅制冷按钮测试">
<Rect left="580" top="1731" right="680" bottom="1763"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc3
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="319" ActivityType="3" flags="0" name="检测失败">
<Rect left="693" top="1731" right="793" bottom="1763"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="335" ActivityType="3" flags="0" name="后右座椅加热buttoncheck">
<Rect left="1018" top="735" right="1118" bottom="767"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加热按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="336" ActivityType="3" flags="0" name="后右座椅加热按钮测试">
<Rect left="1019" top="786" right="1119" bottom="818"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc2
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="337" ActivityType="3" flags="0" name="检测失败">
<Rect left="1132" top="786" right="1232" bottom="818"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="338" ActivityType="3" flags="0" name="后右座椅加热buttoncheck">
<Rect left="1020" top="838" right="1120" bottom="870"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加热按钮开至1档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="339" ActivityType="3" flags="0" name="后右座椅加热按钮测试">
<Rect left="1021" top="889" right="1121" bottom="921"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc2
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="340" ActivityType="3" flags="0" name="检测失败">
<Rect left="1134" top="889" right="1234" bottom="921"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="341" ActivityType="3" flags="0" name="后右座椅加热buttoncheck">
<Rect left="1021" top="941" right="1121" bottom="973"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加热按钮开至2档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="342" ActivityType="3" flags="0" name="后右座椅加热按钮测试">
<Rect left="1022" top="992" right="1122" bottom="1024"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc2
if (@3==0x10) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="343" ActivityType="3" flags="0" name="检测失败">
<Rect left="1135" top="992" right="1235" bottom="1024"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="344" ActivityType="3" flags="0" name="后右座椅加热buttoncheck">
<Rect left="1019" top="1045" right="1119" bottom="1077"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加热按钮开至3档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="345" ActivityType="3" flags="0" name="后右座椅加热按钮测试">
<Rect left="1020" top="1096" right="1120" bottom="1128"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc2
if (@3==0x11) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="346" ActivityType="3" flags="0" name="检测失败">
<Rect left="1133" top="1096" right="1233" bottom="1128"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="347" ActivityType="3" flags="0" name="后右座椅加热buttoncheck">
<Rect left="1022" top="1147" right="1122" bottom="1179"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加热按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="348" ActivityType="3" flags="0" name="后左座椅加热按钮测试">
<Rect left="1023" top="1198" right="1123" bottom="1230"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc1
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="349" ActivityType="3" flags="0" name="检测失败">
<Rect left="1136" top="1198" right="1236" bottom="1230"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="350" ActivityType="3" flags="0" name="后右座椅制冷buttoncheck">
<Rect left="1024" top="1258" right="1124" bottom="1290"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅制冷按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="351" ActivityType="3" flags="0" name="后右座椅制冷按钮测试">
<Rect left="1025" top="1309" right="1125" bottom="1341"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc4
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="352" ActivityType="3" flags="0" name="检测失败">
<Rect left="1138" top="1309" right="1238" bottom="1341"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="353" ActivityType="3" flags="0" name="后右座椅制冷buttoncheck">
<Rect left="1026" top="1361" right="1126" bottom="1393"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅制冷按钮开至1档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="354" ActivityType="3" flags="0" name="后右座椅制冷按钮测试">
<Rect left="1027" top="1412" right="1127" bottom="1444"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc4
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="355" ActivityType="3" flags="0" name="检测失败">
<Rect left="1140" top="1412" right="1240" bottom="1444"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="356" ActivityType="3" flags="0" name="后右座椅制冷buttoncheck">
<Rect left="1027" top="1464" right="1127" bottom="1496"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅制冷按钮开至2档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="357" ActivityType="3" flags="0" name="后右座椅制冷按钮测试">
<Rect left="1028" top="1515" right="1128" bottom="1547"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc4
if (@3==0x10) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="358" ActivityType="3" flags="0" name="检测失败">
<Rect left="1141" top="1515" right="1241" bottom="1547"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="359" ActivityType="3" flags="0" name="后右座椅制冷buttoncheck">
<Rect left="1025" top="1568" right="1125" bottom="1600"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅制冷按钮开至3档"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="360" ActivityType="3" flags="0" name="后右座椅制冷按钮测试">
<Rect left="1026" top="1619" right="1126" bottom="1651"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc4
if (@3==0x11) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="361" ActivityType="3" flags="0" name="检测失败">
<Rect left="1139" top="1619" right="1239" bottom="1651"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="362" ActivityType="3" flags="0" name="后右座椅制冷buttoncheck">
<Rect left="1028" top="1670" right="1128" bottom="1702"/>
<Line1Text Enable="1" Text="后右座椅加热制冷按钮测试"/>
<Line3Text Enable="1" Text="请将后右座椅加制冷按钮关闭"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000</Script></Activity>
<Activity id="363" ActivityType="3" flags="0" name="后右座椅制冷按钮测试">
<Rect left="1029" top="1721" right="1129" bottom="1753"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc4
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="364" ActivityType="3" flags="0" name="检测失败">
<Rect left="1142" top="1721" right="1242" bottom="1753"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="365" ActivityType="3" flags="0" name="遮阳帘开启开关测试">
<Rect left="1401" top="854" right="1501" bottom="886"/>
<Line1Text Enable="1" Text="遮阳帘开启开关按下人工确认"/>
<Line3Text Enable="1" Text="遮阳帘开启了吗？"/>
<Line4Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script></Activity>
<Activity id="366" ActivityType="3" flags="0" name="遮阳帘开启开关测试">
<Rect left="1399" top="796" right="1499" bottom="828"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="遮阳帘开启开关未按"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc5
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="367" ActivityType="3" flags="0" name="检测失败">
<Rect left="1536" top="794" right="1636" bottom="826"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="368" ActivityType="3" flags="0" name="遮阳帘开启开关测试">
<Rect left="1402" top="912" right="1502" bottom="944"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="遮阳帘开启开关按下状态测试"/>
<Line2Text Enable="1" Text="遮阳帘开启开关按下时间大于1秒"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc5
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="369" ActivityType="3" flags="0" name="检测失败">
<Rect left="1533" top="911" right="1633" bottom="943"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="370" ActivityType="3" flags="0" name="遮阳帘关闭开关测试">
<Rect left="1405" top="1053" right="1505" bottom="1085"/>
<Line1Text Enable="1" Text="遮阳帘关闭开关按下人工确认"/>
<Line3Text Enable="1" Text="遮阳帘关闭了吗？"/>
<Line4Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--#COMM  0x2F 0x02 0x05 0x03 0x01
#DELAY 2000
#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script></Activity>
<Activity id="371" ActivityType="3" flags="0" name="遮阳帘开启开关测试">
<Rect left="1403" top="995" right="1503" bottom="1027"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="遮阳帘开启开关未按"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc5
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="372" ActivityType="3" flags="0" name="检测失败">
<Rect left="1540" top="993" right="1640" bottom="1025"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="373" ActivityType="3" flags="0" name="遮阳帘关闭开关测试">
<Rect left="1406" top="1111" right="1506" bottom="1143"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1" Text="遮阳帘关闭开关按下状态测试"/>
<Line2Text Enable="1" Text="遮阳帘开启开关按下"/>
<Script>--#COMM 0x22 0x01 0x35
#COMM 0x22 0x4f 0xc5
if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
   engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="374" ActivityType="3" flags="0" name="检测失败">
<Rect left="1537" top="1110" right="1637" bottom="1142"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="375" ActivityType="3" flags="0" name="清标题1-4">
<Rect left="1760" top="680" right="1860" bottom="712"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="378" ActivityType="4" flags="0" name="路由节点">
<Rect left="616" top="1796" right="648" bottom="1828"/>
</Activity>
<Activity id="380" ActivityType="4" flags="0" name="路由节点">
<Rect left="859" top="1794" right="891" bottom="1826"/>
</Activity>
<Activity id="384" ActivityType="4" flags="0" name="路由节点">
<Rect left="1065" top="1776" right="1097" bottom="1808"/>
</Activity>
<Activity id="385" ActivityType="4" flags="0" name="路由节点">
<Rect left="1323" top="1777" right="1355" bottom="1809"/>
</Activity>
<Activity id="387" ActivityType="4" flags="0" name="路由节点">
<Rect left="1443" top="1168" right="1475" bottom="1200"/>
</Activity>
<Activity id="388" ActivityType="4" flags="0" name="路由节点">
<Rect left="1797" top="1164" right="1829" bottom="1196"/>
</Activity>
<Activity id="389" ActivityType="4" flags="0" name="路由节点">
<Rect left="1796" top="232" right="1828" bottom="264"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="0">
</Transition>
<Transition StartId="6" EndId="39" type="0">
</Transition>
<Transition StartId="7" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="92" type="0">
</Transition>
<Transition StartId="39" EndId="5" type="3">
</Transition>
<Transition StartId="39" EndId="42" type="4">
</Transition>
<Transition StartId="42" EndId="91" type="0">
</Transition>
<Transition StartId="42" EndId="389" type="5">
</Transition>
<Transition StartId="91" EndId="6" type="0">
</Transition>
<Transition StartId="92" EndId="94" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="0">
</Transition>
<Transition StartId="95" EndId="99" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="103" type="0">
</Transition>
<Transition StartId="102" EndId="105" type="0">
</Transition>
<Transition StartId="103" EndId="104" type="0">
</Transition>
<Transition StartId="104" EndId="102" type="0">
</Transition>
<Transition StartId="105" EndId="106" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="109" type="0">
</Transition>
<Transition StartId="108" EndId="113" type="0">
</Transition>
<Transition StartId="109" EndId="108" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="118" type="0">
</Transition>
<Transition StartId="113" EndId="111" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="291" type="0">
</Transition>
<Transition StartId="291" EndId="292" type="4">
</Transition>
<Transition StartId="291" EndId="293" type="3">
</Transition>
<Transition StartId="292" EndId="293" type="0">
</Transition>
<Transition StartId="293" EndId="294" type="0">
</Transition>
<Transition StartId="294" EndId="295" type="4">
</Transition>
<Transition StartId="294" EndId="296" type="3">
</Transition>
<Transition StartId="295" EndId="296" type="0">
</Transition>
<Transition StartId="296" EndId="297" type="0">
</Transition>
<Transition StartId="297" EndId="298" type="4">
</Transition>
<Transition StartId="297" EndId="299" type="3">
</Transition>
<Transition StartId="298" EndId="299" type="0">
</Transition>
<Transition StartId="299" EndId="300" type="0">
</Transition>
<Transition StartId="300" EndId="301" type="4">
</Transition>
<Transition StartId="300" EndId="302" type="3">
</Transition>
<Transition StartId="301" EndId="302" type="0">
</Transition>
<Transition StartId="302" EndId="303" type="0">
</Transition>
<Transition StartId="303" EndId="304" type="4">
</Transition>
<Transition StartId="303" EndId="305" type="3">
</Transition>
<Transition StartId="304" EndId="305" type="0">
</Transition>
<Transition StartId="305" EndId="306" type="0">
</Transition>
<Transition StartId="306" EndId="307" type="4">
</Transition>
<Transition StartId="306" EndId="308" type="3">
</Transition>
<Transition StartId="307" EndId="308" type="0">
</Transition>
<Transition StartId="308" EndId="309" type="0">
</Transition>
<Transition StartId="309" EndId="310" type="4">
</Transition>
<Transition StartId="309" EndId="311" type="3">
</Transition>
<Transition StartId="310" EndId="311" type="0">
</Transition>
<Transition StartId="311" EndId="312" type="0">
</Transition>
<Transition StartId="312" EndId="313" type="4">
</Transition>
<Transition StartId="312" EndId="314" type="3">
</Transition>
<Transition StartId="313" EndId="314" type="0">
</Transition>
<Transition StartId="314" EndId="315" type="0">
</Transition>
<Transition StartId="315" EndId="316" type="4">
</Transition>
<Transition StartId="315" EndId="317" type="3">
</Transition>
<Transition StartId="316" EndId="317" type="0">
</Transition>
<Transition StartId="317" EndId="318" type="0">
</Transition>
<Transition StartId="318" EndId="319" type="4">
</Transition>
<Transition StartId="318" EndId="378" type="3">
</Transition>
<Transition StartId="319" EndId="378" type="0">
</Transition>
<Transition StartId="335" EndId="336" type="0">
</Transition>
<Transition StartId="336" EndId="337" type="4">
</Transition>
<Transition StartId="336" EndId="338" type="3">
</Transition>
<Transition StartId="337" EndId="338" type="0">
</Transition>
<Transition StartId="338" EndId="339" type="0">
</Transition>
<Transition StartId="339" EndId="340" type="4">
</Transition>
<Transition StartId="339" EndId="341" type="3">
</Transition>
<Transition StartId="340" EndId="341" type="0">
</Transition>
<Transition StartId="341" EndId="342" type="0">
</Transition>
<Transition StartId="342" EndId="343" type="4">
</Transition>
<Transition StartId="342" EndId="344" type="3">
</Transition>
<Transition StartId="343" EndId="344" type="0">
</Transition>
<Transition StartId="344" EndId="345" type="0">
</Transition>
<Transition StartId="345" EndId="346" type="4">
</Transition>
<Transition StartId="345" EndId="347" type="3">
</Transition>
<Transition StartId="346" EndId="347" type="0">
</Transition>
<Transition StartId="347" EndId="348" type="0">
</Transition>
<Transition StartId="348" EndId="349" type="4">
</Transition>
<Transition StartId="348" EndId="350" type="3">
</Transition>
<Transition StartId="349" EndId="350" type="0">
</Transition>
<Transition StartId="350" EndId="351" type="0">
</Transition>
<Transition StartId="351" EndId="352" type="4">
</Transition>
<Transition StartId="351" EndId="353" type="3">
</Transition>
<Transition StartId="352" EndId="353" type="0">
</Transition>
<Transition StartId="353" EndId="354" type="0">
</Transition>
<Transition StartId="354" EndId="355" type="4">
</Transition>
<Transition StartId="354" EndId="356" type="3">
</Transition>
<Transition StartId="355" EndId="356" type="0">
</Transition>
<Transition StartId="356" EndId="357" type="0">
</Transition>
<Transition StartId="357" EndId="358" type="4">
</Transition>
<Transition StartId="357" EndId="359" type="3">
</Transition>
<Transition StartId="358" EndId="359" type="0">
</Transition>
<Transition StartId="359" EndId="360" type="0">
</Transition>
<Transition StartId="360" EndId="361" type="4">
</Transition>
<Transition StartId="360" EndId="362" type="3">
</Transition>
<Transition StartId="361" EndId="362" type="0">
</Transition>
<Transition StartId="362" EndId="363" type="0">
</Transition>
<Transition StartId="363" EndId="364" type="4">
</Transition>
<Transition StartId="363" EndId="384" type="3">
</Transition>
<Transition StartId="364" EndId="384" type="0">
</Transition>
<Transition StartId="365" EndId="368" type="0">
</Transition>
<Transition StartId="366" EndId="367" type="4">
</Transition>
<Transition StartId="366" EndId="365" type="3">
</Transition>
<Transition StartId="367" EndId="365" type="0">
</Transition>
<Transition StartId="368" EndId="369" type="3">
</Transition>
<Transition StartId="368" EndId="371" type="3">
</Transition>
<Transition StartId="369" EndId="371" type="0">
</Transition>
<Transition StartId="370" EndId="373" type="0">
</Transition>
<Transition StartId="371" EndId="372" type="4">
</Transition>
<Transition StartId="371" EndId="370" type="3">
</Transition>
<Transition StartId="372" EndId="370" type="0">
</Transition>
<Transition StartId="373" EndId="374" type="3">
</Transition>
<Transition StartId="373" EndId="387" type="3">
</Transition>
<Transition StartId="374" EndId="387" type="0">
</Transition>
<Transition StartId="375" EndId="2" type="0">
</Transition>
<Transition StartId="378" EndId="380" type="0">
</Transition>
<Transition StartId="380" EndId="335" type="0">
</Transition>
<Transition StartId="384" EndId="385" type="0">
</Transition>
<Transition StartId="385" EndId="366" type="0">
</Transition>
<Transition StartId="387" EndId="388" type="0">
</Transition>
<Transition StartId="388" EndId="375" type="0">
</Transition>
<Transition StartId="389" EndId="375" type="0">
</Transition>
</Transitions>
</Process>

