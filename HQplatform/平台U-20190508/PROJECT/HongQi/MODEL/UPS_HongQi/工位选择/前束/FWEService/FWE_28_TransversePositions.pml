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
<Rect left="480" top="704" right="580" bottom="736"/>
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
<Parameter id="BitOrByte" value="&quot;@2==0b00011100&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_28_TransversePositions">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="轴偏距测量"/>
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
<Script>engine.println(" &lt;FAS_28_TransversePosition&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="NOK">
<Rect left="700" top="224" right="800" bottom="256"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE "
engine.SetLineText(1,"FWE SERVICE 28 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;
engine.println(" &lt;FWE_28_TransversePositions_Err&gt; @Dpin ")</Script><assessment no="20" name="DEP1306" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="704" right="766" bottom="736"/>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="结果获取">
<Rect left="480" top="284" right="580" bottom="316"/>
<Script>local factor = 0.1

if (recvData ~= nil) then
--获取前轴轴偏距
AxialOffset_FA = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);

--获取后轴轴偏距
AxialOffset_RA = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);

--获取轴偏距-蟹行角
Dackelwinkel = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);

--获取轴偏距-对称角
SymmetricAngle= LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);


--获取前轴轴偏距结果
AxialOffset_FA_Result = string.byte(recvData:sub(29,29));
--获取后轴轴偏距结果
AxialOffset_RA_Result = string.byte(recvData:sub(30,30));
--获取蟹行角结果
Dackelwinkel_Result = string.byte(recvData:sub(31,31));
--获取对称角结果
SymmetricAngle_Result = string.byte(recvData:sub(32,32));
--总结果
RespTransverse_Result = string.byte(recvData:sub(35,35));

engine.SharedVarSet("AxialOffset_FA",AxialOffset_FA)
engine.SharedVarSet("AxialOffset_RA",AxialOffset_RA)
engine.SharedVarSet("Dackelwinkel",Dackelwinkel)
engine.SharedVarSet("SymmetricAngle",SymmetricAngle)

end
print("AxialOffset_FA:"..AxialOffset_FA)
print("AxialOffset_RA:"..AxialOffset_RA)
print("Dackelwinkel:"..Dackelwinkel)

print("SymmetricAngle:"..SymmetricAngle)
print("RespTransverse_Result:"..RespTransverse_Result)

</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="OK">
<Rect left="480" top="634" right="580" bottom="666"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Service 28"
engine.println(" &lt;FWE_28_TransversePositions&gt; ")
</Script><assessment no="20" name="DEP1306" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="统计_前轴轴偏距">
<Rect left="480" top="344" right="580" bottom="376"/>
<Script>
	engine.LastError = 0
	engine.StatValue = tostring(AxialOffset_FA)</Script><assessment no="16" name="DEP1302" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="统计_后轴轴偏距">
<Rect left="480" top="394" right="580" bottom="426"/>
<Script>
	engine.LastError = 0
	engine.StatValue = tostring(AxialOffset_RA)
</Script><assessment no="17" name="DEP1303" type="8" flags="97"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计_蟹行角">
<Rect left="480" top="444" right="580" bottom="476"/>
<Script>
	engine.LastError = 0
	engine.StatValue = tostring(Dackelwinkel)</Script><assessment no="18" name="DEP1304" type="8" flags="105"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="统计_对称角">
<Rect left="480" top="504" right="580" bottom="536"/>
<Script>
	engine.LastError = 0
	engine.StatValue = tostring(SymmetricAngle)
</Script><assessment no="19" name="DEP1305" type="8" flags="105"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="统计_总结果">
<Rect left="480" top="564" right="580" bottom="596"/>
<Script>if (RespTransverse_Result == 1) then
	engine.LastError = 0
else
	engine.LastError = 1
end
engine.StatValue = tostring(RespTransverse_Result)</Script><assessment no="37" name="DEP1323" type="8" flags="105"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="统计_前轴轴偏距">
<Rect left="250" top="344" right="350" bottom="376"/>
<Script>if(AxialOffset_FA_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(AxialOffset_FA)
elseif(AxialOffset_FA_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(AxialOffset_FA)
elseif(AxialOffset_FA_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(AxialOffset_FA)
elseif(AxialOffset_FA_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(AxialOffset_FA) 
elseif(AxialOffset_FA_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(AxialOffset_FA) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(AxialOffset_FA)
end</Script><assessment no="16" name="DEP1302" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="统计_后轴轴偏距">
<Rect left="250" top="394" right="350" bottom="426"/>
<Script>if(AxialOffset_RA_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(AxialOffset_RA)
elseif(AxialOffset_RA_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(AxialOffset_RA)
elseif(AxialOffset_RA_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(AxialOffset_RA)
elseif(AxialOffset_RA_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(AxialOffset_RA) 
elseif(AxialOffset_RA_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(AxialOffset_RA) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(AxialOffset_RA)
end</Script><assessment no="17" name="DEP1303" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="统计_蟹行角">
<Rect left="250" top="444" right="350" bottom="476"/>
<Script>if(Dackelwinkel_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(Dackelwinkel)
elseif(Dackelwinkel_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(Dackelwinkel)
elseif(Dackelwinkel_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(Dackelwinkel)
elseif(Dackelwinkel_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(Dackelwinkel) 
elseif(Dackelwinkel_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(Dackelwinkel) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(Dackelwinkel)
end</Script><assessment no="18" name="DEP1304" type="8" flags="105"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="统计_对称角">
<Rect left="250" top="504" right="350" bottom="536"/>
<Script>if(SymmetricAngle_Result == 0 ) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 0,Measured value invalid : "..tostring(SymmetricAngle)
elseif(SymmetricAngle_Result == 1) then
	engine.LastError = 0
	engine.StatValue = tostring(SymmetricAngle)
elseif(SymmetricAngle_Result == 2) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 2,NOK, settings NOK : "..tostring(SymmetricAngle)
elseif(SymmetricAngle_Result == 3) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 3,NOK, Value too low : "..tostring(SymmetricAngle) 
elseif(SymmetricAngle_Result == 4) then
	engine.LastError = 1
	engine.StatValue = "Evaluation = 4,NOK, Value too high : "..tostring(SymmetricAngle) 
else
	engine.LastError = 1
        engine.StatValue = "Evaluation = Unknown:"..tostring(SymmetricAngle)
end</Script><assessment no="19" name="DEP1305" type="8" flags="105"/>
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
<Transition StartId="71" EndId="66" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="75" type="0">
</Transition>
</Transitions>
</Process>

