<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1508" pbltext="DEP1581">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="590" top="48" right="690" bottom="80"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="590" top="544" right="690" bottom="576"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="590" top="184" right="690" bottom="216"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00100110@23==0b00000000@24==0b00000000@25==0b00100000&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="SWE_38_LampResult">
<Rect left="590" top="248" right="690" bottom="280"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="500"/>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="838" top="248" right="938" bottom="280"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "SWE 右远光灯光强 "
engine.SetLineText(1,"SWE SERVICE 38 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;


engine.println(" &lt;SWE_38_RequestResult_IntensityRight_Err&gt; @Dpin ")</Script><assessment no="120" name="DEP1406" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="590" top="112" right="690" bottom="144"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="838" top="112" right="938" bottom="144"/>
<Script>engine.println(" &lt;SWEHndl_08&gt; : handle invalid --&gt;"..tostring(SWEHndl))</Script></Activity>
<Activity id="53" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="544" right="906" bottom="576"/>
</Activity>
<Activity id="55" ActivityType="3" flags="1" name="结果获取">
<Rect left="590" top="304" right="690" bottom="336"/>
<Script>local factor = 100

--获取右远光灯光强
Light_intensity_right = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);



--获取设置的右最低标准光强
TargetNominalIntensity_right = LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);

print("Light_intensity_right:"..Light_intensity_right)
print("TargetNominalIntensity_right:"..TargetNominalIntensity_right)

</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="统计右远光灯标称光强">
<Rect left="590" top="364" right="690" bottom="396"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(TargetNominalIntensity_right)</Script><assessment no="40" name="DEP1404" type="8" flags="105"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="统计右远光灯光强">
<Rect left="590" top="424" right="690" bottom="456"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Light_intensity_right)</Script><assessment no="41" name="DEP1405" type="8" flags="105"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="统计SWE服务">
<Rect left="590" top="484" right="690" bottom="516"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "SWE Service 38 Intensityright"
engine.println(" &lt;SWE_38_RequestResult_IntensityRight&gt; OK")
</Script><assessment no="42" name="DEP1406" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="55" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="53" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>SWEHndl~=nil and SWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="49" EndId="47" type="0">
</Transition>
<Transition StartId="53" EndId="2" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

