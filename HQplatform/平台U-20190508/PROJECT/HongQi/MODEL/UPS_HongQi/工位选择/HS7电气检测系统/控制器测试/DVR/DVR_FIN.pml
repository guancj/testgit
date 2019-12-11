<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3034" pbltext="DEP1788">
<Parameters>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x775" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77D" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="70" top="14" right="170" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="624" right="170" bottom="656"/>
<Script>
#STOPCOMM
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="连接ECU">
<Rect left="70" top="64" right="170" bottom="96"/>
<TitleText Enable="1" Text="DVR(行车记录仪)"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="切诊断">
<Rect left="70" top="254" right="170" bottom="286"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1791" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="950" top="284" right="1050" bottom="316"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1792" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="950" top="444" right="1050" bottom="476"/>
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
</Script><assessment no="6" name="DEP1793" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="计算">
<Rect left="950" top="364" right="1050" bottom="396"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xEB0EBD1F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="通讯">
<Rect left="70" top="124" right="170" bottom="156"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
         engine.StatValue="通讯失败";
end

</Script><assessment no="1" name="DEP1789" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="比对零件号">
<Rect left="70" top="314" right="170" bottom="346"/>
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
end</Script><assessment no="7" name="DEP1794" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="960" top="214" right="1060" bottom="246"/>
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
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script><assessment no="9" name="DEP1796" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="70" top="384" right="170" bottom="416"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
--SoftwareNumber ="001";
SoftwareNumber ="V1.2.8";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("DVR读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="11" name="DEP1798" type="8" flags="105"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="检查VIN">
<Rect left="70" top="444" right="170" bottom="476"/>
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
end</Script><assessment no="13" name="DEP1800" type="8" flags="105"/>
</Activity>
<Activity id="204" ActivityType="3" flags="1" name="读取编程时间">
<Rect left="70" top="514" right="170" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script></Activity>
<Activity id="307" ActivityType="5" flags="0" name="DVR_ReadDTC">
<Rect left="10" top="564" right="110" bottom="596"/>
<SubProcesses>
<SubProcess id="DVR_ReadDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="309" ActivityType="3" flags="0" name="清DTC">
<Rect left="70" top="194" right="170" bottom="226"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP1790" type="8" flags="97"/>
</Activity>
<Activity id="404" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="624" right="306" bottom="656"/>
</Activity>
<Activity id="405" ActivityType="3" flags="0" name="通讯失败">
<Rect left="240" top="124" right="340" bottom="156"/>
<Line1Text Enable="1" Text="DVR 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="406" ActivityType="3" flags="0" name="结束通讯">
<Rect left="240" top="64" right="340" bottom="96"/>
<Script>#STOPCOMM
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="74" type="0">
</Transition>
<Transition StartId="5" EndId="75" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="8" type="0">
</Transition>
<Transition StartId="74" EndId="309" type="0">
</Transition>
<Transition StartId="74" EndId="405" type="4">
</Transition>
<Transition StartId="75" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="2" type="0">
</Transition>
<Transition StartId="307" EndId="2" type="0">
</Transition>
<Transition StartId="309" EndId="5" type="0">
</Transition>
<Transition StartId="404" EndId="2" type="0">
</Transition>
<Transition StartId="405" EndId="406" type="0">
</Transition>
<Transition StartId="405" EndId="404" type="5">
</Transition>
<Transition StartId="406" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

