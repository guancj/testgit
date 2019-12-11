<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1051" pbltext="DEP1224">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="329" right="429" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="329" top="1630" right="429" bottom="1662"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="329" top="225" right="429" bottom="257"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="发动机检测 (EMS)">
<Rect left="330" top="172" right="430" bottom="204"/>
<Script></Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="762" top="368" right="862" bottom="400"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP146" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="13" flags="0" name="计算key">
<Rect left="762" top="418" right="862" bottom="450"/>
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
<Activity id="123" ActivityType="3" flags="0" name="发送key">
<Rect left="762" top="466" right="862" bottom="498"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP147" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="329" top="372" right="429" bottom="404"/>
<Line1Text Enable="1" Text="进入扩展会话"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP1098" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="329" top="1559" right="429" bottom="1591"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="通讯">
<Rect left="329" top="273" right="429" bottom="305"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="188" top="274" right="288" bottom="306"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="4" flags="0" name="路由节点">
<Rect left="92" top="1558" right="124" bottom="1590"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="结束通讯">
<Rect left="188" top="224" right="288" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="253" ActivityType="3" flags="0" name="发动机冷却液温度自动测试">
<Rect left="329" top="493" right="429" bottom="525"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机冷却液温度"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="254" ActivityType="3" flags="0" name="发动机冷却液温度">
<Rect left="329" top="550" right="429" bottom="582"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="20" DelayTime="500"/>
<Script>#COMM 0x22 0xdd 0x03
if(@0==0x62)then
resu = @3*1-40 ;
oilTmp=resu;
engine.println("发动机冷却液温度".. oilTmp);

if (oilTmp&gt;=60 and oilTmp&lt;=120) then
  engine.LastError = 0;
  engine.StatValue=oilTmp;
else
  engine.LastError = 1;
  engine.StatValue=oilTmp;
  engine.StatLower=60;
   engine.StatUpper=120;
end
engine.SetLineText(3,"#L=BMPBAR,".."60.0"..",".."120.0"..",".."1"..","..tostring(oilTmp).."#R=C");

else
engine.TestResult = 1;
engine.LastError = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP1062" type="8" flags="97"/>
</Activity>
<Activity id="255" ActivityType="3" flags="0" name="检测失败">
<Rect left="201" top="550" right="301" bottom="582"/>
<Line1Text Enable="1" Text="冷却液温度不满足退出"/>
<Script>engine.TestResult = 1;
#DELAY 2000
</Script></Activity>
<Activity id="257" ActivityType="3" flags="0" name="请挂P档">
<Rect left="331" top="114" right="431" bottom="146"/>
<Line1Text Enable="1" Text="请挂P档或N档"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=确定？#R=BMPNOK");
   engine.LastError = 1;
else
end</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="发动机摩擦力及分段自学习（EMS）">
<Rect left="330" top="57" right="430" bottom="89"/>
<TitleText Enable="1" Text="发动机摩擦力及分段自学习（EMS）"/>
<Line1Text Enable="1" Text="是否进行发动机摩擦力及分段自学习？"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="start and stay in idle">
<Rect left="330" top="734" right="430" bottom="766"/>
<Line1Text Enable="1" Text="第一次控制开启空转"/>
<Script>engine.SetRequestByte(0,0x2F)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,0x1C)
engine.SetRequestByte(3,0x03)
engine.SetRequestByte(4,0x01)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP1163" type="8" flags="97"/>
</Activity>
<Activity id="263" ActivityType="5" flags="0" name="C131_EMS_Friction_Segment_Adapation_HCU">
<Rect left="328" top="605" right="428" bottom="637"/>
<SubProcesses>
<SubProcess id="C131_EMS_Friction_Segment_Adapation_Comm_HCU">
<Parameters>
<Parameter id="vciHandl_hcu" value="vciHandl_hcu" ret="vciHandl_hcu"/>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="265" ActivityType="3" flags="0" name="读摩擦力自学习标志位">
<Rect left="327" top="780" right="427" bottom="812"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="35" DelayTime="3000"/>
<Line1Text Enable="1" Text="读摩擦力自学习标志位"/>
<Script>#COMM 0x22 0xFD 0x23
if(@0==0x62)then

engine.SetLineText(2,@3);
engine.println("摩擦力自学习标志位:"..@3);
if (@3==0x01) then
  engine.LastError = 0;
else
  --engine.LastError = 0;
  engine.LastError = 1;
  engine.TestResult = 1;
engine.println("读取摩擦力自学习标志位失败:"..@3);
end
    engine.StatValue=@3;
    engine.StatPoint=0x01;
else
      --engine.LastError = 0;
      engine.LastError = 1;
      engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="7" name="DEP1165" type="8" flags="97"/>
</Activity>
<Activity id="266" ActivityType="3" flags="0" name="等待1分钟">
<Rect left="326" top="959" right="426" bottom="991"/>
<Line1Text Enable="1" Text="摩擦力自学习成功"/>
<Line2Text Enable="1" Text="等待1分钟后退出学习"/>
<Script>--#DELAY 60000

for t=60,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script><assessment no="10" name="DEP1169" type="8" flags="97"/>
</Activity>
<Activity id="269" ActivityType="3" flags="0" name="start and stay in idle">
<Rect left="326" top="841" right="426" bottom="873"/>
<Line1Text Enable="1" Text="request engine start and stay in idle"/>
<Script>engine.SetRequestByte(0,0x2F)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,0x1C)
engine.SetRequestByte(3,0x03)
engine.SetRequestByte(4,0x01)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP1164" type="8" flags="97"/>
</Activity>
<Activity id="271" ActivityType="3" flags="0" name="读摩擦力自学习标志位">
<Rect left="325" top="900" right="425" bottom="932"/>
<Line1Text Enable="1" Text="读摩擦力自学习标志位"/>
<Script>#COMM 0x22 0xFD 0x23
if(@0==0x62)then

engine.SetLineText(2,@3);
engine.println("摩擦力自学习标志位:"..@3);
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 0;
  --engine.LastError = 1;
  engine.TestResult = 1;
engine.println("读取摩擦力自学习标志位失败:"..@3);
end
    engine.StatValue=@3;
    engine.StatPoint=0x01;
else
      engine.LastError = 0;
      --engine.LastError = 1;
      engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="7" name="DEP1165" type="8" flags="97"/>
</Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="445" top="875" right="477" bottom="907"/>
</Activity>
<Activity id="275" ActivityType="3" flags="0" name="stop">
<Rect left="326" top="1023" right="426" bottom="1055"/>
<Line1Text Enable="1" Text="stop the engine"/>
<Script>engine.SetRequestByte(0,0x2F)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,0x1C)
engine.SetRequestByte(3,0x00)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP1167" type="8" flags="97"/>
</Activity>
<Activity id="276" ActivityType="3" flags="0" name="失败">
<Rect left="204" top="900" right="304" bottom="932"/>
<Line1Text Enable="1" Text="摩擦力自学习失败"/>
<Script>#DELAY 1000</Script><assessment no="11" name="DEP1170" type="8" flags="97"/>
</Activity>
<Activity id="277" ActivityType="3" flags="0" name="发动机摩擦力">
<Rect left="330" top="434" right="430" bottom="466"/>
<TitleText Enable="1" Text="发动机摩擦力自学习（EMS）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="278" ActivityType="3" flags="0" name="发动机分段自学习">
<Rect left="327" top="1150" right="427" bottom="1182"/>
<TitleText Enable="1" Text="发动机分段自学习（EMS）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="279" ActivityType="3" flags="0" name="start and stay in idle">
<Rect left="328" top="1203" right="428" bottom="1235"/>
<Line1Text Enable="1" Text="request engine start and stay in idle"/>
<Script>engine.SetRequestByte(0,0x2F)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,0x1B)
engine.SetRequestByte(3,0x03)
engine.SetRequestByte(4,0x01)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="13" name="DEP1173" type="8" flags="97"/>
</Activity>
<Activity id="280" ActivityType="3" flags="0" name="读分段自学习标志位">
<Rect left="329" top="1317" right="429" bottom="1349"/>
<Line1Text Enable="1" Text="读分段自学习标志位"/>
<Script>#COMM 0x22 0xFD 0x24
if(@0==0x62)then

engine.SetLineText(2,@3);
engine.println("分段自学习标志位:"..@3);
if (@3==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
engine.println("读取分段自学习标志位失败:"..@3);
end
    engine.StatValue=@3;
    engine.StatPoint=0x01;

else
      engine.LastError = 1;
      engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="14" name="DEP1166" type="8" flags="97"/>
</Activity>
<Activity id="282" ActivityType="3" flags="0" name="等待10秒">
<Rect left="329" top="1263" right="429" bottom="1295"/>
<Script>--#DELAY 1000

for t=10,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="283" ActivityType="3" flags="0" name="stop">
<Rect left="328" top="1428" right="428" bottom="1460"/>
<Line1Text Enable="1" Text="stop the engine"/>
<Script>engine.SetRequestByte(0,0x2F)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,0x1B)
engine.SetRequestByte(3,0x00)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP1168" type="8" flags="97"/>
</Activity>
<Activity id="285" ActivityType="3" flags="0" name="成功">
<Rect left="329" top="1369" right="429" bottom="1401"/>
<Line1Text Enable="1" Text="分段学习成功"/>
<Script>#DELAY 1000

</Script><assessment no="15" name="DEP1171" type="8" flags="97"/>
</Activity>
<Activity id="286" ActivityType="3" flags="0" name="失败">
<Rect left="206" top="1317" right="306" bottom="1349"/>
<Line1Text Enable="1" Text="分段学习失败"/>
<Script>#DELAY 1000

</Script><assessment no="16" name="DEP1172" type="8" flags="97"/>
</Activity>
<Activity id="287" ActivityType="3" flags="0" name="HCU通讯失败">
<Rect left="201" top="604" right="301" bottom="636"/>
<Script>engine.println("HCU通讯失败CommErr="..CommErr);</Script></Activity>
<Activity id="288" ActivityType="3" flags="0" name="第一个自学习">
<Rect left="328" top="670" right="428" bottom="702"/>
<Script>engine.println("HCU通讯成功CommErr="..CommErr);
engine.println("第一个自学习开始");</Script></Activity>
<Activity id="289" ActivityType="3" flags="0" name="异常退出">
<Rect left="59" top="227" right="159" bottom="259"/>
<Line1Text Enable="1"/>
<Script></Script></Activity>
<Activity id="290" ActivityType="3" flags="0" name="第二个自学习">
<Rect left="326" top="1099" right="426" bottom="1131"/>
<Script>engine.println("第二个自学习开始");</Script></Activity>
<Activity id="292" ActivityType="3" flags="0" name="close HCU">
<Rect left="329" top="1493" right="429" bottom="1525"/>
<Line1Text Enable="1" Text="第一次控制开启空转"/>
<Script>engine.EcuClose(vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="293" ActivityType="3" flags="0" name="切诊断">
<Rect left="492" top="604" right="592" bottom="636"/>
<Script>--#COMM 0x10 0x03
engine.SetRequestByte(0,0x10)
engine.SetRequestByte(1,0x03)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP1024" type="8" flags="97"/>
</Activity>
<Activity id="294" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="491" top="654" right="591" bottom="686"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>--#COMM 0x27 0x01
engine.SetRequestByte(0,0x27)
engine.SetRequestByte(1,0x01)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="19" name="DEP1175" type="8" flags="97"/>
</Activity>
<Activity id="295" ActivityType="13" flags="0" name="seedtokey">
<Rect left="490" top="700" right="590" bottom="732"/>
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
<Activity id="296" ActivityType="3" flags="0" name="发送key">
<Rect left="497" top="755" right="597" bottom="787"/>
<Line1Text Enable="1"/>
<Script>--#COMM 0x27 0x02 key0 key1 key2 key3
engine.SetRequestByte(0,0x27)
engine.SetRequestByte(1,0x02)
engine.SetRequestByte(2,key0)
engine.SetRequestByte(3,key1)
engine.SetRequestByte(4,key2)
engine.SetRequestByte(5,key3)
engine.EcuComm(vciHandl_hcu,-1)
--engine.EcuComm(-1,vciHandl_hcu)
if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="20" name="DEP1176" type="8" flags="97"/>
</Activity>
<Activity id="297" ActivityType="3" flags="0" name="等待30秒">
<Rect left="199" top="754" right="299" bottom="786"/>
<Line1Text Enable="1" Text="等待30秒"/>
<Script>#DELAY 30000
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="258" type="0">
</Transition>
<Transition StartId="3" EndId="195" type="0">
</Transition>
<Transition StartId="4" EndId="3" type="0">
</Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="124" EndId="277" type="0">
</Transition>
<Transition StartId="132" EndId="2" type="0">
</Transition>
<Transition StartId="195" EndId="124" type="3">
</Transition>
<Transition StartId="195" EndId="196" type="4">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="196" EndId="289" type="5">
</Transition>
<Transition StartId="197" EndId="132" type="0">
</Transition>
<Transition StartId="198" EndId="3" type="0">
</Transition>
<Transition StartId="253" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="255" type="4">
</Transition>
<Transition StartId="254" EndId="263" type="3">
</Transition>
<Transition StartId="255" EndId="289" type="0">
</Transition>
<Transition StartId="257" EndId="4" type="0">
</Transition>
<Transition StartId="258" EndId="257" type="6">
</Transition>
<Transition StartId="258" EndId="289" type="0">
</Transition>
<Transition StartId="262" EndId="297" type="0">
</Transition>
<Transition StartId="263" EndId="293" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="263" EndId="287" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="265" EndId="274" type="3">
</Transition>
<Transition StartId="265" EndId="269" type="4">
</Transition>
<Transition StartId="266" EndId="275" type="0">
</Transition>
<Transition StartId="269" EndId="271" type="0">
</Transition>
<Transition StartId="271" EndId="266" type="3">
</Transition>
<Transition StartId="271" EndId="276" type="4">
</Transition>
<Transition StartId="274" EndId="266" type="0">
</Transition>
<Transition StartId="275" EndId="290" type="0">
</Transition>
<Transition StartId="276" EndId="275" type="0">
</Transition>
<Transition StartId="277" EndId="253" type="0">
</Transition>
<Transition StartId="278" EndId="279" type="0">
</Transition>
<Transition StartId="279" EndId="282" type="0">
</Transition>
<Transition StartId="280" EndId="285" type="3">
</Transition>
<Transition StartId="280" EndId="286" type="4">
</Transition>
<Transition StartId="282" EndId="280" type="0">
</Transition>
<Transition StartId="283" EndId="292" type="0">
</Transition>
<Transition StartId="285" EndId="283" type="0">
</Transition>
<Transition StartId="286" EndId="283" type="0">
</Transition>
<Transition StartId="287" EndId="289" type="0">
</Transition>
<Transition StartId="288" EndId="262" type="0">
</Transition>
<Transition StartId="289" EndId="197" type="0">
</Transition>
<Transition StartId="290" EndId="278" type="0">
</Transition>
<Transition StartId="292" EndId="132" type="0">
</Transition>
<Transition StartId="293" EndId="294" type="0">
</Transition>
<Transition StartId="294" EndId="295" type="0">
</Transition>
<Transition StartId="295" EndId="296" type="0">
</Transition>
<Transition StartId="296" EndId="288" type="0">
</Transition>
<Transition StartId="297" EndId="265" type="0">
</Transition>
</Transitions>
</Process>

