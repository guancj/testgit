<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="" type="8" dir="0" data=""/>
</Parameters>
<Variables>
<Variable id="DString_Car_Tpye" type="8" data="&quot;&quot;" description="车型"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="44" right="530" bottom="76"/>
<Script></Script><TitleText Enable="1" Text="Read VIN And Get CarType"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="获取VIN码阶段"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="344" right="530" bottom="376"/>
<Script></Script></End>
<Activities>
<Activity id="91" ActivityType="3" flags="0" name="获取车型">
<Rect left="430" top="224" right="530" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="获取车型"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_Car_Tpye = ""

engine.println("####获取到车辆数据");
engine.SetLineText(2,"获取成功")
engine.Delay(300)
DString_Car_Tpye = string.sub(engine.VehiData,61,80)
DString_Car_Tpye = string.gsub(DString_Car_Tpye, "^%s*(.-)%s*$", "%1")      
engine.println("车辆类型:"..DString_Car_Tpye);
if(LibGeneral.CarTNC_All(DString_Car_Tpye)) then
	engine.LastError = 0
else
	engine.LastError = 1
end

</Script></Activity>
<Activity id="218" ActivityType="5" flags="1" name="All_CarType">
<Rect left="590" top="224" right="690" bottom="256"/>
<SubProcesses>
<SubProcess id="All_CarType">
<Parameters>
<Parameter id="DString_Car_Tpye" ret="DString_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="车型设置">
<Rect left="430" top="284" right="530" bottom="316"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="车型设置"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.CarType=DString_Car_Tpye
print("车型:"..engine.CarType)</Script></Activity>
<Activity id="233" ActivityType="5" flags="0" name="EMS_ReadVIN">
<Rect left="60" top="74" right="160" bottom="106"/>
<SubProcesses>
<SubProcess id="EMS_ReadVIN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="234" ActivityType="5" flags="0" name="SAS_ReadVIN">
<Rect left="430" top="104" right="530" bottom="136"/>
<SubProcesses>
<SubProcess id="SAS_ReadVIN">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="下载车辆数据">
<Rect left="430" top="164" right="530" bottom="196"/>
<Line1Text Enable="1" Text="获取车辆数据中"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>	engine.SetLineText(1, "");

	for i = 1,3 do
		engine.DownloadVehiData()
		if(engine.VehiData == "")
		then
			engine.println("获取车辆数据失败，正在重试("..i..")...");
			engine.SetLineText(1, "获取车辆数据失败，正在重试("..i..")...");
		else
			break;
		end
	end
	  
	if(engine.VehiData == "")
	then
		engine.println("未获取到车辆数据");
		engine.SetLineText(1, "未获取到车辆数据");
	end</Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="获取失败">
<Rect left="590" top="164" right="690" bottom="196"/>
<ButtonLText Enable="1" Text="手选车型"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="239" ActivityType="4" flags="0" name="路由节点">
<Rect left="624" top="104" right="656" bottom="136"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="234" type="0">
</Transition>
<Transition StartId="91" EndId="232" type="3">
</Transition>
<Transition StartId="91" EndId="218" type="0">
</Transition>
<Transition StartId="218" EndId="232" type="0">
</Transition>
<Transition StartId="232" EndId="2" type="0">
</Transition>
<Transition StartId="234" EndId="236" type="0">
</Transition>
<Transition StartId="236" EndId="237" type="1">
<Expression>engine.VehiData == ""</Expression></Transition>
<Transition StartId="236" EndId="91" type="0">
</Transition>
<Transition StartId="237" EndId="218" type="5">
</Transition>
<Transition StartId="237" EndId="239" type="6">
</Transition>
<Transition StartId="239" EndId="236" type="0">
</Transition>
</Transitions>
</Process>

