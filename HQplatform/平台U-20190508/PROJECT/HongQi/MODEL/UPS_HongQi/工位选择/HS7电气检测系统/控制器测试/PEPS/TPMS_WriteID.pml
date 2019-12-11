<?xml version="1.0" encoding="utf-8" ?>
<Process block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
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
<Rect left="320" top="4" right="420" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="胎压传感器ID值写入"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="450" top="1114" right="550" bottom="1146"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="VT56S建立连接">
<Rect left="620" top="74" right="720" bottom="106"/>
<ButtonLText Enable="1" Text="手动选择"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>repeat
	engine.LastError = -1
	engine.SetLineText(1,"连接VT56S胎压手持设备...")
	bluehandle = engine.SockOpen(rHost,"",-1)
	
        if (engine.LastError ~= 0)then
		engine.SetLineText(1,"连接失败")
                engine.SetLineText(2,"请打开胎压手持设备")		
                engine.Delay(5000)
                engine.SetLineText(2,"")
                engine.SetLineText(3,"接收中...");
        end
until(engine.LastError == 0 or engine.LButtonPressed == true)
if(engine.LastError == 0) then	
	engine.SetLineText(1,"成功连接到胎压手持仪!")
	engine.SetLineText(2,"请开始扫描...")
	engine.Delay(1000)
else
        engine.LastError = 1;
end        
</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="接收蓝牙数据">
<Rect left="450" top="224" right="550" bottom="256"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ListClear();
local MissConnet = 0
recvbuf = "";
repeat
	engine.SetLineText(3,"接收中...");
	err = engine.SockRecv(bluehandle,5000);
	recvbuf =  engine.GetResponseString(0,-1);
	engine.println("engine.LastError:"..engine.LastError);

	while(#recvbuf ~= 84 and #recvbuf &gt; 0 and MissConnet == 0) do
		err = engine.SockRecv(bluehandle,2000);
		recvbuf = recvbuf .. engine.GetResponseString(0,-1); 
		engine.println("TPMS_DATA:" .. recvbuf);
		engine.println("Len recvbuf:"..#recvbuf);
		
                if (string.match(recvbuf,"VT56OFF")) then
			MissConnet = 1
		end
	end
	

        
until (MissConnet == 1 or #recvbuf == 84)

if (MissConnet ==0 and #recvbuf == 84) then

	TPMID_FL = recvbuf:sub(28,35)
	TPMID_FR = recvbuf:sub(39,46)
	TPMID_RL = recvbuf:sub(50,57)
	TPMID_RR = recvbuf:sub(61,68)
        
        TPMID_FL1 = TPMID_FL
        TPMID_FR1 = TPMID_FR
        TPMID_RL1 = TPMID_RL
        TPMID_RR1 = TPMID_RR

	print("TPMID_FL"..TPMID_FL)
	print("TPMID_FR"..TPMID_FR)
	print("TPMID_RL"..TPMID_RL)
	print("TPMID_RR"..TPMID_RR)

	TPMID_FL = LibGeneral.str2hex(TPMID_FL)
	TPMID_FR = LibGeneral.str2hex(TPMID_FR)
	TPMID_RL = LibGeneral.str2hex(TPMID_RL)
	TPMID_RR = LibGeneral.str2hex(TPMID_RR)

	sData_FL = "\xF1\xA4"..TPMID_FL
	sData_FR = "\xF1\xA5"..TPMID_FR
	sData_RL = "\xF1\xA6"..TPMID_RL
	sData_RR = "\xF1\xA7"..TPMID_RR
else
	engine.LastError = 1
end
engine.SockClose(bluehandle)

</Script></Activity>
<Activity id="6" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="450" top="284" right="550" bottom="316"/>
<Line1Text Enable="1" Text="PEPS写入胎压ID"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="写左前ID">
<Rect left="450" top="474" right="550" bottom="506"/>
<Line1Text Enable="1" Text="写入左前胎压ID"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2E"/>
<Parameter id="resTitle" value="0x6E"/>
<Parameter id="sendTel" value="sData_FL"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="17" name="DEP1837" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="写右前ID">
<Rect left="450" top="544" right="550" bottom="576"/>
<Line1Text Enable="1" Text="写入右前胎压ID"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2E"/>
<Parameter id="resTitle" value="0x6E"/>
<Parameter id="sendTel" value="sData_FR"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP1838" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="13" flags="0" name="写左后ID">
<Rect left="450" top="614" right="550" bottom="646"/>
<Line1Text Enable="1" Text="写入左后胎压ID"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2E"/>
<Parameter id="resTitle" value="0x6E"/>
<Parameter id="sendTel" value="sData_RL"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP1839" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="写右后ID">
<Rect left="450" top="684" right="550" bottom="716"/>
<Line1Text Enable="1" Text="写入右后胎压ID"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2E"/>
<Parameter id="resTitle" value="0x6E"/>
<Parameter id="sendTel" value="sData_RR"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP1840" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="打开扩展会话">
<Rect left="450" top="344" right="550" bottom="376"/>
<Line1Text Enable="1" Text="扩展会话"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="15" name="DEP1229" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="安全访问">
<Rect left="450" top="404" right="550" bottom="436"/>
<Line1Text Enable="1" Text="安全访问"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP1444" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="450" top="1034" right="550" bottom="1066"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="通讯失败">
<Rect left="680" top="344" right="780" bottom="376"/>
<Line1Text Enable="1" Text="PEPS控制器连接失败！"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="216" ActivityType="3" flags="0" name="成功">
<Rect left="450" top="744" right="550" bottom="776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写入胎压传感器ID 成功 ！"/>
<Line3Text Enable="1" Text="稍后进行比对ID"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(2000)</Script></Activity>
<Activity id="217" ActivityType="3" flags="0" name="重新连接VT56S">
<Rect left="640" top="154" right="740" bottom="186"/>
<Line1Text Enable="1" Text="尝试再次连接VT56S？"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="1114" right="866" bottom="1146"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="154" right="866" bottom="186"/>
</Activity>
<Activity id="220" ActivityType="3" flags="0" name="未检测胎压">
<Rect left="150" top="74" right="250" bottom="106"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.LastError = 1
engine.StatValue = "未检测胎压";</Script><assessment no="53" name="DEP2504" type="8" flags="97"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="是否检测胎压">
<Rect left="450" top="4" right="550" bottom="36"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="是否检测胎压？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="222" ActivityType="3" flags="0" name="普通节点">
<Rect left="800" top="4" right="900" bottom="36"/>
<Script>engine.println("操作者选择不检测胎压");
engine.StatValue = "操作者选择不检测胎压";</Script><assessment no="52" name="DEP2500" type="8" flags="97"/>
</Activity>
<Activity id="224" ActivityType="3" flags="0" name="手动选择胎压设备">
<Rect left="150" top="154" right="250" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确定选择"/>
<Script>engine.ListClear();
engine.SelectLayout(1);

engine.ListAddString("机能线胎压设备",false);
engine.ListAddString("返修区胎压设备",false);

#INPUT  TPMS_Device_Number
engine.println("手动选择胎压设备:"..TPMS_Device_Number);
engine.SelectLayout(0);

if(TPMS_Device_Number == "机能线胎压设备")then
	rHost = "BTC:" .. "00:06:66:6d:2f:9e";
else
	rHost = "BTC:" .. "00:06:66:6e:d0:d9";
end

</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="选择胎压设备方式">
<Rect left="290" top="74" right="390" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动选择胎压设备"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃检测"/>
<ButtonRText Enable="1" Text="手动选择"/>
<Script>if(bluehandle ~= nil)then
engine.SockClose(bluehandle)
end

#PRESSBUTTON</Script></Activity>
<Activity id="226" ActivityType="3" flags="0" name="自动选择胎压设备">
<Rect left="450" top="74" right="550" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动选择胎压设备中..."/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("自动选择胎压设备");
local rHos
if (engine.WorkPlace == "FUN") then
	rHost = "BTC:" .. "00:06:66:6d:2f:9e"
else
	rHost = "BTC:" .. "00:06:66:6e:d0:d9"
end       
print("&lt;bluetooth&gt; :" .. tostring(rHost))
</Script></Activity>
<Activity id="228" ActivityType="3" flags="0" name="VT56S建立连接">
<Rect left="450" top="154" right="550" bottom="186"/>
<Strategy TotalTime="2" NokTime="0" RetryTimeOut="2"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>if(bluehandle ~= nil)then
engine.SockClose(bluehandle)
end

	engine.LastError = -1
	engine.SetLineText(1,"连接VT56S胎压手持设备...")
	bluehandle = engine.SockOpen(rHost,"",-1)
	engine.Delay(300)	
if(engine.LastError == 0) then	
	engine.SetLineText(1,"成功连接到胎压手持仪!")
	engine.SetLineText(2,"请开始扫描...")
	engine.Delay(1000)
else
	engine.SetLineText(2,"连接失败")
        engine.SetLineText(3,"正在重新自动连接中...")		
        engine.Delay(1000)
        engine.LastError = 1;
end        
</Script></Activity>
<Activity id="229" ActivityType="3" flags="0" name="左前胎压ID">
<Rect left="590" top="474" right="690" bottom="506"/>
<Script>--TPMID_FL = LibGeneral.hex2str(TPMID_FL)
engine.StatValue = "写入的左前胎压ID："..tostring(TPMID_FL1)</Script><assessment no="17" name="DEP1837" type="8" flags="97"/>
</Activity>
<Activity id="230" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="1034" right="746" bottom="1066"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="右前胎压ID">
<Rect left="590" top="544" right="690" bottom="576"/>
<Script>--TPMID_FR = LibGeneral.hex2str(TPMID_FR)
engine.StatValue = "写入的右前胎压ID："..tostring(TPMID_FR1)</Script><assessment no="18" name="DEP1838" type="8" flags="97"/>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="左后胎压ID">
<Rect left="590" top="614" right="690" bottom="646"/>
<Script>--TPMID_RL = LibGeneral.hex2str(TPMID_RL)
engine.StatValue = "写入的左后胎压ID："..tostring(TPMID_RL1)</Script><assessment no="19" name="DEP1839" type="8" flags="97"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="右后胎压ID">
<Rect left="590" top="684" right="690" bottom="716"/>
<Script>--TPMID_RR = LibGeneral.hex2str(TPMID_RR)
engine.StatValue = "写入的左前胎压ID："..tostring(TPMID_RR1)</Script><assessment no="20" name="DEP1840" type="8" flags="97"/>
</Activity>
<Activity id="235" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="474" right="386" bottom="506"/>
</Activity>
<Activity id="236" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="544" right="386" bottom="576"/>
</Activity>
<Activity id="237" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="614" right="386" bottom="646"/>
</Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="684" right="386" bottom="716"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="比对左前胎压ID">
<Rect left="450" top="814" right="550" bottom="846"/>
<Line2Text Enable="1" Text="比对左前胎压ID"/>
<Line3Text Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0xA4

        if(@0==0x62)then
	    if(TPMID_FL1~="" or TPMID_FL1~= nil)then
		   DString1 = engine.GetResponseString(3,2+#TPMID_FL1)
                   DString1 =  LibGeneral.hex2str(DString1)
                   DString1 = tostring(DString1)
		   engine.SetLineText(3,DString1);
		   engine.println("读取的胎压ID:"..DString1)
			  if(TPMID_FL1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对左前胎压ID成功"..DString1.."  "..TPMID_FL1);
				else
				 engine.LastError = 1;
				 engine.println("比对左前胎压ID失败"..DString1.."  "..TPMID_FL1);
			  end
		else
                        engine.LastError = 1;
			engine.println("未比对左前胎压ID");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=TPMID_FL1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.Delay(50)</Script><assessment no="57" name="DEP2521" type="8" flags="97"/>
</Activity>
<Activity id="240" ActivityType="3" flags="0" name="普通节点">
<Rect left="320" top="1034" right="420" bottom="1066"/>
<Line2Text Enable="1" Text="!!!写入胎压ID失败!!!"/>
<Script>engine.Delay(2000)</Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="比对右前胎压ID">
<Rect left="450" top="864" right="550" bottom="896"/>
<Line2Text Enable="1" Text="比对右前胎压ID"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0xA5

        if(@0==0x62)then
	    if(TPMID_FR1~="" or TPMID_FR1 ~= nil)then
		   DString1 = engine.GetResponseString(3,2+#TPMID_FR1)
                   DString1 =  LibGeneral.hex2str(DString1)
                   DString1 = tostring(DString1)
		   engine.SetLineText(3,DString1);
		   engine.println("读取的胎压ID:"..DString1)
			  if(TPMID_FR1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对右前胎压ID成功"..DString1.."  "..TPMID_FR1);
				else
				 engine.LastError = 1;
				 engine.println("比对右前胎压ID失败"..DString1.."  "..TPMID_FR1);
			  end
		else
                        engine.LastError = 1;
			engine.println("未比对右前胎压ID");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=TPMID_FR1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.Delay(50)</Script><assessment no="58" name="DEP2522" type="8" flags="97"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="比对左后胎压ID">
<Rect left="450" top="914" right="550" bottom="946"/>
<Line2Text Enable="1" Text="比对左后胎压ID"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0xA6

        if(@0==0x62)then
	    if(TPMID_RL1~="" or TPMID_RL1 ~= nil)then
		   DString1 = engine.GetResponseString(3,2+#TPMID_RL1)
                   DString1 =  LibGeneral.hex2str(DString1)
                   DString1 = tostring(DString1)
		   engine.SetLineText(3,DString1);
		   engine.println("读取的胎压ID:"..DString1)
			  if(TPMID_RL1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对左后胎压ID成功"..DString1.."  "..TPMID_RL1);
				else
				 engine.LastError = 1;
				 engine.println("比对左后胎压ID失败"..DString1.."  "..TPMID_RL1);
			  end
		else
                        engine.LastError = 1;
			engine.println("未比对左后胎压ID");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=TPMID_RL1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.Delay(50)</Script><assessment no="59" name="DEP2523" type="8" flags="97"/>
</Activity>
<Activity id="243" ActivityType="3" flags="0" name="比对右后胎压ID">
<Rect left="450" top="964" right="550" bottom="996"/>
<Line2Text Enable="1" Text="比对右后胎压ID"/>
<Script>
#COMMEX vciHandle -1 0x22 0xF1 0xA7

        if(@0==0x62)then
	    if(TPMID_RR1~="" or TPMID_RR1 ~= nil)then
		   DString1 = engine.GetResponseString(3,2+#TPMID_RR1)
                   DString1 =  LibGeneral.hex2str(DString1)
                   DString1 = tostring(DString1)
		   engine.SetLineText(3,DString1);
		   engine.println("读取的胎压ID:"..DString1)
			  if(TPMID_RR1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对右后胎压ID成功"..DString1.."  "..TPMID_RR1);
				else
				 engine.LastError = 1;
				 engine.println("比对右后胎压ID失败"..DString1.."  "..TPMID_RR1);
			  end
		else
                        engine.LastError = 1;
			engine.println("未比对右后胎压ID");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=TPMID_RR1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
engine.Delay(50)</Script><assessment no="61" name="DEP2524" type="8" flags="97"/>
</Activity>
<Activity id="244" ActivityType="3" flags="1" name="胎压ID比对">
<Rect left="640" top="224" right="740" bottom="256"/>
<Line2Text Enable="1" Text="传入的胎压传感器ID格式不对"/>
<Line3Text Enable="1" Text="!!!请重新扫胎压!!!"/>
<Script>TPMID_FL2 = string.sub(TPMID_FL1,1,4)
TPMID_FR2 =  string.sub(TPMID_FR1,1,4)
TPMID_RL2 =  string.sub(TPMID_RL1,1,4)
TPMID_RR2 = string.sub(TPMID_RR1,1,4)
engine.println("***TPMID_FL2 ="..TPMID_FL2)
engine.println("***TPMID_FR2 ="..TPMID_FR2)
engine.println("***TPMID_RL2 ="..TPMID_RL2)
engine.println("***TPMID_RR2 ="..TPMID_RR2)
 --if(TPMID_FL1 ~= "00000000" and TPMID_FR1 ~= "00000000" and TPMID_RL1 ~= "00000000" and TPMID_RR1 ~= "00000000")then
 --     engine.LastError = 0
  if(TPMID_FL2 ~= "0209" and TPMID_FR2 ~= "0209" and TPMID_RL2 ~= "0209" and TPMID_RR2 ~= "0209")then
     engine.LastError = 0
  else
      	 engine.SetLineText(1,"传入的胎压传感器ID格式不对");
         engine.SetLineText(2,"!!!请重新扫胎压!!!");
       engine.LastError = 1
     
 end</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="221" type="0">
</Transition>
<Transition StartId="4" EndId="244" type="3">
</Transition>
<Transition StartId="4" EndId="217" type="0">
</Transition>
<Transition StartId="6" EndId="11" type="0">
</Transition>
<Transition StartId="7" EndId="229" type="3">
</Transition>
<Transition StartId="7" EndId="235" type="4">
</Transition>
<Transition StartId="8" EndId="231" type="3">
</Transition>
<Transition StartId="8" EndId="236" type="4">
</Transition>
<Transition StartId="9" EndId="232" type="3">
</Transition>
<Transition StartId="9" EndId="237" type="4">
</Transition>
<Transition StartId="10" EndId="233" type="3">
</Transition>
<Transition StartId="10" EndId="238" type="4">
</Transition>
<Transition StartId="11" EndId="12" type="3">
</Transition>
<Transition StartId="11" EndId="15" type="0">
</Transition>
<Transition StartId="12" EndId="7" type="3">
</Transition>
<Transition StartId="13" EndId="2" type="0">
</Transition>
<Transition StartId="15" EndId="230" type="0">
</Transition>
<Transition StartId="216" EndId="239" type="0">
</Transition>
<Transition StartId="217" EndId="228" type="0">
</Transition>
<Transition StartId="217" EndId="222" type="5">
</Transition>
<Transition StartId="218" EndId="2" type="0">
</Transition>
<Transition StartId="219" EndId="218" type="0">
</Transition>
<Transition StartId="221" EndId="226" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="5">
</Transition>
<Transition StartId="222" EndId="219" type="0">
</Transition>
<Transition StartId="224" EndId="228" type="0">
</Transition>
<Transition StartId="225" EndId="224" type="6">
</Transition>
<Transition StartId="225" EndId="220" type="0">
</Transition>
<Transition StartId="226" EndId="228" type="0">
</Transition>
<Transition StartId="228" EndId="225" type="4">
</Transition>
<Transition StartId="228" EndId="4" type="0">
</Transition>
<Transition StartId="229" EndId="8" type="0">
</Transition>
<Transition StartId="230" EndId="13" type="0">
</Transition>
<Transition StartId="231" EndId="9" type="0">
</Transition>
<Transition StartId="232" EndId="10" type="0">
</Transition>
<Transition StartId="233" EndId="216" type="0">
</Transition>
<Transition StartId="235" EndId="236" type="0">
</Transition>
<Transition StartId="236" EndId="237" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="240" type="0">
</Transition>
<Transition StartId="239" EndId="241" type="0">
</Transition>
<Transition StartId="240" EndId="13" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="13" type="0">
</Transition>
<Transition StartId="244" EndId="6" type="0">
</Transition>
<Transition StartId="244" EndId="217" type="1">
<Expression>engine.LastError == 1</Expression></Transition>
</Transitions>
</Process>

