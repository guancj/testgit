<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1600" pbltext="DEP1449">
<Parameters>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="isOK" type="3" dir="1" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="460" top="11" right="560" bottom="43"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="460" top="684" right="560" bottom="716"/>
<Script></Script></End>
<Activities>
<Activity id="5" ActivityType="3" flags="0" name="轴重设置">
<Rect left="460" top="114" right="560" bottom="146"/>
<Script>if (LibGeneral.CarTNC_HS7(engine.CarType)) then
	Weight_FA = 11671
	Weight_RA = 10603
end


if (LibGeneral.CarTNC_HS7(engine.CarType) == false) then
	Weight_FA = 8820;
	Weight_RA = 7840;
end

if (LibGeneral.CarTNC_C229(engine.CarType) == true) then
	Weight_FA = 10217;
	Weight_RA = 9431;
end

engine.println("##### Weight_FA = " .. Weight_FA .. "\n");
engine.println("##### Weight_RA = " .. Weight_RA .. "\n");

engine.StatValue = "Weight_FA : " .. tostring(Weight_FA) .. " ; Weight_RA : " .. tostring(Weight_RA)
engine.LastError = 0</Script></Activity>
<Activity id="22" ActivityType="5" flags="0" name="驻车制动力">
<Rect left="1170" top="514" right="1270" bottom="546"/>
<SubProcesses>
<SubProcess id="CheckBrakeForceHand1">
<Parameters>
<Parameter id="Weight_RA" value="Weight_RA"/>
<Parameter id="PedalFlag" value="PedalFlag"/>
<Parameter id="BrakeForce_Hand" value="0" ret="BrakeForce_Hand"/>
<Parameter id="Weight_FA" value="Weight_FA"/>
<Parameter id="Handl" value="Handl"/>
<Parameter id="Result" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="测试完整性">
<Rect left="460" top="64" right="560" bottom="96"/>
<Script>engine.StatValue = "Test block incomplete"
engine.LastError = 1</Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="测试完整性">
<Rect left="460" top="614" right="560" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.StatValue = "Test block complete"
engine.LastError = 0</Script><assessment no="59" name="DEP1504" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="重试">
<Rect left="690" top="414" right="790" bottom="446"/>
<Line2Text Enable="1" Text="后轴制动力检测不合格"/>
<Line4Text Enable="1" Text="重试？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="30" ActivityType="4" flags="0" name="路由节点">
<Rect left="724" top="354" right="756" bottom="386"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="重试">
<Rect left="260" top="354" right="360" bottom="386"/>
<Line2Text Enable="1" Text="整车制动力检车不合格"/>
<Line4Text Enable="1" Text="重试？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="38" ActivityType="5" flags="0" name="EPB清除故障码">
<Rect left="460" top="544" right="560" bottom="576"/>
<SubProcesses>
<SubProcess id="EPB_Clear_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="41" ActivityType="5" flags="0" name="前轴制动力检测">
<Rect left="460" top="284" right="560" bottom="316"/>
<SubProcesses>
<SubProcess id="CheckBrakeForceFA">
<Parameters>
<Parameter id="Weight_FA" value="Weight_FA"/>
<Parameter id="maxBrakeForceFA" value="0" ret="BrakeForce_FA"/>
<Parameter id="Weight_RA" value="Weight_RA"/>
<Parameter id="Handl" value="Handl"/>
<Parameter id="Result" value="0" ret="isOK"/>
<Parameter id="PedalFlag" value="PedalFlag"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="是否进行制动踏板力检测">
<Rect left="190" top="144" right="290" bottom="176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="进行制动踏板力检测吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.DialogBackColor = "yellow";
#PRESSBUTTON

</Script></Activity>
<Activity id="130" ActivityType="3" flags="0" name="不进行踏板力">
<Rect left="460" top="234" right="560" bottom="266"/>
<Script>PedalFlag = false</Script></Activity>
<Activity id="131" ActivityType="3" flags="0" name="进行踏板力">
<Rect left="330" top="224" right="430" bottom="256"/>
<Script>PedalFlag = true</Script></Activity>
<Activity id="133" ActivityType="5" flags="0" name="后轴制动力检测">
<Rect left="460" top="354" right="560" bottom="386"/>
<SubProcesses>
<SubProcess id="CheckBrakeForceRA">
<Parameters>
<Parameter id="Weight_RA" value="Weight_RA"/>
<Parameter id="BrakeForce_RA" value="0" ret="BrakeForce_RA"/>
<Parameter id="PedalFlag" value="PedalFlag"/>
<Parameter id="Handl" value="Handl"/>
<Parameter id="Result" value="0" ret="isOK"/>
<Parameter id="Weight_FA" value="Weight_FA"/>
<Parameter id="BrakeForce_FA" value="BrakeForce_FA"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="134" ActivityType="5" flags="0" name="驻车制动力">
<Rect left="460" top="494" right="560" bottom="526"/>
<SubProcesses>
<SubProcess id="CheckBrakeForceHand">
<Parameters>
<Parameter id="Weight_RA" value="Weight_RA"/>
<Parameter id="PedalFlag" value="PedalFlag"/>
<Parameter id="BrakeForce_Hand" value="0" ret="BrakeForce_Hand"/>
<Parameter id="Weight_FA" value="Weight_FA"/>
<Parameter id="Handl" value="Handl"/>
<Parameter id="Result" value="0" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="IDT错误退出">
<Rect left="610" top="284" right="710" bottom="316"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script></Activity>
<Activity id="138" ActivityType="3" flags="0" name="IDT错误退出">
<Rect left="610" top="324" right="710" bottom="356"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script></Activity>
<Activity id="139" ActivityType="3" flags="0" name="IDT错误退出">
<Rect left="610" top="494" right="710" bottom="526"/>
<Script>engine.UdpHandleVarSet(Handl, "_FINISHFLAG", true)</Script></Activity>
<Activity id="140" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="544" right="416" bottom="576"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="25" type="0">
</Transition>
<Transition StartId="5" EndId="42" type="0">
</Transition>
<Transition StartId="25" EndId="5" type="0">
</Transition>
<Transition StartId="26" EndId="2" type="0">
</Transition>
<Transition StartId="29" EndId="30" type="6">
</Transition>
<Transition StartId="29" EndId="134" type="0">
</Transition>
<Transition StartId="30" EndId="133" type="0">
</Transition>
<Transition StartId="34" EndId="134" type="0">
</Transition>
<Transition StartId="34" EndId="41" type="6">
</Transition>
<Transition StartId="38" EndId="26" type="0">
</Transition>
<Transition StartId="41" EndId="133" type="0">
</Transition>
<Transition StartId="41" EndId="136" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="42" EndId="130" type="0">
</Transition>
<Transition StartId="42" EndId="131" type="6">
</Transition>
<Transition StartId="130" EndId="41" type="0">
</Transition>
<Transition StartId="131" EndId="41" type="0">
</Transition>
<Transition StartId="133" EndId="29" type="1">
<Expression>isOK == 1</Expression></Transition>
<Transition StartId="133" EndId="34" type="1">
<Expression>isOK == 2</Expression></Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="133" EndId="138" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="134" EndId="38" type="0">
</Transition>
<Transition StartId="134" EndId="139" type="1">
<Expression>isOK == 3</Expression></Transition>
<Transition StartId="134" EndId="140" type="1">
<Expression>LibGeneral.CarTNC_HS7(engine.CarType) or LibGeneral.CarTNC_C229(engine.CarType)</Expression></Transition>
<Transition StartId="140" EndId="26" type="0">
</Transition>
</Transitions>
</Process>

