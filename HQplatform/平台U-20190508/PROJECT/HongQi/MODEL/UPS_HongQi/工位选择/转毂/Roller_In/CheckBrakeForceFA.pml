<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1608" pbltext="DEP2237">
<Parameters>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="maxBrakeForceFA" type="5" dir="1" data="0" description="前轴制动力"/>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="踏板力测试标识"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="670" top="74" right="770" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="670" top="1354" right="770" bottom="1386"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="结果初始化">
<Rect left="670" top="144" right="770" bottom="176"/>
<Script>Result = 0

UTG_BrakeForce_FA = Weight_FA * 0.6
UTG_DragForce_FL = Weight_FL * 0.1
UTG_DragForce_FR = Weight_FR * 0.1


engine.println("##### UTG_BrakeForce_FA : " .. UTG_BrakeForce_FA .. "\n")</Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="连接踏板力计">
<Rect left="490" top="204" right="590" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请连接踏板力测量传感器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1" Text="准备就绪？"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>PedalFlag = true
#PRESSBUTTON</Script></Activity>
<Activity id="91" ActivityType="3" flags="0" name="挂空挡">
<Rect left="670" top="204" right="770" bottom="236"/>
<Line1Text Enable="1" Text="挂空挡不踩刹车"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="92" ActivityType="5" flags="0" name="前轴5km/h">
<Rect left="670" top="264" right="770" bottom="296"/>
<SubProcesses>
<SubProcess id="RTS_03_ControlActuators">
<Parameters>
<Parameter id="Hndl" value="Handl"/>
<Parameter id="modeControl" value="4"/>
<Parameter id="speedFL" value="5.0"/>
<Parameter id="speedFR" value="5.0"/>
<Parameter id="speedRL" value="0"/>
<Parameter id="speedRR" value="0"/>
<Parameter id="torqueFL" value="3000"/>
<Parameter id="torqueFR" value="3000"/>
<Parameter id="torqueRL" value="3000"/>
<Parameter id="torqueRR" value="3000"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="HolderPosition" value="true"/>
<Parameter id="ExhaustFlag" value="true"/>
<Parameter id="withEngine" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="速度检查">
<Rect left="670" top="374" right="770" bottom="406"/>
<Script>local TimeStart = os.time();
local breakLoop = false
local Timeout = 10
local idt_tel
local factor = 0.01
local TargetSpeed_FL = 5
local TargetSpeed_FR = 5
local TargetSpeed_RL = 0
local TargetSpeed_RR = 0
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
       
until(breakLoop or TimeDiff &gt; Timeout)

if (engine.LastError == 0) then
	engine.StatValue = "Speed Check OK"	
end

if (engine.LastError ~= 0) then
	engine.StatValue = "Speed Check NOK"	
        Result = 3
end

</Script><assessment no="17" name="DEP1463" type="8" flags="97"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="阻滞力获取">
<Rect left="670" top="444" right="770" bottom="476"/>
<Script>local i = 0
local oldRevTel = ""
local curtRevTel
local factor = 1.0

DragForceSum_FL = 0
DragForceSum_FR = 0
DragForce_FL = 0
DragForce_FL = 0

repeat 
	curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
	curtRevTelHex = LibGeneral.hex2str(curtRevTel)
        print("前轴阻滞力当前获取IDT报文:"..curtRevTelHex)
        if (curtRevTel ~= oldRevTel) then
		--获取左前轮制动力
		DragForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor
		--获取右前轮制动力
		DragForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor
		 DragForceSum_FL = DragForceSum_FL + math.abs(DragForce_FL)
		 DragForceSum_FR = DragForceSum_FR + math.abs(DragForce_FR)
                 oldRevTel = curtRevTel
                 i = i + 1
		print("前轴制动力中阻滞力值:"..DragForce_FL..";"..DragForce_FR)
	end
        engine.Delay(10)
until(i == 10)

DragForce_FL = DragForceSum_FL / 10;
DragForce_FR = DragForceSum_FR / 10;

print("前轴阻滞力10次平均值:"..DragForce_FL..";"..DragForce_FR)</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="左前阻滞力评估">
<Rect left="670" top="494" right="770" bottom="526"/>
<Script>if(DragForce_FL &gt; 0 and DragForce_FL &lt;= UTG_DragForce_FL)
then
 engine.LastError = 0;
else
 engine.LastError = 1;
 Result = 1
end
engine.println("##### DragForce_FL : " .. DragForce_FL .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_FL)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_FL)

</Script><assessment no="18" name="DEP1464" type="8" flags="105"/>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="右前阻滞力评估">
<Rect left="670" top="554" right="770" bottom="586"/>
<Script>if(DragForce_FR &gt; 0 and DragForce_FR &lt;= UTG_DragForce_FR)
then
 engine.LastError = 0;
else
 engine.LastError = 1;
 Result = 1
end
engine.println("##### DragForce_FR : " .. DragForce_FR .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_FR)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_FL)</Script><assessment no="19" name="DEP1465" type="8" flags="105"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="左前阻滞力百分比">
<Rect left="670" top="614" right="770" bottom="646"/>
<Script>PreValue_DragForce_FL = DragForce_FL / Weight_FL * 100;
if(PreValue_DragForce_FL &gt;= 0 and PreValue_DragForce_FL &lt;= 10) then
 engine.LastError = 0;
else
 engine.LastError = 1;
 Result = 1
end

engine.println("### PreValue_DragForce_FL= " .. tostring(PreValue_DragForce_FL) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_FL)
engine.StatLower = "0"
engine.StatUpper = "5"</Script><assessment no="20" name="DEP1466" type="8" flags="105"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="右前阻滞力百分比">
<Rect left="670" top="674" right="770" bottom="706"/>
<Script>PreValue_DragForce_FR = DragForce_FR / Weight_FR * 100;
if(PreValue_DragForce_FR &gt;= 0 and PreValue_DragForce_FR &lt;= 10) then
 engine.LastError = 0;
else
 engine.LastError = 1;
 Result = 1
end

engine.println("### PreValue_DragForce_FR= " .. tostring(PreValue_DragForce_FR) .. "in range : " .. engine.LastError)

engine.StatValue = string.format("%.2f", PreValue_DragForce_FR)
engine.StatLower = "0"
engine.StatUpper = "5"

</Script><assessment no="21" name="DEP1467" type="8" flags="105"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="获取制动力">
<Rect left="670" top="734" right="770" bottom="766"/>
<Script>local TimeStart = os.time()
local TimeDiff
local oldRevTel = ""
local factor = 1.0
local aflag = 0
local Pre_FA
local targFAforce = Weight_FA * 0.65
local disForceDiff = "制动力差:不合格"
BrakeForce_FL = 0
BrakeForce_FR = 0

maxBrakeForceFL = 0
maxBrakeForceFR = 0
maxBrakeForceFA = 0

engine.SetTitleText("请踩脚刹车")

repeat

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
print("前轴制动力报文获取:"..LibGeneral.hex2str(curtRevTel))

if (curtRevTel ~= oldRevTel) then

	oldRevTel = curtRevTel
	--获取左前轮制动力
	BrakeForce_FL = LibIDT.idthilo2signed(curtRevTel:sub(29,29):byte(),curtRevTel:sub(30,30):byte()) * factor

	--获取右前轮制动力
	BrakeForce_FR = LibIDT.idthilo2signed(curtRevTel:sub(31,31):byte(),curtRevTel:sub(32,32):byte()) * factor

	--获取脚刹踏板力
	BrakePedal = LibIDT.idthilo2signed(curtRevTel:sub(23,23):byte(),curtRevTel:sub(24,24):byte()) * factor

	if (PedalFlag == true) then
		print("踏板力:"..BrakePedal)
		engine.SetLineText(3,"踏板力:"..BrakePedal)
	end


	BrakeForce_FL = BrakeForce_FL - DragForce_FL
	BrakeForce_FR = BrakeForce_FR - DragForce_FR
	BrakeForce_FA = BrakeForce_FL + BrakeForce_FR
	print("前轴制动力:"..BrakeForce_FL..";"..BrakeForce_FR..";"..BrakeForce_FA)
        
	if (BrakeForce_FA &gt; maxBrakeForceFA) then
		maxBrakeForceFA = BrakeForce_FA
		maxBrakeForceFL = BrakeForce_FL
		maxBrakeForceFR = BrakeForce_FR
	end
        
        print("最大前轴制动力:"..maxBrakeForceFL..";"..maxBrakeForceFR..";"..maxBrakeForceFA)
      
end
Pre_FA = maxBrakeForceFA / Weight_FA * 100
Pre_FA = string.format("%.2f", Pre_FA)

engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FL).."#R=左前刹车力")
engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_FR).."#R=右前刹车力")

BrakeForceDiff_FA = math.abs(maxBrakeForceFL - maxBrakeForceFR) / math.max(maxBrakeForceFL,maxBrakeForceFR) * 100

if (BrakeForceDiff_FA &gt;= 0 and BrakeForceDiff_FA &lt;= 20) then
	disForceDiff = "制动力差:合格"
else
	disForceDiff = "制动力差:不合格"
end
engine.SetLineText(0,"前轴目标:65%".." ".."当前:"..Pre_FA.."%".."    "..disForceDiff)
if(BrakeForceDiff_FA &gt;= 0 and BrakeForceDiff_FA &lt;= 20 and maxBrakeForceFA &gt; targFAforce) then
	aflag = 1
end

TimeDiff = os.time() - TimeStart

engine.Delay(30)


until(aflag == 1 or  TimeDiff &gt; 15)

engine.SetTitleText("")
engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")
</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="前轴制动力差">
<Rect left="670" top="804" right="770" bottom="836"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>BrakeForceDiff_FA = math.abs(maxBrakeForceFL - maxBrakeForceFR) / math.max(maxBrakeForceFL,maxBrakeForceFR) * 100

if(BrakeForceDiff_FA &gt;= 0 and BrakeForceDiff_FA &lt;= 20) then
 engine.LastError = 0
else
 engine.LastError = -1
 Result = 1
end

engine.println("##### BrakeForceDiff_FA : " .. BrakeForceDiff_FA .. " Result : " .. engine.LastError .. "\n")

strBrakeForceDiff_FA = tostring(string.format("%.1f", BrakeForceDiff_FA))

engine.StatValue = string.format("%.2f", BrakeForceDiff_FA)
engine.StatLower = "0"
engine.StatUpper = tostring(20)


</Script><assessment no="22" name="DEP2532" type="8" flags="105"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="踏板测力计">
<Rect left="670" top="864" right="770" bottom="896"/>
<Script>if(BrakePedal &gt; 0 and BrakePedal &lt; 400.0) then
 engine.LastError = 0
else
 engine.LastError = 1
 Result = 1
end
engine.println("##### PedalForceFoot : " .. " Result : " .. engine.LastError .. "\n");


engine.StatValue = string.format("%.2f", BrakePedal)
engine.StatLower = "0"
engine.StatUpper = "400"</Script><assessment no="23" name="DEP1469" type="8" flags="105"/>
</Activity>
<Activity id="122" ActivityType="3" flags="0" name="左前制动力">
<Rect left="670" top="924" right="770" bottom="956"/>
<Script>if(maxBrakeForceFL &gt; 0 and maxBrakeForceFL &lt; 5000) then
 engine.LastError = 0
else
 engine.LastError = -1
 Result = 1
end

engine.println("##### BrakeForce_FL : " .. maxBrakeForceFL .. " Result : " .. engine.LastError .. "\n");

strBrakeForce_FL = tostring(math.floor(maxBrakeForceFL/10))

engine.StatValue = string.format("%.2f", maxBrakeForceFL)
engine.StatLower = "0"
engine.StatUpper = "5000"

</Script><assessment no="24" name="DEP1470" type="8" flags="105"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="右前制动力">
<Rect left="670" top="984" right="770" bottom="1016"/>
<Script>if(maxBrakeForceFR &gt; 0 and maxBrakeForceFR &lt; 5000) then
 engine.LastError = 0
else
 engine.LastError = -1
 Result = 1
end

engine.println("##### BrakeForce_FR: " .. maxBrakeForceFR.. " Result : " .. engine.LastError .. "\n");

strBrakeForce_FR = tostring(math.floor(maxBrakeForceFR/10))

engine.StatValue = string.format("%.2f", maxBrakeForceFR)
engine.StatLower = "0"
engine.StatUpper = "5000"


</Script><assessment no="25" name="DEP1471" type="8" flags="105"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="前轴制动力百分比">
<Rect left="670" top="1104" right="770" bottom="1136"/>
<Script>PreValue_FA = maxBrakeForceFA / Weight_FA * 100;

if(PreValue_FA &gt; 60) then
 engine.LastError = 0
else
 engine.LastError = -1
 Result = 1
end

engine.println("### PreValue_FA = " .. tostring(PreValue_FA) .. "in range : " .. engine.LastError)

strPreValue_FA = tostring(string.format("%.1f", PreValue_FA))

engine.StatValue = string.format("%.2f", PreValue_FA)
engine.StatLower = "60"
engine.StatUpper = "100"

engine.SetLineText(0,"缓慢踩刹车让毂静止")
</Script><assessment no="27" name="DEP1473" type="8" flags="105"/>
</Activity>
<Activity id="125" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="670" top="1164" right="770" bottom="1196"/>
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
<Activity id="127" ActivityType="3" flags="0" name="前轴制动力总和">
<Rect left="670" top="1044" right="770" bottom="1076"/>
<Script>if(maxBrakeForceFA &gt; UTG_BrakeForce_FA) then
 engine.LastError = 0
else
 engine.LastError = -1
 Result = 1
end

engine.println("##### BrakeForce_FA: " .. maxBrakeForceFA.. " Result : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", maxBrakeForceFA)
engine.StatLower = tostring(maxBrakeForceFA)
engine.StatUpper = "10000"
</Script><assessment no="26" name="DEP1472" type="8" flags="105"/>
</Activity>
<Activity id="128" ActivityType="4" flags="0" name="路由节点">
<Rect left="834" top="804" right="866" bottom="836"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="检查毂速为0">
<Rect left="670" top="1284" right="770" bottom="1316"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
local factor = 0.01
engine.LastError =  1
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
end</Script><assessment no="29" name="DEP1475" type="8" flags="97"/>
</Activity>
<Activity id="135" ActivityType="3" flags="0" name="IDT错误">
<Rect left="490" top="264" right="590" bottom="296"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "front axle 2.5km 03 service failure"
</Script><assessment no="16" name="DEP1462" type="8" flags="97"/>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="IDT错误">
<Rect left="820" top="1164" right="920" bottom="1196"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "front axle 0km 03 service failure"</Script><assessment no="28" name="DEP1474" type="8" flags="97"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="统计前轴制动力检测模式">
<Rect left="670" top="314" right="770" bottom="346"/>
<Script>engine.LastError = 0
engine.StatValue = "front axle 2.5km 03 service successful"
</Script><assessment no="16" name="DEP1462" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="速度不正确">
<Rect left="490" top="374" right="590" bottom="406"/>
<Script>Result = 3</Script></Activity>
<Activity id="140" ActivityType="3" flags="0" name="统计转毂前轴停止">
<Rect left="670" top="1224" right="770" bottom="1256"/>
<Script>engine.LastError = 0
engine.StatValue = "front axle 0km 03 service successful"
</Script><assessment no="28" name="DEP1474" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="重试">
<Rect left="150" top="874" right="250" bottom="906"/>
<Line2Text Enable="1" Text="前轴制动力检测不合格"/>
<Line4Text Enable="1" Text="重试？"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="144" ActivityType="4" flags="0" name="路由节点">
<Rect left="184" top="1354" right="216" bottom="1386"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="普通节点">
<Rect left="490" top="104" right="590" bottom="136"/>
<Script>Weight_FL = Weight_FA / 2
Weight_FR = Weight_FA / 2
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="145" type="0">
</Transition>
<Transition StartId="3" EndId="90" type="1">
<Expression>PedalFlag == true</Expression></Transition>
<Transition StartId="3" EndId="91" type="0">
</Transition>
<Transition StartId="90" EndId="91" type="6">
</Transition>
<Transition StartId="91" EndId="92" type="0">
</Transition>
<Transition StartId="92" EndId="138" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="92" EndId="135" type="0">
</Transition>
<Transition StartId="111" EndId="113" type="3">
</Transition>
<Transition StartId="111" EndId="139" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="116" type="0">
</Transition>
<Transition StartId="116" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="120" EndId="128" type="0">
</Transition>
<Transition StartId="121" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="127" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="140" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="125" EndId="136" type="0">
</Transition>
<Transition StartId="127" EndId="124" type="0">
</Transition>
<Transition StartId="128" EndId="122" type="0">
</Transition>
<Transition StartId="134" EndId="143" type="1">
<Expression>Result == 1</Expression></Transition>
<Transition StartId="134" EndId="2" type="0">
</Transition>
<Transition StartId="138" EndId="111" type="0">
</Transition>
<Transition StartId="140" EndId="134" type="0">
</Transition>
<Transition StartId="143" EndId="3" type="6">
</Transition>
<Transition StartId="143" EndId="144" type="0">
</Transition>
<Transition StartId="144" EndId="2" type="0">
</Transition>
<Transition StartId="145" EndId="3" type="0">
</Transition>
</Transitions>
</Process>

