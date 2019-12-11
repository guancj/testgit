<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="110" top="14" right="210" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="110" top="884" right="210" bottom="916"/>
<Script>#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="PEPS">
<Rect left="110" top="74" right="210" bottom="106"/>
<TitleText Enable="1" Text="智能进入与启动(PEPS)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="110" top="124" right="210" bottom="156"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="110" top="334" right="210" bottom="366"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="480" top="334" right="580" bottom="366"/>
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
<Rect left="480" top="494" right="580" bottom="526"/>
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
<Rect left="480" top="414" right="580" bottom="446"/>
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
<Rect left="110" top="174" right="210" bottom="206"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
           engine.StatValue="通讯失败";
end
</Script><assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="174" right="370" bottom="206"/>
<Line1Text Enable="1" Text="PEPS控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="结束通讯">
<Rect left="270" top="124" right="370" bottom="156"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="比对零件号">
<Rect left="110" top="414" right="210" bottom="446"/>
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
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="6" name="DEP359" type="8" flags="105"/>
</Activity>
<Activity id="185" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="490" top="254" right="590" bottom="286"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP361" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="110" top="494" right="210" bottom="526"/>
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
engine.StatPoint = SoftwareNumber.." or "..SoftwareNumber1;</Script><assessment no="10" name="DEP363" type="8" flags="105"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="检查VIN">
<Rect left="110" top="574" right="210" bottom="606"/>
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
end</Script><assessment no="12" name="DEP167" type="8" flags="105"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="日期读取">
<Rect left="110" top="654" right="210" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="比对配置码">
<Rect left="110" top="734" right="210" bottom="766"/>
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
end</Script><assessment no="14" name="DEP366" type="8" flags="105"/>
</Activity>
<Activity id="219" ActivityType="5" flags="0" name="PEPS_ReadDTC">
<Rect left="30" top="804" right="130" bottom="836"/>
<SubProcesses>
<SubProcess id="PEPS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="清DTC">
<Rect left="110" top="254" right="210" bottom="286"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="55" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="420" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="884" right="336" bottom="916"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="15" type="0">
</Transition>
<Transition StartId="6" EndId="180" type="0">
</Transition>
<Transition StartId="7" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="13" type="0">
</Transition>
<Transition StartId="15" EndId="17" type="4">
</Transition>
<Transition StartId="15" EndId="222" type="0">
</Transition>
<Transition StartId="17" EndId="115" type="0">
</Transition>
<Transition StartId="17" EndId="420" type="5">
</Transition>
<Transition StartId="115" EndId="5" type="0">
</Transition>
<Transition StartId="180" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="2" type="0">
</Transition>
<Transition StartId="219" EndId="2" type="0">
</Transition>
<Transition StartId="222" EndId="6" type="0">
</Transition>
<Transition StartId="420" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

