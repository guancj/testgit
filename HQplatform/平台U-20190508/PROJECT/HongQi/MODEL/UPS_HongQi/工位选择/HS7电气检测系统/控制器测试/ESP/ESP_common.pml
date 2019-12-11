<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3007" pbltext="DEP63">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AC" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="160" top="54" right="260" bottom="86"/>
<Script></Script><TitleText Enable="1" Text="ESP电子稳定系统"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect top="924" right="100" bottom="956"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="160" top="114" right="260" bottom="146"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="160" top="294" right="260" bottom="326"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03


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

end</Script><assessment no="4" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="160" top="344" right="260" bottom="376"/>
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
</Script><assessment no="3" name="DEP66" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="160" top="454" right="260" bottom="486"/>
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


</Script><assessment no="5" name="DEP67" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="160" top="394" right="260" bottom="426"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB9DC8BED"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="通讯">
<Rect left="160" top="174" right="260" bottom="206"/>
<Script>#COMM 0x22 0xf1 0x87
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

end</Script><assessment no="1" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="通讯失败">
<Rect top="174" right="100" bottom="206"/>
<Line1Text Enable="1" Text="EGSM控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="结束通讯">
<Rect top="114" right="100" bottom="146"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="比对零件号">
<Rect left="160" top="514" right="260" bottom="546"/>
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
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Partnumber)));
        engine.println("ESP读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP268" type="8" flags="97"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="160" top="564" right="260" bottom="596"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="95241";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("ESP读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP270" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="发送VIN">
<Rect left="300" top="564" right="400" bottom="596"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script><assessment no="11" name="DEP271" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="检查VIN">
<Rect left="300" top="614" right="400" bottom="646"/>
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
end
#DELAY  50</Script><assessment no="12" name="DEP272" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="日期读取">
<Rect left="420" top="614" right="520" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="发送时间">
<Rect left="420" top="564" right="520" bottom="596"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
#DELAY  50</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="写配置码">
<Rect left="550" top="564" right="650" bottom="596"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0xF1 0xA1 VariCoding

if(engine.LastError == 0 ) then 
engine.StatValue=HorLConfig;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end </Script><assessment no="13" name="DEP274" type="8" flags="97"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="比对配置码">
<Rect left="690" top="864" right="790" bottom="896"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_VariCoding);

if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (DString_Read_Config_Code_From_ECU == DString_VariCoding) then
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
end</Script><assessment no="14" name="DEP275" type="8" flags="97"/>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1230" top="474" right="1330" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="202" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="690" top="644" right="790" bottom="676"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x11 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP2490" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="延时3000ms">
<Rect left="690" top="704" right="790" bottom="736"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="924" right="756" bottom="956"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="清DTC">
<Rect left="690" top="774" right="790" bottom="806"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1050" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="384" right="106" bottom="416"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="清DTC">
<Rect left="160" top="244" right="260" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="清除DTC"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1050" type="8" flags="97"/>
</Activity>
<Activity id="212" ActivityType="13" flags="0" name="读故障码">
<Rect left="1230" top="734" right="1330" bottom="766"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x09"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="1230" top="794" right="1330" bottom="826"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;C00A800&quot;,&quot;U042886&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_ESP&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP2062" type="8" flags="97"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="延迟1秒">
<Rect left="690" top="564" right="790" bottom="596"/>
<Script>#DELAY 1000</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="8" EndId="19" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="4">
</Transition>
<Transition StartId="15" EndId="209" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="16" EndId="2" type="5">
</Transition>
<Transition StartId="17" EndId="5" type="0">
</Transition>
<Transition StartId="19" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="195" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="193" EndId="2" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="197" EndId="199" type="0">
</Transition>
<Transition StartId="198" EndId="197" type="0">
</Transition>
<Transition StartId="199" EndId="217" type="0">
</Transition>
<Transition StartId="200" EndId="206" type="0">
</Transition>
<Transition StartId="202" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="207" type="0">
</Transition>
<Transition StartId="206" EndId="2" type="0">
</Transition>
<Transition StartId="207" EndId="200" type="0">
</Transition>
<Transition StartId="208" EndId="19" type="0">
</Transition>
<Transition StartId="209" EndId="6" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="209" EndId="208" type="0">
</Transition>
<Transition StartId="212" EndId="216" type="0">
</Transition>
<Transition StartId="217" EndId="202" type="0">
</Transition>
</Transitions>
</Process>

