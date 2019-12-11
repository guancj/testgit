<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3033" pbltext="DEP1773">
<Parameters>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding1" type="8" dir="0" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="70" top="14" right="170" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="70" top="1124" right="170" bottom="1156"/>
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
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="70" top="64" right="170" bottom="96"/>
<TitleText Enable="1" Text="IVI(车载娱乐)"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMMINIT
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="70" top="224" right="170" bottom="256"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1776" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="70" top="284" right="170" bottom="316"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1777" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="发送key">
<Rect left="70" top="424" right="170" bottom="456"/>
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
</Script><assessment no="5" name="DEP1778" type="8" flags="97"/>
</Activity>
<Activity id="87" ActivityType="13" flags="0" name="计算">
<Rect left="70" top="344" right="170" bottom="376"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x96B968CA"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="通讯">
<Rect left="70" top="114" right="170" bottom="146"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
           engine.StatValue="通讯失败";
end

</Script><assessment no="1" name="DEP1774" type="8" flags="97"/>
</Activity>
<Activity id="189" ActivityType="3" flags="0" name="检查配置码A1">
<Rect left="70" top="824" right="170" bottom="856"/>
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
end</Script><assessment no="15" name="DEP2511" type="8" flags="105"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="检查配置码A2">
<Rect left="70" top="894" right="170" bottom="926"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0xF1 0xA2
engine.println("配置码标准值1:"..DString_VariCoding1); 
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU = engine.GetResponseString(3,2+#DString_VariCoding1)
        DString_Read_Config_Code_From_ECU = LibGeneral.hex2str(DString_Read_Config_Code_From_ECU)
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (DString_Read_Config_Code_From_ECU == DString_VariCoding1) then
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
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP2512" type="8" flags="105"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="比对零件号">
<Rect left="70" top="504" right="170" bottom="536"/>
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
end</Script><assessment no="6" name="DEP1779" type="8" flags="105"/>
</Activity>
<Activity id="198" ActivityType="3" flags="1" name="读软件版本号">
<Rect left="70" top="744" right="170" bottom="776"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="1600r";
SoftwareNumber1 ="1700r";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("IVI读取软件版本号:"..num)
	if(SoftwareNumber ~= num and SoftwareNumber1 ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber.."或"..SoftwareNumber1;</Script><assessment no="10" name="DEP1783" type="8" flags="105"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="检查VIN">
<Rect left="70" top="574" right="170" bottom="606"/>
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
end</Script><assessment no="12" name="DEP1785" type="8" flags="105"/>
</Activity>
<Activity id="204" ActivityType="3" flags="0" name="读取编程时间">
<Rect left="70" top="654" right="170" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="通讯失败">
<Rect left="320" top="114" right="420" bottom="146"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="305" ActivityType="3" flags="0" name="结束通讯">
<Rect left="320" top="64" right="420" bottom="96"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="307" ActivityType="5" flags="0" name="IVI_ReadDTC">
<Rect left="490" top="1074" right="590" bottom="1106"/>
<SubProcesses>
<SubProcess id="IVI_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="310" ActivityType="3" flags="0" name="清DTC">
<Rect left="70" top="164" right="170" bottom="196"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="33" name="DEP1775" type="8" flags="97"/>
</Activity>
<Activity id="404" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="1124" right="386" bottom="1156"/>
</Activity>
<Activity id="405" ActivityType="3" flags="0" name="证书申请">
<Rect left="230" top="894" right="330" bottom="926"/>
<Strategy TotalTime="20" NokTime="20" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x01 0xE7 0x20
--jd_rel = @0-;
if (@0 == 0x71)then
       if(@4 == 0x00)then
       engine.LastError = 0;
       engine.SetLineText(2,"证书申请成功");
       engine.println("证书申请成功");
 --      engine.StatValue = "证书申请成功";
       else
       engine.LastError = 1;
       engine.SetLineText(2,"证书申请失败");
       engine.println("证书申请失败");
       end
else
engine.LastError = 1;
engine.SetLineText(2,"证书申请失败");
engine.println("证书申请失败");
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="34" name="DEP2506" type="8" flags="97"/>
</Activity>
<Activity id="406" ActivityType="3" flags="0" name="等待10秒">
<Rect left="230" top="954" right="330" bottom="986"/>
<Line1Text Enable="1" Text="证书申请中，请等待10秒"/>
<Script>for t=10,1,-1 do
engine.SetLineText(1,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="407" ActivityType="3" flags="0" name="获取证书申请结果">
<Rect left="230" top="1014" right="330" bottom="1046"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="25" DelayTime="2000"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x31 0x03 0xE7 0x20
--jd_str = @0-;
if(@0 ==  0x71)then
	if(@4 == 0x00)then
		engine.LastError = 0;
                engine.TestResult = 0;
                engine.SetLineText(2,"获取证书申请结果成功");
                engine.println("获取证书申请结果成功"); 
        else
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.SetLineText(2,"获取证书申请结果失败，自动重新申请");
                engine.println("获取证书申请结果失败");        
	end
else
	engine.LastError = 1;
        engine.TestResult = 1;
        engine.SetLineText(2,"获取证书申请结果失败，自动重新申请");
        engine.println("获取证书申请结果失败");  

end
        local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP2507" type="8" flags="97"/>
</Activity>
<Activity id="410" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="200" top="744" right="300" bottom="776"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
SoftwareNumber ="0960r";
if(engine.LastError == 0 ) then 
	recvTel = @3-;
	num = tostring(string.sub(recvTel,1,string.len(SoftwareNumber)));
        engine.println("IVI读取软件版本号:"..num)
	if(SoftwareNumber ~= num)then
        engine.LastError = 1;
	end 
        engine.StatValue =num
else
	recvTel = @0-;
	engine.StatValue = hexstr(recvTel );
end
engine.StatPoint = SoftwareNumber;</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
<Activity id="1171" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="744" right="386" bottom="776"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="88" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="87" type="0">
</Transition>
<Transition StartId="72" EndId="193" type="0">
</Transition>
<Transition StartId="87" EndId="72" type="0">
</Transition>
<Transition StartId="88" EndId="207" type="4">
</Transition>
<Transition StartId="88" EndId="310" type="0">
</Transition>
<Transition StartId="189" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="405" type="1">
<Expression>LibGeneral.CarTNC_HS7_H(engine.CarType)</Expression></Transition>
<Transition StartId="192" EndId="2" type="0">
</Transition>
<Transition StartId="193" EndId="203" type="0">
</Transition>
<Transition StartId="198" EndId="189" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="198" type="0">
</Transition>
<Transition StartId="204" EndId="410" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(engine.CarType)</Expression></Transition>
<Transition StartId="207" EndId="305" type="0">
</Transition>
<Transition StartId="207" EndId="1171" type="5">
</Transition>
<Transition StartId="305" EndId="5" type="0">
</Transition>
<Transition StartId="310" EndId="6" type="0">
</Transition>
<Transition StartId="404" EndId="2" type="0">
</Transition>
<Transition StartId="405" EndId="406" type="0">
</Transition>
<Transition StartId="406" EndId="407" type="0">
</Transition>
<Transition StartId="407" EndId="2" type="0">
</Transition>
<Transition StartId="410" EndId="1171" type="0">
</Transition>
<Transition StartId="1171" EndId="404" type="0">
</Transition>
</Transitions>
</Process>

