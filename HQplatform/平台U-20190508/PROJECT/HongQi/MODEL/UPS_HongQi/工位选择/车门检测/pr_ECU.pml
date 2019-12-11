<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3022" pbltext="DEP125">
<Parameters>
<Variable id="DString_C131_Partnumber_RRDCU" type="8" dir="0" data="DString_C131_Partnumber_RRDCU"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75C" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77C" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="550" top="14" right="650" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="700" top="2784" right="800" bottom="2816"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
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
<Activity id="4" ActivityType="3" flags="0" name="右后门（RRDCU）">
<Rect left="550" top="74" right="650" bottom="106"/>
<TitleText Enable="1" Text="右后门（RRDCU）"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="550" top="164" right="650" bottom="196"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="550" top="224" right="650" bottom="256"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1094" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="重试？">
<Rect left="250" top="314" right="350" bottom="346"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="250" top="164" right="350" bottom="196"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="314" right="196" bottom="346"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="374" right="650" bottom="406"/>
<Line1Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP127" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="464" right="650" bottom="496"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x11"/>
<Parameter id="resTitle" value="0x51"/>
<Parameter id="sendTel" value="&apos;\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="550" top="524" right="650" bottom="556"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="314" right="650" bottom="346"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="13" flags="0" name="dlgWaitSecondBar">
<Rect left="550" top="584" right="650" bottom="616"/>
<FunctionRef id="dlgWaitSecondBar" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="1"/>
<Parameter id="Timeout" value="2"/>
<Parameter id="Text" value="&quot;ECU重置，请稍等&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="550" top="674" right="650" bottom="706"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="705" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="550" top="734" right="650" bottom="766"/>
<Line1Text Enable="1" Text="切诊断"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="3" name="DEP1094" type="8" flags="97"/>
</Activity>
<Activity id="706" ActivityType="3" flags="0" name="重试？">
<Rect left="250" top="794" right="350" bottom="826"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>--engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="707" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="250" top="674" right="350" bottom="706"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="550" top="794" right="650" bottom="826"/>
<Line1Text Enable="1" Text="读零件号"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="709" ActivityType="3" flags="0" name="ECU_Handing">
<Rect left="550" top="854" right="650" bottom="886"/>
<Script></Script></Activity>
<Activity id="713" ActivityType="3" flags="0" name="延时500MS">
<Rect left="670" top="164" right="770" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="858" ActivityType="3" flags="0" name="比对零件号">
<Rect left="700" top="914" right="800" bottom="946"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>
#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_RRDCU);
engine.println("零件号标准值:"..DString_C131_Partnumber_RRDCU);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	
	if (DString1==DString_C131_Partnumber_RRDCU) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_RRDCU); 
	else
		engine.LastError = 1;
		engine.TestResult = 1; 
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_RRDCU);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_RRDCU;

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="6" name="DEP669" type="8" flags="97"/>
</Activity>
<Activity id="859" ActivityType="3" flags="0" name="读硬件号">
<Rect left="820" top="914" right="920" bottom="946"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="7" name="DEP670" type="8" flags="97"/>
</Activity>
<Activity id="860" ActivityType="3" flags="0" name="延时700MS">
<Rect left="940" top="914" right="1040" bottom="946"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  700</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="940" top="974" right="1040" bottom="1006"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="8" name="DEP671" type="8" flags="97"/>
</Activity>
<Activity id="862" ActivityType="3" flags="0" name="延时300MS">
<Rect left="820" top="974" right="920" bottom="1006"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="863" ActivityType="3" flags="0" name="读软件号">
<Rect left="700" top="974" right="800" bottom="1006"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=DString1;
</Script><assessment no="9" name="DEP672" type="8" flags="97"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="延时300MS">
<Rect left="550" top="974" right="650" bottom="1006"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="550" top="1034" right="650" bottom="1066"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
		if(DString_C131_Car_Tpye == "CH1GM11")then
		StandValue="2.00";            
	elseif(DString_C131_Car_Tpye == "CH1GM12")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM31")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM26")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM27")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM32")then
		StandValue="2.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM41")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM42")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM40")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM46")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM47")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM48")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM35")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM32" or DString_C131_Car_Tpye == "CH1CM33")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1MM10")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM30")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1GM23")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM43")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1AM44")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1DM16")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1DM17")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1FM30")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1FM20")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1BM34")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1NM11")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1CM30" or DString_C131_Car_Tpye == "CH1CM31")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1JM12")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1LM13")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1LM23")then
		StandValue="3.00"; 
	elseif(DString_C131_Car_Tpye == "CH1MM21")then
		StandValue="3.00"; 
        elseif(( DString_C131_Car_Tpye == "CMNA02A" ) or( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CH1QM30" ) or ( DString_C131_Car_Tpye == "CH1QM40" ) or ( DString_C131_Car_Tpye == "CH1QM50" )or ( DString_C131_Car_Tpye == "CNDA01A" )or ( DString_C131_Car_Tpye == "CH1PM30" )or ( DString_C131_Car_Tpye == "CH1PM20" ))then
		StandValue="3.00"; 
	else
		StandValue="2.00";           
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
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
end


                                                          


</Script><assessment no="10" name="DEP673" type="8" flags="97"/>
</Activity>
<Activity id="866" ActivityType="3" flags="0" name="延时300MS">
<Rect left="400" top="1034" right="500" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="Door_Light_On">
<Rect left="400" top="1094" right="500" bottom="1126"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="通电，右后门灯亮！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="868" ActivityType="3" flags="0" name="init">
<Rect left="400" top="1154" right="500" bottom="1186"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="869" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="400" top="1214" right="500" bottom="1246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2B&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="截取字符串">
<Rect left="400" top="1274" right="500" bottom="1306"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="871" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="1394" right="500" bottom="1426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="872" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1394" right="376" bottom="1426"/>
</Activity>
<Activity id="873" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1214" right="376" bottom="1246"/>
</Activity>
<Activity id="874" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="1334" right="500" bottom="1366"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????1&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP678" type="8" flags="97"/>
</Activity>
<Activity id="875" ActivityType="3" flags="0" name="手动关闭门锁">
<Rect left="400" top="1454" right="500" bottom="1486"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="手动关闭门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow";</Script></Activity>
<Activity id="876" ActivityType="3" flags="0" name="init">
<Rect left="400" top="1514" right="500" bottom="1546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="877" ActivityType="13" flags="0" name="Read_door_light_status">
<Rect left="400" top="1574" right="500" bottom="1606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2B&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="878" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="1754" right="500" bottom="1786"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="879" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1754" right="376" bottom="1786"/>
</Activity>
<Activity id="880" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1574" right="376" bottom="1606"/>
</Activity>
<Activity id="882" ActivityType="3" flags="0" name="截取字符串">
<Rect left="400" top="1634" right="500" bottom="1666"/>
<Script>

MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="883" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="400" top="1694" right="500" bottom="1726"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;???????0&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="3600"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="31" name="DEP1975" type="8" flags="97"/>
</Activity>
<Activity id="884" ActivityType="3" flags="0" name="Basic_Current_Check">
<Rect left="400" top="1814" right="500" bottom="1846"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="889" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="700" top="1094" right="800" bottom="1126"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="右后门玻璃下降"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x13\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="896" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="700" top="1394" right="800" bottom="1426"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x13\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="897" ActivityType="13" flags="0" name="Check_the_door_window">
<Rect left="700" top="1454" right="800" bottom="1486"/>
<Line3Text Enable="1" Text="右后门玻璃上升"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x13\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="904" ActivityType="13" flags="0" name="Window_down_stop">
<Rect left="700" top="1754" right="800" bottom="1786"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x13\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="905" ActivityType="13" flags="0" name="Windows_ReturnControlToECU">
<Rect left="700" top="1874" right="800" bottom="1906"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x13\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="906" ActivityType="13" flags="0" name="Check_the_door_lock">
<Rect left="1000" top="1094" right="1100" bottom="1126"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动上锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x12\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="907" ActivityType="3" flags="0" name="init">
<Rect left="1000" top="1154" right="1100" bottom="1186"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="908" ActivityType="13" flags="0" name="Read_status">
<Rect left="1000" top="1214" right="1100" bottom="1246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2A&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="909" ActivityType="3" flags="0" name="endloop">
<Rect left="1000" top="1394" right="1100" bottom="1426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="910" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1394" right="976" bottom="1426"/>
</Activity>
<Activity id="911" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1214" right="976" bottom="1246"/>
</Activity>
<Activity id="912" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1000" top="1274" right="1100" bottom="1306"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="913" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1000" top="1334" right="1100" bottom="1366"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="14" name="DEP786" type="8" flags="97"/>
</Activity>
<Activity id="914" ActivityType="3" flags="0" name="init">
<Rect left="1000" top="1514" right="1100" bottom="1546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="915" ActivityType="13" flags="0" name="Read_status">
<Rect left="1000" top="1574" right="1100" bottom="1606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x2A&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="916" ActivityType="3" flags="0" name="endloop">
<Rect left="1000" top="1754" right="1100" bottom="1786"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="917" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1754" right="976" bottom="1786"/>
</Activity>
<Activity id="918" ActivityType="4" flags="0" name="路由节点">
<Rect left="944" top="1574" right="976" bottom="1606"/>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1000" top="1634" right="1100" bottom="1666"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="920" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1000" top="1694" right="1100" bottom="1726"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="5"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP787" type="8" flags="97"/>
</Activity>
<Activity id="922" ActivityType="13" flags="0" name="Doors_lock_ReturnControlToECU">
<Rect left="1000" top="1814" right="1100" bottom="1846"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x12\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="923" ActivityType="3" flags="0" name="清除界面">
<Rect left="1000" top="1874" right="1100" bottom="1906"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="924" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="1270" top="1094" right="1370" bottom="1126"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 1"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="925" ActivityType="3" flags="0" name="init">
<Rect left="1270" top="1154" right="1370" bottom="1186"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="926" ActivityType="13" flags="0" name="Read_status">
<Rect left="1270" top="1214" right="1370" bottom="1246"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="endloop">
<Rect left="1270" top="1394" right="1370" bottom="1426"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="928" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1394" right="1246" bottom="1426"/>
</Activity>
<Activity id="929" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1214" right="1246" bottom="1246"/>
</Activity>
<Activity id="930" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1270" top="1274" right="1370" bottom="1306"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="931" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1270" top="1334" right="1370" bottom="1366"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP2041" type="8" flags="97"/>
</Activity>
<Activity id="932" ActivityType="3" flags="0" name="Check_the_switch">
<Rect left="1270" top="1454" right="1370" bottom="1486"/>
<Line2Text Enable="1" Text="右后门玻璃降 Level 2"/>
<Script></Script></Activity>
<Activity id="933" ActivityType="3" flags="0" name="init">
<Rect left="1270" top="1514" right="1370" bottom="1546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="934" ActivityType="13" flags="0" name="Read_status">
<Rect left="1270" top="1574" right="1370" bottom="1606"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="endloop">
<Rect left="1270" top="1754" right="1370" bottom="1786"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="936" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1754" right="1246" bottom="1786"/>
</Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1574" right="1246" bottom="1606"/>
</Activity>
<Activity id="938" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1270" top="1634" right="1370" bottom="1666"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="939" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1270" top="1694" right="1370" bottom="1726"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="33" name="DEP2039" type="8" flags="97"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="init">
<Rect left="1270" top="1814" right="1370" bottom="1846"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 1"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="941" ActivityType="13" flags="0" name="Read_status">
<Rect left="1270" top="1874" right="1370" bottom="1906"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="942" ActivityType="3" flags="0" name="endloop">
<Rect left="1270" top="2054" right="1370" bottom="2086"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="2054" right="1246" bottom="2086"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="1214" top="1874" right="1246" bottom="1906"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1270" top="1934" right="1370" bottom="1966"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="946" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1270" top="1994" right="1370" bottom="2026"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="34" name="DEP2039" type="8" flags="97"/>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="init">
<Rect left="1270" top="2114" right="1370" bottom="2146"/>
<Line2Text Enable="1" Text="右后门玻璃升 Level 2（升到顶）"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;</Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="Read_status">
<Rect left="1270" top="2174" right="1370" bottom="2206"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x01\x32&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="endloop">
<Rect left="1270" top="2354" right="1370" bottom="2386"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="950" ActivityType="4" flags="0" name="路由节点">
<Rect left="1394" top="2354" right="1426" bottom="2386"/>
</Activity>
<Activity id="951" ActivityType="4" flags="0" name="路由节点">
<Rect left="1394" top="2174" right="1426" bottom="2206"/>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="截取字符串">
<Rect left="1270" top="2234" right="1370" bottom="2266"/>
<Script>
MeasValue = string.byte(DVciResult,4)</Script></Activity>
<Activity id="953" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1270" top="2294" right="1370" bottom="2326"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0011&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="MeasValue"/>
<Parameter id="RightViewText" value="&quot;Status&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="36" name="DEP2040" type="8" flags="97"/>
</Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="2354" right="1036" bottom="2386"/>
</Activity>
<Activity id="958" ActivityType="3" flags="0" name="init">
<Rect left="400" top="1874" right="500" bottom="1906"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="959" ActivityType="3" flags="0" name="endloop">
<Rect left="400" top="2054" right="500" bottom="2086"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="960" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="2054" right="376" bottom="2086"/>
</Activity>
<Activity id="961" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="400" top="1994" right="500" bottom="2026"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="20000"/>
<Parameter id="LowerLimit" value="0"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP679" type="8" flags="97"/>
</Activity>
<Activity id="962" ActivityType="3" flags="0" name="初始化">
<Rect left="400" top="1934" right="500" bottom="1966"/>
<Script>DFloat_Mts3Result = math.abs(engine.pr_door_i );
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="344" top="1934" right="376" bottom="1966"/>
</Activity>
<Activity id="965" ActivityType="3" flags="0" name="init">
<Rect left="700" top="1154" right="800" bottom="1186"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="966" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="1334" right="800" bottom="1366"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="967" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1334" right="676" bottom="1366"/>
</Activity>
<Activity id="968" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="700" top="1274" right="800" bottom="1306"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="37" name="DEP680" type="8" flags="97"/>
</Activity>
<Activity id="969" ActivityType="3" flags="0" name="初始化">
<Rect left="700" top="1214" right="800" bottom="1246"/>
<Script>DFloat_Mts3Result = math.abs(engine.pr_door_i ) /1000;
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="970" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1214" right="676" bottom="1246"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="init">
<Rect left="700" top="1514" right="800" bottom="1546"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="972" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="1694" right="800" bottom="1726"/>
<ButtonLText Enable="1" Text="退出"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="973" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1694" right="676" bottom="1726"/>
</Activity>
<Activity id="974" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="700" top="1634" right="800" bottom="1666"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="30"/>
<Parameter id="LowerLimit" value="2"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="2"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="38" name="DEP681" type="8" flags="97"/>
</Activity>
<Activity id="975" ActivityType="3" flags="0" name="初始化">
<Rect left="700" top="1574" right="800" bottom="1606"/>
<Script>DFloat_Mts3Result = math.abs(engine.pr_door_i ) /1000;
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="976" ActivityType="4" flags="0" name="路由节点">
<Rect left="644" top="1574" right="676" bottom="1606"/>
</Activity>
<Activity id="981" ActivityType="13" flags="0" name="Check_the_door_Unlock">
<Rect left="1000" top="1454" right="1100" bottom="1486"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="右后门自动解锁"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\x02\x12\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="986" ActivityType="3" flags="1" name="手动开启门锁">
<Rect left="700" top="2114" right="800" bottom="2146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="手动开启门锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="987" ActivityType="3" flags="0" name="init">
<Rect left="700" top="2174" right="800" bottom="2206"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
</Script></Activity>
<Activity id="988" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="2354" right="800" bottom="2386"/>
<ButtonLText Enable="1" Text="退出"/>
<Script></Script></Activity>
<Activity id="989" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="2354" right="856" bottom="2386"/>
</Activity>
<Activity id="990" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="700" top="2294" right="800" bottom="2326"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="UpperLimit" value="600"/>
<Parameter id="LowerLimit" value="200"/>
<Parameter id="MeasValue" value="DFloat_Mts3Result"/>
<Parameter id="RightViewText" value="&quot;&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="4"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="39" name="DEP2038" type="8" flags="97"/>
</Activity>
<Activity id="991" ActivityType="3" flags="0" name="初始化">
<Rect left="700" top="2234" right="800" bottom="2266"/>
<Script>DFloat_Mts3Result = math.abs(engine.pr_door_i );
--DFloat_Mts3Result=tostring(DFloat_Mts3Result)</Script></Activity>
<Activity id="992" ActivityType="4" flags="0" name="路由节点">
<Rect left="824" top="2234" right="856" bottom="2266"/>
</Activity>
<Activity id="1199" ActivityType="3" flags="0" name="DlgMultiLineClearAll">
<Rect left="700" top="2414" right="800" bottom="2446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="1206" ActivityType="3" flags="0" name="维持信号">
<Rect left="550" top="914" right="650" bottom="946"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="1209" ActivityType="3" flags="0" name="延时200MS">
<Rect left="700" top="1814" right="800" bottom="1846"/>
<Script>#DELAY  200</Script></Activity>
<Activity id="1211" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="794" right="196" bottom="826"/>
</Activity>
<Activity id="1233" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="700" top="2594" right="800" bottom="2626"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP128" type="8" flags="97"/>
</Activity>
<Activity id="1234" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="700" top="2534" right="800" bottom="2566"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2206-00,U2207-00,U2208-00,U0141-00,U1008-00,U0199-00,U0146-00,U0002-00,U2351-00,U2356-00,B1266-00,B1271-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1235" ActivityType="3" flags="0" name="读DTC">
<Rect left="700" top="2474" right="800" bottom="2506"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP128" type="8" flags="97"/>
</Activity>
<Activity id="1237" ActivityType="3" flags="0" name="将玻璃上升">
<Rect left="700" top="2654" right="800" bottom="2686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=请将玻璃升到顶".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="1238" ActivityType="3" flags="0" name="状态判断">
<Rect left="700" top="2714" right="800" bottom="2746"/>
<Script>if(engine.LButtonPressed) then 
engine.LastError = 1;
engine.StatValue = "人工点击右后门玻璃未上升到顶部"
end
if(engine.RButtonPressed) then
engine.LastError = 0;
engine.StatValue ="人工点击玻璃上升到顶部"
end</Script><assessment no="40" name="DEP2046" type="8" flags="97"/>
</Activity>
<Activity id="1239" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="2054" right="616" bottom="2086"/>
</Activity>
<Activity id="1240" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="1094" right="616" bottom="1126"/>
</Activity>
<Activity id="1241" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="1094" right="886" bottom="1126"/>
</Activity>
<Activity id="1242" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="1874" right="886" bottom="1906"/>
</Activity>
<Activity id="1243" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="1874" right="1186" bottom="1906"/>
</Activity>
<Activity id="1244" ActivityType="4" flags="0" name="路由节点">
<Rect left="1154" top="1094" right="1186" bottom="1126"/>
</Activity>
<Activity id="1245" ActivityType="4" flags="0" name="路由节点">
<Rect left="1004" top="2114" right="1036" bottom="2146"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="713" type="0">
</Transition>
<Transition StartId="6" EndId="13" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="5" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="7" type="4">
</Transition>
<Transition StartId="13" EndId="10" type="0">
</Transition>
<Transition StartId="14" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="705" type="0">
</Transition>
<Transition StartId="705" EndId="708" type="0">
</Transition>
<Transition StartId="706" EndId="707" type="0">
</Transition>
<Transition StartId="706" EndId="1211" type="5">
</Transition>
<Transition StartId="707" EndId="21" type="0">
</Transition>
<Transition StartId="708" EndId="706" type="4">
</Transition>
<Transition StartId="708" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="1206" type="0">
</Transition>
<Transition StartId="713" EndId="6" type="0">
</Transition>
<Transition StartId="858" EndId="859" type="0">
</Transition>
<Transition StartId="859" EndId="860" type="0">
</Transition>
<Transition StartId="860" EndId="861" type="0">
</Transition>
<Transition StartId="861" EndId="862" type="0">
</Transition>
<Transition StartId="862" EndId="863" type="0">
</Transition>
<Transition StartId="863" EndId="864" type="0">
</Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="867" EndId="868" type="0">
</Transition>
<Transition StartId="868" EndId="869" type="0">
</Transition>
<Transition StartId="869" EndId="870" type="0">
</Transition>
<Transition StartId="870" EndId="874" type="0">
</Transition>
<Transition StartId="871" EndId="872" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="871" EndId="875" type="0">
</Transition>
<Transition StartId="872" EndId="873" type="0">
</Transition>
<Transition StartId="873" EndId="869" type="0">
</Transition>
<Transition StartId="874" EndId="871" type="0">
</Transition>
<Transition StartId="875" EndId="876" type="0">
</Transition>
<Transition StartId="876" EndId="877" type="0">
</Transition>
<Transition StartId="877" EndId="882" type="0">
</Transition>
<Transition StartId="878" EndId="879" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="878" EndId="884" type="0">
</Transition>
<Transition StartId="879" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="877" type="0">
</Transition>
<Transition StartId="882" EndId="883" type="0">
</Transition>
<Transition StartId="883" EndId="878" type="0">
</Transition>
<Transition StartId="884" EndId="958" type="0">
</Transition>
<Transition StartId="889" EndId="965" type="0">
</Transition>
<Transition StartId="896" EndId="897" type="0">
</Transition>
<Transition StartId="897" EndId="971" type="0">
</Transition>
<Transition StartId="904" EndId="1209" type="0">
</Transition>
<Transition StartId="905" EndId="1242" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="0">
</Transition>
<Transition StartId="907" EndId="908" type="0">
</Transition>
<Transition StartId="908" EndId="912" type="0">
</Transition>
<Transition StartId="909" EndId="910" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="909" EndId="981" type="0">
</Transition>
<Transition StartId="910" EndId="911" type="0">
</Transition>
<Transition StartId="911" EndId="908" type="0">
</Transition>
<Transition StartId="912" EndId="913" type="0">
</Transition>
<Transition StartId="913" EndId="909" type="0">
</Transition>
<Transition StartId="914" EndId="915" type="0">
</Transition>
<Transition StartId="915" EndId="919" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="916" EndId="922" type="0">
</Transition>
<Transition StartId="917" EndId="918" type="0">
</Transition>
<Transition StartId="918" EndId="915" type="0">
</Transition>
<Transition StartId="919" EndId="920" type="0">
</Transition>
<Transition StartId="920" EndId="916" type="0">
</Transition>
<Transition StartId="922" EndId="923" type="0">
</Transition>
<Transition StartId="923" EndId="1243" type="0">
</Transition>
<Transition StartId="924" EndId="925" type="0">
</Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="930" type="0">
</Transition>
<Transition StartId="927" EndId="928" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="927" EndId="932" type="0">
</Transition>
<Transition StartId="928" EndId="929" type="0">
</Transition>
<Transition StartId="929" EndId="926" type="0">
</Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="927" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="934" type="0">
</Transition>
<Transition StartId="934" EndId="938" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="935" EndId="940" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="934" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="935" type="0">
</Transition>
<Transition StartId="940" EndId="941" type="0">
</Transition>
<Transition StartId="941" EndId="945" type="0">
</Transition>
<Transition StartId="942" EndId="943" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="942" EndId="947" type="0">
</Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="941" type="0">
</Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="942" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="952" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="949" EndId="954" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="948" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="0">
</Transition>
<Transition StartId="953" EndId="949" type="0">
</Transition>
<Transition StartId="954" EndId="1245" type="0">
</Transition>
<Transition StartId="958" EndId="962" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="959" EndId="1239" type="0">
</Transition>
<Transition StartId="960" EndId="963" type="0">
</Transition>
<Transition StartId="961" EndId="959" type="0">
</Transition>
<Transition StartId="962" EndId="961" type="0">
</Transition>
<Transition StartId="963" EndId="962" type="0">
</Transition>
<Transition StartId="965" EndId="969" type="0">
</Transition>
<Transition StartId="966" EndId="967" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="966" EndId="896" type="0">
</Transition>
<Transition StartId="967" EndId="970" type="0">
</Transition>
<Transition StartId="968" EndId="966" type="0">
</Transition>
<Transition StartId="969" EndId="968" type="0">
</Transition>
<Transition StartId="970" EndId="969" type="0">
</Transition>
<Transition StartId="971" EndId="975" type="0">
</Transition>
<Transition StartId="972" EndId="973" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="972" EndId="904" type="0">
</Transition>
<Transition StartId="973" EndId="976" type="0">
</Transition>
<Transition StartId="974" EndId="972" type="0">
</Transition>
<Transition StartId="975" EndId="974" type="0">
</Transition>
<Transition StartId="976" EndId="975" type="0">
</Transition>
<Transition StartId="981" EndId="914" type="0">
</Transition>
<Transition StartId="986" EndId="987" type="0">
</Transition>
<Transition StartId="987" EndId="991" type="0">
</Transition>
<Transition StartId="988" EndId="989" type="1">
<Expression>FinishFlag_1 ==  false</Expression></Transition>
<Transition StartId="988" EndId="1199" type="0">
</Transition>
<Transition StartId="989" EndId="992" type="0">
</Transition>
<Transition StartId="990" EndId="988" type="0">
</Transition>
<Transition StartId="991" EndId="990" type="0">
</Transition>
<Transition StartId="992" EndId="991" type="0">
</Transition>
<Transition StartId="1199" EndId="1235" type="0">
</Transition>
<Transition StartId="1206" EndId="858" type="0">
</Transition>
<Transition StartId="1209" EndId="905" type="0">
</Transition>
<Transition StartId="1233" EndId="1237" type="0">
</Transition>
<Transition StartId="1234" EndId="1233" type="0">
</Transition>
<Transition StartId="1235" EndId="1234" type="0">
</Transition>
<Transition StartId="1237" EndId="1238" type="0">
</Transition>
<Transition StartId="1238" EndId="2" type="0">
</Transition>
<Transition StartId="1239" EndId="1240" type="0">
</Transition>
<Transition StartId="1240" EndId="889" type="0">
</Transition>
<Transition StartId="1241" EndId="906" type="0">
</Transition>
<Transition StartId="1242" EndId="1241" type="0">
</Transition>
<Transition StartId="1243" EndId="1244" type="0">
</Transition>
<Transition StartId="1244" EndId="924" type="0">
</Transition>
<Transition StartId="1245" EndId="986" type="0">
</Transition>
</Transitions>
</Process>

