<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="700" top="34" right="800" bottom="66"/>
<Script>engine.ExecuteRpdPending();</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="790" top="1094" right="890" bottom="1126"/>
<Script>--engine.H7_power_on_pf  = false
--engine.H7_power_on_pr  = false
if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
engine.H7_power_on_pf  = false
engine.H7_power_on_pr  = false
engine.H7_Light=false
engine.HS7_power_on_pf  = false
engine.HS7_power_on_pr  = false
engine.yellow_power=false</Script></End>
<Activities>
<Activity id="5" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="700" top="344" right="800" bottom="376"/>
<TitleText Enable="1" Text="FAW C079 右侧车门检测"/>
<Line1Text Enable="1" Text="将亮灯的手柄插到车门上"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>engine.yellow_power=false
engine.H7_Light=false
#DELAY  100
engine.yellow_power=true
#PRESSBUTTON
</Script></Activity>
<Activity id="163" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="700" top="404" right="800" bottom="436"/>
<Script>engine.HS7_power_on_pf  = true
engine.HS7_power_on_pr  = true
</Script></Activity>
<Activity id="164" ActivityType="5" flags="0" name="读配置码">
<Rect left="910" top="284" right="1010" bottom="316"/>
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
<Rect left="700" top="194" right="800" bottom="226"/>
<Script>VMTLOC = "DOR"
engine.WorkPlace="DOR"
engine.DialogBackColor = -1;
local alien = require ("alien")
local user = alien.load("Kernel32.dll") 
local cmdping = "w32tm /resync /nowait /force"
print("cmdping is "..cmdping)
user.WinExec:types{ret = 'int','string','int'}
user.WinExec(cmdping,0)</Script></Activity>
<Activity id="917" ActivityType="5" flags="0" name="pf_ECU">
<Rect left="910" top="624" right="1010" bottom="656"/>
<SubProcesses>
<SubProcess id="pf_ECU">
<Parameters>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="918" ActivityType="5" flags="0" name="pr_ECU">
<Rect left="910" top="764" right="1010" bottom="796"/>
<SubProcesses>
<SubProcess id="pr_ECU">
<Parameters>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="919" ActivityType="3" flags="0" name="打印">
<Rect left="790" top="944" right="890" bottom="976"/>
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
engine.DialogBackColor = -1;


</Script></Activity>
<Activity id="922" ActivityType="3" flags="0" name="普通节点">
<Rect left="790" top="1004" right="890" bottom="1036"/>
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
<Activity id="923" ActivityType="5" flags="0" name="passenger_door">
<Rect left="910" top="704" right="1010" bottom="736"/>
<SubProcesses>
<SubProcess id="passenger_door">
<Parameters>
<Parameter id="DString_C131_Passenger_Door_Speaker" value="Passenger_Door_Speaker"/>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="924" ActivityType="5" flags="0" name="rear_passenger_door">
<Rect left="910" top="824" right="1010" bottom="856"/>
<SubProcesses>
<SubProcess id="rear_passenger_door">
<Parameters>
<Parameter id="DString_C131_handleswic_PEPS" value="DString_C131_handleswic_PEPS"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="925" ActivityType="5" flags="0" name="PDCU">
<Rect left="700" top="714" right="800" bottom="746"/>
<SubProcesses>
<SubProcess id="PDCU">
<Parameters>
<Parameter id="DString_C131_Partnumber_PDCU" value="DString_C131_Partnumber_PDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="926" ActivityType="5" flags="0" name="RRDCU">
<Rect left="700" top="794" right="800" bottom="826"/>
<SubProcesses>
<SubProcess id="RRDCU">
<Parameters>
<Parameter id="DString_C131_Partnumber_RRDCU" value="DString_C131_Partnumber_RRDCU"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="927" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="700" top="884" right="800" bottom="916"/>
<Script>engine.HS7_power_on_pf  = false
engine.HS7_power_on_pr  = false
engine.yellow_power=false</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="开启12V电源">
<Rect left="910" top="404" right="1010" bottom="436"/>
<Script>engine.H7_power_on_pf  = true
engine.H7_power_on_pr  = true
</Script></Activity>
<Activity id="929" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="910" top="884" right="1010" bottom="916"/>
<Script>engine.H7_power_on_pf  = false
engine.H7_power_on_pr  = false
engine.H7_Light=false</Script></Activity>
<Activity id="931" ActivityType="3" flags="0" name="提示开启12V电源">
<Rect left="910" top="344" right="1010" bottom="376"/>
<TitleText Enable="1" Text="FAW C131 右侧车门检测"/>
<Line1Text Enable="1" Text="将亮灯的手柄插到车门上"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="合格"/>
<Script>engine.H7_Light=false
engine.yellow_power=false
engine.power_switch_9V = true
#DELAY  100
engine.H7_Light=true
#PRESSBUTTON
</Script></Activity>
<Activity id="937" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="1004" right="1226" bottom="1036"/>
</Activity>
<Activity id="938" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="124" right="1226" bottom="156"/>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="延时2000MS">
<Rect left="700" top="464" right="800" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车门上电中，请等待"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  2000</Script></Activity>
<Activity id="941" ActivityType="5" flags="0" name="Scan_KNR_DoorKombi">
<Rect left="700" top="124" right="800" bottom="156"/>
<SubProcesses>
<SubProcess id="Scan_KNR_DoorKombi">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" ret="DString_C131_Car_Tpye"/>
<Parameter id="DString_Write_VIN" ret="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="942" ActivityType="5" flags="0" name="Get_Vehicle_DoorKombi">
<Rect left="700" top="284" right="800" bottom="316"/>
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
<Activity id="943" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="124" right="586" bottom="156"/>
</Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="344" right="586" bottom="376"/>
</Activity>
<Activity id="945" ActivityType="13" flags="0" name="dlgWaitSecondBar_showtime">
<Rect left="700" top="574" right="800" bottom="606"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="dlgWaitSecondBar_showtime" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="2"/>
<Parameter id="Timeout" value="10"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="969" ActivityType="3" flags="0" name="信息确认">
<Rect left="700" top="524" right="800" bottom="556"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="970" ActivityType="3" flags="0" name="信息确认">
<Rect left="700" top="624" right="800" bottom="656"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line3Text Enable="1" Text="一致按确认，否则按取消"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="971" ActivityType="13" flags="0" name="dlgWaitSecondBar_showtime">
<Rect left="910" top="514" right="1010" bottom="546"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<FunctionRef id="dlgWaitSecondBar_showtime" model="LibUI">
<Parameters>
<Parameter id="LineNr" value="2"/>
<Parameter id="Timeout" value="10"/>
<Parameter id="Text" value="&quot;请等待&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="972" ActivityType="3" flags="0" name="信息确认">
<Rect left="910" top="464" right="1010" bottom="496"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.DialogBackColor = "yellow"</Script></Activity>
<Activity id="973" ActivityType="3" flags="0" name="信息确认">
<Rect left="910" top="564" right="1010" bottom="596"/>
<Line1Text Enable="1" Text="&lt;&lt;请确认车门状态与看板信息一致&gt;&gt;"/>
<Line3Text Enable="1" Text="一致按确认，否则按取消"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
engine.DialogBackColor = -1;</Script></Activity>
<Activity id="974" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="520" top="624" right="620" bottom="656"/>
<Script>engine.HS7_power_on_pf  = false
engine.HS7_power_on_pr  = false
engine.yellow_power=false</Script></Activity>
<Activity id="975" ActivityType="3" flags="0" name="关闭12V电源">
<Rect left="1050" top="564" right="1150" bottom="596"/>
<Script>engine.H7_power_on_pf  = false
engine.H7_power_on_pr  = false
engine.H7_Light=false</Script></Activity>
<Activity id="976" ActivityType="4" flags="0" name="路由节点">
<Rect left="1194" top="564" right="1226" bottom="596"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="941" type="0">
</Transition>
<Transition StartId="5" EndId="163" type="6">
</Transition>
<Transition StartId="5" EndId="944" type="5">
</Transition>
<Transition StartId="163" EndId="939" type="0">
</Transition>
<Transition StartId="164" EndId="931" type="0">
</Transition>
<Transition StartId="898" EndId="164" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==false</Expression></Transition>
<Transition StartId="898" EndId="942" type="1">
<Expression>LibGeneral.CarTNC_DoorKombi(DString_C131_Car_Tpye)==true</Expression></Transition>
<Transition StartId="917" EndId="923" type="0">
</Transition>
<Transition StartId="918" EndId="924" type="0">
</Transition>
<Transition StartId="919" EndId="922" type="0">
</Transition>
<Transition StartId="922" EndId="937" type="0">
</Transition>
<Transition StartId="922" EndId="2" type="0">
</Transition>
<Transition StartId="923" EndId="918" type="0">
</Transition>
<Transition StartId="924" EndId="929" type="0">
</Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="927" type="0">
</Transition>
<Transition StartId="927" EndId="919" type="0">
</Transition>
<Transition StartId="928" EndId="972" type="0">
</Transition>
<Transition StartId="929" EndId="919" type="0">
</Transition>
<Transition StartId="931" EndId="928" type="6">
</Transition>
<Transition StartId="931" EndId="938" type="5">
</Transition>
<Transition StartId="937" EndId="976" type="0">
</Transition>
<Transition StartId="938" EndId="941" type="0">
</Transition>
<Transition StartId="939" EndId="969" type="0">
</Transition>
<Transition StartId="941" EndId="898" type="0">
</Transition>
<Transition StartId="942" EndId="5" type="0">
</Transition>
<Transition StartId="943" EndId="941" type="0">
</Transition>
<Transition StartId="944" EndId="943" type="0">
</Transition>
<Transition StartId="945" EndId="970" type="0">
</Transition>
<Transition StartId="969" EndId="945" type="0">
</Transition>
<Transition StartId="970" EndId="925" type="0">
</Transition>
<Transition StartId="970" EndId="974" type="5">
</Transition>
<Transition StartId="971" EndId="973" type="0">
</Transition>
<Transition StartId="972" EndId="971" type="0">
</Transition>
<Transition StartId="973" EndId="917" type="0">
</Transition>
<Transition StartId="973" EndId="975" type="5">
</Transition>
<Transition StartId="974" EndId="944" type="0">
</Transition>
<Transition StartId="975" EndId="976" type="0">
</Transition>
<Transition StartId="976" EndId="938" type="0">
</Transition>
</Transitions>
</Process>

