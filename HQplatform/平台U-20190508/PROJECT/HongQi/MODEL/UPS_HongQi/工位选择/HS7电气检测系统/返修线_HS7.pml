<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="410" top="34" right="510" bottom="66"/>
<Script>DString_Write_VIN = engine.VIN
DString_C079_Car_Type = engine.CarType
engine.WorkPlace="REP"
print("DString_Write_VIN:"..DString_Write_VIN)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="410" top="554" right="510" bottom="586"/>
<Script></Script></End>
<Activities>
<Activity id="200" ActivityType="5" flags="0" name="返修类型选择">
<Rect left="410" top="94" right="510" bottom="126"/>
<SubProcesses>
<SubProcess id="Repair_List_HS7">
<Parameters>
<Parameter id="Repair_Selection" ret="Repair_Selection"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="201" ActivityType="5" flags="0" name="单独控制器返修HS7">
<Rect left="410" top="294" right="510" bottom="326"/>
<SubProcesses>
<SubProcess id="ECU_HS7_Repair">
<Parameters>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Partnumber_EMS" value="DString_C131_Partnumber_EMS"/>
<Parameter id="DString_C131_VariCoding_EMS" value="DString_C131_VariCoding_EMS"/>
<Parameter id="DString_C131_ConfigInfo_EMS" value="DString_C131_ConfigInfo_EMS"/>
<Parameter id="DString_C131_Partnumber_AT" value="DString_C131_Partnumber_AT"/>
<Parameter id="DString_C131_VariCoding_AT" value="DString_C131_VariCoding_AT"/>
<Parameter id="DString_C131_Partnumber_DCT" value="DString_C131_Partnumber_DCT"/>
<Parameter id="DString_C131_VariCoding_DCT" value="DString_C131_VariCoding_DCT"/>
<Parameter id="DString_C131_Partnumber_EPB" value="DString_C131_Partnumber_EPB"/>
<Parameter id="DString_C131_VariCoding_EPB" value="DString_C131_VariCoding_EPB"/>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_VariCoding_SAS" value="DString_C131_VariCoding_SAS"/>
<Parameter id="DString_C131_Partnumber_EHPS" value="DString_C131_Partnumber_EHPS"/>
<Parameter id="DString_C131_VariCoding_EHPS" value="DString_C131_VariCoding_EHPS"/>
<Parameter id="DString_C131_Partnumber_AFS" value="DString_C131_Partnumber_AFS"/>
<Parameter id="DString_C131_VariCoding_AFS" value="DString_C131_VariCoding_AFS"/>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_VariCoding_AC" value="DString_C131_VariCoding_AC"/>
<Parameter id="DString_C131_Partnumber_SDM" value="DString_C131_Partnumber_SDM"/>
<Parameter id="DString_C131_VariCoding_SDM" value="DString_C131_VariCoding_SDM"/>
<Parameter id="DString_C131_Partnumber_LDW" value="DString_C131_Partnumber_LDW"/>
<Parameter id="DString_C131_VariCoding_LDW" value="DString_C131_VariCoding_LDW"/>
<Parameter id="DString_C131_Partnumber_ACC" value="DString_C131_Partnumber_ACC"/>
<Parameter id="DString_C131_VariCoding_ACC" value="DString_C131_VariCoding_ACC"/>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_VariCoding_BCM1" value="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_VariCoding_IC" value="DString_C131_VariCoding_IC"/>
<Parameter id="DString_C131_Partnumber_BCM2" value="DString_C131_Partnumber_BCM2"/>
<Parameter id="DString_C131_VariCoding_BCM2" value="DString_C131_VariCoding_BCM2"/>
<Parameter id="DString_C131_Partnumber_ARMREST" value="DString_C131_Partnumber_ARMREST"/>
<Parameter id="DString_C131_VariCoding_ARMREST" value="DString_C131_VariCoding_ARMREST"/>
<Parameter id="DString_C131_dif_config_ARMREST" value="DString_C131_dif_config_ARMREST"/>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_VariCoding_PEPS" value="DString_C131_VariCoding_PEPS"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
<Parameter id="DString_C131_Partnumber_PDC" value="DString_C131_Partnumber_PDC"/>
<Parameter id="DString_C131_VariCoding_PDC" value="DString_C131_VariCoding_PDC"/>
<Parameter id="DString_C131_Partnumber_GATEWAY" value="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="DString_C131_HorlConfig_GATEWAY" value="DString_C131_HorlConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_GATEWAY" value="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_VariCoding_DDCU" value="DString_C131_VariCoding_DDCU"/>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_VariCoding_PDCU" value="DString_C131_VariCoding_PDCU"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_VariCoding_RLDCU" value="DString_C131_VariCoding_RLDCU"/>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_VariCoding_RRDCU" value="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DString_C131_Partnumber_DSCU" value="DString_C131_Partnumber_DSCU"/>
<Parameter id="DString_C131_VariCoding_DSCU" value="DString_C131_VariCoding_DSCU"/>
<Parameter id="DString_C131_Partnumber_PLGM" value="DString_C131_Partnumber_PLGM"/>
<Parameter id="DString_C131_VariCoding_PLGM" value="DString_C131_VariCoding_PLGM"/>
<Parameter id="DString_C131_Partnumber_SCM" value="DString_C131_Partnumber_SCM"/>
<Parameter id="DString_C131_VariCoding_SCM" value="DString_C131_VariCoding_SCM"/>
<Parameter id="DString_C131_Auto_Swing_AC" value="DString_C131_Auto_Swing_AC"/>
<Parameter id="DString_C131_Partnumber_MCU" value="DString_C131_Partnumber_MCU"/>
<Parameter id="DString_C131_VariCoding_MCU" value="DString_C131_VariCoding_MCU"/>
<Parameter id="DString_C131_Partnumber_Charger" value="DString_C131_Partnumber_Charger"/>
<Parameter id="DString_C131_VariCoding_Charger" value="DString_C131_VariCoding_Charger"/>
<Parameter id="DString_C131_Partnumber_Oilpump" value="DString_C131_Partnumber_Oilpump"/>
<Parameter id="DString_C131_VariCoding_Oilpump" value="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DString_C131_Partnumber_DCDC" value="DString_C131_Partnumber_DCDC"/>
<Parameter id="DString_C131_VariCoding_DCDC" value="DString_C131_VariCoding_DCDC"/>
<Parameter id="DString_C131_Partnumber_HCU" value="DString_C131_Partnumber_HCU"/>
<Parameter id="DString_C131_VariCoding_HCU" value="DString_C131_VariCoding_HCU"/>
<Parameter id="DString_C131_Partnumber_BSD" value="DString_C131_Partnumber_BSD"/>
<Parameter id="DString_C131_VariCoding_BSD" value="DString_C131_VariCoding_BSD"/>
<Parameter id="DString_C131_Partnumber_FWD" value="DString_C131_Partnumber_FWD"/>
<Parameter id="DString_C131_VariCoding_FWD" value="DString_C131_VariCoding_FWD"/>
<Parameter id="DString_C131_Partnumber_BMS" value="DString_C131_Partnumber_BMS"/>
<Parameter id="DString_C131_VariCoding_BMS" value="DString_C131_VariCoding_BMS"/>
<Parameter id="DString_C131_Model_Name" value="DString_C131_Model_Name"/>
<Parameter id="DString_C131_BattConfig_GATEWAY" value="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="DString_C131_VariCoding_ESP" value="DString_C131_VariCoding_ESP"/>
<Parameter id="DString_C131_Partnumber_ESP" value="DString_C131_Partnumber_ESP"/>
<Parameter id="DString_C131_DVDConfig_GATEWAY" value="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="spec_data" value="spec_data"/>
<Parameter id="DString_C131_Partnumber_TBOX" value="DString_C131_Partnumber_TBOX"/>
<Parameter id="DString_C131_VariCoding_TBOX" value="DString_C131_VariCoding_TBOX"/>
<Parameter id="DString_C131_Partnumber_DVD" value="DString_C131_Partnumber_DVD"/>
<Parameter id="DString_C131_VariCoding_DVD" value="DString_C131_VariCoding_DVD"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="204" ActivityType="5" flags="0" name="HS7_IMMO_ESCL">
<Rect left="60" top="304" right="160" bottom="336"/>
<SubProcesses>
<SubProcess id="HS7_IMMO_ESCL">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="206" ActivityType="5" flags="0" name="HS7_Immobilizer_Key1">
<Rect left="180" top="144" right="280" bottom="176"/>
<SubProcesses>
<SubProcess id="HS7_Immobilizer_Key1">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="207" ActivityType="5" flags="0" name="HS7_Immobilizer_Key2">
<Rect left="60" top="144" right="160" bottom="176"/>
<SubProcesses>
<SubProcess id="HS7_Immobilizer_Key2">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="rematch_firkey" value="rematch_firkey"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="208" ActivityType="5" flags="0" name="HS7dynamicTest">
<Rect left="700" top="474" right="800" bottom="506"/>
<SubProcesses>
<SubProcess id="HS7dynamicTest">
<Parameters>
<Parameter id="Handl" value="0"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="210" ActivityType="5" flags="0" name="空气悬架标定">
<Rect left="60" top="474" right="160" bottom="506"/>
<SubProcesses>
<SubProcess id="空气悬架标定">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="211" ActivityType="5" flags="0" name="HS7_ClearAllDTC">
<Rect left="60" top="194" right="160" bottom="226"/>
<SubProcesses>
<SubProcess id="HS7_ClearAllDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="212" ActivityType="13" flags="0" name="StatisticResultList">
<Rect left="410" top="424" right="510" bottom="456"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="213" ActivityType="3" flags="1" name="上传统计打印结果">
<Rect left="410" top="484" right="510" bottom="516"/>
<Script>engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"请断开OBD接口");
engine.SetLineText(3,"");
engine.ShowMessage();</Script></Activity>
<Activity id="218" ActivityType="5" flags="0" name="HS7_Read_All_ECU_DTC">
<Rect left="700" top="414" right="800" bottom="446"/>
<SubProcesses>
<SubProcess id="HS7_Read_All_ECU_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="219" ActivityType="5" flags="0" name="HS7_ALSCalibration">
<Rect left="700" top="264" right="800" bottom="296"/>
<SubProcesses>
<SubProcess id="HS7_ALSCalibration">
<Parameters>
<Parameter id="DString_C079_Partnumber"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="220" ActivityType="4" flags="0" name="路由节点">
<Rect left="574" top="484" right="606" bottom="516"/>
</Activity>
<Activity id="221" ActivityType="5" flags="0" name="SASCalibration">
<Rect left="700" top="154" right="800" bottom="186"/>
<SubProcesses>
<SubProcess id="SASCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="222" ActivityType="5" flags="0" name="空气悬架完成步骤">
<Rect left="60" top="534" right="160" bottom="566"/>
<SubProcesses>
<SubProcess id="空气悬架标定2">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="229" ActivityType="5" flags="0" name="HS7_ClearAllDTC">
<Rect left="700" top="214" right="800" bottom="246"/>
<SubProcesses>
<SubProcess id="HS7_ClearAllDTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="230" ActivityType="5" flags="0" name="HS7_Read_All_ECU_DTC">
<Rect left="830" top="214" right="930" bottom="246"/>
<SubProcesses>
<SubProcess id="HS7_Read_All_ECU_DTC">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="231" ActivityType="5" flags="0" name="HS7_ESPCalibration">
<Rect left="700" top="314" right="800" bottom="346"/>
<SubProcesses>
<SubProcess id="HS7_ESPCalibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="普通节点">
<Rect left="1060" top="64" right="1160" bottom="96"/>
<Script>local hp = engine.httpOpen() 
local postData = "&lt;?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?&gt;&lt;tel&gt;&lt;action&gt;vehiclereport&lt;/action&gt;&lt;begindate&gt;2019-01-20 00:00:00&lt;/begindate&gt;&lt;enddate&gt;2019-12-30 23:59:59&lt;/enddate&gt;&lt;id&gt;knr&lt;/id&gt;&lt;knr&gt;"..engine.KNR.."&lt;/knr&gt;&lt;langtype&gt;zh&lt;/langtype&gt;&lt;module&gt;api&lt;/module&gt;&lt;nokonly&gt;false&lt;/nokonly&gt;&lt;querytype&gt;all&lt;/querytype&gt;&lt;testblock&gt;&lt;/testblock&gt;&lt;testdeviceno&gt;&lt;/testdeviceno&gt;&lt;testplace&gt;FWE&lt;/testplace&gt;&lt;vehicletype&gt;&lt;/vehicletype&gt;&lt;/tel&gt;"

retcode= engine.httpPost(hp, "https://10.134.184.2:8443/report", postData)
print("recode:"..retcode)

local strJson = engine.httpGetResponse(hp)
local pos = string.find(strJson,"前轴轴重")
pos = pos + 8 + 75
print("pos:"..pos)
strJson = strJson:sub(pos,-1)
print("weiG_FA:"..strJson)
endPos = string.find(strJson,"&lt;/value&gt;")
print("endPos"..endPos)
Weight_FA = strJson:sub(1,endPos-1)


pos = string.find(strJson,"后轴轴重")
pos = pos + 8 + 75
print("pos:"..pos)
strJson = strJson:sub(pos,-1)
endPos = string.find(strJson,"&lt;/value&gt;")
Weight_RA = strJson:sub(1,endPos-1)




print("Weight_FA:"..string.format("%s",Weight_FA))
print("Weight_RA:"..string.format("%s",Weight_RA))</Script></Activity>
<Activity id="234" ActivityType="5" flags="0" name="EMS_ReadDTC">
<Rect left="700" top="364" right="800" bottom="396"/>
<SubProcesses>
<SubProcess id="EMS_ReadDTC">
<Parameters>
<Parameter id="Station" value="&quot;TR1&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="235" ActivityType="5" flags="0" name="ACM_Calibration">
<Rect left="700" top="34" right="800" bottom="66"/>
<SubProcesses>
<SubProcess id="ACM_Calibration">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="236" ActivityType="5" flags="0" name="ALS_ReadDTC">
<Rect left="700" top="534" right="800" bottom="566"/>
<SubProcesses>
<SubProcess id="ALS_ReadDTC">
<Parameters>
<Parameter id="Station" value="{}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="TCP连接测试">
<Rect left="700" top="94" right="800" bottom="126"/>
<Script>local rHost = "TCP:192.168.100.157:2000"
print("&lt;rHost&gt; :" .. tostring(rHost))
tcphandle = nil
tcphandle = engine.SockOpen(rHost,"",-1)

if (tcphandle == nil) then
	engine.LastError = 1
else
	engine.LastError = 0 
end
engine.Delay(500)

err = engine.SockRecv(tcphandle,10000)
if (err == 0) then
	NextCommand = engine.GetResponseString(0,-1)
	NextCommand = LibGeneral.hex2str(NextCommand)
	print("SockRecv:"..NextCommand)
else
	print("Don't Recv Command")
end</Script></Activity>
<Activity id="238" ActivityType="5" flags="0" name="空气悬架初检">
<Rect left="60" top="414" right="160" bottom="446"/>
<SubProcesses>
<SubProcess id="空气悬架初检">
<Parameters>
<Parameter id="DString_Partnumber"/>
<Parameter id="DString_VariCoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="239" ActivityType="5" flags="0" name="TPMS_WriteID">
<Rect left="60" top="364" right="160" bottom="396"/>
<SubProcesses>
<SubProcess id="TPMS_WriteID">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="240" ActivityType="5" flags="0" name="HS7_IMMO_EMS">
<Rect left="180" top="94" right="280" bottom="126"/>
<SubProcesses>
<SubProcess id="HS7_IMMO_EMS">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="incode1" value="&quot;&quot;" ret="incode1"/>
<Parameter id="incode2" value="&quot;&quot;" ret="incode2"/>
<Parameter id="sc1" value="&quot;&quot;" ret="sc1"/>
<Parameter id="sc2" value="&quot;&quot;" ret="sc2"/>
<Parameter id="sc3" value="&quot;&quot;" ret="sc3"/>
<Parameter id="peps_key_all" value="&quot;&quot;" ret="peps_key_all"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="HS7_IMMO_TBOX">
<Rect left="60" top="244" right="160" bottom="276"/>
<SubProcesses>
<SubProcess id="HS7_IMMO_TBOX">
<Parameters>
<Parameter id="peps_key_all" value="peps_key_all"/>
<Parameter id="incode1" value="&quot;&quot;"/>
<Parameter id="incode2" value="&quot;&quot;"/>
<Parameter id="sc1" value="&quot;&quot;"/>
<Parameter id="sc2" value="&quot;&quot;"/>
<Parameter id="sc3" value="&quot;&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="242" ActivityType="5" flags="0" name="HS7_IMMO_Comm_TBOX">
<Rect left="60" top="94" right="160" bottom="126"/>
<SubProcesses>
<SubProcess id="HS7_IMMO_Comm_TBOX">
<Parameters>
<Parameter id="S1" value="sc1"/>
<Parameter id="S2" value="sc2"/>
<Parameter id="S3" value="sc3"/>
<Parameter id="peps_key_all" value="peps_key_all"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="243" ActivityType="5" flags="0" name="T-BOX_EOL">
<Rect left="60" top="34" right="160" bottom="66"/>
<SubProcesses>
<SubProcess id="T-BOX_EOL">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="201" type="1">
<Expression>Repair_Selection == "单独控制器返修"</Expression></Transition>
<Transition StartId="200" EndId="206" type="1">
<Expression>Repair_Selection == "匹配遥控钥匙"</Expression></Transition>
<Transition StartId="200" EndId="240" type="1">
<Expression>Repair_Selection == "PEPS 匹配 EMS和TBOX"</Expression></Transition>
<Transition StartId="200" EndId="204" type="1">
<Expression>Repair_Selection == "PEPS 匹配 ESCL"</Expression></Transition>
<Transition StartId="200" EndId="239" type="1">
<Expression>Repair_Selection == "TPMS ID写入"</Expression></Transition>
<Transition StartId="200" EndId="208" type="1">
<Expression>Repair_Selection == "EMS 水温"</Expression></Transition>
<Transition StartId="200" EndId="218" type="1">
<Expression>Repair_Selection == "读所有DTC"</Expression></Transition>
<Transition StartId="200" EndId="210" type="1">
<Expression>Repair_Selection == "空气悬架标定"</Expression></Transition>
<Transition StartId="200" EndId="211" type="1">
<Expression>Repair_Selection == "清所有DTC"</Expression></Transition>
<Transition StartId="200" EndId="231" type="1">
<Expression>Repair_Selection == "ESP标定"</Expression></Transition>
<Transition StartId="200" EndId="219" type="1">
<Expression>Repair_Selection == "ALS标定"</Expression></Transition>
<Transition StartId="200" EndId="221" type="1">
<Expression>Repair_Selection == "SAS标定"</Expression></Transition>
<Transition StartId="200" EndId="222" type="1">
<Expression>Repair_Selection == "空气悬架完成步骤"</Expression></Transition>
<Transition StartId="200" EndId="234" type="1">
<Expression>Repair_Selection == "EMS读故障码"</Expression></Transition>
<Transition StartId="200" EndId="229" type="1">
<Expression>Repair_Selection == "清除后再读所有DTC"</Expression></Transition>
<Transition StartId="200" EndId="241" type="1">
<Expression>Repair_Selection == "PEPS 匹配 TBOX"</Expression></Transition>
<Transition StartId="200" EndId="237" type="1">
<Expression>Repair_Selection == "ACM标定"</Expression></Transition>
<Transition StartId="200" EndId="238" type="1">
<Expression>Repair_Selection == "空气悬架初检"</Expression></Transition>
<Transition StartId="200" EndId="243" type="1">
<Expression>Repair_Selection == "T-BOX后台通讯"</Expression></Transition>
<Transition StartId="201" EndId="212" type="0">
</Transition>
<Transition StartId="204" EndId="212" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="212" type="0">
</Transition>
<Transition StartId="208" EndId="212" type="0">
</Transition>
<Transition StartId="210" EndId="212" type="0">
</Transition>
<Transition StartId="211" EndId="212" type="0">
</Transition>
<Transition StartId="212" EndId="213" type="0">
</Transition>
<Transition StartId="213" EndId="2" type="0">
</Transition>
<Transition StartId="218" EndId="212" type="0">
</Transition>
<Transition StartId="219" EndId="212" type="0">
</Transition>
<Transition StartId="220" EndId="200" type="0">
</Transition>
<Transition StartId="221" EndId="212" type="0">
</Transition>
<Transition StartId="222" EndId="212" type="0">
</Transition>
<Transition StartId="229" EndId="230" type="0">
</Transition>
<Transition StartId="230" EndId="212" type="0">
</Transition>
<Transition StartId="231" EndId="212" type="0">
</Transition>
<Transition StartId="234" EndId="212" type="0">
</Transition>
<Transition StartId="235" EndId="212" type="0">
</Transition>
<Transition StartId="236" EndId="212" type="0">
</Transition>
<Transition StartId="237" EndId="212" type="0">
</Transition>
<Transition StartId="238" EndId="212" type="0">
</Transition>
<Transition StartId="239" EndId="212" type="0">
</Transition>
<Transition StartId="240" EndId="242" type="0">
</Transition>
<Transition StartId="241" EndId="212" type="0">
</Transition>
<Transition StartId="242" EndId="212" type="0">
</Transition>
<Transition StartId="243" EndId="212" type="0">
</Transition>
</Transitions>
</Process>

