<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Rect left="370" top="44" right="470" bottom="76"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="370" top="344" right="470" bottom="376"/>
<Script>engine.ResultVid=DString_Write_VIN</Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="选择车型">
<Rect left="920" top="214" right="1020" bottom="246"/>
<Line1Text Enable="1" Text="选择车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
--engine.ListAddString("CH1KM11",false);
--engine.ListAddString("CH1KM21",false);
--[[
改脸
CH1GM21-&gt;CH1GM30
CH1GM22-&gt;CH1GM23
CH1AM41-&gt;CH1AM43
CH1AM42-&gt;CH1AM44
CH1BM33-&gt;CH1BM34
CH1CM29-&gt;CH1CM31
CH1DM14-&gt;CH1DM16
CH1DM15-&gt;CH1DM17
四驱
CH1FM12-&gt;CH1FM20
CH1FM13-&gt;CH1FM30
CH1BM33==CH1NM11
V6DCT
CH1JM11-&gt;CH1JM12
混动
CH1LM11-&gt;CH1LM13
CH1LM21-&gt;CH1LM23
]]--
engine.ListAddString("CH1GM40",true);
engine.ListAddString("CH1GM41",false);
engine.ListAddString("CH1GM42",false);
engine.ListAddString("CH1AM46",false);
engine.ListAddString("CH1AM47",true);
engine.ListAddString("CH1AM48",false);
engine.ListAddString("CH1BM35",false);
engine.ListAddString("CH1CM32",false);
engine.ListAddString("CH1BM35",false);
engine.ListAddString("CH1CM32",false);
engine.ListAddString("CH1CM33",false);
engine.ListAddString("CH1MM41",false);
engine.ListAddString("CH1GM23",false);


engine.ListAddString("CDAB01",true);
engine.ListAddString("CDAB02",false);
engine.ListAddString("CDAB03",false);
engine.ListAddString("CDAB04",false);
engine.ListAddString("CDAB05",false);
engine.ListAddString("CDAB06",false);
engine.ListAddString("CDAB07",false);
engine.ListAddString("CDAB08",false);

--19年型
engine.ListAddString("CMNA02A",true);
engine.ListAddString("CMNA01A",false);
engine.ListAddString("CH1QM30",false);
engine.ListAddString("CH1QM40",false);
engine.ListAddString("CH1QM50",false);
engine.ListAddString("CNDA01A",false);
engine.ListAddString("CH1PM30",false);
engine.ListAddString("CH1PM20",false);


#INPUT  DString_Car_Tpye
engine.CarType=DString_Car_Tpye;
engine.SetLineText(3,DString_Car_Tpye);
engine.println("手动选择车型:"..DString_Car_Tpye);
engine.SelectLayout(0);
</Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="提示扫码">
<Rect left="370" top="104" right="470" bottom="136"/>
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
<Activity id="10" ActivityType="3" flags="0" name="获取车型">
<Rect left="370" top="224" right="470" bottom="256"/>
<Line1Text Enable="1" Text="获取车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_Car_Tpye = "";
DString_Car_Tpye = string.sub(engine.VehiData,61,80)
engine.CarType = string.gsub(DString_Car_Tpye, "^%s*(.-)%s*$", "%1")
DString_Car_Tpye = engine.CarType 
print("车型长度:"..#DString_Car_Tpye)
engine.println("VIN:"..tostring(DString_Write_VIN));
if(engine.VehiData~="")then
	DString_Write_VIN=string.sub(engine.VehiData,1,17)
	engine.println("获取到车辆数据");
	engine.println("车型:"..tostring(DString_Car_Tpye));
	engine.println("车辆数据:"..tostring(engine.VehiData));
      if(LibGeneral.CarTNC_All(DString_Car_Tpye)) then
		engine.LastError = 0
                engine.println("有此车型");
      else
		engine.LastError = 1
                engine.println("没有此车型");
                engine.println("车型："..DString_Car_Tpye);
       end
else
	engine.println("未获取到车辆数据") 
        engine.LastError = 1  
end

</Script></Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="44" right="296" bottom="76"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="VIN码长度有误，重新扫描">
<Rect left="230" top="104" right="330" bottom="136"/>
<Line2Text Enable="1" Text="VIN码长度有误"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="输入完整VIN">
<Rect left="510" top="344" right="610" bottom="376"/>
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
<Rect left="650" top="344" right="750" bottom="376"/>
<Line2Text Enable="1" Text="VIN码长度不足17位"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="684" top="224" right="716" bottom="256"/>
</Activity>
<Activity id="28" ActivityType="5" flags="0" name="All_CarType">
<Rect left="510" top="224" right="610" bottom="256"/>
<SubProcesses>
<SubProcess id="All_CarType">
<Parameters>
<Parameter id="DString_Car_Tpye" ret="DString_Car_Tpye"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="29" ActivityType="3" flags="1" name="下载车辆数据">
<Rect left="370" top="164" right="470" bottom="196"/>
<Line1Text Enable="1" Text="获取车辆数据中"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.SetLineText(1, "");

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
end

</Script></Activity>
<Activity id="237" ActivityType="3" flags="0" name="获取失败">
<Rect left="510" top="164" right="610" bottom="196"/>
<ButtonLText Enable="1" Text="手选车型"/>
<ButtonRText Enable="1" Text="重试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="544" top="104" right="576" bottom="136"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="29" type="1">
<Expression>((#DString_Write_VIN==17) or (#DString_Write_VIN==8)) </Expression></Transition>
<Transition StartId="3" EndId="22" type="0">
</Transition>
<Transition StartId="10" EndId="1" type="3">
</Transition>
<Transition StartId="10" EndId="28" type="0">
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
<Transition StartId="28" EndId="1" type="0">
</Transition>
<Transition StartId="29" EndId="237" type="1">
<Expression>engine.VehiData == ""</Expression></Transition>
<Transition StartId="29" EndId="10" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="6">
</Transition>
<Transition StartId="237" EndId="28" type="5">
</Transition>
<Transition StartId="238" EndId="29" type="0">
</Transition>
</Transitions>
</Process>

