<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="5" ptbtext="DEP807" group="31" pbltext="DEP818">
<Parameters>
<Variable id="BrakeForce_FA" type="5" dir="0" data="0" description="前轴制动力"/>
<Variable id="BrakeForce_RA" type="5" dir="0" data="0" description="后轴制动力"/>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="UTG_BrakeForce_OA" type="5" data="0" description="整车制动力标称值"/>
<Variable id="BrakeForce_ALL" type="5" data="0" description="整车制动力"/>
<Variable id="PreValue" type="5" data="0" description="整车制动占总质量的百分比"/>
<Variable id="TitleText" type="8" data="&quot;转毂中 - 整车制动力&quot;"/>
<Variable id="FISeQS_Error" type="3" data="0" description="FISeQS_Error"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="50" top="4" right="150" bottom="36"/>
<Script></Script><TitleText Enable="1" Text="&amp;TitleText"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="54" top="457" right="154" bottom="489"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" name="整车制动力">
<Rect left="47" top="111" right="147" bottom="143"/>
<Script>UTG_BrakeForce_OA = (Weight_FA + Weight_RA) * 0.6;
BrakeForce_ALL = BrakeForce_FA + BrakeForce_RA;
if(BrakeForce_ALL &gt;= UTG_BrakeForce_OA)
then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end;
engine.println("##### UTG_BrakeForce_OA : " .. UTG_BrakeForce_OA .. "\n");
engine.println("##### BrakeForce_ALL : " .. BrakeForce_ALL .. " Result : " .. engine.LastError .. "\n");


strBrakeForce_ALL = tostring(math.floor(BrakeForce_ALL))

engine.StatValue = string.format("%.2f", BrakeForce_ALL)
engine.StatLower = tostring(UTG_BrakeForce_OA)
engine.StatUpper = "20000"</Script><assessment no="39" name="DEP855" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" name="百分比">
<Rect left="46" top="232" right="146" bottom="264"/>
<Script>PreValue = BrakeForce_ALL / (Weight_FA + Weight_RA) * 100;
if(PreValue &gt; 60) then
 engine.LastError = 0;
 FISeQS_Error = 0
else
 engine.LastError = -1;
 FISeQS_Error = 1
end
engine.println("##### PreValue : " .. PreValue .. " Result : " .. engine.LastError .. "\n");

strPreValue = tostring(string.format("%.1f", PreValue))

engine.StatValue = string.format("%.2f", PreValue)
engine.StatLower = "60"
engine.StatUpper = "200"</Script><assessment no="40" name="DEP856" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="201" top="166" right="301" bottom="198"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="131"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strBrakeForce_ALL"/>
<Parameter id="Unit" value="&quot;N&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="43" name="DEP915" type="8" flags="105"/>
</Activity>
<Activity id="8" ActivityType="3" name="结果不合格">
<Rect left="200" top="110" right="300" bottom="142"/>
<Script>Result = 1</Script></Activity>
<Activity id="9" ActivityType="13" name="FISeQS_Measuring_String">
<Rect left="199" top="285" right="299" bottom="317"/>
<FunctionRef id="FISeQS_Measuring_String" model="LibVW">
<Parameters>
<Parameter id="MeasuredID" value="132"/>
<Parameter id="Result" value="FISeQS_Error"/>
<Parameter id="MeasureValue" value="strPreValue"/>
<Parameter id="Unit" value="&quot;%&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="44" name="DEP916" type="8" flags="105"/>
</Activity>
<Activity id="10" ActivityType="3" name="结果不合格">
<Rect left="200" top="231" right="300" bottom="263"/>
<Script>Result = 1</Script></Activity>
<Activity id="11" ActivityType="3" name="结果初始化">
<Rect left="48" top="54" right="148" bottom="86"/>
<Script>Result = 0</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="11" type="0">
</Transition>
<Transition StartId="3" EndId="8" type="4">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="4" EndId="10" type="4">
</Transition>
<Transition StartId="7" EndId="4" type="0">
</Transition>
<Transition StartId="8" EndId="7" type="0">
</Transition>
<Transition StartId="9" EndId="2" type="0">
</Transition>
<Transition StartId="10" EndId="9" type="0">
</Transition>
<Transition StartId="11" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

