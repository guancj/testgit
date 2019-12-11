<?xml version="1.0" encoding="utf-8" ?>
<Process description="--[[ &#13;&#10;************************************************************************************************************************&#13;&#10;This is used to explain the relationsihp between Config DID and Coding Variant&#13;&#10;History:&#13;&#10;    11/10/2016, developer : Zhushaodong created&#13;&#10;&#13;&#10;0101=DString_C131_HorLConfig       --配置码&#13;&#10;0100=DString_C131_VariCoding       --DVD配置码&#13;&#10;0113=DString_C131_BattConfig       --混动电池配置码&#13;&#10;0116=DString_C131_DVDConfig       --蓝图电池配置码&#13;&#10;&#13;&#10;************************************************************************************************************************&#13;&#10;--]]&#13;&#10;" flags="1" block="1" ptbtext="DEP164" group="1129" pbltext="DEP18">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_GATEWAY_Voltage_Of_Piles_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_Voltage_Generate_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_Current_Generate_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_Heating_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="DString_C131_dif_config_ARMREST" type="8" dir="0" data="DString_C131_dif_config_ARMREST"/>
<Variable id="DString_C131_Partnumber_ARMREST" type="8" dir="0" data="DString_C131_Partnumber_ARMREST "/>
<Variable id="C131_GATEWAY_Current_Range_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_HorLConfig" type="8" dir="0" data="DString_C131_HorLConfig"/>
<Variable id="C131_GATEWAY_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_GATEWAY_EBS_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="DString_C131_BattConfig" type="8" dir="0" data="DString_C131_BattConfig"/>
<Variable id="DString_C131_DVDConfig" type="8" dir="0" data="DString_C131_DVDConfig"/>
<Variable id="C131_GATEWAY_Batt_Execute_Flag" type="11" dir="0" data="true"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7F0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7F1" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="130" top="10" right="230" bottom="42"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="487" top="5006" right="587" bottom="5038"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="网关 (GATEWAY)">
<Rect left="129" top="70" right="229" bottom="102"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="127" top="218" right="227" bottom="250"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2105" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="自动测试">
<Rect left="464" top="666" right="564" bottom="698"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="蓄电池电压"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="GW 读蓄电池电压">
<Rect left="464" top="713" right="564" bottom="745"/>
<Strategy TotalTime="100" NokTime="5" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x10
if(@0==0x62)then
--resu =(((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
voltage=((@2*256+@3)*0.0009765625)+3.0
engine.println("voltage="..voltage);
if ((3&lt;voltage) and (voltage&lt;18 )) then
  engine.LastError = 0;
  engine.StatValue=voltage;
  --OK=OK+1;
  --engine.SetLineText(4,i..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=voltage;
  engine.StatLower=3.0;
  engine.StatUpper=18.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
--engine.SetLineText(3,"蓄电池电压"..voltage);
engine.SetLineText(3,"#L=BMPBAR,".."3.0"..",".."18.0"..",".."1"..","..tostring(voltage));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="16" name="DEP631" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="4" flags="0" name="条件1 ">
<Rect left="502" top="609" right="534" bottom="641"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="GW 读发电机电压">
<Rect left="466" top="921" right="566" bottom="953"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x13
if(@0==0x62)then
--resu = ((RecvTel[Pos]* Mult ) + Smd) * 1.0
voltage=((@2*0.1)+10.6)*1.0
engine.println("voltage="..voltage);
if ((10.6&lt;voltage) and (voltage&lt;16.0)) then
  engine.LastError = 0;
  engine.StatValue=voltage;
  --OK=OK+1;
  --engine.SetLineText(4,i..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=voltage;
  engine.StatLower=10.6;
  engine.StatUpper=16.0;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,"#L=BMPBAR,".."3.0"..",".."18.0"..",".."1"..","..tostring(voltage));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="17" name="DEP632" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="GW 读发电机电流">
<Rect left="467" top="1068" right="567" bottom="1100"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x14
if(@0==0x62)then
--resu = ((RecvTel[Pos]* Mult ) + Smd) * 1.0
current=(@2*0.25)*1.0
engine.println("current="..current);
if ((current&lt;7.75) and (current&gt;0)) then
  engine.LastError = 0;
  engine.StatValue=current;
  --OK=OK+1;
  --engine.SetLineText(4,i..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=current;
  engine.StatLower=0;
  engine.StatUpper=7.75;
  --NOK=NOK+1;
  --engine.SetLineText(3,"发电机电流"..NOK);
end
--engine.SetLineText(3,"发电机电流"..current);
engine.SetLineText(3,"#L=BMPBAR,".."0.0"..",".."7.75"..",".."1"..","..tostring(current));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="18" name="DEP633" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="4" flags="0" name="条件2">
<Rect left="498" top="819" right="530" bottom="851"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="检测失败">
<Rect left="351" top="1068" right="451" bottom="1100"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="检测失败">
<Rect left="350" top="716" right="450" bottom="748"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="33" ActivityType="3" flags="0" name="检测失败">
<Rect left="353" top="922" right="453" bottom="954"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="40" ActivityType="3" flags="0" name="读当前状态">
<Rect left="464" top="1268" right="564" bottom="1300"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="蓄电池电流范围"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="GW读驾驶员座椅加热电流">
<Rect left="464" top="1316" right="564" bottom="1348"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
  engine.StatValue=resu;
  engine.StatLower=UTG;
  engine.StatUpper=OTG;
end
engine.println("resu="..resu);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));


else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="19" name="DEP634" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="GW读驾驶员座椅加热电流">
<Rect left="465" top="1408" right="565" bottom="1440"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开司机座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-20.0
  OTG=20.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-20.0"..",".."20.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="20" name="DEP635" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="检测失败">
<Rect left="352" top="1317" right="452" bottom="1349"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="检测失败">
<Rect left="351" top="1408" right="451" bottom="1440"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="&quot;GW 读电流DDS加热前&quot;">
<Rect left="467" top="1546" right="567" bottom="1578"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;

else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="21" name="DEP634" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="检测失败">
<Rect left="355" top="1546" right="455" bottom="1578"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="&quot;GW读驾驶员座椅通风电流&quot;">
<Rect left="469" top="1643" right="569" bottom="1675"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开司机座椅通风开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-10.0
  --OTG=-0.2
  OTG=10.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-10.0
  --OTG=-0.2
  OTG=10.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-10.0
  --OTG=-0.2
  OTG=10.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-10.0"..",".."-0.2"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="22" name="DEP635" type="8" flags="97"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="检测失败">
<Rect left="357" top="1644" right="457" bottom="1676"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="GW 读电流PDS加热前">
<Rect left="470" top="1779" right="570" bottom="1811"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="23" name="DEP636" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="&quot;GW读副驾驶员座椅加热电流&quot;">
<Rect left="469" top="1873" right="569" bottom="1905"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开副驾驶座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-20.0"..",".."20.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="24" name="DEP637" type="8" flags="97"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="检测失败">
<Rect left="356" top="1779" right="456" bottom="1811"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="62" ActivityType="3" flags="0" name="检测失败">
<Rect left="357" top="1874" right="457" bottom="1906"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="读电流PDS加热前">
<Rect left="469" top="2016" right="569" bottom="2048"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));
else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="25" name="DEP636" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="GW读副驾驶员座椅加热电流">
<Rect left="470" top="2112" right="570" bottom="2144"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开副驾驶座椅通风开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-20.0"..",".."20.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="26" name="DEP637" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="检测失败">
<Rect left="353" top="2017" right="453" bottom="2049"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="检测失败">
<Rect left="357" top="2113" right="457" bottom="2145"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="读当前状态">
<Rect left="465" top="1361" right="565" bottom="1393"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="读当前状态">
<Rect left="466" top="1500" right="566" bottom="1532"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="读当前状态">
<Rect left="468" top="1595" right="568" bottom="1627"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="读当前状态">
<Rect left="471" top="1734" right="571" bottom="1766"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="读当前状态">
<Rect left="469" top="1825" right="569" bottom="1857"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="读当前状态">
<Rect left="468" top="1967" right="568" bottom="1999"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="读当前状态">
<Rect left="470" top="2062" right="570" bottom="2094"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="89" ActivityType="4" flags="0" name="条件3">
<Rect left="500" top="971" right="532" bottom="1003"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="关闭驾驶员座椅加热开关">
<Rect left="465" top="1454" right="565" bottom="1486"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭司机座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="关闭驾驶员座椅通风开关">
<Rect left="470" top="1688" right="570" bottom="1720"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭司机座椅通风开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="自动测试">
<Rect left="465" top="869" right="565" bottom="901"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发电机电压"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="99" ActivityType="4" flags="0" name="路由节点">
<Rect left="726" top="1117" right="758" bottom="1149"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="检测失败">
<Rect left="350" top="1453" right="450" bottom="1485"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="自动测试">
<Rect left="466" top="1018" right="566" bottom="1050"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发电机电流"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="关闭副驾驶员座椅通风开关">
<Rect left="469" top="2161" right="569" bottom="2193"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭副驾驶座椅通风开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="关闭副驾驶员座椅加热开关">
<Rect left="469" top="1920" right="569" bottom="1952"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭副驾驶座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="调整乘员侧座椅">
<Rect left="474" top="2448" right="574" bottom="2480"/>
<Line1Text Enable="1" Text="请调整乘员侧座椅调整按钮"/>
<Line2Text Enable="1" Text="#L=座椅可以前后动作吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以前后动作吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以前后动作吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="27" name="DEP638" type="8" flags="97"/>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="检测失败">
<Rect left="359" top="1688" right="459" bottom="1720"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="检测失败">
<Rect left="356" top="1920" right="456" bottom="1952"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="检测失败">
<Rect left="356" top="2164" right="456" bottom="2196"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="调整乘员侧靠背">
<Rect left="474" top="2495" right="574" bottom="2527"/>
<Line1Text Enable="1" Text="请调整乘员侧靠背调整按钮"/>
<Line2Text Enable="1" Text="#L=靠背可以前后动作吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=靠背可以前后动作吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=靠背可以前后动作吗？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="28" name="DEP639" type="8" flags="97"/>
</Activity>
<Activity id="111" ActivityType="4" flags="0" name="条件41">
<Rect left="509" top="2542" right="541" bottom="2574"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="坐右后座椅">
<Rect left="474" top="2701" right="574" bottom="2733"/>
<Line1Text Enable="1" Text="请坐在右后座椅"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="114" ActivityType="4" flags="0" name="条件42">
<Rect left="509" top="2642" right="541" bottom="2674"/>
</Activity>
<Activity id="116" ActivityType="4" flags="0" name="条件43">
<Rect left="507" top="2748" right="539" bottom="2780"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="361" top="2702" right="461" bottom="2734"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="读当前状态">
<Rect left="473" top="2793" right="573" bottom="2825"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="GW 读电流RRDS加热前">
<Rect left="476" top="2840" right="576" bottom="2872"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then
   
if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="29" name="DEP640" type="8" flags="97"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="检测失败">
<Rect left="362" top="2841" right="462" bottom="2873"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="读当前状态">
<Rect left="477" top="2888" right="577" bottom="2920"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="GW读右后座椅加热电流">
<Rect left="478" top="2934" right="578" bottom="2966"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开右后座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
engine.println(" engine.LastError=".. engine.LastError);
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-20.0"..",".."20.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="30" name="DEP641" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="关闭右后座椅加热开关">
<Rect left="478" top="2981" right="578" bottom="3013"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭右后座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="检测失败">
<Rect left="363" top="2935" right="463" bottom="2967"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="126" ActivityType="4" flags="0" name="条件51">
<Rect left="513" top="3032" right="545" bottom="3064"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="检测失败">
<Rect left="365" top="2980" right="465" bottom="3012"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="读当前状态">
<Rect left="479" top="3077" right="579" bottom="3109"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="GW 读电流RR通风调节前">
<Rect left="479" top="3124" right="579" bottom="3156"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd);
resu = ((@3 * 256 + @4) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="31" name="DEP642" type="8" flags="97"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="检测失败">
<Rect left="367" top="3127" right="467" bottom="3159"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="136" ActivityType="3" flags="0" name="读当前状态">
<Rect left="480" top="3176" right="580" bottom="3208"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="GW读右后座椅通风电流">
<Rect left="481" top="3222" right="581" bottom="3254"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开右后通风调节开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-10.0
  OTG=-0.2
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-10.0
  OTG=-0.2
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-10.0
  OTG=-0.2
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-10.0"..",".."-0.2"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="32" name="DEP643" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="关闭右后座椅通风调节开关">
<Rect left="482" top="3270" right="582" bottom="3302"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭右后座椅通风调节开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="检测失败">
<Rect left="369" top="3223" right="469" bottom="3255"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="141" ActivityType="4" flags="0" name="条件60">
<Rect left="516" top="3329" right="548" bottom="3361"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="检测失败">
<Rect left="369" top="3271" right="469" bottom="3303"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="145" ActivityType="3" flags="0" name="读当前状态">
<Rect left="483" top="3377" right="583" bottom="3409"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="GW 读电流RLDS加热前">
<Rect left="482" top="3423" right="582" bottom="3455"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = ((@3 * 256 + @4) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="33" name="DEP644" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="检测失败">
<Rect left="370" top="3424" right="470" bottom="3456"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="151" ActivityType="3" flags="0" name="读当前状态">
<Rect left="482" top="3472" right="582" bottom="3504"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="152" ActivityType="3" flags="0" name="GW读左后座椅加热电流">
<Rect left="483" top="3518" right="583" bottom="3550"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左后座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-20.0"..",".."20.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="34" name="DEP645" type="8" flags="97"/>
</Activity>
<Activity id="153" ActivityType="3" flags="0" name="关闭左后座椅加热开关">
<Rect left="484" top="3564" right="584" bottom="3596"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭左后座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="154" ActivityType="3" flags="0" name="检测失败">
<Rect left="368" top="3519" right="468" bottom="3551"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="155" ActivityType="3" flags="0" name="检测失败">
<Rect left="371" top="3564" right="471" bottom="3596"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="156" ActivityType="4" flags="0" name="条件69">
<Rect left="517" top="3622" right="549" bottom="3654"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="读当前状态">
<Rect left="483" top="3668" right="583" bottom="3700"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="161" ActivityType="3" flags="0" name="GW 读电流RL通风调节前">
<Rect left="484" top="3716" right="584" bottom="3748"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = ((@3 * 256 + @4) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="35" name="DEP646" type="8" flags="97"/>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="检测失败">
<Rect left="372" top="3717" right="472" bottom="3749"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="读当前状态">
<Rect left="485" top="3762" right="585" bottom="3794"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="167" ActivityType="3" flags="0" name="GW读左后座椅通风电流">
<Rect left="485" top="3809" right="585" bottom="3841"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左后通风调节开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-10.0
  OTG=-0.2
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-10.0
  OTG=-0.2
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-10.0
  OTG=-0.2
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="36" name="DEP647" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="关闭左后座椅通风调节开关">
<Rect left="486" top="3855" right="586" bottom="3887"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭左后座椅通风调节开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="169" ActivityType="4" flags="0" name="条件78">
<Rect left="520" top="3907" right="552" bottom="3939"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="检测失败">
<Rect left="370" top="3809" right="470" bottom="3841"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="171" ActivityType="3" flags="0" name="检测失败">
<Rect left="372" top="3857" right="472" bottom="3889"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="172" ActivityType="4" flags="0" name="条件79">
<Rect left="519" top="3961" right="551" bottom="3993"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="坐在右后座椅">
<Rect left="484" top="4007" right="584" bottom="4039"/>
<Line1Text Enable="1" Text="请坐右后座椅"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="175" ActivityType="4" flags="0" name="条件80">
<Rect left="516" top="4060" right="548" bottom="4092"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="检测失败">
<Rect left="372" top="4007" right="472" bottom="4039"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="177" ActivityType="3" flags="0" name="读当前状态">
<Rect left="482" top="4107" right="582" bottom="4139"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="178" ActivityType="3" flags="0" name="GW 读电流RRDS加热前">
<Rect left="483" top="4156" right="583" bottom="4188"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = ((@3 * 256 + @4) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="37" name="DEP640" type="8" flags="97"/>
</Activity>
<Activity id="179" ActivityType="3" flags="0" name="检测失败">
<Rect left="369" top="4157" right="469" bottom="4189"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="读当前状态">
<Rect left="482" top="4203" right="582" bottom="4235"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="186" ActivityType="3" flags="0" name="GW读右后座椅加热电流">
<Rect left="483" top="4253" right="583" bottom="4285"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开右后座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="38" name="DEP641" type="8" flags="97"/>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="关闭右后座椅加热开关">
<Rect left="483" top="4297" right="583" bottom="4329"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭右后座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="188" ActivityType="3" flags="0" name="检测失败">
<Rect left="370" top="4250" right="470" bottom="4282"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="检测失败">
<Rect left="372" top="4296" right="472" bottom="4328"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="190" ActivityType="4" flags="0" name="条件88">
<Rect left="517" top="4349" right="549" bottom="4381"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="读当前状态">
<Rect left="483" top="4395" right="583" bottom="4427"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="GW 读电流RLDS加热前">
<Rect left="484" top="4442" right="584" bottom="4474"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd)
resu = ((@3 * 256 + @4) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="39" name="DEP644" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="检测失败">
<Rect left="371" top="4443" right="471" bottom="4475"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="197" ActivityType="3" flags="0" name="读当前状态">
<Rect left="485" top="4490" right="585" bottom="4522"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="GW读左后座椅加热电流">
<Rect left="488" top="4536" right="588" bottom="4568"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左后座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="40" name="DEP645" type="8" flags="97"/>
</Activity>
<Activity id="199" ActivityType="3" flags="0" name="关闭左后座椅加热开关">
<Rect left="489" top="4583" right="589" bottom="4615"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭左后座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="检测失败">
<Rect left="371" top="4541" right="471" bottom="4573"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="检测失败">
<Rect left="369" top="4583" right="469" bottom="4615"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="202" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="487" top="4958" right="587" bottom="4990"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="203" ActivityType="3" flags="0" name="连接ECU">
<Rect left="128" top="118" right="228" bottom="150"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
</Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="切诊断">
<Rect left="126" top="266" right="226" bottom="298"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2106" name="DEP1097" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="126" top="316" right="226" bottom="348"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2152" name="DEP22" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="13" flags="0" name="计算">
<Rect left="126" top="362" right="226" bottom="394"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x9FACCE9F"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="发送key">
<Rect left="127" top="407" right="227" bottom="439"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="2153" name="DEP22" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="比对零件号">
<Rect left="250" top="64" right="350" bottom="96"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	elseif(string.len(DString_C131_Partnumber)==11)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	else
	end
        --]]
        DString_tmp=@3-;
        DString1 = string.sub(DString_tmp,1,string.len(DString_C131_Partnumber));
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1);
	
	if (DString1==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="1" name="DEP322" type="8" flags="105"/>
</Activity>
<Activity id="214" ActivityType="4" flags="0" name="路由节点">
<Rect left="279" top="16" right="311" bottom="48"/>
</Activity>
<Activity id="215" ActivityType="3" flags="0" name="读硬件号">
<Rect left="370" top="67" right="470" bottom="99"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP323" type="8" flags="105"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="延时300MS">
<Rect left="370" top="120" right="470" bottom="152"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="218" ActivityType="4" flags="0" name="路由节点">
<Rect left="405" top="16" right="437" bottom="48"/>
</Activity>
<Activity id="219" ActivityType="4" flags="0" name="路由节点">
<Rect left="677" top="16" right="709" bottom="48"/>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="541" top="15" right="573" bottom="47"/>
</Activity>
<Activity id="221" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="505" top="73" right="605" bottom="105"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@9-@11);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP324" type="8" flags="105"/>
</Activity>
<Activity id="229" ActivityType="3" flags="0" name="读软件号">
<Rect left="642" top="67" right="742" bottom="99"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@10);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP325" type="8" flags="105"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="延时300MS">
<Rect left="642" top="117" right="742" bottom="149"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="759" top="69" right="859" bottom="101"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" ))then
		StandValue="04.20#02"
		--if("04.20#02" == DString1) then     
	else
		StandValue="03.20#05"
		--if("03.20#05" == DString1) then   
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                 
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end


</Script><assessment no="5" name="DEP326" type="8" flags="105"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="延时300MS">
<Rect left="759" top="119" right="859" bottom="151"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="793" top="17" right="825" bottom="49"/>
</Activity>
<Activity id="241" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1178" top="67" right="1278" bottom="99"/>
<Line1Text Enable="1" Text="读VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP327" type="8" flags="97"/>
</Activity>
<Activity id="242" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1178" top="121" right="1278" bottom="153"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (string.match(DString1,DString_Write_VIN)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Write_VIN;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP328" type="8" flags="97"/>
</Activity>
<Activity id="243" ActivityType="3" flags="0" name="日期读取">
<Rect left="1296" top="121" right="1396" bottom="153"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="245" ActivityType="3" flags="0" name="发送时间">
<Rect left="1296" top="71" right="1396" bottom="103"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="1211" top="18" right="1243" bottom="50"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="延时300MS">
<Rect left="506" top="123" right="606" bottom="155"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="248" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="2679" top="609" right="2779" bottom="641"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="249" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1681" top="118" right="1781" bottom="150"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="250" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1808" top="71" right="1908" bottom="103"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("DVD配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("DVD配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对DVD配置码成功");
		engine.println("比对DVD配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对DVD配置码失败");
		engine.println("比对DVD配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="11" name="DEP1122" type="8" flags="97"/>
</Activity>
<Activity id="252" ActivityType="3" flags="0" name="写0100DVD">
<Rect left="1682" top="68" right="1782" bottom="100"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("DVD配置码"..VariCoding);
if(string.len(VariCoding)==2)then
#COMM 0x2e 0x01 0x00 hex2bin(VariCoding)
elseif(string.len(VariCoding)==32)then
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)
else
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="10" name="DEP1121" type="8" flags="97"/>
</Activity>
<Activity id="253" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="18" right="1486" bottom="50"/>
</Activity>
<Activity id="256" ActivityType="4" flags="0" name="路由节点">
<Rect left="1330" top="17" right="1362" bottom="49"/>
</Activity>
<Activity id="259" ActivityType="3" flags="0" name="写0101">
<Rect left="1420" top="75" right="1520" bottom="107"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>HorLConfig=DString_C131_HorLConfig;
engine.SetLineText(3,HorLConfig);
engine.println("配置码:"..HorLConfig);
#COMM 0x2e 0x01 0x01 hex2bin(HorLConfig)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="12" name="DEP329" type="8" flags="97"/>
</Activity>
<Activity id="260" ActivityType="3" flags="0" name="检查配置码2">
<Rect left="1537" top="75" right="1637" bottom="107"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x01
engine.println("配置码2标准值:"..DString_C131_HorLConfig);
if(@0==0x62)then
	if(string.len(DString_C131_HorLConfig)==1*2)then
		DString_Read_Config_Code_From_ECU=hexstr(string.char(@3));
	elseif(string.len(DString_C131_HorLConfig)==16*2)then
		DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	else
	end
	engine.println("检查配置码2:"..DString_Read_Config_Code_From_ECU);
	
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_HorLConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_HorLConfig;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="13" name="DEP330" type="8" flags="97"/>
</Activity>
<Activity id="262" ActivityType="3" flags="0" name="检查配置码">
<Rect left="2510" top="205" right="2610" bottom="237"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("DVD配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	engine.println("DVD配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对DVD配置码成功");
		engine.println("比对DVD配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对DVD配置码失败");
		engine.println("比对DVD配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="14" name="DEP1122" type="8" flags="97"/>
</Activity>
<Activity id="263" ActivityType="4" flags="0" name="路由节点">
<Rect left="2541" top="18" right="2573" bottom="50"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="检查配置码2">
<Rect left="2506" top="113" right="2606" bottom="145"/>
<Line1Text Enable="1" Text="比对配置码2"/>
<Script>#COMM 0x22 0x01 0x01
engine.println("配置码2标准值:"..DString_C131_HorLConfig);
if(@0==0x62)then
	if(string.len(DString_C131_HorLConfig)==1*2)then
		DString_Read_Config_Code_From_ECU=hexstr(string.char(@3));
	elseif(string.len(DString_C131_HorLConfig)==16*2)then
		DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
	else
	end
	engine.println("检查配置码2:"..DString_Read_Config_Code_From_ECU);
	
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_HorLConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对配置码成功");
		engine.println("比对配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_HorLConfig;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="15" name="DEP330" type="8" flags="97"/>
</Activity>
<Activity id="265" ActivityType="4" flags="0" name="路由节点">
<Rect left="2712" top="19" right="2744" bottom="51"/>
</Activity>
<Activity id="266" ActivityType="4" flags="0" name="路由节点">
<Rect left="500" top="1117" right="532" bottom="1149"/>
</Activity>
<Activity id="267" ActivityType="4" flags="0" name="路由节点">
<Rect left="499" top="1220" right="531" bottom="1252"/>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="600" top="3173" right="632" bottom="3205"/>
</Activity>
<Activity id="271" ActivityType="4" flags="0" name="路由节点">
<Rect left="500" top="1174" right="532" bottom="1206"/>
</Activity>
<Activity id="272" ActivityType="4" flags="0" name="路由节点">
<Rect left="680" top="1174" right="712" bottom="1206"/>
</Activity>
<Activity id="273" ActivityType="4" flags="0" name="路由节点">
<Rect left="610" top="1219" right="642" bottom="1251"/>
</Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="714" right="616" bottom="746"/>
</Activity>
<Activity id="275" ActivityType="4" flags="0" name="路由节点">
<Rect left="579" top="893" right="611" bottom="925"/>
</Activity>
<Activity id="276" ActivityType="4" flags="0" name="路由节点">
<Rect left="580" top="1041" right="612" bottom="1073"/>
</Activity>
<Activity id="277" ActivityType="4" flags="0" name="路由节点">
<Rect left="594" top="2854" right="626" bottom="2886"/>
</Activity>
<Activity id="278" ActivityType="4" flags="0" name="路由节点">
<Rect left="603" top="3458" right="635" bottom="3490"/>
</Activity>
<Activity id="279" ActivityType="4" flags="0" name="路由节点">
<Rect left="771" top="3212" right="803" bottom="3244"/>
</Activity>
<Activity id="281" ActivityType="4" flags="0" name="路由节点">
<Rect left="619" top="4109" right="651" bottom="4141"/>
</Activity>
<Activity id="282" ActivityType="4" flags="0" name="路由节点">
<Rect left="609" top="4477" right="641" bottom="4509"/>
</Activity>
<Activity id="284" ActivityType="3" flags="0" name="GW 读电流PDS加热前">
<Rect left="471" top="2256" right="571" bottom="2288"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-1.0
  OTG=1.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256.0
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd);
resu = (((@3 * 256 + @4) * Mult ) + Smd);
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="55" name="DEP636" type="8" flags="97"/>
</Activity>
<Activity id="285" ActivityType="3" flags="0" name="GW读副驾驶员后风档加热加热电流">
<Rect left="473" top="2349" right="573" bottom="2381"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开后风档加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  UTG=-40.0
  --OTG=-10.0
  OTG=10.0
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-40.0
  --OTG=-10.0
  OTG=10.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048.0
  UTG=-40.0
  --OTG=-10.0
  OTG=10.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage;
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,".."-40.0"..",".."-10.0"..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="56" name="DEP637" type="8" flags="97"/>
</Activity>
<Activity id="286" ActivityType="3" flags="0" name="检测失败">
<Rect left="355" top="2257" right="455" bottom="2289"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="287" ActivityType="3" flags="0" name="检测失败">
<Rect left="360" top="2350" right="460" bottom="2382"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="288" ActivityType="3" flags="0" name="读当前状态">
<Rect left="470" top="2207" right="570" bottom="2239"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;</Script></Activity>
<Activity id="289" ActivityType="3" flags="0" name="读当前状态">
<Rect left="472" top="2302" right="572" bottom="2334"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="290" ActivityType="3" flags="0" name="关闭后风档加热开关">
<Rect left="474" top="2396" right="574" bottom="2428"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭后风档加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="检测失败">
<Rect left="361" top="2399" right="461" bottom="2431"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="292" ActivityType="4" flags="0" name="路由节点">
<Rect left="516" top="4634" right="548" bottom="4666"/>
</Activity>
<Activity id="294" ActivityType="3" flags="0" name="GW 读电流RLDS加热前">
<Rect left="482" top="4730" right="582" bottom="4762"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line3Text Enable="1" Text="蓄电池电压"/>
<Script>#COMM 0x22 0x01 0x10
if(@0==0x62)then

  Mult=0.0009765625
  Smd=3.0
  UTG=3.0
  OTG=18.0

--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd);
resu = ((@2 * 256 + @3) * Mult ) + Smd;
engine.println("resu="..resu);
fMesswert_Base_Current_GW=resu;
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="41" name="DEP631" type="8" flags="97"/>
</Activity>
<Activity id="295" ActivityType="3" flags="0" name="检测失败">
<Rect left="370" top="4733" right="470" bottom="4765"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="296" ActivityType="3" flags="0" name="读当前状态">
<Rect left="485" top="4776" right="585" bottom="4808"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@3;
#DELAY 500</Script></Activity>
<Activity id="297" ActivityType="3" flags="0" name="GW读左后座椅加热电流">
<Rect left="486" top="4825" right="586" bottom="4857"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左后座椅加热开关到最大"/>
<Line3Text Enable="1" Text="蓄电池电流范围"/>
<Script>#COMM 0x22 0x01 0x12
if(@0==0x62)then

if(flag_Result==0)then
  Mult=0.0009765625
  Smd=-32.0
  --UTG=-10
  --OTG=-3
  UTG=-20
  OTG=20
elseif(flag_Result==1)then
  Mult=0.0078125
  Smd=-256
  UTG=-200.0
  OTG=200.0
elseif(flag_Result==2)then
  Mult=0.0625
  Smd=-2048
  UTG=-1500.0
  OTG=1500.0
else
  break;
end
--resu = (((RecvTel[Pos] * 256 + RecvTel[Pos2]) * Mult ) + Smd) - BaseVoltage;
resu = (((@3 * 256 + @4) * Mult ) + Smd)-fMesswert_Base_Current_GW;
engine.println("resu="..resu);
if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
   engine.StatValue=resu;
else
   engine.LastError = 1;
   engine.StatValue=resu;
   engine.StatLower=UTG;
   engine.StatUpper=OTG;
end
engine.println(" engine.LastError=".. engine.LastError);
--engine.SetLineText(3,resu.."mA");
engine.SetLineText(3,"#L=BMPBAR,"..tostring(UTG)..","..tostring(OTG)..",".."1"..","..tostring(resu));

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end

</Script><assessment no="42" name="DEP635" type="8" flags="97"/>
</Activity>
<Activity id="298" ActivityType="3" flags="0" name="关闭左后座椅加热开关">
<Rect left="487" top="4872" right="587" bottom="4904"/>
<Line1Text Enable="1" Text="手动确认"/>
<Line2Text Enable="1" Text="请关闭司机座椅加热开关"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="关闭"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="299" ActivityType="3" flags="0" name="检测失败">
<Rect left="374" top="4828" right="474" bottom="4860"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="300" ActivityType="3" flags="0" name="检测失败">
<Rect left="375" top="4873" right="475" bottom="4905"/>
<Script>engine.TestResult = 1;
</Script></Activity>
<Activity id="301" ActivityType="3" flags="0" name="判断车型">
<Rect left="483" top="4683" right="583" bottom="4715"/>
<Script>if(DString_C131_Car_Tpye=="CH1GM21" or 
   DString_C131_Car_Tpye=="CH1GM22" or
   DString_C131_Car_Tpye=="CH1AM41" or
   DString_C131_Car_Tpye=="CH1AM42" or
   DString_C131_Car_Tpye=="CH1HM11" or
   DString_C131_Car_Tpye=="CH1HM12" or
   DString_C131_Car_Tpye=="CH1HM13" or
   DString_C131_Car_Tpye=="CH1FM12" or
   DString_C131_Car_Tpye=="CH1FM13" or
   DString_C131_Car_Tpye=="CH1CM28" or
   DString_C131_Car_Tpye=="CH1CM29" or
   DString_C131_Car_Tpye=="CH1JM11")   
then
   engine.LastError = 0;
else
   engine.LastError = 1;
end
   
 </Script></Activity>
<Activity id="302" ActivityType="4" flags="0" name="路由节点">
<Rect left="608" top="4778" right="640" bottom="4810"/>
</Activity>
<Activity id="303" ActivityType="3" flags="0" name="通讯">
<Rect left="133" top="165" right="233" bottom="197"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2103" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="304" ActivityType="3" flags="0" name="通讯失败">
<Rect left="14" top="170" right="114" bottom="202"/>
<Line1Text Enable="1" Text="GATEWAY 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="305" ActivityType="4" flags="0" name="路由节点">
<Rect left="43" top="4921" right="75" bottom="4953"/>
</Activity>
<Activity id="306" ActivityType="3" flags="0" name="结束通讯">
<Rect left="15" top="121" right="115" bottom="153"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="307" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1950" top="115" right="2050" bottom="147"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="308" ActivityType="3" flags="0" name="检查电池配置码">
<Rect left="2096" top="71" right="2196" bottom="103"/>
<Strategy TotalTime="10" NokTime="10"/>
<Line1Text Enable="1" Text="比对电池配置码"/>
<Script>#COMM 0x22 0x01 0x13
engine.println("混动电池配置码标准值:"..DString_C131_BattConfig);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=bin2hex(string.char(@3));
	engine.println("混动电池配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_BattConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对电池配置码成功");
		engine.println("比对电池配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对电池配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_BattConfig;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="45" name="DEP952" type="8" flags="97"/>
</Activity>
<Activity id="309" ActivityType="3" flags="0" name="混动写电池配置码">
<Rect left="1949" top="71" right="2049" bottom="103"/>
<Script>BattConfig=DString_C131_BattConfig;
engine.SetLineText(3,BattConfig);
engine.println("混动电池配置码"..BattConfig);

#COMM 0x2e 0x01 0x13 hex2bin(BattConfig)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="44" name="DEP951" type="8" flags="97"/>
</Activity>
<Activity id="310" ActivityType="4" flags="0" name="路由节点">
<Rect left="1984" top="17" right="2016" bottom="49"/>
</Activity>
<Activity id="311" ActivityType="3" flags="0" name="检查电池配置码">
<Rect left="2511" top="299" right="2611" bottom="331"/>
<Line1Text Enable="1" Text="比对电池配置码"/>
<Script>#COMM 0x22 0x01 0x13
engine.println("混动电池配置码标准值:"..DString_C131_BattConfig);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=bin2hex(string.char(@3));
	engine.println("混动电池配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_BattConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对电池配置码成功");
		engine.println("比对电池配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对电池配置码失败");
		engine.println("比对配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_BattCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="45" name="DEP952" type="8" flags="97"/>
</Activity>
<Activity id="312" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1419" top="122" right="1519" bottom="154"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="313" ActivityType="4" flags="0" name="路由节点">
<Rect left="1715" top="18" right="1747" bottom="50"/>
</Activity>
<Activity id="314" ActivityType="4" flags="0" name="路由节点">
<Rect left="2620" top="111" right="2652" bottom="143"/>
</Activity>
<Activity id="315" ActivityType="4" flags="0" name="路由节点">
<Rect left="2542" top="157" right="2574" bottom="189"/>
</Activity>
<Activity id="316" ActivityType="4" flags="0" name="路由节点">
<Rect left="2627" top="204" right="2659" bottom="236"/>
</Activity>
<Activity id="317" ActivityType="4" flags="0" name="路由节点">
<Rect left="2544" top="249" right="2576" bottom="281"/>
</Activity>
<Activity id="318" ActivityType="4" flags="0" name="路由节点">
<Rect left="2637" top="298" right="2669" bottom="330"/>
</Activity>
<Activity id="319" ActivityType="4" flags="0" name="路由节点">
<Rect left="2541" top="62" right="2573" bottom="94"/>
</Activity>
<Activity id="320" ActivityType="4" flags="0" name="路由节点">
<Rect left="1566" top="18" right="1598" bottom="50"/>
</Activity>
<Activity id="321" ActivityType="4" flags="0" name="路由节点">
<Rect left="1843" top="17" right="1875" bottom="49"/>
</Activity>
<Activity id="322" ActivityType="4" flags="0" name="路由节点">
<Rect left="2130" top="16" right="2162" bottom="48"/>
</Activity>
<Activity id="331" ActivityType="3" flags="0" name="检查电池配置码">
<Rect left="2364" top="72" right="2464" bottom="104"/>
<Strategy TotalTime="10" NokTime="10"/>
<Line1Text Enable="1" Text="检查电池配置码"/>
<Script>#COMM 0x22 0x01 0x16
engine.println("蓝图电池配置码标准值:"..DString_C131_DVDConfig);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=bin2hex(string.char(@3));
	engine.println("蓝图电池配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_DVDConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对电池配置码成功");
		engine.println("比对电池配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对电池配置码失败");
		engine.println("比对电池配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_DVDConfig;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="47" name="DEP952" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="4" flags="0" name="路由节点">
<Rect left="2270" top="17" right="2302" bottom="49"/>
</Activity>
<Activity id="334" ActivityType="4" flags="0" name="路由节点">
<Rect left="2402" top="17" right="2434" bottom="49"/>
</Activity>
<Activity id="335" ActivityType="3" flags="0" name="蓝图写电池配置码">
<Rect left="2237" top="71" right="2337" bottom="103"/>
<Line1Text Enable="1" Text="写电池配置码"/>
<Script>DVDConfig=DString_C131_DVDConfig;
engine.SetLineText(3,DVDConfig);
engine.println("蓝图电池配置码"..DVDConfig);
#COMM 0x2e 0x01 0x16 hex2bin(DVDConfig)
if(@0==0x6e)then
	engine.LastError = 0;
	engine.TestResult = 0;
else
	engine.LastError = 0;
	engine.TestResult = 0;
end
	
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="46" name="DEP951" type="8" flags="97"/>
</Activity>
<Activity id="337" ActivityType="3" flags="0" name="延时500ms">
<Rect left="2238" top="116" right="2338" bottom="148"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="339" ActivityType="4" flags="0" name="路由节点">
<Rect left="725" top="2542" right="757" bottom="2574"/>
</Activity>
<Activity id="340" ActivityType="4" flags="0" name="路由节点">
<Rect left="681" top="1968" right="713" bottom="2000"/>
</Activity>
<Activity id="341" ActivityType="4" flags="0" name="路由节点">
<Rect left="608" top="2447" right="640" bottom="2479"/>
</Activity>
<Activity id="342" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="3759" right="636" bottom="3791"/>
</Activity>
<Activity id="343" ActivityType="4" flags="0" name="路由节点">
<Rect left="700" top="4109" right="732" bottom="4141"/>
</Activity>
<Activity id="344" ActivityType="4" flags="0" name="路由节点">
<Rect left="701" top="4475" right="733" bottom="4507"/>
</Activity>
<Activity id="345" ActivityType="3" flags="0" name="混动车型">
<Rect left="905" top="68" right="1005" bottom="100"/>
<Script></Script></Activity>
<Activity id="346" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="905" top="125" right="1005" bottom="157"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95 
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23")then
		StandValue="SV1-70";
        elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="SV1-90";
        else
	        StandValue="SV1-90";
        end
	DString1=string.char(@3,@4,@5,@6,@7,@8);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1); 
        engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	--if("SV1-42" == DString1) then            
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                 
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP326" type="8" flags="105"/>
</Activity>
<Activity id="347" ActivityType="3" flags="0" name="延时300MS">
<Rect left="905" top="175" right="1005" bottom="207"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="348" ActivityType="4" flags="0" name="路由节点">
<Rect left="939" top="18" right="971" bottom="50"/>
</Activity>
<Activity id="349" ActivityType="4" flags="0" name="路由节点">
<Rect left="1070" top="225" right="1102" bottom="257"/>
</Activity>
<Activity id="351" ActivityType="4" flags="0" name="路由节点">
<Rect left="510" top="2594" right="542" bottom="2626"/>
</Activity>
<Activity id="352" ActivityType="4" flags="0" name="路由节点">
<Rect left="499" top="769" right="531" bottom="801"/>
</Activity>
<Activity id="353" ActivityType="4" flags="0" name="路由节点">
<Rect left="729" top="966" right="761" bottom="998"/>
</Activity>
<Activity id="354" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="2655" right="906" bottom="2687"/>
</Activity>
<Activity id="355" ActivityType="4" flags="0" name="路由节点">
<Rect left="870" top="4919" right="902" bottom="4951"/>
</Activity>
<Activity id="356" ActivityType="3" flags="0" name="写车型">
<Rect left="1179" top="174" right="1279" bottom="206"/>
<Line1Text Enable="1" Text="写车型代码"/>
<Script>engine.SetLineText(3,DString_C131_Car_Tpye);
#COMM 0x2E 0xF1 0xA0 DString_C131_Car_Tpye 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="57" name="DEP1181" type="8" flags="97"/>
</Activity>
<Activity id="357" ActivityType="3" flags="0" name="检查车型">
<Rect left="1179" top="228" right="1279" bottom="260"/>
<Line1Text Enable="1" Text="比对车型代码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0xA0
engine.SetLineText(2,DString_C131_Car_Tpye);
engine.println("车型标准值:"..DString_C131_Car_Tpye);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9);
	engine.SetLineText(3,DString1);
	engine.println("读到车型代值:"..DString1);
	if (string.match(DString1,DString_C131_Car_Tpye)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Car_Tpye;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="58" name="DEP1182" type="8" flags="97"/>
</Activity>
<Activity id="358" ActivityType="3" flags="0" name="检查电池配置码">
<Rect left="2511" top="401" right="2611" bottom="433"/>
<Strategy TotalTime="10" NokTime="10"/>
<Line1Text Enable="1" Text="检查电池配置码"/>
<Script>#COMM 0x22 0x01 0x16
engine.println("蓝图电池配置码标准值:"..DString_C131_DVDConfig);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=bin2hex(string.char(@3));
	engine.println("蓝图电池配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_DVDConfig)) then
		engine.LastError = 0;
		engine.SetLineText(2,"比对电池配置码成功");
		engine.println("比对电池配置码成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.SetLineText(2,"比对电池配置码失败");
		engine.println("比对电池配置码失败");
	end
	engine.StatValue= DString_Read_Config_Code_From_ECU;
	engine.StatPoint=DString_C131_DVDConfig;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="47" name="DEP952" type="8" flags="97"/>
</Activity>
<Activity id="359" ActivityType="4" flags="0" name="路由节点">
<Rect left="2637" top="400" right="2669" bottom="432"/>
</Activity>
<Activity id="360" ActivityType="4" flags="0" name="路由节点">
<Rect left="2545" top="350" right="2577" bottom="382"/>
</Activity>
<Activity id="361" ActivityType="3" flags="0" name="改脸">
<Rect left="1035" top="67" right="1135" bottom="99"/>
<Script></Script></Activity>
<Activity id="362" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1035" top="124" right="1135" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		--StandValue="V04.00#11";
		--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11);
		StandValue="04.00#18_4WD";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12" or DString_C131_Car_Tpye=="CH1NM11")then
		StandValue="04.30#10";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13); 
	elseif(( DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17"))then
		StandValue="04.30#10";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
                
         elseif(DString_C131_Car_Tpye == "CH1BM34")then
		StandValue="05.00#06";
                --StandValue="04#30_EEM_2018";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="05.00#07";
                --StandValue="04#30_EEM_2018";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="05.00#07";
                --StandValue="04#30_EEM_2018";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="05.00#07";
                --StandValue="04#30_EEM_2018";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	else
		StandValue="05.00#07";
                --StandValue="04#30_EEM_2018";
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1); 
	--if("SV1-42" == DString1) then          
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                 
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="5" name="DEP326" type="8" flags="105"/>
</Activity>
<Activity id="363" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1035" top="174" right="1135" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="364" ActivityType="4" flags="0" name="路由节点">
<Rect left="1073" top="17" right="1105" bottom="49"/>
</Activity>
<Activity id="365" ActivityType="3" flags="0" name="清DTC">
<Rect left="789" top="607" right="889" bottom="639"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2105" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="366" ActivityType="3" flags="0" name="调整乘员侧座椅">
<Rect left="318" top="2486" right="418" bottom="2518"/>
<Line1Text Enable="1" Text="请调整乘员侧座椅调整按钮"/>
<Line2Text Enable="1" Text="#L=座椅可以上下动作吗？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="不合格"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以上下动作吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=座椅可以上下动作吗？？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="109" name="DEP638" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="203" type="0">
</Transition>
<Transition StartId="4" EndId="204" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="31" type="4">
</Transition>
<Transition StartId="8" EndId="352" type="3">
</Transition>
<Transition StartId="10" EndId="274" type="0">
</Transition>
<Transition StartId="10" EndId="7" type="1">
<Expression>C131_GATEWAY_Voltage_Of_Piles_Execute_Flag==true  </Expression></Transition>
<Transition StartId="11" EndId="33" type="4">
</Transition>
<Transition StartId="11" EndId="89" type="3">
</Transition>
<Transition StartId="13" EndId="266" type="3">
</Transition>
<Transition StartId="13" EndId="19" type="4">
</Transition>
<Transition StartId="14" EndId="98" type="1">
<Expression>C131_GATEWAY_Voltage_Generate_Execute_Flag == true</Expression></Transition>
<Transition StartId="14" EndId="275" type="0">
</Transition>
<Transition StartId="19" EndId="266" type="0">
</Transition>
<Transition StartId="31" EndId="352" type="0">
</Transition>
<Transition StartId="33" EndId="89" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="44" type="4">
</Transition>
<Transition StartId="41" EndId="70" type="3">
</Transition>
<Transition StartId="43" EndId="47" type="4">
</Transition>
<Transition StartId="43" EndId="96" type="3">
</Transition>
<Transition StartId="44" EndId="70" type="0">
</Transition>
<Transition StartId="47" EndId="96" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="4">
</Transition>
<Transition StartId="51" EndId="72" type="3">
</Transition>
<Transition StartId="52" EndId="72" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="4">
</Transition>
<Transition StartId="55" EndId="97" type="3">
</Transition>
<Transition StartId="56" EndId="97" type="0">
</Transition>
<Transition StartId="58" EndId="61" type="4">
</Transition>
<Transition StartId="58" EndId="74" type="3">
</Transition>
<Transition StartId="60" EndId="62" type="4">
</Transition>
<Transition StartId="60" EndId="103" type="3">
</Transition>
<Transition StartId="61" EndId="74" type="0">
</Transition>
<Transition StartId="62" EndId="103" type="0">
</Transition>
<Transition StartId="64" EndId="67" type="4">
</Transition>
<Transition StartId="64" EndId="76" type="3">
</Transition>
<Transition StartId="66" EndId="102" type="3">
</Transition>
<Transition StartId="66" EndId="68" type="4">
</Transition>
<Transition StartId="67" EndId="76" type="0">
</Transition>
<Transition StartId="68" EndId="102" type="0">
</Transition>
<Transition StartId="70" EndId="43" type="0">
</Transition>
<Transition StartId="71" EndId="51" type="0">
</Transition>
<Transition StartId="72" EndId="55" type="0">
</Transition>
<Transition StartId="73" EndId="58" type="0">
</Transition>
<Transition StartId="74" EndId="60" type="0">
</Transition>
<Transition StartId="75" EndId="64" type="0">
</Transition>
<Transition StartId="76" EndId="66" type="0">
</Transition>
<Transition StartId="89" EndId="101" type="1">
<Expression>C131_GATEWAY_Current_Generate_Execute_Flag==true</Expression></Transition>
<Transition StartId="89" EndId="276" type="0">
</Transition>
<Transition StartId="96" EndId="71" type="6">
</Transition>
<Transition StartId="96" EndId="100" type="0">
</Transition>
<Transition StartId="97" EndId="73" type="6">
</Transition>
<Transition StartId="97" EndId="106" type="0">
</Transition>
<Transition StartId="98" EndId="11" type="0">
</Transition>
<Transition StartId="99" EndId="339" type="0">
</Transition>
<Transition StartId="100" EndId="71" type="0">
</Transition>
<Transition StartId="101" EndId="13" type="0">
</Transition>
<Transition StartId="102" EndId="288" type="6">
</Transition>
<Transition StartId="102" EndId="108" type="0">
</Transition>
<Transition StartId="103" EndId="75" type="6">
</Transition>
<Transition StartId="103" EndId="107" type="0">
</Transition>
<Transition StartId="104" EndId="109" type="0">
</Transition>
<Transition StartId="104" EndId="366" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM41" and DString_C131_Car_Tpye ~= "CH1GM42" and DString_C131_Car_Tpye ~= "CH1GM40"</Expression></Transition>
<Transition StartId="106" EndId="73" type="0">
</Transition>
<Transition StartId="107" EndId="75" type="0">
</Transition>
<Transition StartId="108" EndId="288" type="0">
</Transition>
<Transition StartId="109" EndId="111" type="0">
</Transition>
<Transition StartId="111" EndId="351" type="1">
<Expression>DString_C131_Car_Tpye~="CH1LM21" and DString_C131_Car_Tpye~="CH1LM11" and DString_C131_Car_Tpye~="CH1MM21" and LibGeneral.CarTNC_Isnot_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="111" EndId="354" type="0">
</Transition>
<Transition StartId="113" EndId="116" type="6">
</Transition>
<Transition StartId="113" EndId="117" type="0">
</Transition>
<Transition StartId="114" EndId="113" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~= "3610715-MH"</Expression></Transition>
<Transition StartId="114" EndId="277" type="0">
</Transition>
<Transition StartId="116" EndId="118" type="0">
</Transition>
<Transition StartId="117" EndId="116" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="121" type="4">
</Transition>
<Transition StartId="119" EndId="122" type="3">
</Transition>
<Transition StartId="121" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="125" type="4">
</Transition>
<Transition StartId="123" EndId="124" type="3">
</Transition>
<Transition StartId="124" EndId="126" type="6">
</Transition>
<Transition StartId="124" EndId="127" type="0">
</Transition>
<Transition StartId="125" EndId="124" type="0">
</Transition>
<Transition StartId="126" EndId="131" type="1">
<Expression>DString_C131_Partnumber_ARMREST == "3610715CMH"</Expression></Transition>
<Transition StartId="126" EndId="269" type="0">
</Transition>
<Transition StartId="127" EndId="126" type="0">
</Transition>
<Transition StartId="131" EndId="132" type="0">
</Transition>
<Transition StartId="132" EndId="136" type="3">
</Transition>
<Transition StartId="132" EndId="134" type="4">
</Transition>
<Transition StartId="134" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="139" type="3">
</Transition>
<Transition StartId="138" EndId="140" type="4">
</Transition>
<Transition StartId="139" EndId="142" type="0">
</Transition>
<Transition StartId="139" EndId="141" type="6">
</Transition>
<Transition StartId="140" EndId="139" type="0">
</Transition>
<Transition StartId="141" EndId="145" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~= "3610715-MH"</Expression></Transition>
<Transition StartId="141" EndId="278" type="0">
</Transition>
<Transition StartId="142" EndId="141" type="0">
</Transition>
<Transition StartId="145" EndId="147" type="0">
</Transition>
<Transition StartId="147" EndId="151" type="3">
</Transition>
<Transition StartId="147" EndId="149" type="4">
</Transition>
<Transition StartId="149" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="152" type="0">
</Transition>
<Transition StartId="152" EndId="154" type="4">
</Transition>
<Transition StartId="152" EndId="153" type="3">
</Transition>
<Transition StartId="153" EndId="155" type="0">
</Transition>
<Transition StartId="153" EndId="156" type="6">
</Transition>
<Transition StartId="154" EndId="153" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="342" type="0">
</Transition>
<Transition StartId="156" EndId="160" type="1">
<Expression>DString_C131_Partnumber_ARMREST == "3610715CMH"</Expression></Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="165" type="3">
</Transition>
<Transition StartId="161" EndId="163" type="4">
</Transition>
<Transition StartId="163" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="167" type="0">
</Transition>
<Transition StartId="167" EndId="170" type="4">
</Transition>
<Transition StartId="167" EndId="168" type="3">
</Transition>
<Transition StartId="168" EndId="171" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="6">
</Transition>
<Transition StartId="169" EndId="172" type="1">
<Expression>(C131_GATEWAY_Heating_Check_Execute_Flag ==true) and (DString_C131_dif_config_ARMREST == "1") and (C131_GATEWAY_Current_Range_Execute_Flag == true)</Expression></Transition>
<Transition StartId="169" EndId="343" type="0">
</Transition>
<Transition StartId="170" EndId="168" type="0">
</Transition>
<Transition StartId="171" EndId="169" type="0">
</Transition>
<Transition StartId="172" EndId="174" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~= "3610715-MH"</Expression></Transition>
<Transition StartId="172" EndId="281" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="6">
</Transition>
<Transition StartId="174" EndId="176" type="0">
</Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="176" EndId="175" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="185" type="3">
</Transition>
<Transition StartId="178" EndId="179" type="4">
</Transition>
<Transition StartId="179" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="186" type="0">
</Transition>
<Transition StartId="186" EndId="187" type="3">
</Transition>
<Transition StartId="186" EndId="188" type="4">
</Transition>
<Transition StartId="187" EndId="190" type="6">
</Transition>
<Transition StartId="187" EndId="189" type="0">
</Transition>
<Transition StartId="188" EndId="187" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="192" type="1">
<Expression>DString_C131_Partnumber_ARMREST ~= "3610715-MH"</Expression></Transition>
<Transition StartId="190" EndId="282" type="0">
</Transition>
<Transition StartId="192" EndId="193" type="0">
</Transition>
<Transition StartId="193" EndId="197" type="3">
</Transition>
<Transition StartId="193" EndId="195" type="4">
</Transition>
<Transition StartId="195" EndId="197" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="0">
</Transition>
<Transition StartId="198" EndId="199" type="3">
</Transition>
<Transition StartId="198" EndId="200" type="4">
</Transition>
<Transition StartId="199" EndId="292" type="6">
</Transition>
<Transition StartId="199" EndId="201" type="0">
</Transition>
<Transition StartId="200" EndId="199" type="0">
</Transition>
<Transition StartId="201" EndId="292" type="0">
</Transition>
<Transition StartId="202" EndId="2" type="0">
</Transition>
<Transition StartId="203" EndId="303" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="206" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="214" type="0">
</Transition>
<Transition StartId="213" EndId="218" type="0">
</Transition>
<Transition StartId="214" EndId="213" type="1">
<Expression>C131_GATEWAY_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="214" EndId="218" type="0">
</Transition>
<Transition StartId="215" EndId="217" type="0">
</Transition>
<Transition StartId="217" EndId="220" type="0">
</Transition>
<Transition StartId="218" EndId="215" type="1">
<Expression>C131_GATEWAY_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="218" EndId="220" type="0">
</Transition>
<Transition StartId="219" EndId="229" type="1">
<Expression>C131_GATEWAY_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="219" EndId="240" type="0">
</Transition>
<Transition StartId="220" EndId="221" type="1">
<Expression>C131_GATEWAY_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="220" EndId="219" type="0">
</Transition>
<Transition StartId="221" EndId="247" type="0">
</Transition>
<Transition StartId="229" EndId="231" type="0">
</Transition>
<Transition StartId="231" EndId="240" type="0">
</Transition>
<Transition StartId="236" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="349" type="0">
</Transition>
<Transition StartId="240" EndId="236" type="1">
<Expression>C131_GATEWAY_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="240" EndId="348" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="356" type="1">
<Expression>DString_C131_Car_Tpye=="CH1AM31" or DString_C131_Car_Tpye=="CH1AM32" or DString_C131_Car_Tpye=="CH1CM26" or DString_C131_Car_Tpye=="CH1CM27" or DString_C131_Car_Tpye=="CH1GM11" or DString_C131_Car_Tpye=="CH1GM12" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1BM33"</Expression></Transition>
<Transition StartId="242" EndId="256" type="0">
</Transition>
<Transition StartId="243" EndId="253" type="0">
</Transition>
<Transition StartId="245" EndId="243" type="0">
</Transition>
<Transition StartId="246" EndId="241" type="1">
<Expression>C131_GATEWAY_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="246" EndId="256" type="0">
</Transition>
<Transition StartId="247" EndId="219" type="0">
</Transition>
<Transition StartId="248" EndId="365" type="0">
</Transition>
<Transition StartId="249" EndId="321" type="0">
</Transition>
<Transition StartId="250" EndId="310" type="0">
</Transition>
<Transition StartId="252" EndId="249" type="0">
</Transition>
<Transition StartId="253" EndId="259" type="1">
<Expression>(DString_C131_HorLConfig ~= "" and DString_C131_HorLConfig~="GW000_horlconfig") and (C131_GATEWAY_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="253" EndId="320" type="0">
</Transition>
<Transition StartId="256" EndId="245" type="1">
<Expression>C131_GATEWAY_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="256" EndId="253" type="0">
</Transition>
<Transition StartId="259" EndId="312" type="0">
</Transition>
<Transition StartId="260" EndId="313" type="0">
</Transition>
<Transition StartId="262" EndId="317" type="0">
</Transition>
<Transition StartId="263" EndId="265" type="0">
</Transition>
<Transition StartId="263" EndId="319" type="1">
<Expression>VMTLOC=="FIN"</Expression></Transition>
<Transition StartId="264" EndId="315" type="0">
</Transition>
<Transition StartId="265" EndId="248" type="0">
</Transition>
<Transition StartId="266" EndId="271" type="1">
<Expression>C131_GATEWAY_Heating_Check_Execute_Flag==true</Expression></Transition>
<Transition StartId="266" EndId="99" type="0">
</Transition>
<Transition StartId="267" EndId="273" type="0">
</Transition>
<Transition StartId="267" EndId="40" type="1">
<Expression>C131_GATEWAY_Current_Range_Execute_Flag==true</Expression></Transition>
<Transition StartId="269" EndId="141" type="0">
</Transition>
<Transition StartId="271" EndId="267" type="1">
<Expression>DString_C131_Car_Tpye ~= "CH1GM11"</Expression></Transition>
<Transition StartId="271" EndId="272" type="0">
</Transition>
<Transition StartId="272" EndId="340" type="0">
</Transition>
<Transition StartId="273" EndId="341" type="0">
</Transition>
<Transition StartId="274" EndId="352" type="0">
</Transition>
<Transition StartId="275" EndId="89" type="0">
</Transition>
<Transition StartId="276" EndId="266" type="0">
</Transition>
<Transition StartId="277" EndId="126" type="0">
</Transition>
<Transition StartId="278" EndId="156" type="0">
</Transition>
<Transition StartId="279" EndId="169" type="0">
</Transition>
<Transition StartId="281" EndId="344" type="0">
</Transition>
<Transition StartId="282" EndId="292" type="0">
</Transition>
<Transition StartId="284" EndId="289" type="3">
</Transition>
<Transition StartId="284" EndId="286" type="4">
</Transition>
<Transition StartId="285" EndId="290" type="3">
</Transition>
<Transition StartId="285" EndId="287" type="4">
</Transition>
<Transition StartId="286" EndId="289" type="0">
</Transition>
<Transition StartId="287" EndId="290" type="0">
</Transition>
<Transition StartId="288" EndId="284" type="0">
</Transition>
<Transition StartId="289" EndId="285" type="0">
</Transition>
<Transition StartId="290" EndId="291" type="0">
</Transition>
<Transition StartId="290" EndId="104" type="6">
</Transition>
<Transition StartId="291" EndId="104" type="0">
</Transition>
<Transition StartId="292" EndId="301" type="1">
<Expression>C131_GATEWAY_EBS_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="292" EndId="302" type="0">
</Transition>
<Transition StartId="294" EndId="296" type="3">
</Transition>
<Transition StartId="294" EndId="295" type="4">
</Transition>
<Transition StartId="295" EndId="296" type="0">
</Transition>
<Transition StartId="296" EndId="297" type="0">
</Transition>
<Transition StartId="297" EndId="299" type="4">
</Transition>
<Transition StartId="297" EndId="298" type="3">
</Transition>
<Transition StartId="298" EndId="202" type="6">
</Transition>
<Transition StartId="298" EndId="300" type="0">
</Transition>
<Transition StartId="299" EndId="298" type="0">
</Transition>
<Transition StartId="300" EndId="202" type="0">
</Transition>
<Transition StartId="301" EndId="294" type="3">
</Transition>
<Transition StartId="301" EndId="302" type="4">
</Transition>
<Transition StartId="302" EndId="202" type="0">
</Transition>
<Transition StartId="303" EndId="4" type="3">
</Transition>
<Transition StartId="303" EndId="304" type="4">
</Transition>
<Transition StartId="304" EndId="306" type="0">
</Transition>
<Transition StartId="304" EndId="305" type="5">
</Transition>
<Transition StartId="305" EndId="202" type="0">
</Transition>
<Transition StartId="306" EndId="203" type="0">
</Transition>
<Transition StartId="307" EndId="322" type="0">
</Transition>
<Transition StartId="308" EndId="333" type="0">
</Transition>
<Transition StartId="309" EndId="307" type="0">
</Transition>
<Transition StartId="310" EndId="309" type="1">
<Expression>(DString_C131_BattConfig ~= "") and DString_C131_BattConfig~="GW000_battconfig" and DString_C131_BattConfig~="DString_C131_BattConfig_GATEWAY" and (C131_GATEWAY_Batt_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="310" EndId="322" type="0">
</Transition>
<Transition StartId="311" EndId="360" type="0">
</Transition>
<Transition StartId="312" EndId="320" type="0">
</Transition>
<Transition StartId="313" EndId="321" type="0">
</Transition>
<Transition StartId="313" EndId="252" type="1">
<Expression>(DString_C131_VariCoding ~= "" and DString_C131_VariCoding~="GW000_varicoding") and (C131_GATEWAY_WD_Execute_Flag == true) and VMTLOC~="RIN" and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="314" EndId="315" type="0">
</Transition>
<Transition StartId="315" EndId="262" type="1">
<Expression>DString_C131_VariCoding ~= "" and DString_C131_VariCoding~="GW000_varicoding" and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="315" EndId="316" type="0">
</Transition>
<Transition StartId="316" EndId="317" type="0">
</Transition>
<Transition StartId="317" EndId="311" type="1">
<Expression>DString_C131_BattConfig ~= "" and DString_C131_BattConfig~="GW000_battconfig" and DString_C131_BattConfig~="DString_C131_BattCoding_GATEWAY"</Expression></Transition>
<Transition StartId="317" EndId="318" type="0">
</Transition>
<Transition StartId="318" EndId="360" type="0">
</Transition>
<Transition StartId="319" EndId="264" type="1">
<Expression>DString_C131_HorLConfig ~= "" and DString_C131_HorLConfig~="GW000_horlconfig"</Expression></Transition>
<Transition StartId="319" EndId="314" type="0">
</Transition>
<Transition StartId="320" EndId="260" type="1">
<Expression>(DString_C131_HorLConfig ~= "" and DString_C131_HorLConfig~="GW000_horlconfig") and (C131_GATEWAY_WD_Execute_Flag == true  or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="320" EndId="313" type="0">
</Transition>
<Transition StartId="321" EndId="250" type="1">
<Expression>(DString_C131_VariCoding ~= "" and DString_C131_VariCoding~="GW000_varicoding") and (C131_GATEWAY_WD_Execute_Flag == true or VMTLOC=="FIN") and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="321" EndId="310" type="0">
</Transition>
<Transition StartId="322" EndId="308" type="1">
<Expression>(DString_C131_BattConfig ~= "") and DString_C131_BattConfig~="GW000_battconfig" and DString_C131_BattConfig~="DString_C131_BattCoding_GATEWAY" and (C131_GATEWAY_Batt_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="322" EndId="333" type="0">
</Transition>
<Transition StartId="331" EndId="263" type="0">
</Transition>
<Transition StartId="333" EndId="334" type="0">
</Transition>
<Transition StartId="333" EndId="335" type="1">
<Expression>(DString_C131_DVDConfig ~= "") and DString_C131_DVDConfig~="GW000_dvdconfig" and DString_C131_DVDConfig~="DString_C131_DVDConfig_GATEWAY" and (C131_GATEWAY_Batt_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="334" EndId="263" type="0">
</Transition>
<Transition StartId="334" EndId="331" type="1">
<Expression>(DString_C131_DVDConfig ~= "") and DString_C131_DVDConfig~="GW000_dvdconfig" and DString_C131_DVDConfig~="DString_C131_DVDConfig_GATEWAY" and (C131_GATEWAY_Batt_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="335" EndId="337" type="0">
</Transition>
<Transition StartId="337" EndId="334" type="0">
</Transition>
<Transition StartId="339" EndId="111" type="0">
</Transition>
<Transition StartId="340" EndId="75" type="0">
</Transition>
<Transition StartId="341" EndId="104" type="0">
</Transition>
<Transition StartId="342" EndId="169" type="0">
</Transition>
<Transition StartId="343" EndId="344" type="0">
</Transition>
<Transition StartId="344" EndId="292" type="0">
</Transition>
<Transition StartId="345" EndId="346" type="0">
</Transition>
<Transition StartId="346" EndId="347" type="0">
</Transition>
<Transition StartId="347" EndId="349" type="0">
</Transition>
<Transition StartId="348" EndId="364" type="0">
</Transition>
<Transition StartId="348" EndId="345" type="1">
<Expression>C131_GATEWAY_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="349" EndId="246" type="0">
</Transition>
<Transition StartId="351" EndId="114" type="1">
<Expression>(C131_GATEWAY_Heating_Check_Execute_Flag ==true) and (DString_C131_dif_config_ARMREST == "2") and (C131_GATEWAY_Current_Range_Execute_Flag == true)</Expression></Transition>
<Transition StartId="351" EndId="279" type="0">
</Transition>
<Transition StartId="352" EndId="14" type="1">
<Expression>DString_C131_Car_Tpye~="CH1LM21" and DString_C131_Car_Tpye~="CH1LM11" and DString_C131_Car_Tpye~="CH1MM21" and LibGeneral.CarTNC_Isnot_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="352" EndId="353" type="0">
</Transition>
<Transition StartId="353" EndId="266" type="0">
</Transition>
<Transition StartId="354" EndId="355" type="0">
</Transition>
<Transition StartId="355" EndId="202" type="0">
</Transition>
<Transition StartId="356" EndId="357" type="0">
</Transition>
<Transition StartId="357" EndId="256" type="0">
</Transition>
<Transition StartId="358" EndId="359" type="0">
</Transition>
<Transition StartId="359" EndId="265" type="0">
</Transition>
<Transition StartId="360" EndId="358" type="1">
<Expression>(DString_C131_DVDConfig ~= "") and DString_C131_DVDConfig~="GW000_dvdconfig" and DString_C131_DVDConfig~="DString_C131_DVDConfig_GATEWAY"</Expression></Transition>
<Transition StartId="360" EndId="359" type="0">
</Transition>
<Transition StartId="361" EndId="362" type="0">
</Transition>
<Transition StartId="362" EndId="363" type="0">
</Transition>
<Transition StartId="363" EndId="349" type="0">
</Transition>
<Transition StartId="364" EndId="361" type="1">
<Expression>C131_GATEWAY_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="364" EndId="246" type="0">
</Transition>
<Transition StartId="365" EndId="10" type="0">
</Transition>
<Transition StartId="366" EndId="109" type="0">
</Transition>
</Transitions>
</Process>

