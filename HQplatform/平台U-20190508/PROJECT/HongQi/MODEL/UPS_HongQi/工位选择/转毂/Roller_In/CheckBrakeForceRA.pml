<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1609" pbltext="DEP2238">
<Parameters>
<Variable id="Weight_RA" type="5" dir="0" data="0" description="后轴重"/>
<Variable id="BrakeForce_RA" type="5" dir="1" data="0" description="后轴制动力"/>
<Variable id="PedalFlag" type="11" dir="0" data="false" description="是否进行踏板力检测"/>
<Variable id="Handl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="Result" type="3" dir="1" data="0" description="最终结果"/>
<Variable id="Weight_FA" type="5" dir="0" data="0" description="前轴重"/>
<Variable id="BrakeForce_FA" type="5" dir="0" data="0" description="前轴刹车力"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="510" top="74" right="610" bottom="106"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="510" top="1384" right="610" bottom="1416"/>
<Script></Script></End>
<Activities>
<Activity id="70" ActivityType="3" flags="0" name="标称值计算">
<Rect left="510" top="134" right="610" bottom="166"/>
<TitleText Enable="1" Text="后轴制动力检测"/>
<Line1Text Enable="1" Text="挂空挡不踩刹车"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Result = 0
UTG_BrakeForce_RA = Weight_RA * 0.2;
UTG_DragForce_RL = Weight_RL * 0.1;
UTG_DragForce_RR = Weight_RR * 0.1;


engine.println("##### UTG_BrakeForce_RA : " .. UTG_BrakeForce_RA .. "\n");
</Script></Activity>
<Activity id="71" ActivityType="5" flags="0" name="后轴5km/h">
<Rect left="510" top="194" right="610" bottom="226"/>
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
<Activity id="93" ActivityType="3" flags="0" name="速度检查">
<Rect left="510" top="314" right="610" bottom="346"/>
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
end</Script><assessment no="31" name="DEP1463" type="8" flags="97"/>
</Activity>
<Activity id="112" ActivityType="3" flags="0" name="阻滞力获取">
<Rect left="510" top="374" right="610" bottom="406"/>
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
        print("后轴阻滞力当前获取IDT报文:"..curtRevTelHex)
        if (curtRevTel ~= oldRevTel) then
		--获取左后轮制动力
		DragForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor;

		--获取右后轮制动力
		DragForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor;
		DragForceSum_RL = DragForceSum_RL + math.abs(DragForce_RL)
		DragForceSum_RR = DragForceSum_RR + math.abs(DragForce_RR)
                 oldRevTel = curtRevTel
                 i = i + 1
		print("后轴制动力中阻滞力值:"..DragForce_RL..";"..DragForce_RR)
	end
        engine.Delay(10)
until(i == 10)

DragForce_RL = DragForceSum_RL / 10;
DragForce_RR = DragForceSum_RR / 10;

print("后轴阻滞力10次平均值:"..DragForce_RL..";"..DragForce_RR)</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="左后阻滞力评估">
<Rect left="510" top="434" right="610" bottom="466"/>
<Script>if(DragForce_RL &gt; 0 and DragForce_RL &lt;= UTG_DragForce_RL)
then
 engine.LastError = 0;
else
 engine.LastError = 1;
 Result = 1
end
engine.println("##### DragForce_RL : " .. DragForce_RL .. " In range : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", DragForce_RL)
engine.StatLower = "0"
engine.StatUpper = tostring(UTG_DragForce_RL)

</Script><assessment no="32" name="DEP1478" type="8" flags="105"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="右后阻滞力评估">
<Rect left="510" top="494" right="610" bottom="526"/>
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
engine.StatUpper = tostring(UTG_DragForce_RR)</Script><assessment no="33" name="DEP1479" type="8" flags="105"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="左后阻滞力百分比">
<Rect left="510" top="554" right="610" bottom="586"/>
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
engine.StatUpper = "5"</Script><assessment no="34" name="DEP1480" type="8" flags="105"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="右后阻滞力百分比">
<Rect left="510" top="614" right="610" bottom="646"/>
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

</Script><assessment no="35" name="DEP1481" type="8" flags="105"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="获取后轴制动力">
<Rect left="510" top="664" right="610" bottom="696"/>
<Script>local TimeStart = os.time();
local TimeDiff
local oldRevTel = ""
local factor = 1.0
local rflag = 0
local disForceDiff = "制动力差:不合格"
local percentRAbrake = 0
local Pre_RA
local Pre_FARA


BrakeForce_RL = 0
BrakeForce_RR = 0

maxBrakeForceRL = 0
maxBrakeForceRR = 0
maxBrakeForceRA = 0


engine.SetTitleText("请踩脚刹车")
print("测试后的前轴制动力:"..BrakeForce_FA)

repeat

curtRevTel = engine.UdpHandleVarGet(Handl, "_LASTREVTEL")
print("后轴制动力报文获取:"..LibGeneral.hex2str(curtRevTel))

if (curtRevTel ~= oldRevTel) then

	oldRevTel = curtRevTel
	--获取左后轮制动力
	BrakeForce_RL = LibIDT.idthilo2signed(curtRevTel:sub(33,33):byte(),curtRevTel:sub(34,34):byte()) * factor
	--获取右后轮制动力
	BrakeForce_RR = LibIDT.idthilo2signed(curtRevTel:sub(35,35):byte(),curtRevTel:sub(36,36):byte()) * factor
	--获取脚刹踏板力
	BrakePedal = LibIDT.idthilo2signed(curtRevTel:sub(23,23):byte(),curtRevTel:sub(24,24):byte()) * factor

	if (PedalFlag == true) then
		print("踏板力:"..BrakePedal)
		engine.SetLineText(3,"踏板力:"..BrakePedal)
	end

	BrakeForce_RL = BrakeForce_RL - DragForce_RL
	BrakeForce_RR = BrakeForce_RR - DragForce_RR
        BrakeForce_RA = BrakeForce_RL + BrakeForce_RR
	print("后轴制动力:"..BrakeForce_RL..";"..BrakeForce_RR..";"..BrakeForce_RA)       
                  
	if (BrakeForce_RA &gt; maxBrakeForceRA) then
		maxBrakeForceRA = BrakeForce_RA
		maxBrakeForceRL = BrakeForce_RL
		maxBrakeForceRR = BrakeForce_RR
	end
        print("最大后轴制动力:"..maxBrakeForceRL..";"..maxBrakeForceRR..";"..maxBrakeForceRA)  
         
	UTG_BrakeForce_OA = (Weight_FA + Weight_RA) * 0.6
	BrakeForce_ALL = BrakeForce_FA + maxBrakeForceRA
	print("整车制动力:"..BrakeForce_ALL)
	engine.SetLineText(1,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RL).."#R=左后刹车力")
	engine.SetLineText(2,"#L=bmpbar,0,"..tostring(5000)..","..tostring(10)..","..tostring(BrakeForce_RR).."#R=右后刹车力")	
              
	BrakeForceDiff_RA = math.abs(maxBrakeForceRL - maxBrakeForceRR) / math.max(maxBrakeForceRL,maxBrakeForceRR) * 100

	if(maxBrakeForceRA &gt;= Weight_RA * 0.6) then
		if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 24) then
			rflag = 1
                        disForceDiff = "制动力差:合格"
		else
			rflag = 0
                        disForceDiff = "制动力差:不合格"
		end

	else
		if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 8) then
			rflag = 1
                        disForceDiff = "制动力差:合格"
		else
			rflag = 0
                        disForceDiff = "制动力差:不合格"
		end
	end
        percentRAbrake  = (UTG_BrakeForce_OA - BrakeForce_FA) / Weight_RA * 100
        percentRAbrake = string.format("%.2f", percentRAbrake)
        Pre_RA = maxBrakeForceRA / Weight_RA * 100
        Pre_RA = string.format("%.2f", Pre_RA)
        Pre_FARA = BrakeForce_ALL/(Weight_FA + Weight_RA) * 100
        Pre_FARA = string.format("%.2f", Pre_FARA)
        
        engine.SetLineText(0,"后轴目标:"..percentRAbrake.."%".." ".."当前:"..Pre_RA.."%".." "..disForceDiff.."     ".."整车目标:60%".." ".."当前:"..Pre_FARA)
        if (maxBrakeForceRA &gt; UTG_BrakeForce_RA and BrakeForce_ALL &gt;= UTG_BrakeForce_OA ) then
        else
		rflag = 0
        end                 
end

TimeDiff = os.difftime(os.time(),TimeStart);

engine.Delay(30)

until(rflag == 1 or  TimeDiff &gt; 15)



engine.SetTitleText("")
engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")


</Script></Activity>
<Activity id="120" ActivityType="3" flags="1" name="后轴制动力差">
<Rect left="510" top="724" right="610" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>print("后轴制动差左后右后值:"..maxBrakeForceRL..","..maxBrakeForceRR)
BrakeForceDiff_RA = math.abs(maxBrakeForceRL - maxBrakeForceRR) / math.max(maxBrakeForceRL,maxBrakeForceRR) * 100;

if(maxBrakeForceRA &gt;= Weight_RA * 0.6) then
	if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 24) then
		engine.LastError = 0
	else
		engine.LastError = -1
		Result = 1
	end
		engine.StatLower = "0"
		engine.StatUpper = "24"
else
	if(BrakeForceDiff_RA &gt;= 0 and BrakeForceDiff_RA &lt;= 8) then
		engine.LastError = 0
	else
		engine.LastError = -1
                Result = 1
	end
	engine.StatLower = "0"
	engine.StatUpper = "8"
end

engine.println("##### BrakeForceDiff_RA : " .. BrakeForceDiff_RA .. " Result : " .. engine.LastError .. "\n");
strBrakeForceDiff_RA = tostring(string.format("%.1f", BrakeForceDiff_RA))
engine.StatValue = string.format("%.2f", BrakeForceDiff_RA)


</Script><assessment no="36" name="DEP1482" type="8" flags="105"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="踏板测力计">
<Rect left="510" top="784" right="610" bottom="816"/>
<Script>if(BrakePedal &gt; 0 and  BrakePedal &lt; 400) then
 engine.LastError = 0
else
  engine.LastError = 1
end

engine.println("##### PedalForceFoot : " .. BrakePedal .. "\n")

engine.StatValue = string.format("%.2f", BrakePedal)
engine.StatLower = "0"
engine.StatUpper = "400"</Script><assessment no="37" name="DEP1483" type="8" flags="97"/>
</Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="784" right="696" bottom="816"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="左后制动力">
<Rect left="510" top="844" right="610" bottom="876"/>
<Script>if(maxBrakeForceRL &gt; 0 and maxBrakeForceRL &lt; 5000) then
	engine.LastError = 0
else
	engine.LastError = -1
	Result = 1
end

strBrakeForce_RL = tostring(math.floor(maxBrakeForceRL/10))

engine.StatValue = string.format("%.2f", maxBrakeForceRL)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="38" name="DEP1484" type="8" flags="105"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="右后制动力">
<Rect left="510" top="904" right="610" bottom="936"/>
<Script>if(maxBrakeForceRR &gt; 0 and maxBrakeForceRR &lt; 5000) then
	engine.LastError = 0

else
	engine.LastError = -1
	Result = 1
end


strBrakeForce_RR = tostring(math.floor(maxBrakeForceRR/10))

engine.StatValue = string.format("%.2f", maxBrakeForceRR)
engine.StatLower = "0"
engine.StatUpper = "5000"</Script><assessment no="39" name="DEP1485" type="8" flags="105"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="后轴制动力总和">
<Rect left="510" top="964" right="610" bottom="996"/>
<Script>if(maxBrakeForceRA &gt; UTG_BrakeForce_RA) then
	engine.LastError = 0
else
	 engine.LastError = -1
	 Result = 1
end

engine.println("##### BrakeForce_RA: " .. maxBrakeForceRA.. " Result : " .. engine.LastError .. "\n");

engine.StatValue = string.format("%.2f", maxBrakeForceRA)
engine.StatLower = tostring(maxBrakeForceRA)
engine.StatUpper = "8000"</Script><assessment no="40" name="DEP1486" type="8" flags="105"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="后轴制动力百分比">
<Rect left="510" top="1024" right="610" bottom="1056"/>
<Script>PreValue_RA = maxBrakeForceRA / Weight_RA * 100;

engine.LastError = 0;

strPreValue_RA = tostring(string.format("%.1f", PreValue_RA))

engine.StatValue = string.format("%.2f", PreValue_RA)
engine.StatLower = "20"
engine.StatUpper = "100"</Script><assessment no="41" name="DEP1487" type="8" flags="105"/>
</Activity>
<Activity id="127" ActivityType="5" flags="0" name="速度降为0km/h">
<Rect left="510" top="1084" right="610" bottom="1116"/>
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
<Activity id="135" ActivityType="3" flags="0" name="IDT错误">
<Rect left="680" top="1084" right="780" bottom="1116"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "rear axle 0km 03 service failure"</Script><assessment no="42" name="DEP1488" type="8" flags="97"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="整车制动力">
<Rect left="510" top="1254" right="610" bottom="1286"/>
<Script>if(BrakeForce_ALL &gt;= UTG_BrakeForce_OA) then
	engine.LastError = 0
else
	 engine.LastError = -1
	 Result = 2
end;
engine.println("##### UTG_BrakeForce_OA : " .. UTG_BrakeForce_OA .. "\n")
engine.println("##### BrakeForce_ALL : " .. BrakeForce_ALL .. " Result : " .. engine.LastError .. "\n")


strBrakeForce_ALL = tostring(math.floor(BrakeForce_ALL))

engine.StatValue = string.format("%.2f", BrakeForce_ALL)
engine.StatLower = tostring(UTG_BrakeForce_OA)
engine.StatUpper = "20000"</Script><assessment no="44" name="DEP1490" type="8" flags="105"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="整车制动力百分比">
<Rect left="510" top="1314" right="610" bottom="1346"/>
<Script>PreValue = BrakeForce_ALL / (Weight_FA + Weight_RA) * 100
if(PreValue &gt; 60) then
	engine.LastError = 0

else
	engine.LastError = -1
	Result = 2
end
engine.println("##### PreValue : " .. PreValue .. " Result : " .. engine.LastError .. "\n");

strPreValue = tostring(string.format("%.1f", PreValue))

engine.StatValue = string.format("%.2f", PreValue)
engine.StatLower = "60"
engine.StatUpper = "200"</Script><assessment no="45" name="DEP1491" type="8" flags="105"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="检查毂速为0">
<Rect left="510" top="1194" right="610" bottom="1226"/>
<Script>local brk = 0
local TimeStart = os.time();
local TimeDiff
local curtRevTel
local oldRevTel = ""
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
end</Script><assessment no="43" name="DEP1489" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="退出">
<Rect left="670" top="194" right="770" bottom="226"/>
<Script>Result = 3
engine.LastError = 1
engine.StatValue = "rear axle 2.5km 03 service failure"
print("IDT 交互错误！")</Script><assessment no="30" name="DEP1476" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="统计后轴制动力检测模式">
<Rect left="510" top="254" right="610" bottom="286"/>
<Script>engine.LastError = 0
engine.StatValue = "rear axle 2.5km 03 service successful"
</Script><assessment no="30" name="DEP1476" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="统计转毂后轴停止">
<Rect left="510" top="1144" right="610" bottom="1176"/>
<Script>engine.LastError = 0
engine.StatValue = "rear axle 0km 03 service successful"
</Script><assessment no="42" name="DEP1488" type="8" flags="97"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="普通节点">
<Rect left="370" top="104" right="470" bottom="136"/>
<Script>Weight_RL = Weight_RA / 2
Weight_RR = Weight_RA / 2</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="145" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="143" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="71" EndId="142" type="0">
</Transition>
<Transition StartId="93" EndId="112" type="3">
</Transition>
<Transition StartId="112" EndId="114" type="0">
</Transition>
<Transition StartId="114" EndId="115" type="0">
</Transition>
<Transition StartId="115" EndId="117" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="1">
<Expression>PedalFlag</Expression></Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="121" EndId="123" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="0">
</Transition>
<Transition StartId="123" EndId="124" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="126" type="0">
</Transition>
<Transition StartId="126" EndId="127" type="0">
</Transition>
<Transition StartId="127" EndId="144" type="1">
<Expression>isOK == true</Expression></Transition>
<Transition StartId="127" EndId="135" type="0">
</Transition>
<Transition StartId="139" EndId="140" type="0">
</Transition>
<Transition StartId="140" EndId="2" type="0">
</Transition>
<Transition StartId="141" EndId="139" type="0">
</Transition>
<Transition StartId="143" EndId="93" type="0">
</Transition>
<Transition StartId="144" EndId="141" type="0">
</Transition>
<Transition StartId="145" EndId="70" type="0">
</Transition>
</Transitions>
</Process>

