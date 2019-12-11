<?xml version="1.0" encoding="utf-8" ?>
<Process description="--[[ &#13;&#10;************************************************************************************************************************&#13;&#10;This is used to explain the relationsihp between Config DID and Coding Variant&#13;&#10;History:&#13;&#10;    11/10/2016, developer : Zhushaodong created&#13;&#10;&#13;&#10;0101=DString_C131_HorLConfig       --配置码&#13;&#10;0100=DString_C131_VariCoding       --DVD配置码&#13;&#10;0113=DString_C131_BattConfig       --混动电池配置码&#13;&#10;0116=DString_C131_DVDConfig       --蓝图电池配置码&#13;&#10;&#13;&#10;************************************************************************************************************************&#13;&#10;--]]&#13;&#10;" flags="1" block="1" ptbtext="DEP164" group="1129" pbltext="DEP18">
<Parameters>
<Variable id="C131_GATEWAY_VIN_Execute_Flag" type="11" dir="0" data="C131_GATEWAY_VIN_Execute_Flag"/>
<Variable id="C131_GATEWAY_EID_Execute_Flag" type="11" dir="0" data="C131_GATEWAY_EID_Execute_Flag"/>
<Variable id="C131_GATEWAY_WD_Execute_Flag" type="11" dir="0" data="C131_GATEWAY_WD_Execute_Flag"/>
<Variable id="DString_C131_VariCoding0101" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="DString_C131_VariCoding0116" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_Car_Type" type="8" dir="0" data="&quot;&quot;"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="C131_GATEWAY_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_RCOD_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7F0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7F1" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="140" top="14" right="240" bottom="46"/>
<Script>engine.println("VMTLOC:"..VMTLOC);
engine.println("WorkPlace:"..engine.WorkPlace);</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="450" top="1134" right="550" bottom="1166"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="网关 (GATEWAY)">
<Rect left="140" top="74" right="240" bottom="106"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="140" top="234" right="240" bottom="266"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2105" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="自动测试">
<Rect left="450" top="664" right="550" bottom="696"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电压"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="GW 读蓄电池电压">
<Rect left="450" top="714" right="550" bottom="746"/>
<Strategy TotalTime="100" NokTime="5" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x10
if(@0==0x62)then

voltage=((@2*256+@3)*0.0009765625)+3.0
engine.println("voltage="..voltage);
if ((3&lt;voltage) and (voltage&lt;18 )) then
  engine.LastError = 0;
  engine.StatValue=voltage;

 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=voltage;
  engine.StatLower=3.0;
  engine.StatUpper=18.0;

end
engine.SetLineText(3,"#L=BMPBAR,".."3.0"..",".."18.0"..",".."1"..","..tostring(voltage));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="16" name="DEP631" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="4" flags="0" name="条件1 ">
<Rect left="484" top="594" right="516" bottom="626"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="GW 读发电机电压">
<Rect left="450" top="814" right="550" bottom="846"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x13
if(@0==0x62)then
--resu = ((RecvTel[Pos]* Mult ) + Smd) * 1.0
voltage=((@2*0.1)+10.6)*1.0
engine.println("voltage="..voltage);
if ((10.6&lt;voltage) and (voltage&lt;16.0)) then
  engine.LastError = 0;
  engine.StatValue=voltage;
  --OK=OK+1;
  --engine.SetLineText(4,i..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=voltage;
  engine.StatLower=10.6;
  engine.StatUpper=16.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,"#L=BMPBAR,".."3.0"..",".."18.0"..",".."1"..","..tostring(voltage));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="17" name="DEP632" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="GW 读发电机电流">
<Rect left="450" top="924" right="550" bottom="956"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x14
if(@0==0x62)then
--resu = ((RecvTel[Pos]* Mult ) + Smd) * 1.0
current=(@2*0.25)*1.0
engine.println("current="..current);
if ((current&lt;7.75) and (current&gt;0)) then
  engine.LastError = 0;
  engine.StatValue=current;
  --OK=OK+1;
  --engine.SetLineText(4,i..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=current;
  engine.StatLower=0;
  engine.StatUpper=7.75;
  --NOK=NOK+1;
  --engine.SetLineText(3,"发电机电流"..NOK);
end
--engine.SetLineText(3,"发电机电流"..current);
engine.SetLineText(3,"#L=BMPBAR,".."0.0"..",".."7.75"..",".."1"..","..tostring(current));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="18" name="DEP633" type="8" flags="97"/>
</Activity>
<Activity id="98" ActivityType="3" flags="0" name="自动测试">
<Rect left="450" top="764" right="550" bottom="796"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发电机电压"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="自动测试">
<Rect left="450" top="864" right="550" bottom="896"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发电机电流"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="202" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="450" top="1084" right="550" bottom="1116"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="203" ActivityType="3" flags="0" name="连接ECU">
<Rect left="140" top="124" right="240" bottom="156"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="切诊断">
<Rect left="140" top="284" right="240" bottom="316"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2106" name="DEP1097" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="140" top="334" right="240" bottom="366"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2152" name="DEP22" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="计算">
<Rect left="140" top="384" right="240" bottom="416"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FACCE9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="发送key">
<Rect left="140" top="444" right="240" bottom="476"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2153" name="DEP22" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="比对零件号">
<Rect left="250" top="84" right="350" bottom="116"/>
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
end</Script><assessment no="1" name="DEP322" type="8" flags="105"/>
</Activity>
<Activity id="214" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="34" right="316" bottom="66"/>
</Activity>
<Activity id="215" ActivityType="3" flags="0" name="读硬件号">
<Rect left="380" top="84" right="480" bottom="116"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP323" type="8" flags="105"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="延时50MS">
<Rect left="380" top="134" right="480" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="414" top="34" right="446" bottom="66"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="34" right="716" bottom="66"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="34" right="576" bottom="66"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="510" top="84" right="610" bottom="116"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP324" type="8" flags="105"/>
</Activity>
<Activity id="229" ActivityType="3" flags="0" name="读软件号">
<Rect left="650" top="84" right="750" bottom="116"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP325" type="8" flags="105"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="延时50MS">
<Rect left="650" top="134" right="750" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="770" top="84" right="870" bottom="116"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue=LibGeneral.GWsoftVerNum(DString_C131_Car_Type) 
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
end</Script><assessment no="49" name="DEP326" type="8" flags="105"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="延时50MS">
<Rect left="770" top="134" right="870" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="34" right="836" bottom="66"/>
</Activity>
<Activity id="241" ActivityType="3" flags="0" name="发送VIN">
<Rect left="920" top="84" right="1020" bottom="116"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP327" type="8" flags="97"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="检查VIN">
<Rect left="920" top="134" right="1020" bottom="166"/>
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
end</Script><assessment no="7" name="DEP328" type="8" flags="97"/>
</Activity>
<Activity id="243" ActivityType="3" flags="0" name="日期读取">
<Rect left="1070" top="134" right="1170" bottom="166"/>
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
<Activity id="245" ActivityType="3" flags="0" name="发送时间">
<Rect left="1070" top="84" right="1170" bottom="116"/>
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
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="34" right="986" bottom="66"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="延时50MS">
<Rect left="510" top="134" right="610" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="253" ActivityType="4" flags="0" name="路由节点">
<Rect left="1234" top="34" right="1266" bottom="66"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="34" right="1136" bottom="66"/>
</Activity>
<Activity id="259" ActivityType="3" flags="0" name="写0101">
<Rect left="1200" top="94" right="1300" bottom="126"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>engine.SetLineText(3,DString_C131_VariCoding0101);
engine.println("配置码:"..DString_C131_VariCoding0101);
#COMM 0x2e 0x01 0x01 hex2bin(DString_C131_VariCoding0101)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP329" type="8" flags="97"/>
</Activity>
<Activity id="260" ActivityType="3" flags="0" name="检查0101配置码">
<Rect left="1330" top="94" right="1430" bottom="126"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x01
engine.println("配置码0101标准值:"..DString_C131_VariCoding0101);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_C131_VariCoding0101);
        DString_Read_Config_Code_From_ECU=hexstr(DString_Read_Config_Code_From_ECU);
	engine.println("检查0101配置:"..DString_Read_Config_Code_From_ECU);
	
	if (DString_Read_Config_Code_From_ECU == DString_C131_VariCoding0101) then
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
	engine.StatPoint=DString_C131_VariCoding0101;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="13" name="DEP330" type="8" flags="97"/>
</Activity>
<Activity id="303" ActivityType="3" flags="0" name="通讯">
<Rect left="140" top="174" right="240" bottom="206"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2103" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="304" ActivityType="3" flags="0" name="通讯失败">
<Rect left="20" top="174" right="120" bottom="206"/>
<Line1Text Enable="1" Text="GATEWAY 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="305" ActivityType="4" flags="0" name="路由节点">
<Rect left="44" top="1084" right="76" bottom="1116"/>
</Activity>
<Activity id="306" ActivityType="3" flags="0" name="结束通讯">
<Rect left="20" top="124" right="120" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="312" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1200" top="144" right="1300" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="320" ActivityType="4" flags="0" name="路由节点">
<Rect left="1364" top="34" right="1396" bottom="66"/>
</Activity>
<Activity id="356" ActivityType="3" flags="0" name="写车型">
<Rect left="920" top="194" right="1020" bottom="226"/>
<Line1Text Enable="1" Text="写车型代码"/>
<Script>
local carType = engine.CarType
engine.SetLineText(3,carType);
#COMM 0x2e 0xF1 0xA0 carType 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20
local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end</Script><assessment no="57" name="DEP1181" type="8" flags="97"/>
</Activity>
<Activity id="357" ActivityType="3" flags="0" name="检查车型">
<Rect left="920" top="244" right="1020" bottom="276"/>
<Line1Text Enable="1" Text="比对车型代码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA0
local carType = engine.CarType
engine.SetLineText(2,carType);
engine.println("车型标准值:"..carType);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
	engine.SetLineText(3,DString1);
	engine.println("读到车型代值:"..DString1);
	if (string.match(DString1,carType)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=carType;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="58" name="DEP1182" type="8" flags="97"/>
</Activity>
<Activity id="367" ActivityType="4" flags="0" name="路由节点">
<Rect left="1494" top="34" right="1526" bottom="66"/>
</Activity>
<Activity id="368" ActivityType="3" flags="0" name="写0116">
<Rect left="1460" top="94" right="1560" bottom="126"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>engine.SetLineText(3,DString_C131_VariCoding0116);
engine.println("配置码:"..DString_C131_VariCoding0116);
#COMM 0x2e 0x01 0x16 hex2bin(DString_C131_VariCoding0116)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="54" name="DEP331" type="8" flags="97"/>
</Activity>
<Activity id="369" ActivityType="3" flags="0" name="检查0116配置码">
<Rect left="1580" top="94" right="1680" bottom="126"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x16
engine.println("配置码0116标准值:"..DString_C131_VariCoding0116);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_C131_VariCoding0116);
        DString_Read_Config_Code_From_ECU=hexstr(DString_Read_Config_Code_From_ECU);
	engine.println("检查0116配置:"..DString_Read_Config_Code_From_ECU);
	
	if (DString_Read_Config_Code_From_ECU == DString_C131_VariCoding0116) then
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
	engine.StatPoint=DString_C131_VariCoding0116;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="59" name="DEP2461" type="8" flags="97"/>
</Activity>
<Activity id="370" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1460" top="144" right="1560" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="371" ActivityType="4" flags="0" name="路由节点">
<Rect left="1614" top="34" right="1646" bottom="66"/>
</Activity>
<Activity id="377" ActivityType="4" flags="0" name="路由节点">
<Rect left="1774" top="34" right="1806" bottom="66"/>
</Activity>
<Activity id="380" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="594" right="326" bottom="626"/>
</Activity>
<Activity id="381" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="1084" right="326" bottom="1116"/>
</Activity>
<Activity id="382" ActivityType="3" flags="0" name="清DTC">
<Rect left="1740" top="594" right="1840" bottom="626"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2105" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="383" ActivityType="3" flags="0" name="调整乘员侧座椅前后">
<Rect left="450" top="974" right="550" bottom="1006"/>
<Line1Text Enable="1" Text="请调整乘员侧座椅调整按钮"/>
<Line2Text Enable="1" Text="#L=座椅可以前后动作吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以前后动作吗？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确认";
   engine.println("人工操作点击确认");
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以前后动作吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃";
   engine.println("人工操作点击放弃");
else
end
</Script><assessment no="50" name="DEP2458" type="8" flags="97"/>
</Activity>
<Activity id="384" ActivityType="3" flags="0" name="调整乘员侧靠背">
<Rect left="450" top="1034" right="550" bottom="1066"/>
<Line1Text Enable="1" Text="请调整乘员侧靠背调整按钮"/>
<Line2Text Enable="1" Text="#L=靠背可以前后动作吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=靠背可以前后动作吗？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确定";
   engine.println("人工操作点击确认");
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=靠背可以前后动作吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃";
   engine.println("人工操作点击放弃");
else
end
</Script><assessment no="53" name="DEP2460" type="8" flags="97"/>
</Activity>
<Activity id="385" ActivityType="3" flags="0" name="调整乘员座椅上下">
<Rect left="590" top="1034" right="690" bottom="1066"/>
<Line1Text Enable="1" Text="请调整乘员侧座椅调整按钮"/>
<Line2Text Enable="1" Text="#L=座椅可以上下动作吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
engine.println("车型："..DString_C131_Car_Type)
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以上下动作吗？#R=BMPOK");
   engine.LastError = 0;
   engine.StatValue="人工操作点击确认";
   engine.println("人工操作点击确认");
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以上下动作吗？？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
   engine.StatValue="人工操作点击放弃";
   engine.println("人工操作点击放弃");
else
end
</Script><assessment no="52" name="DEP2459" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="203" type="0">
</Transition>
<Transition StartId="4" EndId="204" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="98" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="1">
<Expression>engine.WorkPlace=="TR2"</Expression></Transition>
<Transition StartId="10" EndId="380" type="0">
</Transition>
<Transition StartId="11" EndId="101" type="0">
</Transition>
<Transition StartId="13" EndId="383" type="0">
</Transition>
<Transition StartId="98" EndId="11" type="0">
</Transition>
<Transition StartId="101" EndId="13" type="0">
</Transition>
<Transition StartId="202" EndId="2" type="0">
</Transition>
<Transition StartId="203" EndId="303" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="214" type="0">
</Transition>
<Transition StartId="213" EndId="218" type="0">
</Transition>
<Transition StartId="214" EndId="213" type="1">
<Expression>C131_GATEWAY_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="214" EndId="218" type="0">
</Transition>
<Transition StartId="215" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="220" type="0">
</Transition>
<Transition StartId="218" EndId="215" type="1">
<Expression>C131_GATEWAY_HN_Execute_Flag</Expression></Transition>
<Transition StartId="218" EndId="220" type="0">
</Transition>
<Transition StartId="219" EndId="229" type="1">
<Expression>C131_GATEWAY_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="219" EndId="240" type="0">
</Transition>
<Transition StartId="220" EndId="221" type="1">
<Expression>C131_GATEWAY_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="220" EndId="219" type="0">
</Transition>
<Transition StartId="221" EndId="247" type="0">
</Transition>
<Transition StartId="229" EndId="231" type="0">
</Transition>
<Transition StartId="231" EndId="240" type="0">
</Transition>
<Transition StartId="236" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="246" type="0">
</Transition>
<Transition StartId="240" EndId="236" type="1">
<Expression>C131_GATEWAY_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="240" EndId="246" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="356" type="0">
</Transition>
<Transition StartId="242" EndId="256" type="0">
</Transition>
<Transition StartId="243" EndId="253" type="0">
</Transition>
<Transition StartId="245" EndId="243" type="0">
</Transition>
<Transition StartId="246" EndId="241" type="1">
<Expression>C131_GATEWAY_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="246" EndId="256" type="0">
</Transition>
<Transition StartId="247" EndId="219" type="0">
</Transition>
<Transition StartId="253" EndId="259" type="1">
<Expression>C131_GATEWAY_WD_Execute_Flag == true</Expression></Transition>
<Transition StartId="253" EndId="320" type="0">
</Transition>
<Transition StartId="256" EndId="245" type="1">
<Expression>C131_GATEWAY_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="256" EndId="253" type="0">
</Transition>
<Transition StartId="259" EndId="312" type="0">
</Transition>
<Transition StartId="260" EndId="367" type="0">
</Transition>
<Transition StartId="303" EndId="4" type="3">
</Transition>
<Transition StartId="303" EndId="304" type="4">
</Transition>
<Transition StartId="304" EndId="306" type="0">
</Transition>
<Transition StartId="304" EndId="305" type="5">
</Transition>
<Transition StartId="305" EndId="381" type="0">
</Transition>
<Transition StartId="306" EndId="203" type="0">
</Transition>
<Transition StartId="312" EndId="320" type="0">
</Transition>
<Transition StartId="320" EndId="260" type="1">
<Expression>C131_GATEWAY_RCOD_Execute_Flag == true</Expression></Transition>
<Transition StartId="320" EndId="367" type="0">
</Transition>
<Transition StartId="356" EndId="357" type="0">
</Transition>
<Transition StartId="357" EndId="256" type="0">
</Transition>
<Transition StartId="367" EndId="368" type="1">
<Expression>C131_GATEWAY_WD_Execute_Flag == true</Expression></Transition>
<Transition StartId="367" EndId="371" type="0">
</Transition>
<Transition StartId="368" EndId="370" type="0">
</Transition>
<Transition StartId="369" EndId="377" type="0">
</Transition>
<Transition StartId="370" EndId="371" type="0">
</Transition>
<Transition StartId="371" EndId="369" type="1">
<Expression>C131_GATEWAY_RCOD_Execute_Flag == true</Expression></Transition>
<Transition StartId="371" EndId="377" type="0">
</Transition>
<Transition StartId="377" EndId="382" type="0">
</Transition>
<Transition StartId="380" EndId="381" type="0">
</Transition>
<Transition StartId="381" EndId="202" type="0">
</Transition>
<Transition StartId="382" EndId="10" type="0">
</Transition>
<Transition StartId="383" EndId="384" type="0">
</Transition>
<Transition StartId="383" EndId="385" type="1">
<Expression>DString_C131_Car_Type ~= "CH1GM41" and DString_C131_Car_Type ~= "CH1GM42" and DString_C131_Car_Type ~= "CH1GM40" and DString_C131_Car_Type ~= "CMNA02A" and DString_C131_Car_Type ~= "CMNA01A"</Expression></Transition>
<Transition StartId="384" EndId="202" type="0">
</Transition>
<Transition StartId="385" EndId="384" type="0">
</Transition>
</Transitions>
</Process>

