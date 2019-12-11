<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3026" pbltext="DEP26">
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
<Variable id="CAN_SND_ID" type="3" data="0x740" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x748" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="120" top="14" right="220" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="120" top="824" right="220" bottom="856"/>
<Script>
#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="空调(AC)">
<Rect left="120" top="64" right="220" bottom="96"/>
<TitleText Enable="1" Text="空调(AC)"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="连接ECU">
<Rect left="120" top="124" right="220" bottom="156"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="7" ActivityType="3" flags="0" name="切诊断">
<Rect left="120" top="314" right="220" bottom="346"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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

end</Script><assessment no="2" name="DEP1076" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="510" top="324" right="610" bottom="356"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP105" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="发送key">
<Rect left="510" top="424" right="610" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP30" type="8" flags="97"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="通讯">
<Rect left="120" top="174" right="220" bottom="206"/>
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

end</Script><assessment no="1" name="DEP27" type="8" flags="97"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="通讯失败">
<Rect left="260" top="174" right="360" bottom="206"/>
<Line1Text Enable="1" Text="AC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="结束通讯">
<Rect left="260" top="124" right="360" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="比对零件号">
<Rect left="120" top="384" right="220" bottom="416"/>
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
	DString1 = engine.GetResponseString(3,2+#DString_Partnumber);
	
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
</Script><assessment no="6" name="DEP230" type="8" flags="105"/>
</Activity>
<Activity id="181" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="510" top="254" right="610" bottom="286"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@6);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);
--engine.StatValue=DString1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP219" type="8" flags="97"/>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="120" top="464" right="220" bottom="496"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="0103";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("AC读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP221" type="8" flags="105"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="读VIN">
<Rect left="120" top="544" right="220" bottom="576"/>
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="12" name="DEP222" type="8" flags="105"/>
</Activity>
<Activity id="190" ActivityType="3" flags="1" name="日期读取">
<Rect left="120" top="624" right="220" bottom="656"/>
<Script>#COMM 0x22 0xF1 0x9D
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

end</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="检查配置码">
<Rect left="120" top="704" right="220" bottom="736"/>
<Line1Text Enable="1" Text="检查配置码"/>
<Script>#COMM 0x22 0xf1 0xa1
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="14" name="DEP227" type="8" flags="105"/>
</Activity>
<Activity id="203" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="510" top="374" right="610" bottom="406"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x74A846B9"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="204" ActivityType="5" flags="0" name="AC_ReadDTC">
<Rect left="30" top="764" right="130" bottom="796"/>
<SubProcesses>
<SubProcess id="AC_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="清DTC">
<Rect left="120" top="244" right="220" bottom="276"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP28" type="8" flags="97"/>
</Activity>
<Activity id="420" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="824" right="326" bottom="856"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="80" type="0">
</Transition>
<Transition StartId="7" EndId="173" type="0">
</Transition>
<Transition StartId="76" EndId="203" type="0">
</Transition>
<Transition StartId="80" EndId="82" type="4">
</Transition>
<Transition StartId="80" EndId="207" type="0">
</Transition>
<Transition StartId="82" EndId="172" type="0">
</Transition>
<Transition StartId="82" EndId="420" type="5">
</Transition>
<Transition StartId="172" EndId="6" type="0">
</Transition>
<Transition StartId="173" EndId="184" type="0">
</Transition>
<Transition StartId="184" EndId="189" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="199" type="0">
</Transition>
<Transition StartId="199" EndId="2" type="0">
</Transition>
<Transition StartId="203" EndId="77" type="0">
</Transition>
<Transition StartId="204" EndId="2" type="0">
</Transition>
<Transition StartId="207" EndId="7" type="0">
</Transition>
<Transition StartId="420" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

