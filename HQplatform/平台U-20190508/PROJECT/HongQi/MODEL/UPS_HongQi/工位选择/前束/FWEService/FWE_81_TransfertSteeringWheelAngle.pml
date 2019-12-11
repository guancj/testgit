<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="ExecStep" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="364" right="580" bottom="396"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.Delay(50)
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="164" right="580" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b01010001@5==0b00000000&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_51_TransfertSteeringWheelAngle">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="方向盘角度"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="300"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="700" top="94" right="800" bottom="126"/>
<Script>ret = false
engine.println(" &lt;FWE_81_TransfertSteeringWheelAngle&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="63" ActivityType="3" flags="1" name="OK">
<Rect left="480" top="294" right="580" bottom="326"/>
<Script>if (ret == true) then
	isOK = true;
	engine.LastError = 0
        engine.StatValue = "FWE 81 Service"
	engine.println(" &lt;FWE_81_TransfertSteeringWheelAngle&gt; ")
else
	isOK = false;
	engine.LastError = 1
        engine.StatValue = "FWE 81 Service"
	engine.SetLineText(1,"FWE SERVICE 81 ERROR")
	engine.DialogBackColor = "red";
	engine.Delay(2000)
	engine.DialogBackColor = -1;
	engine.println(" &lt;FWE_81_TransfertSteeringWheelAngle_Err&gt; @Dpin ")
end</Script><assessment no="14" name="DEP1300" type="8" flags="97"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="获取方向盘角度">
<Rect left="170" top="164" right="270" bottom="196"/>
<Script>factor = 0.01

LastOKdata =  engine.UdpHandleVarGet(FWEHndl, "_LASTSNDTEL");

str_recev = LibGeneral.hex2str(LastOKdata)
print(str_recev)
SteerAngle = LibIDT.idtSigned2float(LastOKdata:sub(7,7):byte(),LastOKdata:sub(8,8):byte(),factor);

print("SteerAngle:"..SteerAngle)
engine.LastError = 0
engine.StatValue = tostring(SteerAngle)
engine.SharedVarSet("SteerAngle",SteerAngle)
isOK = true</Script><assessment no="15" name="DEP1301" type="8" flags="105"/>
</Activity>
<Activity id="69" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="340" top="164" right="440" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b01010001@5==0b00000001&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0 and ExecStep == 3</Expression></Transition>
<Transition StartId="3" EndId="58" type="0">
</Transition>
<Transition StartId="3" EndId="67" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0 and ExecStep == 2</Expression></Transition>
<Transition StartId="3" EndId="69" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0 and ExecStep == 1</Expression></Transition>
<Transition StartId="4" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="63" type="0">
</Transition>
<Transition StartId="58" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="2" type="0">
</Transition>
<Transition StartId="67" EndId="2" type="0">
</Transition>
<Transition StartId="69" EndId="56" type="0">
</Transition>
</Transitions>
</Process>

