<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_C131_ECU_Type" type="8" dir="1" data=""/>
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
<Rect left="350" top="244" right="450" bottom="276"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="选择控制器">
<Rect left="350" top="144" right="450" bottom="176"/>
<Line1Text Enable="1" Text="选择控制器"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
engine.ListAddString("AC(空调)",false);
engine.ListAddString("DVD(娱乐系统)",false);
engine.ListAddString("DSCU(座椅系统)",false);
engine.ListAddString("PDC(倒车雷达)",false);
engine.ListAddString("ACC(定速巡航)",false);
engine.ListAddString("AFS(大灯)",false);
engine.ListAddString("LDW(前视)",false);
engine.ListAddString("BCM1(车身控制器1)",false);
engine.ListAddString("BCM2(车身控制器2)",false);
engine.ListAddString("EMS(发动机检测)",false);
engine.ListAddString("ARMREST(后中扶手)",false);
engine.ListAddString("AT(自动变速器)",false);
engine.ListAddString("IC(组合仪表板)",false);
engine.ListAddString("DCT(双离合变速器)",false);
engine.ListAddString("DDCU(司机门)",false);
engine.ListAddString("EHPS(电子助力转向)",false);
engine.ListAddString("ESP(车辆电子稳定系统)",false);
engine.ListAddString("GW(网关)19年型",false);
engine.ListAddString("PDCU(乘客门)",false);
engine.ListAddString("RLDCU(左后门)",false);
engine.ListAddString("RRDCU(右后门)",false);
engine.ListAddString("EPB(电子驻车)",false);
engine.ListAddString("SAS(转角传感器)",false);
engine.ListAddString("SDM(安全气囊)",false);
engine.ListAddString("PLGM(电动尾门)",false);
engine.ListAddString("SCM(电子助力转向)",false);
engine.ListAddString("PEPS(智能进入系统)",false);
engine.ListAddString("GW老车型",false);
engine.ListAddString("4WD(四驱系统)",false);
engine.ListAddString("MCU(电机控制系统)",false);
engine.ListAddString("CHG(充电系统)",false);
engine.ListAddString("OLP(油泵系统)",false);
engine.ListAddString("BMS(电池管理系统)",false);
engine.ListAddString("DCDC(DC/DC控制器)",false);
engine.ListAddString("HCU(混动控制系统)",false);
engine.ListAddString("BSD(BSD控制系统)",false);
engine.ListAddString("TBOX(TBOX)",false);
engine.ListAddString("EMS20",false);


#INPUT  DString_C131_ECU_Type
--engine.CarType=DString_C131_Car_Tpye;
engine.SetLineText(3,DString_C131_ECU_Type);
--engine.println("车型:"..DString_C131_Car_Tpye);
engine.SelectLayout(0);
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="2" type="0">
</Transition>
<Transition StartId="2" EndId="1" type="0">
</Transition>
</Transitions>
</Process>

