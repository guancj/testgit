<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1024" pbltext="DEP1258">
<Parameters>
<Variable id="peps_key_all" type="8" dir="0" data="peps_key_all" description="From peps outcode  &quot;peps_key_all&quot;"/>
<Variable id="compare_sucess_flag" type="11" dir="1" data="" description="if peps value = read value"/>
<Variable id="EMS_read_all" type="8" dir="1" data="EMS_read_all"/>
<Variable id="CommErr" type="3" dir="1" data="0"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="120" top="22" right="220" bottom="54"/>
<Script>engine.println("into ems");</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="122" top="756" right="222" bottom="788"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="119" top="200" right="219" bottom="232"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(3000)</Script><assessment no="2" name="DEP1259" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="119" top="253" right="219" bottom="285"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1254" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="发送key">
<Rect left="120" top="361" right="220" bottom="393"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP1255" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="计算">
<Rect left="120" top="308" right="220" bottom="340"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x7D8AAC7D"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="延时">
<Rect left="120" top="421" right="220" bottom="453"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="120" top="83" right="220" bottom="115"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="写SK信息">
<Rect top="424" right="100" bottom="456"/>
<Script>--#COMM 0x2E 0XF1 0XA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6
peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);

--#COMM 0x2E 0XF1 0XA3 string.char(peps_key_all)
#COMM 0x2E 0XF1 0XA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1256" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="写SK 信息">
<Rect left="120" top="484" right="220" bottom="516"/>
<Script>peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);
#COMM 0x2E 0xF1 0xA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6
--#COMM 0x2E 0XF1 0XA3 string.char(peps_key_all)
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1256" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="延时">
<Rect left="1" top="484" right="101" bottom="516"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="延时">
<Rect left="120" top="542" right="220" bottom="574"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="读随机数">
<Rect left="121" top="650" right="221" bottom="682"/>
<Script>#COMM 0x22 0xF1 0xA3
if(@0 == 0x62)then
	read_value1 = @3
	read_value2 = @4
	read_value3 = @5 
	read_value4 = @6
	read_value5 = @7
	read_value6 = @8 
	EMS_read_all =hexstr(@3-@8);
	engine.println("EMS_read_all"..EMS_read_all);

	engine.LastError = 0;
	engine.StatValue=EMS_read_all;
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="6" name="DEP1257" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="字节比对">
<Rect left="121" top="699" right="221" bottom="731"/>
<Script>if(EMS_read_all == peps_key_all) then
  compare_sucess_flag = true;
  
else
  compare_sucess_flag =false;
end</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读随机数">
<Rect left="2" top="539" right="102" bottom="571"/>
<Script>#COMM 0x22 0xF1 0xA3
if(@0 == 0x62)then
	read_value1 = @3
	read_value2 = @4
	read_value3 = @5 
	read_value4 = @6
	read_value5 = @7
	read_value6 = @8 
	EMS_read_all =hexstr(@3-@8);
	engine.println("EMS_read_all"..EMS_read_all);

	engine.LastError = 0;
	engine.StatValue=EMS_read_all;
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="6" name="DEP1257" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="通讯">
<Rect left="119" top="141" right="219" bottom="173"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0
if(@0 == 0x62)then
     CommErr=0;
     engine.LastError = 0;
else
     CommErr=1;
     engine.LastError = 1;
     engine.TestResult = 1;
end
engine.println("CommErr:"..CommErr);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP1253" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="通讯失败">
<Rect left="248" top="140" right="348" bottom="172"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="结束通讯">
<Rect left="248" top="82" right="348" bottom="114"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="22" ActivityType="4" flags="0" name="路由节点">
<Rect left="281" top="757" right="313" bottom="789"/>
</Activity>
<Activity id="23" ActivityType="4" flags="0" name="路由节点">
<Rect left="154" top="594" right="186" bottom="626"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="生成EMS_read_all">
<Rect left="237" top="653" right="337" bottom="685"/>
<Script>engine.println("四驱及蓝图车型写完肯定响应即可，不能读SK，与传入的peps_key_all相同");
EMS_read_all = peps_key_all;

engine.LastError = 0;
engine.StatValue=EMS_read_all;</Script><assessment no="6" name="DEP1257" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="372" right="66" bottom="404"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="10" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="9" type="0">
</Transition>
<Transition StartId="6" EndId="5" type="0">
</Transition>
<Transition StartId="9" EndId="12" type="0">
</Transition>
<Transition StartId="10" EndId="19" type="0">
</Transition>
<Transition StartId="11" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="17" type="0">
</Transition>
<Transition StartId="14" EndId="23" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="2" type="0">
</Transition>
<Transition StartId="17" EndId="2" type="0">
</Transition>
<Transition StartId="19" EndId="3" type="3">
</Transition>
<Transition StartId="19" EndId="20" type="4">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="20" EndId="22" type="5">
</Transition>
<Transition StartId="21" EndId="10" type="0">
</Transition>
<Transition StartId="22" EndId="2" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="23" EndId="15" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1FM12" and DString_C131_Car_Tpye ~= "CH1FM13" and DString_C131_Car_Tpye ~= "CH1DM11" and DString_C131_Car_Tpye ~= "CH1DM13" and DString_C131_Car_Tpye ~= "CH1DM14" and DString_C131_Car_Tpye ~= "CH1DM15" and DString_C131_Car_Tpye ~= "CH1FM20" and DString_C131_Car_Tpye ~= "CH1FM30" and DString_C131_Car_Tpye ~= "CH1DM16" and DString_C131_Car_Tpye ~= "CH1DM17"</Expression></Transition>
<Transition StartId="24" EndId="16" type="0">
</Transition>
<Transition StartId="25" EndId="11" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1DM11")or(DString_C131_Car_Tpye == "CH1DM13")</Expression></Transition>
</Transitions>
</Process>

