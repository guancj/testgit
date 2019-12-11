<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1041" pbltext="DEP1036">
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
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="516" right="616" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1025" top="863" right="1125" bottom="895"/>
<Script></Script></End>
<Activities>
<Activity id="6" ActivityType="3" flags="0" name="清除结束">
<Rect left="1025" top="792" right="1125" bottom="824"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="连接ECU">
<Rect left="513" top="441" right="613" bottom="473"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM
#DELAY 1000
#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="请挂P档">
<Rect left="515" top="185" right="615" bottom="217"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="请挂P档"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
#DELAY 300</Script></Activity>
<Activity id="12" ActivityType="5" flags="0" name="C131_MCU_ReadTmp">
<Rect left="514" top="253" right="614" bottom="285"/>
<SubProcesses>
<SubProcess id="C131_MCU_ReadTmp">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
<Parameter id="tempValue" value="0" ret="tempValue"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="13" ActivityType="5" flags="0" name="C131_DCT_ReadTmp">
<Rect left="514" top="312" right="614" bottom="344"/>
<SubProcesses>
<SubProcess id="C131_DCT_ReadTmp">
<Parameters>
<Parameter id="CommErr" value="0"/>
<Parameter id="tempValue" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="异常退出，电机温度不正常">
<Rect left="378" top="254" right="478" bottom="286"/>
<Line1Text Enable="1" Text="异常退出，电机温度不正常"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="请着车">
<Rect left="514" top="380" right="614" bottom="412"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<TitleText Enable="1" Text="双离合器半接合点学习"/>
<Line1Text Enable="1" Text="请着车，挂N档，并保持踩刹车"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
#DELAY 300</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="切诊断">
<Rect left="511" top="554" right="611" bottom="586"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1024" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="设置电机为转速控制模式">
<Rect left="709" top="129" right="809" bottom="161"/>
<Line1Text Enable="1" Text="设置电机为转速控制模式"/>
<Script>#COMM 0x2f 0x02 0x12 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1010" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="读电机工作状态">
<Rect left="710" top="193" right="810" bottom="225"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读电机工作状态"/>
<Script>#COMM 0x22 0x01 0xca

if(@0==0x62)then
if (@3 == 0x04) then
  engine.LastError = 0;
  engine.SetLineText(1,"电机工作状态");
  engine.SetLineText(2,@3);
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(1,"电机工作状态");
  engine.SetLineText(2,@3);  
end
  engine.StatValue=@3;
  engine.StatPoint=4;
engine.println("电机工作状态:".. @3);
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="6" name="DEP1011" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="设置电机需求转速">
<Rect left="709" top="252" right="809" bottom="284"/>
<Line1Text Enable="1" Text="设置电机需求转速"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x11 0x03 0x02 0xee
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP1012" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读取电机实际转速">
<Rect left="709" top="308" right="809" bottom="340"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取电机实际转速"/>
<Script>#COMM 0x22 0x01 0x58

if(@0==0x62)then
  local StringResHex
  local DecValue
  DecValue = (@3*256+@4)*1-14000;
  DecValue = 750 - DecValue;
  print("电机需求转速与怠速转速差DecValue"..DecValue);
  print("DecValue"..DecValue);
  if (DecValue&gt;=-50 and DecValue&lt;=50) then
    engine.LastError = 0;
    engine.SetLineText(1,"转速差");
    engine.SetLineText(2,DecValue);
  else
    engine.LastError = 1;
    engine.TestResult = 1;
    engine.SetLineText(1,"转速差");
    engine.SetLineText(2,DecValue);   
  end
    engine.StatValue=DecValue;
    engine.StatLower=-50;
    engine.StatUpper=50;
else
    engine.LastError = 1;
    engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="8" name="DEP1014" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="学习失败，请检测电机及其控制器">
<Rect left="1291" top="193" right="1391" bottom="225"/>
<Line1Text Enable="1" Text="异常退出，请检测电机及其控制器"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="异常退出，变速箱温度不正常">
<Rect left="375" top="311" right="475" bottom="343"/>
<Line1Text Enable="1" Text="异常退出，变速箱温度不正常"/>
<Script>#DELAY 3000</Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="511" top="613" right="611" bottom="645"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3" name="DEP959" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="发送key">
<Rect left="509" top="730" right="609" bottom="762"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="4" name="DEP960" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="13" flags="0" name="seedtokey">
<Rect left="510" top="674" right="610" bottom="706"/>
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
<Activity id="40" ActivityType="5" flags="0" name="C131_DCT_SelfLearning">
<Rect left="707" top="705" right="807" bottom="737"/>
<SubProcesses>
<SubProcess id="C131_DCT_SelfLearning">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="双离合器半接合点学习">
<Rect left="516" top="126" right="616" bottom="158"/>
<TitleText Enable="1" Text="双离合器半接合点学习"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="双离合器半接合点学习">
<Rect left="515" top="68" right="615" bottom="100"/>
<TitleText Enable="1" Text="双离合器半接合点学习"/>
<Line1Text Enable="1" Text="是否进行双离合器半接合点学习"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="44" ActivityType="4" flags="0" name="路由节点">
<Rect left="291" top="254" right="323" bottom="286"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="通讯失败">
<Rect left="378" top="498" right="478" bottom="530"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="46" ActivityType="3" flags="0" name="结束通讯">
<Rect left="379" top="441" right="479" bottom="473"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="通讯">
<Rect left="512" top="501" right="612" bottom="533"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="49" ActivityType="4" flags="0" name="路由节点">
<Rect left="291" top="791" right="323" bottom="823"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="855" top="192" right="955" bottom="224"/>
<Line2Text Enable="1" Text="电机工作状态不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="860" top="308" right="960" bottom="340"/>
<Line2Text Enable="1" Text="电机需求转速与怠速转速差不正确，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="清除结束">
<Rect left="708" top="639" right="808" bottom="671"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="普通节点">
<Rect left="1618" top="354" right="1718" bottom="386"/>
<Script></Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1002" top="193" right="1102" bottom="225"/>
<Line1Text Enable="1" Text="返回电机控制模式需求控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x12 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1; 
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="11" name="DEP1207" type="8" flags="97"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1002" top="308" right="1102" bottom="340"/>
<Line1Text Enable="1" Text="返回电机控制模式需求控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x12 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1; 
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="12" name="DEP1208" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1132" top="307" right="1232" bottom="339"/>
<Line1Text Enable="1" Text="返回电机控制模式需求控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x11 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1; 
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="13" name="DEP1209" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="连接ECU">
<Rect left="708" top="883" right="808" bottom="915"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM
#DELAY 1000
#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="切诊断">
<Rect left="706" top="996" right="806" bottom="1028"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP1024" type="8" flags="97"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="706" top="1055" right="806" bottom="1087"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="16" name="DEP959" type="8" flags="97"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="发送key">
<Rect left="704" top="1172" right="804" bottom="1204"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="17" name="DEP960" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="13" flags="0" name="seedtokey">
<Rect left="705" top="1116" right="805" bottom="1148"/>
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
<Activity id="65" ActivityType="3" flags="0" name="通讯失败">
<Rect left="573" top="940" right="673" bottom="972"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="结束通讯">
<Rect left="574" top="883" right="674" bottom="915"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="通讯">
<Rect left="707" top="943" right="807" bottom="975"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
</Script><assessment no="14" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="重连HCU，返回控制权">
<Rect left="708" top="832" right="808" bottom="864"/>
<Script>engine.println("重新连接HCU，返回控制权")</Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="703" top="1228" right="803" bottom="1260"/>
<Line1Text Enable="1" Text="返回电机控制模式需求控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x12 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1; 
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="18" name="DEP1210" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="702" top="1283" right="802" bottom="1315"/>
<Line1Text Enable="1" Text="返回电机控制模式需求控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x11 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1; 
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="19" name="DEP1211" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="挂回P档">
<Rect left="701" top="1340" right="801" bottom="1372"/>
<Strategy NokTime="0" RetryTimeOut="60"/>
<Line1Text Enable="1" Text="学习结束，请挂P档"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
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
end
#DELAY 300</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="43" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="0">
</Transition>
<Transition StartId="8" EndId="47" type="0">
</Transition>
<Transition StartId="9" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>tempValue==0 or CommErr==0</Expression></Transition>
<Transition StartId="12" EndId="15" type="1">
<Expression>tempValue==1 or CommErr==1</Expression></Transition>
<Transition StartId="13" EndId="26" type="1">
<Expression>tempValue==1 or CommErr==1</Expression></Transition>
<Transition StartId="13" EndId="16" type="1">
<Expression>tempValue==0 or CommErr==0</Expression></Transition>
<Transition StartId="15" EndId="44" type="0">
</Transition>
<Transition StartId="16" EndId="8" type="0">
</Transition>
<Transition StartId="17" EndId="36" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="3">
</Transition>
<Transition StartId="18" EndId="25" type="4">
</Transition>
<Transition StartId="19" EndId="50" type="4">
</Transition>
<Transition StartId="19" EndId="20" type="3">
</Transition>
<Transition StartId="20" EndId="21" type="3">
</Transition>
<Transition StartId="20" EndId="25" type="4">
</Transition>
<Transition StartId="21" EndId="52" type="4">
</Transition>
<Transition StartId="21" EndId="54" type="3">
</Transition>
<Transition StartId="25" EndId="6" type="0">
</Transition>
<Transition StartId="26" EndId="44" type="0">
</Transition>
<Transition StartId="36" EndId="38" type="0">
</Transition>
<Transition StartId="37" EndId="18" type="0">
</Transition>
<Transition StartId="38" EndId="37" type="0">
</Transition>
<Transition StartId="40" EndId="68" type="0">
</Transition>
<Transition StartId="42" EndId="9" type="0">
</Transition>
<Transition StartId="43" EndId="42" type="6">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="44" EndId="49" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="45" EndId="44" type="5">
</Transition>
<Transition StartId="46" EndId="8" type="0">
</Transition>
<Transition StartId="47" EndId="45" type="4">
</Transition>
<Transition StartId="47" EndId="17" type="3">
</Transition>
<Transition StartId="49" EndId="6" type="0">
</Transition>
<Transition StartId="50" EndId="56" type="0">
</Transition>
<Transition StartId="52" EndId="57" type="0">
</Transition>
<Transition StartId="54" EndId="40" type="0">
</Transition>
<Transition StartId="56" EndId="25" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="25" type="0">
</Transition>
<Transition StartId="60" EndId="67" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="63" EndId="69" type="0">
</Transition>
<Transition StartId="64" EndId="63" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="65" EndId="49" type="5">
</Transition>
<Transition StartId="66" EndId="60" type="0">
</Transition>
<Transition StartId="67" EndId="61" type="3">
</Transition>
<Transition StartId="67" EndId="65" type="4">
</Transition>
<Transition StartId="68" EndId="60" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="6" type="0">
</Transition>
</Transitions>
</Process>

