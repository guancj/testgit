<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1062" pbltext="DEP1214">
<Parameters>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="C131_HCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_HCU_PowerOff_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_ReO_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_IGBT_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_MG_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Read_BMS_Info_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Warm_Water_Pump_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_LT_E_Water_Pump_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Open_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Close_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_SPEC_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Motor_Urgency_Control_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_Check_Battery_Urgency_Control_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_ActiveTransport_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_HCU_InactiveTransport_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="spec_data" type="8" dir="0" data="spec_data"/>
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
<Variable id="CAN_RCV_ID" type="3" data="0X7EB" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="580" top="10" right="680" bottom="42"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="585" top="467" right="685" bottom="499"/>
<Script>#STOPCOMM
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="混动控制系统">
<Rect left="581" top="56" right="681" bottom="88"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Script>engine.println("SPEC_DATA:"..spec_data);</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="连接ECU">
<Rect left="582" top="106" right="682" bottom="138"/>
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
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="切诊断">
<Rect left="583" top="212" right="683" bottom="244"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1106" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="584" top="418" right="684" bottom="450"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="通讯">
<Rect left="582" top="157" right="682" bottom="189"/>
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
engine.StatValue=hexstr(StringRes);</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="通讯失败">
<Rect left="468" top="156" right="568" bottom="188"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！刷写失败"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="结束通讯">
<Rect left="467" top="105" right="567" bottom="137"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="501" top="417" right="533" bottom="449"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="584" top="268" right="684" bottom="300"/>
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
<Activity id="155" ActivityType="3" flags="0" name="刷写成功">
<Rect left="583" top="331" right="683" bottom="363"/>
<Line1Text Enable="1" Text="刷写成功，版本正确，退出请按确定"/>
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
<Activity id="156" ActivityType="3" flags="0" name="刷写失败">
<Rect left="710" top="269" right="810" bottom="301"/>
<Line1Text Enable="1" Text="刷写成功，版本不正确，退出请按确定"/>
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
end</Script><assessment no="1" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="157" ActivityType="3" flags="0" name="检测OBD">
<Rect left="467" top="61" right="567" bottom="93"/>
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
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="157" type="0">
</Transition>
<Transition StartId="5" EndId="115" type="0">
</Transition>
<Transition StartId="6" EndId="152" type="0">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="115" EndId="6" type="3">
</Transition>
<Transition StartId="115" EndId="116" type="4">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="116" EndId="131" type="5">
</Transition>
<Transition StartId="117" EndId="5" type="0">
</Transition>
<Transition StartId="131" EndId="36" type="0">
</Transition>
<Transition StartId="152" EndId="155" type="3">
</Transition>
<Transition StartId="152" EndId="156" type="4">
</Transition>
<Transition StartId="155" EndId="36" type="0">
</Transition>
<Transition StartId="156" EndId="36" type="0">
</Transition>
<Transition StartId="157" EndId="5" type="0">
</Transition>
</Transitions>
</Process>

