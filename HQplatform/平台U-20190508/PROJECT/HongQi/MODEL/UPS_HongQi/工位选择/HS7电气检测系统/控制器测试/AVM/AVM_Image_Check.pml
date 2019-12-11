<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="140" top="4" right="240" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="600" top="634" right="700" bottom="666"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="切诊断">
<Rect left="140" top="74" right="240" bottom="106"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换扩展模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="27" name="DEP1696" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="140" top="134" right="240" bottom="166"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="计算">
<Rect left="140" top="204" right="240" bottom="236"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xEC20BE31"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="发送key">
<Rect left="140" top="264" right="240" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送key"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
  StringRes = @0-;
  engine.StatValue=hexstr(StringRes);
else
  engine.LastError = 1;
  StringRes = @0-;
  engine.StatValue=hexstr(StringRes);
  return "";
end
--local StringRes;
--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
--engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="28" name="DEP1698" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="Turn on Top view">
<Rect left="140" top="334" right="240" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景影像"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x01\x01&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="140" top="474" right="240" bottom="506"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x01) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="29" name="DEP2142" type="8" flags="97"/>
</Activity>
<Activity id="1222" ActivityType="13" flags="0" name="Turn on Top view + Front view">
<Rect left="370" top="74" right="470" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景前摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x02\x02&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1223" ActivityType="3" flags="1" name="AVM View change status">
<Rect left="370" top="194" right="470" bottom="226"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x02) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="30" name="DEP2143" type="8" flags="97"/>
</Activity>
<Activity id="1224" ActivityType="13" flags="0" name="Turn on Top view + Rear view">
<Rect left="370" top="254" right="470" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景后摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x03\x03&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1225" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="370" top="374" right="470" bottom="406"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x03) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="31" name="DEP2144" type="8" flags="97"/>
</Activity>
<Activity id="1226" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="474" right="306" bottom="506"/>
</Activity>
<Activity id="1227" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="74" right="306" bottom="106"/>
</Activity>
<Activity id="1228" ActivityType="13" flags="0" name="Turn on Top view + Left view">
<Rect left="370" top="434" right="470" bottom="466"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景左侧摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x04\x04&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1229" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="370" top="534" right="470" bottom="566"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x04) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="32" name="DEP2145" type="8" flags="97"/>
</Activity>
<Activity id="1230" ActivityType="13" flags="0" name="Turn on Top view + Right view">
<Rect left="600" top="74" right="700" bottom="106"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景右侧摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x05\x05&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="600" top="184" right="700" bottom="216"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x05) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="33" name="DEP2146" type="8" flags="97"/>
</Activity>
<Activity id="1232" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="534" right="546" bottom="566"/>
</Activity>
<Activity id="1233" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="74" right="546" bottom="106"/>
</Activity>
<Activity id="1234" ActivityType="13" flags="0" name="Turn on Front wide view">
<Rect left="600" top="244" right="700" bottom="276"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景前方摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x06\x06&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1235" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="600" top="354" right="700" bottom="386"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x06) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="34" name="DEP2147" type="8" flags="97"/>
</Activity>
<Activity id="1236" ActivityType="13" flags="0" name="Turn on Rear wide view">
<Rect left="600" top="414" right="700" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开全景后方摄像头"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x03\x07\x07&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1237" ActivityType="3" flags="0" name="AVM View change status">
<Rect left="600" top="524" right="700" bottom="556"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>engine.SetLineText(1,"读取AVM状态")
#COMMEX vciHandle -1 0x22 "\x2B\x10"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x07) then 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=AVM变换状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3014" pbltext="DEP1693" no="35" name="DEP2148" type="8" flags="97"/>
</Activity>
<Activity id="1238" ActivityType="13" flags="0" name="Turn on Rear wide view">
<Rect left="600" top="574" right="700" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xC0\xC0\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1239" ActivityType="3" flags="0" name="延时3S">
<Rect left="140" top="404" right="240" bottom="436"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1240" ActivityType="3" flags="0" name="延时3S">
<Rect left="370" top="134" right="470" bottom="166"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1241" ActivityType="3" flags="0" name="延时3S">
<Rect left="370" top="314" right="470" bottom="346"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1242" ActivityType="3" flags="0" name="延时3S">
<Rect left="370" top="484" right="470" bottom="516"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1243" ActivityType="3" flags="0" name="延时3S">
<Rect left="600" top="134" right="700" bottom="166"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1244" ActivityType="3" flags="0" name="延时3S">
<Rect left="600" top="294" right="700" bottom="326"/>
<Script>engine.Delay(1000)</Script></Activity>
<Activity id="1245" ActivityType="3" flags="0" name="延时3S">
<Rect left="600" top="464" right="700" bottom="496"/>
<Script>engine.Delay(1000)</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="1239" type="0">
</Transition>
<Transition StartId="13" EndId="1226" type="0">
</Transition>
<Transition StartId="1222" EndId="1240" type="0">
</Transition>
<Transition StartId="1223" EndId="1224" type="0">
</Transition>
<Transition StartId="1224" EndId="1241" type="0">
</Transition>
<Transition StartId="1225" EndId="1228" type="0">
</Transition>
<Transition StartId="1226" EndId="1227" type="0">
</Transition>
<Transition StartId="1227" EndId="1222" type="0">
</Transition>
<Transition StartId="1228" EndId="1242" type="0">
</Transition>
<Transition StartId="1229" EndId="1232" type="0">
</Transition>
<Transition StartId="1230" EndId="1243" type="0">
</Transition>
<Transition StartId="1231" EndId="1234" type="0">
</Transition>
<Transition StartId="1232" EndId="1233" type="0">
</Transition>
<Transition StartId="1233" EndId="1230" type="0">
</Transition>
<Transition StartId="1234" EndId="1244" type="0">
</Transition>
<Transition StartId="1235" EndId="1236" type="0">
</Transition>
<Transition StartId="1236" EndId="1245" type="0">
</Transition>
<Transition StartId="1237" EndId="1238" type="0">
</Transition>
<Transition StartId="1238" EndId="2" type="0">
</Transition>
<Transition StartId="1239" EndId="13" type="0">
</Transition>
<Transition StartId="1240" EndId="1223" type="0">
</Transition>
<Transition StartId="1241" EndId="1225" type="0">
</Transition>
<Transition StartId="1242" EndId="1229" type="0">
</Transition>
<Transition StartId="1243" EndId="1231" type="0">
</Transition>
<Transition StartId="1244" EndId="1235" type="0">
</Transition>
<Transition StartId="1245" EndId="1237" type="0">
</Transition>
</Transitions>
</Process>

