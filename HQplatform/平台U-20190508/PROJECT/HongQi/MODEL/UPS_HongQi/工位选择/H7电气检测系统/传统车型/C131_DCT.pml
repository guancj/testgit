<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1118" pbltext="DEP150">
<Parameters>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_DCT_Shift_Lock_Relay_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_Shift_LV_Signal_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="C131_DCT_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_DCT_SPEC_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DCT_Oimpump_Speed_IO_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="spec_data" type="8" dir="0" data="spec_data"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="117" top="48" right="217" bottom="80"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="488" top="1257" right="588" bottom="1289"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="118" top="150" right="218" bottom="182"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="双离合变速器（DCT）">
<Rect left="117" top="101" right="217" bottom="133"/>
<TitleText Enable="1" Text="双离合变速器（DCT）"/>
<Script>engine.println("SPEC_DATA:"..spec_data);</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="清DTC">
<Rect left="118" top="249" right="218" bottom="281"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3201" name="DEP152" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="118" top="303" right="218" bottom="335"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3202" name="DEP1099" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="117" top="350" right="217" bottom="382"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3227" name="DEP194" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="计算key">
<Rect left="118" top="404" right="218" bottom="436"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xC2E0F1D3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="发送key">
<Rect left="118" top="451" right="218" bottom="483"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="3228" name="DEP154" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="条件1">
<Rect left="526" top="377" right="558" bottom="409"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="档位切换到P">
<Rect left="493" top="429" right="593" bottom="461"/>
<Line1Text Enable="1" Text="请切换到P档"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="踩刹车，保持P档位，检测档位锁">
<Rect left="493" top="474" right="593" bottom="506"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="踩刹车，保持档位在P档"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x5F
if(@0==0x62)then
if(@3==0x01)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=1;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="13" name="DEP956" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="检测失败">
<Rect left="377" top="469" right="477" bottom="501"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="请松开刹车，检测档位锁">
<Rect left="495" top="521" right="595" bottom="553"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1" Text="请松开刹车"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x5F
if(@0==0x62)then
if(@3==0x00)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=0;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP957" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="检测失败">
<Rect left="380" top="521" right="480" bottom="553"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="23" ActivityType="4" flags="0" name="条件2">
<Rect left="526" top="565" right="558" bottom="597"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="手动测试，P档">
<Rect left="492" top="613" right="592" bottom="645"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到P"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x01)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=1;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="15" name="DEP472" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="检测失败">
<Rect left="381" top="614" right="481" bottom="646"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="手动测试，R档">
<Rect left="493" top="660" right="593" bottom="692"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到R"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x02)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=2;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="16" name="DEP473" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="检测失败">
<Rect left="382" top="663" right="482" bottom="695"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="手动测试，N档">
<Rect left="493" top="706" right="593" bottom="738"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到N"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x03)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=3;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="17" name="DEP474" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="检测失败">
<Rect left="382" top="706" right="482" bottom="738"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="手动测试，D档">
<Rect left="494" top="756" right="594" bottom="788"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到D"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x04)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=4;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="18" name="DEP475" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="检测失败">
<Rect left="381" top="756" right="481" bottom="788"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="手动测试，S档">
<Rect left="494" top="802" right="594" bottom="834"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到S"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x05)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=5;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="19" name="DEP476" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="检测失败">
<Rect left="380" top="802" right="480" bottom="834"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="手动模式加档">
<Rect left="495" top="847" right="595" bottom="879"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="手动模式加档"/>
<Script>#COMM 0x22 0x01 0x24
if(@0==0x62)then
if(@3==0x05)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=5;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP477" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="检测失败">
<Rect left="382" top="848" right="482" bottom="880"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="手动模式减档">
<Rect left="495" top="894" right="595" bottom="926"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="手动模式减档"/>
<Script>#COMM 0x22 0x01 0x24
if(@0==0x62)then
if(@3==0x06)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=6;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="21" name="DEP478" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="检测失败">
<Rect left="381" top="895" right="481" bottom="927"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="切换到P档">
<Rect left="494" top="941" right="594" bottom="973"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30"/>
<Line2Text Enable="1" Text="手动测试"/>
<Line3Text Enable="1" Text="档位切换到P"/>
<Script>#COMM 0x22 0x01 0x23
if(@0==0x62)then
if(@3==0x01)then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.StatValue=@3;
engine.StatPoint=1;
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="22" name="DEP472" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="检测失败">
<Rect left="382" top="946" right="482" bottom="978"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="41" ActivityType="4" flags="0" name="条件3 ">
<Rect left="527" top="990" right="559" bottom="1022"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="读取油温">
<Rect left="490" top="1037" right="590" bottom="1069"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="双离合变速器（DCT）"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="读取油温"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x25
if(@0==0x62)then
tempValue=(@3*256+@4)*0.125;
engine.println("油温"..tempValue)
if(tempValue&lt;=110)then
  engine.LastError = 0;
engine.StatValue=tempValue
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.StatValue=tempValue
  engine.StatUpper=110;
end

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="23" name="DEP479" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="读取油温">
<Rect left="488" top="1131" right="588" bottom="1163"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="双离合变速器（DCT）"/>
<Line2Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="读取油温"/>
<Script>#COMM 0x22 0x01 0x25
if(@0==0x62)then
	tempValue=(@3*256+@4)*0.125;
	engine.println("油温"..tempValue)
	if(tempValue&lt;=110)then
		engine.LastError = 0;
	else
		engine.LastError = 1;
		engine.TestResult = 1;
	end
	engine.StatValue=tempValue;
	engine.StatUpper=110;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="24" name="DEP479" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="4" flags="0" name="条件4">
<Rect left="523" top="1084" right="555" bottom="1116"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="清空显示">
<Rect left="489" top="1191" right="589" bottom="1223"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="比对零件号">
<Rect left="252" top="103" right="352" bottom="135"/>
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
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==11)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
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
end</Script><assessment no="1" name="DEP297" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="56" right="316" bottom="88"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="读硬件号">
<Rect left="374" top="102" right="474" bottom="134"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@13);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP298" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="延时300MS">
<Rect left="374" top="152" right="474" bottom="184"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="136" ActivityType="4" flags="0" name="路由节点">
<Rect left="411" top="55" right="443" bottom="87"/>
</Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="680" top="55" right="712" bottom="87"/>
</Activity>
<Activity id="138" ActivityType="4" flags="0" name="路由节点">
<Rect left="557" top="56" right="589" bottom="88"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="522" top="105" right="622" bottom="137"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@12);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP299" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="延时300MS">
<Rect left="521" top="155" right="621" bottom="187"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="148" ActivityType="3" flags="0" name="读软件号">
<Rect left="645" top="110" right="745" bottom="142"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@12);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP300" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="延时300MS">
<Rect left="645" top="160" right="745" bottom="192"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="155" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="765" top="110" right="865" bottom="142"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
engine.SetLineText(3,DString1);
engine.println("软件版本号:"..DString1);
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP301" type="8" flags="97"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="延时300MS">
<Rect left="765" top="159" right="865" bottom="191"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="799" top="56" right="831" bottom="88"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1420" top="104" right="1520" bottom="136"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP302" type="8" flags="97"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1420" top="164" right="1520" bottom="196"/>
<Line1Text Enable="1" Text="比对VIN"/>
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
end</Script><assessment no="7" name="DEP303" type="8" flags="97"/>
</Activity>
<Activity id="162" ActivityType="3" flags="0" name="日期读取">
<Rect left="1540" top="164" right="1640" bottom="196"/>
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
<Activity id="164" ActivityType="3" flags="0" name="发送时间">
<Rect left="1540" top="104" right="1640" bottom="136"/>
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
<Activity id="165" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="54" right="1486" bottom="86"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="2090" top="964" right="2190" bottom="996"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="175" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1670" top="164" right="1770" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="176" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1790" top="104" right="1890" bottom="136"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@4);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="11" name="DEP305" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="写配置码">
<Rect left="1670" top="104" right="1770" bottom="136"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3)


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP304" type="8" flags="97"/>
</Activity>
<Activity id="179" ActivityType="4" flags="0" name="路由节点">
<Rect left="1704" top="54" right="1736" bottom="86"/>
</Activity>
<Activity id="180" ActivityType="4" flags="0" name="路由节点">
<Rect left="1584" top="54" right="1616" bottom="86"/>
</Activity>
<Activity id="181" ActivityType="4" flags="0" name="路由节点">
<Rect left="2124" top="54" right="2156" bottom="86"/>
</Activity>
<Activity id="182" ActivityType="4" flags="0" name="路由节点">
<Rect left="611" top="476" right="643" bottom="508"/>
</Activity>
<Activity id="183" ActivityType="4" flags="0" name="路由节点">
<Rect left="613" top="783" right="645" bottom="815"/>
</Activity>
<Activity id="184" ActivityType="4" flags="0" name="路由节点">
<Rect left="600" top="1038" right="632" bottom="1070"/>
</Activity>
<Activity id="185" ActivityType="4" flags="0" name="路由节点">
<Rect left="598" top="1129" right="630" bottom="1161"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="通讯">
<Rect left="118" top="199" right="218" bottom="231"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="25" name="DEP151" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="通讯失败">
<Rect top="199" right="100" bottom="231"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="1191" right="66" bottom="1223"/>
</Activity>
<Activity id="189" ActivityType="4" flags="0" name="路由节点">
<Rect left="2024" top="54" right="2056" bottom="86"/>
</Activity>
<Activity id="191" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1990" top="194" right="2090" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="写液压特征数据">
<Rect left="1990" top="154" right="2090" bottom="186"/>
<Line1Text Enable="1" Text="写液压特征数据"/>
<Script>engine.println("液压特征数据:"..spec_0105);
if(spec_0105 ~= "")then
#COMM 0x2e 0x01 0x05 hex2bin(spec_0105)

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_0105;
end</Script><assessment no="26" name="DEP1131" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="写交叉位置自学习数据">
<Rect left="1990" top="294" right="2090" bottom="326"/>
<Line1Text Enable="1" Text="写交叉位置自学习数据"/>
<Script>engine.println("交叉位置自学习数据:"..spec_0109);
if(spec_0109 ~= "")then
#COMM 0x2e 0x01 0x09 hex2bin(spec_0109)

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_0109;
end</Script><assessment no="28" name="DEP1132" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1990" top="344" right="2090" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="写离合器压力电流学习数据">
<Rect left="1990" top="454" right="2090" bottom="486"/>
<Line1Text Enable="1" Text="写离合器压力电流学习数据"/>
<Script>engine.println("离合器压力电流学习数据:"..spec_010A);
if(spec_010A ~= "")then
#COMM 0x2e 0x01 0x0A hex2bin(spec_010A)

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_010A;
end</Script><assessment no="30" name="DEP1133" type="8" flags="97"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1990" top="504" right="2090" bottom="536"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="199" ActivityType="3" flags="0" name="写离合器Kisspoint点数据">
<Rect left="1990" top="604" right="2090" bottom="636"/>
<Line1Text Enable="1" Text="离合器Kisspoint点数据"/>
<Script>engine.println("离合器Kisspoint点数据:"..spec_010B);
if(spec_010B ~= "")then
#COMM 0x2e 0x01 0x0B hex2bin(spec_010B)

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_010B;
end
</Script><assessment no="32" name="DEP1134" type="8" flags="97"/>
</Activity>
<Activity id="200" ActivityType="3" flags="0" name="读">
<Rect left="1990" top="244" right="2090" bottom="276"/>
<Line1Text Enable="1" Text="比对液压特征数据"/>
<Script>if(spec_0105 ~= "")then
#COMM 0x22 0x01 0x05
	engine.println("液压特征数据标准值:"..spec_0105);
	spec_0105=string.sub(spec_0105,1,796);
	engine.println("截取掉后6个字节的CRC:"..spec_0105);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@400);
		engine.println("读到液压特征数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_0105)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
			engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对液压特征数据失败");
			engine.println("比对液压特征数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_0105;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_0105;
end</Script><assessment no="27" name="DEP1139" type="8" flags="97"/>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="读">
<Rect left="1990" top="394" right="2090" bottom="426"/>
<Line1Text Enable="1" Text="比对交叉位置自学习数据"/>
<Script>if(spec_0109 ~= "")then
#COMM 0x22 0x01 0x09
	engine.println("交叉位置自学习数据标准值:"..spec_0109);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@18);
		engine.println("交叉位置自学习数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_0109)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
			engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对交叉位置自学习数据失败");
			engine.println("比对交叉位置自学习数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_0109;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_0109;
end</Script><assessment no="29" name="DEP1140" type="8" flags="97"/>
</Activity>
<Activity id="202" ActivityType="3" flags="0" name="读">
<Rect left="1990" top="554" right="2090" bottom="586"/>
<Line1Text Enable="1" Text="比对离合器压力电流学习数据"/>
<Script>if(spec_010A ~= "" and spec_010A_compare ~= "")then
#COMM 0x22 0x01 0x0A
	engine.println("离合器压力电流自学习数据标准值:"..spec_010A);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@247);
                --DString_Read_Spec_Data_From_ECU=spec_010A_compare;
		engine.println("离合器压力电流自学习数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_010A_compare)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
		engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对离合器压力电流学习数据失败");
			engine.println("比对离合器压力电流学习数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_010A;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_010A;
end
</Script><assessment no="31" name="DEP1141" type="8" flags="97"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1990" top="654" right="2090" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="读">
<Rect left="1990" top="704" right="2090" bottom="736"/>
<Line1Text Enable="1" Text="比对离合器Kisspoint点数据"/>
<Script>if(spec_010B ~= "")then
#COMM 0x22 0x01 0x0B
	engine.println("离合器Kisspoint点数据标准值:"..spec_010B);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@6);
		engine.println("离合器Kisspoint点数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_010B)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
			engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对离合器Kisspoint点数据失败");
			engine.println("比对离合器Kisspoint点数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_010B;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_010B;
end
</Script><assessment no="33" name="DEP1142" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="结束通讯">
<Rect top="151" right="100" bottom="183"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="油泵转速测试">
<Rect left="492" top="327" right="592" bottom="359"/>
<Line1Text Enable="1" Text="油泵转速测试"/>
<Script>#COMM 0x2f 0x02 0x14 0x03 0x0b 0xac
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="208" ActivityType="4" flags="0" name="路由节点">
<Rect left="1824" top="54" right="1856" bottom="86"/>
</Activity>
<Activity id="209" ActivityType="4" flags="0" name="路由节点">
<Rect left="526" top="279" right="558" bottom="311"/>
</Activity>
<Activity id="210" ActivityType="4" flags="0" name="路由节点">
<Rect left="609" top="326" right="641" bottom="358"/>
</Activity>
<Activity id="211" ActivityType="4" flags="0" name="路由节点">
<Rect left="752" top="279" right="784" bottom="311"/>
</Activity>
<Activity id="212" ActivityType="4" flags="0" name="路由节点">
<Rect left="753" top="965" right="785" bottom="997"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="提取特性数据">
<Rect left="1920" top="104" right="2020" bottom="136"/>
<Line1Text Enable="1" Text="提取特性数据中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>spec_0105="";
spec_0105=hexstr(string.sub(spec_data,1,21))..string.sub(spec_data,22,145)..hexstr(string.sub(spec_data,146,146))..string.sub(spec_data,147,270)..hexstr(string.sub(spec_data,271,271))..string.sub(spec_data,272,395)..hexstr(string.sub(spec_data,396,396))..string.sub(spec_data,397,520)..hexstr(string.sub(spec_data,521,521))..string.sub(spec_data,522,645)..hexstr(string.sub(spec_data,646,646))..string.sub(spec_data,647,770)..hexstr(string.sub(spec_data,771,776));
--spec_0105="3137303234313041354B58585F463642413038315F00000000000000000000000000010002000300040005001F0061014602BA03950419068606A706DC08B208D208D508D708D808DB08DC08DD08DE08DF08E05F00000000000000000000000000E100E200E400E700EC00FA012A0194022902C3035D040104A0052B05AB0626068F06F00743078B07C707FB081F083808455F0007000A0010001E002C003F007300A200E50128017301C3020F026202AF0301035503AF03EA0404040504060407040804090000000000000000000000005F00010002000300040005000600090037007700C0010A015E01B4020B026202B80313036C03C303F403F703F803F903FA03FB0000000000000000000000005F00010002000300060031007300B60105015E01B80215027102CB0325038103DC0439049604F2054B059F05EE0639068306CB07120757079807C807D907DA5F00010002000300060030006F00B50105015901B4020F026A02C5031E037903D50432049004EC0545059905E90636068006C907120756079707C807DA07DB5F0000003300";
print("spec_0105:"..spec_0105);

spec_0109="";
spec_0109=string.sub(spec_data,777,808);
--spec_0109="40ED3B0E3FE73E56126A0FDF154F10D8";
print("spec_0109:"..spec_0109);

spec_010B="";
spec_010B=string.sub(spec_data,809,816);
--spec_010B="107A0F90";
print("spec_010B:"..spec_010B);

spec_112A=string.sub(spec_data,817,820);
print("spec_112A:"..spec_112A);

spec_0101=hexstr(string.sub(spec_data,821,841))..string.sub(spec_data,842,965)..hexstr(string.sub(spec_data,966,966))..string.sub(spec_data,967,1090)..hexstr(string.sub(spec_data,1091,1096));
print("spec_0101:"..spec_0101);

spec_0103=string.sub(spec_data,1097,1100);
print("spec_0103:"..spec_0103);

spec_0102=string.sub(spec_data,1101,1224);
print("spec_0102:"..spec_0102);

spec_F1A2=""
spec_F1A2=string.sub(spec_data,1225,1240);
print("spec_F1A2:"..spec_F1A2);

spec_010A="";
spec_010A=string.sub(spec_data,1241,1880);
--spec_010A="0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
print("spec_010A:"..spec_010A);
</Script></Activity>
<Activity id="214" ActivityType="3" flags="0" name="混动车型">
<Rect left="898" top="110" right="998" bottom="142"/>
<Script></Script></Activity>
<Activity id="215" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="897" top="160" right="997" bottom="192"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13")then
		StandValue="FDCT350RH606P060";
        elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="FDCT350RH606P071";
        else
	        StandValue="FDCT350R0506P033";
	end
        engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);   
	--if("FDCT350R0506P026" == DString1)then
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
end</Script><assessment no="5" name="DEP301" type="8" flags="97"/>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="延时300MS">
<Rect left="897" top="210" right="997" bottom="242"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="217" ActivityType="4" flags="0" name="路由节点">
<Rect left="931" top="56" right="963" bottom="88"/>
</Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="404" right="1096" bottom="436"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="294" right="1956" bottom="326"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="454" right="1956" bottom="486"/>
</Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="754" right="1956" bottom="786"/>
</Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="604" right="1956" bottom="636"/>
</Activity>
<Activity id="223" ActivityType="3" flags="0" name="写TID">
<Rect left="1990" top="754" right="2090" bottom="786"/>
<Line1Text Enable="1" Text="写TID"/>
<Script>engine.println("离合器Kisspoint点数据:"..spec_F1A2);
if(spec_F1A2 ~= "")then
#COMM 0x2e 0xF1 0xA2 spec_F1A2
	
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_F1A2;
end
</Script><assessment no="34" name="DEP1160" type="8" flags="97"/>
</Activity>
<Activity id="224" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1990" top="814" right="2090" bottom="846"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="读">
<Rect left="1990" top="874" right="2090" bottom="906"/>
<Line1Text Enable="1" Text="比对离合器Kisspoint点数据"/>
<Script>if(spec_F1A2 ~= "")then
#COMM 0x22 0xF1 0xA2
	engine.println("离合器Kisspoint点数据标准值:"..spec_F1A2);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
		engine.println("离合器Kisspoint点数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_F1A2)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
			engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对离合器Kisspoint点数据失败");
			engine.println("比对离合器Kisspoint点数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_F1A2;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_F1A2;
end</Script><assessment no="35" name="DEP1161" type="8" flags="97"/>
</Activity>
<Activity id="226" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="874" right="1956" bottom="906"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="是否写DCT特性数据">
<Rect left="1990" top="4" right="2090" bottom="36"/>
<Line1Text Enable="1" Text="是否写DCT特性数据？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="228" ActivityType="4" flags="0" name="路由节点">
<Rect left="1954" top="54" right="1986" bottom="86"/>
</Activity>
<Activity id="230" ActivityType="3" flags="0" name="改脸">
<Rect left="1026" top="110" right="1126" bottom="142"/>
<Script></Script></Activity>
<Activity id="231" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1025" top="160" right="1125" bottom="192"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="FDCT350R0603C021";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="FDCT350R0603C020";
	else
		StandValue="";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);   
	--if("FDCT350R0506P026" == DString1)then
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
end</Script><assessment no="5" name="DEP301" type="8" flags="97"/>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1025" top="210" right="1125" bottom="242"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="233" ActivityType="4" flags="0" name="路由节点">
<Rect left="1061" top="57" right="1093" bottom="89"/>
</Activity>
<Activity id="234" ActivityType="4" flags="0" name="路由节点">
<Rect left="1924" top="154" right="1956" bottom="186"/>
</Activity>
<Activity id="235" ActivityType="3" flags="0" name="19年型">
<Rect left="1140" top="104" right="1240" bottom="136"/>
<Script></Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1140" top="154" right="1240" bottom="186"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="FDCT350R0603C027";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	DString1 = engine.GetResponseString(3,2+#StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);   

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
end</Script><assessment no="5" name="DEP301" type="8" flags="97"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1140" top="204" right="1240" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="54" right="1216" bottom="86"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="提取特性数据">
<Rect left="2040" top="104" right="2140" bottom="136"/>
<Line1Text Enable="1" Text="提取特性数据中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>spec_data19=string.sub(engine.VehiData,2032,4330);
engine.println("特殊数据:"..tostring(spec_data19));
spec_0105="";
spec_0105=hexstr(string.sub(spec_data19,21,33))..hexstr(string.sub(spec_data19,34,41))..(string.sub(spec_data19,42,165))..hexstr(string.sub(spec_data19,166,166))..(string.sub(spec_data19,167,290))..hexstr(string.sub(spec_data19,291,291))..(string.sub(spec_data19,292,415))..hexstr(string.sub(spec_data19,416,416))..(string.sub(spec_data19,417,540))..hexstr(string.sub(spec_data19,541,541))..(string.sub(spec_data19,542,665))..hexstr(string.sub(spec_data19,666,666))..(string.sub(spec_data19,667,790))..hexstr(string.sub(spec_data19,791,796));
--spec_0105="3137303234313041354B58585F463642413038315F00000000000000000000000000010002000300040005001F0061014602BA03950419068606A706DC08B208D208D508D708D808DB08DC08DD08DE08DF08E05F00000000000000000000000000E100E200E400E700EC00FA012A0194022902C3035D040104A0052B05AB0626068F06F00743078B07C707FB081F083808455F0007000A0010001E002C003F007300A200E50128017301C3020F026202AF0301035503AF03EA0404040504060407040804090000000000000000000000005F00010002000300040005000600090037007700C0010A015E01B4020B026202B80313036C03C303F403F703F803F903FA03FB0000000000000000000000005F00010002000300060031007300B60105015E01B80215027102CB0325038103DC0439049604F2054B059F05EE0639068306CB07120757079807C807D907DA5F00010002000300060030006F00B50105015901B4020F026A02C5031E037903D50432049004EC0545059905E90636068006C907120756079707C807DA07DB5F0000003300";
print("spec_0105:"..spec_0105);

spec_0109="";
spec_0109=string.sub(spec_data19,834,865);
--spec_0109="40ED3B0E3FE73E56126A0FDF154F10D8";
print("spec_0109:"..spec_0109);

spec_010A="";
spec_010A_compare="";
spec_010A=string.sub(spec_data19,904,1543);
spec_010A_compare=string.sub(spec_010A,1,248);
--spec_010A="0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
print("spec_010A:"..spec_010A);

spec_010B="";
spec_010B=string.sub(spec_data19,1580,1587);
--spec_010B="107A0F90";
print("spec_010B:"..spec_010B);
print("actual_010B:"..hex2bin(spec_010B));

spec_F1A2=string.sub(spec_data19,2270,2285);
print("spec_F1A2:"..spec_F1A2);

spec_0101=(string.sub(spec_data19,1656,1931));
print("spec_0101:"..spec_0101);

spec_0102=string.sub(spec_data19,1969,2092);
print("spec_0102:"..spec_0102);

spec_0103=string.sub(spec_data19,2129,2132);
print("spec_0103:"..spec_0103);

spec_112A=string.sub(spec_data19,2199,2202);
print("spec_112A:"..spec_112A);

</Script></Activity>
<Activity id="240" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1630" top="294" right="1730" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="写配置码">
<Rect left="1630" top="234" right="1730" bottom="266"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3)


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP304" type="8" flags="97"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="19年型V6">
<Rect left="1280" top="104" right="1380" bottom="136"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1280" top="154" right="1380" bottom="186"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="FDCT350R0603C031";
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	DString1 = engine.GetResponseString(3,2+#StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);   

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
end</Script><assessment no="5" name="DEP301" type="8" flags="97"/>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1280" top="204" right="1380" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="1314" top="54" right="1346" bottom="86"/>
</Activity>
<Activity id="246" ActivityType="3" flags="0" name="提取特性数据">
<Rect left="1740" top="444" right="1840" bottom="476"/>
<Script>spec_data19=string.sub(engine.VehiData,2032,4330);
engine.println("特殊数据:"..tostring(spec_data19));
spec_0105="";
spec_0105=hexstr(string.sub(spec_data19,21,33))..hexstr(string.sub(spec_data19,34,41))..(string.sub(spec_data19,42,165))..hexstr(string.sub(spec_data19,166,166))..(string.sub(spec_data19,167,290))..hexstr(string.sub(spec_data19,291,291))..(string.sub(spec_data19,292,415))..hexstr(string.sub(spec_data19,416,416))..(string.sub(spec_data19,417,540))..hexstr(string.sub(spec_data19,541,541))..(string.sub(spec_data19,542,665))..hexstr(string.sub(spec_data19,666,666))..(string.sub(spec_data19,667,790))..hexstr(string.sub(spec_data19,791,796));
--spec_0105="3137303234313041354B58585F463642413038315F00000000000000000000000000010002000300040005001F0061014602BA03950419068606A706DC08B208D208D508D708D808DB08DC08DD08DE08DF08E05F00000000000000000000000000E100E200E400E700EC00FA012A0194022902C3035D040104A0052B05AB0626068F06F00743078B07C707FB081F083808455F0007000A0010001E002C003F007300A200E50128017301C3020F026202AF0301035503AF03EA0404040504060407040804090000000000000000000000005F00010002000300040005000600090037007700C0010A015E01B4020B026202B80313036C03C303F403F703F803F903FA03FB0000000000000000000000005F00010002000300060031007300B60105015E01B80215027102CB0325038103DC0439049604F2054B059F05EE0639068306CB07120757079807C807D907DA5F00010002000300060030006F00B50105015901B4020F026A02C5031E037903D50432049004EC0545059905E90636068006C907120756079707C807DA07DB5F0000003300";
print("spec_0105:"..spec_0105);

spec_0109="";
spec_0109=string.sub(spec_data19,834,865);
--spec_0109="40ED3B0E3FE73E56126A0FDF154F10D8";
print("spec_0109:"..spec_0109);

spec_010A="";
spec_010A=string.sub(spec_data19,904,1543);
--spec_010A="0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
print("spec_010A:"..spec_010A);

spec_010B="";
spec_010B=string.sub(spec_data19,1580,1587);
--spec_010B="107A0F90";
print("spec_010B:"..spec_010B);
print("actual_010B:"..hex2bin(spec_010B));

spec_F1A2=string.sub(spec_data19,2270,2285);
print("spec_F1A2:"..spec_F1A2);

spec_0101=(string.sub(spec_data19,1656,1931));
print("spec_0101:"..spec_0101);

spec_0102=string.sub(spec_data19,1969,2092);
print("spec_0102:"..spec_0102);

spec_0103=string.sub(spec_data19,2129,2132);
print("spec_0103:"..spec_0103);

spec_112A=string.sub(spec_data19,2199,2202);
print("spec_112A:"..spec_112A);

</Script></Activity>
<Activity id="247" ActivityType="3" flags="0" name="读">
<Rect left="1740" top="494" right="1840" bottom="526"/>
<Line1Text Enable="1" Text="比对离合器压力电流学习数据"/>
<Script>if(spec_010A ~= "")then
#COMM 0x22 0x01 0x0A
	engine.println("离合器压力电流自学习数据标准值:"..spec_010A);
	if(@0==0x62)then
		DString_Read_Spec_Data_From_ECU=hexstr(@3-@322);
		engine.println("离合器压力电流自学习数据:"..DString_Read_Spec_Data_From_ECU);
		if (string.match(DString_Read_Spec_Data_From_ECU,spec_010A)) then
			engine.LastError = 0;
			engine.SetLineText(2,"比对成功");
		engine.println("比对成功");
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.SetLineText(2,"比对离合器压力电流学习数据失败");
			engine.println("比对离合器压力电流学习数据失败");
		end
		engine.StatValue=DString_Read_Spec_Data_From_ECU;
		engine.StatPoint=spec_010A;
		
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatPoint=spec_010A;
end
</Script><assessment no="31" name="DEP1141" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="186" type="0">
</Transition>
<Transition StartId="4" EndId="3" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="132" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="1">
<Expression>C131_DCT_Shift_Lock_Relay_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="182" type="0">
</Transition>
<Transition StartId="15" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="4">
</Transition>
<Transition StartId="17" EndId="20" type="3">
</Transition>
<Transition StartId="18" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="4">
</Transition>
<Transition StartId="20" EndId="23" type="3">
</Transition>
<Transition StartId="21" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="25" type="1">
<Expression>C131_DCT_Shift_LV_Signal_Execute_Flag == true</Expression></Transition>
<Transition StartId="23" EndId="183" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="4">
</Transition>
<Transition StartId="25" EndId="27" type="3">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="4">
</Transition>
<Transition StartId="27" EndId="29" type="3">
</Transition>
<Transition StartId="28" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="4">
</Transition>
<Transition StartId="29" EndId="31" type="3">
</Transition>
<Transition StartId="30" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="33" type="3">
</Transition>
<Transition StartId="31" EndId="32" type="4">
</Transition>
<Transition StartId="32" EndId="33" type="0">
</Transition>
<Transition StartId="33" EndId="34" type="4">
</Transition>
<Transition StartId="33" EndId="35" type="3">
</Transition>
<Transition StartId="34" EndId="35" type="0">
</Transition>
<Transition StartId="35" EndId="36" type="4">
</Transition>
<Transition StartId="35" EndId="37" type="3">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="4">
</Transition>
<Transition StartId="37" EndId="39" type="3">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="41" type="3">
</Transition>
<Transition StartId="39" EndId="40" type="4">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="1">
<Expression>VMTLOC == "TR2" or VMTLOC == "REP"</Expression></Transition>
<Transition StartId="41" EndId="184" type="0">
</Transition>
<Transition StartId="42" EndId="46" type="0">
</Transition>
<Transition StartId="44" EndId="47" type="0">
</Transition>
<Transition StartId="46" EndId="44" type="1">
<Expression>VMTLOC == "FIN"</Expression></Transition>
<Transition StartId="46" EndId="185" type="0">
</Transition>
<Transition StartId="47" EndId="2" type="0">
</Transition>
<Transition StartId="131" EndId="136" type="0">
</Transition>
<Transition StartId="132" EndId="131" type="1">
<Expression>C131_DCT_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="132" EndId="136" type="0">
</Transition>
<Transition StartId="133" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="138" type="0">
</Transition>
<Transition StartId="136" EndId="133" type="1">
<Expression>C131_DCT_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="136" EndId="138" type="0">
</Transition>
<Transition StartId="137" EndId="148" type="1">
<Expression>C131_DCT_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="137" EndId="159" type="0">
</Transition>
<Transition StartId="138" EndId="139" type="1">
<Expression>C131_DCT_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="138" EndId="137" type="0">
</Transition>
<Transition StartId="139" EndId="141" type="0">
</Transition>
<Transition StartId="141" EndId="137" type="0">
</Transition>
<Transition StartId="148" EndId="150" type="0">
</Transition>
<Transition StartId="150" EndId="159" type="0">
</Transition>
<Transition StartId="155" EndId="158" type="0">
</Transition>
<Transition StartId="158" EndId="218" type="0">
</Transition>
<Transition StartId="159" EndId="155" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="159" EndId="217" type="0">
</Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="180" type="0">
</Transition>
<Transition StartId="162" EndId="179" type="0">
</Transition>
<Transition StartId="164" EndId="162" type="0">
</Transition>
<Transition StartId="165" EndId="160" type="1">
<Expression>C131_DCT_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="165" EndId="180" type="0">
</Transition>
<Transition StartId="174" EndId="212" type="0">
</Transition>
<Transition StartId="175" EndId="208" type="0">
</Transition>
<Transition StartId="176" EndId="228" type="0">
</Transition>
<Transition StartId="178" EndId="175" type="0">
</Transition>
<Transition StartId="179" EndId="178" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_DCT_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="179" EndId="208" type="0">
</Transition>
<Transition StartId="180" EndId="164" type="1">
<Expression>C131_DCT_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="180" EndId="179" type="0">
</Transition>
<Transition StartId="181" EndId="174" type="0">
</Transition>
<Transition StartId="182" EndId="23" type="0">
</Transition>
<Transition StartId="183" EndId="41" type="0">
</Transition>
<Transition StartId="184" EndId="46" type="0">
</Transition>
<Transition StartId="185" EndId="47" type="0">
</Transition>
<Transition StartId="186" EndId="5" type="3">
</Transition>
<Transition StartId="186" EndId="187" type="4">
</Transition>
<Transition StartId="187" EndId="206" type="0">
</Transition>
<Transition StartId="187" EndId="188" type="5">
</Transition>
<Transition StartId="188" EndId="47" type="0">
</Transition>
<Transition StartId="189" EndId="213" type="1">
<Expression>C131_DCT_SPEC_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15"or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1JM11" or LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) or DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"or DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30" or DString_C131_Car_Tpye=="CH1JM12")</Expression></Transition>
<Transition StartId="189" EndId="181" type="0">
</Transition>
<Transition StartId="189" EndId="239" type="1">
<Expression>C131_DCT_SPEC_Execute_Flag == true and (DString_C131_Car_Tpye=="CH1PM20" or DString_C131_Car_Tpye=="CH1PM30" or DString_C131_Car_Tpye=="CNDA01A")</Expression></Transition>
<Transition StartId="191" EndId="200" type="0">
</Transition>
<Transition StartId="193" EndId="191" type="0">
</Transition>
<Transition StartId="195" EndId="196" type="0">
</Transition>
<Transition StartId="196" EndId="201" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="202" type="0">
</Transition>
<Transition StartId="199" EndId="203" type="0">
</Transition>
<Transition StartId="200" EndId="195" type="0">
</Transition>
<Transition StartId="201" EndId="197" type="0">
</Transition>
<Transition StartId="202" EndId="199" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="223" type="0">
</Transition>
<Transition StartId="206" EndId="3" type="0">
</Transition>
<Transition StartId="207" EndId="14" type="0">
</Transition>
<Transition StartId="208" EndId="176" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_DCT_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="208" EndId="228" type="0">
</Transition>
<Transition StartId="209" EndId="207" type="1">
<Expression>C131_DCT_Oimpump_Speed_IO_Execute_Flag == true</Expression></Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="14" type="0">
</Transition>
<Transition StartId="211" EndId="209" type="0">
</Transition>
<Transition StartId="212" EndId="211" type="0">
</Transition>
<Transition StartId="213" EndId="193" type="0">
</Transition>
<Transition StartId="214" EndId="215" type="0">
</Transition>
<Transition StartId="215" EndId="216" type="0">
</Transition>
<Transition StartId="216" EndId="218" type="0">
</Transition>
<Transition StartId="217" EndId="233" type="0">
</Transition>
<Transition StartId="217" EndId="214" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="218" EndId="165" type="0">
</Transition>
<Transition StartId="219" EndId="195" type="1">
<Expression>spec_0109~=""</Expression></Transition>
<Transition StartId="219" EndId="220" type="0">
</Transition>
<Transition StartId="220" EndId="197" type="1">
<Expression>spec_010A~=""</Expression></Transition>
<Transition StartId="220" EndId="222" type="0">
</Transition>
<Transition StartId="221" EndId="223" type="1">
<Expression>spec_F1A2~=""</Expression></Transition>
<Transition StartId="221" EndId="226" type="0">
</Transition>
<Transition StartId="222" EndId="199" type="1">
<Expression>spec_010B~=""</Expression></Transition>
<Transition StartId="222" EndId="221" type="0">
</Transition>
<Transition StartId="223" EndId="224" type="0">
</Transition>
<Transition StartId="224" EndId="225" type="0">
</Transition>
<Transition StartId="225" EndId="226" type="0">
</Transition>
<Transition StartId="226" EndId="174" type="0">
</Transition>
<Transition StartId="227" EndId="189" type="0">
</Transition>
<Transition StartId="227" EndId="181" type="5">
</Transition>
<Transition StartId="228" EndId="227" type="1">
<Expression>VMTLOC == "REP"</Expression></Transition>
<Transition StartId="228" EndId="189" type="0">
</Transition>
<Transition StartId="230" EndId="231" type="0">
</Transition>
<Transition StartId="231" EndId="232" type="0">
</Transition>
<Transition StartId="232" EndId="218" type="0">
</Transition>
<Transition StartId="233" EndId="230" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="233" EndId="238" type="0">
</Transition>
<Transition StartId="234" EndId="193" type="1">
<Expression>spec_0105~=""</Expression></Transition>
<Transition StartId="234" EndId="219" type="0">
</Transition>
<Transition StartId="235" EndId="236" type="0">
</Transition>
<Transition StartId="236" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="218" type="0">
</Transition>
<Transition StartId="238" EndId="245" type="0">
</Transition>
<Transition StartId="238" EndId="235" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_newEMS(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="239" EndId="193" type="0">
</Transition>
<Transition StartId="241" EndId="240" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="218" type="0">
</Transition>
<Transition StartId="245" EndId="242" type="1">
<Expression>C131_DCT_SVP_Execute_Flag == true and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="245" EndId="165" type="0">
</Transition>
</Transitions>
</Process>

