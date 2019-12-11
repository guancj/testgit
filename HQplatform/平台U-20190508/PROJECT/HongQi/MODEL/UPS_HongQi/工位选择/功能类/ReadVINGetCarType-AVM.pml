<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="320" top="44" right="420" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="320" top="374" right="420" bottom="406"/>
<Script></Script></End>
<Activities>
<Activity id="91" ActivityType="3" flags="0" name="自动获取车辆数据">
<Rect left="320" top="194" right="420" bottom="226"/>
<Script>DString_Car_Tpye = ""
engine.SetLineText(1,"获取车辆数据...")
engine.DownloadVehiData()	


if(engine.VehiData~="")then
	engine.println("####获取到车辆数据");
        engine.SetLineText(2,"成功")
        engine.Delay(1000)
	DString_Car_Tpye = string.sub(engine.VehiData,61,80)
	DString_Car_Tpye = string.gsub(DString_Car_Tpye, "^%s*(.-)%s*$", "%1")
        
	engine.println("车辆类型:"..DString_Car_Tpye);
        if(LibGeneral.CarTNC_All(DString_Car_Tpye)) then
		engine.LastError = 0
        else
		engine.LastError = 1
        end
else
	engine.println("获取车辆数据失败")
       engine.SetLineText(2,"失败")
       engine.Delay(1000)
        engine.LastError = 1
end
</Script></Activity>
<Activity id="218" ActivityType="5" flags="0" name="All_CarType">
<Rect left="490" top="194" right="590" bottom="226"/>
<SubProcesses>
<SubProcess id="All_CarType">
<Parameters>
<Parameter id="DString_Car_Tpye" ret="DString_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="228" ActivityType="5" flags="0" name="IVI_ReadCarType">
<Rect left="740" top="94" right="840" bottom="126"/>
<SubProcesses>
<SubProcess id="IVI_ReadCarType">
<Parameters>
<Parameter id="CarType" ret="DString_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="车型设置">
<Rect left="320" top="294" right="420" bottom="326"/>
<Script>engine.CarType=DString_Car_Tpye
print("车型:"..engine.CarType)</Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="AVM专用，其他勿用">
<Rect left="90" top="124" right="190" bottom="156"/>
<Script></Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="VCI接口引脚不对">
<Rect left="90" top="24" right="190" bottom="56"/>
<Script></Script></Activity>
<Activity id="238" ActivityType="3" flags="0" name="物理地址修改为0">
<Rect left="90" top="74" right="190" bottom="106"/>
<Script></Script></Activity>
<Activity id="239" ActivityType="5" flags="0" name="EMS_ReadVIN-AVM">
<Rect left="70" top="214" right="170" bottom="246"/>
<SubProcesses>
<SubProcess id="EMS_ReadVIN-AVM">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="240" ActivityType="5" flags="1" name="EMS_ReadVIN">
<Rect left="320" top="124" right="420" bottom="156"/>
<SubProcesses>
<SubProcess id="EMS_ReadVIN">
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="240" type="0">
</Transition>
<Transition StartId="91" EndId="218" type="0">
</Transition>
<Transition StartId="91" EndId="232" type="3">
</Transition>
<Transition StartId="218" EndId="232" type="0">
</Transition>
<Transition StartId="228" EndId="218" type="1">
<Expression>DString_Car_Tpye == ""</Expression></Transition>
<Transition StartId="232" EndId="2" type="0">
</Transition>
<Transition StartId="240" EndId="91" type="0">
</Transition>
</Transitions>
</Process>

