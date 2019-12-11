<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" top="4" right="310" bottom="36"/>
<Script>#PRESSBUTTON</Script><TitleText Enable="1" Text="PEPS智能锁检测"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="拿着钥匙在车外，完全关闭4个车门"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确认"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1460" top="264" right="1560" bottom="296"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="210" top="74" right="310" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="13" flags="0" name="打开扩展会话">
<Rect left="210" top="154" right="310" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="13" flags="0" name="安全访问">
<Rect left="210" top="234" right="310" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1460" top="184" right="1560" bottom="216"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="558" ActivityType="3" flags="0" name="锁定4个车门，准备测试">
<Rect left="1030" top="14" right="1130" bottom="46"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="确认4个车门已锁定"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃测试"/>
<ButtonRText Enable="1" Text="开始测试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="559" ActivityType="3" flags="0" name="PEPS 司机门完全关闭">
<Rect left="210" top="304" right="310" bottom="336"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1b") 
if (recvTel:byte(4)==0x00) then
 engine.LastError = 0;
 engine.SetLineText(1,"#L=左前车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(1,"#L=左前车门关闭".."#R=bmpnok")
end
--engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="22" name="DEP726" type="8" flags="97"/>
</Activity>
<Activity id="560" ActivityType="3" flags="0" name="PEPS副驾驶门完全关闭">
<Rect left="210" top="384" right="310" bottom="416"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x22") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(1,"#L=右前车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(1,"#L=右前车门关闭".."#R=bmpnok")
end
--engine.SetLineText(3,recvTel:byte(4));
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="23" name="DEP727" type="8" flags="97"/>
</Activity>
<Activity id="561" ActivityType="3" flags="0" name="PEPS 左后门完全关闭">
<Rect left="210" top="464" right="310" bottom="496"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x25") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(1,"#L=左后车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(1,"#L=左后车门关闭".."#R=bmpnok")
end
--engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="24" name="DEP728" type="8" flags="97"/>
</Activity>
<Activity id="562" ActivityType="3" flags="0" name="PEPS 右后门完全关闭">
<Rect left="210" top="544" right="310" bottom="576"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x28") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
     engine.SetLineText(1,"#L=右后车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(1,"#L=右后车门关闭".."#R=bmpok")
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="25" name="DEP729" type="8" flags="97"/>
</Activity>
<Activity id="581" ActivityType="3" flags="0" name="PEPS 司机门上锁">
<Rect left="1030" top="94" right="1130" bottom="126"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下左前门智能锁开关上锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x03") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="582" ActivityType="3" flags="0" name="PEPS 乘客门上锁">
<Rect left="1250" top="14" right="1350" bottom="46"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下右前门智能锁开关上锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x05") 
if (recvTel:byte(4)==0x01) then
 engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="583" ActivityType="3" flags="0" name="PEPS 左后门上锁">
<Rect left="1030" top="234" right="1130" bottom="266"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下左后门智能锁开关上锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x04") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="584" ActivityType="3" flags="0" name="PEPS 右后门上锁">
<Rect left="1030" top="384" right="1130" bottom="416"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下右后门智能锁开关上锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x06") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="585" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1030" top="164" right="1130" bottom="196"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1A") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(1,"#L=左前车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(1,"#L=左前车门锁定".."#R=bmpnok")
end
--engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="26" name="DEP730" type="8" flags="97"/>
</Activity>
<Activity id="586" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1030" top="314" right="1130" bottom="346"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x23") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=左后车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=左后车门锁定".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="587" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1030" top="474" right="1130" bottom="506"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x26") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右后车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右后车门锁定".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="588" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1250" top="84" right="1350" bottom="116"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右前车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右前车门锁定".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="589" ActivityType="3" flags="0" name="PEPS 副驾驶门解锁">
<Rect left="1250" top="164" right="1350" bottom="196"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="触碰右前门传感器解锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x09") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="590" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1250" top="234" right="1350" bottom="266"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右前车门解锁".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右前车门解锁".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="591" ActivityType="3" flags="0" name="PEPS 右后门解锁">
<Rect left="1250" top="314" right="1350" bottom="346"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="触碰右后门传感器解锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x0A") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="592" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1250" top="384" right="1350" bottom="416"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x26") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右后车门解锁".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右后车门解锁".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="593" ActivityType="3" flags="0" name="PEPS 左后门解锁">
<Rect left="1250" top="464" right="1350" bottom="496"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="触碰左后门传感器解锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x08") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="594" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1250" top="544" right="1350" bottom="576"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=左后车门解锁".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=左后车门解锁".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="595" ActivityType="3" flags="0" name="PEPS 左前门解锁">
<Rect left="1460" top="14" right="1560" bottom="46"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="触碰左前门传感器解锁"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x07") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="596" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="1460" top="94" right="1560" bottom="126"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1A") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=左前车门解锁".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=左前车门解锁".."#R=bmpnok")
end
-- engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(1000)</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="559" type="0">
</Transition>
<Transition StartId="13" EndId="2" type="0">
</Transition>
<Transition StartId="558" EndId="581" type="0">
</Transition>
<Transition StartId="559" EndId="560" type="0">
</Transition>
<Transition StartId="560" EndId="561" type="0">
</Transition>
<Transition StartId="561" EndId="562" type="0">
</Transition>
<Transition StartId="562" EndId="558" type="0">
</Transition>
<Transition StartId="581" EndId="585" type="0">
</Transition>
<Transition StartId="582" EndId="588" type="0">
</Transition>
<Transition StartId="583" EndId="586" type="0">
</Transition>
<Transition StartId="584" EndId="587" type="0">
</Transition>
<Transition StartId="585" EndId="583" type="0">
</Transition>
<Transition StartId="586" EndId="584" type="0">
</Transition>
<Transition StartId="587" EndId="582" type="0">
</Transition>
<Transition StartId="588" EndId="589" type="0">
</Transition>
<Transition StartId="589" EndId="590" type="0">
</Transition>
<Transition StartId="590" EndId="591" type="0">
</Transition>
<Transition StartId="591" EndId="592" type="0">
</Transition>
<Transition StartId="592" EndId="593" type="0">
</Transition>
<Transition StartId="593" EndId="594" type="0">
</Transition>
<Transition StartId="594" EndId="595" type="0">
</Transition>
<Transition StartId="595" EndId="596" type="0">
</Transition>
<Transition StartId="596" EndId="13" type="0">
</Transition>
</Transitions>
</Process>

