<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="230" top="34" right="330" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="230" top="954" right="330" bottom="986"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="SC longing control">
<Rect left="230" top="104" right="330" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动伸长"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x40\x03\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1231" ActivityType="3" flags="0" name="check the SC status">
<Rect left="230" top="184" right="330" bottom="216"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC7"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x03) then 
    engine.SetLineText(2,"#L=SCM伸长状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM伸长状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end 
else 
    engine.SetLineText(2,"#L=SCM伸长状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="25" name="DEP2151" type="8" flags="97"/>
</Activity>
<Activity id="1232" ActivityType="13" flags="0" name="SC Shorting control">
<Rect left="230" top="264" right="330" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动缩短"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x40\x03\x01&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1233" ActivityType="3" flags="0" name="check the SC status">
<Rect left="230" top="334" right="330" bottom="366"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC7"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x01) then 
    engine.SetLineText(2,"#L=SCM伸短状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM伸短状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end
else 
    engine.SetLineText(2,"#L=SCM伸短状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="26" name="DEP2152" type="8" flags="97"/>
</Activity>
<Activity id="1234" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="230" top="424" right="330" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x40\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1239" ActivityType="13" flags="0" name="SC downing control">
<Rect left="230" top="504" right="330" bottom="536"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动下倾"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x03\x01&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1240" ActivityType="3" flags="0" name="check the SC status">
<Rect left="230" top="584" right="330" bottom="616"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC6"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x04) then 
    engine.SetLineText(2,"#L=SCM下倾状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM下倾状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end 
else 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="28" name="DEP2154" type="8" flags="97"/>
</Activity>
<Activity id="1241" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="230" top="654" right="330" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1242" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="380" top="224" right="480" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x40\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1244" ActivityType="13" flags="0" name="SC uping control">
<Rect left="680" top="494" right="780" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动上倾"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x03\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1245" ActivityType="3" flags="0" name="check the SC status">
<Rect left="680" top="574" right="780" bottom="606"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC6"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x02) then 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end 
else 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="27" name="DEP2153" type="8" flags="97"/>
</Activity>
<Activity id="1246" ActivityType="13" flags="0" name="SC downing control">
<Rect left="680" top="644" right="780" bottom="676"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动下倾"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x03\x01&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1247" ActivityType="3" flags="0" name="check the SC status">
<Rect left="680" top="724" right="780" bottom="756"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC6"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x04) then 
    engine.SetLineText(2,"#L=SCM下倾状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM下倾状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end 
else 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="28" name="DEP2154" type="8" flags="97"/>
</Activity>
<Activity id="1248" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="680" top="794" right="780" bottom="826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1249" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="830" top="614" right="930" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1250" ActivityType="13" flags="0" name="SC uping control">
<Rect left="230" top="724" right="330" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="SCM自动上倾"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x03\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1251" ActivityType="3" flags="1" name="check the SC status">
<Rect left="230" top="804" right="330" bottom="836"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="15"/>
<Script>#COMMEX vciHandle -1 0x22 "\x3C\xC6"
DVciResult = @0-;
if(engine.LastError == 0 ) then 
    MeasValue = string.byte(DVciResult,4);
    if(MeasValue ==0x02) then 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpok")
    else
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.LastError = 1;
    engine.TestResult = 1;
    end 
else 
    engine.SetLineText(2,"#L=SCM上倾状态".."#R=bmpnok")
    engine.TestResult = 1;
end
engine.StatValue = LibGeneral.hex2str(DVciResult)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="27" name="DEP2153" type="8" flags="97"/>
</Activity>
<Activity id="1252" ActivityType="13" flags="0" name="ReturnControlToECU">
<Rect left="230" top="874" right="330" bottom="906"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x2F"/>
<Parameter id="resTitle" value="0x6F"/>
<Parameter id="sendTel" value="&apos;\xCF\x41\x00&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="1231" type="0">
</Transition>
<Transition StartId="1231" EndId="1242" type="0">
</Transition>
<Transition StartId="1232" EndId="1233" type="0">
</Transition>
<Transition StartId="1233" EndId="1234" type="0">
</Transition>
<Transition StartId="1234" EndId="1239" type="0">
</Transition>
<Transition StartId="1239" EndId="1240" type="0">
</Transition>
<Transition StartId="1240" EndId="1241" type="0">
</Transition>
<Transition StartId="1241" EndId="1250" type="0">
</Transition>
<Transition StartId="1242" EndId="1232" type="0">
</Transition>
<Transition StartId="1244" EndId="1245" type="0">
</Transition>
<Transition StartId="1245" EndId="1249" type="0">
</Transition>
<Transition StartId="1246" EndId="1247" type="0">
</Transition>
<Transition StartId="1247" EndId="1248" type="0">
</Transition>
<Transition StartId="1249" EndId="1246" type="0">
</Transition>
<Transition StartId="1250" EndId="1251" type="0">
</Transition>
<Transition StartId="1251" EndId="1252" type="0">
</Transition>
<Transition StartId="1252" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

