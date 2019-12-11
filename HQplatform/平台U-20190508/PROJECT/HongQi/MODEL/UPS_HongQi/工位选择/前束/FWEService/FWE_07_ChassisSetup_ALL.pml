<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="420" top="24" right="520" bottom="56"/>
<Script></Script><TitleText Enable="1" Text="前束检测"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="422" top="392" right="522" bottom="424"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="420" top="84" right="520" bottom="116"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="422" top="200" right="522" bottom="232"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="IDTsend"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="FWE_07_ChassisSetup_FA">
<Rect left="422" top="256" right="522" bottom="288"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="3600"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="670" top="84" right="770" bottom="116"/>
<Script>engine.println(" &lt;FAS_28_TransversePosition&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="OK">
<Rect left="422" top="328" right="522" bottom="360"/>
<Script>if (ret == true) then
	isOK = true;
	engine.LastError = 0
        engine.StatValue = "FWE 07 Service"
	engine.println(" &lt;FWE_07_ChassisSetup_All&gt; OK")
else
	isOK = false;
	engine.LastError = 1
        engine.StatValue = "FWE 07 Service"
	engine.SetLineText(1,"FWE SERVICE 07 ERROR")
	engine.DialogBackColor = "red";
	engine.Delay(2000)
	engine.DialogBackColor = -1;
	engine.println(" &lt;FWE_07_ChassisSetupAll_Err&gt; @Dpin ")
end</Script><assessment no="63" name="DEP1349" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="1" name="报文设置">
<Rect left="422" top="144" right="522" bottom="176"/>
<Script>--[[if (engine.SharedVarGet("RearAxleFlag") == false) then
	IDTsend = "@2==0b00000111@5==0b00000010"
        engine.SetLineText(1,"前轴调整")
else
	IDTsend = "@2==0b00000111@5==0b00000011"
         engine.SetLineText(1,"前后轴调整")
end

engine.ShowMessage() --]]

IDTsend = "@2==0b00000111@5==0b00000011"
engine.SetLineText(1,"前后轴调整")</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="67" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="57" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="60" type="0">
</Transition>
<Transition StartId="57" EndId="60" type="0">
</Transition>
<Transition StartId="60" EndId="2" type="0">
</Transition>
<Transition StartId="67" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

