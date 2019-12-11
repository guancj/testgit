<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1501" pbltext="DEP12">
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
<Variable id="CAN_SND_ID" type="3" data="0x72A" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x730" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="34" right="460" bottom="66"/>
<Script></Script><Line1Text Enable="1" Text="LDW标定"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="360" top="604" right="460" bottom="636"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
end</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="安全访问">
<Rect left="360" top="204" right="460" bottom="236"/>
<Line2Text Enable="1" Text="安全访问"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,'\x01')

if (engine.LastError == 0) then
Intseed1 = string.byte(recvTel:sub(3,3))
Intseed2 = string.byte(recvTel:sub(4,4))
	if( ((Intseed1==0x00)and(Intseed2==0x00)) or ((Intseed1==0xff)and(Intseed2==0xff)) )then
		engine.LastError = -1
	 --end
	else
		 seed=bit32.lshift(Intseed1,8)+Intseed2;
		 
		 tmp_seed=bit32.band(seed*20077,0xffff);
		 tmp_seed=bit32.band(tmp_seed+12345,0xffff);
		 key=bit32.bxor(tmp_seed,0xA5A5);
		 
		key0=bit32.rshift(bit32.band(key,0xff00),8);
		key1=bit32.band(key,0x00ff);
		engine.println(string.format("%02x%02x",key0,key1));
                
                request = "\x02" .. string.char(key0)..string.char(key1)
		recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,request)
       end   
end</Script><assessment no="3" name="DEP1410" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="360" top="84" right="460" bottom="116"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP13" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="扩展会话">
<Rect left="360" top="144" right="460" bottom="176"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="2" name="DEP1409" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="0" name="2EF1A0">
<Rect left="360" top="254" right="460" bottom="286"/>
<Script>request = "f1a019280c1408f3000b0a0a1a1a14e5e5ec"
request = LibGeneral.str2hex(request)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="开始标定">
<Rect left="360" top="314" right="460" bottom="346"/>
<Line2Text Enable="1" Text="开始标定"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="&apos;\x01\xF0\x01&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="4" name="DEP1411" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="等待30s">
<Rect left="360" top="364" right="460" bottom="396"/>
<Script>timeStart = os.clock()

repeat
	engine.Delay(1000)
        currTime = os.clock()
        extime = math.floor(currTime - timeStart)
        extime = 30 - extime
        engine.SetLineText(2,"等待时间:"..extime)
        
 until (extime &lt;= 0)</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="读取标定结果">
<Rect left="360" top="424" right="460" bottom="456"/>
<Script>request = "\x03\xF0\x01"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)

statByte = recvTel:sub(5,5):byte()

if (statByte == 0x00) then
	engine.SetLineText(1,"LDW标定成功")
        engine.LastError = 0
        engine.Delay(500)
else
	engine.LastError = 1
end
engine.StatValue = "LDW标定结果:"..statByte</Script><assessment no="5" name="DEP1412" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="写时间">
<Rect left="360" top="484" right="460" bottom="516"/>
<Script>date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println("LDW编程时间:"..date);

request = string.char(tonumber(date:sub(1,2),16)) .. string.char(tonumber(date:sub(3,4),16)) .. string.char(tonumber(date:sub(5,6),16)) .. string.char(tonumber(date:sub(7,8),16))
request = "\xF1\x9D"..request
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,request)


</Script><assessment no="6" name="DEP1413" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="360" top="544" right="460" bottom="576"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="7" name="DEP1419" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="标定失败">
<Rect left="980" top="134" right="1080" bottom="166"/>
<Line1Text Enable="1" Text="LDW标定失败"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON

engine.ExecuteRpdPending();
</Script></Activity>
<Activity id="215" ActivityType="3" flags="0" name="标定失败">
<Rect left="600" top="484" right="700" bottom="516"/>
<Line2Text Enable="1" Text="LDW标定失败"/>
<Line4Text Enable="1" Text="重试标定？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="144" right="136" bottom="176"/>
</Activity>
<Activity id="217" ActivityType="4" flags="0" name="路由节点">
<Rect left="104" top="544" right="136" bottom="576"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="3">
</Transition>
<Transition StartId="3" EndId="216" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="3">
</Transition>
<Transition StartId="4" EndId="216" type="0">
</Transition>
<Transition StartId="5" EndId="3" type="3">
</Transition>
<Transition StartId="5" EndId="216" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="10" EndId="215" type="4">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="2" type="0">
</Transition>
<Transition StartId="215" EndId="5" type="6">
</Transition>
<Transition StartId="215" EndId="12" type="0">
</Transition>
<Transition StartId="216" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="13" type="0">
</Transition>
</Transitions>
</Process>

