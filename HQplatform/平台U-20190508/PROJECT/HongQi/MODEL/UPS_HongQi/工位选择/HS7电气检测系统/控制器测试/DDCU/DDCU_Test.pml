<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x754" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x75C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="160" right="260" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="440" top="914" right="540" bottom="946"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="160" top="64" right="260" bottom="96"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="20" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="安全访问请求seed">
<Rect left="160" top="274" right="260" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="22" name="DEP111" type="8" flags="97"/>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="发送key">
<Rect left="160" top="434" right="260" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
#COMMEX vciHandle -1 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="21" name="DEP112" type="8" flags="97"/>
</Activity>
<Activity id="871" ActivityType="13" flags="0" name="计算key">
<Rect left="160" top="354" right="260" bottom="386"/>
<FunctionRef id="sec_general">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x30530264"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="872" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="160" top="194" right="260" bottom="226"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="873" ActivityType="13" flags="1" name="Turn on  the front left door light">
<Rect left="160" top="514" right="260" bottom="546"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开左前门灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x63\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="874" ActivityType="3" flags="0" name="读取状态">
<Rect left="160" top="594" right="260" bottom="626"/>
<Script>engine.Delay(1000)
#COMMEX vciHandle -1 0x22 "\x3C\xE7"
recvTel = @3-;
if(engine.LastError == 0 ) then
if(tonumber(LibGeneral.hex2str(recvTel),16) == 1) then 
engine.SetLineText(1,"#L=门灯状态".."#R=点亮")
else
engine.SetLineText(1,"#L=门灯状态".."#R=为点亮")
end
else
engine.SetLineText(1,"#L=门灯状态读取失败".."#R=bmpnok")
end</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="23" name="DEP2053" type="8" flags="97"/>
</Activity>
<Activity id="875" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="160" top="674" right="260" bottom="706"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x63\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="877" ActivityType="13" flags="0" name="Turn off  the front left door light">
<Rect left="160" top="754" right="260" bottom="786"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动关闭左前门灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x63\x03\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="878" ActivityType="3" flags="0" name="读取状态">
<Rect left="160" top="834" right="260" bottom="866"/>
<Script>engine.Delay(1000)
#COMMEX vciHandle -1 0x22 "\x3C\xE7"
recvTel = @3-;
if(engine.LastError == 0 ) then
if(tonumber(LibGeneral.hex2str(recvTel),16) == 0) then 
engine.SetLineText(1,"#L=门灯状态".."#R=关闭")
else
engine.SetLineText(1,"#L=门灯状态".."#R=未关闭")
end
else
engine.SetLineText(1,"#L=门灯状态读取失败".."#R=bmpnok")
end</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="24" name="DEP2053" type="8" flags="97"/>
</Activity>
<Activity id="879" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="160" top="914" right="260" bottom="946"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x63\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="880" ActivityType="4" flags="0" name="路由节点">
<Rect left="314" top="914" right="346" bottom="946"/>
</Activity>
<Activity id="881" ActivityType="4" flags="0" name="路由节点">
<Rect left="314" top="154" right="346" bottom="186"/>
</Activity>
<Activity id="882" ActivityType="13" flags="0" name="Driver window up">
<Rect left="970" top="384" right="1070" bottom="416"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="门窗自动上升"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x01&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="883" ActivityType="3" flags="0" name="普通节点">
<Rect left="970" top="464" right="1070" bottom="496"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xE1"
if(engine.LastError == 0 ) then 
   recvTle =  @3;
   if(recvTle == 0x05 ) then 
    engine.LastError = 0;
    engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpok")
   else
     engine.LastError = 1;
     engine.TestResult = 1;
    engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpnok")
    
   end 
else 
engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpnok")
end 
engine.StatValue = @0-;</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="25" name="DEP574" type="8" flags="97"/>
</Activity>
<Activity id="884" ActivityType="13" flags="0" name="Driver window up">
<Rect left="440" top="154" right="540" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="门窗自动下降"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x03\x02&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="885" ActivityType="3" flags="0" name="普通节点">
<Rect left="440" top="234" right="540" bottom="266"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xE1"
if(engine.LastError == 0 ) then 
   recvTle =  @3;
   if(recvTle == 0x06) then 
    engine.LastError = 0;
    engine.SetLineText(1,"#L=门窗下升状态".."#R=bmpok")
   else
     engine.LastError = 1;
     engine.TestResult = 1;
    engine.SetLineText(1,"#L=门窗下升状态".."#R=bmpnok")
    
   end 
else 
engine.SetLineText(1,"#L=门窗下降状态".."#R=bmpnok")
end 
engine.StatValue = @0-;</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="26" name="DEP573" type="8" flags="97"/>
</Activity>
<Activity id="886" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="970" top="544" right="1070" bottom="576"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="888" ActivityType="3" flags="0" name="Check central lock">
<Rect left="440" top="604" right="540" bottom="636"/>
<Strategy TotalTime="195" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(1,"按下中控锁开关上锁")
#COMMEX vciHandle -1 0x22 "\x3C\xE8"
recvTel = @3-;
if(engine.LastError == 0 ) then
if(tonumber(LibGeneral.hex2str(recvTel),16) == 1) then 
engine.SetLineText(2,"#L=中控锁开关".."#R=上锁")
engine.LastError = 0 
else
engine.SetLineText(2,"#L=中控锁开关".."#R=未锁")
engine.LastError = 1
end
else
engine.SetLineText(2,"#L=中控锁开关读取失败".."#R=bmpnok")
end</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="27" name="DEP2149" type="8" flags="97"/>
</Activity>
<Activity id="889" ActivityType="3" flags="0" name="Check central lock">
<Rect left="440" top="684" right="540" bottom="716"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(1,"按下中控锁开关解锁")
#COMMEX vciHandle -1 0x22 "\x3C\xE8"
recvTel = @3-;
if(engine.LastError == 0 ) then
if(tonumber(LibGeneral.hex2str(recvTel),16) == 2) then 
engine.SetLineText(2,"#L=中控锁开关".."#R=解锁")
engine.LastError = 0 
else
engine.SetLineText(2,"#L=中控锁开关".."#R=未解锁")
engine.LastError = 1
end
else
engine.SetLineText(2,"#L=中控锁开关读取失败".."#R=bmpnok")
end</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="28" name="DEP2150" type="8" flags="97"/>
</Activity>
<Activity id="890" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="440" top="754" right="540" bottom="786"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="892" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="440" top="304" right="540" bottom="336"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x61\x00&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="手动自学习">
<Rect left="590" top="834" right="690" bottom="866"/>
<Line1Text Enable="1" Text="向上拉住开关并保持，直至玻璃"/>
<Line2Text Enable="1" Text="#L=自动完成上升、下降、再上升的循环#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=自动完成上升、下降、再上升的循环#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="29" name="DEP1116" type="8" flags="97"/>
</Activity>
<Activity id="895" ActivityType="3" flags="0" name="普通节点">
<Rect left="1170" top="164" right="1270" bottom="196"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 "\x01\x11"
if(engine.LastError == 0 ) then 
   recvTle =  @3;
   if(recvTle == 0x06) then 
    engine.LastError = 0;
    engine.SetLineText(1,"#L=门窗下升状态".."#R=bmpok")
   else
     engine.LastError = 1;
     engine.TestResult = 1;
    engine.SetLineText(1,"#L=门窗下升状态".."#R=bmpnok")
    
   end 
else 
engine.SetLineText(1,"#L=门窗下降状态".."#R=bmpnok")
end 
engine.StatValue = @0-;</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="26" name="DEP573" type="8" flags="97"/>
</Activity>
<Activity id="896" ActivityType="3" flags="0" name="普通节点">
<Rect left="1300" top="174" right="1400" bottom="206"/>
<Strategy TotalTime="50" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 "\x01\x11"
if(engine.LastError == 0 ) then 
   recvTle =  @3;
   if(recvTle == 0x05 ) then 
    engine.LastError = 0;
    engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpok")
   else
     engine.LastError = 1;
     engine.TestResult = 1;
    engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpnok")
    
   end 
else 
engine.SetLineText(1,"#L=门窗上升状态".."#R=bmpnok")
end 
engine.StatValue = @0-;</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="25" name="DEP574" type="8" flags="97"/>
</Activity>
<Activity id="897" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="124" right="130" bottom="156"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="898" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="30" top="64" right="130" bottom="96"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="994" right="96" bottom="1026"/>
</Activity>
<Activity id="900" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="994" right="416" bottom="1026"/>
</Activity>
<Activity id="901" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="754" right="416" bottom="786"/>
</Activity>
<Activity id="902" ActivityType="3" flags="0" name="通讯">
<Rect left="160" top="124" right="260" bottom="156"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
      engine.StatValue="通讯失败";
end
</Script><assessment block="1" ptbtext="DEP164" group="3020" pbltext="DEP107" no="1" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="903" ActivityType="3" flags="0" name="开始检测确认">
<Rect left="440" top="504" right="540" bottom="536"/>
<Line2Text Enable="1" Text="即将开始中控锁开关检测，请确认"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="902" type="0">
</Transition>
<Transition StartId="4" EndId="871" type="0">
</Transition>
<Transition StartId="870" EndId="873" type="0">
</Transition>
<Transition StartId="871" EndId="870" type="0">
</Transition>
<Transition StartId="872" EndId="4" type="0">
</Transition>
<Transition StartId="873" EndId="874" type="0">
</Transition>
<Transition StartId="874" EndId="875" type="0">
</Transition>
<Transition StartId="875" EndId="877" type="0">
</Transition>
<Transition StartId="877" EndId="878" type="0">
</Transition>
<Transition StartId="878" EndId="879" type="0">
</Transition>
<Transition StartId="879" EndId="880" type="0">
</Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="881" EndId="884" type="0">
</Transition>
<Transition StartId="882" EndId="883" type="0">
</Transition>
<Transition StartId="883" EndId="886" type="0">
</Transition>
<Transition StartId="884" EndId="885" type="0">
</Transition>
<Transition StartId="885" EndId="892" type="0">
</Transition>
<Transition StartId="888" EndId="889" type="0">
</Transition>
<Transition StartId="889" EndId="890" type="0">
</Transition>
<Transition StartId="890" EndId="2" type="0">
</Transition>
<Transition StartId="892" EndId="903" type="0">
</Transition>
<Transition StartId="894" EndId="2" type="0">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="897" EndId="899" type="5">
</Transition>
<Transition StartId="898" EndId="3" type="0">
</Transition>
<Transition StartId="899" EndId="900" type="0">
</Transition>
<Transition StartId="900" EndId="901" type="0">
</Transition>
<Transition StartId="901" EndId="890" type="0">
</Transition>
<Transition StartId="902" EndId="897" type="4">
</Transition>
<Transition StartId="902" EndId="872" type="0">
</Transition>
<Transition StartId="903" EndId="888" type="0">
</Transition>
</Transitions>
</Process>

