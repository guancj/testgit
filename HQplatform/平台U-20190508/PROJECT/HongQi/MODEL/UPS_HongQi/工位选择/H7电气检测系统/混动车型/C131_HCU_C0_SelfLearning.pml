<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1031" pbltext="DEP1007">
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
<Rect left="515" right="615" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1477" top="815" right="1577" bottom="847"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="6" ActivityType="3" flags="0" name="清除结束">
<Rect left="1335" top="815" right="1435" bottom="847"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="连接ECU">
<Rect left="513" top="411" right="613" bottom="443"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="请挂P档">
<Rect left="517" top="157" right="617" bottom="189"/>
<Line1Text Enable="1" Text="请挂P档"/>
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
end
#DELAY 300</Script></Activity>
<Activity id="12" ActivityType="5" flags="0" name="C131_MCU_ReadTmp">
<Rect left="516" top="226" right="616" bottom="258"/>
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
<Rect left="515" top="280" right="615" bottom="312"/>
<SubProcesses>
<SubProcess id="C131_DCT_ReadTmp">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
<Parameter id="tempValue" value="0" ret="tempValue"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="异常退出，电机温度不正常">
<Rect left="383" top="226" right="483" bottom="258"/>
<Line1Text Enable="1" Text="异常退出，电机温度不正常"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="请着车">
<Rect left="514" top="345" right="614" bottom="377"/>
<TitleText Enable="1" Text="CO离合器自学习（HCU）"/>
<Line1Text Enable="1" Text="请着车"/>
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
<Rect left="513" top="519" right="613" bottom="551"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1024" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="设置电机为转速控制模式">
<Rect left="804" top="120" right="904" bottom="152"/>
<Line1Text Enable="1" Text="设置电机为转速控制模式"/>
<Script>#COMM 0x2f 0x02 0x12 0x03 0x02
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1010" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="读电机工作状态">
<Rect left="805" top="176" right="905" bottom="208"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读电机工作状态"/>
<Script>#COMM 0x22 0x01 0xca
if(@0==0x62)then
  if (@3 == 0x04) then
    engine.LastError = 0;
    engine.SetLineText(1,"电机工作状态");
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"电机工作状态");
  end
  engine.StatValue=@3;
  engine.StatPoint=4;
  engine.SetLineText(2,@3);
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="6" name="DEP1011" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="设置电机需求转速">
<Rect left="808" top="233" right="908" bottom="265"/>
<Line1Text Enable="1" Text="设置电机需求转速"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x11 0x03 0x02 0xee
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP1012" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="读取电机实际转速">
<Rect left="804" top="342" right="904" bottom="374"/>
<Line1Text Enable="1" Text="读取电机实际转速"/>
<Script>#COMM 0x22 0x01 0x58
if(@0==0x62)then
  DecValue = (@3*256+@4)*1-14000;
  print("电机转速DecValue"..DecValue);
  DecValue = 750 - DecValue;
  print("电机转速与怠速差值DecValue"..DecValue);
  if (DecValue&gt;=-50 and DecValue&lt;=50) then
    engine.LastError = 0;
    engine.SetLineText(1,"转速差");
    engine.SetLineText(2,DecValue);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"转速差");
    engine.SetLineText(2,DecValue); 
  end 
    engine.StatValue=DecValue;
    engine.StatLower=-50;
    engine.StatUpper=50;
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="8" name="DEP1014" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="发送半结合点自学习命令">
<Rect left="805" top="397" right="905" bottom="429"/>
<Line1Text Enable="1" Text="发送半结合点自学习命令"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x0f 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="9" name="DEP1015" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="读取C0半结合点自学习使能状态">
<Rect left="805" top="464" right="905" bottom="496"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取C0半结合点自学习使能状态"/>
<Script>#COMM 0x22 0x01 0xd5
if(@0==0x62)then
  DecValue = @3;
  print("读取C0半结合点自学习使能状态DecValue"..DecValue);
  if (DecValue==0x01) then
    engine.LastError = 0;
    engine.SetLineText(1,"离合器半结合点使能状态");
    engine.SetLineText(2,DecValue);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"离合器半结合点使能状态");
    engine.SetLineText(2,DecValue);  
  end
  engine.StatValue=DecValue;
  engine.StatPoint=1;
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="10" name="DEP1016" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="异常退出，请检测电机及其控制器">
<Rect left="1335" top="174" right="1435" bottom="206"/>
<Line1Text Enable="1" Text="异常退出，请检测电机及其控制器"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="异常退出，变速箱温度不正常">
<Rect left="383" top="281" right="483" bottom="313"/>
<Line1Text Enable="1" Text="异常退出，变速箱温度不正常"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="异常退出，请检测CO">
<Rect left="1129" top="463" right="1229" bottom="495"/>
<Line1Text Enable="1" Text="异常退出，请检测C0"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="读取C0半结合点自学习模式标志位">
<Rect left="804" top="525" right="904" bottom="557"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="10" DelayTime="10"/>
<Line1Text Enable="1" Text="读取C0半结合点自学习模式标志位"/>
<Script>#COMM 0x22 0x01 0xe7
if(@0==0x62)then
  DecValue = @3;
  print("读取C0半结合点自学习模式标志位DecValue"..DecValue);
  if (DecValue==0x02) then
    engine.LastError = 0;
    engine.SetLineText(1,"读取C0半结合点自学习模式标志位");
    engine.SetLineText(2,DecValue);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"读取C0半结合点自学习模式标志位");
    engine.SetLineText(2,DecValue);  
  end
  engine.StatValue=DecValue;
  engine.StatPoint=2;
else
    engine.LastError = 1;
    engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end




</Script><assessment no="11" name="DEP1018" type="8" flags="97"/>
</Activity>
<Activity id="30" ActivityType="3" flags="0" name="读取C0半结合点压力值">
<Rect left="804" top="582" right="904" bottom="614"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取C0半结合点压力值"/>
<Script>#COMM 0x22 0x01 0xd6
if(@0==0x62)then
  local StringResHex
  local DecValue  
  DecValue = (@3*256+@4)*0.1-2.5;
  print("读取C0半结合点压力值DecValue"..DecValue);
  if (DecValue&gt;=-0.5 and DecValue &lt;= 0.5) then
    engine.LastError = 0;
    engine.SetLineText(1,"反馈压力值与2.5bar的差值，范围+/-0.5");
    engine.SetLineText(2,DecValue);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"反馈压力值与2.5bar的差值，范围+/-0.5");
    engine.SetLineText(2,DecValue); 
  end
  engine.StatValue=DecValue;
  engine.StatLower=-0.5;
  engine.StatUpper=0.5;
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end




</Script><assessment no="12" name="DEP1020" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="异常退出，请检查故障">
<Rect left="969" top="756" right="1069" bottom="788"/>
<Line1Text Enable="1" Text="异常退出，请检查故障"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="返回半接合点自学习命令控制权">
<Rect left="804" top="639" right="904" bottom="671"/>
<Line1Text Enable="1" Text="返回半接合点自学习命令控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x0f 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);














</Script><assessment no="13" name="DEP1021" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="1" name="返回电机需求转速需求控制权">
<Rect left="804" top="695" right="904" bottom="727"/>
<Line1Text Enable="1" Text="返回电机需求转速需求控制权"/>
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

</Script><assessment no="14" name="DEP1022" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="805" top="756" right="905" bottom="788"/>
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



</Script><assessment no="15" name="DEP1023" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="成功">
<Rect left="1122" top="816" right="1222" bottom="848"/>
<Line1Text Enable="1" Text="CO离合器学习成功"/>
<Script>#DELAY 2000</Script><assessment no="16" name="DEP1039" type="8" flags="99"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="513" top="582" right="613" bottom="614"/>
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
<Rect left="513" top="706" right="613" bottom="738"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@0==0x67) then
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
<Rect left="512" top="647" right="612" bottom="679"/>
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
<Activity id="40" ActivityType="3" flags="0" name="混动控制器自学习（HCU）">
<Rect left="516" top="65" right="616" bottom="97"/>
<TitleText Enable="1" Text="C0离合器自学习（HCU）"/>
<Line1Text Enable="1" Text="是否进行混动控制器自学习"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="通讯失败">
<Rect left="372" top="467" right="472" bottom="499"/>
<Line1Text Enable="1" Text="IC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="44" ActivityType="3" flags="0" name="结束通讯">
<Rect left="372" top="412" right="472" bottom="444"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="通讯">
<Rect left="514" top="464" right="614" bottom="496"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="失败">
<Rect left="1335" top="757" right="1435" bottom="789"/>
<Line1Text Enable="1" Text="C0离合器学习失败"/>
<Script>#DELAY 2000</Script><assessment no="17" name="DEP1040" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="4" flags="0" name="路由节点">
<Rect left="200" top="248" right="232" bottom="280"/>
</Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="199" top="976" right="231" bottom="1008"/>
</Activity>
<Activity id="54" ActivityType="4" flags="0" name="路由节点">
<Rect left="1369" top="976" right="1401" bottom="1008"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="953" top="173" right="1053" bottom="205"/>
<Line2Text Enable="1" Text="电机工作状态不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="958" top="342" right="1058" bottom="374"/>
<Line2Text Enable="1" Text="转速差不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="961" top="464" right="1061" bottom="496"/>
<Line2Text Enable="1" Text="离合器半结合点使能状态不正确，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="965" top="526" right="1065" bottom="558"/>
<Line2Text Enable="1" Text="自学习模式标志位不正确，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="966" top="583" right="1066" bottom="615"/>
<Line2Text Enable="1" Text="半结合点压力值不正确，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="延时1000ms">
<Rect left="803" top="287" right="903" bottom="319"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="延时300ms">
<Rect left="514" top="817" right="614" bottom="849"/>
<Line1Text Enable="1"/>
<Script>#DELAY 300</Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="取消车辆运输模式">
<Rect left="514" top="767" right="614" bottom="799"/>
<Line1Text Enable="1" Text="取消车辆运输模式"/>
<Script>engine.println("取消车辆运输模式");

#COMM 0x2e 0x01 0x06 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP1046" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="车辆运输模式状态">
<Rect left="513" top="867" right="613" bottom="899"/>
<Line1Text Enable="1" Text="激活车辆运输模式"/>
<Script>engine.println("读取消车辆运输模式");
#COMM 0x22 0x01 0x06

if(@0==0x62)then
if(@3==0x00)then
  engine.LastError = 0;
  engine.SetLineText(2,"取消车辆运输模式成功");
  engine.println("取消车辆运输模式成功");
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"取消车辆运输模式失败");
  engine.println("取消车辆运输模式失败");
end
  engine.StatValue=@3;
  engine.StatPoint=0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="20" name="DEP1048" type="8" flags="99"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1150" top="174" right="1250" bottom="206"/>
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



</Script><assessment no="22" name="DEP1148" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="返回电机需求转速需求控制权">
<Rect left="1129" top="343" right="1229" bottom="375"/>
<Line1Text Enable="1" Text="返回电机需求转速需求控制权"/>
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

</Script><assessment no="23" name="DEP1152" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1259" top="342" right="1359" bottom="374"/>
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



</Script><assessment no="24" name="DEP1153" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="返回半接合点自学习命令控制权">
<Rect left="1262" top="464" right="1362" bottom="496"/>
<Line1Text Enable="1" Text="返回半接合点自学习命令控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x0f 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);














</Script><assessment no="25" name="DEP1156" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="返回电机需求转速需求控制权">
<Rect left="1262" top="520" right="1362" bottom="552"/>
<Line1Text Enable="1" Text="返回电机需求转速需求控制权"/>
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

</Script><assessment no="26" name="DEP1154" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1263" top="581" right="1363" bottom="613"/>
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



</Script><assessment no="27" name="DEP1155" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="返回半接合点自学习命令控制权">
<Rect left="1128" top="584" right="1228" bottom="616"/>
<Line1Text Enable="1" Text="返回半接合点自学习命令控制权"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Script>#COMM 0x2f 0x02 0x0f 0x00

if (@0 == 0x6f) then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;  
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);














</Script><assessment no="28" name="DEP1159" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="返回电机需求转速需求控制权">
<Rect left="1128" top="640" right="1228" bottom="672"/>
<Line1Text Enable="1" Text="返回电机需求转速需求控制权"/>
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

</Script><assessment no="29" name="DEP1157" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="返回电机控制模式需求控制权">
<Rect left="1129" top="701" right="1229" bottom="733"/>
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



</Script><assessment no="30" name="DEP1158" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="979" right="66" bottom="1011"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="40" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="0">
</Transition>
<Transition StartId="8" EndId="45" type="0">
</Transition>
<Transition StartId="9" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="1">
<Expression>tempValue==0 and CommErr==0</Expression></Transition>
<Transition StartId="12" EndId="15" type="1">
<Expression>tempValue==1 or CommErr==1</Expression></Transition>
<Transition StartId="13" EndId="26" type="1">
<Expression>tempValue==1 or CommErr==1</Expression></Transition>
<Transition StartId="13" EndId="16" type="1">
<Expression>tempValue==0 and CommErr==0</Expression></Transition>
<Transition StartId="15" EndId="52" type="0">
</Transition>
<Transition StartId="16" EndId="8" type="0">
</Transition>
<Transition StartId="17" EndId="36" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="55" type="4">
</Transition>
<Transition StartId="19" EndId="20" type="3">
</Transition>
<Transition StartId="20" EndId="60" type="0">
</Transition>
<Transition StartId="21" EndId="56" type="4">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="22" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="57" type="4">
</Transition>
<Transition StartId="24" EndId="29" type="3">
</Transition>
<Transition StartId="25" EndId="48" type="0">
</Transition>
<Transition StartId="26" EndId="52" type="0">
</Transition>
<Transition StartId="27" EndId="68" type="0">
</Transition>
<Transition StartId="29" EndId="58" type="4">
</Transition>
<Transition StartId="29" EndId="30" type="3">
</Transition>
<Transition StartId="30" EndId="59" type="4">
</Transition>
<Transition StartId="30" EndId="32" type="3">
</Transition>
<Transition StartId="31" EndId="48" type="0">
</Transition>
<Transition StartId="32" EndId="31" type="4">
</Transition>
<Transition StartId="32" EndId="33" type="3">
</Transition>
<Transition StartId="33" EndId="31" type="4">
</Transition>
<Transition StartId="33" EndId="34" type="3">
</Transition>
<Transition StartId="34" EndId="35" type="3">
</Transition>
<Transition StartId="34" EndId="31" type="4">
</Transition>
<Transition StartId="35" EndId="6" type="0">
</Transition>
<Transition StartId="36" EndId="38" type="0">
</Transition>
<Transition StartId="37" EndId="63" type="0">
</Transition>
<Transition StartId="38" EndId="37" type="0">
</Transition>
<Transition StartId="40" EndId="9" type="6">
</Transition>
<Transition StartId="40" EndId="52" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="0">
</Transition>
<Transition StartId="43" EndId="52" type="5">
</Transition>
<Transition StartId="44" EndId="8" type="0">
</Transition>
<Transition StartId="45" EndId="43" type="4">
</Transition>
<Transition StartId="45" EndId="17" type="3">
</Transition>
<Transition StartId="48" EndId="6" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="6" type="0">
</Transition>
<Transition StartId="55" EndId="65" type="0">
</Transition>
<Transition StartId="56" EndId="66" type="0">
</Transition>
<Transition StartId="57" EndId="27" type="0">
</Transition>
<Transition StartId="58" EndId="27" type="0">
</Transition>
<Transition StartId="59" EndId="71" type="0">
</Transition>
<Transition StartId="60" EndId="21" type="0">
</Transition>
<Transition StartId="62" EndId="64" type="0">
</Transition>
<Transition StartId="63" EndId="62" type="0">
</Transition>
<Transition StartId="64" EndId="18" type="0">
</Transition>
<Transition StartId="65" EndId="25" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="25" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="48" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="48" type="0">
</Transition>
</Transitions>
</Process>

