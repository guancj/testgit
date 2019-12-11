<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1610" pbltext="DEP2239">
<Parameters>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
<Variable id="BrakeForce_Hand" type="5" dir="1" data="0" description="驻车力"/>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="710" top="54" right="810" bottom="86"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="710" top="1214" right="810" bottom="1246"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="标称值计算">
<Rect left="710" top="104" right="810" bottom="136"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="挂空挡不踩刹车"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Result = 0
UTG_BrakeForce_RA = (Weight_RA + Weight_FA) * 0.2
UTG_DragForce_RL = Weight_RL * 0.1;
UTG_DragForce_RR = Weight_RR * 0.1;

engine.println("##### UTG_BrakeForce_RLRR : " .. UTG_BrakeForce_RA .. "\n");
</Script></Activity>
<Activity id="71" ActivityType="5" flags="0" name="后轴5km/h">
<Rect left="710" top="164" right="810" bottom="196"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="5.0"/>
<Parameter id="speedRR" value="5.0"/>
<Parameter id="torqueFL" value="2500"/>
<Parameter id="torqueFR" value="2500"/>
<Parameter id="torqueRL" value="2500"/>
<Parameter id="torqueRR" value="2500"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="速度检查">
<Rect left="710" top="264" right="810" bottom="296"/>
<Script>local TimeStart = os.time();
local breakLoop = false
local Timeout = 10
local idt_tel
local factor = 0.01
local TargetSpeed_FL = 0
local TargetSpeed_FR = 0
local TargetSpeed_RL = 5
local TargetSpeed_RR = 5
engine.LastError = 1

if(TargetSpeed_FL == 0) then
 FL_Max =0.1;
 FL_Min = 0;
else
 FL_Max = TargetSpeed_FL + 0.5;
 FL_Min = TargetSpeed_FL - 0.5;
end

if(TargetSpeed_FR == 0) then
 FR_Max = 0.1;
 FR_Min =  0;
else
 FR_Max = TargetSpeed_FR + 0.5;
 FR_Min = TargetSpeed_FR - 0.5;
end

if(TargetSpeed_RL == 0) then
 RL_Max = 0.1;
 RL_Min = 0;
else
 RL_Max = TargetSpeed_RL + 0.5;
 RL_Min = TargetSpeed_RL - 0.5;
end

if(TargetSpeed_RR == 0) then
 RR_Max = 0.1;
 RR_Min = 0;
else
 RR_Max = TargetSpeed_RR + 0.5;
 RR_Min = TargetSpeed_RR - 0.5;
end


repeat 

	idt_tel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL");
	print("LouderSpeakRev:"..LibGeneral.hex2str(idt_tel))

	tmpFL1 = string.byte(idt_tel:sub(13,13)) 
	tmpFL2 = string.byte(idt_tel:sub(14,14))
	tmpFR1 = string.byte(idt_tel:sub(15,15)) 
	tmpFR2 = string.byte(idt_tel:sub(16,16))

	tmpRL1 = string.byte(idt_tel:sub(17,17)) 
	tmpRL2 = string.byte(idt_tel:sub(18,18))
	tmpRR1 = string.byte(idt_tel:sub(19,19)) 
	tmpRR2 = string.byte(idt_tel:sub(20,20))

	ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor
	ReadSpeed_FR = LibIDT.idthilo2signed(tmpFR1,tmpFR2) * factor
	ReadSpeed_RL = LibIDT.idthilo2signed(tmpRL1,tmpRL2) * factor
	ReadSpeed_RR = LibIDT.idthilo2signed(tmpRR1,tmpRR2) * factor


	if(ReadSpeed_FL &gt;= FL_Min and ReadSpeed_FL &lt;= FL_Max and ReadSpeed_FR &gt;= FR_Min and ReadSpeed_FR &lt;= FR_Max and ReadSpeed_RL &gt;= RL_Min and ReadSpeed_RL &lt;= RL_Max and ReadSpeed_RR &gt;= RR_Min and ReadSpeed_RR &lt;= RR_Max) then
		breakLoop = true;
                engine.LastError = 0
		engine.println("##### Speed value : "..ReadSpeed_FL..";"..ReadSpeed_FR..";"..ReadSpeed_RL..";"..ReadSpeed_RR)
        end
        TimeDiff = os.difftime(os.time(),TimeStart)
        engine.Delay(20)
until(breakLoop or TimeDiff &gt; Timeout)

if (engine.LastError == 0) then
	engine.StatValue = "Speed Check OK"	
end

if (engine.LastError ~= 0) then
	engine.StatValue = "Speed Check NOK"	
        Result = 3
end</Script><assessment no="47" name="DEP1494" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="阻滞力获取">
<Rect left="710" top="314" right="810" bottom="346"/>
<Script>local i = 0
local oldRevTel = ""
local factor = 1.0
local curtRevTel

DragForceSum_RL = 0
DragForceSum_RR = 0
DragForce_RL = 0
DragForce_RR = 0

repeat 
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("手刹后轴阻滞力当前获取IDT报文:"..curtRevTelHex)
        if (curtRevTel ~= oldRevTel) then
		--获取左后轮制动力
		DragForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor;

		--获取右后轮制动力
		DragForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor;
		DragForceSum_RL = DragForceSum_RL + math.abs(DragForce_RL)
		DragForceSum_RR = DragForceSum_RR + math.abs(DragForce_RR)
                 oldRevTel = curtRevTel
                 i = i + 1
		print("手刹后轴制动力中阻滞力值:"..DragForce_RL..";"..DragForce_RR)
	end
        engine.Delay(10)
until(i == 10)

DragForce_RL = DragForceSum_RL / 10;
DragForce_RR = DragForceSum_RR / 10;

print("手刹后轴阻滞力10次平均值:"..DragForce_RL..";"..DragForce_RR)</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="手刹左后阻滞力评估">
<Rect left="710" top="374" right="810" bottom="406"/>
<Script>if(DragForce_RL &gt; 0 and DragForce_RL &lt;= UTG_DragForce_RL)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end
engine.println("##### DragForce_RL : " .. DragForce_RL .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_RL)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_RL)

</Script><assessment no="48" name="DEP1495" type="8" flags="105"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="手刹右后阻滞力评估">
<Rect left="710" top="434" right="810" bottom="466"/>
<Script>if(DragForce_RR &gt; 0 and DragForce_RR &lt;= UTG_DragForce_RR)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end
engine.println("##### DragForce_RR : " .. DragForce_RR .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_RR)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_RL)</Script><assessment no="49" name="DEP1496" type="8" flags="105"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="手刹左后阻滞力百分比">
<Rect left="710" top="494" right="810" bottom="526"/>
<Script>PreValue_DragForce_RL = DragForce_RL / Weight_RL * 100;
if(PreValue_DragForce_RL &gt;= 0 and PreValue_DragForce_RL &lt;= 10) then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end

engine.println("### PreValue_DragForce_RL= " .. tostring(PreValue_DragForce_RL) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_RL)
engine.StatLower = "0"
engine.StatUpper = "5"</Script><assessment no="50" name="DEP1497" type="8" flags="105"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="手刹右后阻滞力百分比">
<Rect left="710" top="554" right="810" bottom="586"/>
<Script>PreValue_DragForce_RR = DragForce_RR / Weight_RR * 100;
if(PreValue_DragForce_RR &gt;= 0 and PreValue_DragForce_RR &lt;= 10) then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end

engine.println("### PreValue_DragForce_RR= " .. tostring(PreValue_DragForce_RR) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_RR)
engine.StatLower = "0"
engine.StatUpper = "5"

</Script><assessment no="51" name="DEP1498" type="8" flags="105"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="获取后轴制动力">
<Rect left="710" top="614" right="810" bottom="646"/>
<Script>local TimeStart = os.time();
local TimeDiff
local oldRevTel = ""
local factor = 1.0

BrakeForce_RL = 0
BrakeForce_RR = 0

maxBrakeForceRL = 0
maxBrakeForceRR = 0
maxBrakeForceRA = 0

engine.SetLineText(0,"请拉手刹")

repeat

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
print("手刹制动力报文获取:"..LibGeneral.hex2str(curtRevTel))

if (curtRevTel ~= oldRevTel) then

	oldRevTel = curtRevTel

	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor

	BrakeForce_RL = BrakeForce_RL - DragForce_RL
	BrakeForce_RR = BrakeForce_RR - DragForce_RR
	BrakeForce_RA = BrakeForce_RL + BrakeForce_RR
	BrakeForce_Hand = BrakeForce_RA
        engine.println("##### BrakeForce RL/RR/RA : " .. BrakeForce_RL .. " / " .. BrakeForce_RR  .. " / " .. BrakeForce_Hand .. "\n");
	if (BrakeForce_RA &gt; maxBrakeForceRA) then
		maxBrakeForceRA = BrakeForce_RA
		maxBrakeForceRL = BrakeForce_RL
		maxBrakeForceRR = BrakeForce_RR
	end      
        
	print("手刹最大后轴制动力:"..maxBrakeForceRL..";"..maxBrakeForceRR..";"..maxBrakeForceRA)  
     
end

engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")

BrakeForceDiff_RA = math.abs(maxBrakeForceRL - maxBrakeForceRR) / math.max(maxBrakeForceRL,maxBrakeForceRR) * 100;

TimeDiff = os.time() - TimeStart

engine.Delay(30)


until((maxBrakeForceRA &gt; UTG_BrakeForce_RA  and BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 20) or  TimeDiff &gt; 20)






</Script></Activity>
<Activity id="127" ActivityType="5" flags="1" name="速度降为0km/h">
<Rect left="710" top="1034" right="810" bottom="1066"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="0"/>
<Parameter id="speedFR" value="0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="0"/>
<Parameter id="torqueFR" value="0"/>
<Parameter id="torqueRL" value="2000"/>
<Parameter id="torqueRR" value="2000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="检查毂速为0">
<Rect left="710" top="1154" right="810" bottom="1186"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local factor = 0.01
engine.LastError = 1
repeat
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	
	if (curtRevTel ~= oldRevTel) then
		print("4毂速度获取报文:"..LibGeneral.hex2str(curtRevTel))
		oldRevTel = curtRevTel	
        
		tmpFL1 = string.byte(curtRevTel:sub(13,13)) 
		tmpFL2 = string.byte(curtRevTel:sub(14,14))
		tmpFR1 = string.byte(curtRevTel:sub(15,15)) 
		tmpFR2 = string.byte(curtRevTel:sub(16,16))

		tmpRL1 = string.byte(curtRevTel:sub(17,17)) 
		tmpRL2 = string.byte(curtRevTel:sub(18,18))
		tmpRR1 = string.byte(curtRevTel:sub(19,19)) 
		tmpRR2 = string.byte(curtRevTel:sub(20,20))

		ReadSpeed_FL = LibIDT.idthilo2signed(tmpFL1,tmpFL2) * factor
		ReadSpeed_FR = LibIDT.idthilo2signed(tmpFR1,tmpFR2) * factor
		ReadSpeed_RL = LibIDT.idthilo2signed(tmpRL1,tmpRL2) * factor
		ReadSpeed_RR = LibIDT.idthilo2signed(tmpRR1,tmpRR2) * factor
	end	
        
	if (ReadSpeed_FL == 0 and ReadSpeed_FR == 0 and ReadSpeed_RL == 0 and ReadSpeed_RR == 0) then
		brk = 1
                engine.LastError = 0
	end
	TimeDiff = os.difftime(os.time(),TimeStart)
		
until (brk == 1 or TimeDiff &gt; 10)


if (TimeDiff &gt; 10) then
	Result = 3
        print ("10s内 毂速并没有降为0!!")
end</Script><assessment no="58" name="DEP1489" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="退出">
<Rect left="860" top="1034" right="960" bottom="1066"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "Hand 0km 03 service failure"</Script><assessment no="57" name="DEP1488" type="8" flags="97"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="手刹后轴制动力差">
<Rect left="710" top="674" right="810" bottom="706"/>
<Script>BrakeForceDiff_RA = math.abs(maxBrakeForceRL - maxBrakeForceRR) / math.max(maxBrakeForceRL,maxBrakeForceRR) * 100;

if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 20)
then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end
engine.println("##### BrakeForceDiff_RA Hand: " .. BrakeForceDiff_RA .. " Result : " .. engine.LastError .. "\n");


engine.StatValue = string.format("%.2f",BrakeForceDiff_RA)
engine.StatLower = "0"
engine.StatUpper = "20"</Script><assessment no="52" name="DEP1499" type="8" flags="105"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="左后制动力">
<Rect left="710" top="734" right="810" bottom="766"/>
<Script>if(maxBrakeForceRL &gt; 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end


engine.StatValue = string.format("%.2f",maxBrakeForceRL)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="53" name="DEP1500" type="8" flags="105"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="右后制动力">
<Rect left="710" top="794" right="810" bottom="826"/>
<Script>if(maxBrakeForceRR &gt; 0) then
 engine.LastError = 0;
else
 engine.LastError = -1;
 Result = 1
end

engine.StatValue = string.format("%.2f",maxBrakeForceRR)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="54" name="DEP1501" type="8" flags="105"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="手刹制动力总和">
<Rect left="710" top="854" right="810" bottom="886"/>
<Script>if(maxBrakeForceRA &gt;= UTG_BrakeForce_RA) then
 engine.LastError = 0

else
 engine.LastError = -1
 Result = 1

end

strBrakeForce_Hand = tostring(math.floor(BrakeForce_Hand))


engine.StatValue = string.format("%.2f",maxBrakeForceRA)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="55" name="DEP1502" type="8" flags="105"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="手刹百分比">
<Rect left="710" top="914" right="810" bottom="946"/>
<Script>PreValue = maxBrakeForceRA / (Weight_FA + Weight_RA) * 100;
if(PreValue &gt;= 20 and PreValue &lt;= 100) then
 engine.LastError = 0;

else
 engine.LastError = -1;
Result = 1
end

strPreValue = tostring(string.format("%.1f",PreValue))

engine.StatValue = string.format("%.2f",PreValue)
engine.StatLower = "20"
engine.StatUpper = "100"</Script><assessment no="56" name="DEP1503" type="8" flags="105"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="缓慢踩刹车">
<Rect left="710" top="974" right="810" bottom="1006"/>
<Line1Text Enable="1" Text="缓慢踩刹车让毂静止"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="退出">
<Rect left="880" top="164" right="980" bottom="196"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "Hand brake 2.5km 03 service failure"</Script><assessment no="46" name="DEP1493" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="统计手刹制动力模式">
<Rect left="710" top="214" right="810" bottom="246"/>
<Script>engine.LastError = 0
engine.StatValue = "Hand brake 2.5km 03 service successful"</Script><assessment no="46" name="DEP1493" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="统计转毂后轴停止">
<Rect left="710" top="1094" right="810" bottom="1126"/>
<Script>engine.LastError = 0
engine.StatValue = "Hand 0km 03 service successful"</Script><assessment no="57" name="DEP1488" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="重试">
<Rect left="250" top="824" right="350" bottom="856"/>
<Line2Text Enable="1" Text="手刹制动力检测不合格"/>
<Line4Text Enable="1" Text="重试？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="151" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="1214" right="316" bottom="1246"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="普通节点">
<Rect left="530" top="84" right="630" bottom="116"/>
<Script>Weight_RL = Weight_RA / 2
Weight_RR = Weight_RA / 2</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="152" type="0">
</Transition>
<Transition StartId="4" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="148" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="71" EndId="147" type="0">
</Transition>
<Transition StartId="72" EndId="94" type="3">
</Transition>
<Transition StartId="94" EndId="113" type="0">
</Transition>
<Transition StartId="113" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="141" type="0">
</Transition>
<Transition StartId="127" EndId="149" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="127" EndId="129" type="0">
</Transition>
<Transition StartId="128" EndId="2" type="0">
</Transition>
<Transition StartId="128" EndId="150" type="1">
<Expression>Result == 1</Expression></Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="143" type="0">
</Transition>
<Transition StartId="143" EndId="144" type="0">
</Transition>
<Transition StartId="144" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="146" type="0">
</Transition>
<Transition StartId="146" EndId="127" type="0">
</Transition>
<Transition StartId="148" EndId="72" type="0">
</Transition>
<Transition StartId="149" EndId="128" type="0">
</Transition>
<Transition StartId="150" EndId="4" type="6">
</Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="2" type="0">
</Transition>
<Transition StartId="152" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

