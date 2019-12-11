<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_ECU_Type" type="8" dir="1" data=""/>
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
<Rect left="351" top="254" right="451" bottom="286"/>
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
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.ListClear();
engine.SelectLayout(1);
engine.ListAddString("DDCU(驾驶员侧车门)",false);
engine.ListAddString("PDCU(副驾驶侧车门)",false);
engine.ListAddString("RLDCU(左后车门)",false);
engine.ListAddString("RRDCU(右后车门)",false);
engine.ListAddString("SAS(转向角传感器)",false);
engine.ListAddString("ALS(大灯)",false);
engine.ListAddString("AC(空调)",false);
engine.ListAddString("BCM1(车身控制器1)",false);
engine.ListAddString("BCM2(车身控制器2)",false);
engine.ListAddString("PEPS(智能进入与启动控制单元)",false);
engine.ListAddString("GW",false);
engine.ListAddString("IC(仪表)",false);
engine.ListAddString("DCD",false);
engine.ListAddString("SDM(安全气囊)",false);
engine.ListAddString("DSCU(座椅)",false);
engine.ListAddString("PDC(驻车雷达控制单元)",false);
engine.ListAddString("EMS(发动机)",false);
engine.ListAddString("AT(变速箱)",false);
engine.ListAddString("ESP(车身电子稳定系统)",false);
engine.ListAddString("EPS(电子助力转向)",false);
engine.ListAddString("PLGM(行李箱)",false);
engine.ListAddString("BSD(并线辅助)",false);
engine.ListAddString("SCM(转向柱)",false);
engine.ListAddString("4WD(四驱)",false);
engine.ListAddString("ACP_F(前中控开关)",false);
engine.ListAddString("ACP_R(后中控开关)",false);
engine.ListAddString("IVI(车载娱乐)",false);
engine.ListAddString("TBOX(车联网系统)",false);
engine.ListAddString("AVM(全景可视)",false);
engine.ListAddString("ADV(自动驾驶)",false);
engine.ListAddString("DVR(行车记录仪)",false);
engine.ListAddString("ACM(电子执行器)",false);
engine.ListAddString("EGSM(电子换挡器)",false);
engine.ListAddString("Airsuspension(空气悬架)",false);
engine.ListAddString("DMSCU(驾驶模式选择)",false);
engine.ListAddString("IFC(智能前摄像头)",false);

#INPUT  DString_ECU_Type
--engine.CarType=DString_C131_Car_Tpye;
engine.SetLineText(3,DString_ECU_Type);
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

