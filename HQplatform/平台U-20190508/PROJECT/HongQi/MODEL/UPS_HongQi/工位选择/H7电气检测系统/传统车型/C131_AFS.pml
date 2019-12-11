<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1114" pbltext="DEP1">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_AFS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_AFS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x79F" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7BF" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="4" top="51" right="104" bottom="83"/>
<Script>print("parGcj:"..DString_C131_Car_Tpye)</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="1690" top="534" right="1790" bottom="566"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="大灯">
<Rect left="4" top="275" right="104" bottom="307"/>
<TitleText Enable="1" Text="大灯(AFS)"/>
<Script></Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="清DTC">
<Rect left="3" top="331" right="103" bottom="363"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1605" name="DEP2" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1690" top="484" right="1790" bottom="516"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="3" top="170" right="103" bottom="202"/>
<Line1Text Enable="1" Text="AFS 建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="切诊断">
<Rect left="2" top="384" right="102" bottom="416"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(200)
</Script><assessment no="1604" name="DEP1079" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="1" top="437" right="101" bottom="469"/>
<Line1Text Enable="1" Text="安全访问"/>
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
</Script><assessment no="1606" name="DEP3" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="发送key">
<Rect left="3" top="541" right="103" bottom="573"/>
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

</Script><assessment no="1607" name="DEP25" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="比对零件号">
<Rect left="230" top="174" right="330" bottom="206"/>
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
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
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
end
</Script><assessment no="1" name="DEP214" type="8" flags="105"/>
</Activity>
<Activity id="22" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="114" right="296" bottom="146"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="读硬件号">
<Rect left="340" top="174" right="440" bottom="206"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@11);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP215" type="8" flags="105"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="延时300MS">
<Rect left="340" top="224" right="440" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="28" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="114" right="406" bottom="146"/>
</Activity>
<Activity id="29" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="114" right="616" bottom="146"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="114" right="516" bottom="146"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="450" top="174" right="550" bottom="206"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP372" type="8" flags="105"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="延时300MS">
<Rect left="450" top="224" right="550" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="42" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="114" right="746" bottom="146"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="680" top="174" right="780" bottom="206"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="AG";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("AG" == DString1)then
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
end</Script><assessment no="5" name="DEP217" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="3" flags="0" name="读软件号">
<Rect left="550" top="174" right="650" bottom="206"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@11);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP216" type="8" flags="105"/>
</Activity>
<Activity id="51" ActivityType="3" flags="0" name="延时300MS">
<Rect left="550" top="224" right="650" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="延时300MS">
<Rect left="680" top="224" right="780" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1230" top="174" right="1330" bottom="206"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP218" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1230" top="214" right="1330" bottom="246"/>
<Line1Text Enable="1" Text="比对VIN码"/>
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
end</Script><assessment no="7" name="DEP373" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="日期读取">
<Rect left="1370" top="234" right="1470" bottom="266"/>
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
<Rect left="1370" top="184" right="1470" bottom="216"/>
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
<Rect left="1264" top="114" right="1296" bottom="146"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="1404" top="114" right="1436" bottom="146"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="写配置码">
<Rect left="1490" top="184" right="1590" bottom="216"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP375" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1600" top="184" right="1700" bottom="216"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(string.char(@3));
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.StatValue= DString_Read_Config_Code_From_ECU;
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
</Script><assessment no="11" name="DEP374" type="8" flags="105"/>
</Activity>
<Activity id="91" ActivityType="4" flags="0" name="路由节点">
<Rect left="1524" top="114" right="1556" bottom="146"/>
</Activity>
<Activity id="110" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1490" top="234" right="1590" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="111" ActivityType="4" flags="0" name="路由节点">
<Rect left="1634" top="114" right="1666" bottom="146"/>
</Activity>
<Activity id="114" ActivityType="13" flags="0" name="sec_afs">
<Rect left="2" top="488" right="102" bottom="520"/>
<FunctionRef id="sec_afs">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="通讯">
<Rect left="3" top="219" right="103" bottom="251"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1602" name="DEP24" type="8" flags="97"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="通讯失败">
<Rect left="121" top="219" right="221" bottom="251"/>
<Line1Text Enable="1" Text="AFS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="119" ActivityType="4" flags="0" name="路由节点">
<Rect left="156" top="484" right="188" bottom="516"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="结束通讯">
<Rect left="122" top="171" right="222" bottom="203"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="121" ActivityType="4" flags="0" name="路由节点">
<Rect left="1724" top="114" right="1756" bottom="146"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="混动车型">
<Rect left="810" top="174" right="910" bottom="206"/>
<Script></Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="810" top="224" right="910" bottom="256"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="AC";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("AC" == DString1)then
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
end</Script><assessment no="5" name="DEP217" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="延时300MS">
<Rect left="810" top="274" right="910" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="125" ActivityType="4" flags="0" name="路由节点">
<Rect left="844" top="114" right="876" bottom="146"/>
</Activity>
<Activity id="126" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="374" right="1046" bottom="406"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="改脸">
<Rect left="930" top="174" right="1030" bottom="206"/>
<Script></Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="930" top="224" right="1030" bottom="256"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="AB";
		DString1=string.char(@3,@4);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="AC";
		DString1=string.char(@3,@4);
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="AC";
		DString1=string.char(@3,@4);
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="AC";
		DString1=string.char(@3,@4);
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="AC";
		DString1=string.char(@3,@4);
	else
		StandValue="AC";
		DString1=string.char(@3,@4);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("AC" == DString1)then
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
end</Script><assessment no="5" name="DEP217" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="延时300MS">
<Rect left="930" top="274" right="1030" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="130" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="114" right="996" bottom="146"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="大灯（AFS）">
<Rect left="3" top="106" right="103" bottom="138"/>
<TitleText Enable="1" Text="大灯 (AFS)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="19年型">
<Rect left="1050" top="174" right="1150" bottom="206"/>
<Script></Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1050" top="224" right="1150" bottom="256"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="AC";
	
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
end</Script><assessment no="5" name="DEP217" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1050" top="274" right="1150" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="1084" top="114" right="1116" bottom="146"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="132" type="0">
</Transition>
<Transition StartId="2" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="1" type="0">
</Transition>
<Transition StartId="10" EndId="116" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="114" type="0">
</Transition>
<Transition StartId="14" EndId="22" type="0">
</Transition>
<Transition StartId="21" EndId="28" type="0">
</Transition>
<Transition StartId="22" EndId="21" type="1">
<Expression>C131_AFS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="22" EndId="28" type="0">
</Transition>
<Transition StartId="25" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="30" type="0">
</Transition>
<Transition StartId="28" EndId="25" type="1">
<Expression>C131_AFS_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="28" EndId="30" type="0">
</Transition>
<Transition StartId="29" EndId="49" type="1">
<Expression>C131_AFS_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="29" EndId="42" type="0">
</Transition>
<Transition StartId="30" EndId="29" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="1">
<Expression>C131_AFS_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="31" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="29" type="0">
</Transition>
<Transition StartId="42" EndId="125" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="1">
<Expression>C131_AFS_SVP_Execute_Flag and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="43" EndId="61" type="0">
</Transition>
<Transition StartId="49" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="42" type="0">
</Transition>
<Transition StartId="61" EndId="126" type="0">
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
<Expression>C131_AFS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="74" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="72" type="1">
<Expression>C131_AFS_EID_Execute_Flag == ture</Expression></Transition>
<Transition StartId="85" EndId="91" type="0">
</Transition>
<Transition StartId="89" EndId="110" type="0">
</Transition>
<Transition StartId="90" EndId="121" type="0">
</Transition>
<Transition StartId="91" EndId="89" type="1">
<Expression>(DString_C131_VariCoding ~= "")and(C131_AFS_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="91" EndId="111" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="90" type="1">
<Expression>((DString_C131_VariCoding ~= "")and(C131_AFS_WD_Execute_Flag == true or VMTLOC=="FIN")) </Expression></Transition>
<Transition StartId="111" EndId="121" type="0">
</Transition>
<Transition StartId="114" EndId="14" type="0">
</Transition>
<Transition StartId="116" EndId="118" type="4">
</Transition>
<Transition StartId="116" EndId="2" type="3">
</Transition>
<Transition StartId="118" EndId="119" type="5">
</Transition>
<Transition StartId="118" EndId="120" type="0">
</Transition>
<Transition StartId="119" EndId="9" type="0">
</Transition>
<Transition StartId="120" EndId="10" type="0">
</Transition>
<Transition StartId="121" EndId="9" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="126" type="0">
</Transition>
<Transition StartId="125" EndId="122" type="1">
<Expression>C131_AFS_SVP_Execute_Flag and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="125" EndId="130" type="0">
</Transition>
<Transition StartId="126" EndId="74" type="0">
</Transition>
<Transition StartId="127" EndId="128" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="0">
</Transition>
<Transition StartId="129" EndId="126" type="0">
</Transition>
<Transition StartId="130" EndId="127" type="1">
<Expression>C131_AFS_SVP_Execute_Flag and  LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="130" EndId="136" type="0">
</Transition>
<Transition StartId="132" EndId="10" type="0">
</Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="126" type="0">
</Transition>
<Transition StartId="136" EndId="74" type="0">
</Transition>
<Transition StartId="136" EndId="133" type="1">
<Expression>C131_AFS_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
</Transitions>
</Process>

