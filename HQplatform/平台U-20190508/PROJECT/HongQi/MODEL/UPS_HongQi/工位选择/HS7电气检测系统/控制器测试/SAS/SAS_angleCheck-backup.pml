<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3008" pbltext="DEP79">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="360" top="44" right="460" bottom="76"/>
<Script></Script><TitleText Enable="1" Text="转角传感器 (SAS)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="710" top="534" right="810" bottom="566"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="360" top="104" right="460" bottom="136"/>
<Line1Text Enable="1" Text="连接ECU"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="6" ActivityType="13" flags="0" name="扩展会话">
<Rect left="360" top="174" right="460" bottom="206"/>
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
<assessment no="1" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="1" name="方向盘速度正检查">
<Rect left="360" top="314" right="460" bottom="346"/>
<Strategy TotalTime="200" ExpectedTime="3" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x02")

recvTel = recvTel:sub(4,5);
resolution = 0.04375;
Normal = recvTel:byte(1) * 256 + recvTel:byte(2);

if (Normal &gt; 32768) then
	angleValue = (32768 - Normal) * 0.04375;
else
	angleValue = Normal * 0.04375;
end    

engine.SetLineText(2,"#L=角速度".."#R=bmpok");
print("角速度:"..angleValue);
if (angleValue &gt; 0 ) then
	engine.LastError = 0;
	print(" check the wheel speed value is ok");
else
	engine.LastError = 1;
        print("check the wheel speed NOK  @Dpin");
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="21" name="DEP456" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="方向盘角度增加">
<Rect left="360" top="384" right="460" bottom="416"/>
<Strategy TotalTime="200" ExpectedTime="3" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x01")

local comVal = recvTel:sub(4,4)
comVal = string.byte(comVal);
engine.SetLineText(3,"#L=方向盘角度".."#R=bmpok");
print("方向盘角度:"..comVal);
if (comVal &gt; 0) then
	engine.LastError = 0;
else	
	engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="22" name="DEP2204" type="8" flags="105"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="将方向盘向右转">
<Rect left="540" top="234" right="640" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="将方向盘向右转"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="方向盘速度反检查">
<Rect left="540" top="314" right="640" bottom="346"/>
<Strategy TotalTime="200" ExpectedTime="3" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x02")

recvTel = recvTel:sub(4,5);
resolution = 0.04375;
Normal = recvTel:byte(1) * 256 + recvTel:byte(2);

if (Normal &gt; 32768) then
	angleValue = (32768 - Normal) * 0.04375;
else
	angleValue = Normal * 0.04375;
end    

engine.SetLineText(2,"#L=角速度".."#R=bmpok");
print("角速度:"..angleValue);
if (angleValue &lt; 0 ) then
	engine.LastError = 0;
	print(" check the wheel speed value is ok");
else
	engine.LastError = 1;
        print("check the wheel speed NOK  @Dpin");
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="23" name="DEP458" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="方向盘角度减少">
<Rect left="540" top="384" right="640" bottom="416"/>
<Strategy TotalTime="200" ExpectedTime="3" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x01")

local comVal = recvTel:sub(4,4)
comVal = string.byte(comVal);
engine.SetLineText(3,"#L=方向盘角度".."#R=bmpok");
print("方向盘角度:"..comVal);
if (comVal &gt; 0) then
	engine.LastError = 0;
else	
	engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="24" name="DEP2205" type="8" flags="105"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="方向盘角度状态">
<Rect left="710" top="314" right="810" bottom="346"/>
<Strategy TotalTime="200" ExpectedTime="3" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Script>local recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\xD1\x03")

local comVal = recvTel:sub(4,4)
comVal = string.byte(comVal);
print("读取方向盘回正状态:"..comVal);
if (comVal == 0) then
	engine.LastError = 0;
else	
	engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP1427" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="将方向盘向左转">
<Rect left="360" top="234" right="460" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="将方向盘向左转"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="254" top="484" right="286" bottom="516"/>
</Activity>
<Activity id="21" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="710" top="484" right="810" bottom="516"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="通讯失败">
<Rect left="220" top="174" right="320" bottom="206"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="183" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="220" top="104" right="320" bottom="136"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="将方向盘向右转">
<Rect left="710" top="234" right="810" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="将方向盘回正"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="17" type="0">
</Transition>
<Transition StartId="6" EndId="22" type="4">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="184" type="0">
</Transition>
<Transition StartId="15" EndId="21" type="0">
</Transition>
<Transition StartId="17" EndId="10" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="2" type="0">
</Transition>
<Transition StartId="22" EndId="183" type="0">
</Transition>
<Transition StartId="22" EndId="20" type="5">
</Transition>
<Transition StartId="183" EndId="3" type="0">
</Transition>
<Transition StartId="184" EndId="15" type="0">
</Transition>
</Transitions>
</Process>

