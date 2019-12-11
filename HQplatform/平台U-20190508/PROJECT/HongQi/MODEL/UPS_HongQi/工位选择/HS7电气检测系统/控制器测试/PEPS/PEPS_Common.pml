<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data="PEPS_partnumber"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="700" top="64" right="800" bottom="96"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="540" top="744" right="640" bottom="776"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="PEPS">
<Rect left="700" top="114" right="800" bottom="146"/>
<TitleText Enable="1" Text="智能进入与启动(PEPS)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="700" top="164" right="800" bottom="196"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="700" top="314" right="800" bottom="346"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="700" top="364" right="800" bottom="396"/>
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
</Script><assessment no="4" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="发送key">
<Rect left="700" top="464" right="800" bottom="496"/>
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


</Script><assessment no="5" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="sec_Generic">
<Rect left="700" top="414" right="800" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="通讯">
<Rect left="700" top="214" right="800" bottom="246"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="通讯失败">
<Rect left="540" top="214" right="640" bottom="246"/>
<Line1Text Enable="1" Text="PEPS控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="结束通讯">
<Rect left="540" top="164" right="640" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="比对零件号">
<Rect left="830" top="464" right="930" bottom="496"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,"目标值："..DString_Partnumber);
engine.println("零件号标准值:"..DString_Partnumber);
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(DString_Partnumber)));
        engine.println("PEPS读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP359" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="970" top="464" right="1070" bottom="496"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="130";
SoftwareNumber1 ="131";
if(engine.LastError == 0 ) then
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("PEPS读取软件版本号:"..num)
	if(SoftwareNumber ~= num and SoftwareNumber1 ~= num)then
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
engine.StatPoint = SoftwareNumber.." or "..SoftwareNumber1;
</Script><assessment no="10" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="延时300MS">
<Rect left="970" top="514" right="1070" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1110" top="464" right="1210" bottom="496"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin


if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP168" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1110" top="514" right="1210" bottom="546"/>
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
end</Script><assessment no="12" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="日期读取">
<Rect left="1240" top="514" right="1340" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="发送时间">
<Rect left="1240" top="464" right="1340" bottom="496"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="写配置码">
<Rect left="1380" top="464" right="1480" bottom="496"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0x01 0x00 VariCoding

if(engine.LastError == 0 ) then 
engine.StatValue=DString_VariCoding;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end </Script><assessment no="13" name="DEP365" type="8" flags="97"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="比对配置码">
<Rect left="1540" top="464" right="1640" bottom="496"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
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
end</Script><assessment no="14" name="DEP366" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1380" top="514" right="1480" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1380" top="614" right="1480" bottom="646"/>
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
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1380" top="664" right="1480" bottom="696"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1574" top="744" right="1606" bottom="776"/>
</Activity>
<Activity id="219" ActivityType="3" flags="0" name="清DTC">
<Rect left="1380" top="564" right="1480" bottom="596"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="220" ActivityType="3" flags="0" name="清DTC">
<Rect left="700" top="264" right="800" bottom="296"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="PEPS 读钥匙CID1">
<Rect left="970" top="654" right="1070" bottom="686"/>
<Line1Text Enable="1" Text="PEPS 读钥匙CID1"/>
<Script>#COMM 0x22 0xF1 0xA2
local StringRes;
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

end</Script><assessment no="54" name="DEP364" type="8" flags="99"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="PEPS 读钥匙CID2">
<Rect left="970" top="704" right="1070" bottom="736"/>
<Line1Text Enable="1" Text="PEPS 读钥匙CID2"/>
<Script>#COMM 0x22 0xF1 0xA3
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

end</Script><assessment no="56" name="DEP525" type="8" flags="99"/>
</Activity>
<Activity id="223" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="574" right="1036" bottom="606"/>
</Activity>
<Activity id="226" ActivityType="3" flags="0" name="清DTC">
<Rect left="1380" top="714" right="1480" bottom="746"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP93" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="180" type="0">
</Transition>
<Transition StartId="14" EndId="13" type="0">
</Transition>
<Transition StartId="15" EndId="17" type="4">
</Transition>
<Transition StartId="15" EndId="220" type="0">
</Transition>
<Transition StartId="17" EndId="115" type="0">
</Transition>
<Transition StartId="17" EndId="2" type="5">
</Transition>
<Transition StartId="115" EndId="5" type="0">
</Transition>
<Transition StartId="180" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="195" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="194" EndId="223" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="197" EndId="199" type="0">
</Transition>
<Transition StartId="198" EndId="197" type="0">
</Transition>
<Transition StartId="199" EndId="203" type="0">
</Transition>
<Transition StartId="200" EndId="218" type="0">
</Transition>
<Transition StartId="203" EndId="219" type="0">
</Transition>
<Transition StartId="204" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="226" type="0">
</Transition>
<Transition StartId="218" EndId="2" type="0">
</Transition>
<Transition StartId="219" EndId="204" type="0">
</Transition>
<Transition StartId="220" EndId="6" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="2" type="0">
</Transition>
<Transition StartId="223" EndId="221" type="1">
<Expression>engine.WorkPlace == "TR1"</Expression></Transition>
<Transition StartId="223" EndId="2" type="0">
</Transition>
<Transition StartId="226" EndId="200" type="0">
</Transition>
</Transitions>
</Process>

