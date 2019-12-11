<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="384" top="119" right="484" bottom="151"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="384" top="1831" right="484" bottom="1863"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="写参数">
<Rect left="384" top="191" right="484" bottom="223"/>
<Script>inputpath = "D:\\redflag\\Emission.tmp"
--ID_NUM = 850</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="Writefile">
<Rect left="384" top="379" right="484" bottom="411"/>
<FunctionRef id="Writefile" model="LibGeneral">
<Parameters>
<Parameter id="path" value="inputpath"/>
<Parameter id="content" value="ID_NUM"/>
<Parameter id="mode" value="&quot;w&quot;"/>
<Parameter id="ret" ret="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="ID判定">
<Rect left="384" top="321" right="484" bottom="353"/>
<Line3Text Enable="1" Text="数量：&amp;ID_NUM"/>
<Script>ID_NUM = tostring(ID_NUM)</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="获取统计信息">
<Rect left="384" top="440" right="484" bottom="472"/>
<Script>ExecuteProcess("D:\\redflag\\AccessTrans\\lua.exe","D:\\redflag\\AccessTrans\\lua.exe D:\\redflag\\AccessTrans\\AccessTrans.lua",0,true);

local ini
--ini = IniFile(engine.ProgPath.."\\hongqiEmission.ini")
ini = IniFile("D:\\redflag\\hongqiEmission.ini")
engine.println("IniFile :"..type(ini))

VIN = ini.getString(ID_NUM,"VIN","");
engine.println("## VIN ## :"..tostring(VIN))

TimeDate = ini.getString(ID_NUM,"TimeDate","");
engine.println("## TimeDate ## :"..tostring(TimeDate))

HIGH_CO = ini.getString(ID_NUM,"HIGH_CO","");
engine.println("## HIGH_CO ## :"..tostring(HIGH_CO))

EVAL_HIGH_CO = ini.getString(ID_NUM,"EVAL_HIGH_CO","");
engine.println("## EVAL_HIGH_CO ## :"..tostring(EVAL_HIGH_CO))

HIGH_HC = ini.getString(ID_NUM,"HIGH_HC","");
engine.println("## HIGH_HC ## :"..tostring(HIGH_HC))

EVAL_HIGH_HC = ini.getString(ID_NUM,"EVAL_HIGH_HC","");
engine.println("## EVAL_HIGH_HC ## :"..tostring(EVAL_HIGH_HC))

HIGH_LAMBDA = ini.getString(ID_NUM,"HIGH_LAMBDA","");
engine.println("## HIGH_LAMBDA ## :"..tostring(HIGH_LAMBDA))

EVAL_HIGH_LAMBDA = ini.getString(ID_NUM,"EVAL_HIGH_LAMBDA","");
engine.println("## EVAL_HIGH_LAMBDA ## :"..tostring(EVAL_HIGH_LAMBDA))

LOW_CO = ini.getString(ID_NUM,"LOW_CO","");
engine.println("## LOW_CO ## :"..tostring(LOW_CO))

EVAL_LOW_CO = ini.getString(ID_NUM,"EVAL_LOW_CO","");
engine.println("## EVAL_LOW_CO ## :"..tostring(EVAL_LOW_CO))

LOW_HC = ini.getString(ID_NUM,"LOW_HC","");
engine.println("## LOW_HC ## :"..tostring(LOW_HC))

EVAL_LOW_HC = ini.getString(ID_NUM,"EVAL_LOW_HC","");
engine.println("## EVAL_LOW_HC ## :"..tostring(EVAL_LOW_HC))

LOW_LAMBDA = ini.getString(ID_NUM,"LOW_LAMBDA","");
engine.println("## LOW_LAMBDA ## :"..tostring(LOW_LAMBDA))

EVAL_LOW_LAMBDA = ini.getString(ID_NUM,"EVAL_LOW_LAMBDA","");
engine.println("## EVAL_LOW_LAMBDA ## :"..tostring(EVAL_LOW_LAMBDA))

EMISSION_HIGH_VALUATION = ini.getString(ID_NUM,"EMISSION_HIGH_VALUATION","");
engine.println("## EMISSION_HIGH_VALUATION ## :"..tostring(EMISSION_HIGH_VALUATION))

EMISSION_LOW_VALUATION = ini.getString(ID_NUM,"EMISSION_LOW_VALUATION","");
engine.println("## EMISSION_LOW_VALUATION ## :"..tostring(EMISSION_LOW_VALUATION))

EMISSION_TOTAL_VALUATION = ini.getString(ID_NUM,"EMISSION_TOTAL_VALUATION","");
engine.println("## EMISSION_TOTAL_VALUATION ## :"..tostring(EMISSION_TOTAL_VALUATION))</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="VIN判定">
<Rect left="384" top="511" right="484" bottom="543"/>
<Script>if(VIN ~= "")  then

        engine.VIN = VIN
        engine.LastError = 0
else

        engine.LastError = 1
        print("ID  number can not find !!!")
end
</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="TimeDate">
<Rect left="384" top="653" right="484" bottom="685"/>
<Script>engine.StatValue = tostring(TimeDate)
engine.LastError = 0</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="VIN">
<Rect left="384" top="582" right="484" bottom="614"/>
<Script>engine.StatValue = tostring(VIN)
engine.LastError = 0</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="HIGH_CO">
<Rect left="384" top="720" right="484" bottom="752"/>
<Script>engine.StatValue = tostring(HIGH_CO)
engine.LastError = 0
</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="EVAL_HIGH_CO">
<Rect left="384" top="783" right="484" bottom="815"/>
<Script>if(EVAL_HIGH_CO == "OK") then
engine.StatValue = tostring(EVAL_HIGH_CO)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_HIGH_CO)
engine.LastError = 1
end
</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="HIGH_HC">
<Rect left="384" top="846" right="484" bottom="878"/>
<Script>engine.StatValue = tostring(HIGH_HC)
engine.LastError = 0
</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="EVAL_HIGH_HC">
<Rect left="384" top="909" right="484" bottom="941"/>
<Script>if(EVAL_HIGH_HC == "OK") then
engine.StatValue = tostring(EVAL_HIGH_HC)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_HIGH_HC)
engine.LastError = 1
end
</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="HIGH_LAMBDA">
<Rect left="384" top="978" right="484" bottom="1010"/>
<Script>engine.StatValue = tostring(HIGH_LAMBDA)
engine.LastError = 0
</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="EVAL_HIGH_LAMBDA">
<Rect left="384" top="1041" right="484" bottom="1073"/>
<Script>if(EVAL_HIGH_LAMBDA == "OK") then
engine.StatValue = tostring(EVAL_HIGH_LAMBDA)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_HIGH_LAMBDA)
engine.LastError = 1
end
</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="LOW_CO">
<Rect left="384" top="1109" right="484" bottom="1141"/>
<Script>engine.StatValue = tostring(LOW_CO)
engine.LastError = 0
</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="EVAL_LOW_CO">
<Rect left="384" top="1176" right="484" bottom="1208"/>
<Script>if(EVAL_LOW_CO == "OK") then
engine.StatValue = tostring(EVAL_LOW_CO)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_LOW_CO)
engine.LastError = 1
end
</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="LOW_HC">
<Rect left="384" top="1236" right="484" bottom="1268"/>
<Script>engine.StatValue = tostring(LOW_HC)
engine.LastError = 0
</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="EVAL_LOW_HC">
<Rect left="384" top="1299" right="484" bottom="1331"/>
<Script>if(EVAL_LOW_HC == "OK") then
engine.StatValue = tostring(EVAL_LOW_HC)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_LOW_HC)
engine.LastError = 1
end
</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="LOW_LAMBDA">
<Rect left="384" top="1367" right="484" bottom="1399"/>
<Script>engine.StatValue = tostring(LOW_LAMBDA)
engine.LastError = 0
</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="EVAL_LOW_LAMBDA">
<Rect left="384" top="1432" right="484" bottom="1464"/>
<Script>if(EVAL_LOW_LAMBDA == "OK") then
engine.StatValue = tostring(EVAL_LOW_LAMBDA)
engine.LastError = 0
else
engine.StatValue = tostring(EVAL_LOW_LAMBDA)
engine.LastError = 1
end
</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="EMISSION_HIGH_VALUATION">
<Rect left="384" top="1501" right="484" bottom="1533"/>
<Script>if(EMISSION_HIGH_VALUATION == "OK") then
engine.StatValue = tostring(EMISSION_HIGH_VALUATION)
engine.LastError = 0
else
engine.StatValue = tostring(EMISSION_HIGH_VALUATION)
engine.LastError = 1
end
</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="EMISSION_LOW_VALUATION">
<Rect left="384" top="1573" right="484" bottom="1605"/>
<Script>if(EMISSION_LOW_VALUATION == "OK") then
engine.StatValue = tostring(EMISSION_LOW_VALUATION)
engine.LastError = 0
else
engine.StatValue = tostring(EMISSION_LOW_VALUATION)
engine.LastError = 1
end
</Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="EMISSION_TOTAL_VALUATION">
<Rect left="384" top="1641" right="484" bottom="1673"/>
<Script>if(EMISSION_TOTAL_VALUATION == "OK") then
engine.StatValue = tostring(EMISSION_TOTAL_VALUATION)
engine.LastError = 0
else
engine.StatValue = tostring(EMISSION_TOTAL_VALUATION)
engine.LastError = 1
end
</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="saveresult">
<Rect left="384" top="1717" right="484" bottom="1749"/>
<Script>local StatisticTestResult = engine.GetResults();

engine.println("###&lt;main&gt; workplace for send result###".. tostring(engine.WorkPlace))

engine.println(table2xmlstring("Gongshu",StatisticTestResult));
dump("Gongshu",StatisticTestResult);

if (#StatisticTestResult ~= 0) then

engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();

end;</Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="ID累计">
<Rect left="608" top="1718" right="708" bottom="1750"/>
<Script>ID_NUM = tonumber(ID_NUM) + 1
</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="普通节点">
<Rect left="608" top="320" right="708" bottom="352"/>
<Script></Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="ID 无返回 延时不累计">
<Rect left="202" top="512" right="302" bottom="544"/>
<Script>#DELAY 5000</Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="普通节点">
<Rect left="202" top="322" right="302" bottom="354"/>
<Script></Script></Activity>
<Activity id="31" ActivityType="13" flags="0" name="Readfile">
<Rect left="384" top="254" right="484" bottom="286"/>
<FunctionRef id="Readfile" model="LibGeneral">
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="31" type="0">
</Transition>
<Transition StartId="4" EndId="6" type="0">
</Transition>
<Transition StartId="5" EndId="4" type="0">
</Transition>
<Transition StartId="6" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="10" type="3">
</Transition>
<Transition StartId="8" EndId="29" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="9" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="0">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="0">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="5" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="5" type="0">
</Transition>
<Transition StartId="31" EndId="5" type="0">
</Transition>
</Transitions>
</Process>

