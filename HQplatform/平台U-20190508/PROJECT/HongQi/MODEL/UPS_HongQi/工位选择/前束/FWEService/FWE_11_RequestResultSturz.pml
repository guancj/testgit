<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="CalcResult" type="11" dir="0" data=""/>
<Variable id="EvalResult_RL" type="3" dir="1" data="0"/>
<Variable id="EvalResult_RR" type="3" dir="1" data="0"/>
<Variable id="EvalResult_RA" type="3" dir="1" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="470" top="844" right="570" bottom="876"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="164" right="580" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00001011&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_11_RequestResultSturz">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="外倾值"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="3"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="700" top="94" right="800" bottom="126"/>
<Script>engine.println(" &lt;FWE_11_RequestResultSturz&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="NOK">
<Rect left="700" top="224" right="800" bottom="256"/>
<Line2Text Enable="1" Text="FWE SERVICE 11 ERROR"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE 外倾角服务"
engine.DialogBackColor = "red";</Script><assessment no="45" name="DEP1331" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="844" right="766" bottom="876"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="数据获取">
<Rect left="480" top="294" right="580" bottom="326"/>
<Script>local factor = 0.1

--获取左前外倾值
Sturz_FL = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);
EvalResult_FL =  string.byte(recvData:sub(29,29));
--获取右前外倾值
Sturz_FR = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);
EvalResult_FR =  string.byte(recvData:sub(30,30));
--获取左后外倾值
Sturz_RL = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);
EvalResult_RL =  string.byte(recvData:sub(31,31));
--获取右后轮外倾值
Sturz_RR = LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);
EvalResult_RR = string.byte(recvData:sub(32,32));

--获取前桥外倾差值
Diff_FrontAxle = LibIDT.idtSigned2float(recvData:sub(25,25):byte(),recvData:sub(26,26):byte(),factor);
EvalResult_FA = string.byte(recvData:sub(33,33));

--获取后桥外倾差值
Diff_RearAxle = LibIDT.idtSigned2float(recvData:sub(27,27):byte(),recvData:sub(28,28):byte(),factor);
EvalResult_RA = string.byte(recvData:sub(34,34));

--总结果
All_Result = string.byte(recvData:sub(36,36));

print("Sturz_FL:"..Sturz_FL)
print("Sturz_FR:"..Sturz_FR)

print("Sturz_RL:"..Sturz_RL)
print("Sturz_RR:"..Sturz_RR)

print("EvalResult_RL:"..EvalResult_RL)
print("EvalResult_RR:"..EvalResult_RR)
print("EvalResult_RA:"..EvalResult_RA)

print("Diff_FrontAxle:"..Diff_FrontAxle)
print("Diff_RearAxle:"..Diff_RearAxle)

print("All_Result:"..All_Result)


isOK = true;

engine.println(" FWE_11_RequestResultSturz ")</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="OK">
<Rect left="470" top="774" right="570" bottom="806"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Service 11"
engine.println(" &lt;FWE_11_RequestResultSturz&gt; ")</Script><assessment no="45" name="DEP1331" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="统计左前外倾值">
<Rect left="290" top="344" right="390" bottom="376"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Sturz_FL)</Script><assessment no="38" name="DEP1324" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="统计右前外倾值">
<Rect left="290" top="404" right="390" bottom="436"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Sturz_FR)</Script><assessment no="39" name="DEP1325" type="8" flags="105"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计左后外倾值">
<Rect left="290" top="464" right="390" bottom="496"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Sturz_RL)</Script><assessment no="40" name="DEP1326" type="8" flags="105"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="统计右后外倾值">
<Rect left="290" top="524" right="390" bottom="556"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Sturz_RR)</Script><assessment no="41" name="DEP1327" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="统计前桥外倾差值">
<Rect left="290" top="584" right="390" bottom="616"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Diff_FrontAxle)</Script><assessment no="42" name="DEP1328" type="8" flags="105"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="统计后桥外倾差值">
<Rect left="290" top="644" right="390" bottom="676"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Diff_RearAxle)</Script><assessment no="43" name="DEP1329" type="8" flags="105"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="统计外倾检测结果">
<Rect left="290" top="704" right="390" bottom="736"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(All_Result)</Script><assessment no="44" name="DEP1330" type="8" flags="105"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="统计调整后左前外倾值">
<Rect left="470" top="344" right="570" bottom="376"/>
<Script>if (EvalResult_FL == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end

engine.StatValue =  tostring(Sturz_FL)</Script><assessment no="72" name="DEP1358" type="8" flags="105"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="统计调整后右前外倾值">
<Rect left="470" top="404" right="570" bottom="436"/>
<Script>if (EvalResult_FR == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Sturz_FR)</Script><assessment no="73" name="DEP1359" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="统计调整后左后外倾值">
<Rect left="470" top="464" right="570" bottom="496"/>
<Script>if (EvalResult_RL == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Sturz_RL)</Script><assessment no="74" name="DEP1360" type="8" flags="105"/>
</Activity>
<Activity id="77" ActivityType="3" flags="1" name="统计调整后右后外倾值">
<Rect left="470" top="524" right="570" bottom="556"/>
<Script>if (EvalResult_RR == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Sturz_RR)</Script><assessment no="75" name="DEP1361" type="8" flags="105"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="统计调整后前桥外倾差值">
<Rect left="470" top="584" right="570" bottom="616"/>
<Script>if (EvalResult_FA == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Diff_FrontAxle)</Script><assessment no="76" name="DEP1362" type="8" flags="105"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="统计调整后后桥外倾差值">
<Rect left="470" top="644" right="570" bottom="676"/>
<Script>if (EvalResult_RA == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Diff_RearAxle)</Script><assessment no="77" name="DEP1363" type="8" flags="105"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="统计调整后外倾检测结果">
<Rect left="470" top="704" right="570" bottom="736"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(All_Result)</Script><assessment no="78" name="DEP1364" type="8" flags="105"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="58" type="0">
</Transition>
<Transition StartId="4" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="59" type="0">
</Transition>
<Transition StartId="56" EndId="65" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="2" type="0">
</Transition>
<Transition StartId="65" EndId="67" type="1">
<Expression>CalcResult == false</Expression></Transition>
<Transition StartId="65" EndId="74" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="66" type="0">
</Transition>
<Transition StartId="74" EndId="75" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="77" type="0">
</Transition>
<Transition StartId="77" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="66" type="0">
</Transition>
</Transitions>
</Process>

