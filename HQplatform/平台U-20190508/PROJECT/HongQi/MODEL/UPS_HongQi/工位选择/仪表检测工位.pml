<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="640" top="64" right="740" bottom="96"/>
<Script>engine.ExecuteRpdPending();</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="190" top="1214" right="290" bottom="1246"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
engine.ecu_CAN_control_1 = false
engine.ecu_CAN_control_2 = false
engine.power_hs7 = false
engine.yellow_power=false
engine.power_h7 = false
engine.plc_test_finished=true</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="162" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="400" top="554" right="500" bottom="586"/>
<TitleText Enable="1" Text="H7检测-FAW仪表板"/>
<Line1Text Enable="1" Text="请将亮灯的手柄接到仪表模块上"/>
<Line2Text Enable="1" Text="并接好地线"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON

</Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="520" top="614" right="620" bottom="646"/>
<Script>engine.power_h7 = true ;</Script></Activity>
<Activity id="165" ActivityType="5" flags="0" name="cluster">
<Rect left="400" top="674" right="500" bottom="706"/>
<SubProcesses>
<SubProcess id="cluster_H7">
<Parameters>
<Parameter id="DString_C131_Partnumber_IC" value="DString_C131_Partnumber_IC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="166" ActivityType="5" flags="0" name="sas">
<Rect left="400" top="914" right="500" bottom="946"/>
<SubProcesses>
<SubProcess id="sas_H7">
<Parameters>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="167" ActivityType="5" flags="0" name="peps">
<Rect left="400" top="734" right="500" bottom="766"/>
<SubProcesses>
<SubProcess id="peps_H7">
<Parameters>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="168" ActivityType="5" flags="0" name="bcm1">
<Rect left="400" top="794" right="500" bottom="826"/>
<SubProcesses>
<SubProcess id="bcm1_H7">
<Parameters>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="169" ActivityType="5" flags="0" name="analog_measure">
<Rect left="400" top="974" right="500" bottom="1006"/>
<SubProcesses>
<SubProcess id="analog_measure_H7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="897" ActivityType="5" flags="0" name="读配置文件">
<Rect left="520" top="464" right="620" bottom="496"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_Data">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="Model_Variant"/>
<Parameter id="Engine_Type"/>
<Parameter id="Engine_Displacement" ret="DString_C131_Engine_Displacement"/>
<Parameter id="Design_serialNumber"/>
<Parameter id="Engine_Cylinder"/>
<Parameter id="Transmission_Type"/>
<Parameter id="COC_Speaker"/>
<Parameter id="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker"/>
<Parameter id="EMS00_partnumber" ret="DString_C131_Partnumber_EMS"/>
<Parameter id="EMS00_varicoding" ret="DString_C131_VariCoding_EMS"/>
<Parameter id="EMS00_configinfo" ret="DString_C131_ConfigInfo_EMS"/>
<Parameter id="AT000_partnumber" ret="DString_C131_Partnumber_AT"/>
<Parameter id="AT000_varicoding" ret="DString_C131_VariCoding_AT"/>
<Parameter id="DCT00_partnumber" ret="DString_C131_Partnumber_DCT"/>
<Parameter id="DCT00_varicoding" ret="DString_C131_VariCoding_DCT"/>
<Parameter id="EPB00_partnumber" ret="DString_C131_Partnumber_EPB"/>
<Parameter id="SAS00_partnumber" ret="DString_C131_Partnumber_SAS"/>
<Parameter id="SAS00_varicoding" ret="DString_C131_VariCoding_SAS"/>
<Parameter id="EPB00_varicoding" ret="DString_C131_VariCoding_EPB"/>
<Parameter id="EHPS0_partnumber" ret="DString_C131_Partnumber_EHPS"/>
<Parameter id="EHPS0_varicoding" ret="DString_C131_VariCoding_EHPS"/>
<Parameter id="ESP00_partnumber" ret="DString_C131_Partnumber_ESP"/>
<Parameter id="ESP00_varicoding" ret="DString_C131_VariCoding_ESP"/>
<Parameter id="AFS00_partnumber" ret="DString_C131_Partnumber_AFS"/>
<Parameter id="AFS00_varicoding" ret="DString_C131_VariCoding_AFS"/>
<Parameter id="AC000_partnumber" ret="DString_C131_Partnumber_AC"/>
<Parameter id="AC000_varicoding" ret="DString_C131_VariCoding_AC"/>
<Parameter id="AB000_partnumber" ret="DString_C131_Partnumber_SDM"/>
<Parameter id="AB000_varicoding" ret="DString_C131_VariCoding_SDM"/>
<Parameter id="LDW00_partnumber" ret="DString_C131_Partnumber_LDW"/>
<Parameter id="LDW00_varicoding" ret="DString_C131_VariCoding_LDW"/>
<Parameter id="ACC00_partnumber" ret="DString_C131_Partnumber_ACC"/>
<Parameter id="ACC00_varicoding" ret="DString_C131_VariCoding_ACC"/>
<Parameter id="BCM10_partnumber" ret="DString_C131_Partnumber_BCM1"/>
<Parameter id="IC000_partnumber" ret="DString_C131_Partnumber_IC"/>
<Parameter id="IC000_varicoding" ret="DString_C131_VariCoding_IC"/>
<Parameter id="BCM20_partnumber" ret="DString_C131_Partnumber_BCM2"/>
<Parameter id="BCM20_varicoding" ret="DString_C131_VariCoding_BCM2"/>
<Parameter id="RMArm_partnumber" ret="DString_C131_Partnumber_ARMREST"/>
<Parameter id="RMArm_varicoding" ret="DString_C131_VariCoding_ARMREST"/>
<Parameter id="RMArm_dif_config" ret="DString_C131_dif_config_ARMREST"/>
<Parameter id="PEPS0_partnumber" ret="DString_C131_Partnumber_PEPS"/>
<Parameter id="PEPS0_varicoding" ret="DString_C131_VariCoding_PEPS"/>
<Parameter id="PEPS0_handleswic" ret="DString_C131_handleswic_PEPS"/>
<Parameter id="PDC00_partnumber" ret="DString_C131_Partnumber_PDC"/>
<Parameter id="PDC00_varicoding" ret="DString_C131_VariCoding_PDC"/>
<Parameter id="GW000_partnumber" ret="DString_C131_Partnumber_GATEWAY"/>
<Parameter id="GW000_horlconfig" ret="DString_C131_HorLConfig_GATEWAY"/>
<Parameter id="GW000_varicoding" ret="DString_C131_VariCoding_GATEWAY"/>
<Parameter id="DDCU0_partnumber" ret="DString_C131_Partnumber_DDCU"/>
<Parameter id="DDCU0_varicoding" ret="DString_C131_VariCoding_DDCU"/>
<Parameter id="PDCU0_partnumber" ret="DString_C131_Partnumber_PDCU"/>
<Parameter id="PDCU0_varicoding" ret="DString_C131_VariCoding_PDCU"/>
<Parameter id="RLDCU_partnumber" ret="DString_C131_Partnumber_RLDCU"/>
<Parameter id="RLDCU_varicoding" ret="DString_C131_VariCoding_RLDCU"/>
<Parameter id="RRDCU_partnumber" ret="DString_C131_Partnumber_RRDCU"/>
<Parameter id="RRDCU_varicoding" ret="DString_C131_VariCoding_RRDCU"/>
<Parameter id="DSCU0_partnumber" ret="DString_C131_Partnumber_DSCU"/>
<Parameter id="DSCU0_varicoding" ret="DString_C131_VariCoding_DSCU"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="BCM10_varicoding" ret="DString_C131_VariCoding_BCM1"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="PLGM0_partnumber" ret="DString_C131_Partnumber_PLGM"/>
<Parameter id="PLGM0_varicoding" ret="DString_C131_VariCoding_PLGM"/>
<Parameter id="SCM00_partnumber" ret="DString_C131_Partnumber_SCM"/>
<Parameter id="SCM00_varicoding" ret="DString_C131_VariCoding_SCM"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="AC000_partnumber"/>
<Parameter id="AC000_auto_swing" ret="DString_C131_Auto_Swing_AC"/>
<Parameter id="MCU00_partnumber" ret="DString_C131_Partnumber_MCU"/>
<Parameter id="MCU00_varicoding" ret="DString_C131_VariCoding_MCU"/>
<Parameter id="CHG00_partnumber" ret="DString_C131_Partnumber_Charger"/>
<Parameter id="CHG00_varicoding" ret="DString_C131_VariCoding_Charger"/>
<Parameter id="OLP00_partnumber" ret="DString_C131_Partnumber_Oilpump"/>
<Parameter id="OLP00_varicoding" ret="DString_C131_VariCoding_Oilpump"/>
<Parameter id="DCDC0_partnumber" ret="DString_C131_Partnumber_DCDC"/>
<Parameter id="DCDC0_varicoding" ret="DString_C131_VariCoding_DCDC"/>
<Parameter id="HCU00_partnumber" ret="DString_C131_Partnumber_HCU"/>
<Parameter id="HCU00_varicoding" ret="DString_C131_VariCoding_HCU"/>
<Parameter id="BSD00_partnumber" ret="DString_C131_Partnumber_BSD"/>
<Parameter id="BSD00_varicoding" ret="DString_C131_VariCoding_BSD"/>
<Parameter id="FWD00_partnumber" ret="DString_C131_Partnumber_FWD"/>
<Parameter id="FWD00_varicoding" ret="DString_C131_VariCoding_FWD"/>
<Parameter id="BMS00_partnumber" ret="DString_C131_Partnumber_BMS"/>
<Parameter id="BMS00_varicoding" ret="DString_C131_VariCoding_BMS"/>
<Parameter id="Model_Name" ret="DString_C131_Model_Name"/>
<Parameter id="GW000_battconfig" ret="DString_C131_BattConfig_GATEWAY"/>
<Parameter id="GW000_dvdconfig" ret="DString_C131_DVDConfig_GATEWAY"/>
<Parameter id="TBOX0_partnumber" ret="DString_C131_Partnumber_TBOX"/>
<Parameter id="TBOX0_varicoding" ret="DString_C131_VariCoding_TBOX"/>
<Parameter id="DVD00_partnumber" ret="DString_C131_Partnumber_DVD"/>
<Parameter id="DVD00_varicoding" ret="DString_C131_VariCoding_DVD"/>
<Parameter id="PLGM1_partnumber"/>
<Parameter id="PLGM1_varicoding"/>
<Parameter id="GW000_0101config"/>
<Parameter id="GW000_0116config"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="899" ActivityType="3" flags="0" name="设置工位">
<Rect left="640" top="344" right="740" bottom="376"/>
<Script>VMTLOC = "COC"
engine.WorkPlace="COC"
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="916" ActivityType="5" flags="0" name="airco">
<Rect left="400" top="854" right="500" bottom="886"/>
<SubProcesses>
<SubProcess id="airco_H7">
<Parameters>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="760" top="614" right="860" bottom="646"/>
<Line2Text Enable="1" Text="正在开启12V供电中..."/>
<Script>engine.ecu_CAN_control_1 = false ;
engine.ecu_CAN_control_2 = false 
engine.Delay(100)
engine.power_hs7 = true ;
engine.Delay(100)
engine.ecu_CAN_control_2 = true;</Script></Activity>
<Activity id="920" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="880" top="1094" right="980" bottom="1126"/>
<Script>engine.ecu_CAN_control_1 = false;
engine.ecu_CAN_control_2 = false;
engine.power_hs7 = false
engine.yellow_power=false
</Script></Activity>
<Activity id="922" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="400" top="1094" right="500" bottom="1126"/>
<Script>engine.registerPacket(1,4000,0x7DF,"",0);
engine.power_h7 = false
engine.plc_test_finished=true</Script></Activity>
<Activity id="923" ActivityType="5" flags="0" name="BCM1_HS7">
<Rect left="880" top="734" right="980" bottom="766"/>
<SubProcesses>
<SubProcess id="BCM1_HS7">
<Parameters>
<Parameter id="DString_C131_Partnumber_BCM1" value="DString_C131_Partnumber_BCM1"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="924" ActivityType="5" flags="0" name="analog_measure_HS7">
<Rect left="1020" top="1034" right="1120" bottom="1066"/>
<SubProcesses>
<SubProcess id="analog_measure_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="延时6000MS">
<Rect left="880" top="614" right="980" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="仪表上电中，请等待6秒"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>for t=6,1,-1 do
engine.SetLineText(2,"倒计时"..t.."秒");
#DELAY 1000
end</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="普通节点">
<Rect left="640" top="1094" right="740" bottom="1126"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>--local StatisticTestResult = engine.GetResults();
if(engine.TestResult ~= 0) then
	engine.DialogBackColor = "red";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test NOK");
        engine.Delay(2000);
elseif(engine.TestResult == 0) then
	engine.DialogBackColor = "green";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test OK");
        engine.Delay(2000);
end;
        engine.SetTitleText("")
        engine.SetLineText(2,"");
engine.DialogBackColor = -1;
engine.println("##测试结果".. tostring(engine.TestResult))</Script></Activity>
<Activity id="932" ActivityType="3" flags="0" name="普通节点">
<Rect left="640" top="1214" right="740" bottom="1246"/>
<TitleText Enable="1" Text="FAW仪表板检测"/>
<Line1Text Enable="1" Text="检测结束，是否进行下一次检测？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="结束"/>
<ButtonRText Enable="1" Text="开始"/>
<Script>--#PRESSBUTTON
--repeat	
--until((engine.start_press==false)or(engine.stop_press==true))
--engine.println("stop_press:"..tostring(engine.stop_press));
--engine.println("start_press:"..tostring(engine.start_press));
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="933" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="1214" right="1156" bottom="1246"/>
</Activity>
<Activity id="934" ActivityType="4" flags="0" name="路由节点">
<Rect left="1124" top="284" right="1156" bottom="316"/>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="880" top="554" right="980" bottom="586"/>
<TitleText Enable="1" Text="HS7检测-FAW仪表板"/>
<Line1Text Enable="1" Text="请将亮灯的手柄接到仪表模块上"/>
<Line2Text Enable="1" Text="并接好地线"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="938" ActivityType="5" flags="0" name="IVI_HS7">
<Rect left="880" top="674" right="980" bottom="706"/>
<SubProcesses>
<SubProcess id="IVI_HS7">
<Parameters>
<Parameter id="DString_C131_Partnumber_IVI" value="DString_C131_Partnumber_IVI"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="延时5000MS">
<Rect left="400" top="614" right="500" bottom="646"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="仪表上电中，请等待5秒"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>for t=5,1,-1 do
engine.SetLineText(2,"倒计时"..t.."秒");
#DELAY 1000
end</Script></Activity>
<Activity id="940" ActivityType="4" flags="0" name="路由节点">
<Rect left="434" top="284" right="466" bottom="316"/>
</Activity>
<Activity id="941" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="284" right="946" bottom="316"/>
</Activity>
<Activity id="942" ActivityType="3" flags="1" name="普通节点">
<Rect left="640" top="1154" right="740" bottom="1186"/>
<Script>engine.WorkPlace = "COC";
engine.SelectLayout(0);
--local StatisticTestResult = engine.GetResults();

engine.println("###&lt;main&gt; workplace for send result###".. tostring(engine.WorkPlace))

--if (#StatisticTestResult ~= 0) then

engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();

--end;</Script></Activity>
<Activity id="947" ActivityType="5" flags="0" name="airco_HS7">
<Rect left="880" top="794" right="980" bottom="826"/>
<SubProcesses>
<SubProcess id="airco_HS7">
<Parameters>
<Parameter id="DString_C131_Partnumber_AC" value="DString_C131_Partnumber_AC"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="948" ActivityType="5" flags="0" name="peps_HS7">
<Rect left="880" top="854" right="980" bottom="886"/>
<SubProcesses>
<SubProcess id="peps_HS7">
<Parameters>
<Parameter id="DString_C131_Partnumber_PEPS" value="DString_C131_Partnumber_PEPS"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="949" ActivityType="5" flags="0" name="sas_HS7">
<Rect left="880" top="914" right="980" bottom="946"/>
<SubProcesses>
<SubProcess id="sas_HS7">
<Parameters>
<Parameter id="DString_C131_Partnumber_SAS" value="DString_C131_Partnumber_SAS"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="957" ActivityType="5" flags="0" name="Get_Vehicle_DoorKombi">
<Rect left="760" top="464" right="860" bottom="496"/>
<SubProcesses>
<SubProcess id="Get_Vehicle_DoorKombi">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="Model_Variant"/>
<Parameter id="Engine_Type"/>
<Parameter id="Engine_Displacement"/>
<Parameter id="Design_serialNumber"/>
<Parameter id="Engine_Cylinder"/>
<Parameter id="Transmission_Type"/>
<Parameter id="COC_Speaker"/>
<Parameter id="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker"/>
<Parameter id="GW00_partnumber"/>
<Parameter id="GW00_varicoding"/>
<Parameter id="EMS00_partnumber"/>
<Parameter id="EMS00_varicoding"/>
<Parameter id="AT00_partnumber"/>
<Parameter id="AT00_varicoding"/>
<Parameter id="EGSM00_partnumber"/>
<Parameter id="EGSM00_varicoding"/>
<Parameter id="ACM00_partnumber"/>
<Parameter id="ACM00_varicoding"/>
<Parameter id="ACU00_partnumber"/>
<Parameter id="ACU00_varicoding"/>
<Parameter id="ESP00_partnumber"/>
<Parameter id="ESP00_varicoding"/>
<Parameter id="SAS00_partnumber" ret="DString_C131_Partnumber_SAS"/>
<Parameter id="SAS00_varicoding"/>
<Parameter id="EPS00_partnumber"/>
<Parameter id="EPS00_varicoding"/>
<Parameter id="TOD00_partnumber"/>
<Parameter id="TOD00_varicoding"/>
<Parameter id="AirS00_partnumber"/>
<Parameter id="AirS00_varicoding"/>
<Parameter id="DMS00_partnumber"/>
<Parameter id="DMS00_varicoding"/>
<Parameter id="PDC00_partnumber"/>
<Parameter id="PDC00_varicoding"/>
<Parameter id="AVM00_partnumber"/>
<Parameter id="AVM00_varicoding"/>
<Parameter id="IFC00_partnumber"/>
<Parameter id="IFC00_varicoding"/>
<Parameter id="ADV00_partnumber"/>
<Parameter id="ADV00_varicoding"/>
<Parameter id="BSD00_partnumber"/>
<Parameter id="BSD00_varicoding"/>
<Parameter id="DDCU00_partnumber" ret="DString_C131_Partnumber_DDCU"/>
<Parameter id="DDCU00_varicoding"/>
<Parameter id="PDCU00_partnumber" ret="DString_C131_Partnumber_PDCU"/>
<Parameter id="PDCU00_varicoding"/>
<Parameter id="RLDCU00_partnumber" ret="DString_C131_Partnumber_RLDCU"/>
<Parameter id="RLDCU00_varicoding"/>
<Parameter id="RRDCU00_partnumber" ret="DString_C131_Partnumber_RRDCU"/>
<Parameter id="RRDCU00_varicoding"/>
<Parameter id="DSCU00_partnumber"/>
<Parameter id="DSCU00_varicoding"/>
<Parameter id="SCM00_partnumber"/>
<Parameter id="SCM00_varicoding"/>
<Parameter id="TBOX00_partnumber"/>
<Parameter id="TBOX00_varicoding"/>
<Parameter id="AC00_partnumber" ret="DString_C131_Partnumber_AC"/>
<Parameter id="AC00_varicoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="BCM100_partnumber" ret="DString_C131_Partnumber_BCM1"/>
<Parameter id="BCM100_varicoding"/>
<Parameter id="BCM200_partnumber"/>
<Parameter id="BCM200_varicoding"/>
<Parameter id="PEPS00_partnumber" ret="DString_C131_Partnumber_PEPS"/>
<Parameter id="PEPS00_varicoding"/>
<Parameter id="PLGM00_partnumber"/>
<Parameter id="PLGM00_varicoding"/>
<Parameter id="ACPF00_partnumber"/>
<Parameter id="ACPF00_varicoding"/>
<Parameter id="IVI00_partnumber" ret="DString_C131_Partnumber_IVI"/>
<Parameter id="IVI00_varicoding1"/>
<Parameter id="IVI00_varicoding2"/>
<Parameter id="DVR00_partnumber"/>
<Parameter id="DVR00_varicoding"/>
<Parameter id="SCCU00_partnumber"/>
<Parameter id="SCCU00_varicoding"/>
<Parameter id="ALS00_partnumber"/>
<Parameter id="ALS00_varicoding"/>
<Parameter id="ACPR00_partnumber"/>
<Parameter id="ACPR00_varicoding"/>
<Parameter id="AFS00_partnumber"/>
<Parameter id="AFS00_varicoding"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="958" ActivityType="5" flags="0" name="Scan_KNR_DoorKombi">
<Rect left="640" top="284" right="740" bottom="316"/>
<SubProcesses>
<SubProcess id="Scan_KNR_DoorKombi">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" ret="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" ret="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="959" ActivityType="3" flags="0" name="普通节点">
<Rect left="520" top="554" right="620" bottom="586"/>
<Script>engine.plc_test_finished=true
engine.yellow_power=false
engine.power_h7 = false
#DELAY  100
engine.plc_test_finished=false</Script></Activity>
<Activity id="960" ActivityType="3" flags="0" name="普通节点">
<Rect left="760" top="554" right="860" bottom="586"/>
<Script>engine.yellow_power=false
engine.plc_test_finished=true
engine.power_hs7 = false
engine.power_h7 = false
engine.ecu_CAN_control_1 = false
#DELAY  100
engine.yellow_power=true</Script></Activity>
<Activity id="961" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="794" right="296" bottom="826"/>
</Activity>
<Activity id="963" ActivityType="5" flags="0" name="IVI读软件版本号-放前面读出来是000">
<Rect left="880" top="974" right="980" bottom="1006"/>
<SubProcesses>
<SubProcess id="IVI_HS7-1">
<Parameters>
<Parameter id="DString_C131_Partnumber_IVI" value="DString_C131_Partnumber_IVI"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="958" type="0">
</Transition>
<Transition StartId="162" EndId="163" type="6">
</Transition>
<Transition StartId="162" EndId="940" type="5">
</Transition>
<Transition StartId="163" EndId="939" type="0">
</Transition>
<Transition StartId="165" EndId="167" type="0">
</Transition>
<Transition StartId="166" EndId="169" type="0">
</Transition>
<Transition StartId="167" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="916" type="0">
</Transition>
<Transition StartId="169" EndId="922" type="0">
</Transition>
<Transition StartId="897" EndId="959" type="0">
</Transition>
<Transition StartId="899" EndId="957" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==true</Expression></Transition>
<Transition StartId="899" EndId="897" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==false</Expression></Transition>
<Transition StartId="916" EndId="166" type="0">
</Transition>
<Transition StartId="919" EndId="927" type="0">
</Transition>
<Transition StartId="920" EndId="928" type="0">
</Transition>
<Transition StartId="922" EndId="928" type="0">
</Transition>
<Transition StartId="923" EndId="947" type="0">
</Transition>
<Transition StartId="927" EndId="938" type="0">
</Transition>
<Transition StartId="928" EndId="942" type="0">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="933" EndId="934" type="0">
</Transition>
<Transition StartId="934" EndId="941" type="0">
</Transition>
<Transition StartId="935" EndId="919" type="6">
</Transition>
<Transition StartId="935" EndId="941" type="5">
</Transition>
<Transition StartId="938" EndId="923" type="0">
</Transition>
<Transition StartId="939" EndId="165" type="0">
</Transition>
<Transition StartId="939" EndId="961" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1PM20")or (DString_C131_Car_Tpye == "CH1PM30")or (DString_C131_Car_Tpye == "CNDA01A")</Expression></Transition>
<Transition StartId="940" EndId="958" type="0">
</Transition>
<Transition StartId="941" EndId="958" type="0">
</Transition>
<Transition StartId="942" EndId="932" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="949" type="0">
</Transition>
<Transition StartId="949" EndId="963" type="0">
</Transition>
<Transition StartId="957" EndId="960" type="0">
</Transition>
<Transition StartId="958" EndId="899" type="0">
</Transition>
<Transition StartId="959" EndId="162" type="0">
</Transition>
<Transition StartId="960" EndId="935" type="0">
</Transition>
<Transition StartId="961" EndId="168" type="0">
</Transition>
<Transition StartId="963" EndId="920" type="0">
</Transition>
</Transitions>
</Process>

