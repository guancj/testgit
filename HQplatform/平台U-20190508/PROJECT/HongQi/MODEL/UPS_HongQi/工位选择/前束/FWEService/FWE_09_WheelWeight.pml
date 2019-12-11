<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="654" right="580" bottom="686"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="164" right="580" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00001001&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_09_WheelWeight">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="轴重测量"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="100"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="700" top="94" right="800" bottom="126"/>
<Script>engine.println(" &lt;FAS_28_TransversePosition&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="NOK">
<Rect left="700" top="224" right="800" bottom="256"/>
<Line2Text Enable="1" Text="FWE SERVICE 09 ERROR"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE 读取重量"
engine.DialogBackColor = "red";
engine.Delay(2000)</Script><assessment no="46" name="DEP1332" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="654" right="766" bottom="686"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="结果获取">
<Rect left="480" top="284" right="580" bottom="316"/>
<Script>local factor = 0.1

--获取左前轴重
WheelWeight_FL = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);

--获取右前轴重
WheelWeight_FR = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);

--获取前轴轴重
WheelWeight_FA = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);

--获取左后轴重
WheelWeight_RL= LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);

--获取右后轴重
WheelWeight_RR= LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);

--获取后轴轴重
WheelWeight_RA= LibIDT.idtSigned2float(recvData:sub(23,23):byte(),recvData:sub(24,24):byte(),factor);

--获取整车轴重
WheelWeight_ALL= LibIDT.idtSigned2float(recvData:sub(25,25):byte(),recvData:sub(26,26):byte(),factor);

--结果
RespTransverseResult_FL = string.byte(recvData:sub(29,29));
RespTransverseResult_FR = string.byte(recvData:sub(30,30));
RespTransverseResult_FA = string.byte(recvData:sub(31,31));

RespTransverseResult_RL = string.byte(recvData:sub(32,32));
RespTransverseResult_RR = string.byte(recvData:sub(33,33));
RespTransverseResult_RA = string.byte(recvData:sub(34,34));


RespTransverseResult_FA_RA = string.byte(recvData:sub(35,35));
RespTransverseResult_ALL = string.byte(recvData:sub(36,36));

engine.SharedVarSet("WheelWeight_FL",WheelWeight_FL)
engine.SharedVarSet("WheelWeight_FR",WheelWeight_FR)
engine.SharedVarSet("WheelWeight_FA",WheelWeight_FA)
engine.SharedVarSet("WheelWeight_RL",WheelWeight_RL)
engine.SharedVarSet("WheelWeight_RR",WheelWeight_RR)
engine.SharedVarSet("WheelWeight_RA",WheelWeight_RA)
engine.SharedVarSet("WheelWeight_ALL",WheelWeight_ALL)



print("WheelWeight_FL:"..WheelWeight_FL)
print("WheelWeight_FR:"..WheelWeight_FR)
print("WheelWeight_FA:"..WheelWeight_FA)
print("WheelWeight_RL:"..WheelWeight_RL)
print("WheelWeight_RR:"..WheelWeight_RR)
print("WheelWeight_RA:"..WheelWeight_RA)
print("WheelWeight_ALL:"..WheelWeight_ALL)

print("RespTransverseResult_FL:"..RespTransverseResult_FL)
print("RespTransverseResult_FR:"..RespTransverseResult_FR)
print("RespTransverseResult_FA:"..RespTransverseResult_FA)
print("RespTransverseResult_RL:"..RespTransverseResult_FL)
print("RespTransverseResult_RR:"..RespTransverseResult_FL)
print("RespTransverseResult_RA:"..RespTransverseResult_FL)

print("RespTransverseResult_ALL:"..RespTransverseResult_ALL)</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="OK">
<Rect left="480" top="574" right="580" bottom="606"/>
<Script>isOK = true
engine.LastError = 0
engine.StatValue = "FWE Service 09"
engine.println(" &lt;FWE_09_WheelWeight&gt; ")</Script><assessment no="46" name="DEP1332" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="统计_左前轴重">
<Rect left="290" top="284" right="390" bottom="316"/>
<Script>if(RespTransverseResult_FL == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_FL)
elseif(RespTransverseResult_FL == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_FL)
elseif(RespTransverseResult_FL == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_FL)
elseif(RespTransverseResult_FL == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_FL) 
elseif(RespTransverseResult_FL == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_FL) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelWeight_FL)
end</Script><assessment no="21" name="DEP1307" type="8" flags="105"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="统计_右前轴重">
<Rect left="290" top="344" right="390" bottom="376"/>
<Script>if(RespTransverseResult_FR == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_FR)
elseif(RespTransverseResult_FR == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_FR)
elseif(RespTransverseResult_FR == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_FR)
elseif(RespTransverseResult_FR == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_FR) 
elseif(RespTransverseResult_FR == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_FR) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_FR)
end</Script><assessment no="22" name="DEP1308" type="8" flags="105"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计_左后轴重">
<Rect left="480" top="344" right="580" bottom="376"/>
<Script>if(RespTransverseResult_RL == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_RL)
elseif(RespTransverseResult_RL == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_RL)
elseif(RespTransverseResult_RL == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_RL)
elseif(RespTransverseResult_RL == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_RL) 
elseif(RespTransverseResult_RL == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_RL) 
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_RL)
end</Script><assessment no="23" name="DEP1309" type="8" flags="105"/>
</Activity>
<Activity id="70" ActivityType="3" flags="1" name="统计_由后轴重">
<Rect left="480" top="414" right="580" bottom="446"/>
<Script>if(RespTransverseResult_RR == 0 ) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_RR)
elseif(RespTransverseResult_RR == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_RR)
elseif(RespTransverseResult_RR == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_RR)
elseif(RespTransverseResult_RR == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_RR) 
elseif(RespTransverseResult_RR == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_RR) 
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_RR)
end</Script><assessment no="24" name="DEP1310" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="统计_前轴轴重">
<Rect left="290" top="414" right="390" bottom="446"/>
<Script>if(RespTransverseResult_FA == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_FA)
elseif(RespTransverseResult_FA == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_FA)
elseif(RespTransverseResult_FA == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_FA)
elseif(RespTransverseResult_FA == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_FA) 
elseif(RespTransverseResult_FA == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_FA) 
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_FA)
end</Script><assessment no="25" name="DEP1311" type="8" flags="105"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="统计_后轴轴重">
<Rect left="290" top="474" right="390" bottom="506"/>
<Script>if(RespTransverseResult_RA == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_RA)
elseif(RespTransverseResult_RA == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_RA)
elseif(RespTransverseResult_RA == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_RA)
elseif(RespTransverseResult_RA == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_RA) 
elseif(RespTransverseResult_RA == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_RA) 
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_RA)
end</Script><assessment no="26" name="DEP1312" type="8" flags="105"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="统计_整车轴重">
<Rect left="480" top="474" right="580" bottom="506"/>
<Script>if(RespTransverseResult_FA_RA == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelWeight_ALL)
elseif(RespTransverseResult_FA_RA == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelWeight_ALL)
elseif(RespTransverseResult_FA_RA == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelWeight_ALL)
elseif(RespTransverseResult_FA_RA == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelWeight_ALL) 
elseif(RespTransverseResult_FA_RA == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelWeight_ALL) 
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "..tostring(WheelWeight_ALL)
end</Script><assessment no="27" name="DEP1313" type="8" flags="105"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="轴重总评估">
<Rect left="480" top="524" right="580" bottom="556"/>
<Script>if(RespTransverseResult_ALL == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "
elseif(RespTransverseResult_ALL == 1) then
	engine.LastError = 0
	engine.StatValue = "Evaluation = 1,Measured OK : "
elseif(RespTransverseResult_ALL == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "
elseif(RespTransverseResult_ALL == 14) then
	engine.LastError = 1
	engine.StatValue = "systemerror "
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "
end</Script><assessment no="87" name="DEP2513" type="8" flags="97"/>
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
<Transition StartId="65" EndId="67" type="0">
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
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="66" type="0">
</Transition>
</Transitions>
</Process>

