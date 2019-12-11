<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="ExecStep" type="8" dir="0" data=""/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="34" right="530" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="634" right="530" bottom="666"/>
<Script>engine.Delay(100)</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="430" top="84" right="530" bottom="116"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="430" top="144" right="530" bottom="176"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00011111@5==0b?????001&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="FWE_31_WheelHousing">
<Rect left="430" top="204" right="530" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车高测量"/>
<Line3Text Enable="1"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="500"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="数据获取">
<Rect left="430" top="264" right="530" bottom="296"/>
<Script>local factor = 0.1

--获取左前车轮罩值
WheelHousing_FL = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);
--获取右前车轮罩值
WheelHousing_FR = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);
--获取左后车轮罩值
WheelHousing_RL = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);
--获取右后车轮罩值
WheelHousing_RR = LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);


--获取左前右前高度差
WheelHousing_Diff_Front = LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);


--获取左后右后高度差
WheelHousing_Diff_Rear = LibIDT.idtSigned2float(recvData:sub(23,23):byte(),recvData:sub(24,24):byte(),factor);

--获取左前车轮罩值结果
WheelHousing_FL_Result = string.byte(recvData:sub(29,29));
--获取右前车轮罩值结果
WheelHousing_FR_Result = string.byte(recvData:sub(30,30));
--获取左后车轮罩值结果
WheelHousing_RL_Result = string.byte(recvData:sub(31,31));
--获取右后车轮罩值结果
WheelHousing_RR_Result = string.byte(recvData:sub(32,32));
--获取左前右前高度差结果
WheelHousing_Diff_Front_Result = string.byte(recvData:sub(33,33));
--获取左后右后高度差结果
WheelHousing_Diff_Rear_Result = string.byte(recvData:sub(34,34));

--总结果
All_Result = string.byte(recvData:sub(36,36));

engine.SharedVarSet("WheelHouse_FL",WheelHousing_FL);
engine.SharedVarSet("WheelHouse_FR",WheelHousing_FR);
engine.SharedVarSet("WheelHouse_RL",WheelHousing_RL);
engine.SharedVarSet("WheelHouse_RR",WheelHousing_RR);


print("#### WheelHouse_FL : "..WheelHousing_FL);
print("#### WheelHouse_FR : "..WheelHousing_FR);
print("#### WheelHouse_RL : "..WheelHousing_RL);
print("#### WheelHouse_RR : "..WheelHousing_RR);
print("#### Diff_FL : "..WheelHousing_Diff_Front);
print("#### Diff_FR : "..WheelHousing_Diff_Rear);
print("#### Result : "..All_Result);
</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="690" top="84" right="790" bottom="116"/>
<Script>engine.println(" &lt;FWE_31_WheelHousing&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="NOK">
<Rect left="690" top="204" right="790" bottom="236"/>
<Line2Text Enable="1" Text="FWE SERVICE 31 ERROR"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE 轮眉高度测量"
engine.println(" &lt;FWE_31_WheelHousing&gt; ")
engine.DialogBackColor = "red";
engine.Delay(2000)</Script><assessment no="86" name="DEP2505" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="634" right="756" bottom="666"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计左前车轮罩值">
<Rect left="190" top="264" right="290" bottom="296"/>
<Script>if(WheelHousing_FL_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_FL)
elseif(WheelHousing_FL_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_FL)
elseif(WheelHousing_FL_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_FL)
elseif(WheelHousing_FL_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_FL) 
elseif(WheelHousing_FL_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_FL) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_FL)
end</Script><assessment no="80" name="DEP1333" type="8" flags="105"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="统计右前车轮罩值">
<Rect left="190" top="314" right="290" bottom="346"/>
<Script>if(WheelHousing_FR_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_FR)
elseif(WheelHousing_FR_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_FR)
elseif(WheelHousing_FR_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_FR)
elseif(WheelHousing_FR_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_FR) 
elseif(WheelHousing_FR_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_FR) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_FR)
end</Script><assessment no="81" name="DEP1334" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="1" name="统计左后车轮罩值">
<Rect left="190" top="364" right="290" bottom="396"/>
<Script>if(WheelHousing_RL_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_RL)
elseif(WheelHousing_RL_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_RL)
elseif(WheelHousing_RL_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_RL)
elseif(WheelHousing_RL_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_RL) 
elseif(WheelHousing_RL_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_RL) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_RL)
end</Script><assessment no="82" name="DEP1335" type="8" flags="105"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="统计右后车轮罩值">
<Rect left="190" top="414" right="290" bottom="446"/>
<Script>if(WheelHousing_RR_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_RR)
elseif(WheelHousing_RR_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_RR)
elseif(WheelHousing_RR_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_RR)
elseif(WheelHousing_RR_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_RR) 
elseif(WheelHousing_RR_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_RR) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_RR)
end</Script><assessment no="83" name="DEP1336" type="8" flags="105"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="统计左前右前高度差">
<Rect left="190" top="464" right="290" bottom="496"/>
<Script>if(WheelHousing_Diff_Front_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_Diff_Front)
elseif(WheelHousing_Diff_Front_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_Diff_Front)
elseif(WheelHousing_Diff_Front_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_Diff_Front)
elseif(WheelHousing_Diff_Front_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_Diff_Front) 
elseif(WheelHousing_Diff_Front_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_Diff_Front) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_Diff_Front)
end</Script><assessment no="51" name="DEP1337" type="8" flags="105"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="统计左后右后高度差">
<Rect left="190" top="514" right="290" bottom="546"/>
<Script>if(WheelHousing_Diff_Rear_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(WheelHousing_Diff_Rear)
elseif(WheelHousing_Diff_Rear_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(WheelHousing_Diff_Rear)
elseif(WheelHousing_Diff_Rear_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(WheelHousing_Diff_Rear)
elseif(WheelHousing_Diff_Rear_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(WheelHousing_Diff_Rear) 
elseif(WheelHousing_Diff_Rear_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(WheelHousing_Diff_Rear) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(WheelHousing_Diff_Rear)
end</Script><assessment no="84" name="DEP1338" type="8" flags="105"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="isOK">
<Rect left="430" top="574" right="530" bottom="606"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Service 31"
engine.println(" &lt;FWE_31_WheelHousing&gt; ")</Script><assessment no="86" name="DEP2505" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="统计轮眉与地面高度结果">
<Rect left="190" top="574" right="290" bottom="606"/>
<Script>if(All_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "
elseif(All_Result == 1) then
	engine.LastError = 0
	engine.StatValue = "Evaluation = 1,Measured OK : "
elseif(All_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "
elseif(All_Result == 14) then
	engine.LastError = 1
	engine.StatValue = "systemerror "
else
	engine.LastError = 1
	engine.StatValue = "Evaluation = Unknown : "
end</Script><assessment no="85" name="DEP1339" type="8" flags="105"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>ExecStep == "Static" and FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="66" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="67" type="1">
<Expression>ret == false</Expression></Transition>
<Transition StartId="5" EndId="58" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="58" EndId="69" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="2" type="0">
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
<Transition StartId="74" EndId="77" type="0">
</Transition>
<Transition StartId="76" EndId="2" type="0">
</Transition>
<Transition StartId="77" EndId="76" type="0">
</Transition>
</Transitions>
</Process>

