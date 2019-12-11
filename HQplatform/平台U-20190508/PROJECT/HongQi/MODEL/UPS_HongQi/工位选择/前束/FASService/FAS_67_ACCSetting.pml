<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FASHndl" type="3" dir="0" data="0"/>
<Variable id="Type" type="8" dir="0" data=""/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="420" top="34" right="520" bottom="66"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="420" top="434" right="520" bottom="466"/>
<Script></Script><Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="420" top="94" right="520" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="6" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="420" top="154" right="520" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FASHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b01000011&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="ACCSetting_Data">
<Rect left="420" top="214" right="520" bottom="246"/>
<Script>frt = engine.SharedVarGet("AxialOffset_FA")
rea = engine.SharedVarGet("AxialOffset_RA")

if (frt - rea &gt; 0) then
	carDit = -1  --右偏
elseif(frt - rea &lt; 0) then
	carDit = 1   --左偏
else
	carDit = 0
end

absValue = math.abs(frt-rea)

print("absValue:"..absValue)
shiftValue = absValue / 2970 * (2970+2634)
print("shiftValue_b"..shiftValue)
shiftValue = math.floor(shiftValue + 0.5)
print("shiftValue_f"..shiftValue)

if (Type == "Start") then
	AccY= -3800 + carDit * shiftValue
        AccZ= 2546
elseif (Type == "Stop") then
	AccY= 19500
        AccZ= 1400
else
end

if(AccY &lt; 0) then
	AccY = 65536 + AccY
end

if(AccZ &lt; 0) then
	AccZ = 65536 + AccZ
end
print("AccY:"..AccY)
print("AccZ:"..AccZ)
TempByte7 = math.floor(AccY / 0x100)
TempByte8 = AccY % 0x100
idt_tel = LibIDT.idtSetBytes(idt_tel,7,1,string.char(TempByte7))
idt_tel = LibIDT.idtSetBytes(idt_tel,8,1,string.char(TempByte8))

TempByte9 = math.floor(AccZ / 0x100)
TempByte10 = AccZ % 0x100
idt_tel = LibIDT.idtSetBytes(idt_tel,9,1,string.char(TempByte9))
idt_tel = LibIDT.idtSetBytes(idt_tel,10,1,string.char(TempByte10))</Script></Activity>
<Activity id="10" ActivityType="13" flags="1" name="FAS_ACCSetting">
<Rect left="420" top="284" right="520" bottom="316"/>
<Line4Text Enable="1" Text="移动ACC标定板"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="100"/>
<Parameter id="pHndl" value="FASHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="640" top="94" right="740" bottom="126"/>
<Script>engine.println(" &lt;FAS_61_LDWSet&gt; : handle invalid --&gt;"..tostring(FASHndl))</Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="NOK">
<Rect left="640" top="284" right="740" bottom="316"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FAS Service 67"
engine.SetLineText(1,"FAS SERVICE 67 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;

engine.println(" &lt;FAS_67_ACCSetting_Err&gt; @Dpin ")</Script><assessment no="123" name="DEP1435" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="434" right="706" bottom="466"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="OK">
<Rect left="420" top="354" right="520" bottom="386"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FAS Service 67"
engine.println(" &lt;FAS_67_ACCSetting&gt; OK ")</Script><assessment no="123" name="DEP1435" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="6" type="1">
<Expression>FASHndl~=nil and FASHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="11" type="0">
</Transition>
<Transition StartId="6" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="66" type="0">
</Transition>
<Transition StartId="10" EndId="69" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="11" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="2" type="0">
</Transition>
<Transition StartId="69" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

