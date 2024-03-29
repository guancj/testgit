<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3012" pbltext="DEP1678">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A6" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AE" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="34" right="590" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="290" top="824" right="390" bottom="856"/>
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
<Activity id="3" ActivityType="3" flags="0" name="驾驶模式控制单元(DMSCU)">
<Rect left="490" top="94" right="590" bottom="126"/>
<TitleText Enable="1" Text="驾驶模式控制单元(DMSCU)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="490" top="134" right="590" bottom="166"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="490" top="294" right="590" bottom="326"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1681" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="490" top="354" right="590" bottom="386"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1682" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="490" top="464" right="590" bottom="496"/>
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
</Script><assessment no="5" name="DEP1683" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="13" flags="0" name="计算">
<Rect left="490" top="414" right="590" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x64873698"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="通讯">
<Rect left="490" top="184" right="590" bottom="216"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end

</Script><assessment no="1" name="DEP1679" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="通讯失败">
<Rect left="290" top="184" right="390" bottom="216"/>
<Line1Text Enable="1" Text="DMSCU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="结束通讯">
<Rect left="290" top="134" right="390" bottom="166"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="比对零件号">
<Rect left="630" top="464" right="730" bottom="496"/>
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
        engine.println("DMSCU读取零件号:"..num)
	if(DString_Partnumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = DString_Partnumber;</Script><assessment no="6" name="DEP1684" type="8" flags="97"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="760" top="464" right="860" bottom="496"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="3624801-DA014014";
SoftwareNumber1 ="3624801-DA014015";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("DMSCU读取软件版本号:"..num)
	if(SoftwareNumber ~= num and SoftwareNumber1 ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber.." or "..SoftwareNumber1;</Script><assessment no="10" name="DEP1688" type="8" flags="97"/>
</Activity>
<Activity id="173" ActivityType="3" flags="0" name="延时50MS">
<Rect left="760" top="514" right="860" bottom="546"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  50</Script></Activity>
<Activity id="174" ActivityType="3" flags="0" name="发送VIN">
<Rect left="900" top="464" right="1000" bottom="496"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

if(engine.LastError == 0 ) then 
engine.StatValue = DString_Write_VIN
else
StringRes = @0-;
engine.StatValue=hexstr(StringRes);
end </Script><assessment no="11" name="DEP1689" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="检查VIN">
<Rect left="900" top="514" right="1000" bottom="546"/>
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
end</Script><assessment no="12" name="DEP1690" type="8" flags="97"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="日期读取">
<Rect left="1030" top="514" right="1130" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="发送时间">
<Rect left="1030" top="464" right="1130" bottom="496"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="178" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1160" top="514" right="1260" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1160" top="824" right="1260" bottom="856"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
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
end</Script><assessment no="14" name="DEP1692" type="8" flags="97"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="写配置码">
<Rect left="1160" top="464" right="1260" bottom="496"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
VariCoding = LibGeneral.str2hex(VariCoding)
#COMM 0x2e 0xF1 0xA1 VariCoding


if(engine.LastError == 0 ) then 
engine.StatValue=DString_VariCoding;
else
recvTel = @0-;
engine.StatValue  = LibGeneral.hex2str(recvTel)
end </Script><assessment no="13" name="DEP1691" type="8" flags="97"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="普通节点">
<Rect left="290" top="374" right="390" bottom="406"/>
<Script>engine.LastError = 1 ;</Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="清DTC">
<Rect left="600" top="234" right="700" bottom="266"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1680" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1160" top="624" right="1260" bottom="656"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1160" top="684" right="1260" bottom="716"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP2487" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="1160" top="744" right="1260" bottom="776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="清DTC">
<Rect left="1160" top="564" right="1260" bottom="596"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1680" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="3" flags="0" name="清DTC">
<Rect left="760" top="824" right="860" bottom="856"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="30" name="DEP1680" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="88" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="73" type="0">
</Transition>
<Transition StartId="8" EndId="92" type="0">
</Transition>
<Transition StartId="73" EndId="8" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="4">
</Transition>
<Transition StartId="88" EndId="6" type="0">
</Transition>
<Transition StartId="89" EndId="91" type="0">
</Transition>
<Transition StartId="89" EndId="188" type="5">
</Transition>
<Transition StartId="91" EndId="5" type="0">
</Transition>
<Transition StartId="92" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="174" type="1">
<Expression>DString_Write_VIN ~= ""</Expression></Transition>
<Transition StartId="173" EndId="208" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="176" EndId="186" type="0">
</Transition>
<Transition StartId="177" EndId="176" type="0">
</Transition>
<Transition StartId="178" EndId="207" type="0">
</Transition>
<Transition StartId="185" EndId="208" type="0">
</Transition>
<Transition StartId="186" EndId="178" type="0">
</Transition>
<Transition StartId="188" EndId="2" type="0">
</Transition>
<Transition StartId="189" EndId="6" type="0">
</Transition>
<Transition StartId="190" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="185" type="0">
</Transition>
<Transition StartId="207" EndId="190" type="0">
</Transition>
<Transition StartId="208" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

