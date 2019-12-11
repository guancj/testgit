<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="320" top="14" right="420" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="140" top="684" right="240" bottom="716"/>
<Script></Script></End>
<Activities>
<Activity id="183" ActivityType="13" flags="1" name="StatisticResultList">
<Rect left="320" top="504" right="420" bottom="536"/>
<FunctionRef id="StatisticResultList" model="LibGeneral">
<Parameters>
<Parameter id="Flag_ShowTBLResult" value="true"/>
<Parameter id="testResult" value="0"/>
<Parameter id="textPblSel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="187" ActivityType="3" flags="0" name="上传统计打印结果">
<Rect left="320" top="564" right="420" bottom="596"/>
<Script>
engine.SaveResultXml();

engine.SetLineText(0,"");
engine.SetLineText(1,"测试结果打印中");
engine.SetLineText(2,"");
engine.SetLineText(3,"");
engine.ShowMessage();
</Script></Activity>
<Activity id="218" ActivityType="3" flags="0" name="工位设置">
<Rect left="320" top="274" right="420" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.WorkPlace="AVM"</Script></Activity>
<Activity id="221" ActivityType="3" flags="0" name="车型打印">
<Rect left="320" top="394" right="420" bottom="426"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_Car_Tpye = engine.CarType
print("###车型选择参数:"..DString_Car_Tpye)</Script></Activity>
<Activity id="222" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="74" right="646" bottom="106"/>
</Activity>
<Activity id="232" ActivityType="5" flags="0" name="AVM_Calibration">
<Rect left="320" top="444" right="420" bottom="476"/>
<SubProcesses>
<SubProcess id="AVM_Calibration">
<Parameters>
<Parameter id="DString_Partnumber" value="AVM_partnumber"/>
<Parameter id="DString_VariCoding" value="AVM_varicoding"/>
<Parameter id="DString_Write_VIN"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="等待车辆就位">
<Rect left="320" top="124" right="420" bottom="156"/>
<Line1Text Enable="1" Text="等待车辆就位..."/>
<Script>repeat
#DELAY 500
until(engine.carInPosSig == true)
</Script></Activity>
<Activity id="234" ActivityType="3" flags="0" name="等待车辆驶离">
<Rect left="450" top="684" right="550" bottom="716"/>
<Line1Text Enable="1" Text="请断开OBD，并将手柄放回原位"/>
<Line2Text Enable="1" Text="等待车辆驶离"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.DialogBackColor = "yellow"
repeat
#DELAY 500
until(engine.carInPosSig == false)
</Script></Activity>
<Activity id="241" ActivityType="3" flags="0" name="断开OBD">
<Rect left="320" top="684" right="420" bottom="716"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请断开OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = "yellow"
while(1 == bit32.band(engine.VciStatus,0x01)) do
	engine.Delay(300)
end
engine.DialogBackColor = -1
engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")

  </Script></Activity>
<Activity id="242" ActivityType="3" flags="0" name="状态初始化">
<Rect left="320" top="74" right="420" bottom="106"/>
<Line1Text Enable="1" Text="初始化中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1;
engine.cylinderOut = false;
engine.cylinderIn = true;
</Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="状态初始化">
<Rect left="580" top="684" right="680" bottom="716"/>
<Line1Text Enable="1" Text="初始化中..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.cylinderOut = false;
engine.cylinderIn = true;
</Script></Activity>
<Activity id="244" ActivityType="3" flags="0" name="检测OBD">
<Rect left="320" top="174" right="420" bottom="206"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="检测OBD"/>
<Line3Text Enable="1" Text="请连接OBD连接线"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.WorkPlace = "AVM"
engine.SharedVarSet("_ProcessOK",0)

engine.DialogBackColor = -1
while(0 == bit32.band(engine.VciStatus,0x01)) do
	engine.ExecuteRpdPending();
	engine.Delay(300)
        engine.println("VDI状态:"..tostring(engine.VciStatus));
end

engine.SetLineText(0,"")
engine.SetLineText(1,"")
engine.SetLineText(2,"")
engine.SetLineText(3,"")
</Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="同步服务器时间">
<Rect left="320" top="224" right="420" bottom="256"/>
<Script>answer = ExecuteProcess("C:\\Windows\\System32\\net.exe","C:\\Windows\\System32\\net.exe time \\\\10.134.184.2 /set /yes",0,false) 
</Script></Activity>
<Activity id="247" ActivityType="5" flags="0" name="ReadVINGetCarType-AVM">
<Rect left="140" top="334" right="240" bottom="366"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType-AVM">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="248" ActivityType="3" flags="0" name="对中收回">
<Rect left="320" top="624" right="420" bottom="656"/>
<Line1Text Enable="1" Text="对中气缸收回，请等待"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>repeat
	engine.cylinderIn = true
        engine.Delay(1000)
until (engine.inSig == true)
engine.cylinderIn = false
#DELAY 5000
</Script></Activity>
<Activity id="250" ActivityType="3" flags="0" name="对中开启">
<Rect left="140" top="464" right="240" bottom="496"/>
<Line1Text Enable="1" Text="等待对中气缸伸出..."/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--repeat
	engine.cylinderOut = true
        engine.Delay(5000)
--until (engine.outSigF == true and engine.outSigR == true)
engine.cylinderOut = false

--#DELAY 5000
</Script></Activity>
<Activity id="251" ActivityType="3" flags="0" name="五秒倒计时">
<Rect left="140" top="544" right="240" bottom="576"/>
<Line3Text Enable="1"/>
<Script>i = 0 
while true do
i = i+1;
#DELAY 1000
engine.SetLineText(1,i);
if(i == 5)then
break
end 
end</Script></Activity>
<Activity id="252" ActivityType="5" flags="0" name="ReadVINGetCarType">
<Rect left="320" top="334" right="420" bottom="366"/>
<SubProcesses>
<SubProcess id="ReadVINGetCarType">
<Parameters>
<Parameter id=""/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="242" type="0">
</Transition>
<Transition StartId="183" EndId="187" type="0">
</Transition>
<Transition StartId="187" EndId="248" type="0">
</Transition>
<Transition StartId="218" EndId="252" type="0">
</Transition>
<Transition StartId="221" EndId="232" type="0">
</Transition>
<Transition StartId="222" EndId="242" type="0">
</Transition>
<Transition StartId="232" EndId="183" type="0">
</Transition>
<Transition StartId="233" EndId="244" type="0">
</Transition>
<Transition StartId="234" EndId="243" type="0">
</Transition>
<Transition StartId="241" EndId="234" type="0">
</Transition>
<Transition StartId="242" EndId="233" type="0">
</Transition>
<Transition StartId="243" EndId="222" type="0">
</Transition>
<Transition StartId="244" EndId="246" type="0">
</Transition>
<Transition StartId="246" EndId="218" type="0">
</Transition>
<Transition StartId="248" EndId="241" type="0">
</Transition>
<Transition StartId="250" EndId="251" type="0">
</Transition>
<Transition StartId="252" EndId="221" type="0">
</Transition>
</Transitions>
</Process>

