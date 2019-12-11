<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="34" right="580" bottom="66"/>
<Script>--engine.ExecuteRpdPending();</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="1044" right="580" bottom="1076"/>
<Script>--engine.H7_power_on_df  = true
--engine.H7_power_on_dr  = true
if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
engine.H7_power_on_df  = false
engine.H7_power_on_dr  = false
engine.H7_Light=false
engine.power_switch_9V = false
engine.HS7_power_on_df  = false
engine.HS7_power_on_dr  = false
engine.yellow_power=false
</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="480" top="344" right="580" bottom="376"/>
<TitleText Enable="1" Text="FAW C079 左侧车门检测"/>
<Line1Text Enable="1" Text="将亮灯的手柄插到车门上"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="480" top="404" right="580" bottom="436"/>
<Script>engine.HS7_power_on_df  = true
engine.HS7_power_on_dr  = true</Script></Activity>
<Activity id="164" ActivityType="5" flags="0" name="读配置码">
<Rect left="720" top="164" right="820" bottom="196"/>
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
<Parameter id="Driver_Door_Speaker" ret="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker" ret="Passenger_Door_Speaker"/>
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
<Activity id="898" ActivityType="3" flags="0" name="设置工位">
<Rect left="480" top="164" right="580" bottom="196"/>
<Script>VMTLOC = "DOR"
engine.WorkPlace="DOR"
engine.DialogBackColor = -1;
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="917" ActivityType="5" flags="0" name="df_ECU">
<Rect left="720" top="624" right="820" bottom="656"/>
<SubProcesses>
<SubProcess id="df_ECU">
<Parameters>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="919" ActivityType="5" flags="0" name="dr_ECU">
<Rect left="720" top="744" right="820" bottom="776"/>
<SubProcesses>
<SubProcess id="dr_ECU">
<Parameters>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="920" ActivityType="5" flags="0" name="driver_door">
<Rect left="720" top="684" right="820" bottom="716"/>
<SubProcesses>
<SubProcess id="driver_door">
<Parameters>
<Parameter id="DString_C131_Driver_Door_Speaker" value="Driver_Door_Speaker"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="921" ActivityType="3" flags="0" name="普通节点">
<Rect left="480" top="914" right="580" bottom="946"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>local StatisticTestResult = engine.GetResults();
if(engine.TestResult ~= 0 and #StatisticTestResult ~= 0) then
	engine.DialogBackColor = "red";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test NOK");
        engine.Delay(2000);
elseif(engine.TestResult == 0 and #StatisticTestResult ~= 0) then
	engine.DialogBackColor = "green";
        engine.SetTitleText("Total evaluation")
        engine.SetLineText(2,"Test OK");
        engine.Delay(2000);
end;
        engine.SetTitleText("")
        engine.SetLineText(2,"");
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="922" ActivityType="3" flags="1" name="普通节点">
<Rect left="480" top="984" right="580" bottom="1016"/>
<Script>engine.WorkPlace = "DOR";
engine.SelectLayout(0);
local StatisticTestResult = engine.GetResults();

engine.println("###&lt;main&gt; workplace for send result###".. tostring(engine.WorkPlace))

if (#StatisticTestResult ~= 0) then

--engine.SaveResultXml("");

engine.SetLineText(0,"");
engine.SetLineText(1,"");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();

end;
engine.SaveResultXml("");
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="720" top="374" right="820" bottom="406"/>
<Script>engine.H7_power_on_df  = true
engine.H7_power_on_dr  = true</Script></Activity>
<Activity id="929" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="720" top="314" right="820" bottom="346"/>
<TitleText Enable="1" Text="FAW C131 左侧车门检测"/>
<Line1Text Enable="1" Text="将亮灯的手柄插到车门上"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="930" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="720" top="914" right="820" bottom="946"/>
<Script>engine.H7_power_on_df  = false
engine.H7_power_on_dr  = false
engine.H7_Light=false
engine.power_switch_9V = false</Script></Activity>
<Activity id="931" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="480" top="864" right="580" bottom="896"/>
<Script>engine.HS7_power_on_df  = false
engine.HS7_power_on_dr  = false
engine.yellow_power=false</Script></Activity>
<Activity id="932" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="984" right="1046" bottom="1016"/>
</Activity>
<Activity id="933" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="104" right="1046" bottom="136"/>
</Activity>
<Activity id="934" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="340" top="404" right="440" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车门上电中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="937" ActivityType="5" flags="0" name="Scan_KNR_DoorKombi">
<Rect left="480" top="104" right="580" bottom="136"/>
<SubProcesses>
<SubProcess id="Scan_KNR_DoorKombi">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" ret="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" ret="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="959" ActivityType="5" flags="0" name="Get_Vehicle_DoorKombi">
<Rect left="480" top="224" right="580" bottom="256"/>
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
<Parameter id="Driver_Door_Speaker" ret="Driver_Door_Speaker"/>
<Parameter id="Passenger_Door_Speaker" ret="Passenger_Door_Speaker"/>
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
<Activity id="960" ActivityType="5" flags="0" name="DDCU">
<Rect left="480" top="634" right="580" bottom="666"/>
<SubProcesses>
<SubProcess id="DDCU">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_C131_Partnumber_DDCU" value="DString_C131_Partnumber_DDCU"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="961" ActivityType="5" flags="0" name="RLDCU">
<Rect left="480" top="754" right="580" bottom="786"/>
<SubProcesses>
<SubProcess id="RLDCU">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="DString_C131_Partnumber_RLDCU" value="DString_C131_Partnumber_RLDCU"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="962" ActivityType="5" flags="0" name="DDCU_line_decetion_HS7">
<Rect left="480" top="694" right="580" bottom="726"/>
<SubProcesses>
<SubProcess id="DDCU_line_decetion_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="963" ActivityType="5" flags="0" name="RLDCU_line_decetion_HS7">
<Rect left="480" top="814" right="580" bottom="846"/>
<SubProcesses>
<SubProcess id="RLDCU_line_decetion_HS7">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="964" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="104" right="326" bottom="136"/>
</Activity>
<Activity id="965" ActivityType="4" flags="0" name="路由节点">
<Rect left="294" top="344" right="326" bottom="376"/>
</Activity>
<Activity id="966" ActivityType="3" flags="0" name="普通节点">
<Rect left="720" top="224" right="820" bottom="256"/>
<Script>engine.H7_Light=false
engine.yellow_power=false
#DELAY  100
engine.H7_Light=true</Script></Activity>
<Activity id="967" ActivityType="3" flags="0" name="普通节点">
<Rect left="480" top="284" right="580" bottom="316"/>
<Script>engine.yellow_power=false
engine.H7_Light=false
engine.yellow_power=true
#DELAY  100</Script></Activity>
<Activity id="969" ActivityType="3" flags="0" name="信息确认">
<Rect left="480" top="464" right="580" bottom="496"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="970" ActivityType="3" flags="0" name="信息确认">
<Rect left="480" top="574" right="580" bottom="606"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line3Text Enable="1" Text="一致按确认，否则按取消"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="975" ActivityType="4" flags="0" name="路由节点">
<Rect left="1014" top="554" right="1046" bottom="586"/>
</Activity>
<Activity id="981" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="870" top="554" right="970" bottom="586"/>
<Script>engine.H7_power_on_df  = false
engine.H7_power_on_dr  = false
engine.H7_Light=false
engine.power_switch_9V = false</Script></Activity>
<Activity id="982" ActivityType="5" flags="0" name="rear_driver_door">
<Rect left="720" top="804" right="820" bottom="836"/>
<SubProcesses>
<SubProcess id="rear_driver_door">
<Parameters>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="983" ActivityType="13" flags="0" name="dlgWaitSecondBar_showtime">
<Rect left="480" top="524" right="580" bottom="556"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<FunctionRef id="dlgWaitSecondBar_showtime" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="2"/>
<Parameter id="Timeout" value="10"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="984" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="260" top="574" right="360" bottom="606"/>
<Script>engine.HS7_power_on_df  = false
engine.HS7_power_on_dr  = false
engine.yellow_power=false
engine.power_switch_9V = false</Script></Activity>
<Activity id="985" ActivityType="13" flags="0" name="dlgWaitSecondBar_showtime">
<Rect left="720" top="494" right="820" bottom="526"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<FunctionRef id="dlgWaitSecondBar_showtime" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="2"/>
<Parameter id="Timeout" value="10"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="986" ActivityType="3" flags="0" name="信息确认">
<Rect left="720" top="434" right="820" bottom="466"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="987" ActivityType="3" flags="0" name="信息确认">
<Rect left="720" top="554" right="820" bottom="586"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line3Text Enable="1" Text="一致按确认，否则按取消"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.DialogBackColor = -1;</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="937" type="0">
</Transition>
<Transition StartId="3" EndId="163" type="6">
</Transition>
<Transition StartId="3" EndId="965" type="5">
</Transition>
<Transition StartId="163" EndId="934" type="0">
</Transition>
<Transition StartId="164" EndId="966" type="0">
</Transition>
<Transition StartId="898" EndId="164" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==false</Expression></Transition>
<Transition StartId="898" EndId="959" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==true</Expression></Transition>
<Transition StartId="917" EndId="920" type="0">
</Transition>
<Transition StartId="919" EndId="982" type="0">
</Transition>
<Transition StartId="920" EndId="919" type="0">
</Transition>
<Transition StartId="921" EndId="922" type="0">
</Transition>
<Transition StartId="922" EndId="932" type="0">
</Transition>
<Transition StartId="928" EndId="986" type="0">
</Transition>
<Transition StartId="929" EndId="928" type="6">
</Transition>
<Transition StartId="929" EndId="933" type="5">
</Transition>
<Transition StartId="930" EndId="921" type="0">
</Transition>
<Transition StartId="931" EndId="921" type="0">
</Transition>
<Transition StartId="932" EndId="975" type="0">
</Transition>
<Transition StartId="933" EndId="937" type="0">
</Transition>
<Transition StartId="934" EndId="969" type="0">
</Transition>
<Transition StartId="937" EndId="898" type="0">
</Transition>
<Transition StartId="959" EndId="967" type="0">
</Transition>
<Transition StartId="960" EndId="962" type="0">
</Transition>
<Transition StartId="961" EndId="963" type="0">
</Transition>
<Transition StartId="962" EndId="961" type="0">
</Transition>
<Transition StartId="963" EndId="931" type="0">
</Transition>
<Transition StartId="964" EndId="937" type="0">
</Transition>
<Transition StartId="965" EndId="964" type="0">
</Transition>
<Transition StartId="966" EndId="929" type="0">
</Transition>
<Transition StartId="967" EndId="3" type="0">
</Transition>
<Transition StartId="969" EndId="983" type="0">
</Transition>
<Transition StartId="970" EndId="960" type="0">
</Transition>
<Transition StartId="970" EndId="984" type="5">
</Transition>
<Transition StartId="975" EndId="933" type="0">
</Transition>
<Transition StartId="981" EndId="975" type="0">
</Transition>
<Transition StartId="982" EndId="930" type="0">
</Transition>
<Transition StartId="983" EndId="970" type="0">
</Transition>
<Transition StartId="984" EndId="965" type="0">
</Transition>
<Transition StartId="985" EndId="987" type="0">
</Transition>
<Transition StartId="986" EndId="985" type="0">
</Transition>
<Transition StartId="987" EndId="917" type="0">
</Transition>
<Transition StartId="987" EndId="981" type="5">
</Transition>
</Transitions>
</Process>

