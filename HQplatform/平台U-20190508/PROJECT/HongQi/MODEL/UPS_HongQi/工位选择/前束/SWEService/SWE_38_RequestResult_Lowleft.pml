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
<Rect left="590" top="674" right="690" bottom="706"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="590" top="176" right="690" bottom="208"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00100110@23==0b00000000@24==0b00000001@25==0b00000000&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="SWE_38_LampResult">
<Rect left="590" top="240" right="690" bottom="272"/>
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
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="590" top="112" right="690" bottom="144"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="838" top="112" right="938" bottom="144"/>
<Script>engine.println(" &lt;SWEHndl_08&gt; : handle invalid --&gt;"..tostring(SWEHndl))</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="结果获取">
<Rect left="590" top="304" right="690" bottom="336"/>
<Script>local factor = 0.01

--获取调整后高度
HeightAfterAdjust = LibIDT.idtSigned2float(recvData:sub(13,13):byte(),recvData:sub(14,14):byte(),factor);
--获取调整后宽度
SideAfterAdjust = LibIDT.idtSigned2float(recvData:sub(15,15):byte(),recvData:sub(16,16):byte(),factor);


--获取调整前高度
HeightBeforeAdjust = LibIDT.idtSigned2float(recvData:sub(17,17):byte(),recvData:sub(18,18):byte(),factor);
--获取调整前宽度
SideBeforeAdjust = LibIDT.idtSigned2float(recvData:sub(19,19):byte(),recvData:sub(20,20):byte(),factor);


--获取设置的标称高度
TargetNominalHeight = LibIDT.idtSigned2float(recvData:sub(21,21):byte(),recvData:sub(22,22):byte(),factor);
--获取设置的标称宽度
TargetNominalSide = LibIDT.idtSigned2float(recvData:sub(23,23):byte(),recvData:sub(24,24):byte(),factor);

--调整结果
LightAdjustResult = recvData:sub(33,33):byte()


print("HeightAfterAdjust_Lowleft:"..HeightAfterAdjust)
print("SideAfterAdjust_Lowleft:"..SideAfterAdjust)

print("HeightBeforeAdjust_Lowleft:"..HeightBeforeAdjust)
print("SideBeforeAdjust_Lowleft:"..SideBeforeAdjust)

print("TargetNominalHeight_Lowleft:"..TargetNominalHeight)
print("TargetNominalSide_Lowleft:"..TargetNominalSide)

print("LightAdjustResult_Lowleft:"..LightAdjustResult)


if (LightAdjustResult == 1) then
	resultStat = 1
 else
	resultStat = 0
 end   
      

isOK = true
</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="统计左近光灯调整前高度">
<Rect left="370" top="304" right="470" bottom="336"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(HeightBeforeAdjust)</Script><assessment no="2" name="DEP1366" type="8" flags="105"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="统计左近光灯调整前宽度">
<Rect left="370" top="354" right="470" bottom="386"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(SideBeforeAdjust)</Script><assessment no="3" name="DEP1367" type="8" flags="105"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="统计左近光灯调整后高度">
<Rect left="370" top="404" right="470" bottom="436"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(HeightAfterAdjust)</Script><assessment no="4" name="DEP1368" type="8" flags="105"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="统计左近光灯调整后宽度">
<Rect left="370" top="454" right="470" bottom="486"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(SideAfterAdjust)</Script><assessment no="5" name="DEP1369" type="8" flags="105"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="统计左近光灯标称高度">
<Rect left="370" top="504" right="470" bottom="536"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(TargetNominalHeight)</Script><assessment no="6" name="DEP1370" type="8" flags="105"/>
</Activity>
<Activity id="61" ActivityType="3" flags="0" name="统计左近光灯标称宽度">
<Rect left="370" top="554" right="470" bottom="586"/>
<Script>engine.LastError = 0  
engine.StatValue =  tostring(TargetNominalSide)</Script><assessment no="7" name="DEP1371" type="8" flags="105"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="统计调整结果">
<Rect left="370" top="604" right="470" bottom="636"/>
<Script>if (LightAdjustResult == 1) then
	engine.LastError = 0  
else
	engine.LastError = 1
end
engine.StatValue =  tostring(LightAdjustResult)</Script><assessment no="8" name="DEP1372" type="8" flags="105"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="SWE服务统计OK">
<Rect left="590" top="604" right="690" bottom="636"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "SWE Service 38 Lowleft"
engine.println(" &lt;FWE_38_RequestResult_Lowleft&gt; OK")
</Script><assessment no="9" name="DEP1373" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="SWE服务统计NOK">
<Rect left="840" top="234" right="940" bottom="266"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "SWE Service 38 Lowleft"
engine.SetLineText(1,"SWE SERVICE 38 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;
engine.println(" &lt;FWE_38_RequestResult_Lowleft_Err&gt; @Dpin ")</Script><assessment no="87" name="DEP1373" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="674" right="906" bottom="706"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="55" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="64" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>SWEHndl~=nil and SWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="49" EndId="64" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="2" type="0">
</Transition>
<Transition StartId="64" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

