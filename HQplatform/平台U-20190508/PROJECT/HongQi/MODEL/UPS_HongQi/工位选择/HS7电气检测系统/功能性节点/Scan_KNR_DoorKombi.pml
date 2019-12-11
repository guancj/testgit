<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_C131_Car_Tpye" type="8" dir="1" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="1" data=""/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="0xF1" description="Tester地址"/>
<Variable id="Baudrate" type="3" data="500000" description="波特率"/>
<Variable id="TIdle" type="3" data="400" description="IdleLine"/>
<Variable id="TWuP" type="3" data="50" description="WuP"/>
<Variable id="P1Min" type="3" data="0" description="ECUInterval"/>
<Variable id="P1Max" type="3" data="20" description="ECUInterval"/>
<Variable id="P2Min" type="3" data="25" description="TexterReq-&gt;ECURes"/>
<Variable id="P2Max" type="3" data="50" description="TexterReq-&gt;ECURes"/>
<Variable id="P3Min" type="3" data="10" description="ECURes-&gt;TexterReq"/>
<Variable id="P3Max" type="3" data="4000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x4D8" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x6C3" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="350" top="64" right="450" bottom="96"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="350" top="264" right="450" bottom="296"/>
<Script>engine.ResultVid=DString_Write_VIN</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="提示扫码">
<Rect left="350" top="144" right="450" bottom="176"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="扫描VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#INPUT VIN

DString_Write_VIN=string.upper(VIN)
engine.VIN = DString_Write_VIN
engine.SetLineText(3,DString_Write_VIN);
engine.SetRButtonText("");
engine.SelectLayout(0);
engine.ShowMessage();
engine.Speak("完成");
engine.println("扫码完成，提示音");

if(#DString_Write_VIN==17)then
   engine.KNR = string.sub(DString_Write_VIN,10)
elseif(#DString_Write_VIN==8)then
   engine.KNR = DString_Write_VIN
else
end
engine.println("扫码:"..tostring(DString_Write_VIN));
engine.println("KNR:"..tostring(engine.KNR));
</Script></Activity>
<Activity id="10" ActivityType="3" flags="1" name="获取车辆数据">
<Rect left="351" top="204" right="451" bottom="236"/>
<Line1Text Enable="1" Text="获取车辆数据"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DownloadVehiData()	
DString_C131_Car_Tpye1 = string.sub(engine.VehiData,61,73)
DString_C131_Car_Tpye=string.gsub(DString_C131_Car_Tpye1, "^%s*(.-)%s*$", "%1")
engine.CarType=DString_C131_Car_Tpye;
engine.println("VIN:"..tostring(DString_Write_VIN));
if(engine.VehiData~="")then
	DString_Write_VIN=string.sub(engine.VehiData,1,17)
	engine.println("获取到车辆数据");
	engine.println("车型:"..tostring(DString_C131_Car_Tpye));
	engine.println("车辆数据:"..tostring(engine.VehiData));
     if(LibGeneral.CarTNC_All(DString_C131_Car_Tpye)) then
		engine.LastError = 0
      else
		engine.LastError = 1
      end
else
	engine.println("未获取到车辆数据")   
        engine.LastError = 1
end

</Script></Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="514" top="64" right="546" bottom="96"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="VIN码长度有误，重新扫描">
<Rect left="480" top="144" right="580" bottom="176"/>
<Line2Text Enable="1" Text="VIN码长度有误"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="输入完整VIN">
<Rect left="480" top="264" right="580" bottom="296"/>
<Line1Text Enable="1" Text="请输入完整17位VIN"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#INPUT engine.ResultVid
DString_Write_VIN=string.upper(engine.ResultVid)
engine.SetLineText(3,DString_Write_VIN);
engine.KNR = string.sub(DString_Write_VIN,10)
engine.println("手动输入VIN:"..tostring(DString_Write_VIN));
engine.println("KNR:"..tostring(engine.KNR));</Script></Activity>
<Activity id="25" ActivityType="3" flags="0" name="VIN码长度有误，重新扫描">
<Rect left="600" top="264" right="700" bottom="296"/>
<Line2Text Enable="1" Text="VIN码长度不足17位"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="635" top="195" right="667" bottom="227"/>
</Activity>
<Activity id="29" ActivityType="5" flags="0" name="All_CarType-DoorKombi">
<Rect left="490" top="204" right="590" bottom="236"/>
<SubProcesses>
<SubProcess id="All_CarType-DoorKombi">
<Parameters>
<Parameter id="DString_C131_Car_Tpye" ret="DString_C131_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="10" type="1">
<Expression>((#DString_Write_VIN==17) or (#DString_Write_VIN==8)) </Expression></Transition>
<Transition StartId="3" EndId="22" type="0">
</Transition>
<Transition StartId="10" EndId="29" type="0">
</Transition>
<Transition StartId="10" EndId="1" type="3">
</Transition>
<Transition StartId="20" EndId="3" type="0">
</Transition>
<Transition StartId="22" EndId="20" type="0">
</Transition>
<Transition StartId="24" EndId="1" type="0">
</Transition>
<Transition StartId="24" EndId="25" type="1">
<Expression>#DString_Write_VIN~=17</Expression></Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="24" type="0">
</Transition>
<Transition StartId="29" EndId="1" type="0">
</Transition>
</Transitions>
</Process>

