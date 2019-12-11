<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="peps_key_all" type="8" dir="0" data="peps_key_all" description="From peps outcode  &quot;peps_key_all&quot;"/>
<Variable id="compare_sucess_flag" type="11" dir="1" data="" description="if peps value = read value"/>
<Variable id="HCU_read_all" type="8" dir="1" data=""/>
<Variable id="CommErr" type="3" dir="1" data="0"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="277" top="15" right="377" bottom="47"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="276" top="737" right="376" bottom="769"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="276" top="189" right="376" bottom="221"/>
<Script>#COMM 0x10 0x03
engine.println("into ems");</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="276" top="245" right="376" bottom="277"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="发送key">
<Rect left="275" top="363" right="375" bottom="395"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="延时">
<Rect left="275" top="425" right="375" bottom="457"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="连接ECU">
<Rect left="277" top="74" right="377" bottom="106"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="读写SK信息">
<Rect left="146" top="426" right="246" bottom="458"/>
<Script>--#COMM 0x2E 0XF1 0XA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6
peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);

#COMM 0x2E 0XF1 0XA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="读写SK 信息">
<Rect left="276" top="480" right="376" bottom="512"/>
<Script>peps_key_value1 = hex2dec(peps_key_all,1); 
peps_key_value2 = hex2dec(peps_key_all,3);
peps_key_value3 = hex2dec(peps_key_all,5);
peps_key_value4 = hex2dec(peps_key_all,7);
peps_key_value5 = hex2dec(peps_key_all,9);
peps_key_value6 = hex2dec(peps_key_all,11);
#COMM 0x2E 0XF1 0XA3 peps_key_value1 peps_key_value2 peps_key_value3 peps_key_value4 peps_key_value5 peps_key_value6
</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="延时">
<Rect left="146" top="480" right="246" bottom="512"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="延时">
<Rect left="276" top="536" right="376" bottom="568"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="读随机数">
<Rect left="276" top="591" right="376" bottom="623"/>
<Script>#COMM 0x22 0xF1 0xA3
read_value1 = @3
read_value2 = @4
read_value3 = @5 
read_value4 = @6
read_value5 = @7
read_value6 = @8 
HCU_read_all =hexstr(@3-@8);</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="字节比对">
<Rect left="275" top="656" right="375" bottom="688"/>
<Script>if(EMS_read_all == peps_key_all) then
  compare_sucess_flag = true;
  
else
  compare_sucess_flag =false;
end</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="读随机数">
<Rect left="147" top="541" right="247" bottom="573"/>
<Script>#COMM 0x22 0xF1 0xA3
read_value1 = @3
read_value2 = @4
read_value3 = @5 
read_value4 = @6
read_value5 = @7
read_value6 = @8 
HCU_read_all =hexstr(@3-@8);</Script></Activity>
<Activity id="18" ActivityType="13" flags="0" name="seedtokey">
<Rect left="275" top="303" right="375" bottom="335"/>
<FunctionRef id="Seedtokey">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="p_mask" value="0x4A68795B"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="通讯">
<Rect left="276" top="130" right="376" bottom="162"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     CommErr=0;
     engine.LastError = 0;
else
     CommErr=1;
     engine.LastError = 1;
end
engine.println("CommErr:"..CommErr);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="通讯失败">
<Rect left="412" top="131" right="512" bottom="163"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="结束通讯">
<Rect left="412" top="71" right="512" bottom="103"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="24" ActivityType="4" flags="0" name="路由节点">
<Rect left="446" top="736" right="478" bottom="768"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="10" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="18" type="0">
</Transition>
<Transition StartId="5" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1DM11")or(DString_C131_Car_Tpye == "CH1DM13")</Expression></Transition>
<Transition StartId="9" EndId="12" type="1">
<Expression>(DString_C131_Car_Tpye ~= "CH1DM11") and (DString_C131_Car_Tpye ~= "CH1DM13")</Expression></Transition>
<Transition StartId="10" EndId="20" type="0">
</Transition>
<Transition StartId="11" EndId="13" type="0">
</Transition>
<Transition StartId="12" EndId="14" type="0">
</Transition>
<Transition StartId="13" EndId="17" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="2" type="0">
</Transition>
<Transition StartId="17" EndId="2" type="0">
</Transition>
<Transition StartId="18" EndId="5" type="0">
</Transition>
<Transition StartId="20" EndId="3" type="3">
</Transition>
<Transition StartId="20" EndId="21" type="4">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="21" EndId="24" type="5">
</Transition>
<Transition StartId="22" EndId="10" type="0">
</Transition>
<Transition StartId="24" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

