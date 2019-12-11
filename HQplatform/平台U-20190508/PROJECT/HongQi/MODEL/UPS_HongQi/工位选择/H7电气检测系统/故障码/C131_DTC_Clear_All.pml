<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1301" pbltext="DEP1049">
<Parameters>
<Variable id="EMS00_partnumber" type="8" dir="0" data="EMS00_partnumber"/>
<Variable id="AT000_partnumber" type="8" dir="0" data="AT000_partnumber"/>
<Variable id="DCT00_partnumber" type="8" dir="0" data="DCT00_partnumber"/>
<Variable id="AC000_partnumber" type="8" dir="0" data="AC000_partnumber"/>
<Variable id="EPB00_partnumber" type="8" dir="0" data="EPB00_partnumber"/>
<Variable id="SAS00_partnumber" type="8" dir="0" data="SAS00_partnumber"/>
<Variable id="EHPS0_partnumber" type="8" dir="0" data="EHPS0_partnumber"/>
<Variable id="ESP00_partnumber" type="8" dir="0" data="ESP00_partnumber"/>
<Variable id="AFS00_partnumber" type="8" dir="0" data="AFS00_partnumber"/>
<Variable id="AB000_partnumber" type="8" dir="0" data="AB000_partnumber"/>
<Variable id="LDW00_partnumber" type="8" dir="0" data="LDW00_partnumber"/>
<Variable id="ACC00_partnumber" type="8" dir="0" data="ACC00_partnumber"/>
<Variable id="BCM10_partnumber" type="8" dir="0" data="BCM10_partnumber"/>
<Variable id="IC000_partnumber" type="8" dir="0" data="IC000_partnumber"/>
<Variable id="BCM20_partnumber" type="8" dir="0" data="BCM20_partnumber"/>
<Variable id="RMArm_partnumber" type="8" dir="0" data="RMArm_partnumber"/>
<Variable id="PEPS0_partnumber" type="8" dir="0" data="PEPS0_partnumber"/>
<Variable id="PDC00_partnumber" type="8" dir="0" data="PDC00_partnumber"/>
<Variable id="GW000_partnumber" type="8" dir="0" data="GW000_partnumber"/>
<Variable id="DDCU0_partnumber" type="8" dir="0" data="DDCU0_partnumber"/>
<Variable id="PDCU0_partnumber" type="8" dir="0" data="PDCU0_partnumber"/>
<Variable id="RLDCU_partnumber" type="8" dir="0" data="RLDCU_partnumber"/>
<Variable id="RRDCU_partnumber" type="8" dir="0" data="RRDCU_partnumber"/>
<Variable id="DSCU0_partnumber" type="8" dir="0" data="DSCU0_partnumber"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="PLGM0_partnumber" type="8" dir="0" data="PLGM0_partnumber"/>
<Variable id="SCM00_partnumber" type="8" dir="0" data="SCM00_partnumber"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="DString_C131_Model_Name" type="8" dir="0" data="DString_C131_Model_Name"/>
<Variable id="HCU00_partnumber" type="8" dir="0" data=""/>
<Variable id="MCU00_partnumber" type="8" dir="0" data=""/>
<Variable id="BSD00_partnumber" type="8" dir="0" data=""/>
<Variable id="FWD00_partnumber" type="8" dir="0" data=""/>
<Variable id="BMS00_partnumber" type="8" dir="0" data=""/>
<Variable id="DCDC0_partnumber" type="8" dir="0" data=""/>
<Variable id="Oilpump_partnumber" type="8" dir="0" data=""/>
<Variable id="Charger_partnumber" type="8" dir="0" data=""/>
<Variable id="TBOX0_partnumber" type="8" dir="0" data="TBOX0_partnumber"/>
<Variable id="DVD00_partnumber" type="8" dir="0" data="DVD00_partnumber"/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="110" top="44" right="210" bottom="76"/>
<Script>engine.println("PLGM0_partnumber="..PLGM0_partnumber)
engine.println("GW000_partnumber="..GW000_partnumber)
engine.println("AFS00_partnumber="..AFS00_partnumber)
engine.println("HCU00_partnumber="..HCU00_partnumber)
engine.println("BCM10_partnumber="..BCM10_partnumber)
engine.println("BCM20_partnumber="..BCM20_partnumber)
engine.println("DSCU0_partnumber="..DSCU0_partnumber)
engine.println("HCU00_partnumber="..HCU00_partnumber)
engine.println("MCU00_partnumber="..MCU00_partnumber)
engine.println("BSD00_partnumber="..BSD00_partnumber)
engine.println("FWD00_partnumber="..FWD00_partnumber)
engine.println("BMS00_partnumber="..BMS00_partnumber)
engine.println("Charger_partnumber="..Charger_partnumber)
engine.println("Oilpump_partnumber="..Oilpump_partnumber)
engine.println("DCDC0_partnumber="..DCDC0_partnumber)
engine.println("REP-VMTLOC"..VMTLOC)
</Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="11950" top="464" right="12050" bottom="496"/>
<Script></Script></End>
<Activities>
<Activity id="35" ActivityType="3" flags="0" name="GW">
<Rect left="110" top="164" right="210" bottom="196"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Script>engine.println("VMTLOC:"..VMTLOC);</Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="切诊断">
<Rect left="110" top="404" right="210" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="清除DTC">
<Rect left="110" top="464" right="210" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="2" name="DEP20" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="结束清空">
<Rect left="270" top="464" right="370" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="46" ActivityType="3" flags="0" name="PEPS">
<Rect left="430" top="164" right="530" bottom="196"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="清除DTC">
<Rect left="430" top="464" right="530" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="切诊断">
<Rect left="430" top="404" right="530" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="结束清空">
<Rect left="590" top="464" right="690" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="104" right="176" bottom="136"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="104" right="496" bottom="136"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="ACC">
<Rect left="750" top="164" right="850" bottom="196"/>
<TitleText Enable="1" Text="定速巡航 (ACC)"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="切诊断">
<Rect left="750" top="404" right="850" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="结束清空">
<Rect left="910" top="464" right="1010" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="切诊断">
<Rect left="1070" top="404" right="1170" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="DDCU">
<Rect left="1070" top="164" right="1170" bottom="196"/>
<TitleText Enable="1" Text="司机门控制器 （DDCU）"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="结束清空">
<Rect left="1230" top="464" right="1330" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="104" right="816" bottom="136"/>
</Activity>
<Activity id="75" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="104" right="1136" bottom="136"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="104" right="1456" bottom="136"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="切诊断">
<Rect left="1390" top="404" right="1490" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="PDCU">
<Rect left="1390" top="164" right="1490" bottom="196"/>
<TitleText Enable="1" Text="乘客门检测(PDCU)"/>
<Script></Script></Activity>
<Activity id="84" ActivityType="4" flags="0" name="路由节点">
<Rect left="2064" top="104" right="2096" bottom="136"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="结束清空">
<Rect left="1550" top="464" right="1650" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="104" right="1776" bottom="136"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="切诊断">
<Rect left="1710" top="404" right="1810" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="RLDCU">
<Rect left="1710" top="164" right="1810" bottom="196"/>
<TitleText Enable="1" Text="左后门 (RLDCU)"/>
<Script></Script></Activity>
<Activity id="94" ActivityType="3" flags="0" name="结束清空">
<Rect left="1870" top="464" right="1970" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="2384" top="104" right="2416" bottom="136"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="RRDCU">
<Rect left="2030" top="164" right="2130" bottom="196"/>
<TitleText Enable="1" Text="右后门控制器 （RRDCU）"/>
<Script></Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="切诊断">
<Rect left="2030" top="404" right="2130" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="结束清空">
<Rect left="2190" top="464" right="2290" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="105" ActivityType="4" flags="0" name="路由节点">
<Rect left="2704" top="104" right="2736" bottom="136"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="SAS">
<Rect left="2350" top="164" right="2450" bottom="196"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script></Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="切诊断">
<Rect left="2350" top="404" right="2450" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="结束清空">
<Rect left="2510" top="464" right="2610" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="AFS">
<Rect left="2670" top="164" right="2770" bottom="196"/>
<TitleText Enable="1" Text="大灯 (AFS)"/>
<Script></Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="切诊断">
<Rect left="2670" top="404" right="2770" bottom="436"/>
<Strategy TotalTime="0" NokTime="0"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="结束清空">
<Rect left="2830" top="464" right="2930" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="3024" top="104" right="3056" bottom="136"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="BCM1">
<Rect left="2990" top="164" right="3090" bottom="196"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="切诊断">
<Rect left="2990" top="404" right="3090" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="结束清空">
<Rect left="3150" top="464" right="3250" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="104" right="3376" bottom="136"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="IC">
<Rect left="3630" top="164" right="3730" bottom="196"/>
<TitleText Enable="1" Text="组合仪表板 (IC)"/>
<Script></Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="切诊断">
<Rect left="3630" top="404" right="3730" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="137" ActivityType="3" flags="0" name="结束清空">
<Rect left="3790" top="464" right="3890" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="139" ActivityType="4" flags="0" name="路由节点">
<Rect left="3664" top="104" right="3696" bottom="136"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="AirBag">
<Rect left="3950" top="164" right="4050" bottom="196"/>
<TitleText Enable="1" Text="安全气囊 (AirBag)"/>
<Script></Script></Activity>
<Activity id="143" ActivityType="3" flags="0" name="切诊断">
<Rect left="3950" top="404" right="4050" bottom="436"/>
<Script>engine.Delay(50)
#COMM 0x10 0x01</Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="结束清空">
<Rect left="4110" top="464" right="4210" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="3984" top="104" right="4016" bottom="136"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="切诊断">
<Rect left="3310" top="404" right="3410" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="151" ActivityType="3" flags="0" name="BCM2">
<Rect left="3310" top="164" right="3410" bottom="196"/>
<TitleText Enable="1" Text="车身控制器2（BCM2）"/>
<Script></Script></Activity>
<Activity id="156" ActivityType="3" flags="0" name="结束清空">
<Rect left="3470" top="464" right="3570" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="4304" top="104" right="4336" bottom="136"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="ARMREST">
<Rect left="4270" top="164" right="4370" bottom="196"/>
<TitleText Enable="1" Text="后中扶手 (ARMREST)"/>
<Script></Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="切诊断">
<Rect left="4270" top="404" right="4370" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="结束清空">
<Rect left="4430" top="464" right="4530" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="4944" top="104" right="4976" bottom="136"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="EPB">
<Rect left="4910" top="164" right="5010" bottom="196"/>
<TitleText Enable="1" Text="电子驻车(EPB)"/>
<Script></Script></Activity>
<Activity id="171" ActivityType="3" flags="0" name="切诊断">
<Rect left="4910" top="404" right="5010" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="175" ActivityType="3" flags="0" name="结束清空">
<Rect left="5070" top="464" right="5170" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="177" ActivityType="4" flags="0" name="路由节点">
<Rect left="5264" top="104" right="5296" bottom="136"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="LDW">
<Rect left="5230" top="164" right="5330" bottom="196"/>
<TitleText Enable="1" Text="前视(LDW)"/>
<Script></Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="切诊断">
<Rect left="5230" top="404" right="5330" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="183" ActivityType="3" flags="0" name="结束清空">
<Rect left="5390" top="464" right="5490" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="185" ActivityType="4" flags="0" name="路由节点">
<Rect left="5584" top="104" right="5616" bottom="136"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="EMS">
<Rect left="5550" top="164" right="5650" bottom="196"/>
<TitleText Enable="1" Text="发动机检测 (EMS)"/>
<Script></Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="切诊断">
<Rect left="5550" top="404" right="5650" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="192" ActivityType="3" flags="0" name="结束清空">
<Rect left="5710" top="464" right="5810" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="194" ActivityType="4" flags="0" name="路由节点">
<Rect left="5904" top="104" right="5936" bottom="136"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="AT">
<Rect left="5870" top="164" right="5970" bottom="196"/>
<TitleText Enable="1" Text="自动变速器 (AT)"/>
<Script></Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="切诊断">
<Rect left="5870" top="404" right="5970" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="结束清空">
<Rect left="6030" top="464" right="6130" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="6224" top="104" right="6256" bottom="136"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="DCT">
<Rect left="6190" top="164" right="6290" bottom="196"/>
<TitleText Enable="1" Text="双离合变速器（DCT）"/>
<Script></Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="切诊断">
<Rect left="6190" top="404" right="6290" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="结束清空">
<Rect left="6350" top="464" right="6450" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="ESP">
<Rect left="4590" top="164" right="4690" bottom="196"/>
<TitleText Enable="1" Text="车辆电子稳定系统 (ESP)"/>
<Script></Script></Activity>
<Activity id="217" ActivityType="3" flags="0" name="切诊断">
<Rect left="4590" top="404" right="4690" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="219" ActivityType="3" flags="0" name="结束清空">
<Rect left="4750" top="464" right="4850" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="6544" top="104" right="6576" bottom="136"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="EHPS">
<Rect left="6510" top="164" right="6610" bottom="196"/>
<TitleText Enable="1" Text="电子液压助力转向（EHPS）"/>
<Script></Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="切诊断">
<Rect left="6510" top="404" right="6610" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="227" ActivityType="3" flags="0" name="结束清空">
<Rect left="6670" top="464" right="6770" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="6864" top="104" right="6896" bottom="136"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="PLGM">
<Rect left="6830" top="164" right="6930" bottom="196"/>
<TitleText Enable="1" Text="电动尾门（电动尾门）"/>
<Script>engine.println("PLGM0_partnumber")</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="切诊断">
<Rect left="6830" top="404" right="6930" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="236" ActivityType="3" flags="0" name="结束清空">
<Rect left="6990" top="464" right="7090" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="7184" top="104" right="7216" bottom="136"/>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="PLGM通讯">
<Rect left="6830" top="44" right="6930" bottom="76"/>
<SubProcesses>
<SubProcess id="PLGM_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="PDC">
<Rect left="7470" top="164" right="7570" bottom="196"/>
<TitleText Enable="1" Text="倒车雷达 (PDC)"/>
<Script></Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="切诊断">
<Rect left="7470" top="404" right="7570" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="250" ActivityType="3" flags="0" name="结束清空">
<Rect left="7630" top="464" right="7730" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="7824" top="104" right="7856" bottom="136"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="8144" top="104" right="8176" bottom="136"/>
</Activity>
<Activity id="268" ActivityType="3" flags="0" name="结束清空">
<Rect left="11950" top="404" right="12050" bottom="436"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="280" ActivityType="5" flags="0" name="IC通讯">
<Rect left="3470" top="44" right="3570" bottom="76"/>
<SubProcesses>
<SubProcess id="IC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="282" ActivityType="5" flags="0" name="RMAR">
<Rect left="4270" top="44" right="4370" bottom="76"/>
<SubProcesses>
<SubProcess id="RMAR_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="283" ActivityType="5" flags="0" name="EPB">
<Rect left="4910" top="44" right="5010" bottom="76"/>
<SubProcesses>
<SubProcess id="EPB_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="284" ActivityType="5" flags="0" name="LDW通讯">
<Rect left="5230" top="44" right="5330" bottom="76"/>
<SubProcesses>
<SubProcess id="LDW_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="285" ActivityType="5" flags="0" name="EMS通讯">
<Rect left="5550" top="44" right="5650" bottom="76"/>
<SubProcesses>
<SubProcess id="EMS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="286" ActivityType="5" flags="0" name="AT通讯">
<Rect left="5870" top="44" right="5970" bottom="76"/>
<SubProcesses>
<SubProcess id="AT_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="287" ActivityType="5" flags="0" name="DCT通讯">
<Rect left="6190" top="44" right="6290" bottom="76"/>
<SubProcesses>
<SubProcess id="DCT_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="288" ActivityType="5" flags="0" name="ESP通讯">
<Rect left="4590" top="44" right="4690" bottom="76"/>
<SubProcesses>
<SubProcess id="ESP_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="289" ActivityType="5" flags="0" name="EHPS通讯">
<Rect left="6510" top="44" right="6610" bottom="76"/>
<SubProcesses>
<SubProcess id="EHPS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="290" ActivityType="3" flags="0" name="SCM">
<Rect left="7150" top="164" right="7250" bottom="196"/>
<TitleText Enable="1" Text="电子助力转向（SCM）"/>
<Script>engine.println("********SCM00_partnumber"..SCM00_partnumber)</Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="切诊断">
<Rect left="7150" top="404" right="7250" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="294" ActivityType="3" flags="0" name="结束清空">
<Rect left="7310" top="464" right="7410" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="298" ActivityType="4" flags="0" name="路由节点">
<Rect left="7504" top="104" right="7536" bottom="136"/>
</Activity>
<Activity id="299" ActivityType="5" flags="0" name="SCM通讯">
<Rect left="7150" top="44" right="7250" bottom="76"/>
<SubProcesses>
<SubProcess id="SCM_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="301" ActivityType="5" flags="0" name="PDC通讯">
<Rect left="7470" top="44" right="7570" bottom="76"/>
<SubProcesses>
<SubProcess id="PDC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="314" ActivityType="5" flags="0" name="SDM通讯">
<Rect left="3950" top="44" right="4050" bottom="76"/>
<SubProcesses>
<SubProcess id="SDM_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="316" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="344" right="370" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="1" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="317" ActivityType="3" flags="0" name="通讯失败">
<Rect left="590" top="344" right="690" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="3" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="318" ActivityType="3" flags="0" name="通讯失败">
<Rect left="910" top="344" right="1010" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="4" name="DEP102" type="8" flags="97"/>
</Activity>
<Activity id="319" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1230" top="344" right="1330" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="6" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="320" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1550" top="344" right="1650" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="8" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="321" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1870" top="344" right="1970" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="9" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="322" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2190" top="344" right="2290" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="10" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="323" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2510" top="344" right="2610" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="12" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="324" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2830" top="344" right="2930" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="14" name="DEP24" type="8" flags="97"/>
</Activity>
<Activity id="325" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3150" top="344" right="3250" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="17" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="326" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3470" top="344" right="3570" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="18" name="DEP56" type="8" flags="97"/>
</Activity>
<Activity id="327" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4110" top="344" right="4210" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="22" name="DEP69" type="8" flags="97"/>
</Activity>
<Activity id="328" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3790" top="344" right="3890" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="20" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="329" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4430" top="344" right="4530" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="23" name="DEP785" type="8" flags="97"/>
</Activity>
<Activity id="330" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5070" top="344" right="5170" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="25" name="DEP86" type="8" flags="97"/>
</Activity>
<Activity id="332" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5710" top="344" right="5810" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="27" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5390" top="344" right="5490" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="26" name="DEP13" type="8" flags="97"/>
</Activity>
<Activity id="334" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6030" top="344" right="6130" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="28" name="DEP32" type="8" flags="97"/>
</Activity>
<Activity id="335" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6350" top="344" right="6450" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="30" name="DEP151" type="8" flags="97"/>
</Activity>
<Activity id="336" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4750" top="344" right="4850" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="31" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="337" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6670" top="344" right="6770" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="33" name="DEP10" type="8" flags="97"/>
</Activity>
<Activity id="338" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6990" top="344" right="7090" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="34" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="339" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7310" top="344" right="7410" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="56" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="340" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7630" top="344" right="7730" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="36" name="DEP74" type="8" flags="97"/>
</Activity>
<Activity id="418" ActivityType="3" flags="0" name="DSCU">
<Rect left="7790" top="164" right="7890" bottom="196"/>
<TitleText Enable="1" Text="座椅系统 （DSCU）"/>
<Script></Script></Activity>
<Activity id="419" ActivityType="3" flags="0" name="切诊断">
<Rect left="7790" top="404" right="7890" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="421" ActivityType="3" flags="0" name="结束清空">
<Rect left="7950" top="464" right="8050" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="426" ActivityType="3" flags="0" name="切诊断">
<Rect left="8110" top="404" right="8210" bottom="436"/>
<Script>engine.Delay(50)
#COMM 0x10 0x01</Script></Activity>
<Activity id="429" ActivityType="3" flags="0" name="AC">
<Rect left="8110" top="164" right="8210" bottom="196"/>
<TitleText Enable="1" Text="空调（AC）"/>
<Script></Script></Activity>
<Activity id="430" ActivityType="3" flags="0" name="结束清空">
<Rect left="8270" top="464" right="8370" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="435" ActivityType="4" flags="0" name="路由节点">
<Rect left="8464" top="104" right="8496" bottom="136"/>
</Activity>
<Activity id="437" ActivityType="5" flags="0" name="AC通讯">
<Rect left="8110" top="44" right="8210" bottom="76"/>
<SubProcesses>
<SubProcess id="AC_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="446" ActivityType="3" flags="0" name="切诊断">
<Rect left="8430" top="404" right="8530" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="448" ActivityType="3" flags="0" name="结束清空">
<Rect left="8590" top="464" right="8690" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="451" ActivityType="5" flags="0" name="4WD通讯">
<Rect left="8430" top="44" right="8530" bottom="76"/>
<SubProcesses>
<SubProcess id="4WD_Comm">
<Parameters>
<Parameter id="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="452" ActivityType="3" flags="0" name="4WD">
<Rect left="8430" top="164" right="8530" bottom="196"/>
<TitleText Enable="1" Text="四驱系统（4WD）"/>
<Script></Script></Activity>
<Activity id="457" ActivityType="5" flags="0" name="DSCU通讯">
<Rect left="7790" top="44" right="7890" bottom="76"/>
<SubProcesses>
<SubProcess id="DSCU_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="458" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7950" top="344" right="8050" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="38" name="DEP158" type="8" flags="97"/>
</Activity>
<Activity id="459" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8270" top="344" right="8370" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="39" name="DEP27" type="8" flags="97"/>
</Activity>
<Activity id="460" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8590" top="344" right="8690" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="42" name="DEP792" type="8" flags="97"/>
</Activity>
<Activity id="462" ActivityType="3" flags="0" name="切诊断">
<Rect left="8750" top="404" right="8850" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="464" ActivityType="3" flags="0" name="结束清空">
<Rect left="8910" top="464" right="9010" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="466" ActivityType="4" flags="0" name="路由节点">
<Rect left="8784" top="104" right="8816" bottom="136"/>
</Activity>
<Activity id="467" ActivityType="5" flags="0" name="DCDC通讯">
<Rect left="8750" top="44" right="8850" bottom="76"/>
<SubProcesses>
<SubProcess id="DCDC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="469" ActivityType="3" flags="0" name="切诊断">
<Rect left="9070" top="404" right="9170" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="471" ActivityType="3" flags="0" name="结束清空">
<Rect left="9230" top="464" right="9330" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="473" ActivityType="4" flags="0" name="路由节点">
<Rect left="9104" top="104" right="9136" bottom="136"/>
</Activity>
<Activity id="474" ActivityType="5" flags="0" name="BMS通讯">
<Rect left="9070" top="44" right="9170" bottom="76"/>
<SubProcesses>
<SubProcess id="BMS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="475" ActivityType="5" flags="0" name="OilPump通讯">
<Rect left="9390" top="44" right="9490" bottom="76"/>
<SubProcesses>
<SubProcess id="OilPump_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="477" ActivityType="3" flags="0" name="切诊断">
<Rect left="9390" top="404" right="9490" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="479" ActivityType="3" flags="0" name="结束清空">
<Rect left="9550" top="464" right="9650" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="481" ActivityType="4" flags="0" name="路由节点">
<Rect left="9424" top="104" right="9456" bottom="136"/>
</Activity>
<Activity id="484" ActivityType="3" flags="0" name="切诊断">
<Rect left="9710" top="404" right="9810" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="486" ActivityType="3" flags="0" name="结束清空">
<Rect left="9870" top="464" right="9970" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="488" ActivityType="4" flags="0" name="路由节点">
<Rect left="9744" top="104" right="9776" bottom="136"/>
</Activity>
<Activity id="489" ActivityType="5" flags="0" name="Charger通讯">
<Rect left="10030" top="44" right="10130" bottom="76"/>
<SubProcesses>
<SubProcess id="Charger_Comm">
<Parameters>
<Parameter id="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="491" ActivityType="3" flags="0" name="切诊断">
<Rect left="10030" top="404" right="10130" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="493" ActivityType="3" flags="0" name="结束清空">
<Rect left="10190" top="464" right="10290" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="496" ActivityType="4" flags="0" name="路由节点">
<Rect left="10064" top="104" right="10096" bottom="136"/>
</Activity>
<Activity id="497" ActivityType="3" flags="0" name="切诊断">
<Rect left="10350" top="404" right="10450" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="500" ActivityType="3" flags="0" name="结束清空">
<Rect left="10510" top="464" right="10610" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="502" ActivityType="5" flags="0" name="MCU通讯">
<Rect left="10350" top="44" right="10450" bottom="76"/>
<SubProcesses>
<SubProcess id="MCU_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="503" ActivityType="4" flags="0" name="路由节点">
<Rect left="10384" top="104" right="10416" bottom="136"/>
</Activity>
<Activity id="504" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8910" top="344" right="9010" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="43" name="DEP848" type="8" flags="97"/>
</Activity>
<Activity id="505" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9230" top="344" right="9330" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="45" name="DEP837" type="8" flags="97"/>
</Activity>
<Activity id="506" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9550" top="344" right="9650" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="46" name="DEP826" type="8" flags="97"/>
</Activity>
<Activity id="507" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9870" top="344" right="9970" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="48" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="508" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10190" top="344" right="10290" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="50" name="DEP815" type="8" flags="97"/>
</Activity>
<Activity id="509" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10510" top="344" right="10610" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="51" name="DEP803" type="8" flags="97"/>
</Activity>
<Activity id="510" ActivityType="5" flags="0" name="HCU通讯">
<Rect left="9710" top="44" right="9810" bottom="76"/>
<SubProcesses>
<SubProcess id="HCU_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="517" ActivityType="3" flags="0" name="DCDC">
<Rect left="8750" top="164" right="8850" bottom="196"/>
<TitleText Enable="1" Text="DC/DC控制器"/>
<Script></Script></Activity>
<Activity id="518" ActivityType="3" flags="0" name="BMS">
<Rect left="9070" top="164" right="9170" bottom="196"/>
<TitleText Enable="1" Text="电池管理系统（BMS）"/>
<Script></Script></Activity>
<Activity id="520" ActivityType="3" flags="0" name="OilPump">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7B1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7D1" description="CANId"/>
</Variables>
<Rect left="9390" top="164" right="9490" bottom="196"/>
<TitleText Enable="1" Text="油泵系统（OilPump）"/>
<Script></Script></Activity>
<Activity id="522" ActivityType="3" flags="0" name="HCU">
<Rect left="9710" top="164" right="9810" bottom="196"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Script></Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="Charger">
<Rect left="10030" top="164" right="10130" bottom="196"/>
<TitleText Enable="1" Text="充电控制系统（Charger）"/>
<Script></Script></Activity>
<Activity id="525" ActivityType="3" flags="0" name="MCU">
<Rect left="10350" top="164" right="10450" bottom="196"/>
<TitleText Enable="1" Text="电机控制系统（MCU）"/>
<Script></Script></Activity>
<Activity id="526" ActivityType="4" flags="0" name="路由节点">
<Rect left="10704" top="104" right="10736" bottom="136"/>
</Activity>
<Activity id="527" ActivityType="3" flags="0" name="切诊断">
<Rect left="10670" top="404" right="10770" bottom="436"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="530" ActivityType="3" flags="0" name="结束清空">
<Rect left="10830" top="464" right="10930" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="533" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10830" top="344" right="10930" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="53" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="534" ActivityType="3" flags="0" name="BSD">
<Rect left="10670" top="164" right="10770" bottom="196"/>
<TitleText Enable="1" Text="盲区探测系统（BSD）"/>
<Script></Script></Activity>
<Activity id="535" ActivityType="5" flags="0" name="BSD通讯">
<Rect left="10670" top="44" right="10770" bottom="76"/>
<SubProcesses>
<SubProcess id="BSD_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="537" ActivityType="4" flags="0" name="路由节点">
<Rect left="11184" top="104" right="11216" bottom="136"/>
</Activity>
<Activity id="721" ActivityType="3" flags="0" name="清除DTC">
<Rect left="750" top="464" right="850" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="7" name="DEP103" type="8" flags="97"/>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="清除DTC">
<Rect left="1070" top="464" right="1170" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="11" name="DEP109" type="8" flags="97"/>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="清除DTC">
<Rect left="1390" top="464" right="1490" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="13" name="DEP115" type="8" flags="97"/>
</Activity>
<Activity id="724" ActivityType="3" flags="0" name="清除DTC">
<Rect left="1710" top="464" right="1810" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP121" type="8" flags="97"/>
</Activity>
<Activity id="725" ActivityType="3" flags="0" name="清除DTC">
<Rect left="2030" top="464" right="2130" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP127" type="8" flags="97"/>
</Activity>
<Activity id="726" ActivityType="3" flags="0" name="清除DTC">
<Rect left="2350" top="464" right="2450" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP81" type="8" flags="97"/>
</Activity>
<Activity id="727" ActivityType="3" flags="0" name="清除DTC">
<Rect left="2670" top="464" right="2770" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP2" type="8" flags="97"/>
</Activity>
<Activity id="728" ActivityType="3" flags="0" name="清除DTC">
<Rect left="2990" top="464" right="3090" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP43" type="8" flags="97"/>
</Activity>
<Activity id="729" ActivityType="3" flags="0" name="清除DTC">
<Rect left="3310" top="464" right="3410" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP57" type="8" flags="97"/>
</Activity>
<Activity id="730" ActivityType="3" flags="0" name="清除DTC">
<Rect left="3630" top="464" right="3730" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="32" name="DEP38" type="8" flags="97"/>
</Activity>
<Activity id="731" ActivityType="3" flags="0" name="清除DTC">
<Rect left="4270" top="464" right="4370" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="37" name="DEP138" type="8" flags="97"/>
</Activity>
<Activity id="732" ActivityType="3" flags="0" name="清除DTC">
<Rect left="4910" top="464" right="5010" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="40" name="DEP87" type="8" flags="97"/>
</Activity>
<Activity id="733" ActivityType="3" flags="0" name="清除DTC">
<Rect left="5230" top="464" right="5330" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="41" name="DEP14" type="8" flags="97"/>
</Activity>
<Activity id="734" ActivityType="3" flags="0" name="清除DTC">
<Rect left="5550" top="464" right="5650" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="44" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="735" ActivityType="3" flags="0" name="清除DTC">
<Rect left="5870" top="464" right="5970" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="47" name="DEP33" type="8" flags="97"/>
</Activity>
<Activity id="736" ActivityType="3" flags="0" name="清除DTC">
<Rect left="6190" top="464" right="6290" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="49" name="DEP152" type="8" flags="97"/>
</Activity>
<Activity id="737" ActivityType="3" flags="0" name="清除DTC">
<Rect left="4590" top="464" right="4690" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="52" name="DEP1050" type="8" flags="97"/>
</Activity>
<Activity id="738" ActivityType="3" flags="0" name="清除DTC">
<Rect left="6510" top="464" right="6610" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="54" name="DEP5" type="8" flags="97"/>
</Activity>
<Activity id="739" ActivityType="3" flags="0" name="清除DTC">
<Rect left="6830" top="464" right="6930" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="55" name="DEP201" type="8" flags="97"/>
</Activity>
<Activity id="740" ActivityType="3" flags="0" name="清除DTC">
<Rect left="7470" top="464" right="7570" bottom="496"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
if(@0==0x54)then
  engine.LastError = 0;
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="58" name="DEP75" type="8" flags="97"/>
</Activity>
<Activity id="741" ActivityType="3" flags="0" name="清除DTC">
<Rect left="7790" top="464" right="7890" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="59" name="DEP159" type="8" flags="97"/>
</Activity>
<Activity id="742" ActivityType="3" flags="0" name="清除DTC">
<Rect left="8110" top="464" right="8210" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>engine.Delay(50)
#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="60" name="DEP28" type="8" flags="97"/>
</Activity>
<Activity id="744" ActivityType="3" flags="0" name="清除DTC">
<Rect left="8430" top="464" right="8530" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="61" name="DEP793" type="8" flags="97"/>
</Activity>
<Activity id="745" ActivityType="3" flags="0" name="清除DTC">
<Rect left="8750" top="464" right="8850" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="62" name="DEP849" type="8" flags="97"/>
</Activity>
<Activity id="746" ActivityType="3" flags="0" name="清除DTC">
<Rect left="9070" top="464" right="9170" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="63" name="DEP838" type="8" flags="97"/>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="清除DTC">
<Rect left="9390" top="464" right="9490" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="64" name="DEP827" type="8" flags="97"/>
</Activity>
<Activity id="748" ActivityType="3" flags="0" name="清除DTC">
<Rect left="9710" top="464" right="9810" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="65" name="DEP860" type="8" flags="97"/>
</Activity>
<Activity id="749" ActivityType="3" flags="0" name="清除DTC">
<Rect left="10030" top="464" right="10130" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="66" name="DEP816" type="8" flags="97"/>
</Activity>
<Activity id="750" ActivityType="3" flags="0" name="清除DTC">
<Rect left="10350" top="464" right="10450" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="67" name="DEP804" type="8" flags="97"/>
</Activity>
<Activity id="751" ActivityType="3" flags="0" name="清除DTC">
<Rect left="10670" top="464" right="10770" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="68" name="DEP871" type="8" flags="97"/>
</Activity>
<Activity id="752" ActivityType="3" flags="0" name="清除DTC">
<Rect left="3950" top="464" right="4050" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>engine.Delay(50)
#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="35" name="DEP70" type="8" flags="97"/>
</Activity>
<Activity id="753" ActivityType="3" flags="0" name="清除DTC">
<Rect left="7150" top="464" right="7250" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="57" name="DEP207" type="8" flags="97"/>
</Activity>
<Activity id="754" ActivityType="3" flags="0" name="切诊断">
<Rect left="11150" top="404" right="11250" bottom="436"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Script>#COMM 0x10 0x01
if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end</Script></Activity>
<Activity id="755" ActivityType="3" flags="0" name="结束清空">
<Rect left="11310" top="464" right="11410" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="756" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11310" top="344" right="11410" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="77" name="DEP1187" type="8" flags="97"/>
</Activity>
<Activity id="757" ActivityType="3" flags="0" name="TBOX">
<Rect left="11150" top="164" right="11250" bottom="196"/>
<TitleText Enable="1" Text="TBOX(TBOX)"/>
<Script></Script></Activity>
<Activity id="759" ActivityType="3" flags="0" name="清除DTC">
<Rect left="11150" top="464" right="11250" bottom="496"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
if(@0 == 0x54)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="69" name="DEP1189" type="8" flags="97"/>
</Activity>
<Activity id="760" ActivityType="4" flags="0" name="路由节点">
<Rect left="11984" top="104" right="12016" bottom="136"/>
</Activity>
<Activity id="761" ActivityType="5" flags="0" name="TBOX通讯">
<Rect left="11150" top="44" right="11250" bottom="76"/>
<SubProcesses>
<SubProcess id="TBOX_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="762" ActivityType="4" flags="0" name="路由节点">
<Rect left="4624" top="104" right="4656" bottom="136"/>
</Activity>
<Activity id="763" ActivityType="5" flags="0" name="DVD_Comm">
<Rect left="11630" top="44" right="11730" bottom="76"/>
<SubProcesses>
<SubProcess id="DVD_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="764" ActivityType="3" flags="0" name="切诊断">
<Rect left="11630" top="404" right="11730" bottom="436"/>
<Script>#COMM 0x10 0x01
if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end</Script></Activity>
<Activity id="765" ActivityType="3" flags="0" name="结束清空">
<Rect left="11790" top="464" right="11890" bottom="496"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="766" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11790" top="344" right="11890" bottom="376"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="78" name="DEP1275" type="8" flags="97"/>
</Activity>
<Activity id="767" ActivityType="3" flags="0" name="DVD">
<Rect left="11630" top="164" right="11730" bottom="196"/>
<TitleText Enable="1" Text="娱乐系统（DVD）"/>
<Script></Script></Activity>
<Activity id="768" ActivityType="3" flags="0" name="清除DTC">
<Rect left="11630" top="464" right="11730" bottom="496"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
if(@0 == 0x54)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="79" name="DEP1261" type="8" flags="97"/>
</Activity>
<Activity id="770" ActivityType="4" flags="0" name="路由节点">
<Rect left="11664" top="104" right="11696" bottom="136"/>
</Activity>
<Activity id="772" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7F0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7F1" description="CANId"/>
</Variables>
<Rect left="110" top="224" right="210" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="773" ActivityType="3" flags="0" name="通讯">
<Rect left="110" top="284" right="210" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="774" ActivityType="3" flags="0" name="通讯失败">
<Rect left="270" top="284" right="370" bottom="316"/>
<Line1Text Enable="1" Text="GATEWAY 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="775" ActivityType="3" flags="0" name="结束通讯">
<Rect left="270" top="224" right="370" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="776" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="344" right="176" bottom="376"/>
</Activity>
<Activity id="778" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
</Variables>
<Rect left="430" top="224" right="530" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="779" ActivityType="3" flags="0" name="通讯">
<Rect left="430" top="284" right="530" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="780" ActivityType="3" flags="0" name="通讯失败">
<Rect left="590" top="284" right="690" bottom="316"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="781" ActivityType="3" flags="0" name="结束通讯">
<Rect left="590" top="224" right="690" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="782" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="344" right="496" bottom="376"/>
</Activity>
<Activity id="789" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x729" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72F" description="CANId"/>
</Variables>
<Rect left="750" top="224" right="850" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="790" ActivityType="3" flags="0" name="通讯">
<Rect left="750" top="284" right="850" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="791" ActivityType="3" flags="0" name="通讯失败">
<Rect left="910" top="284" right="1010" bottom="316"/>
<Line1Text Enable="1" Text="ACC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="792" ActivityType="3" flags="0" name="结束通讯">
<Rect left="910" top="224" right="1010" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="793" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="344" right="816" bottom="376"/>
</Activity>
<Activity id="794" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x759" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x779" description="CANId"/>
</Variables>
<Rect left="1070" top="224" right="1170" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="795" ActivityType="3" flags="0" name="通讯">
<Rect left="1070" top="284" right="1170" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="796" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1230" top="284" right="1330" bottom="316"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="797" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1230" top="224" right="1330" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="798" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="344" right="1136" bottom="376"/>
</Activity>
<Activity id="800" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75A" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77A" description="CANId"/>
</Variables>
<Rect left="1390" top="224" right="1490" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="801" ActivityType="3" flags="0" name="通讯">
<Rect left="1390" top="284" right="1490" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="802" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1550" top="284" right="1650" bottom="316"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="803" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1550" top="224" right="1650" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="804" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="344" right="1456" bottom="376"/>
</Activity>
<Activity id="805" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75B" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77B" description="CANId"/>
</Variables>
<Rect left="1710" top="224" right="1810" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="806" ActivityType="3" flags="0" name="通讯">
<Rect left="1710" top="284" right="1810" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="807" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1870" top="284" right="1970" bottom="316"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="808" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1870" top="224" right="1970" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="809" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="344" right="1776" bottom="376"/>
</Activity>
<Activity id="810" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75C" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77C" description="CANId"/>
</Variables>
<Rect left="2030" top="224" right="2130" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="811" ActivityType="3" flags="0" name="通讯">
<Rect left="2030" top="284" right="2130" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="812" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2190" top="284" right="2290" bottom="316"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="813" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2190" top="224" right="2290" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="814" ActivityType="4" flags="0" name="路由节点">
<Rect left="2064" top="344" right="2096" bottom="376"/>
</Activity>
<Activity id="815" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C0" description="CANId"/>
</Variables>
<Rect left="2350" top="224" right="2450" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="816" ActivityType="3" flags="0" name="通讯">
<Rect left="2350" top="284" right="2450" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="817" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2510" top="284" right="2610" bottom="316"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="818" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2510" top="224" right="2610" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="819" ActivityType="4" flags="0" name="路由节点">
<Rect left="2384" top="344" right="2416" bottom="376"/>
</Activity>
<Activity id="820" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x79F" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7BF" description="CANId"/>
</Variables>
<Rect left="2670" top="224" right="2770" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="821" ActivityType="3" flags="0" name="通讯">
<Rect left="2670" top="284" right="2770" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="822" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2830" top="284" right="2930" bottom="316"/>
<Line1Text Enable="1" Text="AFS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="823" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2830" top="224" right="2930" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="824" ActivityType="4" flags="0" name="路由节点">
<Rect left="2704" top="344" right="2736" bottom="376"/>
</Activity>
<Activity id="825" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75E" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77E" description="CANId"/>
</Variables>
<Rect left="2990" top="224" right="3090" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="826" ActivityType="3" flags="0" name="通讯">
<Rect left="2990" top="284" right="3090" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="827" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3150" top="284" right="3250" bottom="316"/>
<Line1Text Enable="1" Text="BCM1 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="828" ActivityType="3" flags="0" name="结束通讯">
<Rect left="3150" top="224" right="3250" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="829" ActivityType="4" flags="0" name="路由节点">
<Rect left="3024" top="344" right="3056" bottom="376"/>
</Activity>
<Activity id="830" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x75D" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x77D" description="CANId"/>
</Variables>
<Rect left="3310" top="224" right="3410" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="831" ActivityType="3" flags="0" name="通讯">
<Rect left="3310" top="284" right="3410" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="832" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3470" top="284" right="3570" bottom="316"/>
<Line1Text Enable="1" Text="BCM2 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="833" ActivityType="3" flags="0" name="结束通讯">
<Rect left="3470" top="224" right="3570" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="834" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="344" right="3376" bottom="376"/>
</Activity>
<Activity id="835" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x728" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x738" description="CANId"/>
</Variables>
<Rect left="3630" top="224" right="3730" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="836" ActivityType="3" flags="0" name="通讯">
<Rect left="3630" top="284" right="3730" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="837" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3790" top="284" right="3890" bottom="316"/>
<Line1Text Enable="1" Text="IC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="838" ActivityType="3" flags="0" name="结束通讯">
<Rect left="3790" top="224" right="3890" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="839" ActivityType="4" flags="0" name="路由节点">
<Rect left="3664" top="344" right="3696" bottom="376"/>
</Activity>
<Activity id="840" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A2" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C2" description="CANId"/>
</Variables>
<Rect left="3950" top="224" right="4050" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="841" ActivityType="3" flags="0" name="通讯">
<Rect left="3950" top="284" right="4050" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="842" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4110" top="284" right="4210" bottom="316"/>
<Line1Text Enable="1" Text="AIRBAG 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="843" ActivityType="3" flags="0" name="结束通讯">
<Rect left="4110" top="224" right="4210" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="844" ActivityType="4" flags="0" name="路由节点">
<Rect left="3984" top="344" right="4016" bottom="376"/>
</Activity>
<Activity id="845" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x761" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x781" description="CANId"/>
</Variables>
<Rect left="4270" top="224" right="4370" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="846" ActivityType="3" flags="0" name="通讯">
<Rect left="4270" top="284" right="4370" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="847" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4430" top="284" right="4530" bottom="316"/>
<Line1Text Enable="1" Text="ARMREST 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="848" ActivityType="3" flags="0" name="结束通讯">
<Rect left="4430" top="224" right="4530" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="849" ActivityType="4" flags="0" name="路由节点">
<Rect left="4304" top="344" right="4336" bottom="376"/>
</Activity>
<Activity id="850" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A4" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C4" description="CANId"/>
</Variables>
<Rect left="4590" top="224" right="4690" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="851" ActivityType="3" flags="0" name="通讯">
<Rect left="4590" top="284" right="4690" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="852" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4750" top="284" right="4850" bottom="316"/>
<Line1Text Enable="1" Text="ESP 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="853" ActivityType="3" flags="0" name="结束通讯">
<Rect left="4750" top="224" right="4850" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="854" ActivityType="4" flags="0" name="路由节点">
<Rect left="4624" top="344" right="4656" bottom="376"/>
</Activity>
<Activity id="855" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C3" description="CANId"/>
</Variables>
<Rect left="4910" top="224" right="5010" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="856" ActivityType="3" flags="0" name="通讯">
<Rect left="4910" top="284" right="5010" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="857" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5070" top="284" right="5170" bottom="316"/>
<Line1Text Enable="1" Text="EPB 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="858" ActivityType="3" flags="0" name="结束通讯">
<Rect left="5070" top="224" right="5170" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="859" ActivityType="4" flags="0" name="路由节点">
<Rect left="4944" top="344" right="4976" bottom="376"/>
</Activity>
<Activity id="860" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
</Variables>
<Rect left="5230" top="224" right="5330" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="861" ActivityType="3" flags="0" name="通讯">
<Rect left="5230" top="284" right="5330" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="862" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5390" top="284" right="5490" bottom="316"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="863" ActivityType="3" flags="0" name="结束通讯">
<Rect left="5390" top="224" right="5490" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="864" ActivityType="4" flags="0" name="路由节点">
<Rect left="5264" top="344" right="5296" bottom="376"/>
</Activity>
<Activity id="865" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
</Variables>
<Rect left="5550" top="224" right="5650" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="866" ActivityType="3" flags="0" name="通讯">
<Rect left="5550" top="284" right="5650" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5710" top="284" right="5810" bottom="316"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="868" ActivityType="3" flags="0" name="结束通讯">
<Rect left="5710" top="224" right="5810" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="869" ActivityType="4" flags="0" name="路由节点">
<Rect left="5584" top="344" right="5616" bottom="376"/>
</Activity>
<Activity id="870" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
</Variables>
<Rect left="5870" top="224" right="5970" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="871" ActivityType="3" flags="0" name="通讯">
<Rect left="5870" top="284" right="5970" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="872" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6030" top="284" right="6130" bottom="316"/>
<Line1Text Enable="1" Text="AT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="873" ActivityType="3" flags="0" name="结束通讯">
<Rect left="6030" top="224" right="6130" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="874" ActivityType="4" flags="0" name="路由节点">
<Rect left="5904" top="344" right="5936" bottom="376"/>
</Activity>
<Activity id="875" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
</Variables>
<Rect left="6190" top="224" right="6290" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="876" ActivityType="3" flags="0" name="通讯">
<Rect left="6190" top="284" right="6290" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="877" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6350" top="284" right="6450" bottom="316"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="878" ActivityType="3" flags="0" name="结束通讯">
<Rect left="6350" top="224" right="6450" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="879" ActivityType="4" flags="0" name="路由节点">
<Rect left="6224" top="344" right="6256" bottom="376"/>
</Activity>
<Activity id="880" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C1" description="CANId"/>
</Variables>
<Rect left="6510" top="224" right="6610" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="通讯">
<Rect left="6510" top="284" right="6610" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="882" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6670" top="284" right="6770" bottom="316"/>
<Line1Text Enable="1" Text="EHPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="883" ActivityType="3" flags="0" name="结束通讯">
<Rect left="6670" top="224" right="6770" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="884" ActivityType="4" flags="0" name="路由节点">
<Rect left="6544" top="344" right="6576" bottom="376"/>
</Activity>
<Activity id="885" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x773" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x793" description="CANId"/>
</Variables>
<Rect left="6830" top="224" right="6930" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="886" ActivityType="3" flags="0" name="通讯">
<Rect left="6830" top="284" right="6930" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="887" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6990" top="284" right="7090" bottom="316"/>
<Line1Text Enable="1" Text="PLGM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="888" ActivityType="3" flags="0" name="结束通讯">
<Rect left="6990" top="224" right="7090" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="889" ActivityType="4" flags="0" name="路由节点">
<Rect left="6864" top="344" right="6896" bottom="376"/>
</Activity>
<Activity id="890" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x76E" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x78E" description="CANId"/>
</Variables>
<Rect left="7150" top="224" right="7250" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="891" ActivityType="3" flags="0" name="通讯">
<Rect left="7150" top="284" right="7250" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="892" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7310" top="284" right="7410" bottom="316"/>
<Line1Text Enable="1" Text="SCM 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="893" ActivityType="3" flags="0" name="结束通讯">
<Rect left="7310" top="224" right="7410" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="894" ActivityType="4" flags="0" name="路由节点">
<Rect left="7184" top="344" right="7216" bottom="376"/>
</Activity>
<Activity id="895" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="P3Max" type="3" data="5000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x763" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x783" description="CANId"/>
</Variables>
<Rect left="7470" top="224" right="7570" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="896" ActivityType="3" flags="0" name="通讯">
<Rect left="7470" top="284" right="7570" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="897" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7630" top="284" right="7730" bottom="316"/>
<Line1Text Enable="1" Text="PDC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="898" ActivityType="3" flags="0" name="结束通讯">
<Rect left="7630" top="224" right="7730" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="899" ActivityType="4" flags="0" name="路由节点">
<Rect left="7504" top="344" right="7536" bottom="376"/>
</Activity>
<Activity id="900" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x760" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x780" description="CANId"/>
</Variables>
<Rect left="7790" top="224" right="7890" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="901" ActivityType="3" flags="0" name="通讯">
<Rect left="7790" top="284" right="7890" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="902" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7950" top="284" right="8050" bottom="316"/>
<Line1Text Enable="1" Text="DSCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="903" ActivityType="3" flags="0" name="结束通讯">
<Rect left="7950" top="224" right="8050" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="904" ActivityType="4" flags="0" name="路由节点">
<Rect left="7824" top="344" right="7856" bottom="376"/>
</Activity>
<Activity id="905" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x762" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x782" description="CANId"/>
</Variables>
<Rect left="8110" top="224" right="8210" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="906" ActivityType="3" flags="0" name="通讯">
<Rect left="8110" top="284" right="8210" bottom="316"/>
<Script>engine.Delay(50)
#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     CommErr=0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end
</Script></Activity>
<Activity id="907" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8270" top="284" right="8370" bottom="316"/>
<Line1Text Enable="1" Text="AC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="908" ActivityType="3" flags="0" name="结束通讯">
<Rect left="8270" top="224" right="8370" bottom="256"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="909" ActivityType="4" flags="0" name="路由节点">
<Rect left="8144" top="344" right="8176" bottom="376"/>
</Activity>
<Activity id="910" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A7" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C7" description="CANId"/>
</Variables>
<Rect left="8430" top="224" right="8530" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="911" ActivityType="3" flags="0" name="通讯">
<Rect left="8430" top="284" right="8530" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="912" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8590" top="284" right="8690" bottom="316"/>
<Line1Text Enable="1" Text="4WD 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="913" ActivityType="3" flags="0" name="结束通讯">
<Rect left="8590" top="224" right="8690" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="914" ActivityType="4" flags="0" name="路由节点">
<Rect left="8464" top="344" right="8496" bottom="376"/>
</Activity>
<Activity id="915" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AD" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7CD" description="CANId"/>
</Variables>
<Rect left="8750" top="224" right="8850" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="916" ActivityType="3" flags="0" name="通讯">
<Rect left="8750" top="284" right="8850" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="917" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8910" top="284" right="9010" bottom="316"/>
<Line1Text Enable="1" Text="DC\DC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="918" ActivityType="3" flags="0" name="结束通讯">
<Rect left="8910" top="224" right="9010" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="919" ActivityType="4" flags="0" name="路由节点">
<Rect left="8784" top="344" right="8816" bottom="376"/>
</Activity>
<Activity id="920" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AC" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7CC" description="CANId"/>
</Variables>
<Rect left="9070" top="224" right="9170" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="921" ActivityType="3" flags="0" name="通讯">
<Rect left="9070" top="284" right="9170" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="922" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9230" top="284" right="9330" bottom="316"/>
<Line1Text Enable="1" Text="BMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="923" ActivityType="3" flags="0" name="结束通讯">
<Rect left="9230" top="224" right="9330" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="924" ActivityType="4" flags="0" name="路由节点">
<Rect left="9104" top="344" right="9136" bottom="376"/>
</Activity>
<Activity id="925" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7B1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7D1" description="CANId"/>
</Variables>
<Rect left="9390" top="224" right="9490" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="926" ActivityType="3" flags="0" name="通讯">
<Rect left="9390" top="284" right="9490" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="927" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9550" top="284" right="9650" bottom="316"/>
<Line1Text Enable="1" Text="OilPump 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="928" ActivityType="3" flags="0" name="结束通讯">
<Rect left="9550" top="224" right="9650" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="929" ActivityType="4" flags="0" name="路由节点">
<Rect left="9424" top="344" right="9456" bottom="376"/>
</Activity>
<Activity id="930" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7E3" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7EB" description="CANId"/>
</Variables>
<Rect left="9710" top="224" right="9810" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="931" ActivityType="3" flags="0" name="通讯">
<Rect left="9710" top="284" right="9810" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="932" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9870" top="284" right="9970" bottom="316"/>
<Line1Text Enable="1" Text="HCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="933" ActivityType="3" flags="0" name="结束通讯">
<Rect left="9870" top="224" right="9970" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="934" ActivityType="4" flags="0" name="路由节点">
<Rect left="9744" top="344" right="9776" bottom="376"/>
</Activity>
<Activity id="935" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AE" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7CE" description="CANId"/>
</Variables>
<Rect left="10030" top="224" right="10130" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="936" ActivityType="3" flags="0" name="通讯">
<Rect left="10030" top="284" right="10130" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="937" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10190" top="284" right="10290" bottom="316"/>
<Line1Text Enable="1" Text="Charger 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="938" ActivityType="3" flags="0" name="结束通讯">
<Rect left="10190" top="224" right="10290" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="939" ActivityType="4" flags="0" name="路由节点">
<Rect left="10064" top="344" right="10096" bottom="376"/>
</Activity>
<Activity id="940" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7AA" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7CA" description="CANId"/>
</Variables>
<Rect left="10350" top="224" right="10450" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="941" ActivityType="3" flags="0" name="通讯">
<Rect left="10350" top="284" right="10450" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="942" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10510" top="284" right="10610" bottom="316"/>
<Line1Text Enable="1" Text="MCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="943" ActivityType="3" flags="0" name="结束通讯">
<Rect left="10510" top="224" right="10610" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="10384" top="344" right="10416" bottom="376"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x72B" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x731" description="CANId"/>
</Variables>
<Rect left="10670" top="224" right="10770" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="946" ActivityType="3" flags="0" name="通讯">
<Rect left="10670" top="284" right="10770" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="947" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10830" top="284" right="10930" bottom="316"/>
<Line1Text Enable="1" Text="BSD 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="948" ActivityType="3" flags="0" name="结束通讯">
<Rect left="10830" top="224" right="10930" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="949" ActivityType="4" flags="0" name="路由节点">
<Rect left="10704" top="344" right="10736" bottom="376"/>
</Activity>
<Activity id="950" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x774" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x794" description="CANId"/>
</Variables>
<Rect left="11150" top="224" right="11250" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="951" ActivityType="3" flags="0" name="通讯">
<Rect left="11150" top="284" right="11250" bottom="316"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="952" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11310" top="284" right="11410" bottom="316"/>
<Line1Text Enable="1" Text="TBOX 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="953" ActivityType="3" flags="0" name="结束通讯">
<Rect left="11310" top="224" right="11410" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="954" ActivityType="4" flags="0" name="路由节点">
<Rect left="11184" top="344" right="11216" bottom="376"/>
</Activity>
<Activity id="955" ActivityType="3" flags="0" name="连接ECU">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="接口号"/>
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
<Variable id="P3Max" type="3" data="5000" description="ECURes-&gt;TexterReq"/>
<Variable id="P4Min" type="3" data="5" description="TexterInterval"/>
<Variable id="P4Max" type="3" data="20" description="TexterInterval"/>
<Variable id="CAN_SND_ID" type="3" data="0x76F" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x78F" description="CANId"/>
</Variables>
<Rect left="11630" top="224" right="11730" bottom="256"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="956" ActivityType="3" flags="0" name="通讯">
<Rect left="11630" top="284" right="11730" bottom="316"/>
<Script>#COMM 0x22 0xf1 0x87
CommErr=0;
if(@0 == 0x62)then
     engine.LastError = 0;
     engine.TestResult = 0;
     CommErr = 0;
else
     engine.LastError = 1;
     engine.TestResult = 1;
     CommErr=1;
end</Script></Activity>
<Activity id="957" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11790" top="284" right="11890" bottom="316"/>
<Line1Text Enable="1" Text="DVD 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="958" ActivityType="3" flags="0" name="结束通讯">
<Rect left="11790" top="224" right="11890" bottom="256"/>
<Script>#STOPCOMM

</Script></Activity>
<Activity id="959" ActivityType="4" flags="0" name="路由节点">
<Rect left="11664" top="344" right="11696" bottom="376"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="56" type="0">
</Transition>
<Transition StartId="35" EndId="772" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="0">
</Transition>
<Transition StartId="38" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="58" type="0">
</Transition>
<Transition StartId="46" EndId="778" type="0">
</Transition>
<Transition StartId="48" EndId="53" type="0">
</Transition>
<Transition StartId="52" EndId="48" type="0">
</Transition>
<Transition StartId="53" EndId="74" type="0">
</Transition>
<Transition StartId="56" EndId="35" type="1">
<Expression>GW000_partnumber ~= ""</Expression></Transition>
<Transition StartId="56" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="46" type="1">
<Expression>PEPS0_partnumber ~= ""</Expression></Transition>
<Transition StartId="58" EndId="74" type="0">
</Transition>
<Transition StartId="59" EndId="789" type="0">
</Transition>
<Transition StartId="63" EndId="721" type="0">
</Transition>
<Transition StartId="64" EndId="75" type="0">
</Transition>
<Transition StartId="71" EndId="722" type="0">
</Transition>
<Transition StartId="72" EndId="794" type="0">
</Transition>
<Transition StartId="73" EndId="77" type="0">
</Transition>
<Transition StartId="74" EndId="59" type="1">
<Expression>ACC00_partnumber ~= "" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="74" EndId="75" type="0">
</Transition>
<Transition StartId="75" EndId="72" type="1">
<Expression>(DDCU0_partnumber ~= "") and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="75" EndId="77" type="0">
</Transition>
<Transition StartId="77" EndId="80" type="1">
<Expression>DDCU0_partnumber ~= "" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="77" EndId="87" type="0">
</Transition>
<Transition StartId="79" EndId="723" type="0">
</Transition>
<Transition StartId="80" EndId="800" type="0">
</Transition>
<Transition StartId="84" EndId="97" type="1">
<Expression>(RRDCU_partnumber ~= "") and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="84" EndId="96" type="0">
</Transition>
<Transition StartId="85" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="89" type="1">
<Expression>(RLDCU_partnumber ~= "") and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="87" EndId="84" type="0">
</Transition>
<Transition StartId="88" EndId="724" type="0">
</Transition>
<Transition StartId="89" EndId="805" type="0">
</Transition>
<Transition StartId="94" EndId="84" type="0">
</Transition>
<Transition StartId="96" EndId="107" type="1">
<Expression>SAS00_partnumber ~= ""</Expression></Transition>
<Transition StartId="96" EndId="105" type="0">
</Transition>
<Transition StartId="97" EndId="810" type="0">
</Transition>
<Transition StartId="99" EndId="725" type="0">
</Transition>
<Transition StartId="103" EndId="96" type="0">
</Transition>
<Transition StartId="105" EndId="115" type="1">
<Expression>AFS00_partnumber ~= ""</Expression></Transition>
<Transition StartId="105" EndId="122" type="0">
</Transition>
<Transition StartId="107" EndId="815" type="0">
</Transition>
<Transition StartId="109" EndId="726" type="0">
</Transition>
<Transition StartId="113" EndId="105" type="0">
</Transition>
<Transition StartId="115" EndId="820" type="0">
</Transition>
<Transition StartId="117" EndId="727" type="0">
</Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="131" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="1">
<Expression>BCM10_partnumber ~= ""</Expression></Transition>
<Transition StartId="123" EndId="825" type="0">
</Transition>
<Transition StartId="125" EndId="728" type="0">
</Transition>
<Transition StartId="129" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="139" type="0">
</Transition>
<Transition StartId="131" EndId="151" type="1">
<Expression>BCM20_partnumber ~= ""</Expression></Transition>
<Transition StartId="132" EndId="835" type="0">
</Transition>
<Transition StartId="134" EndId="730" type="0">
</Transition>
<Transition StartId="137" EndId="149" type="0">
</Transition>
<Transition StartId="139" EndId="149" type="0">
</Transition>
<Transition StartId="139" EndId="132" type="1">
<Expression>IC000_partnumber ~= ""</Expression></Transition>
<Transition StartId="141" EndId="840" type="0">
</Transition>
<Transition StartId="143" EndId="752" type="0">
</Transition>
<Transition StartId="147" EndId="158" type="0">
</Transition>
<Transition StartId="149" EndId="141" type="1">
<Expression>SDM00_partnumber ~= ""</Expression></Transition>
<Transition StartId="149" EndId="158" type="0">
</Transition>
<Transition StartId="150" EndId="729" type="0">
</Transition>
<Transition StartId="151" EndId="830" type="0">
</Transition>
<Transition StartId="156" EndId="139" type="0">
</Transition>
<Transition StartId="158" EndId="762" type="0">
</Transition>
<Transition StartId="158" EndId="160" type="1">
<Expression>(RMArm_partnumber ~= "") and VMTLOC ~= "TR1" and (DString_C131_Car_Tpye ~= "CH1GM11")</Expression></Transition>
<Transition StartId="160" EndId="845" type="0">
</Transition>
<Transition StartId="162" EndId="731" type="0">
</Transition>
<Transition StartId="165" EndId="762" type="0">
</Transition>
<Transition StartId="168" EndId="177" type="0">
</Transition>
<Transition StartId="168" EndId="169" type="1">
<Expression>EPB00_partnumber ~= ""</Expression></Transition>
<Transition StartId="169" EndId="855" type="0">
</Transition>
<Transition StartId="171" EndId="732" type="0">
</Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="1">
<Expression>LDW00_partnumber ~= ""</Expression></Transition>
<Transition StartId="177" EndId="185" type="0">
</Transition>
<Transition StartId="178" EndId="860" type="0">
</Transition>
<Transition StartId="179" EndId="733" type="0">
</Transition>
<Transition StartId="183" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="194" type="0">
</Transition>
<Transition StartId="185" EndId="188" type="1">
<Expression>EMS00_partnumber ~= ""</Expression></Transition>
<Transition StartId="188" EndId="865" type="0">
</Transition>
<Transition StartId="189" EndId="734" type="0">
</Transition>
<Transition StartId="192" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="203" type="0">
</Transition>
<Transition StartId="194" EndId="196" type="1">
<Expression>AT000_partnumber ~= ""</Expression></Transition>
<Transition StartId="196" EndId="870" type="0">
</Transition>
<Transition StartId="198" EndId="735" type="0">
</Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="221" type="0">
</Transition>
<Transition StartId="203" EndId="205" type="1">
<Expression>DCT00_partnumber ~= ""</Expression></Transition>
<Transition StartId="205" EndId="875" type="0">
</Transition>
<Transition StartId="206" EndId="736" type="0">
</Transition>
<Transition StartId="210" EndId="221" type="0">
</Transition>
<Transition StartId="213" EndId="850" type="0">
</Transition>
<Transition StartId="217" EndId="737" type="0">
</Transition>
<Transition StartId="219" EndId="168" type="0">
</Transition>
<Transition StartId="221" EndId="229" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="1">
<Expression>EHPS0_partnumber ~= ""</Expression></Transition>
<Transition StartId="222" EndId="880" type="0">
</Transition>
<Transition StartId="224" EndId="738" type="0">
</Transition>
<Transition StartId="227" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="238" type="0">
</Transition>
<Transition StartId="229" EndId="231" type="1">
<Expression>(PLGM0_partnumber~="") and (PLGM0_partnumber~="PLGM0_partnumber")</Expression></Transition>
<Transition StartId="231" EndId="885" type="0">
</Transition>
<Transition StartId="233" EndId="739" type="0">
</Transition>
<Transition StartId="236" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="298" type="0">
</Transition>
<Transition StartId="238" EndId="290" type="1">
<Expression>SCM00_partnumber~="" and SCM00_partnumber~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="244" EndId="899" type="0">
</Transition>
<Transition StartId="246" EndId="740" type="0">
</Transition>
<Transition StartId="250" EndId="252" type="0">
</Transition>
<Transition StartId="252" EndId="260" type="0">
</Transition>
<Transition StartId="252" EndId="418" type="1">
<Expression>(DSCU0_partnumber ~= "") and VMTLOC ~= "TR1" and (DString_C131_Car_Tpye ~= "CH1GM11")</Expression></Transition>
<Transition StartId="260" EndId="429" type="1">
<Expression>AC000_partnumber ~= ""</Expression></Transition>
<Transition StartId="260" EndId="435" type="0">
</Transition>
<Transition StartId="268" EndId="1" type="0">
</Transition>
<Transition StartId="290" EndId="890" type="0">
</Transition>
<Transition StartId="291" EndId="753" type="0">
</Transition>
<Transition StartId="294" EndId="298" type="0">
</Transition>
<Transition StartId="298" EndId="244" type="1">
<Expression>PDC00_partnumber ~= ""</Expression></Transition>
<Transition StartId="298" EndId="252" type="0">
</Transition>
<Transition StartId="316" EndId="45" type="0">
</Transition>
<Transition StartId="317" EndId="53" type="0">
</Transition>
<Transition StartId="318" EndId="64" type="0">
</Transition>
<Transition StartId="319" EndId="73" type="0">
</Transition>
<Transition StartId="320" EndId="85" type="0">
</Transition>
<Transition StartId="321" EndId="94" type="0">
</Transition>
<Transition StartId="322" EndId="103" type="0">
</Transition>
<Transition StartId="323" EndId="113" type="0">
</Transition>
<Transition StartId="324" EndId="120" type="0">
</Transition>
<Transition StartId="325" EndId="129" type="0">
</Transition>
<Transition StartId="326" EndId="156" type="0">
</Transition>
<Transition StartId="327" EndId="147" type="0">
</Transition>
<Transition StartId="328" EndId="137" type="0">
</Transition>
<Transition StartId="329" EndId="165" type="0">
</Transition>
<Transition StartId="330" EndId="175" type="0">
</Transition>
<Transition StartId="332" EndId="192" type="0">
</Transition>
<Transition StartId="333" EndId="183" type="0">
</Transition>
<Transition StartId="334" EndId="201" type="0">
</Transition>
<Transition StartId="335" EndId="210" type="0">
</Transition>
<Transition StartId="336" EndId="219" type="0">
</Transition>
<Transition StartId="337" EndId="227" type="0">
</Transition>
<Transition StartId="338" EndId="236" type="0">
</Transition>
<Transition StartId="339" EndId="294" type="0">
</Transition>
<Transition StartId="340" EndId="250" type="0">
</Transition>
<Transition StartId="418" EndId="900" type="0">
</Transition>
<Transition StartId="419" EndId="741" type="0">
</Transition>
<Transition StartId="421" EndId="260" type="0">
</Transition>
<Transition StartId="426" EndId="742" type="0">
</Transition>
<Transition StartId="429" EndId="905" type="0">
</Transition>
<Transition StartId="430" EndId="435" type="0">
</Transition>
<Transition StartId="435" EndId="452" type="1">
<Expression>FWD00_partnumber ~= "" and  FWD00_partnumber ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="435" EndId="466" type="0">
</Transition>
<Transition StartId="446" EndId="744" type="0">
</Transition>
<Transition StartId="448" EndId="466" type="0">
</Transition>
<Transition StartId="452" EndId="910" type="0">
</Transition>
<Transition StartId="458" EndId="421" type="0">
</Transition>
<Transition StartId="459" EndId="430" type="0">
</Transition>
<Transition StartId="460" EndId="448" type="0">
</Transition>
<Transition StartId="462" EndId="745" type="0">
</Transition>
<Transition StartId="464" EndId="473" type="0">
</Transition>
<Transition StartId="466" EndId="517" type="1">
<Expression>DCDC0_partnumber~= "" and  DCDC0_partnumber ~="DCDC0_partnumber" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="466" EndId="473" type="0">
</Transition>
<Transition StartId="469" EndId="746" type="0">
</Transition>
<Transition StartId="471" EndId="481" type="0">
</Transition>
<Transition StartId="473" EndId="518" type="1">
<Expression>BMS00_partnumber ~= "" and  BMS00_partnumber~="BMS00_partnumber"</Expression></Transition>
<Transition StartId="473" EndId="481" type="0">
</Transition>
<Transition StartId="477" EndId="747" type="0">
</Transition>
<Transition StartId="479" EndId="488" type="0">
</Transition>
<Transition StartId="481" EndId="520" type="1">
<Expression>Oilpump_partnumber ~= "" and  Oilpump_partnumber~="OLP00_partnumber" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="481" EndId="488" type="0">
</Transition>
<Transition StartId="484" EndId="748" type="0">
</Transition>
<Transition StartId="486" EndId="496" type="0">
</Transition>
<Transition StartId="488" EndId="496" type="0">
</Transition>
<Transition StartId="488" EndId="522" type="1">
<Expression>HCU00_partnumber ~= "" and  HCU00_partnumber~="HCU00_partnumber"</Expression></Transition>
<Transition StartId="491" EndId="749" type="0">
</Transition>
<Transition StartId="493" EndId="503" type="0">
</Transition>
<Transition StartId="496" EndId="523" type="1">
<Expression>Charger_partnumber ~= "" and  Charger_partnumber ~="CHG00_partnumber" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="496" EndId="503" type="0">
</Transition>
<Transition StartId="497" EndId="750" type="0">
</Transition>
<Transition StartId="500" EndId="526" type="0">
</Transition>
<Transition StartId="503" EndId="525" type="1">
<Expression>MCU00_partnumber ~= "" and MCU00_partnumber~="MCU00_partnumber"</Expression></Transition>
<Transition StartId="503" EndId="526" type="0">
</Transition>
<Transition StartId="504" EndId="464" type="0">
</Transition>
<Transition StartId="505" EndId="471" type="0">
</Transition>
<Transition StartId="506" EndId="479" type="0">
</Transition>
<Transition StartId="507" EndId="486" type="0">
</Transition>
<Transition StartId="508" EndId="493" type="0">
</Transition>
<Transition StartId="509" EndId="500" type="0">
</Transition>
<Transition StartId="517" EndId="915" type="0">
</Transition>
<Transition StartId="518" EndId="920" type="0">
</Transition>
<Transition StartId="520" EndId="925" type="0">
</Transition>
<Transition StartId="522" EndId="930" type="0">
</Transition>
<Transition StartId="523" EndId="935" type="0">
</Transition>
<Transition StartId="525" EndId="940" type="0">
</Transition>
<Transition StartId="526" EndId="534" type="1">
<Expression>BSD00_partnumber ~= "" and  BSD00_partnumber ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="526" EndId="537" type="0">
</Transition>
<Transition StartId="527" EndId="751" type="0">
</Transition>
<Transition StartId="530" EndId="537" type="0">
</Transition>
<Transition StartId="533" EndId="530" type="0">
</Transition>
<Transition StartId="534" EndId="945" type="0">
</Transition>
<Transition StartId="537" EndId="757" type="1">
<Expression>TBOX0_partnumber ~= "" and TBOX0_partnumber ~="TBOX0_partnumber"</Expression></Transition>
<Transition StartId="537" EndId="770" type="0">
</Transition>
<Transition StartId="721" EndId="64" type="0">
</Transition>
<Transition StartId="722" EndId="73" type="0">
</Transition>
<Transition StartId="723" EndId="85" type="0">
</Transition>
<Transition StartId="724" EndId="94" type="0">
</Transition>
<Transition StartId="725" EndId="103" type="0">
</Transition>
<Transition StartId="726" EndId="113" type="0">
</Transition>
<Transition StartId="727" EndId="120" type="0">
</Transition>
<Transition StartId="728" EndId="129" type="0">
</Transition>
<Transition StartId="729" EndId="156" type="0">
</Transition>
<Transition StartId="730" EndId="137" type="0">
</Transition>
<Transition StartId="731" EndId="165" type="0">
</Transition>
<Transition StartId="732" EndId="175" type="0">
</Transition>
<Transition StartId="733" EndId="183" type="0">
</Transition>
<Transition StartId="734" EndId="192" type="0">
</Transition>
<Transition StartId="735" EndId="201" type="0">
</Transition>
<Transition StartId="736" EndId="210" type="0">
</Transition>
<Transition StartId="737" EndId="219" type="0">
</Transition>
<Transition StartId="738" EndId="227" type="0">
</Transition>
<Transition StartId="739" EndId="236" type="0">
</Transition>
<Transition StartId="740" EndId="250" type="0">
</Transition>
<Transition StartId="741" EndId="421" type="0">
</Transition>
<Transition StartId="742" EndId="430" type="0">
</Transition>
<Transition StartId="744" EndId="448" type="0">
</Transition>
<Transition StartId="745" EndId="464" type="0">
</Transition>
<Transition StartId="746" EndId="471" type="0">
</Transition>
<Transition StartId="747" EndId="479" type="0">
</Transition>
<Transition StartId="748" EndId="486" type="0">
</Transition>
<Transition StartId="749" EndId="493" type="0">
</Transition>
<Transition StartId="750" EndId="500" type="0">
</Transition>
<Transition StartId="751" EndId="530" type="0">
</Transition>
<Transition StartId="752" EndId="147" type="0">
</Transition>
<Transition StartId="753" EndId="294" type="0">
</Transition>
<Transition StartId="754" EndId="759" type="0">
</Transition>
<Transition StartId="755" EndId="770" type="0">
</Transition>
<Transition StartId="756" EndId="755" type="0">
</Transition>
<Transition StartId="757" EndId="950" type="0">
</Transition>
<Transition StartId="759" EndId="755" type="0">
</Transition>
<Transition StartId="760" EndId="268" type="0">
</Transition>
<Transition StartId="762" EndId="213" type="1">
<Expression>ESP00_partnumber ~= ""</Expression></Transition>
<Transition StartId="762" EndId="168" type="0">
</Transition>
<Transition StartId="764" EndId="768" type="0">
</Transition>
<Transition StartId="765" EndId="760" type="0">
</Transition>
<Transition StartId="766" EndId="765" type="0">
</Transition>
<Transition StartId="767" EndId="955" type="0">
</Transition>
<Transition StartId="768" EndId="765" type="0">
</Transition>
<Transition StartId="770" EndId="767" type="1">
<Expression>DVD00_partnumber ~= "" and DVD00_partnumber ~="DVD00_partnumber"</Expression></Transition>
<Transition StartId="770" EndId="760" type="0">
</Transition>
<Transition StartId="772" EndId="773" type="0">
</Transition>
<Transition StartId="773" EndId="776" type="3">
</Transition>
<Transition StartId="773" EndId="774" type="4">
</Transition>
<Transition StartId="774" EndId="775" type="0">
</Transition>
<Transition StartId="774" EndId="776" type="5">
</Transition>
<Transition StartId="775" EndId="772" type="0">
</Transition>
<Transition StartId="776" EndId="37" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="776" EndId="316" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="778" EndId="779" type="0">
</Transition>
<Transition StartId="779" EndId="782" type="3">
</Transition>
<Transition StartId="779" EndId="780" type="4">
</Transition>
<Transition StartId="780" EndId="781" type="0">
</Transition>
<Transition StartId="780" EndId="782" type="5">
</Transition>
<Transition StartId="781" EndId="778" type="0">
</Transition>
<Transition StartId="782" EndId="317" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="782" EndId="52" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="789" EndId="790" type="0">
</Transition>
<Transition StartId="790" EndId="793" type="3">
</Transition>
<Transition StartId="790" EndId="791" type="4">
</Transition>
<Transition StartId="791" EndId="792" type="0">
</Transition>
<Transition StartId="791" EndId="793" type="5">
</Transition>
<Transition StartId="792" EndId="789" type="0">
</Transition>
<Transition StartId="793" EndId="63" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="793" EndId="318" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="794" EndId="795" type="0">
</Transition>
<Transition StartId="795" EndId="798" type="3">
</Transition>
<Transition StartId="795" EndId="796" type="4">
</Transition>
<Transition StartId="796" EndId="797" type="0">
</Transition>
<Transition StartId="796" EndId="798" type="5">
</Transition>
<Transition StartId="797" EndId="794" type="0">
</Transition>
<Transition StartId="798" EndId="71" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="798" EndId="319" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="800" EndId="801" type="0">
</Transition>
<Transition StartId="801" EndId="804" type="3">
</Transition>
<Transition StartId="801" EndId="802" type="4">
</Transition>
<Transition StartId="802" EndId="803" type="0">
</Transition>
<Transition StartId="802" EndId="804" type="5">
</Transition>
<Transition StartId="803" EndId="800" type="0">
</Transition>
<Transition StartId="804" EndId="79" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="804" EndId="320" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="805" EndId="806" type="0">
</Transition>
<Transition StartId="806" EndId="809" type="3">
</Transition>
<Transition StartId="806" EndId="807" type="4">
</Transition>
<Transition StartId="807" EndId="808" type="0">
</Transition>
<Transition StartId="807" EndId="809" type="5">
</Transition>
<Transition StartId="808" EndId="805" type="0">
</Transition>
<Transition StartId="809" EndId="321" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="809" EndId="88" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="810" EndId="811" type="0">
</Transition>
<Transition StartId="811" EndId="814" type="3">
</Transition>
<Transition StartId="811" EndId="812" type="4">
</Transition>
<Transition StartId="812" EndId="813" type="0">
</Transition>
<Transition StartId="812" EndId="814" type="5">
</Transition>
<Transition StartId="813" EndId="810" type="0">
</Transition>
<Transition StartId="814" EndId="99" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="814" EndId="322" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="815" EndId="816" type="0">
</Transition>
<Transition StartId="816" EndId="819" type="3">
</Transition>
<Transition StartId="816" EndId="817" type="4">
</Transition>
<Transition StartId="817" EndId="818" type="0">
</Transition>
<Transition StartId="817" EndId="819" type="5">
</Transition>
<Transition StartId="818" EndId="815" type="0">
</Transition>
<Transition StartId="819" EndId="109" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="819" EndId="323" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="820" EndId="821" type="0">
</Transition>
<Transition StartId="821" EndId="824" type="3">
</Transition>
<Transition StartId="821" EndId="822" type="4">
</Transition>
<Transition StartId="822" EndId="823" type="0">
</Transition>
<Transition StartId="822" EndId="824" type="5">
</Transition>
<Transition StartId="823" EndId="820" type="0">
</Transition>
<Transition StartId="824" EndId="117" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="824" EndId="324" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="825" EndId="826" type="0">
</Transition>
<Transition StartId="826" EndId="829" type="3">
</Transition>
<Transition StartId="826" EndId="827" type="4">
</Transition>
<Transition StartId="827" EndId="828" type="0">
</Transition>
<Transition StartId="827" EndId="829" type="5">
</Transition>
<Transition StartId="828" EndId="825" type="0">
</Transition>
<Transition StartId="829" EndId="125" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="829" EndId="325" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="830" EndId="831" type="0">
</Transition>
<Transition StartId="831" EndId="834" type="3">
</Transition>
<Transition StartId="831" EndId="832" type="4">
</Transition>
<Transition StartId="832" EndId="833" type="0">
</Transition>
<Transition StartId="832" EndId="834" type="5">
</Transition>
<Transition StartId="833" EndId="830" type="0">
</Transition>
<Transition StartId="834" EndId="150" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="834" EndId="326" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="835" EndId="836" type="0">
</Transition>
<Transition StartId="836" EndId="839" type="3">
</Transition>
<Transition StartId="836" EndId="837" type="4">
</Transition>
<Transition StartId="837" EndId="838" type="0">
</Transition>
<Transition StartId="837" EndId="839" type="5">
</Transition>
<Transition StartId="838" EndId="835" type="0">
</Transition>
<Transition StartId="839" EndId="134" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="839" EndId="328" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="840" EndId="841" type="0">
</Transition>
<Transition StartId="841" EndId="844" type="3">
</Transition>
<Transition StartId="841" EndId="842" type="4">
</Transition>
<Transition StartId="842" EndId="843" type="0">
</Transition>
<Transition StartId="842" EndId="844" type="5">
</Transition>
<Transition StartId="843" EndId="840" type="0">
</Transition>
<Transition StartId="844" EndId="143" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="844" EndId="327" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="845" EndId="846" type="0">
</Transition>
<Transition StartId="846" EndId="849" type="3">
</Transition>
<Transition StartId="846" EndId="847" type="4">
</Transition>
<Transition StartId="847" EndId="848" type="0">
</Transition>
<Transition StartId="847" EndId="849" type="5">
</Transition>
<Transition StartId="848" EndId="845" type="0">
</Transition>
<Transition StartId="849" EndId="329" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="849" EndId="162" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="850" EndId="851" type="0">
</Transition>
<Transition StartId="851" EndId="854" type="3">
</Transition>
<Transition StartId="851" EndId="852" type="4">
</Transition>
<Transition StartId="852" EndId="853" type="0">
</Transition>
<Transition StartId="852" EndId="854" type="5">
</Transition>
<Transition StartId="853" EndId="850" type="0">
</Transition>
<Transition StartId="854" EndId="217" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="854" EndId="336" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="855" EndId="856" type="0">
</Transition>
<Transition StartId="856" EndId="859" type="3">
</Transition>
<Transition StartId="856" EndId="857" type="4">
</Transition>
<Transition StartId="857" EndId="858" type="0">
</Transition>
<Transition StartId="857" EndId="859" type="5">
</Transition>
<Transition StartId="858" EndId="855" type="0">
</Transition>
<Transition StartId="859" EndId="171" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="859" EndId="330" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="860" EndId="861" type="0">
</Transition>
<Transition StartId="861" EndId="864" type="3">
</Transition>
<Transition StartId="861" EndId="862" type="4">
</Transition>
<Transition StartId="862" EndId="863" type="0">
</Transition>
<Transition StartId="862" EndId="864" type="5">
</Transition>
<Transition StartId="863" EndId="860" type="0">
</Transition>
<Transition StartId="864" EndId="179" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="864" EndId="333" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="865" EndId="866" type="0">
</Transition>
<Transition StartId="866" EndId="869" type="3">
</Transition>
<Transition StartId="866" EndId="867" type="4">
</Transition>
<Transition StartId="867" EndId="868" type="0">
</Transition>
<Transition StartId="867" EndId="869" type="5">
</Transition>
<Transition StartId="868" EndId="865" type="0">
</Transition>
<Transition StartId="869" EndId="189" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="869" EndId="332" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="870" EndId="871" type="0">
</Transition>
<Transition StartId="871" EndId="874" type="3">
</Transition>
<Transition StartId="871" EndId="872" type="4">
</Transition>
<Transition StartId="872" EndId="873" type="0">
</Transition>
<Transition StartId="872" EndId="874" type="5">
</Transition>
<Transition StartId="873" EndId="870" type="0">
</Transition>
<Transition StartId="874" EndId="198" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="874" EndId="334" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="875" EndId="876" type="0">
</Transition>
<Transition StartId="876" EndId="877" type="4">
</Transition>
<Transition StartId="876" EndId="879" type="3">
</Transition>
<Transition StartId="877" EndId="878" type="0">
</Transition>
<Transition StartId="877" EndId="879" type="5">
</Transition>
<Transition StartId="878" EndId="875" type="0">
</Transition>
<Transition StartId="879" EndId="206" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="879" EndId="335" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="881" EndId="884" type="3">
</Transition>
<Transition StartId="881" EndId="882" type="4">
</Transition>
<Transition StartId="882" EndId="883" type="0">
</Transition>
<Transition StartId="882" EndId="884" type="5">
</Transition>
<Transition StartId="883" EndId="880" type="0">
</Transition>
<Transition StartId="884" EndId="224" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="884" EndId="337" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="885" EndId="886" type="0">
</Transition>
<Transition StartId="886" EndId="889" type="3">
</Transition>
<Transition StartId="886" EndId="887" type="4">
</Transition>
<Transition StartId="887" EndId="888" type="0">
</Transition>
<Transition StartId="887" EndId="889" type="5">
</Transition>
<Transition StartId="888" EndId="885" type="0">
</Transition>
<Transition StartId="889" EndId="233" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="889" EndId="338" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="890" EndId="891" type="0">
</Transition>
<Transition StartId="891" EndId="894" type="3">
</Transition>
<Transition StartId="891" EndId="892" type="4">
</Transition>
<Transition StartId="892" EndId="893" type="0">
</Transition>
<Transition StartId="892" EndId="894" type="5">
</Transition>
<Transition StartId="893" EndId="890" type="0">
</Transition>
<Transition StartId="894" EndId="291" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="894" EndId="339" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="895" EndId="896" type="0">
</Transition>
<Transition StartId="896" EndId="899" type="3">
</Transition>
<Transition StartId="896" EndId="897" type="4">
</Transition>
<Transition StartId="897" EndId="898" type="0">
</Transition>
<Transition StartId="897" EndId="899" type="5">
</Transition>
<Transition StartId="898" EndId="895" type="0">
</Transition>
<Transition StartId="899" EndId="246" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="899" EndId="340" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="900" EndId="901" type="0">
</Transition>
<Transition StartId="901" EndId="904" type="3">
</Transition>
<Transition StartId="901" EndId="902" type="4">
</Transition>
<Transition StartId="902" EndId="903" type="0">
</Transition>
<Transition StartId="902" EndId="904" type="5">
</Transition>
<Transition StartId="903" EndId="900" type="0">
</Transition>
<Transition StartId="904" EndId="419" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="904" EndId="458" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="905" EndId="906" type="0">
</Transition>
<Transition StartId="906" EndId="907" type="4">
</Transition>
<Transition StartId="906" EndId="909" type="3">
</Transition>
<Transition StartId="907" EndId="908" type="0">
</Transition>
<Transition StartId="907" EndId="909" type="5">
</Transition>
<Transition StartId="908" EndId="905" type="0">
</Transition>
<Transition StartId="909" EndId="426" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="909" EndId="459" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="910" EndId="911" type="0">
</Transition>
<Transition StartId="911" EndId="914" type="3">
</Transition>
<Transition StartId="911" EndId="912" type="4">
</Transition>
<Transition StartId="912" EndId="913" type="0">
</Transition>
<Transition StartId="912" EndId="914" type="5">
</Transition>
<Transition StartId="913" EndId="910" type="0">
</Transition>
<Transition StartId="914" EndId="460" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="914" EndId="446" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="915" EndId="916" type="0">
</Transition>
<Transition StartId="916" EndId="919" type="3">
</Transition>
<Transition StartId="916" EndId="917" type="4">
</Transition>
<Transition StartId="917" EndId="918" type="0">
</Transition>
<Transition StartId="917" EndId="919" type="5">
</Transition>
<Transition StartId="918" EndId="915" type="0">
</Transition>
<Transition StartId="919" EndId="462" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="919" EndId="504" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="920" EndId="921" type="0">
</Transition>
<Transition StartId="921" EndId="924" type="3">
</Transition>
<Transition StartId="921" EndId="922" type="4">
</Transition>
<Transition StartId="922" EndId="923" type="0">
</Transition>
<Transition StartId="922" EndId="924" type="5">
</Transition>
<Transition StartId="923" EndId="920" type="0">
</Transition>
<Transition StartId="924" EndId="505" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="924" EndId="469" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="925" EndId="926" type="0">
</Transition>
<Transition StartId="926" EndId="929" type="3">
</Transition>
<Transition StartId="926" EndId="927" type="4">
</Transition>
<Transition StartId="927" EndId="928" type="0">
</Transition>
<Transition StartId="927" EndId="929" type="5">
</Transition>
<Transition StartId="928" EndId="925" type="0">
</Transition>
<Transition StartId="929" EndId="477" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="929" EndId="506" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="930" EndId="931" type="0">
</Transition>
<Transition StartId="931" EndId="934" type="3">
</Transition>
<Transition StartId="931" EndId="932" type="4">
</Transition>
<Transition StartId="932" EndId="933" type="0">
</Transition>
<Transition StartId="932" EndId="934" type="5">
</Transition>
<Transition StartId="933" EndId="930" type="0">
</Transition>
<Transition StartId="934" EndId="484" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="934" EndId="507" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="935" EndId="936" type="0">
</Transition>
<Transition StartId="936" EndId="939" type="3">
</Transition>
<Transition StartId="936" EndId="937" type="4">
</Transition>
<Transition StartId="937" EndId="938" type="0">
</Transition>
<Transition StartId="937" EndId="939" type="5">
</Transition>
<Transition StartId="938" EndId="935" type="0">
</Transition>
<Transition StartId="939" EndId="491" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="939" EndId="508" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="940" EndId="941" type="0">
</Transition>
<Transition StartId="941" EndId="944" type="3">
</Transition>
<Transition StartId="941" EndId="942" type="4">
</Transition>
<Transition StartId="942" EndId="943" type="0">
</Transition>
<Transition StartId="942" EndId="944" type="5">
</Transition>
<Transition StartId="943" EndId="940" type="0">
</Transition>
<Transition StartId="944" EndId="497" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="944" EndId="509" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="945" EndId="946" type="0">
</Transition>
<Transition StartId="946" EndId="949" type="3">
</Transition>
<Transition StartId="946" EndId="947" type="4">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="947" EndId="949" type="5">
</Transition>
<Transition StartId="948" EndId="945" type="0">
</Transition>
<Transition StartId="949" EndId="533" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="949" EndId="527" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="950" EndId="754" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="951" EndId="954" type="3">
</Transition>
<Transition StartId="951" EndId="952" type="4">
</Transition>
<Transition StartId="952" EndId="953" type="0">
</Transition>
<Transition StartId="952" EndId="954" type="5">
</Transition>
<Transition StartId="953" EndId="950" type="0">
</Transition>
<Transition StartId="954" EndId="756" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="955" EndId="956" type="0">
</Transition>
<Transition StartId="956" EndId="959" type="3">
</Transition>
<Transition StartId="956" EndId="957" type="4">
</Transition>
<Transition StartId="957" EndId="958" type="0">
</Transition>
<Transition StartId="957" EndId="959" type="5">
</Transition>
<Transition StartId="958" EndId="955" type="0">
</Transition>
<Transition StartId="959" EndId="764" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="959" EndId="766" type="1">
<Expression>CommErr==1</Expression></Transition>
</Transitions>
</Process>

