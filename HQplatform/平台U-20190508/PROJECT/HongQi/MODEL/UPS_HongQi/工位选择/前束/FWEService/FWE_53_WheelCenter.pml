<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="34" right="530" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="420" top="624" right="520" bottom="656"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="430" top="84" right="530" bottom="116"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="430" top="144" right="530" bottom="176"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00110101@5==0b???????0&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="FWE_53_WheelCenter">
<Rect left="430" top="204" right="530" bottom="236"/>
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
<Activity id="58" ActivityType="3" flags="0" name="数据获取">
<Rect left="430" top="264" right="530" bottom="296"/>
<Script>local factor = 0.1

--获取左前轮胎中心点
WheelCenter_FL = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);
--获取右前轮胎中心点
WheelCenter_FR = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);
--获取左后轮胎中心点
WheelCenter_RL = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);
--获取右后轮胎中心点
WheelCenter_RR = LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);


--获取前轮轮胎中心点差值
WheelCenter_Diff_FA = LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);


--获取后轮轮胎中心点差值
WheelCenter_Diff_RA = LibIDT.idtSigned2float(recvData:sub(23,23):byte(),recvData:sub(24,24):byte(),factor);

--各结果
WheelCenter_FL_RS = string.byte(recvData:sub(29,29));
WheelCenter_FR_RS = string.byte(recvData:sub(30,30));
WheelCenter_RL_RS = string.byte(recvData:sub(31,31));
WheelCenter_RR_RS = string.byte(recvData:sub(32,32));

WheelCenter_Diff_FA_RS = string.byte(recvData:sub(33,33));
WheelCenter_Diff_RA_RS = string.byte(recvData:sub(34,34));
--总结果
All_Result = string.byte(recvData:sub(36,36));



print("#### WheelCenter_FL : "..WheelCenter_FL);
print("#### WheelCenter_FR : "..WheelCenter_FR);
print("#### WheelCenter_RL : "..WheelCenter_RL);
print("#### WheelCenter_RR : "..WheelCenter_RR);
print("#### WheelCenter_Diff_FA : "..WheelCenter_Diff_FA);
print("#### WheelCenter_Diff_RA : "..WheelCenter_Diff_RA);
print("#### Result : "..All_Result);

engine.SharedVarSet("HeiFL",WheelCenter_FL)
engine.SharedVarSet("HeiFR",WheelCenter_FR)
engine.SharedVarSet("HeiRL",WheelCenter_RL)
engine.SharedVarSet("HeiRR",WheelCenter_RR)</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="690" top="84" right="790" bottom="116"/>
<Script>engine.println(" &lt;FWE_31_WheelHousing&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="NOK">
<Rect left="690" top="204" right="790" bottom="236"/>
<Line2Text Enable="1" Text="FWE SERVICE 35 ERROR"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FWE 轮心高度测量"
engine.println(" &lt;FWE_53_WheelCenter&gt; ")
engine.DialogBackColor = "red";</Script><assessment no="62" name="DEP1348" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="624" right="756" bottom="656"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="统计左前轮胎中心点高度">
<Rect left="240" top="264" right="340" bottom="296"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_FL)</Script><assessment no="55" name="DEP1341" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="isOK">
<Rect left="420" top="564" right="520" bottom="596"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FWE Service 53"
engine.println(" &lt;FWE_53_WheelCenter&gt; ")</Script><assessment no="62" name="DEP1348" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="统计右前轮胎中心点高度">
<Rect left="240" top="314" right="340" bottom="346"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_FR)</Script><assessment no="56" name="DEP1342" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="统计左后轮胎中心点高度">
<Rect left="240" top="364" right="340" bottom="396"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_RL)</Script><assessment no="57" name="DEP1343" type="8" flags="97"/>
</Activity>
<Activity id="73" ActivityType="3" flags="1" name="统计右后轮胎中心点高度">
<Rect left="240" top="414" right="340" bottom="446"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_RR)</Script><assessment no="58" name="DEP1344" type="8" flags="97"/>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="统计前轮轮胎中心点差值">
<Rect left="240" top="464" right="340" bottom="496"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_Diff_FA)</Script><assessment no="59" name="DEP1345" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="统计后轮轮胎中心点差值">
<Rect left="240" top="514" right="340" bottom="546"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(WheelCenter_Diff_RA)</Script><assessment no="60" name="DEP1346" type="8" flags="97"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="统计轮心高度测量结果">
<Rect left="240" top="564" right="340" bottom="596"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(All_Result)</Script><assessment no="61" name="DEP1347" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
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
<Transition StartId="69" EndId="71" type="0">
</Transition>
<Transition StartId="70" EndId="2" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="75" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="70" type="0">
</Transition>
</Transitions>
</Process>

