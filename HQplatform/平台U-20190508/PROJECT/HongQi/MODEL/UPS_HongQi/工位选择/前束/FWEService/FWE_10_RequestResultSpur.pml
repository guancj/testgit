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
<Rect left="480" top="864" right="580" bottom="896"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="144" right="580" bottom="176"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00001010&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_10_RequestResultSpur">
<Rect left="480" top="204" right="580" bottom="236"/>
<Line2Text Enable="1" Text="前束值"/>
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
<Script>engine.println(" &lt;FWE_10_RequestResultSpur&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="NOK">
<Rect left="700" top="204" right="800" bottom="236"/>
<Line2Text Enable="1" Text="FWE SERVICE 10 ERROR"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE Service 10"
engine.DialogBackColor = "red";</Script><assessment no="36" name="DEP1322" type="8" flags="97"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="OK">
<Rect left="480" top="804" right="580" bottom="836"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Service 10"
engine.println(" &lt;FWE_10_RequestResultSpur&gt; ")</Script><assessment no="36" name="DEP1322" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="864" right="766" bottom="896"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="数据获取">
<Rect left="480" top="264" right="580" bottom="296"/>
<Script>local factor = 0.1

--获取左前轮前束值
Spur_FL = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);
EvalResult_FL =  string.byte(recvData:sub(29,29));
--获取右前轮前束值
Spur_FR = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);
EvalResult_FR =  string.byte(recvData:sub(30,30));
--获取前轴前束值
Spur_Front = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);
EvalResult_FA =  string.byte(recvData:sub(31,31));
--获取左后轮前束值
Spur_RL = LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);
EvalResult_RL =  string.byte(recvData:sub(32,32));
--获取右后轮前束值
Spur_RR = LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);
EvalResult_RR = string.byte(recvData:sub(33,33));
--获取后轴前束值
Spur_Rear = LibIDT.idtSigned2float(recvData:sub(23,23):byte(),recvData:sub(24,24):byte(),factor);
EvalResult_RA = string.byte(recvData:sub(34,34));

--获取蟹行角
DackelLaufAngle = LibIDT.idtSigned2float(recvData:sub(25,25):byte(),recvData:sub(26,26):byte(),factor);
DackelLaufAngle_Result = string.byte(recvData:sub(35,35));

--总结果
All_Result = string.byte(recvData:sub(36,36));

print("Spur_FL:"..Spur_FL)
print("Spur_FR:"..Spur_FR)
print("Spur_Front:"..Spur_Front)

print("Spur_RL:"..Spur_RL)
print("Spur_RR:"..Spur_RR)
print("Spur_Rear:"..Spur_Rear)

print("DackelLaufAngle:"..DackelLaufAngle)
print("EvalResult_RL:"..EvalResult_RL)
print("EvalResult_RR:"..EvalResult_RR)
print("EvalResult_RA:"..EvalResult_RA)
print("DackelLaufAngle_Result:"..DackelLaufAngle_Result)
print("All_Result:"..All_Result)
</Script></Activity>
<Activity id="66" ActivityType="3" flags="1" name="统计左前轮前束值">
<Rect left="310" top="324" right="410" bottom="356"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Spur_FL)</Script><assessment no="28" name="DEP1314" type="8" flags="105"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="统计右前轮前束值">
<Rect left="310" top="384" right="410" bottom="416"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Spur_FR)</Script><assessment no="29" name="DEP1315" type="8" flags="105"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="统计前轴前束值">
<Rect left="310" top="444" right="410" bottom="476"/>
<Script>engine.LastError = 0
engine.StatValue =  tostring(Spur_Front)</Script><assessment no="30" name="DEP1316" type="8" flags="105"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计左后轮前束值">
<Rect left="310" top="504" right="410" bottom="536"/>
<Script>engine.LastError = 0 
engine.StatValue =  tostring(Spur_RL)</Script><assessment no="31" name="DEP1317" type="8" flags="105"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="统计右后轮前束值">
<Rect left="310" top="564" right="410" bottom="596"/>
<Script>engine.LastError = 0
engine.StatValue =  tostring(Spur_RR)</Script><assessment no="32" name="DEP1318" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="统计后轴前束值">
<Rect left="310" top="624" right="410" bottom="656"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(Spur_Rear)</Script><assessment no="33" name="DEP1319" type="8" flags="105"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="统计蟹型角">
<Rect left="310" top="684" right="410" bottom="716"/>
<Script>engine.LastError = 0
engine.StatValue =  tostring(DackelLaufAngle)</Script><assessment no="34" name="DEP1320" type="8" flags="105"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="前束值检测结果">
<Rect left="310" top="744" right="410" bottom="776"/>
<Script>engine.LastError = 0
engine.StatValue =  tostring(All_Result)</Script><assessment no="35" name="DEP1321" type="8" flags="105"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="统计调整后左前轮前束值">
<Rect left="480" top="324" right="580" bottom="356"/>
<Script>if (EvalResult_FL == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_FL)

</Script><assessment no="64" name="DEP1350" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="统计调整后右前轮前束值">
<Rect left="480" top="384" right="580" bottom="416"/>
<Script>if (EvalResult_FR == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_FR)</Script><assessment no="65" name="DEP1351" type="8" flags="105"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="统计调整后左后轮前束值">
<Rect left="480" top="504" right="580" bottom="536"/>
<Script>if (EvalResult_RL == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_RL)</Script><assessment no="66" name="DEP1352" type="8" flags="105"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="统计调整后右后轮前束值">
<Rect left="480" top="564" right="580" bottom="596"/>
<Script>if (EvalResult_RR == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_RR)</Script><assessment no="67" name="DEP1353" type="8" flags="105"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="统计调整后前轴前束值">
<Rect left="480" top="444" right="580" bottom="476"/>
<Script>if (EvalResult_FA == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_Front)</Script><assessment no="68" name="DEP1354" type="8" flags="105"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="统计调整后后轴前束值">
<Rect left="480" top="624" right="580" bottom="656"/>
<Script>if (EvalResult_RR == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(Spur_Rear)</Script><assessment no="69" name="DEP1355" type="8" flags="105"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="统计调整后蟹型角">
<Rect left="480" top="684" right="580" bottom="716"/>
<Script>if (DackelLaufAngle_Result == 1) then
	engine.LastError = 0 
else
	engine.LastError = 1
end
engine.StatValue =  tostring(DackelLaufAngle)</Script><assessment no="70" name="DEP1356" type="8" flags="105"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="统计调整后前束值总结果">
<Rect left="480" top="744" right="580" bottom="776"/>
<Script>engine.LastError = 0 
engine.StatValue =  tostring(All_Result)</Script><assessment no="71" name="DEP1357" type="8" flags="105"/>
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
<Transition StartId="63" EndId="2" type="0">
</Transition>
<Transition StartId="64" EndId="2" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="1">
<Expression>CalcResult == false</Expression></Transition>
<Transition StartId="65" EndId="75" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="63" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="79" type="0">
</Transition>
<Transition StartId="77" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="80" type="0">
</Transition>
<Transition StartId="79" EndId="77" type="0">
</Transition>
<Transition StartId="80" EndId="81" type="0">
</Transition>
<Transition StartId="81" EndId="82" type="0">
</Transition>
<Transition StartId="82" EndId="63" type="0">
</Transition>
</Transitions>
</Process>

