<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1144" pbltext="DEP1174">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_TBOX_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_TBOX_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_TBOX_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_TBOX_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_TBOX_EID_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x774" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X794" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="343" right="443" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1454" top="572" right="1554" bottom="604"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="TBOX(TBOX)">
<Rect left="343" top="55" right="443" bottom="87"/>
<TitleText Enable="1" Text="TBOX(TBOX)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="340" top="194" right="440" bottom="226"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
if(@0 == 0x54)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP1189" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="344" top="105" right="444" bottom="137"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="341" top="248" right="441" bottom="280"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Script>#COMM 0x10 0x03
if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP1188" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="340" top="302" right="440" bottom="334"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
if(@0 == 0x67)then
     engine.LastError = 0;
s0=@2
s1=@3
s2=@4
s3=@5
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP1203" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="发送key">
<Rect left="340" top="394" right="440" bottom="426"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if(@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP1204" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="481" top="64" right="581" bottom="96"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==13)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15);
	else
	end
        --]]
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
end</Script><assessment no="5" name="DEP1194" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="路由节点">
<Rect left="516" top="11" right="548" bottom="43"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="路由节点">
<Rect left="954" top="12" right="986" bottom="44"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读软件号">
<Rect left="921" top="65" right="1021" bottom="97"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x94
   
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="8" name="DEP1197" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="延时300MS">
<Rect left="920" top="113" right="1020" bottom="145"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1065" top="65" right="1165" bottom="97"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" )then
		StandValue="V2.00"; 
                DString1=@3-@7; 
         elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="V3.00 07";
                DString1=@3-@10;                  
        else
		StandValue="V2.00";
                DString1=@3-@7; 
        end	
           
	engine.SetLineText(2,DString1);
	engine.println("软件版本号:"..DString1);
        engine.println("软件版本号标准值:"..StandValue);
	--if("V1.58" == DString1) then   
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
end</Script><assessment no="9" name="DEP1199" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1066" top="114" right="1166" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="19" ActivityType="4" flags="0" name="路由节点">
<Rect left="1100" top="12" right="1132" bottom="44"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1206" top="68" right="1306" bottom="100"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP1191" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读VIN">
<Rect left="1206" top="170" right="1306" bottom="202"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读VIN码"/>
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
end</Script><assessment no="11" name="DEP1192" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="日期读取">
<Rect left="1359" top="166" right="1459" bottom="198"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读日期"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP1205" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="发送时间">
<Rect left="1360" top="67" right="1460" bottom="99"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="发日期"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP1201" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="1240" top="11" right="1272" bottom="43"/>
</Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="1395" top="10" right="1427" bottom="42"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1453" top="503" right="1553" bottom="535"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1205" top="120" right="1305" bottom="152"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1359" top="117" right="1459" bottom="149"/>
<Line1Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="71" ActivityType="13" flags="0" name="seedtokey">
<Rect left="341" top="346" right="441" bottom="378"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x7DACAC9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="通讯">
<Rect left="342" top="149" right="442" bottom="181"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP1187" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="通讯失败">
<Rect left="225" top="150" right="325" bottom="182"/>
<Line1Text Enable="1" Text="TBOX 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="结束通讯">
<Rect left="223" top="104" right="323" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="76" ActivityType="4" flags="0" name="路由节点">
<Rect left="1488" top="11" right="1520" bottom="43"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="258" top="502" right="290" bottom="534"/>
</Activity>
<Activity id="78" ActivityType="4" flags="0" name="路由节点">
<Rect left="652" top="12" right="684" bottom="44"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="读硬件号">
<Rect left="617" top="65" right="717" bottom="97"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读软件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="6" name="DEP1195" type="8" flags="97"/>
</Activity>
<Activity id="81" ActivityType="4" flags="0" name="路由节点">
<Rect left="798" top="11" right="830" bottom="43"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="764" top="65" right="864" bottom="97"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读软件号"/>
<Script>#COMM 0x22 0xF1 0x93

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="7" name="DEP1196" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="充电模式">
<Rect left="592" top="463" right="692" bottom="495"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x17
StandValue=0x02;
engine.println("充电模式标准值:"..StandValue);
if(@0==0x62)then
	--DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("充电模式:"..@3);
        if(@3 == StandValue)then
	--if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.SetLineText(2,"充电模式检查成功");
		engine.println("充电模式检查成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对充电模式检查失败");
		engine.println("比对充电模式检查失败");
	end
	engine.StatValue= @3;
	engine.StatPoint=StandValue;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="15" name="DEP1279" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="4" flags="0" name="路由节点">
<Rect left="1487" top="403" right="1519" bottom="435"/>
</Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="626" top="403" right="658" bottom="435"/>
</Activity>
<Activity id="86" ActivityType="4" flags="0" name="路由节点">
<Rect left="1358" top="464" right="1390" bottom="496"/>
</Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="1490" top="462" right="1522" bottom="494"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="触发T-box与后台连接">
<Rect left="785" top="464" right="885" bottom="496"/>
<Strategy NokTime="0" RetryTimeOut="2"/>
<Line1Text Enable="1" Text="触发T-box与后台连接"/>
<Script>#COMM 0x31 0x01 0x02 0x03

if(@0 == 0x71)then
     engine.LastError = 0;
     engine.println(" 触发成功");
else
     engine.LastError = 1;
     engine.println("触发失败");
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP1280" type="8" flags="97"/>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="确认与后台通讯服务">
<Rect left="1171" top="463" right="1271" bottom="495"/>
<Strategy TotalTime="13" NokTime="13" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="正在确认与后台通讯服务状态"/>
<Script>#COMM 0x31 0x03 0x02 0x03
StandValue=0x00;
if(@0==0x71)then
engine.println("确认状态:"..@5);
	if(@5 == StandValue)then	
		engine.LastError = 0;
		engine.SetLineText(2,"检测通过");
		engine.println("检测通过");
	end
	if(@5 == 0x01)then
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"继续读取中");
		engine.println("继续读取");
         end
        if(@5 == 0x02)then      
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"检测不通过");
		engine.println("检测不通过");
         end
        engine.StatValue= @5;
	engine.StatPoint=StandValue; 
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end     </Script><assessment no="17" name="DEP1281" type="8" flags="97"/>
</Activity>
<Activity id="90" ActivityType="3" flags="0" name="延时5000MS">
<Rect left="968" top="467" right="1068" bottom="499"/>
<Line1Text Enable="1" Text="正在确认与后台通讯服务状态"/>
<Script>#DELAY  5000</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="等待5秒">
<Rect left="938" top="315" right="1038" bottom="347"/>
<Line1Text Enable="1" Text="等待5秒"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="72" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="71" type="0">
</Transition>
<Transition StartId="8" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="78" type="0">
</Transition>
<Transition StartId="13" EndId="12" type="1">
<Expression>C131_TBOX_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="13" EndId="78" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_TBOX_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="19" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="19" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="24" type="0">
</Transition>
<Transition StartId="19" EndId="17" type="1">
<Expression>C131_TBOX_SVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="19" EndId="24" type="0">
</Transition>
<Transition StartId="20" EndId="37" type="0">
</Transition>
<Transition StartId="21" EndId="30" type="0">
</Transition>
<Transition StartId="22" EndId="76" type="0">
</Transition>
<Transition StartId="23" EndId="38" type="0">
</Transition>
<Transition StartId="24" EndId="20" type="1">
<Expression>C131_TBOX_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="23" type="1">
<Expression>C131_TBOX_EID_Execute_Flag ==true</Expression></Transition>
<Transition StartId="30" EndId="76" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="37" EndId="21" type="0">
</Transition>
<Transition StartId="38" EndId="22" type="0">
</Transition>
<Transition StartId="71" EndId="8" type="0">
</Transition>
<Transition StartId="72" EndId="4" type="3">
</Transition>
<Transition StartId="72" EndId="73" type="4">
</Transition>
<Transition StartId="73" EndId="77" type="5">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="5" type="0">
</Transition>
<Transition StartId="76" EndId="84" type="0">
</Transition>
<Transition StartId="77" EndId="36" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="14" type="0">
</Transition>
<Transition StartId="83" EndId="88" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="83" type="1">
<Expression>VMTLOC == "REP" or VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="85" EndId="86" type="0">
</Transition>
<Transition StartId="86" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="36" type="0">
</Transition>
<Transition StartId="88" EndId="91" type="0">
</Transition>
<Transition StartId="89" EndId="86" type="0">
</Transition>
<Transition StartId="91" EndId="89" type="0">
</Transition>
</Transitions>
</Process>

