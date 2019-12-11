<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1025" pbltext="DEP2108">
<Parameters>
<Variable id="S1" type="3" dir="0" data="&quot;&quot;"/>
<Variable id="S2" type="3" dir="0" data="&quot;&quot;"/>
<Variable id="S3" type="3" dir="0" data="&quot;&quot;"/>
<Variable id="peps_key_all" type="8" dir="0" data="&quot;&quot;"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="390" top="34" right="490" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="TBOX"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="390" top="624" right="490" bottom="656"/>
<Script>#STOPCOMM</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="390" top="214" right="490" bottom="246"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP1188" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="390" top="274" right="490" bottom="306"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP1203" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="发送key">
<Rect left="390" top="384" right="490" bottom="416"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP1204" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="计算">
<Rect left="390" top="324" right="490" bottom="356"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA7DB79EC"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="延时">
<Rect left="390" top="444" right="490" bottom="476"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="390" top="94" right="490" bottom="126"/>
<Line1Text Enable="1" Text="连接TBOX"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="1" name="写SKSC 信息">
<Rect left="390" top="504" right="490" bottom="536"/>
<Script>peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);
#COMM 0x31 0x01 0xE7 0x60 S1 S2 S3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6 
recvTel = @4;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP2110" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="通讯">
<Rect left="390" top="154" right="490" bottom="186"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP1187" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="TBOX匹配成功">
<Rect left="390" top="564" right="490" bottom="596"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="TBOX防盗匹配成功"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(1000)
engine.StatValue("TBOX防盗匹配成功");</Script><assessment no="17" name="DEP2464" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="TBOX匹配失败">
<Rect left="530" top="564" right="630" bottom="596"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="TBOX防盗匹配失败"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(1000)
engine.StatValue("TBOX防盗匹配失败");</Script><assessment no="18" name="DEP2465" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="通讯失败">
<Rect left="200" top="154" right="300" bottom="186"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#STOPCOMM
#PRESSBUTTON</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="结束通讯">
<Rect left="200" top="94" right="300" bottom="126"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="234" top="624" right="266" bottom="656"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="10" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="7" type="0">
</Transition>
<Transition StartId="6" EndId="5" type="0">
</Transition>
<Transition StartId="7" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="13" type="0">
</Transition>
<Transition StartId="11" EndId="14" type="1">
<Expression>recvTel==0x00 or recvTel==0x01</Expression></Transition>
<Transition StartId="11" EndId="15" type="0">
</Transition>
<Transition StartId="13" EndId="3" type="3">
</Transition>
<Transition StartId="13" EndId="16" type="4">
</Transition>
<Transition StartId="14" EndId="2" type="0">
</Transition>
<Transition StartId="15" EndId="2" type="0">
</Transition>
<Transition StartId="16" EndId="65" type="0">
</Transition>
<Transition StartId="16" EndId="66" type="5">
</Transition>
<Transition StartId="65" EndId="10" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

