<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3037" pbltext="DEP1905">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="470" top="44" right="570" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="470" top="904" right="570" bottom="936"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="等待结束">
<Rect left="470" top="144" right="570" bottom="176"/>
<Script>
bEnded = engine.DopplerIsCalibrationEnded()

print("等待结束"..tostring(bEnded))

</Script></Activity>
<Activity id="5" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="54" right="666" bottom="86"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="普通节点">
<Rect left="600" top="144" right="700" bottom="176"/>
<Script>#DELAY 100</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="结果处理">
<Rect left="840" top="304" right="940" bottom="336"/>
<Script>if (engine.DopplerIsCalibrationEnded() == true) then
	print("Calibration over!")
	engine.SharedVarSet("LoopBFin",true)
end

resultStr = engine.DopplerCalibrationEndedInfo()
if(resultStr == true) then
	print("resultOK")
else
	print("resultNOK")
end

staS0Az = 0
staS0EL = 0
staS1Az = 0
staS1EL = 0
staLED = 0
dValueS0Az = 0 
dValueS0EL = 0
dValueS1Az = 0
dValueS1EL = 0

engine.Delay(2000)

while (dValueS0Az == 0 or dValueS0EL == 0 or dValueS1Az == 0 or dValueS1EL == 0) do
engine.Delay(500)

staS0Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLAzAngleOffset")
staS0EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLELOffsetAngle")
staS1Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLAzAngleOffset")
staS1EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLELOffsetAngle")
staLED = engine.DopplerGetLimitResultStatusValue("Sensor0Diag_error_HAL00_bu1_led_fault")

dValueS0Az = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLAzAngleOffset")
dValueS0EL = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLELOffsetAngle")
dValueS1Az = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLAzAngleOffset")
dValueS1EL = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLELOffsetAngle")

print("staS0Az:"..tostring(staS0Az))
print("staS0EL:"..tostring(staS0EL))
print("staS1Az:"..tostring(staS1Az))
print("staS1EL:"..tostring(staS1EL))
print("staLED:"..tostring(staLED))


print("dValueS0Az:"..tostring(dValueS0Az))
print("dValueS0EL:"..tostring(dValueS0EL))
print("dValueS1Az:"..tostring(dValueS1Az))
print("dValueS1EL:"..tostring(dValueS1EL))
end

if (tostring(staS0Az) == "1" and tostring(staS0EL) == "1" and tostring(staS1Az) == "1" and tostring(staS1EL) == "1" and tostring(staLED) == "1" ) then
	BSDret = 2
	engine.DialogBackColor = "Green";
        engine.SetLineText(1,"标定流程OK")
        engine.Delay(3000)
        engine.DialogBackColor = -1
else
	BSDret = 3
end

engine.SharedVarSet("BSDret",BSDret)
engine.SharedVarSet("S0Az",dValueS0Az)
engine.SharedVarSet("S0EL",dValueS0EL)
engine.SharedVarSet("S1Az",dValueS1Az)
engine.SharedVarSet("S1EL",dValueS1EL)
engine.SharedVarSet("LED",staLED)

if (staS0Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0Az = dValueS0Az - dValueS0Az%0.01
	if (Dis_dValueS0Az &gt; 0 )then
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
elseif (staS1Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1Az = dValueS1Az - dValueS1Az%0.01
	if (Dis_dValueS1Az &gt; 0 )then	
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
 elseif (staS0EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0EL = dValueS0EL - dValueS0EL%0.01
	if (Dis_dValueS0EL &gt; 0 )then	
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
        end
 elseif (staS1EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1EL = dValueS1EL - dValueS1EL%0.01
	if (Dis_dValueS1EL &gt; 0 )then	
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
          end
elseif(staLED == 0) then
	engine.DialogBackColor = "Red"
        print("后视镜LED NG")
        engine.Delay(5000)
        engine.DialogBackColor = -1
else
	
end
</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="多普勒检测结果信息">
<Rect left="1010" top="224" right="1110" bottom="256"/>
<Script>if (engine.DopplerIsCalibrationEnded() == true) then
	print("Calibration over!")
	engine.SharedVarSet("LoopBFin",true)
end

resultStr = engine.DopplerCalibrationEndedInfo()
if(resultStr == true) then
	print("resultOK")
else
	print("resultNOK")
end


a = 0

 while(a &lt;= 3) do
 
a = a + 1
engine.Delay(100)



staS0Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLAzAngleOffset")
staS0EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLELOffsetAngle")

staS1Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLAzAngleOffset")
staS1EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLELOffsetAngle")

staLED = engine.DopplerGetLimitResultStatusValue("Sensor0Diag_error_HAL00_bu1_led_fault")

dValueS0Az = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLAzAngleOffset")
dValueS0EL = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLELOffsetAngle")
dValueS1Az = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLAzAngleOffset")
dValueS1EL = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLELOffsetAngle")

print("staS0Az:"..tostring(staS0Az))
print("staS0EL:"..tostring(staS0EL))
print("staS1Az:"..tostring(staS1Az))
print("staS1EL:"..tostring(staS1EL))
print("staLED:"..tostring(staLED))


print("dValueS0Az:"..tostring(dValueS0Az))
print("dValueS0EL:"..tostring(dValueS0EL))
print("dValueS1Az:"..tostring(dValueS1Az))
print("dValueS1EL:"..tostring(dValueS1EL))


end


if (tostring(staS0Az) == "1" and tostring(staS0EL) == "1" and tostring(staS1Az) == "1" and tostring(staS1EL) == "1" and tostring(staLED) == "1" ) then
	BSDret = 2
	engine.DialogBackColor = "Green";
        engine.SetLineText(1,"标定流程OK")
        engine.Delay(3000)
        engine.DialogBackColor = -1
else
	BSDret = 3
end

if (staS0Az == 0) then
	engine.DialogBackColor = "Red"
        dValueS0Az = string.format("%0.2f",dValueS0Az)
	if (dValueS0Az &gt; 0 )then
		engine.SetLineText(1,"主水平NG:"..dValueS0Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主水平NG:"..dValueS0Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
elseif (staS1Az == 0) then
	engine.DialogBackColor = "Red"
        dValueS1Az = string.format("%0.2f",dValueS1Az)
	if (dValueS1Az &gt; 0 )then	
		engine.SetLineText(1,"从水平NG:"..dValueS1Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从水平NG:"..dValueS1Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
 elseif (staS0EL == 0) then
	engine.DialogBackColor = "Red"
        dValueS0EL = string.format("%0.2f",dValueS0EL)
	if (dValueS0EL &gt; 0 )then	
		engine.SetLineText(1,"主垂直NG:"..dValueS0EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主垂直NG:"..dValueS0EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
        end
 elseif (staS1EL == 0) then
	engine.DialogBackColor = "Red"
        dValueS1EL = string.format("%0.2f",dValueS1EL)
	if (dValueS1EL &gt; 0 )then	
		engine.SetLineText(1,"从垂直NG:"..dValueS1EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从垂直NG:"..dValueS1EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
          end
elseif(staLED == 0) then
	engine.DialogBackColor = "Red"
        print("后视镜LED NG")
        engine.Delay(5000)
        engine.DialogBackColor = -1
else
	
end

--[[
engine.SharedVarSet("staS0Az",staS0Az)
engine.SharedVarSet("staS0EL",st  --]]</Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="统计主雷达水平角度">
<Rect left="840" top="374" right="940" bottom="406"/>
<Script>if (staS0Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0Az
else
	engine.LastError = 1
        engine.StatValue = dValueS0Az
end
</Script><assessment no="6" name="DEP1908" type="8" flags="97"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="统计从雷达水平角度">
<Rect left="840" top="424" right="940" bottom="456"/>
<Script>if (staS1Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1Az
else
	engine.LastError = 1
        engine.StatValue = dValueS1Az
end
</Script><assessment no="7" name="DEP1909" type="8" flags="97"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="统计主雷达垂直角度">
<Rect left="840" top="484" right="940" bottom="516"/>
<Script>if (staS0EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0EL
else
	engine.LastError = 1
        engine.StatValue = dValueS0EL
end
</Script><assessment no="8" name="DEP1910" type="8" flags="97"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="统计从雷达垂直角度">
<Rect left="840" top="544" right="940" bottom="576"/>
<Script>if (staS1EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1EL
else
	engine.LastError = 1
        engine.StatValue = dValueS1EL
end
</Script><assessment no="9" name="DEP1911" type="8" flags="97"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="统计LED">
<Rect left="840" top="604" right="940" bottom="636"/>
<Script>if (staLED == 1) then
	engine.LastError = 0
        engine.StatValue = staLED
else
	engine.LastError = 1
        engine.StatValue = staLED
end
</Script><assessment no="10" name="DEP1912" type="8" flags="97"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="初始化结果变量">
<Rect left="470" top="284" right="570" bottom="316"/>
<Script>staS0Az = -3
staS0EL = -3
staS1Az = -3
staS1EL = -3
staLED = -3
dValueS0Az = -3 
dValueS0EL = -3
dValueS1Az = -3
dValueS1EL = -3</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="延时2S">
<Rect left="470" top="334" right="570" bottom="366"/>
<Script>engine.Delay(2000)</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="统计主雷达水平角度">
<Rect left="470" top="394" right="570" bottom="426"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS0Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLAzAngleOffset")
	print("staS0Az:"..tostring(staS0Az))
until(staS0Az ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS0Az = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLAzAngleOffset")
	print("dValueS0Az:"..tostring(dValueS0Az))
until(dValueS0Az ~= -3 or nCount == 5)

if (staS0Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0Az
else
	engine.LastError = 1
        engine.StatValue = tostring(dValueS0Az)..";"..tostring(staS0Az)
end
</Script><assessment no="6" name="DEP1908" type="8" flags="97"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="统计从雷达水平角度">
<Rect left="470" top="454" right="570" bottom="486"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS1Az = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLAzAngleOffset")
	print("staS1Az:"..tostring(staS1Az))
until(staS1Az ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS1Az = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLAzAngleOffset")
	print("dValueS1Az:"..tostring(dValueS1Az))
until(dValueS1Az ~= -3 or nCount == 5)


if (staS1Az == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1Az
else
	engine.LastError = 1
        engine.StatValue = tostring(dValueS1Az)..";"..tostring(staS1Az)
end
</Script><assessment no="7" name="DEP1909" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="统计主雷达垂直角度">
<Rect left="470" top="514" right="570" bottom="546"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS0EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor0OEMEOLELOffsetAngle")
	print("staS0EL:"..tostring(staS0EL))
until(staS0EL ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS0EL = engine.DopplerGetLimitResultValue("Meas0Sensor0OEMEOLELOffsetAngle")
	print("dValueS0EL:"..tostring(dValueS0EL))
until(dValueS0EL ~= -3 or nCount == 5)


if (staS0EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS0EL
else
	engine.LastError = 1
        engine.StatValue = tostring(dValueS0EL)..";"..tostring(staS0EL)
end
</Script><assessment no="8" name="DEP1910" type="8" flags="97"/>
</Activity>
<Activity id="176" ActivityType="3" flags="0" name="统计从雷达垂直角度">
<Rect left="470" top="584" right="570" bottom="616"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staS1EL = engine.DopplerGetLimitResultStatusValue("Meas0Sensor1OEMEOLELOffsetAngle")
	print("staS1EL:"..tostring(staS1EL))
until(staS1EL ~= -3 or nCount == 5)

nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	dValueS1EL = engine.DopplerGetLimitResultValue("Meas0Sensor1OEMEOLELOffsetAngle")
	print("dValueS1EL:"..tostring(dValueS1EL))
until(dValueS1EL ~= -3 or nCount == 5)


if (staS1EL == 1) then
	engine.LastError = 0
        engine.StatValue = dValueS1EL
else
	engine.LastError = 1
        engine.StatValue = tostring(dValueS1EL)..";"..tostring(staS1EL)
end
</Script><assessment no="9" name="DEP1911" type="8" flags="97"/>
</Activity>
<Activity id="177" ActivityType="3" flags="1" name="统计LED检测结果">
<Rect left="470" top="644" right="570" bottom="676"/>
<Script>nCount = 0
repeat
	engine.Delay(500)
	nCount = nCount + 1
	staLED = engine.DopplerGetLimitResultStatusValue("Sensor0Diag_error_HAL00_bu1_led_fault")
	print("staLED:"..tostring(staLED))
until(staLED ~= -3 or nCount == 5)



if (staLED == 1) then
	engine.LastError = 0
        engine.StatValue = "OK"
else
	engine.LastError = 1
        engine.StatValue = "NOK"..";"..tostring(staLED)
end
</Script><assessment no="10" name="DEP1912" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="统计检测总结果">
<Rect left="470" top="704" right="570" bottom="736"/>
<Script>if (tostring(staS0Az) == "1" and tostring(staS0EL) == "1" and tostring(staS1Az) == "1" and tostring(staS1EL) == "1" and tostring(staLED) == "1" ) then
	BSDret = 2
	engine.DialogBackColor = "Green";
        engine.SetLineText(1,"标定流程OK")
        engine.Delay(3000)
        engine.DialogBackColor = -1
else
	BSDret = 3
end</Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="结束">
<Rect left="470" top="234" right="570" bottom="266"/>
<Script>if (engine.DopplerIsCalibrationEnded() == true) then
	print("Calibration over!")
	engine.SharedVarSet("LoopBFin",true)
end

resultStr = engine.DopplerCalibrationEndedInfo()
if(resultStr == true) then
	print("resultOK")
else
	print("resultNOK")
end</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="存储结果数据">
<Rect left="470" top="774" right="570" bottom="806"/>
<Script>dValueS0Az = dValueS0Az - dValueS0Az % 0.01
dValueS0EL = dValueS0EL - dValueS0EL % 0.01
dValueS1Az = dValueS1Az - dValueS1Az % 0.01
dValueS1EL = dValueS1EL - dValueS1EL % 0.01

print("BSD保留2位小数结果:"..dValueS0Az..";"..dValueS0EL..";"..dValueS1Az..";"..dValueS1EL)

engine.SharedVarSet("BSDret",BSDret)
engine.SharedVarSet("S0Az",dValueS0Az)
engine.SharedVarSet("S0EL",dValueS0EL)
engine.SharedVarSet("S1Az",dValueS1Az)
engine.SharedVarSet("S1EL",dValueS1EL)
engine.SharedVarSet("LED",staLED)

</Script></Activity>
<Activity id="181" ActivityType="3" flags="0" name="不合格调整显示">
<Rect left="570" top="834" right="670" bottom="866"/>
<Script>if (staS0Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0Az = dValueS0Az
	if (Dis_dValueS0Az &gt; 0 )then
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主水平NG:"..Dis_dValueS0Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
elseif (staS1Az == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1Az = dValueS1Az
	if (Dis_dValueS1Az &gt; 0 )then	
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向左调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从水平NG:"..Dis_dValueS1Az.."向右调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         end
 elseif (staS0EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS0EL = dValueS0EL
	if (Dis_dValueS0EL &gt; 0 )then	
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"主垂直NG:"..Dis_dValueS0EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
        end
 elseif (staS1EL == 0) then
	engine.DialogBackColor = "Red"
        Dis_dValueS1EL = dValueS1EL
	if (Dis_dValueS1EL &gt; 0 )then	
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向上调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
         else
		engine.SetLineText(1,"从垂直NG:"..Dis_dValueS1EL.."向下调整")
                engine.Delay(5000)
                engine.DialogBackColor = -1
          end
elseif(staLED == 0) then
	engine.DialogBackColor = "Red"
        print("后视镜LED NG")
        engine.Delay(5000)
        engine.DialogBackColor = -1
else
	
end

--#PRESSBUTTON</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="179" type="1">
<Expression>bEnded ~= false</Expression></Transition>
<Transition StartId="5" EndId="4" type="0">
</Transition>
<Transition StartId="7" EndId="5" type="0">
</Transition>
<Transition StartId="8" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="167" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="0">
</Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="174" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="175" EndId="176" type="0">
</Transition>
<Transition StartId="176" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="180" type="0">
</Transition>
<Transition StartId="179" EndId="171" type="0">
</Transition>
<Transition StartId="180" EndId="181" type="1">
<Expression>BSDret == 3</Expression></Transition>
<Transition StartId="180" EndId="2" type="0">
</Transition>
<Transition StartId="181" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

