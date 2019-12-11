<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1145" pbltext="DEP91">
<Parameters>
<Variable id="DString_C131_Partnumber_PEPS" type="8" dir="0" data="DString_C131_Partnumber_PEPS"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="521" top="26" right="621" bottom="58"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="540" top="1424" right="640" bottom="1456"/>
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
<Activity id="3" ActivityType="3" flags="0" name="智能进入系统 (PEPS)">
<Rect left="521" top="93" right="621" bottom="125"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Script>#DELAY  500
--engine.ecu_CAN_control_2 = false;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="520" top="159" right="620" bottom="191"/>
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
<Activity id="5" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="520" top="364" right="620" bottom="396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2011" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="重试？">
<Rect left="210" top="234" right="310" bottom="266"/>
<Line1Text Enable="1" Text="PEPS控制器连接失败！"/>
<Line2Text Enable="1" Text="#L=重试吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON
--flag = 0;
--repeat
--        if (engine.start_press == false ) then
--		flag = 1
 --       elseif (engine.stop_press == true) then
--		flag = 2
   --     else
--		flag = 0
  --      end
--until(flag ~= 0)
--engine.println("stop_press:"..tostring(engine.stop_press));
--engine.println("start_press:"..tostring(engine.start_press));
--engine.println("flag:"..tostring(flag));</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="216" top="158" right="316" bottom="190"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="234" right="196" bottom="266"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="520" top="234" right="620" bottom="266"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xF1\x87&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="2200" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="520" top="294" right="620" bottom="326"/>
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
<assessment no="2010" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="比对零件号">
<Rect left="520" top="584" right="620" bottom="616"/>
<Line1Text Enable="1" Text="比对零件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber_PEPS);
engine.println("零件号标准值:"..DString_C131_Partnumber_PEPS);
len = string.len(DString_C131_Partnumber_PEPS)
if(len == 10 )then
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_PEPS) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PEPS); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PEPS);
		end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber_PEPS;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
	end
else
	if(@0==0x62)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
		engine.SetLineText(3,DString1);
		engine.println("读到零件号:"..DString1);
	
		if (DString1==DString_C131_Partnumber_PEPS) then
			engine.LastError = 0;
			engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber_PEPS); 
		else
			engine.LastError = 1;
			engine.TestResult = 1; 
			engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber_PEPS);
		end
		engine.StatValue=DString1;
		engine.StatPoint=DString_C131_Partnumber_PEPS;
	
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		local StringRes;
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
	end
end</Script><assessment no="1" name="DEP359" type="8" flags="97"/>
</Activity>
<Activity id="867" ActivityType="3" flags="0" name="延时100MS">
<Rect left="520" top="654" right="620" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="886" ActivityType="4" flags="0" name="路由节点">
<Rect left="1484" top="584" right="1516" bottom="616"/>
</Activity>
<Activity id="887" ActivityType="4" flags="0" name="路由节点">
<Rect left="1554" top="584" right="1586" bottom="616"/>
</Activity>
<Activity id="888" ActivityType="4" flags="0" name="路由节点">
<Rect left="1644" top="584" right="1676" bottom="616"/>
</Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="584" right="1766" bottom="616"/>
</Activity>
<Activity id="890" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="644" right="1766" bottom="676"/>
</Activity>
<Activity id="891" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="724" right="1766" bottom="756"/>
</Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="814" right="1766" bottom="846"/>
</Activity>
<Activity id="893" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1700" top="944" right="1800" bottom="976"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle-1 0x22 0xF1 0x95
         StandValue = "300"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);


</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="普通节点">
<Rect left="1320" top="584" right="1420" bottom="616"/>
<Script></Script></Activity>
<Activity id="898" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="634" right="990" bottom="666"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "124"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);


</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="674" right="990" bottom="706"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "123"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);

</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="延时100MS">
<Rect left="540" top="914" right="640" bottom="946"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="904" ActivityType="4" flags="0" name="路由节点">
<Rect left="1484" top="944" right="1516" bottom="976"/>
</Activity>
<Activity id="905" ActivityType="4" flags="0" name="路由节点">
<Rect left="1734" top="874" right="1766" bottom="906"/>
</Activity>
<Activity id="906" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="504" right="990" bottom="536"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "110"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="907" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="544" right="990" bottom="576"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "110"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);


</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="908" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="584" right="990" bottom="616"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95

        if((DString_C131_Car_Tpye == "CH1LM23")  or (DString_C131_Car_Tpye == "CH1LM13") )then
		StandValue="141";            
	elseif(DString_C131_Car_Tpye == "CH1MM41")then
		StandValue="160"; 
	elseif((DString_C131_Car_Tpye == "CH1LM11") or (DString_C131_Car_Tpye == "CH1LM21") or (DString_C131_Car_Tpye == "CH1MM21"))then
		StandValue="130"; 
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="909" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1090" top="694" right="1190" bottom="726"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "160"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="910" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1090" top="744" right="1190" bottom="776"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "160"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);

</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="911" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1090" top="804" right="1190" bottom="836"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "160"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;

</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="912" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1080" top="864" right="1180" bottom="896"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "170"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="913" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1070" top="924" right="1170" bottom="956"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "160"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="ReadDTC">
<Rect left="540" top="1014" right="640" bottom="1046"/>
<Script></Script></Activity>
<Activity id="916" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="1154" right="606" bottom="1186"/>
</Activity>
<Activity id="917" ActivityType="13" flags="0" name="DtcFilter_18T">
<Rect left="650" top="1154" right="750" bottom="1186"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B12FF-00,B1300-00,B1301-00,B1302-00,B1303-00,B1304-00,B1305-00,B1306-00,B130D-00,B130E-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="918" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="540" top="1314" right="640" bottom="1346"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_PEPS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="46" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="919" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="540" top="1224" right="640" bottom="1256"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0141-00,U0199-00,U0200-00,U0201-00,U0202-00,U0146-00,U250A-00,U250B-00,B12F3-00,B12F4-00,B12F5-00,B141A-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="920" ActivityType="3" flags="0" name="读DTC">
<Rect left="540" top="1074" right="640" bottom="1106"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMMEX vciHandle -1 0x19 0x02 0x0C
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="46" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="923" ActivityType="3" flags="0" name="信号维持">
<Rect left="610" top="444" right="710" bottom="476"/>
<Script>engine.registerPacket(1,4000,0x7DF,"\x02\x3E\x80\x00\x00\x00\x00\x00",0);</Script></Activity>
<Activity id="924" ActivityType="3" flags="0" name="延时300MS">
<Rect left="520" top="514" right="620" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  500</Script></Activity>
<Activity id="925" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="590" top="764" right="690" bottom="796"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "180"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="926" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="470" top="764" right="570" bottom="796"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "180"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="330" top="764" right="430" bottom="796"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
         StandValue = "180"
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
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
	

	--local StringRes;
	--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=DString1;
</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="10" type="0">
</Transition>
<Transition StartId="5" EndId="924" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="6">
</Transition>
<Transition StartId="6" EndId="9" type="5">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="6" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="5" type="0">
</Transition>
<Transition StartId="12" EndId="867" type="0">
</Transition>
<Transition StartId="867" EndId="925" type="0">
</Transition>
<Transition StartId="867" EndId="926" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1BM35" ) or ( DString_C131_Car_Tpye == "CH1CM32" )  or ( DString_C131_Car_Tpye == "CH1CM33" )  or ( DString_C131_Car_Tpye == "CH1MM41" )</Expression></Transition>
<Transition StartId="867" EndId="927" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1AM48" )</Expression></Transition>
<Transition StartId="886" EndId="887" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1FM12" ) or ( DString_C131_Car_Tpye == "CH1FM13" ) or (DString_C131_Car_Tpye == "CH1JM11") or (DString_C131_Car_Tpye == "CH1FM20") or (DString_C131_Car_Tpye == "CH1FM30"))</Expression></Transition>
<Transition StartId="886" EndId="904" type="0">
</Transition>
<Transition StartId="887" EndId="888" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1GM30" ))</Expression></Transition>
<Transition StartId="887" EndId="904" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1LM11") or (DString_C131_Car_Tpye == "CH1LM21") or (DString_C131_Car_Tpye == "CH1MM21") or (DString_C131_Car_Tpye == "CH1LM13") or (DString_C131_Car_Tpye == "CH1LM23" ))</Expression></Transition>
<Transition StartId="888" EndId="904" type="0">
</Transition>
<Transition StartId="889" EndId="890" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1FM20" ) or ( DString_C131_Car_Tpye == "CH1FM30" ))</Expression></Transition>
<Transition StartId="889" EndId="904" type="0">
</Transition>
<Transition StartId="890" EndId="891" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1BM34" ) or ( DString_C131_Car_Tpye == "CH1NM11" ) or ( DString_C131_Car_Tpye == "CH1CM31" ) or ( DString_C131_Car_Tpye == "CH1CM30" ) or ( DString_C131_Car_Tpye == "CH1JM12" ))</Expression></Transition>
<Transition StartId="890" EndId="904" type="0">
</Transition>
<Transition StartId="891" EndId="892" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ))</Expression></Transition>
<Transition StartId="891" EndId="904" type="0">
</Transition>
<Transition StartId="892" EndId="905" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1AM48" ) or ( DString_C131_Car_Tpye == "CH1BM35" ) or ( DString_C131_Car_Tpye == "CH1CM32" ) or ( DString_C131_Car_Tpye == "CH1CM33" ) or ( DString_C131_Car_Tpye == "CH1MM41" ))</Expression></Transition>
<Transition StartId="892" EndId="904" type="0">
</Transition>
<Transition StartId="893" EndId="904" type="0">
</Transition>
<Transition StartId="894" EndId="886" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" ) or ( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" ))</Expression></Transition>
<Transition StartId="894" EndId="907" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" )</Expression></Transition>
<Transition StartId="894" EndId="906" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1DM11" ) or ( DString_C131_Car_Tpye == "CH1DM13" )</Expression></Transition>
<Transition StartId="894" EndId="908" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1LM11") or (DString_C131_Car_Tpye == "CH1LM21") or (DString_C131_Car_Tpye == "CH1MM21") or (DString_C131_Car_Tpye == "CH1LM13") or (DString_C131_Car_Tpye == "CH1LM23") or (DString_C131_Car_Tpye == "CH1MM41")</Expression></Transition>
<Transition StartId="894" EndId="898" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1FM12") or (DString_C131_Car_Tpye == "CH1FM13")</Expression></Transition>
<Transition StartId="894" EndId="899" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1JM11" )</Expression></Transition>
<Transition StartId="894" EndId="909" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1FM20" ) or ( DString_C131_Car_Tpye == "CH1FM30" ) or ( DString_C131_Car_Tpye == "CMNA02A" ) or ( DString_C131_Car_Tpye == "CMNA01A" ) or ( DString_C131_Car_Tpye == "CH1QM30" ) or ( DString_C131_Car_Tpye == "CH1QM40" ) or ( DString_C131_Car_Tpye == "CH1QM50" ) or ( DString_C131_Car_Tpye == "CNDA01" ) or ( DString_C131_Car_Tpye == "CH1PM30" ) or ( DString_C131_Car_Tpye == "CH1PM20" )</Expression></Transition>
<Transition StartId="894" EndId="910" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1BM34" ) or ( DString_C131_Car_Tpye == "CH1NM11" ) or ( DString_C131_Car_Tpye == "CH1CM31" ) or ( DString_C131_Car_Tpye == "CH1JM12" ) or ( DString_C131_Car_Tpye == "CH1CM30" )</Expression></Transition>
<Transition StartId="894" EndId="911" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1BM35" ) or ( DString_C131_Car_Tpye == "CH1CM33" ) or ( DString_C131_Car_Tpye == "CH1CM32" )</Expression></Transition>
<Transition StartId="894" EndId="912" type="1">
<Expression>( DString_C131_Car_Tpye == "CH1GM41" ) or ( DString_C131_Car_Tpye == "CH1GM42" ) or ( DString_C131_Car_Tpye == "CH1GM40" ) or ( DString_C131_Car_Tpye == "CH1AM46" ) or ( DString_C131_Car_Tpye == "CH1AM47" ) or ( DString_C131_Car_Tpye == "CH1AM48" )</Expression></Transition>
<Transition StartId="894" EndId="913" type="1">
<Expression>( DString_C131_Car_Tpye == "CNDA01A" ) or( DString_C131_Car_Tpye == "CH1PM20" ) or( DString_C131_Car_Tpye == "CH1PM30" ) or( DString_C131_Car_Tpye == "CH1QM50" ) or( DString_C131_Car_Tpye == "CMNA02A" ) or( DString_C131_Car_Tpye == "CMNA01A" ) or( DString_C131_Car_Tpye == "CH1QM30" ) or( DString_C131_Car_Tpye == "CH1QM40" ) or( DString_C131_Car_Tpye == "CH1GM30" ) or ( DString_C131_Car_Tpye == "CH1GM23" ) or ( DString_C131_Car_Tpye == "CH1AM43" ) or ( DString_C131_Car_Tpye == "CH1AM44" ) or ( DString_C131_Car_Tpye == "CH1DM16" ) or ( DString_C131_Car_Tpye == "CH1DM17" )</Expression></Transition>
<Transition StartId="894" EndId="904" type="0">
</Transition>
<Transition StartId="898" EndId="903" type="0">
</Transition>
<Transition StartId="899" EndId="903" type="0">
</Transition>
<Transition StartId="903" EndId="915" type="0">
</Transition>
<Transition StartId="904" EndId="903" type="0">
</Transition>
<Transition StartId="905" EndId="893" type="1">
<Expression>not (( DString_C131_Car_Tpye == "CH1GM30" ) or ( DString_C131_Car_Tpye == "CH1GM23" ) or ( DString_C131_Car_Tpye == "CH1AM43" ) or ( DString_C131_Car_Tpye == "CH1AM44" ) or ( DString_C131_Car_Tpye == "CH1DM16" ) or ( DString_C131_Car_Tpye == "CH1DM17" ))</Expression></Transition>
<Transition StartId="906" EndId="903" type="0">
</Transition>
<Transition StartId="907" EndId="903" type="0">
</Transition>
<Transition StartId="908" EndId="903" type="0">
</Transition>
<Transition StartId="909" EndId="903" type="0">
</Transition>
<Transition StartId="910" EndId="903" type="0">
</Transition>
<Transition StartId="911" EndId="903" type="0">
</Transition>
<Transition StartId="912" EndId="903" type="0">
</Transition>
<Transition StartId="913" EndId="903" type="0">
</Transition>
<Transition StartId="915" EndId="920" type="0">
</Transition>
<Transition StartId="916" EndId="917" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1GM11") or (DString_C131_Car_Tpye == "CH1GM12")</Expression></Transition>
<Transition StartId="916" EndId="919" type="0">
</Transition>
<Transition StartId="917" EndId="919" type="0">
</Transition>
<Transition StartId="918" EndId="2" type="0">
</Transition>
<Transition StartId="919" EndId="918" type="0">
</Transition>
<Transition StartId="920" EndId="916" type="0">
</Transition>
<Transition StartId="923" EndId="924" type="0">
</Transition>
<Transition StartId="924" EndId="12" type="0">
</Transition>
<Transition StartId="925" EndId="903" type="0">
</Transition>
<Transition StartId="926" EndId="903" type="0">
</Transition>
<Transition StartId="927" EndId="903" type="0">
</Transition>
</Transitions>
</Process>

