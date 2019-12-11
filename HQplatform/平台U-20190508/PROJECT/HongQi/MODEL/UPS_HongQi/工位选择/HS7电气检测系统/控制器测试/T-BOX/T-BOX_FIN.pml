<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3025" pbltext="DEP1174">
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="100" top="34" right="200" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="100" top="1134" right="200" bottom="1166"/>
<Script>
#STOPCOMM</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="T-BOX">
<Rect left="100" top="94" right="200" bottom="126"/>
<TitleText Enable="1" Text="T-BOX"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="100" top="144" right="200" bottom="176"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="100" top="354" right="200" bottom="386"/>
<Line1Text Enable="1" Text="扩展会话"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1188" type="8" flags="97"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="通讯">
<Rect left="100" top="214" right="200" bottom="246"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
  engine.StatValue="通讯失败";
end

</Script><assessment no="1" name="DEP1187" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="通讯失败">
<Rect left="290" top="214" right="390" bottom="246"/>
<Line1Text Enable="1" Text="T-BOX控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#STOPCOMM
engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="结束通讯">
<Rect left="290" top="144" right="390" bottom="176"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="比对零件号">
<Rect left="100" top="594" right="200" bottom="626"/>
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
end</Script><assessment no="6" name="DEP1194" type="8" flags="105"/>
</Activity>
<Activity id="218" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="100" top="654" right="200" bottom="686"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="03.02.10";
SoftwareNumber1 ="03.02.11";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("T-BOX读取软件版本号:"..num)
	if(SoftwareNumber ~= num and num ~= SoftwareNumber1)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber.."or"..SoftwareNumber1</Script><assessment no="10" name="DEP1199" type="8" flags="105"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="检查VIN">
<Rect left="100" top="714" right="200" bottom="746"/>
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
end</Script><assessment no="12" name="DEP1192" type="8" flags="105"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="日期读取">
<Rect left="100" top="774" right="200" bottom="806"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="231" ActivityType="3" flags="0" name="检查配置码">
<Rect left="100" top="854" right="200" bottom="886"/>
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
end</Script><assessment no="14" name="DEP1742" type="8" flags="105"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="清DTC">
<Rect left="100" top="284" right="200" bottom="316"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP1189" type="8" flags="97"/>
</Activity>
<Activity id="420" ActivityType="4" flags="0" name="路由节点">
<Rect left="324" top="1134" right="356" bottom="1166"/>
</Activity>
<Activity id="422" ActivityType="3" flags="0" name="延时15s">
<Rect left="100" top="984" right="200" bottom="1016"/>
<Line2Text Enable="1" Text="等待15秒后读取结果"/>
<Script>for t=15,1,-1 do
engine.SetLineText(3,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="423" ActivityType="3" flags="0" name="EOL后台检测结果">
<Rect left="100" top="1054" right="200" bottom="1086"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local ncount = 0

repeat
	ncount = ncount + 1
#COMM 0x31 0x03 0xE7 0x62

	engine.Delay(200)
until (@4 == 0x00 or ncount  == 13)
if(@0 == 0x71)then
  if (@4 == 0x00) then
	engine.LastError = 0
  else
	engine.LastError = 1
  end
else
        engine.LastError = 1
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP2113" type="8" flags="105"/>
</Activity>
<Activity id="426" ActivityType="3" flags="0" name="EOL后台">
<Rect left="100" top="924" right="200" bottom="956"/>
<Line2Text Enable="1" Text="开启后台通讯"/>
<Script>#COMM 0x31 0x01 0xE7 0x62
if(@0 == 0x71)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="119" name="DEP2112" type="8" flags="97"/>
</Activity>
<Activity id="427" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="100" top="434" right="200" bottom="466"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="104" name="DEP1203" type="8" flags="97"/>
</Activity>
<Activity id="428" ActivityType="13" flags="0" name="计算key">
<Rect left="100" top="494" right="200" bottom="526"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA7DB79EC"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="429" ActivityType="3" flags="0" name="发送key">
<Rect left="100" top="544" right="200" bottom="576"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="105" name="DEP1204" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="138" type="0">
</Transition>
<Transition StartId="6" EndId="427" type="0">
</Transition>
<Transition StartId="138" EndId="140" type="4">
</Transition>
<Transition StartId="138" EndId="237" type="0">
</Transition>
<Transition StartId="140" EndId="141" type="0">
</Transition>
<Transition StartId="140" EndId="420" type="5">
</Transition>
<Transition StartId="141" EndId="5" type="0">
</Transition>
<Transition StartId="195" EndId="218" type="0">
</Transition>
<Transition StartId="218" EndId="222" type="0">
</Transition>
<Transition StartId="222" EndId="227" type="0">
</Transition>
<Transition StartId="227" EndId="231" type="0">
</Transition>
<Transition StartId="231" EndId="426" type="0">
</Transition>
<Transition StartId="237" EndId="6" type="0">
</Transition>
<Transition StartId="420" EndId="2" type="0">
</Transition>
<Transition StartId="422" EndId="423" type="0">
</Transition>
<Transition StartId="423" EndId="2" type="0">
</Transition>
<Transition StartId="426" EndId="422" type="0">
</Transition>
<Transition StartId="427" EndId="428" type="0">
</Transition>
<Transition StartId="428" EndId="429" type="0">
</Transition>
<Transition StartId="429" EndId="195" type="0">
</Transition>
</Transitions>
</Process>

