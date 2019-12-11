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
<Script></Script><Line4Text Enable="1"/>
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
<Parameter id="BitOrByte" value="&quot;@2==0b00111101&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="3" flags="1" name="LDWSetting_Data">
<Rect left="420" top="214" right="520" bottom="246"/>
<Script>if (Type == "Start") then
	HoeheTafelLDW = 1000
elseif (Type == "Stop") then
	HoeheTafelLDW = 2410
else

end
if(HoeheTafelLDW &gt;= 0 and HoeheTafelLDW &lt;= 6553.6) then
	iHeightBoardLDW = HoeheTafelLDW * 10.0
        TempByte5 = math.floor(iHeightBoardLDW / 0x100)
        TempByte6 = iHeightBoardLDW % 0x100
        idt_tel = LibIDT.idtSetBytes(idt_tel,5,1,string.char(TempByte5))
        idt_tel = LibIDT.idtSetBytes(idt_tel,6,1,string.char(TempByte6))
   
else
engine.LastError = 1
engine.println("FAS_61_LDW_HeightPanel : Errror :Prameter -- &gt;HoeheTafelLDW  invalid")
end</Script></Activity>
<Activity id="10" ActivityType="13" flags="0" name="FAS_61_LDWSetting">
<Rect left="420" top="284" right="520" bottom="316"/>
<Line4Text Enable="1" Text="移动LDW标定板"/>
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
engine.StatValue = "FAS Service 61"
engine.SetLineText(1,"FAS SERVICE 61 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;

engine.println(" &lt;FAS_61_LDWSetting_Err&gt; @Dpin ")</Script><assessment no="122" name="DEP1408" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="434" right="706" bottom="466"/>
</Activity>
<Activity id="69" ActivityType="3" flags="0" name="OK">
<Rect left="420" top="354" right="520" bottom="386"/>
<Script>
isOK = true;
engine.LastError = 0
engine.StatValue = "FAS Service 61"
engine.println(" &lt;FAS_61_LDWSetting&gt; OK ")</Script><assessment no="122" name="DEP1408" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="OK">
<Rect left="280" top="354" right="380" bottom="386"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "FAS Service 61"
engine.println(" &lt;FAS_61_LDWSetting&gt; OK ")</Script><assessment no="124" name="DEP1448" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="NOK">
<Rect left="710" top="214" right="810" bottom="246"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "FAS Service 61"
engine.SetLineText(1,"FAS SERVICE 61 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;

engine.println(" &lt;FAS_61_LDWSetting_Err&gt; @Dpin ")</Script><assessment no="124" name="DEP1448" type="8" flags="97"/>
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
<Transition StartId="10" EndId="66" type="1">
<Expression>ret ~= true and Type == "Start"</Expression></Transition>
<Transition StartId="10" EndId="69" type="1">
<Expression>ret == true and Type == "Start"</Expression></Transition>
<Transition StartId="10" EndId="70" type="1">
<Expression>ret == true and Type == "Stop"</Expression></Transition>
<Transition StartId="10" EndId="71" type="1">
<Expression>ret ~= true and Type == "Stop"</Expression></Transition>
<Transition StartId="11" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="68" type="0">
</Transition>
<Transition StartId="68" EndId="2" type="0">
</Transition>
<Transition StartId="69" EndId="2" type="0">
</Transition>
<Transition StartId="70" EndId="2" type="0">
</Transition>
<Transition StartId="71" EndId="68" type="0">
</Transition>
</Transitions>
</Process>

