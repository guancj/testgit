<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1117" pbltext="DEP36">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_Cluster_Telltale_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_Buzzer_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_Pointer_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_Backlight_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_Cluster_WD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x728" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="23" top="24" right="123" bottom="56"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="1305" top="1565" right="1405" bottom="1597"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="组合仪表板 (IC)">
<Rect left="23" top="73" right="123" bottom="105"/>
<TitleText Enable="1" Text="组合仪表板 (IC)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="23" top="216" right="123" bottom="248"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2201" name="DEP38" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="打开LED灯">
<Rect left="1296" top="644" right="1396" bottom="676"/>
<Script>#COMM 0x2F 0x0A 0x00 0x03 0x01 </Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="所有都亮确认">
<Rect left="1297" top="691" right="1397" bottom="723"/>
<Line1Text Enable="1" Text="仪表板所有指示灯都亮"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
</Script><assessment no="14" name="DEP461" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="关闭LED灯">
<Rect left="1297" top="738" right="1397" bottom="770"/>
<Script>#COMM 0x2F 0x0A 0x00 0x03 0x00</Script></Activity>
<Activity id="10" ActivityType="4" flags="0" name="路由节点">
<Rect left="1333" top="882" right="1365" bottom="914"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="全部关闭确认">
<Rect left="1298" top="783" right="1398" bottom="815"/>
<Line1Text Enable="1" Text="仪表板所有指示灯都关闭"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
</Script><assessment no="15" name="DEP462" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="1300" top="831" right="1400" bottom="863"/>
<Line1Text Enable="1" Text="ReturnControlToECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0x0A 0x00 0x00
#DELAY 1000

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP463" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="喇叭检测">
<Rect left="1299" top="929" right="1399" bottom="961"/>
<Script>#COMM 0x2F 0x0A 0x01 0x03 0x00</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="响声确认">
<Rect left="1299" top="978" right="1399" bottom="1010"/>
<Line1Text Enable="1" Text="喇叭开启"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
</Script><assessment no="17" name="DEP464" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="1299" top="1026" right="1399" bottom="1058"/>
<Script>#COMM 0x2F 0x0A 0x01 0x00
#DELAY 1000
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP465" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="4" flags="0" name="路由节点">
<Rect left="1333" top="1077" right="1365" bottom="1109"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="仪表板指针">
<Rect left="1300" top="1130" right="1400" bottom="1162"/>
<Script>#COMM 0x2F 0x0A 0x03 0x03 0x05</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="所有指针确认">
<Rect left="1301" top="1177" right="1401" bottom="1209"/>
<Line1Text Enable="1" Text="仪表板内所有指针都工作"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
</Script><assessment no="19" name="DEP466" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="1302" top="1226" right="1402" bottom="1258"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x2F 0x0A 0x03 0x00
#DELAY 1000
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="20" name="DEP467" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="1337" top="1275" right="1369" bottom="1307"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="仪表背光检测">
<Rect left="1302" top="1324" right="1402" bottom="1356"/>
<Script>--#COMM 0x10 0x01</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="拨到示宽灯位置">
<Rect left="1308" top="1371" right="1408" bottom="1403"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="#L=拨到示宽灯位置！#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=拨到示宽灯位置!#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=拨到示宽灯位置!#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end





</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="明暗变化">
<Rect left="1304" top="1421" right="1404" bottom="1453"/>
<Line1Text Enable="1" Text="调节仪表板背光灯亮度"/>
<Line2Text Enable="1" Text="#L=背光灯有明暗变化吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=背光灯有明暗变化吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=背光灯有明暗变化吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end





</Script><assessment no="21" name="DEP468" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="关闭大灯">
<Rect left="1304" top="1467" right="1404" bottom="1499"/>
<Line1Text Enable="1" Text="将大灯开关"/>
<Line2Text Enable="1" Text="#L=拨到OFF,关闭位置#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=拨到OFF,关闭位置!#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=拨到OFF,关闭位置!#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end





</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="清空显示">
<Rect left="1305" top="1515" right="1405" bottom="1547"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="34" ActivityType="3" flags="0" name="连接ECU">
<Rect left="23" top="120" right="123" bottom="152"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="切诊断">
<Rect left="22" top="265" right="122" bottom="297"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2202" name="DEP1074" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="23" top="314" right="123" bottom="346"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2204" name="DEP39" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="13" flags="0" name="计算">
<Rect left="23" top="365" right="123" bottom="397"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA0BDDFA0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="发送key">
<Rect left="23" top="411" right="123" bottom="443"/>
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
</Script><assessment no="2205" name="DEP40" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="584" right="1366" bottom="616"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="比对零件号">
<Rect left="250" top="174" right="350" bottom="206"/>
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
	if(string.len(DString_C131_Partnumber)==12)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	elseif(string.len(DString_C131_Partnumber)==13)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15);
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
end</Script><assessment no="1" name="DEP240" type="8" flags="105"/>
</Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="114" right="316" bottom="146"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="读硬件号">
<Rect left="380" top="164" right="480" bottom="196"/>
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
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP241" type="8" flags="105"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="延时300MS">
<Rect left="380" top="214" right="480" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="114" right="446" bottom="146"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="114" right="726" bottom="146"/>
</Activity>
<Activity id="55" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="114" right="596" bottom="146"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="520" top="164" right="620" bottom="196"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP242" type="8" flags="105"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="214" right="620" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="59" ActivityType="4" flags="0" name="路由节点">
<Rect left="1254" top="114" right="1286" bottom="146"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1220" top="164" right="1320" bottom="196"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
engine.SetLineText(3,DString1);
engine.println("软件版本号:"..DString1);
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP244" type="8" flags="105"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="读软件号">
<Rect left="660" top="164" right="760" bottom="196"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" ))then
		StandValue="C029003";
	--elseif((DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" ))then
	else
		StandValue="C022503";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                                     

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP243" type="8" flags="105"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="延时300MS">
<Rect left="660" top="214" right="760" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1220" top="214" right="1320" bottom="246"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1370" top="164" right="1470" bottom="196"/>
<Line1Text Enable="1"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
--#COMM 0x2E 0xF1 0x90  string.byte(vin,1) string.byte(vin,2) string.byte(vin,3) string.byte(vin,4) string.byte(vin,5) string.byte(vin,6) string.byte(vin,7) string.byte(vin,8) string.byte(vin,9) string.byte(vin,10) string.byte(vin,11) string.byte(vin,12) string.byte(vin,13) string.byte(vin,14) string.byte(vin,15) string.byte(vin,16) string.byte(vin,17)
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP245" type="8" flags="97"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1370" top="214" right="1470" bottom="246"/>
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
end</Script><assessment no="7" name="DEP246" type="8" flags="97"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="日期读取">
<Rect left="1510" top="224" right="1610" bottom="256"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="发送时间">
<Rect left="1510" top="164" right="1610" bottom="196"/>
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
<Activity id="82" ActivityType="4" flags="0" name="路由节点">
<Rect left="1404" top="114" right="1436" bottom="146"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1890" top="584" right="1990" bottom="616"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1640" top="214" right="1740" bottom="246"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1780" top="164" right="1880" bottom="196"/>
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
</Script><assessment no="12" name="DEP370" type="8" flags="105"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="写配置码">
<Rect left="1640" top="164" right="1740" bottom="196"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP248" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="4" flags="0" name="路由节点">
<Rect left="1674" top="114" right="1706" bottom="146"/>
</Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="1544" top="114" right="1576" bottom="146"/>
</Activity>
<Activity id="101" ActivityType="4" flags="0" name="路由节点">
<Rect left="1814" top="114" right="1846" bottom="146"/>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="1415" top="974" right="1447" bottom="1006"/>
</Activity>
<Activity id="103" ActivityType="4" flags="0" name="路由节点">
<Rect left="1415" top="1171" right="1447" bottom="1203"/>
</Activity>
<Activity id="104" ActivityType="4" flags="0" name="路由节点">
<Rect left="1423" top="1389" right="1455" bottom="1421"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="通讯">
<Rect left="23" top="170" right="123" bottom="202"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2200" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="通讯失败">
<Rect left="136" top="173" right="236" bottom="205"/>
<Line1Text Enable="1" Text="IC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="107" ActivityType="4" flags="0" name="路由节点">
<Rect left="172" top="1515" right="204" bottom="1547"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1640" top="264" right="1740" bottom="296"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP1111" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="STOPCOMM">
<Rect left="1640" top="314" right="1740" bottom="346"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="ECU 重置 3s">
<Rect left="1640" top="364" right="1740" bottom="396"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="COMMINIT">
<Rect left="1640" top="414" right="1740" bottom="446"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="通讯">
<Rect left="1640" top="464" right="1740" bottom="496"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1520" top="464" right="1620" bottom="496"/>
<Line1Text Enable="1" Text="IC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="结束通讯">
<Rect left="136" top="120" right="236" bottom="152"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="116" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="114" right="1956" bottom="146"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1530" top="414" right="1630" bottom="446"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="119" ActivityType="4" flags="0" name="路由节点">
<Rect left="1419" top="740" right="1451" bottom="772"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="混动车型">
<Rect left="800" top="164" right="900" bottom="196"/>
<Script></Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="读软件号">
<Rect left="800" top="214" right="900" bottom="246"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13" )then
		StandValue="C028121";
        elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="C028122";
        else
	        StandValue="C023013";
	end
        engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("C028111" == DString1) then  
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end      
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP243" type="8" flags="105"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="延时300MS">
<Rect left="800" top="274" right="900" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="114" right="866" bottom="146"/>
</Activity>
<Activity id="129" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="364" right="996" bottom="396"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="写车型">
<Rect left="1370" top="274" right="1470" bottom="306"/>
<Line1Text Enable="1" Text="写车型代码"/>
<Script>engine.SetLineText(3,DString_C131_Car_Tpye);
#COMM 0x2E 0xF1 0xA0 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP1185" type="8" flags="97"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="检查车型">
<Rect left="1370" top="324" right="1470" bottom="356"/>
<Line1Text Enable="1" Text="比对车型代码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA0
engine.SetLineText(2,DString_C131_Car_Tpye);
engine.println("车型标准值:"..DString_C131_Car_Tpye);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
	engine.SetLineText(3,DString1);
	engine.println("读到车型代值:"..DString1);
	if (string.match(DString1,DString_C131_Car_Tpye)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Car_Tpye;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="32" name="DEP1186" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="改脸">
<Rect left="930" top="164" right="1030" bottom="196"/>
<Script></Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="读软件号">
<Rect left="930" top="214" right="1030" bottom="246"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="C023017";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="C023017";
         elseif(DString_C131_Car_Tpye=="CH1BM34")then
		StandValue="C023016";
	elseif((DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"))then
		StandValue="C023017";
         elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="C023017";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="C023017";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="C023017";
	else
		StandValue="C023017";
                --StandValue="C023015";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3)..hexstr(@4-@6);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("C028111" == DString1) then  
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件号");
	end                       
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="4" name="DEP243" type="8" flags="105"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="延时300MS">
<Rect left="930" top="264" right="1030" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="135" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="114" right="996" bottom="146"/>
</Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="248" top="464" right="280" bottom="496"/>
</Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="247" top="1514" right="279" bottom="1546"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="IC读取油量">
<Rect left="1472" top="655" right="1572" bottom="687"/>
<Line1Text Enable="1" Text="IC读取油量"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA8

if(@0==0x62)then
--resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
temvalue = (@3* 256 + @4)
oil=tonumber(temvalue,10);
temperature=oil/256;
engine.println("软件版本号:"..temvalue);
engine.println("软件版本号:"..temperature);
engine.println("_readoil_)".. engine.LastError);


--[[
if(@0==0x62)then
--resu = (( (@3* 256 + @4 - 65536) * 0.024414063 ) + 0) * 1.0;
temvalue = ((@3* 100 + @4 ) /20;
temperature=temvalue;
]]--



if (25.0 &lt; temperature and temperature&lt; 35.0) then
  engine.LastError = 0;
  engine.StatValue=temperature;
  --OK=OK+1;
  engine.SetLineText(2,"油值合格"..OK);
  engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=temperature;
  engine.StatLower=25.0;
  engine.StatUpper=35.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,temperature.."C");
engine.SetLineText(3,"#L=BMPBAR,".."25.0"..",".."35.0"..",".."1"..","..tostring(temperature).."#R=C");

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="23" name="DEP1283" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="4" flags="0" name="路由节点">
<Rect left="1614" top="584" right="1646" bottom="616"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1472" top="708" right="1572" bottom="740"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="19年型">
<Rect left="1060" top="164" right="1160" bottom="196"/>
<Script></Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="读软件号">
<Rect left="1060" top="214" right="1160" bottom="246"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94

if(@0==0x62)then
	StandValue="C020306";
        StandValue1="C020308";
        StandValue_view = StandValue.."或"..StandValue1
	if(StandValue~="")then
		engine.SetLineText(2,StandValue_view);
		engine.println("软件号标准值:"..StandValue.."或"..StandValue1);
		DString1 = engine.GetResponseString(3,3) .. LibGeneral.hex2str(engine.GetResponseString(4,6));
		engine.SetLineText(3,DString1);
		engine.println("软件号:"..DString1);
		if(StandValue == DString1 or StandValue1 == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;  	
                engine.StatPoint=StandValue.."或"..StandValue1;
	else
		engine.println("不比对软件号");
	end                       
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="4" name="DEP243" type="8" flags="105"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1060" top="264" right="1160" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="1094" top="114" right="1126" bottom="146"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="34" type="0">
</Transition>
<Transition StartId="3" EndId="35" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="13" type="1">
<Expression>C131_Cluster_Buzzer_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="10" EndId="102" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="10" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="1">
<Expression>C131_Cluster_Pointer_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="16" EndId="103" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="1">
<Expression>C131_Cluster_Backlight_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="20" EndId="104" type="0">
</Transition>
<Transition StartId="21" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="1" type="0">
</Transition>
<Transition StartId="34" EndId="105" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="38" EndId="49" type="0">
</Transition>
<Transition StartId="40" EndId="7" type="1">
<Expression>C131_Cluster_Telltale_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="40" EndId="119" type="0">
</Transition>
<Transition StartId="48" EndId="53" type="0">
</Transition>
<Transition StartId="49" EndId="48" type="1">
<Expression>C131_Cluster_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="49" EndId="53" type="0">
</Transition>
<Transition StartId="50" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="55" type="0">
</Transition>
<Transition StartId="53" EndId="50" type="1">
<Expression>C131_Cluster_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="53" EndId="55" type="0">
</Transition>
<Transition StartId="54" EndId="65" type="1">
<Expression>C131_Cluster_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="54" EndId="128" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="1">
<Expression>C131_Cluster_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="55" EndId="54" type="0">
</Transition>
<Transition StartId="56" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="54" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="1">
<Expression>C131_Cluster_SVP_Execute_Flag == true </Expression></Transition>
<Transition StartId="59" EndId="82" type="0">
</Transition>
<Transition StartId="60" EndId="69" type="0">
</Transition>
<Transition StartId="65" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="129" type="0">
</Transition>
<Transition StartId="69" EndId="82" type="0">
</Transition>
<Transition StartId="77" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="130" type="1">
<Expression>LibGeneral.ICwriteCarType(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="78" EndId="100" type="0">
</Transition>
<Transition StartId="79" EndId="95" type="0">
</Transition>
<Transition StartId="81" EndId="79" type="0">
</Transition>
<Transition StartId="82" EndId="77" type="1">
<Expression>C131_Cluster_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="82" EndId="100" type="0">
</Transition>
<Transition StartId="90" EndId="139" type="0">
</Transition>
<Transition StartId="91" EndId="109" type="0">
</Transition>
<Transition StartId="92" EndId="116" type="0">
</Transition>
<Transition StartId="94" EndId="91" type="0">
</Transition>
<Transition StartId="95" EndId="94" type="1">
<Expression>(DString_C131_VariCoding~= "") and (C131_Cluster_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="95" EndId="101" type="0">
</Transition>
<Transition StartId="100" EndId="81" type="1">
<Expression>C131_Cluster_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="100" EndId="95" type="0">
</Transition>
<Transition StartId="101" EndId="92" type="1">
<Expression>((DString_C131_VariCoding~= "") and (C131_Cluster_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="101" EndId="116" type="0">
</Transition>
<Transition StartId="102" EndId="16" type="0">
</Transition>
<Transition StartId="103" EndId="20" type="0">
</Transition>
<Transition StartId="104" EndId="26" type="0">
</Transition>
<Transition StartId="105" EndId="3" type="3">
</Transition>
<Transition StartId="105" EndId="106" type="4">
</Transition>
<Transition StartId="106" EndId="107" type="5">
</Transition>
<Transition StartId="106" EndId="115" type="0">
</Transition>
<Transition StartId="107" EndId="137" type="0">
</Transition>
<Transition StartId="109" EndId="110" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="4">
</Transition>
<Transition StartId="113" EndId="101" type="3">
</Transition>
<Transition StartId="114" EndId="118" type="0">
</Transition>
<Transition StartId="114" EndId="136" type="5">
</Transition>
<Transition StartId="115" EndId="34" type="0">
</Transition>
<Transition StartId="116" EndId="90" type="0">
</Transition>
<Transition StartId="118" EndId="112" type="0">
</Transition>
<Transition StartId="119" EndId="10" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="127" type="0">
</Transition>
<Transition StartId="127" EndId="129" type="0">
</Transition>
<Transition StartId="128" EndId="125" type="1">
<Expression>C131_Cluster_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="128" EndId="135" type="0">
</Transition>
<Transition StartId="129" EndId="59" type="0">
</Transition>
<Transition StartId="130" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="100" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="0">
</Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="129" type="0">
</Transition>
<Transition StartId="135" EndId="132" type="1">
<Expression>C131_Cluster_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="135" EndId="144" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="26" type="0">
</Transition>
<Transition StartId="138" EndId="140" type="0">
</Transition>
<Transition StartId="139" EndId="40" type="0">
</Transition>
<Transition StartId="140" EndId="40" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="143" EndId="129" type="0">
</Transition>
<Transition StartId="144" EndId="59" type="0">
</Transition>
<Transition StartId="144" EndId="141" type="1">
<Expression>C131_Cluster_SN_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

