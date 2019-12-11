<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1602" pbltext="DEP63">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="380" top="74" right="480" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="794" right="480" bottom="826"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end</Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="380" top="134" right="480" bottom="166"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="6" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="1275" ActivityType="13" flags="0" name="扩展会话">
<Rect left="380" top="194" right="480" bottom="226"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
<assessment no="7" name="DEP1082" type="8" flags="97"/>
</Activity>
<Activity id="1276" ActivityType="3" flags="0" name="安全算法">
<Rect left="380" top="254" right="480" bottom="286"/>
<Script>DVciResult = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,'\x01')

m0 = string.sub(DVciResult,3,3)
s0 = LibGeneral.binStr2Int(m0)

m1 = string.sub(DVciResult,4,4)
s1 = LibGeneral.binStr2Int(m1)

m2 = string.sub(DVciResult,5,5)
s2 = LibGeneral.binStr2Int(m2)

m3 = string.sub(DVciResult,6,6)
s3 = LibGeneral.binStr2Int(m3)

seed=bit32.lshift(s0,24)+bit32.lshift(s1,16)+bit32.lshift(s2,8)+s3;
key=bit32.bxor(bit32.lshift(bit32.bxor(bit32.rshift(seed,3),seed),4),seed);

key0=bit32.rshift(bit32.band(key,bit32.lshift(0xff,24)),24);
key1=bit32.rshift(bit32.band(key,bit32.lshift(0xff,16)),16);
key2=bit32.rshift(bit32.band(key,bit32.lshift(0xff,8)),8);
key3=bit32.rshift(bit32.band(key,bit32.lshift(0xff,0)),0);
engine.println(string.format("%02x%02x%02x%02x",key0,key1,key2,key3));
--return key0,key1,key2,key3;
ESP_Key = string.format("%02x%02x%02x%02x",key0,key1,key2,key3)
ESP_KeyHEX = LibGeneral.str2hex(ESP_Key)
ESP_Key_HEX = "\x02"..ESP_KeyHEX

DVciResult = LibGeneral.ECU_DataExchange(vciHandle,0x27,0x67,ESP_Key_HEX)</Script><assessment no="8" name="DEP1580" type="8" flags="97"/>
</Activity>
<Activity id="1277" ActivityType="13" flags="0" name="ABS报警灯闪烁一次">
<Rect left="380" top="364" right="480" bottom="396"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrABSligt_ON"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP2230" type="8" flags="97"/>
</Activity>
<Activity id="1278" ActivityType="3" flags="0" name="请求数据设置">
<Rect left="380" top="304" right="480" bottom="336"/>
<Script>reStrABSligt_ON = "01F00300000002000000000032FFFF000200000000"
reStrABSligt_ON = LibGeneral.str2hex(reStrABSligt_ON)
reStrABSligt_OFF = "01F003000000020000000000000000000000000000"
reStrABSligt_OFF = LibGeneral.str2hex(reStrABSligt_OFF)

reStrEBD_ON = "01F0030000000E000000000032FFFF000E00000000"
reStrEBD_ON = LibGeneral.str2hex(reStrEBD_ON)
reStrEBD_OFF = "01F0030000000E0000000000000000000000000000"
reStrEBD_OFF = LibGeneral.str2hex(reStrEBD_OFF)


reStrESP_ON = "01F00300000004000000000032FFFF000400000000"
reStrESP_ON = LibGeneral.str2hex(reStrESP_ON)
reStrESP_OFF = "01F003000000040000000000000000000000000000"
reStrESP_OFF = LibGeneral.str2hex(reStrESP_OFF)</Script></Activity>
<Activity id="1279" ActivityType="13" flags="0" name="关闭ABS报警灯">
<Rect left="380" top="424" right="480" bottom="456"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrABSligt_OFF"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="31" name="DEP2231" type="8" flags="97"/>
</Activity>
<Activity id="1280" ActivityType="13" flags="0" name="EBD报警灯闪烁一次">
<Rect left="380" top="494" right="480" bottom="526"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrEBD_ON"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP2232" type="8" flags="97"/>
</Activity>
<Activity id="1281" ActivityType="13" flags="0" name="关闭EBD报警灯">
<Rect left="380" top="554" right="480" bottom="586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrEBD_OFF"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="33" name="DEP2233" type="8" flags="97"/>
</Activity>
<Activity id="1282" ActivityType="13" flags="0" name="ESP报警灯闪烁一次">
<Rect left="380" top="614" right="480" bottom="646"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrEBD_ON"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="34" name="DEP2234" type="8" flags="97"/>
</Activity>
<Activity id="1283" ActivityType="13" flags="0" name="关闭ESP报警灯">
<Rect left="380" top="674" right="480" bottom="706"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x31"/>
<Parameter id="resTitle" value="0x71"/>
<Parameter id="sendTel" value="reStrEBD_OFF"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP2235" type="8" flags="97"/>
</Activity>
<Activity id="1284" ActivityType="13" flags="1" name="ECU_Close">
<Rect left="380" top="734" right="480" bottom="766"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1275" type="0">
</Transition>
<Transition StartId="1275" EndId="1276" type="0">
</Transition>
<Transition StartId="1276" EndId="1278" type="0">
</Transition>
<Transition StartId="1277" EndId="1279" type="0">
</Transition>
<Transition StartId="1278" EndId="1277" type="0">
</Transition>
<Transition StartId="1279" EndId="1280" type="0">
</Transition>
<Transition StartId="1280" EndId="1281" type="0">
</Transition>
<Transition StartId="1281" EndId="1282" type="0">
</Transition>
<Transition StartId="1282" EndId="1283" type="0">
</Transition>
<Transition StartId="1283" EndId="1284" type="0">
</Transition>
<Transition StartId="1284" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

