<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1024" pbltext="DEP1258">
<Parameters>
<Variable id="peps_key_all" type="8" dir="0" data=""/>
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
<Rect left="120" top="24" right="220" bottom="56"/>
<Script>engine.println("into ems");</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="120" top="604" right="220" bottom="636"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="119" top="200" right="219" bottom="232"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1259" type="8" flags="97"/>
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
<Parameter id="mask" value="0x2054F265"/>
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
<Activity id="12" ActivityType="3" flags="0" name="写SK 信息">
<Rect left="120" top="484" right="220" bottom="516"/>
<Script>peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);
#COMM 0x31 0x01 0xDC 0x47 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1256" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="通讯">
<Rect left="119" top="141" right="219" bottom="173"/>
<Script>local StringRes;
#COMM 0x22 0xf1 0x87
CommErr=0
if(@0 == 0x62)then
     CommErr=0;
     engine.LastError = 0;
     StringRes = engine.GetResponseString(0,engine.GetResponseSize());
     engine.StatValue=hexstr(StringRes);
else
     CommErr=1;
     engine.LastError = 1;
     engine.StatValue = "Communication not connection"
end
engine.println("CommErr:"..CommErr);

</Script><assessment no="1" name="DEP1253" type="8" flags="97"/>
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
<Rect left="284" top="604" right="316" bottom="636"/>
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
<Transition StartId="12" EndId="2" type="0">
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
</Transitions>
</Process>

