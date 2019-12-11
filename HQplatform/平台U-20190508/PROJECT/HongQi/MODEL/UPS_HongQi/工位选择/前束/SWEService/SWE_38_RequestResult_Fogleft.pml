<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="590" top="48" right="690" bottom="80"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="590" top="384" right="690" bottom="416"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" name="idtCommonSend">
<Rect left="590" top="184" right="690" bottom="216"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00100110@23==0b00000000@24==0b00000100&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" name="SWE_38_LampResult">
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
<Activity id="47" ActivityType="3" name="NOK">
<Rect left="838" top="248" right="938" bottom="280"/>
<Line2Text Enable="1" Text="SWE 38 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script></Activity>
<Activity id="48" ActivityType="3" name="判断通讯句柄">
<Rect left="590" top="112" right="690" bottom="144"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" name="Handle invalid">
<Rect left="838" top="112" right="938" bottom="144"/>
<Script>engine.println(" &lt;SWEHndl_08&gt; : handle invalid --&gt;"..tostring(SWEHndl))</Script></Activity>
<Activity id="53" ActivityType="4" name="路由节点">
<Rect left="872" top="384" right="904" bottom="416"/>
</Activity>
<Activity id="55" ActivityType="3" name="结果获取">
<Rect left="590" top="312" right="690" bottom="344"/>
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
LightAdjustResult = recvData:sub(23,23):byte()


print("HeightAfterAdjust_Fogleft:"..HeightAfterAdjust)
print("SideAfterAdjust_Fogleft:"..SideAfterAdjust)

print("HeightBeforeAdjust_Fogleft:"..HeightBeforeAdjust)
print("SideBeforeAdjust_Fogleft:"..SideBeforeAdjust)

print("TargetNominalHeight_Fogleft:"..TargetNominalHeight)
print("TargetNominalSide_Fogleft:"..TargetNominalSide)

print("LightAdjustResult_Fogleft:"..LightAdjustResult)

if (LightAdjustResult == 1) then
	resultStat = 1
 else
	resultStat = 0
 end   


</Script></Activity>
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
<Transition StartId="55" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

