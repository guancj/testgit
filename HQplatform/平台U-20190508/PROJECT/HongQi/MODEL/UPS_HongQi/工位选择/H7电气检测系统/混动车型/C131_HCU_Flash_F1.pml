<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1061" pbltext="DEP1212">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="Stop_Flag" type="8" dir="0" data="Stop_Flag"/>
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
<Variable id="P3Max" type="3" data="5000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="277" right="377" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1266" top="606" right="1366" bottom="638"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="84" ActivityType="3" flags="0" name="混动控制系统（HCU）">
<Rect left="276" top="63" right="376" bottom="95"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="85" ActivityType="3" flags="0" name="刷写$34$36">
<Rect left="845" top="193" right="945" bottom="225"/>
<Line1Text Enable="1" Text="刷写中..."/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("开始刷写");
Deal_hex_file(".\\Flash\\Fls_drv.hex",0,4);   
--deal_hex_file(".\\CAL.HEX");   
--deal_hex_file(".\\CAL_test.HEX");      
--deal_hex_file(".\\BSW_test.hex");
--deal_hex_file(".\\BSW.hex",1)</Script></Activity>
<Activity id="86" ActivityType="3" flags="0" name="通讯">
<Rect left="275" top="246" right="375" bottom="278"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("点火开关1"..engine.VciStatus);

#COMMINIT
--#COMM 0x10 0x02
engine.println("点火开关2"..engine.VciStatus);</Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1266" top="544" right="1366" bottom="576"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("改动共享变量前，Stop_Flag="..engine.SharedVarGet(Stop_Flag));
engine.SharedVarSet(Stop_Flag,2);
engine.println("改动共享变量后，Stop_Flag="..engine.SharedVarGet(Stop_Flag));</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="会话03">
<Rect left="275" top="355" right="375" bottom="387"/>
<Line1Text Enable="1" Text="通讯中"/>
<Script>#COMM 0x10 0x03
if(@0 == 0x50)then
     engine.LastError = 0;
engine.SetLineText(2,"通讯成功");
#DELAY 500
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="497" top="470" right="597" bottom="502"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="96" ActivityType="13" flags="0" name="seedtokey">
<Rect left="496" top="528" right="596" bottom="560"/>
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
<Activity id="97" ActivityType="3" flags="0" name="发送key">
<Rect left="497" top="587" right="597" bottom="619"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="开始刷写？">
<Rect left="706" top="193" right="806" bottom="225"/>
<Line1Text Enable="1" Text="开始刷写？"/>
<Line2Text Enable="1" Text="#L=开始？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPNOK");
   engine.LastError = 1;
else
end</Script></Activity>
<Activity id="100" ActivityType="4" flags="0" name="路由节点">
<Rect left="739" top="545" right="771" bottom="577"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="$31一致性检测">
<Rect left="1266" top="422" right="1366" bottom="454"/>
<Line1Text Enable="1" Text="刷写结束"/>
<Line2Text Enable="1" Text="一致性检测"/>
<Line3Text Enable="1" Text="Pending"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x31 0x01 0xff 0x01</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="会话02">
<Rect left="496" top="411" right="596" bottom="443"/>
<Script>#COMM 0x10 0x02
</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="写指纹">
<Rect left="706" top="135" right="806" bottom="167"/>
<Line1Text Enable="1" Text="写指纹"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
--#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

--#COMM 0x2e 0xf1 0x98 testerNum
#COMM 0x2e 0xf1 0x98 hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 0x01 0x02 0x03 0x04 0x05 0x06 0x07


--engine.println("改动共享变量前，Stop_Flag="..engine.SharedVarGet(Stop_Flag));
--engine.SharedVarSet(Stop_Flag,2);
--engine.println("改动共享变量后，Stop_Flag="..engine.SharedVarGet(Stop_Flag));
</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="刷写$34$36">
<Rect left="981" top="192" right="1081" bottom="224"/>
<Line1Text Enable="1" Text="刷写中..."/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Deal_hex_file(".\\Flash\\CAL.hex",1,4);        </Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="刷写$34$36">
<Rect left="1119" top="191" right="1219" bottom="223"/>
<Line1Text Enable="1" Text="刷写中..."/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Deal_hex_file(".\\Flash\\BSW.HEX",1,4);      </Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="刷写$34$36">
<Rect left="1405" top="193" right="1505" bottom="225"/>
<Line1Text Enable="1" Text="刷写中..."/>
<Script>Deal_hex_file(".\\Flash\\ASW.HEX",1,4);        </Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="开始抢占进入BOOT？">
<Rect left="276" top="191" right="376" bottom="223"/>
<Line1Text Enable="1" Text="开始抢占进入BOOT？"/>
<Line2Text Enable="1" Text="#L=开始？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
--   engine.SetLineText(1,"#L=开始？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
--   engine.SetLineText(1,"#L=开始？#R=BMPNOK");
   engine.LastError = 1;
else
end
--#DELAY 500</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="高压下电">
<Rect left="495" top="134" right="595" bottom="166"/>
<Line1Text Enable="1" Text="高压下电"/>
<Script>#COMM 0x2F 0x02 0x0B 0x03 0x01</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="检测高压下电">
<Rect left="496" top="191" right="596" bottom="223"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="5"/>
<Line1Text Enable="1" Text="检测高压下电"/>
<Script>#COMM 0x22 0x01 0xAD
if (@3==0x0F) then
  engine.LastError = 0;
  engine.println(" HCU 高压下电成功engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.println(" HCU 高压正电失败engine.LastError=".. engine.LastError);
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="274" top="411" right="374" bottom="443"/>
<Line1Text Enable="1" Text="安全访问"/>
<Line2Text Enable="1"/>
<Script>#COMM 0x27 0x01
if(@0 == 0x67)then
     engine.LastError = 0;
--engine.SetLineText(2,"抢占成功");
#DELAY 500
else
     engine.LastError = 1;
end
s0=@2
s1=@3
s2=@4
s3=@5</Script></Activity>
<Activity id="114" ActivityType="13" flags="0" name="seedtokey">
<Rect left="275" top="469" right="375" bottom="501"/>
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
<Activity id="115" ActivityType="3" flags="0" name="发送key">
<Rect left="274" top="529" right="374" bottom="561"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="读指纹">
<Rect left="1265" top="485" right="1365" bottom="517"/>
<Line1Text Enable="1" Text="读指纹"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--testerNum = string.format("%10s",tostring(engine.VmtId));


#COMM 0x22 0xf1 0x98

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.println("StringRes");
--engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="fls刷写完成">
<Rect left="981" top="251" right="1081" bottom="283"/>
<Line1Text Enable="1" Text="fls刷写完成，继续？"/>
<Line2Text Enable="1" Text="#L=开始？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPNOK");
   engine.LastError = 1;
else
end
#DELAY 500</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="cal刷写完成">
<Rect left="1120" top="250" right="1220" bottom="282"/>
<Line1Text Enable="1" Text="cal刷写完成，继续？"/>
<Line2Text Enable="1" Text="#L=开始？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPNOK");
   engine.LastError = 1;
else
end
#DELAY 500</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="fls刷写完成">
<Rect left="1267" top="246" right="1367" bottom="278"/>
<Line1Text Enable="1" Text="bsw刷写完成，继续？"/>
<Line2Text Enable="1" Text="#L=开始？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=开始？#R=BMPNOK");
   engine.LastError = 1;
else
end
#DELAY 500</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="会话03">
<Rect left="495" top="249" right="595" bottom="281"/>
<Line1Text Enable="1" Text="扩展会话"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x10 0x03

</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="停止故障码记录">
<Rect left="494" top="301" right="594" bottom="333"/>
<Line1Text Enable="1" Text="停止故障码记录"/>
<Script>#COMM 0x85 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="停止通讯">
<Rect left="495" top="354" right="595" bottom="386"/>
<Line1Text Enable="1" Text="停止通讯"/>
<Script>#COMM 0x28 0x03 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="会话02">
<Rect left="274" top="306" right="374" bottom="338"/>
<Line1Text Enable="1" Text="通讯中"/>
<Script>#COMM 0x10 0x02
--#COMM 0x10 0x03
if(@0 == 0x50)then
     engine.LastError = 0;
--engine.SetLineText(2,"抢占成功");
#DELAY 500
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.println("改动共享变量前，Stop_Flag="..engine.SharedVarGet(Stop_Flag));
engine.SharedVarSet(Stop_Flag,1);
engine.println("改动共享变量后，Stop_Flag="..engine.SharedVarGet(Stop_Flag));</Script></Activity>
<Activity id="128" ActivityType="3" flags="0" name="刷写$34$36">
<Rect left="1267" top="190" right="1367" bottom="222"/>
<Line1Text Enable="1" Text="刷写中..."/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Deal_hex_file(".\\Flash\\FSM.hex",1,4);         </Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="确保下电">
<Rect left="276" top="128" right="376" bottom="160"/>
<Line1Text Enable="1" Text="请关闭HCU开关"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="普通节点">
<Rect left="819" top="241" right="919" bottom="273"/>
<Script></Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="普通节点">
<Rect left="706" top="397" right="806" bottom="429"/>
<Script>engine.println("异常退出");</Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="Hardware reset">
<Rect left="1071" top="485" right="1171" bottom="517"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 300
#COMM 0x11 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="STOPCOMM">
<Rect left="1072" top="535" right="1172" bottom="567"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="ECU 重置 3s">
<Rect left="1072" top="590" right="1172" bottom="622"/>
<Line1Text Enable="1" Text="ECU 重置"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="137" ActivityType="3" flags="0" name="COMMINIT">
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
<Variable id="P3Max" type="3" data="5000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Rect left="1075" top="637" right="1175" bottom="669"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
engine.println("重新连接HCU，读版本信息");</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="通讯">
<Rect left="1074" top="685" right="1174" bottom="717"/>
<Script>#COMM 0x22 0xf1 0x87
--#COMM 0x10 0x03
if(@0 == 0x62)then
--if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP1228" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="通讯失败">
<Rect left="957" top="686" right="1057" bottom="718"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！刷写失败"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="结束通讯">
<Rect left="958" top="636" right="1058" bottom="668"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="142" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1077" top="795" right="1177" bottom="827"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<Script>#COMM 0x22 0xF1 0x95
--StandValue="xxHPHEV0422C0201";
StandValue="xxHPHEV0438C0201";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18);
DString1=@3-@18;
engine.SetLineText(3,DString1);
engine.println("软件版本号:"..DString1);
--if("xxHPHEV041BC0201" == DString1)then
if(StandValue == DString1)then 
    engine.LastError = 0;
    engine.println("比软件版本号成功");
engine.SetLineText(1,"版本信息正确，刷写成功");
#DELAY 2000
else 
    engine.LastError = 1;
    engine.TestResult = 1;
    engine.println("比对软件版本号失败");
engine.SetLineText(1,"版本信息不正确，刷写失败");
#DELAY 2000
end
engine.StatValue=DString1;
engine.StatPoint=StandValue;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP864" type="8" flags="99"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="通讯失败">
<Rect left="155" top="304" right="255" bottom="336"/>
<Line1Text Enable="1" Text="通讯失败，请重试"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="188" top="683" right="220" bottom="715"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="结束通讯">
<Rect left="154" top="247" right="254" bottom="279"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="检测OBD">
<Rect left="153" top="101" right="253" bottom="133"/>
<Strategy TotalTime="86400" NokTime="0" RetryTimeOut="86400" DelayTime="1000"/>
<Line1Text Enable="1" Text="检测OBD"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
engine.println("蓝牙连接状态"..engine.VciStatus);
engine.SetLineText(2,engine.VciStatus);
engine.SetLineText(1,"未连接")
if (1 == bit32.band(engine.VciStatus,0x01))then
   engine.LastError=0;
   engine.SetLineText(1,"已连接！")
else
   engine.LastError=1;
   --engine.Speak("请连接蓝牙头")
   --engine.println("提示连接蓝牙头")
end</Script></Activity>
<Activity id="148" ActivityType="3" flags="0" name="清DTC">
<Rect left="1076" top="737" right="1176" bottom="769"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP860" type="8" flags="99"/>
</Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="1202" top="121" right="1234" bottom="153"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="84" type="0">
</Transition>
<Transition StartId="84" EndId="147" type="0">
</Transition>
<Transition StartId="85" EndId="106" type="0">
</Transition>
<Transition StartId="86" EndId="125" type="0">
</Transition>
<Transition StartId="88" EndId="2" type="0">
</Transition>
<Transition StartId="93" EndId="113" type="3">
</Transition>
<Transition StartId="93" EndId="144" type="4">
</Transition>
<Transition StartId="95" EndId="96" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="104" type="0">
</Transition>
<Transition StartId="99" EndId="85" type="3">
</Transition>
<Transition StartId="99" EndId="132" type="4">
</Transition>
<Transition StartId="100" EndId="88" type="0">
</Transition>
<Transition StartId="101" EndId="116" type="0">
</Transition>
<Transition StartId="103" EndId="95" type="0">
</Transition>
<Transition StartId="104" EndId="85" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="0">
</Transition>
<Transition StartId="107" EndId="128" type="0">
</Transition>
<Transition StartId="108" EndId="101" type="0">
</Transition>
<Transition StartId="110" EndId="86" type="0">
</Transition>
<Transition StartId="111" EndId="112" type="0">
</Transition>
<Transition StartId="112" EndId="122" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="111" type="0">
</Transition>
<Transition StartId="116" EndId="134" type="0">
</Transition>
<Transition StartId="117" EndId="106" type="0">
</Transition>
<Transition StartId="117" EndId="101" type="4">
</Transition>
<Transition StartId="119" EndId="107" type="0">
</Transition>
<Transition StartId="119" EndId="101" type="4">
</Transition>
<Transition StartId="120" EndId="128" type="0">
</Transition>
<Transition StartId="120" EndId="101" type="4">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="103" type="0">
</Transition>
<Transition StartId="125" EndId="93" type="0">
</Transition>
<Transition StartId="128" EndId="108" type="0">
</Transition>
<Transition StartId="129" EndId="110" type="0">
</Transition>
<Transition StartId="132" EndId="100" type="0">
</Transition>
<Transition StartId="134" EndId="135" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="137" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="139" type="4">
</Transition>
<Transition StartId="138" EndId="148" type="3">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="139" EndId="88" type="5">
</Transition>
<Transition StartId="140" EndId="137" type="0">
</Transition>
<Transition StartId="142" EndId="88" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="5">
</Transition>
<Transition StartId="144" EndId="146" type="0">
</Transition>
<Transition StartId="145" EndId="100" type="0">
</Transition>
<Transition StartId="146" EndId="84" type="0">
</Transition>
<Transition StartId="147" EndId="86" type="0">
</Transition>
<Transition StartId="148" EndId="142" type="0">
</Transition>
<Transition StartId="149" EndId="108" type="0">
</Transition>
</Transitions>
</Process>

