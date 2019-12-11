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
<Rect left="351" top="76" right="451" bottom="108"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="308" top="253" right="408" bottom="285"/>
<Script>--engine.ResultVid=DString_Write_VIN</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="选择车型">
<Rect left="480" top="204" right="580" bottom="236"/>
<Line1Text Enable="1" Text="选择车型"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
--engine.ListAddString("CH1KM11",false);
--engine.ListAddString("CH1KM21",false);
engine.ListAddString("CH1LM13",false);
engine.ListAddString("CH1LM23",false);

engine.ListAddString("CH1LM11",false);
engine.ListAddString("CH1LM21",false);
--engine.ListAddString("CH1MM11",false);
engine.ListAddString("CH1MM21",false);
engine.ListAddString("CH1CM23",false);
engine.ListAddString("CH1CM24",false);
engine.ListAddString("CH1CM25",false);
engine.ListAddString("CH1CM26",false);
engine.ListAddString("CH1CM27",false);
engine.ListAddString("CH1CM28",false);
engine.ListAddString("CH1CM29",false);
engine.ListAddString("CH1AM25",false);
engine.ListAddString("CH1AM26",false);
engine.ListAddString("CH1AM27",false);
engine.ListAddString("CH1AM28",false);
engine.ListAddString("CH1AM29",false);
engine.ListAddString("CH1AM31",false);
engine.ListAddString("CH1AM32",false);
engine.ListAddString("CH1AM41",false);
engine.ListAddString("CH1AM42",false);
engine.ListAddString("CH1BM26",false);
engine.ListAddString("CH1BM27",false);
engine.ListAddString("CH1BM28",false);
engine.ListAddString("CH1BM29",false);
engine.ListAddString("CH1BM30",false);
engine.ListAddString("CH1BM32",false);
engine.ListAddString("CH1GM11",false);
engine.ListAddString("CH1GM12",false);
engine.ListAddString("CH1GM21",false);
engine.ListAddString("CH1GM22",false);
engine.ListAddString("CH1DM11",false);
engine.ListAddString("CH1DM13",false);
engine.ListAddString("CH1DM14",false);
engine.ListAddString("CH1DM15",false);
engine.ListAddString("CH1FM12",false);
engine.ListAddString("CH1FM13",false);
engine.ListAddString("CH1HM11",false);
--engine.ListAddString("CH1HM12",false);
--engine.ListAddString("CH1HM13",false);
engine.ListAddString("CH1JM11",false);
--年型车
engine.ListAddString("CH1MM41",false);
#INPUT  DString_C131_Car_Tpye
engine.CarType=DString_C131_Car_Tpye;
engine.SetLineText(3,DString_C131_Car_Tpye);
engine.println("手动选择车型:"..DString_C131_Car_Tpye);
engine.SelectLayout(0);
</Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="提示扫码">
<Rect left="351" top="151" right="451" bottom="183"/>
<Line1Text Enable="1" Text="扫描VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#INPUT engine.ResultVid
#INPUT engine.VIN
--DString_Write_VIN=string.upper(engine.ResultVid)
DString_Write_VIN=string.upper(engine.VIN)
engine.SetLineText(3,DString_Write_VIN);
engine.SetRButtonText("");
engine.SelectLayout(0);
engine.ShowMessage();
engine.Speak("完成");
engine.println("扫码完成，提示音");
if(#DString_Write_VIN&gt;=8)then
   engine.KNR = string.sub(DString_Write_VIN,string.len(DString_Write_VIN)-7);
else
engine.println("输入码不足");
end
engine.println("扫码:"..tostring(DString_Write_VIN));
engine.println("KNR:"..tostring(engine.KNR));

</Script></Activity>
<Activity id="10" ActivityType="3" flags="0" name="获取车辆数据">
<Rect left="351" top="204" right="451" bottom="236"/>
<Line1Text Enable="1" Text="获取车辆数据"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>DString_C131_Car_Tpye = string.sub(engine.VehiData,21,27)
engine.CarType=DString_C131_Car_Tpye;
if(engine.VehiData~="")then
   DString_Write_VIN=string.sub(engine.VehiData,81,97)
   engine.println("获取到车辆数据");
else
   engine.println("未获取到车辆数据")   
end

engine.SetLineText(3,DString_C131_Car_Tpye);
engine.println("VIN:"..tostring(DString_Write_VIN));
engine.println("车型:"..tostring(DString_C131_Car_Tpye));
engine.println("车辆数据:"..tostring(engine.VehiData));</Script></Activity>
<Activity id="20" ActivityType="4" flags="0" name="路由节点">
<Rect left="509" top="78" right="541" bottom="110"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="VIN码长度有误，重新扫描">
<Rect left="476" top="148" right="576" bottom="180"/>
<Line2Text Enable="1" Text="VIN码长度有误"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="提示扫码-备份">
<Rect left="922" top="43" right="1022" bottom="75"/>
<Line1Text Enable="1" Text="扫描VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#INPUT engine.ResultVid
--engine.ResultVid="LFPH4BCN2G1L02257"
DString_Write_VIN=string.upper(engine.ResultVid)
engine.SetLineText(3,DString_Write_VIN);
engine.ResultVid=DString_Write_VIN;    
engine.KNR = string.sub(DString_Write_VIN,10)

engine.println("扫码:"..tostring(DString_Write_VIN));
engine.println("KNR:"..tostring(engine.KNR));
engine.Speak("扫码完成")
engine.println("扫码完成，提示音")

</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="输入完整VIN">
<Rect left="479" top="254" right="579" bottom="286"/>
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
<Rect left="600" top="255" right="700" bottom="287"/>
<Line2Text Enable="1" Text="VIN码长度不足17位"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="重新扫描"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="26" ActivityType="4" flags="0" name="路由节点">
<Rect left="635" top="195" right="667" bottom="227"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="3" type="0">
</Transition>
<Transition StartId="2" EndId="1" type="0">
</Transition>
<Transition StartId="2" EndId="24" type="1">
<Expression>#DString_Write_VIN~=17</Expression></Transition>
<Transition StartId="3" EndId="22" type="0">
</Transition>
<Transition StartId="3" EndId="1" type="1">
<Expression>#DString_Write_VIN &gt;= 8</Expression></Transition>
<Transition StartId="10" EndId="1" type="0">
</Transition>
<Transition StartId="10" EndId="2" type="1">
<Expression>DString_C131_Car_Tpye=="" and string.len(DString_C131_Car_Tpye) ~= 7</Expression></Transition>
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
</Transitions>
</Process>

