<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1302" pbltext="DEP100">
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
<Variable id="DString_C131_VariCoding_SDM" type="8" dir="0" data="DString_C131_VariCoding_SDM"/>
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
<Rect left="110" top="164" right="210" bottom="196"/>
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
engine.println("VMTLOC:"..VMTLOC)
engine.println("DString_C131_Car_Tpye="..DString_C131_Car_Tpye)
engine.println("DString_C131_VariCoding_SDM="..DString_C131_VariCoding_SDM)
</Script><Line1Text Enable="1" Text="读取故障码"/>
</Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="15467" top="1006" right="15567" bottom="1038"/>
<Script></Script></End>
<Activities>
<Activity id="35" ActivityType="3" flags="0" name="GW">
<Rect left="430" top="284" right="530" bottom="316"/>
<TitleText Enable="1" Text="网关 (GATEWAY)"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="切诊断">
<Rect left="430" top="524" right="530" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="读DTC">
<Rect left="430" top="644" right="530" bottom="676"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="97" name="DEP21" type="8" flags="97"/>
</Activity>
<Activity id="45" ActivityType="3" flags="0" name="结束清空">
<Rect left="590" top="1064" right="690" bottom="1096"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="46" ActivityType="3" flags="0" name="PEPS">
<Rect left="750" top="284" right="850" bottom="316"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Script></Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="读DTC">
<Rect left="750" top="584" right="850" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0C
--#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="98" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="切诊断">
<Rect left="750" top="524" right="850" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="结束清空">
<Rect left="1070" top="1064" right="1170" bottom="1096"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="56" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="224" right="496" bottom="256"/>
</Activity>
<Activity id="58" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="224" right="816" bottom="256"/>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="ACC">
<Rect left="1390" top="284" right="1490" bottom="316"/>
<TitleText Enable="1" Text="定速巡航 (ACC)"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="读DTC">
<Rect left="1390" top="584" right="1490" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="99" name="DEP104" type="8" flags="97"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="切诊断">
<Rect left="1390" top="524" right="1490" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="结束清空">
<Rect left="1550" top="704" right="1650" bottom="736"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="读DTC">
<Rect left="1710" top="584" right="1810" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="100" name="DEP110" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="切诊断">
<Rect left="1710" top="524" right="1810" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="DDCU">
<Rect left="1710" top="284" right="1810" bottom="316"/>
<TitleText Enable="1" Text="司机门控制器 （DDCU）"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="结束清空">
<Rect left="1870" top="764" right="1970" bottom="796"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="224" right="1456" bottom="256"/>
</Activity>
<Activity id="75" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="224" right="1776" bottom="256"/>
</Activity>
<Activity id="77" ActivityType="4" flags="0" name="路由节点">
<Rect left="2064" top="224" right="2096" bottom="256"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="切诊断">
<Rect left="2030" top="524" right="2130" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="PDCU">
<Rect left="2030" top="284" right="2130" bottom="316"/>
<TitleText Enable="1" Text="乘客门检测(PDCU)"/>
<Script></Script></Activity>
<Activity id="81" ActivityType="3" flags="0" name="读DTC">
<Rect left="2030" top="584" right="2130" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="101" name="DEP116" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="4" flags="0" name="路由节点">
<Rect left="2864" top="224" right="2896" bottom="256"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="结束清空">
<Rect left="2190" top="764" right="2290" bottom="796"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="87" ActivityType="4" flags="0" name="路由节点">
<Rect left="2384" top="224" right="2416" bottom="256"/>
</Activity>
<Activity id="88" ActivityType="3" flags="0" name="切诊断">
<Rect left="2350" top="524" right="2450" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="RLDCU">
<Rect left="2350" top="284" right="2450" bottom="316"/>
<TitleText Enable="1" Text="左后门 (RLDCU)"/>
<Script></Script></Activity>
<Activity id="90" ActivityType="3" flags="0" name="读DTC">
<Rect left="2350" top="584" right="2450" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="102" name="DEP122" type="8" flags="97"/>
</Activity>
<Activity id="94" ActivityType="3" flags="0" name="结束清空">
<Rect left="2510" top="764" right="2610" bottom="796"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="96" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="224" right="3376" bottom="256"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="RRDCU">
<Rect left="2830" top="284" right="2930" bottom="316"/>
<TitleText Enable="1" Text="右后门控制器 （RRDCU）"/>
<Script></Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="切诊断">
<Rect left="2830" top="584" right="2930" bottom="616"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="读DTC">
<Rect left="2830" top="644" right="2930" bottom="676"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="103" name="DEP128" type="8" flags="97"/>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="结束清空">
<Rect left="3150" top="764" right="3250" bottom="796"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="105" ActivityType="4" flags="0" name="路由节点">
<Rect left="3673" top="239" right="3705" bottom="271"/>
</Activity>
<Activity id="107" ActivityType="3" flags="0" name="SAS">
<Rect left="3310" top="284" right="3410" bottom="316"/>
<TitleText Enable="1" Text="转角传感器 (SAS)"/>
<Script></Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="切诊断">
<Rect left="3310" top="524" right="3410" bottom="556"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="读DTC">
<Rect left="3310" top="584" right="3410" bottom="616"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="104" name="DEP82" type="8" flags="97"/>
</Activity>
<Activity id="113" ActivityType="3" flags="0" name="结束清空">
<Rect left="3470" top="884" right="3570" bottom="916"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="AFS">
<Rect left="3755" top="303" right="3855" bottom="335"/>
<TitleText Enable="1" Text="大灯 (AFS)"/>
<Script></Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="切诊断">
<Rect left="3755" top="421" right="3855" bottom="453"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="读DTC">
<Rect left="3755" top="481" right="3855" bottom="513"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="105" name="DEP131" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="结束清空">
<Rect left="3894" top="731" right="3994" bottom="763"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="122" ActivityType="4" flags="0" name="路由节点">
<Rect left="4078" top="239" right="4110" bottom="271"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="BCM1">
<Rect left="4114" top="311" right="4214" bottom="343"/>
<TitleText Enable="1" Text="车身控制器1 (BCM1)"/>
<Script></Script></Activity>
<Activity id="125" ActivityType="3" flags="0" name="切诊断">
<Rect left="4113" top="431" right="4213" bottom="463"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="126" ActivityType="3" flags="0" name="读DTC">
<Rect left="4113" top="542" right="4213" bottom="574"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="106" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="结束清空">
<Rect left="4238" top="784" right="4338" bottom="816"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="4403" top="238" right="4435" bottom="270"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="IC">
<Rect left="4909" top="311" right="5009" bottom="343"/>
<TitleText Enable="1" Text="组合仪表板 (IC)"/>
<Script></Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="切诊断">
<Rect left="4909" top="432" right="5009" bottom="464"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="读DTC">
<Rect left="4909" top="535" right="5009" bottom="567"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x19 0x02 0x09  --01读当前故障，09读当前和历史故障
#COMM 0x19 0x02 0x01
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="108" name="DEP134" type="8" flags="97"/>
</Activity>
<Activity id="137" ActivityType="3" flags="0" name="结束清空">
<Rect left="5040" top="799" right="5140" bottom="831"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="139" ActivityType="4" flags="0" name="路由节点">
<Rect left="4825" top="237" right="4857" bottom="269"/>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="AirBag">
<Rect left="5294" top="310" right="5394" bottom="342"/>
<TitleText Enable="1" Text="安全气囊 (AirBag)"/>
<Script></Script></Activity>
<Activity id="143" ActivityType="3" flags="0" name="切诊断">
<Rect left="5296" top="427" right="5396" bottom="459"/>
<Script>engine.Delay(50)
#COMM 0x10 0x01
</Script></Activity>
<Activity id="144" ActivityType="3" flags="0" name="读DTC">
<Rect left="5297" top="578" right="5397" bottom="610"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>engine.Delay(50)

#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="109" name="DEP135" type="8" flags="97"/>
</Activity>
<Activity id="147" ActivityType="3" flags="0" name="结束清空">
<Rect left="5413" top="932" right="5513" bottom="964"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="5140" top="237" right="5172" bottom="269"/>
</Activity>
<Activity id="150" ActivityType="3" flags="0" name="切诊断">
<Rect left="4535" top="444" right="4635" bottom="476"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="151" ActivityType="3" flags="0" name="BCM2">
<Rect left="4534" top="317" right="4634" bottom="349"/>
<TitleText Enable="1" Text="车身控制器2（BCM2）"/>
<Script></Script></Activity>
<Activity id="153" ActivityType="3" flags="0" name="读DTC">
<Rect left="4534" top="497" right="4634" bottom="529"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="107" name="DEP133" type="8" flags="97"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="结束清空">
<Rect left="4656" top="803" right="4756" bottom="835"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="5504" top="237" right="5536" bottom="269"/>
</Activity>
<Activity id="159" ActivityType="3" flags="0" name="读DTC">
<Rect left="5625" top="512" right="5725" bottom="544"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x19 0x02 0x0C  ----04读当前故障，0C读当前和历史故障
#COMM 0x19 0x02 0x04
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="110" name="DEP139" type="8" flags="97"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="ARMREST">
<Rect left="5624" top="306" right="5724" bottom="338"/>
<TitleText Enable="1" Text="后中扶手 (ARMREST)"/>
<Script></Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="切诊断">
<Rect left="5625" top="414" right="5725" bottom="446"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="结束清空">
<Rect left="5742" top="825" right="5842" bottom="857"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="5922" top="237" right="5954" bottom="269"/>
</Activity>
<Activity id="169" ActivityType="3" flags="0" name="EPB">
<Rect left="6474" top="315" right="6574" bottom="347"/>
<TitleText Enable="1" Text="电子驻车(EPB)"/>
<Script></Script></Activity>
<Activity id="171" ActivityType="3" flags="0" name="切诊断">
<Rect left="6475" top="434" right="6575" bottom="466"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="172" ActivityType="3" flags="0" name="读DTC">
<Rect left="6476" top="505" right="6576" bottom="537"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="111" name="DEP88" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="3" flags="0" name="结束清空">
<Rect left="6601" top="786" right="6701" bottom="818"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="177" ActivityType="4" flags="0" name="路由节点">
<Rect left="6764" top="234" right="6796" bottom="266"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="LDW">
<Rect left="6839" top="309" right="6939" bottom="341"/>
<TitleText Enable="1" Text="前视(LDW)"/>
<Script></Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="切诊断">
<Rect left="6840" top="430" right="6940" bottom="462"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="181" ActivityType="3" flags="0" name="读DTC">
<Rect left="6840" top="487" right="6940" bottom="519"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="112" name="DEP15" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="结束清空">
<Rect left="6980" top="769" right="7080" bottom="801"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="185" ActivityType="4" flags="0" name="路由节点">
<Rect left="7256" top="234" right="7288" bottom="266"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="读DTC">
<Rect left="7329" top="593" right="7429" bottom="625"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0c
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="113" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="188" ActivityType="3" flags="0" name="EMS">
<Rect left="7331" top="315" right="7431" bottom="347"/>
<TitleText Enable="1" Text="发动机检测 (EMS)"/>
<Script></Script></Activity>
<Activity id="189" ActivityType="3" flags="0" name="切诊断">
<Rect left="7331" top="435" right="7431" bottom="467"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="192" ActivityType="3" flags="0" name="结束清空">
<Rect left="7460" top="822" right="7560" bottom="854"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="194" ActivityType="4" flags="0" name="路由节点">
<Rect left="7620" top="235" right="7652" bottom="267"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="读DTC">
<Rect left="7720" top="490" right="7820" bottom="522"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0c
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="114" name="DEP149" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="AT">
<Rect left="7720" top="300" right="7820" bottom="332"/>
<TitleText Enable="1" Text="自动变速器 (AT)"/>
<Script></Script></Activity>
<Activity id="198" ActivityType="3" flags="0" name="切诊断">
<Rect left="7721" top="424" right="7821" bottom="456"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="结束清空">
<Rect left="7857" top="707" right="7957" bottom="739"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="203" ActivityType="4" flags="0" name="路由节点">
<Rect left="7999" top="234" right="8031" bottom="266"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="DCT">
<Rect left="8073" top="310" right="8173" bottom="342"/>
<TitleText Enable="1" Text="双离合变速器（DCT）"/>
<Script></Script></Activity>
<Activity id="206" ActivityType="3" flags="0" name="切诊断">
<Rect left="8073" top="431" right="8173" bottom="463"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="207" ActivityType="3" flags="0" name="读DTC">
<Rect left="8073" top="492" right="8173" bottom="524"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x19 0x02 0x09
#COMM 0x19 0x02 0x0C
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="115" name="DEP153" type="8" flags="97"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="结束清空">
<Rect left="8205" top="789" right="8305" bottom="821"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="ESP">
<Rect left="6059" top="297" right="6159" bottom="329"/>
<TitleText Enable="1" Text="车辆电子稳定系统 (ESP)"/>
<Script></Script></Activity>
<Activity id="215" ActivityType="3" flags="0" name="读DTC">
<Rect left="6058" top="475" right="6158" bottom="507"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="116" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="217" ActivityType="3" flags="0" name="切诊断">
<Rect left="6059" top="413" right="6159" bottom="445"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="219" ActivityType="3" flags="0" name="结束清空">
<Rect left="6186" top="769" right="6286" bottom="801"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="221" ActivityType="4" flags="0" name="路由节点">
<Rect left="8362" top="235" right="8394" bottom="267"/>
</Activity>
<Activity id="222" ActivityType="3" flags="0" name="EHPS">
<Rect left="8458" top="304" right="8558" bottom="336"/>
<TitleText Enable="1" Text="电子液压助力转向（EHPS）"/>
<Script></Script></Activity>
<Activity id="224" ActivityType="3" flags="0" name="切诊断">
<Rect left="8460" top="421" right="8560" bottom="453"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="读DTC">
<Rect left="8461" top="488" right="8561" bottom="520"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="117" name="DEP156" type="8" flags="97"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="结束清空">
<Rect left="8583" top="714" right="8683" bottom="746"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="229" ActivityType="4" flags="0" name="路由节点">
<Rect left="8749" top="235" right="8781" bottom="267"/>
</Activity>
<Activity id="231" ActivityType="3" flags="0" name="PLGM">
<Rect left="8887" top="286" right="8987" bottom="318"/>
<TitleText Enable="1" Text="电动尾门（电动尾门）"/>
<Script>engine.println("PLGM0_partnumber")</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="切诊断">
<Rect left="8887" top="401" right="8987" bottom="433"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="234" ActivityType="3" flags="0" name="读DTC">
<Rect left="8887" top="451" right="8987" bottom="483"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="118" name="DEP202" type="8" flags="97"/>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="结束清空">
<Rect left="9018" top="670" right="9118" bottom="702"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="238" ActivityType="4" flags="0" name="路由节点">
<Rect left="9194" top="234" right="9226" bottom="266"/>
</Activity>
<Activity id="241" ActivityType="5" flags="0" name="PLGM通讯">
<Rect left="8888" top="348" right="8988" bottom="380"/>
<SubProcesses>
<SubProcess id="PLGM_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="244" ActivityType="3" flags="0" name="PDC">
<Rect left="9681" top="304" right="9781" bottom="336"/>
<TitleText Enable="1" Text="倒车雷达 (PDC)"/>
<Script></Script></Activity>
<Activity id="246" ActivityType="3" flags="0" name="切诊断">
<Rect left="9681" top="417" right="9781" bottom="449"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="247" ActivityType="3" flags="0" name="读DTC">
<Rect left="9683" top="523" right="9783" bottom="555"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x19 0x02 0x0C
#COMM 0x19 0x02 0x04
if(@0==0x59)then
  engine.LastError = 0;
  dtc_size=@@;
  dtc=hexstr(@3-@dtc_size);
else
  engine.LastError = 1;
  engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="120" name="DEP76" type="8" flags="97"/>
</Activity>
<Activity id="250" ActivityType="3" flags="0" name="结束清空">
<Rect left="9809" top="752" right="9909" bottom="784"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="252" ActivityType="4" flags="0" name="路由节点">
<Rect left="10044" top="235" right="10076" bottom="267"/>
</Activity>
<Activity id="260" ActivityType="4" flags="0" name="路由节点">
<Rect left="10451" top="235" right="10483" bottom="267"/>
</Activity>
<Activity id="268" ActivityType="3" flags="0" name="结束清空">
<Rect left="15467" top="944" right="15567" bottom="976"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="277" ActivityType="5" flags="0" name="AFS通讯">
<Rect left="3755" top="364" right="3855" bottom="396"/>
<SubProcesses>
<SubProcess id="AFS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="278" ActivityType="5" flags="0" name="BCM1通讯">
<Rect left="4114" top="377" right="4214" bottom="409"/>
<SubProcesses>
<SubProcess id="BCM1_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="279" ActivityType="5" flags="0" name="BCM2通讯">
<Rect left="4535" top="386" right="4635" bottom="418"/>
<SubProcesses>
<SubProcess id="BCM2_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="280" ActivityType="5" flags="0" name="IC通讯">
<Rect left="4910" top="379" right="5010" bottom="411"/>
<SubProcesses>
<SubProcess id="IC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="282" ActivityType="5" flags="0" name="RMAR">
<Rect left="5624" top="360" right="5724" bottom="392"/>
<SubProcesses>
<SubProcess id="RMAR_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="283" ActivityType="5" flags="0" name="EPB">
<Rect left="6474" top="378" right="6574" bottom="410"/>
<SubProcesses>
<SubProcess id="EPB_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="284" ActivityType="5" flags="0" name="LDW通讯">
<Rect left="6840" top="369" right="6940" bottom="401"/>
<SubProcesses>
<SubProcess id="LDW_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="285" ActivityType="5" flags="0" name="EMS通讯">
<Rect left="7332" top="378" right="7432" bottom="410"/>
<SubProcesses>
<SubProcess id="EMS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="286" ActivityType="5" flags="0" name="AT通讯">
<Rect left="7720" top="362" right="7820" bottom="394"/>
<SubProcesses>
<SubProcess id="AT_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="287" ActivityType="5" flags="0" name="DCT通讯">
<Rect left="8073" top="371" right="8173" bottom="403"/>
<SubProcesses>
<SubProcess id="DCT_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="288" ActivityType="5" flags="0" name="ESP通讯">
<Rect left="6060" top="357" right="6160" bottom="389"/>
<SubProcesses>
<SubProcess id="ESP_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="289" ActivityType="5" flags="0" name="EHPS通讯">
<Rect left="8459" top="358" right="8559" bottom="390"/>
<SubProcesses>
<SubProcess id="EHPS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="290" ActivityType="3" flags="0" name="SCM">
<Rect left="9284" top="301" right="9384" bottom="333"/>
<TitleText Enable="1" Text="电子助力转向（SCM）"/>
<Script>engine.println("********SCM00_partnumber"..SCM00_partnumber)</Script></Activity>
<Activity id="291" ActivityType="3" flags="0" name="切诊断">
<Rect left="9285" top="436" right="9385" bottom="468"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="292" ActivityType="3" flags="0" name="读DTC">
<Rect left="9285" top="499" right="9385" bottom="531"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="119" name="DEP208" type="8" flags="97"/>
</Activity>
<Activity id="294" ActivityType="3" flags="0" name="结束清空">
<Rect left="9418" top="755" right="9518" bottom="787"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="298" ActivityType="4" flags="0" name="路由节点">
<Rect left="9596" top="235" right="9628" bottom="267"/>
</Activity>
<Activity id="299" ActivityType="5" flags="0" name="SCM通讯">
<Rect left="9284" top="368" right="9384" bottom="400"/>
<SubProcesses>
<SubProcess id="SCM_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="301" ActivityType="5" flags="0" name="PDC通讯">
<Rect left="9682" top="364" right="9782" bottom="396"/>
<SubProcesses>
<SubProcess id="PDC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="310" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="764" right="816" bottom="796"/>
</Activity>
<Activity id="313" ActivityType="4" flags="0" name="路由节点">
<Rect left="5577" top="682" right="5609" bottom="714"/>
</Activity>
<Activity id="314" ActivityType="5" flags="0" name="SDM通讯">
<Rect left="5295" top="366" right="5395" bottom="398"/>
<SubProcesses>
<SubProcess id="SDM_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="316" ActivityType="3" flags="0" name="通讯失败">
<Rect left="650" top="464" right="750" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="1" name="DEP19" type="8" flags="97"/>
</Activity>
<Activity id="317" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1070" top="464" right="1170" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="3" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="318" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1550" top="464" right="1650" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="4" name="DEP102" type="8" flags="97"/>
</Activity>
<Activity id="319" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1870" top="464" right="1970" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="6" name="DEP108" type="8" flags="97"/>
</Activity>
<Activity id="320" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2190" top="464" right="2290" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="8" name="DEP114" type="8" flags="97"/>
</Activity>
<Activity id="321" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2510" top="464" right="2610" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="9" name="DEP120" type="8" flags="97"/>
</Activity>
<Activity id="322" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2990" top="524" right="3090" bottom="556"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="10" name="DEP126" type="8" flags="97"/>
</Activity>
<Activity id="323" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3470" top="464" right="3570" bottom="496"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="12" name="DEP80" type="8" flags="97"/>
</Activity>
<Activity id="324" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3893" top="364" right="3993" bottom="396"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="14" name="DEP24" type="8" flags="97"/>
</Activity>
<Activity id="325" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4239" top="377" right="4339" bottom="409"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="17" name="DEP42" type="8" flags="97"/>
</Activity>
<Activity id="326" ActivityType="3" flags="0" name="通讯失败">
<Rect left="4655" top="386" right="4755" bottom="418"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="18" name="DEP56" type="8" flags="97"/>
</Activity>
<Activity id="327" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5420" top="367" right="5520" bottom="399"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="22" name="DEP69" type="8" flags="97"/>
</Activity>
<Activity id="328" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5040" top="378" right="5140" bottom="410"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="20" name="DEP37" type="8" flags="97"/>
</Activity>
<Activity id="329" ActivityType="3" flags="0" name="通讯失败">
<Rect left="5741" top="361" right="5841" bottom="393"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="23" name="DEP785" type="8" flags="97"/>
</Activity>
<Activity id="330" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6601" top="378" right="6701" bottom="410"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="25" name="DEP86" type="8" flags="97"/>
</Activity>
<Activity id="332" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7459" top="381" right="7559" bottom="413"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="27" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="333" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6980" top="370" right="7080" bottom="402"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="26" name="DEP13" type="8" flags="97"/>
</Activity>
<Activity id="334" ActivityType="3" flags="0" name="通讯失败">
<Rect left="7858" top="362" right="7958" bottom="394"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="28" name="DEP32" type="8" flags="97"/>
</Activity>
<Activity id="335" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8205" top="372" right="8305" bottom="404"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="30" name="DEP151" type="8" flags="97"/>
</Activity>
<Activity id="336" ActivityType="3" flags="0" name="通讯失败">
<Rect left="6187" top="358" right="6287" bottom="390"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="31" name="DEP64" type="8" flags="97"/>
</Activity>
<Activity id="337" ActivityType="3" flags="0" name="通讯失败">
<Rect left="8582" top="358" right="8682" bottom="390"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="33" name="DEP10" type="8" flags="97"/>
</Activity>
<Activity id="338" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9017" top="348" right="9117" bottom="380"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="34" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="339" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9417" top="367" right="9517" bottom="399"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="56" name="DEP206" type="8" flags="97"/>
</Activity>
<Activity id="340" ActivityType="3" flags="0" name="通讯失败">
<Rect left="9808" top="364" right="9908" bottom="396"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="36" name="DEP74" type="8" flags="97"/>
</Activity>
<Activity id="350" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="704" right="336" bottom="736"/>
</Activity>
<Activity id="351" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="944" right="336" bottom="976"/>
</Activity>
<Activity id="352" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="1004" right="336" bottom="1036"/>
</Activity>
<Activity id="353" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="764" right="336" bottom="796"/>
</Activity>
<Activity id="354" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="824" right="336" bottom="856"/>
</Activity>
<Activity id="355" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="884" right="336" bottom="916"/>
</Activity>
<Activity id="356" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="824" right="816" bottom="856"/>
</Activity>
<Activity id="360" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="884" right="816" bottom="916"/>
</Activity>
<Activity id="361" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="884" right="816" bottom="916"/>
</Activity>
<Activity id="362" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="944" right="816" bottom="976"/>
</Activity>
<Activity id="365" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="1064" right="336" bottom="1096"/>
</Activity>
<Activity id="367" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="1004" right="816" bottom="1036"/>
</Activity>
<Activity id="369" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="704" right="1776" bottom="736"/>
</Activity>
<Activity id="417" ActivityType="3" flags="0" name="读DTC">
<Rect left="10156" top="507" right="10256" bottom="539"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="121" name="DEP160" type="8" flags="97"/>
</Activity>
<Activity id="418" ActivityType="3" flags="0" name="DSCU">
<Rect left="10156" top="307" right="10256" bottom="339"/>
<TitleText Enable="1" Text="座椅系统 （DSCU）"/>
<Script></Script></Activity>
<Activity id="419" ActivityType="3" flags="0" name="切诊断">
<Rect left="10157" top="408" right="10257" bottom="440"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="421" ActivityType="3" flags="0" name="结束清空">
<Rect left="10284" top="787" right="10384" bottom="819"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="423" ActivityType="3" flags="0" name="清DTC">
<Rect left="10049" top="457" right="10149" bottom="489"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script></Activity>
<Activity id="426" ActivityType="3" flags="0" name="切诊断">
<Rect left="10571" top="425" right="10671" bottom="457"/>
<Script>engine.Delay(50)
#COMM 0x10 0x01</Script></Activity>
<Activity id="427" ActivityType="3" flags="0" name="读DTC">
<Rect left="10570" top="485" right="10670" bottom="517"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>engine.Delay(50)
#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="122" name="DEP28" type="8" flags="97"/>
</Activity>
<Activity id="429" ActivityType="3" flags="0" name="AC">
<Rect left="10573" top="308" right="10673" bottom="340"/>
<TitleText Enable="1" Text="空调（AC）"/>
<Script></Script></Activity>
<Activity id="430" ActivityType="3" flags="0" name="结束清空">
<Rect left="10700" top="729" right="10800" bottom="761"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="435" ActivityType="4" flags="0" name="路由节点">
<Rect left="10907" top="235" right="10939" bottom="267"/>
</Activity>
<Activity id="437" ActivityType="5" flags="0" name="AC通讯">
<Rect left="10572" top="369" right="10672" bottom="401"/>
<SubProcesses>
<SubProcess id="AC_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="446" ActivityType="3" flags="0" name="切诊断">
<Rect left="10935" top="423" right="11035" bottom="455"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="447" ActivityType="3" flags="0" name="读DTC">
<Rect left="10934" top="476" right="11034" bottom="508"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="123" name="DEP880" type="8" flags="97"/>
</Activity>
<Activity id="448" ActivityType="3" flags="0" name="结束清空">
<Rect left="11052" top="795" right="11152" bottom="827"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="451" ActivityType="5" flags="0" name="4WD通讯">
<Rect left="10935" top="364" right="11035" bottom="396"/>
<SubProcesses>
<SubProcess id="4WD_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="452" ActivityType="3" flags="0" name="4WD">
<Rect left="10934" top="304" right="11034" bottom="336"/>
<TitleText Enable="1" Text="四驱系统（4WD）"/>
<Script></Script></Activity>
<Activity id="457" ActivityType="5" flags="0" name="DSCU通讯">
<Rect left="10155" top="360" right="10255" bottom="392"/>
<SubProcesses>
<SubProcess id="DSCU_Comm">
<Parameters>
<Parameter id="CommErr" value="0" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="458" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10280" top="361" right="10380" bottom="393"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="38" name="DEP158" type="8" flags="97"/>
</Activity>
<Activity id="459" ActivityType="3" flags="0" name="通讯失败">
<Rect left="10701" top="368" right="10801" bottom="400"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="39" name="DEP27" type="8" flags="97"/>
</Activity>
<Activity id="460" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11051" top="363" right="11151" bottom="395"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="42" name="DEP792" type="8" flags="97"/>
</Activity>
<Activity id="462" ActivityType="3" flags="0" name="切诊断">
<Rect left="11273" top="409" right="11373" bottom="441"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="463" ActivityType="3" flags="0" name="读DTC">
<Rect left="11273" top="465" right="11373" bottom="497"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="124" name="DEP881" type="8" flags="97"/>
</Activity>
<Activity id="464" ActivityType="3" flags="0" name="结束清空">
<Rect left="11395" top="624" right="11495" bottom="656"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="466" ActivityType="4" flags="0" name="路由节点">
<Rect left="11219" top="235" right="11251" bottom="267"/>
</Activity>
<Activity id="467" ActivityType="5" flags="0" name="DCDC通讯">
<Rect left="11272" top="358" right="11372" bottom="390"/>
<SubProcesses>
<SubProcess id="DCDC_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="469" ActivityType="3" flags="0" name="切诊断">
<Rect left="11647" top="416" right="11747" bottom="448"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="470" ActivityType="3" flags="0" name="读DTC">
<Rect left="11648" top="476" right="11748" bottom="508"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="125" name="DEP882" type="8" flags="97"/>
</Activity>
<Activity id="471" ActivityType="3" flags="0" name="结束清空">
<Rect left="11776" top="626" right="11876" bottom="658"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="473" ActivityType="4" flags="0" name="路由节点">
<Rect left="11549" top="234" right="11581" bottom="266"/>
</Activity>
<Activity id="474" ActivityType="5" flags="0" name="BMS通讯">
<Rect left="11647" top="357" right="11747" bottom="389"/>
<SubProcesses>
<SubProcess id="BMS_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="475" ActivityType="5" flags="0" name="OilPump通讯">
<Rect left="12081" top="371" right="12181" bottom="403"/>
<SubProcesses>
<SubProcess id="OilPump_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="477" ActivityType="3" flags="0" name="切诊断">
<Rect left="12080" top="437" right="12180" bottom="469"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="478" ActivityType="3" flags="0" name="读DTC">
<Rect left="12080" top="494" right="12180" bottom="526"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="126" name="DEP886" type="8" flags="97"/>
</Activity>
<Activity id="479" ActivityType="3" flags="0" name="结束清空">
<Rect left="12205" top="621" right="12305" bottom="653"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="481" ActivityType="4" flags="0" name="路由节点">
<Rect left="11976" top="234" right="12008" bottom="266"/>
</Activity>
<Activity id="484" ActivityType="3" flags="0" name="切诊断">
<Rect left="12569" top="426" right="12669" bottom="458"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="485" ActivityType="3" flags="0" name="读DTC">
<Rect left="12570" top="476" right="12670" bottom="508"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0C
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="127" name="DEP884" type="8" flags="97"/>
</Activity>
<Activity id="486" ActivityType="3" flags="0" name="结束清空">
<Rect left="12700" top="854" right="12800" bottom="886"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="488" ActivityType="4" flags="0" name="路由节点">
<Rect left="12381" top="235" right="12413" bottom="267"/>
</Activity>
<Activity id="489" ActivityType="5" flags="0" name="Charger通讯">
<Rect left="13039" top="361" right="13139" bottom="393"/>
<SubProcesses>
<SubProcess id="Charger_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="491" ActivityType="3" flags="0" name="切诊断">
<Rect left="13039" top="414" right="13139" bottom="446"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="492" ActivityType="3" flags="0" name="读DTC">
<Rect left="13039" top="472" right="13139" bottom="504"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="128" name="DEP885" type="8" flags="97"/>
</Activity>
<Activity id="493" ActivityType="3" flags="0" name="结束清空">
<Rect left="13171" top="599" right="13271" bottom="631"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="496" ActivityType="4" flags="0" name="路由节点">
<Rect left="12927" top="235" right="12959" bottom="267"/>
</Activity>
<Activity id="497" ActivityType="3" flags="0" name="切诊断">
<Rect left="13428" top="421" right="13528" bottom="453"/>
<Script>#COMM 0x10 0x01
--#COMM 0x19 0x02 0x09</Script></Activity>
<Activity id="498" ActivityType="3" flags="0" name="读DTC">
<Rect left="13427" top="475" right="13527" bottom="507"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x22 0x11 0x2A
#COMM 0x19 0x02 0x09
--#COMM 0x19 0x02 0x01
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="129" name="DEP883" type="8" flags="97"/>
</Activity>
<Activity id="500" ActivityType="3" flags="0" name="结束清空">
<Rect left="13565" top="596" right="13665" bottom="628"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="502" ActivityType="5" flags="0" name="MCU通讯">
<Rect left="13428" top="357" right="13528" bottom="389"/>
<SubProcesses>
<SubProcess id="MCU_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="503" ActivityType="4" flags="0" name="路由节点">
<Rect left="13340" top="235" right="13372" bottom="267"/>
</Activity>
<Activity id="504" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11394" top="359" right="11494" bottom="391"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="43" name="DEP848" type="8" flags="97"/>
</Activity>
<Activity id="505" ActivityType="3" flags="0" name="通讯失败">
<Rect left="11775" top="358" right="11875" bottom="390"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="45" name="DEP837" type="8" flags="97"/>
</Activity>
<Activity id="506" ActivityType="3" flags="0" name="通讯失败">
<Rect left="12205" top="374" right="12305" bottom="406"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="46" name="DEP826" type="8" flags="97"/>
</Activity>
<Activity id="507" ActivityType="3" flags="0" name="通讯失败">
<Rect left="12688" top="370" right="12788" bottom="402"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="48" name="DEP859" type="8" flags="97"/>
</Activity>
<Activity id="508" ActivityType="3" flags="0" name="通讯失败">
<Rect left="13171" top="362" right="13271" bottom="394"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="50" name="DEP815" type="8" flags="97"/>
</Activity>
<Activity id="509" ActivityType="3" flags="0" name="通讯失败">
<Rect left="13564" top="358" right="13664" bottom="390"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="51" name="DEP803" type="8" flags="97"/>
</Activity>
<Activity id="510" ActivityType="5" flags="0" name="HCU通讯">
<Rect left="12568" top="369" right="12668" bottom="401"/>
<SubProcesses>
<SubProcess id="HCU_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="517" ActivityType="3" flags="0" name="DCDC">
<Rect left="11272" top="301" right="11372" bottom="333"/>
<TitleText Enable="1" Text="DC/DC控制器"/>
<Script></Script></Activity>
<Activity id="518" ActivityType="3" flags="0" name="BMS">
<Rect left="11647" top="302" right="11747" bottom="334"/>
<TitleText Enable="1" Text="电池管理系统（BMS）"/>
<Script></Script></Activity>
<Activity id="520" ActivityType="3" flags="0" name="OilPump">
<Rect left="12081" top="305" right="12181" bottom="337"/>
<TitleText Enable="1" Text="油泵系统（OilPump）"/>
<Script></Script></Activity>
<Activity id="522" ActivityType="3" flags="0" name="HCU">
<Rect left="12568" top="314" right="12668" bottom="346"/>
<TitleText Enable="1" Text="混动控制系统（HCU）"/>
<Script></Script></Activity>
<Activity id="523" ActivityType="3" flags="0" name="Charger">
<Rect left="13039" top="301" right="13139" bottom="333"/>
<TitleText Enable="1" Text="充电控制系统（Charger）"/>
<Script></Script></Activity>
<Activity id="525" ActivityType="3" flags="0" name="MCU">
<Rect left="13429" top="300" right="13529" bottom="332"/>
<TitleText Enable="1" Text="电机控制系统（MCU）"/>
<Script></Script></Activity>
<Activity id="526" ActivityType="4" flags="0" name="路由节点">
<Rect left="13772" top="235" right="13804" bottom="267"/>
</Activity>
<Activity id="527" ActivityType="3" flags="0" name="切诊断">
<Rect left="13851" top="414" right="13951" bottom="446"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="528" ActivityType="3" flags="0" name="读DTC">
<Rect left="13852" top="469" right="13952" bottom="501"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="130" name="DEP887" type="8" flags="97"/>
</Activity>
<Activity id="530" ActivityType="3" flags="0" name="结束清空">
<Rect left="14007" top="823" right="14107" bottom="855"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="533" ActivityType="3" flags="0" name="通讯失败">
<Rect left="13981" top="346" right="14081" bottom="378"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="53" name="DEP870" type="8" flags="97"/>
</Activity>
<Activity id="534" ActivityType="3" flags="0" name="BSD">
<Rect left="13852" top="300" right="13952" bottom="332"/>
<TitleText Enable="1" Text="盲区探测系统（BSD）"/>
<Script></Script></Activity>
<Activity id="535" ActivityType="5" flags="0" name="BSD通讯">
<Rect left="13852" top="346" right="13952" bottom="378"/>
<SubProcesses>
<SubProcess id="BSD_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="537" ActivityType="4" flags="0" name="路由节点">
<Rect left="14183" top="235" right="14215" bottom="267"/>
</Activity>
<Activity id="539" ActivityType="4" flags="0" name="路由节点">
<Rect left="15501" top="874" right="15533" bottom="906"/>
</Activity>
<Activity id="540" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="704" right="530" bottom="736"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U1007-00,U0208-00,U2204-00,U2251-00,U0235-00,U1099-00,U1009-00,U1017-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="541" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="764" right="530" bottom="796"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0235-00,U1099-00,U1009-00,U1017-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="546" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="824" right="530" bottom="856"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0199-00,U0200-00,U0201-00,U0202-00,U0208-00,U102C-00,U102D-00,U1007-00,U0235-00,U1009-00,U1007-00,U0235-08,U0199-08,U0200-08,U0201-08,U0202-08,U0208-08,U0287-08,U0197-08,U0131-00,U0256-00,U1017-00,U0100-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="547" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="884" right="530" bottom="916"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1073-00,B1074-00,B0020-00,B0028-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="548" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="944" right="530" bottom="976"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1073-00,B1074-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="549" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="430" top="1004" right="530" bottom="1036"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1073-00,B1074-00,U0164-00,U1059-00,U100B-00,U100A-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="551" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="430" top="1064" right="530" bottom="1096"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_GATEWAY&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="2" name="DEP21" type="8" flags="97"/>
</Activity>
<Activity id="552" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="764" right="1010" bottom="796"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B12FF-00,B1300-00,B1301-00,B1302-00,B1303-00,B1304-00,B1305-00,B1306-00,B130D-00,B130E-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="553" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="824" right="1010" bottom="856"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0199-00,U0200-00,U0201-00,U0202-00,B12EC-00,B12ED-00,B12EE-00,B12EF-00,B12E8-00,B130F-00,B1401-00,B1403-00,B1405-00,B12FF-00,B1301-00,B1303-00,B1305-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="554" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="884" right="1010" bottom="916"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B12E2-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="555" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="884" right="1010" bottom="916"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B141B-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="560" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="884" right="1010" bottom="916"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B141B-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="561" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="944" right="1010" bottom="976"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B141B-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="563" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="910" top="1004" right="1010" bottom="1036"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B141B-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="564" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="910" top="1064" right="1010" bottom="1096"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_PEPS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="5" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="565" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="1064" right="816" bottom="1096"/>
</Activity>
<Activity id="566" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="1390" top="644" right="1490" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="567" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="1390" top="704" right="1490" bottom="736"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_ACC&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="11" name="DEP104" type="8" flags="97"/>
</Activity>
<Activity id="569" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="1870" top="704" right="1970" bottom="736"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11B3-00,B11B4-00,B11CF-00,B11D0-00,B11D1-00,B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="570" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="1710" top="764" right="1810" bottom="796"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="13" name="DEP110" type="8" flags="97"/>
</Activity>
<Activity id="571" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="2190" top="704" right="2290" bottom="736"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B11E5-00,B11E6-00,U0208-00,U2204-00,U2251-00,U2452-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="573" ActivityType="4" flags="0" name="路由节点">
<Rect left="2064" top="704" right="2096" bottom="736"/>
</Activity>
<Activity id="575" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="2030" top="764" right="2130" bottom="796"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="16" name="DEP116" type="8" flags="97"/>
</Activity>
<Activity id="577" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="2350" top="764" right="2450" bottom="796"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP122" type="8" flags="97"/>
</Activity>
<Activity id="578" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="2350" top="704" right="2450" bottom="736"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="579" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="2830" top="764" right="2930" bottom="796"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP128" type="8" flags="97"/>
</Activity>
<Activity id="580" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="2830" top="704" right="2930" bottom="736"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="581" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="704" right="3376" bottom="736"/>
</Activity>
<Activity id="582" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="824" right="3376" bottom="856"/>
</Activity>
<Activity id="584" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="3310" top="884" right="3410" bottom="916"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_SAS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP82" type="8" flags="97"/>
</Activity>
<Activity id="585" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="3470" top="764" right="3570" bottom="796"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{C11F5-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="586" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="3470" top="824" right="3570" bottom="856"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{C11F5-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="587" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="764" right="3376" bottom="796"/>
</Activity>
<Activity id="588" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="3763" top="614" right="3863" bottom="646"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1407-06,B14D6-06,U2950-00,U2951-00,B14D7-06,U0100-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="589" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="3668" top="732" right="3768" bottom="764"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_AFS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="74" name="DEP131" type="8" flags="97"/>
</Activity>
<Activity id="590" ActivityType="4" flags="0" name="路由节点">
<Rect left="3704" top="613" right="3736" bottom="645"/>
</Activity>
<Activity id="591" ActivityType="4" flags="0" name="路由节点">
<Rect left="3703" top="680" right="3735" bottom="712"/>
</Activity>
<Activity id="592" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4138" top="675" right="4238" bottom="707"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0199-00,U10A0-00,U0200-00,U0201-00,U0202-00,B1014-00,B1017-00,B100E-00,B1011-00,B1002-00,B1005-00,B101A-00,B101D-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="593" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="4041" top="784" right="4141" bottom="816"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_BCM1&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP132" type="8" flags="97"/>
</Activity>
<Activity id="594" ActivityType="4" flags="0" name="路由节点">
<Rect left="4076" top="674" right="4108" bottom="706"/>
</Activity>
<Activity id="595" ActivityType="4" flags="0" name="路由节点">
<Rect left="4075" top="724" right="4107" bottom="756"/>
</Activity>
<Activity id="596" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4547" top="609" right="4647" bottom="641"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0199-00,U0200-00,U0201-00,U0202-00,B104E-00,B1051-00,B105B-00,B105C-00,B103F-00,B1042-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="597" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4547" top="660" right="4647" bottom="692"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B106D-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="598" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4546" top="707" right="4646" bottom="739"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B106D-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="599" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="4438" top="802" right="4538" bottom="834"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_BCM2&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="37" name="DEP133" type="8" flags="97"/>
</Activity>
<Activity id="600" ActivityType="4" flags="0" name="路由节点">
<Rect left="4473" top="608" right="4505" bottom="640"/>
</Activity>
<Activity id="601" ActivityType="4" flags="0" name="路由节点">
<Rect left="4473" top="661" right="4505" bottom="693"/>
</Activity>
<Activity id="602" ActivityType="4" flags="0" name="路由节点">
<Rect left="4473" top="708" right="4505" bottom="740"/>
</Activity>
<Activity id="603" ActivityType="4" flags="0" name="路由节点">
<Rect left="4473" top="755" right="4505" bottom="787"/>
</Activity>
<Activity id="604" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4911" top="650" right="5011" bottom="682"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1CC0-00,P1BBB-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="605" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4916" top="701" right="5016" bottom="733"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1BBA-00,P1BBB-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="606" ActivityType="4" flags="0" name="路由节点">
<Rect left="4855" top="649" right="4887" bottom="681"/>
</Activity>
<Activity id="607" ActivityType="4" flags="0" name="路由节点">
<Rect left="4856" top="700" right="4888" bottom="732"/>
</Activity>
<Activity id="608" ActivityType="4" flags="0" name="路由节点">
<Rect left="4855" top="751" right="4887" bottom="783"/>
</Activity>
<Activity id="609" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="4820" top="800" right="4920" bottom="832"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_CLUSTER&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="32" name="DEP134" type="8" flags="97"/>
</Activity>
<Activity id="610" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5302" top="771" right="5402" bottom="803"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B0001-13,B0002-13,B0004-13,B0013-13,B0095-31,B0096-31,B0090-31,B0091-31,B00DF-11,B0020-13,B0028-13,B0020-1A,B0028-1A,U0100-87}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="611" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5307" top="824" right="5407" bottom="856"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B0020-13,B0028-13,B0001-13,B0002-13}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="612" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="5203" top="932" right="5303" bottom="964"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_AIRBAG&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="35" name="DEP135" type="8" flags="97"/>
</Activity>
<Activity id="613" ActivityType="4" flags="0" name="路由节点">
<Rect left="5237" top="769" right="5269" bottom="801"/>
</Activity>
<Activity id="614" ActivityType="4" flags="0" name="路由节点">
<Rect left="5237" top="824" right="5269" bottom="856"/>
</Activity>
<Activity id="615" ActivityType="4" flags="0" name="路由节点">
<Rect left="5236" top="876" right="5268" bottom="908"/>
</Activity>
<Activity id="616" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5641" top="682" right="5741" bottom="714"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B118C-00,B118E-00,B1194-00,B1193-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="617" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5646" top="729" right="5746" bottom="761"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B118C-00,B118E-00,U2158-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="618" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="5542" top="826" right="5642" bottom="858"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_ARMREST&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="40" name="DEP1072" type="8" flags="97"/>
</Activity>
<Activity id="619" ActivityType="4" flags="0" name="路由节点">
<Rect left="5577" top="730" right="5609" bottom="762"/>
</Activity>
<Activity id="620" ActivityType="4" flags="0" name="路由节点">
<Rect left="5577" top="778" right="5609" bottom="810"/>
</Activity>
<Activity id="621" ActivityType="4" flags="0" name="路由节点">
<Rect left="6425" top="628" right="6457" bottom="660"/>
</Activity>
<Activity id="622" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6482" top="628" right="6582" bottom="660"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{C10DB-00,C10DC-00,C10CD-00,U0A04-00,C10DD-00,U0A01-00,U0104-00,U0A03-00,C10DF-00,U0A02-00,U0A07-00,U0100-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="623" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6479" top="676" right="6579" bottom="708"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0A01-00,U0A03-00,C10DF-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="624" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="6395" top="785" right="6495" bottom="817"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EPB&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="44" name="DEP88" type="8" flags="97"/>
</Activity>
<Activity id="625" ActivityType="4" flags="0" name="路由节点">
<Rect left="6424" top="678" right="6456" bottom="710"/>
</Activity>
<Activity id="626" ActivityType="4" flags="0" name="路由节点">
<Rect left="6425" top="738" right="6457" bottom="770"/>
</Activity>
<Activity id="627" ActivityType="4" flags="0" name="路由节点">
<Rect left="6797" top="612" right="6829" bottom="644"/>
</Activity>
<Activity id="628" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6860" top="613" right="6960" bottom="645"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1E53-97,P1E54-54,U1D52-87,U1D58-81,U1D59-81,U1D5A-81,U1D5B-81,U1D56-81,U1D53-81}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="629" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6859" top="666" right="6959" bottom="698"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1E54-54}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="630" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="6761" top="769" right="6861" bottom="801"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_LDW&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="47" name="DEP15" type="8" flags="97"/>
</Activity>
<Activity id="631" ActivityType="4" flags="0" name="路由节点">
<Rect left="6797" top="665" right="6829" bottom="697"/>
</Activity>
<Activity id="632" ActivityType="4" flags="0" name="路由节点">
<Rect left="6796" top="719" right="6828" bottom="751"/>
</Activity>
<Activity id="633" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="7354" top="713" right="7454" bottom="745"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1565-38,P0118-17,P1010-00,P1610-00,P1612-00,P0122-16,P0222-16,P0122-08,P0222-08,P0238-00,P0118-F8,P1565-00,P1565-08,P0238-17,P1614-81,P0073-17,P0072-16,P0193-00,P0480-00,P0030-00,U0415-00,P0222-00,P0123-00,P0078-00,P0075-00,P0237-00,P0107-00,P2100-00,P0118-00,P0110-00,P2123-00,U0001-00,P0036-00,P0001-00,P0700-00,U0104-00,U0110-00,P258B-00,P2185-00,P240A-00,P1551-00,P0108-00,P24BD-00,P0444-00,P0500-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="634" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="7247" top="873" right="7347" bottom="905"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EMS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="49" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="635" ActivityType="4" flags="0" name="路由节点">
<Rect left="7281" top="713" right="7313" bottom="745"/>
</Activity>
<Activity id="636" ActivityType="4" flags="0" name="路由节点">
<Rect left="7280" top="769" right="7312" bottom="801"/>
</Activity>
<Activity id="637" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="7740" top="601" right="7840" bottom="633"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P0974-00,P0983-00,P0962-00,P2764-00,P0970-00,P0966-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="638" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="7634" top="708" right="7734" bottom="740"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_AT&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="52" name="DEP149" type="8" flags="97"/>
</Activity>
<Activity id="639" ActivityType="4" flags="0" name="路由节点">
<Rect left="7669" top="600" right="7701" bottom="632"/>
</Activity>
<Activity id="640" ActivityType="4" flags="0" name="路由节点">
<Rect left="7668" top="656" right="7700" bottom="688"/>
</Activity>
<Activity id="641" ActivityType="4" flags="0" name="路由节点">
<Rect left="8024" top="637" right="8056" bottom="669"/>
</Activity>
<Activity id="642" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8091" top="637" right="8191" bottom="669"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1C22-00,P099D-00,P099A-00,P0997-00,P0984-00,P0981-00,P0978-00,P0822-00,P2766-00,P0716-00,P2793-00,P0721-00,P1C67-00,P1C65-00,P1C63-00,P1C61-00,P0847-00,P0842-00,P1C5C-00,P1C58-00,P1C25-00,P0713-00,P1C94-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="643" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8092" top="690" right="8192" bottom="722"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{P1E54-54}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="644" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="7985" top="789" right="8085" bottom="821"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCT&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="55" name="DEP153" type="8" flags="97"/>
</Activity>
<Activity id="645" ActivityType="4" flags="0" name="路由节点">
<Rect left="8023" top="691" right="8055" bottom="723"/>
</Activity>
<Activity id="646" ActivityType="4" flags="0" name="路由节点">
<Rect left="8022" top="743" right="8054" bottom="775"/>
</Activity>
<Activity id="647" ActivityType="4" flags="0" name="路由节点">
<Rect left="5944" top="584" right="5976" bottom="616"/>
</Activity>
<Activity id="648" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6010" top="584" right="6110" bottom="616"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U1606-08,U0101-08,U0100-08,U1607-08,U1608-08,U0126-08,U1605-04,C10A8-00,C1066-00,C1012-08,C10A9-00,C0032-00,C10AA-00,C0035-00,C10AB-00,C0038-00,C10AC-00,C003B-00,U0594-08,U0100-04,U1611-04}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="649" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6010" top="634" right="6110" bottom="666"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0126-08,C1066-00,U1608-08,C10A8-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="650" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="5910" top="764" right="6010" bottom="796"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_ESP&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="58" name="DEP148" type="8" flags="97"/>
</Activity>
<Activity id="651" ActivityType="4" flags="0" name="路由节点">
<Rect left="5944" top="634" right="5976" bottom="666"/>
</Activity>
<Activity id="652" ActivityType="4" flags="0" name="路由节点">
<Rect left="5944" top="694" right="5976" bottom="726"/>
</Activity>
<Activity id="653" ActivityType="4" flags="0" name="路由节点">
<Rect left="8403" top="616" right="8435" bottom="648"/>
</Activity>
<Activity id="654" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8458" top="617" right="8558" bottom="649"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U1A53-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="656" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="8374" top="713" right="8474" bottom="745"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EHPS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="60" name="DEP156" type="8" flags="97"/>
</Activity>
<Activity id="658" ActivityType="4" flags="0" name="路由节点">
<Rect left="8404" top="667" right="8436" bottom="699"/>
</Activity>
<Activity id="659" ActivityType="4" flags="0" name="路由节点">
<Rect left="8817" top="566" right="8849" bottom="598"/>
</Activity>
<Activity id="660" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8871" top="566" right="8971" bottom="598"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U1A53-00,U0199-87,U0200-87,U0201-87,U0202-87,U29E1-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="661" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="8781" top="670" right="8881" bottom="702"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_PLGM&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="70" name="DEP202" type="8" flags="97"/>
</Activity>
<Activity id="662" ActivityType="4" flags="0" name="路由节点">
<Rect left="8816" top="622" right="8848" bottom="654"/>
</Activity>
<Activity id="663" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9188" top="620" right="9288" bottom="652"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U1A53-00,U0199-87,U0200-87,U0201-87,U0202-87,U29E1-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="664" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="9188" top="755" right="9288" bottom="787"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_SCM&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="68" name="DEP208" type="8" flags="97"/>
</Activity>
<Activity id="665" ActivityType="4" flags="0" name="路由节点">
<Rect left="9654" top="695" right="9686" bottom="727"/>
</Activity>
<Activity id="666" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9715" top="695" right="9815" bottom="727"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B12B8-00,B12B9-00,B12BA-00,B12BB-00,B12BC-00,B12BD-00,B12BE-00,B12BF-00,U0257-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="667" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="9621" top="752" right="9721" bottom="784"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_PDC&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="62" name="DEP76" type="8" flags="97"/>
</Activity>
<Activity id="669" ActivityType="4" flags="0" name="路由节点">
<Rect left="10097" top="628" right="10129" bottom="660"/>
</Activity>
<Activity id="670" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10161" top="630" right="10261" bottom="662"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B109A-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="671" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="10065" top="783" right="10165" bottom="815"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DSCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="64" name="DEP160" type="8" flags="97"/>
</Activity>
<Activity id="672" ActivityType="4" flags="0" name="路由节点">
<Rect left="10097" top="679" right="10129" bottom="711"/>
</Activity>
<Activity id="673" ActivityType="4" flags="0" name="路由节点">
<Rect left="10511" top="629" right="10543" bottom="661"/>
</Activity>
<Activity id="674" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10576" top="629" right="10676" bottom="661"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1282-15,B1290-15,U0100-87}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="675" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="10479" top="728" right="10579" bottom="760"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_AIRCO&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="66" name="DEP163" type="8" flags="97"/>
</Activity>
<Activity id="676" ActivityType="4" flags="0" name="路由节点">
<Rect left="10511" top="680" right="10543" bottom="712"/>
</Activity>
<Activity id="678" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10872" top="576" right="10972" bottom="608"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="680" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="11213" top="565" right="11313" bottom="597"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="681" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="11213" top="625" right="11313" bottom="657"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DCDC&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="67" name="DEP881" type="8" flags="97"/>
</Activity>
<Activity id="682" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="11551" top="567" right="11651" bottom="599"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="683" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="11551" top="625" right="11651" bottom="657"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_BMS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="90" name="DEP882" type="8" flags="97"/>
</Activity>
<Activity id="684" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="11984" top="570" right="12084" bottom="602"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="685" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="11988" top="622" right="12088" bottom="654"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_OilPump&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="91" name="DEP886" type="8" flags="97"/>
</Activity>
<Activity id="686" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="12481" top="568" right="12581" bottom="600"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="687" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="12498" top="853" right="12598" bottom="885"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_HCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="92" name="DEP884" type="8" flags="97"/>
</Activity>
<Activity id="688" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="12941" top="550" right="13041" bottom="582"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="689" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="12942" top="600" right="13042" bottom="632"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_Charger&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="93" name="DEP885" type="8" flags="97"/>
</Activity>
<Activity id="690" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="13312" top="546" right="13412" bottom="578"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="691" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="13311" top="596" right="13411" bottom="628"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_MCU&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="94" name="DEP883" type="8" flags="97"/>
</Activity>
<Activity id="692" ActivityType="3" flags="0" name="普通节点">
<Rect left="15499" top="476" right="15599" bottom="508"/>
<Script></Script></Activity>
<Activity id="693" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="13722" top="544" right="13822" bottom="576"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="694" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="13745" top="820" right="13845" bottom="852"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_BSD&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="95" name="DEP887" type="8" flags="97"/>
</Activity>
<Activity id="695" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="270" top="644" right="370" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="698" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="750" top="644" right="850" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="700" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="1710" top="644" right="1810" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="701" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="2030" top="644" right="2130" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="702" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="3310" top="644" right="3410" bottom="676"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="703" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="3671" top="555" right="3771" bottom="587"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="704" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4043" top="620" right="4143" bottom="652"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="705" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4440" top="555" right="4540" bottom="587"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="706" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5203" top="635" right="5303" bottom="667"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="707" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5544" top="579" right="5644" bottom="611"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="708" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6390" top="571" right="6490" bottom="603"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="709" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6762" top="545" right="6862" bottom="577"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="710" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="7246" top="653" right="7346" bottom="685"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="711" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="7634" top="548" right="7734" bottom="580"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="712" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8029" top="556" right="8129" bottom="588"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="713" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5910" top="524" right="6010" bottom="556"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="714" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8370" top="550" right="8470" bottom="582"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="715" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="8784" top="509" right="8884" bottom="541"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="716" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9620" top="588" right="9720" bottom="620"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="717" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10064" top="577" right="10164" bottom="609"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="718" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10476" top="573" right="10576" bottom="605"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="720" ActivityType="3" flags="0" name="普通节点">
<Rect left="5547" top="461" right="5647" bottom="493"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
</Script></Activity>
<Activity id="722" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9620" top="640" right="9720" bottom="672"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B12C4-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="收集故障码">
<Rect left="110" top="464" right="210" bottom="496"/>
<Line1Text Enable="1" Text="EOL设备读故障码"/>
<Line2Text Enable="1" Text="ECU正在收集故障码"/>
<Line3Text Enable="1" Text="请耐心等待30秒!"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for i=30,0,-1 do
   engine.SetLineText(3,tostring(i));
   i=i-1;
#DELAY 1000
end   </Script></Activity>
<Activity id="724" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5544" top="633" right="5644" bottom="665"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U2153-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="725" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9189" top="565" right="9289" bottom="597"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="727" ActivityType="4" flags="0" name="路由节点">
<Rect left="144" top="224" right="176" bottom="256"/>
</Activity>
<Activity id="728" ActivityType="3" flags="0" name="普通节点">
<Rect left="9579" top="467" right="9679" bottom="499"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
engine.Delay(200)
</Script></Activity>
<Activity id="729" ActivityType="3" flags="0" name="普通节点">
<Rect left="4827" top="482" right="4927" bottom="514"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
</Script></Activity>
<Activity id="730" ActivityType="3" flags="0" name="普通节点">
<Rect left="4015" top="491" right="4115" bottom="523"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
</Script></Activity>
<Activity id="731" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="4820" top="591" right="4920" bottom="623"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="732" ActivityType="3" flags="0" name="切诊断">
<Rect left="14426" top="424" right="14526" bottom="456"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Script>#COMM 0x10 0x01
if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end</Script></Activity>
<Activity id="733" ActivityType="3" flags="0" name="读DTC">
<Rect left="14427" top="479" right="14527" bottom="511"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
if(@0 == 0x59)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="131" name="DEP1190" type="8" flags="97"/>
</Activity>
<Activity id="734" ActivityType="3" flags="0" name="通讯失败">
<Rect left="14554" top="363" right="14654" bottom="395"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="54" name="DEP1187" type="8" flags="97"/>
</Activity>
<Activity id="735" ActivityType="3" flags="0" name="TBOX">
<Rect left="14427" top="310" right="14527" bottom="342"/>
<TitleText Enable="1" Text="TBOX（TBOX）"/>
<Script></Script></Activity>
<Activity id="737" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14294" top="553" right="14394" bottom="585"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="738" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="14294" top="687" right="14394" bottom="719"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_TBOX&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="140" name="DEP1190" type="8" flags="97"/>
</Activity>
<Activity id="739" ActivityType="4" flags="0" name="路由节点">
<Rect left="15502" top="236" right="15534" bottom="268"/>
</Activity>
<Activity id="740" ActivityType="3" flags="0" name="结束清空">
<Rect left="14554" top="686" right="14654" bottom="718"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="741" ActivityType="5" flags="0" name="TBOX通讯">
<Rect left="14427" top="364" right="14527" bottom="396"/>
<SubProcesses>
<SubProcess id="TBOX_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="742" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14400" top="612" right="14500" bottom="644"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0111-87,U0110-87}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="743" ActivityType="4" flags="0" name="路由节点">
<Rect left="14328" top="611" right="14360" bottom="643"/>
</Activity>
<Activity id="744" ActivityType="3" flags="0" name="请下电">
<Rect left="110" top="284" right="210" bottom="316"/>
<TitleText Enable="1"/>
<Line1Text Enable="1" Text="请下电"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON

#STOPCOMM
</Script></Activity>
<Activity id="745" ActivityType="3" flags="0" name="等待10秒">
<Rect left="110" top="344" right="210" bottom="376"/>
<Line1Text Enable="1" Text="10秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=10,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="746" ActivityType="3" flags="0" name="请上电">
<Rect left="110" top="404" right="210" bottom="436"/>
<Line1Text Enable="1" Text="请上电"/>
<Line2Text Enable="1" Text="#L=确定？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="748" ActivityType="3" flags="0" name="清除四行">
<Rect left="110" top="524" right="210" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="749" ActivityType="3" flags="0" name="清DTC">
<Rect left="13315" top="421" right="13415" bottom="453"/>
<Line1Text Enable="1" Text="清除故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="200" name="DEP804" type="8" flags="97"/>
</Activity>
<Activity id="750" ActivityType="3" flags="0" name="延时500ms">
<Rect left="13315" top="475" right="13415" bottom="507"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="751" ActivityType="4" flags="0" name="路由节点">
<Rect left="13547" top="422" right="13579" bottom="454"/>
</Activity>
<Activity id="752" ActivityType="4" flags="0" name="路由节点">
<Rect left="4146" top="495" right="4178" bottom="527"/>
</Activity>
<Activity id="753" ActivityType="4" flags="0" name="路由节点">
<Rect left="4944" top="483" right="4976" bottom="515"/>
</Activity>
<Activity id="754" ActivityType="4" flags="0" name="路由节点">
<Rect left="5659" top="461" right="5691" bottom="493"/>
</Activity>
<Activity id="755" ActivityType="4" flags="0" name="路由节点">
<Rect left="9715" top="471" right="9747" bottom="503"/>
</Activity>
<Activity id="756" ActivityType="4" flags="0" name="路由节点">
<Rect left="10190" top="455" right="10222" bottom="487"/>
</Activity>
<Activity id="757" ActivityType="4" flags="0" name="路由节点">
<Rect left="12514" top="673" right="12546" bottom="705"/>
</Activity>
<Activity id="758" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="12589" top="673" right="12689" bottom="705"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="759" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="7136" top="822" right="7236" bottom="854"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EMS_CONTI&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="49" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="760" ActivityType="3" flags="0" name="大陆故障码">
<Rect left="7136" top="768" right="7236" bottom="800"/>
<Script></Script></Activity>
<Activity id="761" ActivityType="3" flags="0" name="非大陆故障码">
<Rect left="7247" top="821" right="7347" bottom="853"/>
<Script></Script></Activity>
<Activity id="762" ActivityType="4" flags="0" name="路由节点">
<Rect left="7281" top="927" right="7313" bottom="959"/>
</Activity>
<Activity id="765" ActivityType="4" flags="0" name="路由节点">
<Rect left="6393" top="235" right="6425" bottom="267"/>
</Activity>
<Activity id="766" ActivityType="4" flags="0" name="路由节点">
<Rect left="5239" top="426" right="5271" bottom="458"/>
</Activity>
<Activity id="769" ActivityType="3" flags="0" name="1.8T后续车型写F1A1">
<Rect left="5204" top="477" right="5304" bottom="509"/>
<Script>if(DString_C131_Car_Tpye=="CH1GM11" or
   DString_C131_Car_Tpye=="CH1GM12" or
   DString_C131_Car_Tpye=="CH1LM11" or
   DString_C131_Car_Tpye=="CH1LM21" or
   DString_C131_Car_Tpye=="CH1MM21" or
   DString_C131_Car_Tpye=="CH1GM21" or
   DString_C131_Car_Tpye=="CH1GM22" or
   DString_C131_Car_Tpye=="CH1AM41" or
   DString_C131_Car_Tpye=="CH1AM42" or
   DString_C131_Car_Tpye=="CH1DM14" or
   DString_C131_Car_Tpye=="CH1DM15" or
   DString_C131_Car_Tpye=="CH1FM12" or
   DString_C131_Car_Tpye=="CH1FM13" or
   DString_C131_Car_Tpye=="CH1CM28" or
   DString_C131_Car_Tpye=="CH1CM29" or
   DString_C131_Car_Tpye=="CH1JM11" or
   DString_C131_Car_Tpye=="CH1BM33" or
      
   DString_C131_Car_Tpye=="CH1LM13" or
   DString_C131_Car_Tpye=="CH1LM23" or
   DString_C131_Car_Tpye=="CH1GM30" or
   DString_C131_Car_Tpye=="CH1GM23" or
   DString_C131_Car_Tpye=="CH1AM43" or
   DString_C131_Car_Tpye=="CH1AM44" or
   DString_C131_Car_Tpye=="CH1DM16" or
   DString_C131_Car_Tpye=="CH1DM17" or
   DString_C131_Car_Tpye=="CH1FM20" or
   DString_C131_Car_Tpye=="CH1FM30" or
   DString_C131_Car_Tpye=="CH1CM31" or
   DString_C131_Car_Tpye=="CH1CM30" or
   DString_C131_Car_Tpye=="CH1JM12" or
   DString_C131_Car_Tpye=="CH1BM34" or
   DString_C131_Car_Tpye=="CH1NM11" or
   LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye) or 
   LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) or
   LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))
then
    Write_VariCoding="2EF1A1";
else
    Write_VariCoding="2E0100";
end</Script></Activity>
<Activity id="770" ActivityType="3" flags="0" name="检查配置码">
<Rect left="5092" top="475" right="5192" bottom="507"/>
<Line1Text Enable="1" Text="检查配置码"/>
<Script>engine.Delay(50)
#COMM 0x22 0xF1 0xA1
if(@0==0x62)then
  DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
  engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
  engine.println(DString_C131_VariCoding_SDM);
if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding_SDM)) then
  engine.LastError = 0;
  engine.SetLineText(2,"比对配置码成功");
  engine.println("比对配置码成功");
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对配置码失败");
  engine.println("比对配置码失败");
end
engine.StatValue= DString_Read_Config_Code_From_ECU;
engine.StatPoint=DString_C131_VariCoding_SDM;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="300" name="DEP1237" type="8" flags="97"/>
</Activity>
<Activity id="771" ActivityType="3" flags="0" name="检查配置码">
<Rect left="5204" top="523" right="5304" bottom="555"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>engine.Delay(50)
#COMM 0x22 0x01 0x00
if(@0==0x62)then
  DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
  engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
  engine.println(DString_C131_VariCoding_SDM);
if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding_SDM)) then
  engine.LastError = 0;
  engine.SetLineText(2,"比对配置码成功");
  engine.println("比对配置码成功");
else
  engine.LastError = 1;
  engine.TestResult = 1;
  engine.SetLineText(2,"比对配置码失败");
  engine.println("比对配置码失败");
end
engine.StatValue= DString_Read_Config_Code_From_ECU;
engine.StatPoint=DString_C131_VariCoding_SDM;

else
  engine.LastError = 1;
  engine.TestResult = 1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="301" name="DEP1237" type="8" flags="97"/>
</Activity>
<Activity id="772" ActivityType="4" flags="0" name="路由节点">
<Rect left="5237" top="577" right="5269" bottom="609"/>
</Activity>
<Activity id="773" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="12591" top="628" right="12691" bottom="660"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="774" ActivityType="4" flags="0" name="路由节点">
<Rect left="12515" top="628" right="12547" bottom="660"/>
</Activity>
<Activity id="775" ActivityType="3" flags="0" name="普通节点">
<Rect left="12369" top="505" right="12469" bottom="537"/>
<Script></Script></Activity>
<Activity id="776" ActivityType="4" flags="0" name="路由节点">
<Rect left="12425" top="440" right="12457" bottom="472"/>
</Activity>
<Activity id="777" ActivityType="3" flags="0" name="读DTC">
<Rect left="910" top="644" right="1010" bottom="676"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>--#COMM 0x19 0x02 0x0C
#COMM 0x19 0x02 0x09
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="98" name="DEP94" type="8" flags="97"/>
</Activity>
<Activity id="778" ActivityType="3" flags="0" name="清DTC">
<Rect left="5125" top="426" right="5225" bottom="458"/>
<Line1Text Enable="1" Text="清DTC"/>
<Script>engine.Delay(50)
#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="59" name="DEP70" type="8" flags="97"/>
</Activity>
<Activity id="779" ActivityType="3" flags="0" name="清DTC">
<Rect left="7250" top="487" right="7350" bottom="519"/>
<Line1Text Enable="1" Text="EMS清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="150" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="780" ActivityType="3" flags="0" name="延时300MS">
<Rect left="7330" top="538" right="7430" bottom="570"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="781" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="7247" top="1043" right="7347" bottom="1075"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1565-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="782" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="7248" top="1100" right="7348" bottom="1132"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1579-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="783" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="7249" top="1160" right="7349" bottom="1192"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1564-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="786" ActivityType="4" flags="0" name="路由节点">
<Rect left="7283" top="1217" right="7315" bottom="1249"/>
</Activity>
<Activity id="787" ActivityType="3" flags="0" name="普通节点">
<Rect left="7244" top="1482" right="7344" bottom="1514"/>
<Script></Script></Activity>
<Activity id="788" ActivityType="4" flags="0" name="路由节点">
<Rect left="7382" top="1042" right="7414" bottom="1074"/>
</Activity>
<Activity id="789" ActivityType="4" flags="0" name="路由节点">
<Rect left="7382" top="1099" right="7414" bottom="1131"/>
</Activity>
<Activity id="790" ActivityType="4" flags="0" name="路由节点">
<Rect left="7382" top="1159" right="7414" bottom="1191"/>
</Activity>
<Activity id="791" ActivityType="5" flags="0" name="C131_EMS_DVE_Learn">
<Rect left="7439" top="1209" right="7539" bottom="1241"/>
<SubProcesses>
<SubProcess id="C131_EMS_DVE_Learn">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="792" ActivityType="3" flags="0" name="自学习失败">
<Rect left="7439" top="1159" right="7539" bottom="1191"/>
<Line1Text Enable="1" Text="电子节气门自学习失败"/>
<Script>--#DELAY 1000
engine.LastError = 1;
engine.TestResult = 1;

engine.println("EMS电子节气门自学习失败");</Script><assessment no="155" name="DEP1241" type="8" flags="97"/>
</Activity>
<Activity id="793" ActivityType="3" flags="0" name="自学习成功">
<Rect left="7248" top="1269" right="7348" bottom="1301"/>
<Line1Text Enable="1" Text="电子节气门自学习成功"/>
<Script>--#DELAY 1000
engine.LastError = 0;

engine.println("EMS电子节气门自学习成功");</Script><assessment no="156" name="DEP1242" type="8" flags="97"/>
</Activity>
<Activity id="794" ActivityType="4" flags="0" name="路由节点">
<Rect left="7566" top="1270" right="7598" bottom="1302"/>
</Activity>
<Activity id="795" ActivityType="3" flags="0" name="DVE自学习">
<Rect left="7246" top="990" right="7346" bottom="1022"/>
<Script></Script></Activity>
<Activity id="796" ActivityType="4" flags="0" name="路由节点">
<Rect left="7171" top="922" right="7203" bottom="954"/>
</Activity>
<Activity id="797" ActivityType="3" flags="0" name="DVE再次学习">
<Rect left="270" top="164" right="370" bottom="196"/>
<Line1Text Enable="1" Text="等待20秒再读取故障码"/>
<Line2Text Enable="1" Text="请耐心等待20秒!"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for i=20,0,-1 do
   engine.SetLineText(2,tostring(i));
   i=i-1;
#DELAY 1000
end   </Script></Activity>
<Activity id="800" ActivityType="4" flags="0" name="路由节点">
<Rect left="304" top="104" right="336" bottom="136"/>
</Activity>
<Activity id="801" ActivityType="4" flags="0" name="路由节点">
<Rect left="9222" top="689" right="9254" bottom="721"/>
</Activity>
<Activity id="802" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="9276" top="689" right="9376" bottom="721"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0208-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="803" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="10869" top="797" right="10969" bottom="829"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_4WD&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="96" name="DEP880" type="8" flags="97"/>
</Activity>
<Activity id="804" ActivityType="4" flags="0" name="路由节点">
<Rect left="10893" top="634" right="10925" bottom="666"/>
</Activity>
<Activity id="805" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10965" top="637" right="11065" bottom="669"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0401-81,U0424-81,U0416-81}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="806" ActivityType="4" flags="0" name="路由节点">
<Rect left="10889" top="682" right="10921" bottom="714"/>
</Activity>
<Activity id="807" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="5203" top="712" right="5303" bottom="744"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B0004-13,B0013-13}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="808" ActivityType="4" flags="0" name="路由节点">
<Rect left="5326" top="712" right="5358" bottom="744"/>
</Activity>
<Activity id="809" ActivityType="3" flags="0" name="切诊断">
<Rect left="14940" top="424" right="15040" bottom="456"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="15"/>
<Script>#COMM 0x10 0x01
if(@0 == 0x50)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end</Script></Activity>
<Activity id="810" ActivityType="3" flags="0" name="读DTC">
<Rect left="14941" top="479" right="15041" bottom="511"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x09
if(@0 == 0x59)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="142" name="DEP1278" type="8" flags="97"/>
</Activity>
<Activity id="811" ActivityType="3" flags="0" name="通讯失败">
<Rect left="15068" top="363" right="15168" bottom="395"/>
<Script>engine.LastError = 1;
engine.TestResult = 1;</Script><assessment no="141" name="DEP1275" type="8" flags="97"/>
</Activity>
<Activity id="812" ActivityType="3" flags="0" name="DVD">
<Rect left="14941" top="310" right="15041" bottom="342"/>
<TitleText Enable="1" Text="TBOX（TBOX）"/>
<Script></Script></Activity>
<Activity id="813" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14808" top="553" right="14908" bottom="585"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="814" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="14808" top="885" right="14908" bottom="917"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_DVD&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="143" name="DEP1278" type="8" flags="97"/>
</Activity>
<Activity id="815" ActivityType="3" flags="0" name="结束清空">
<Rect left="15068" top="886" right="15168" bottom="918"/>
<Line1Text Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="817" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14914" top="612" right="15014" bottom="644"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="818" ActivityType="4" flags="0" name="路由节点">
<Rect left="14841" top="612" right="14873" bottom="644"/>
</Activity>
<Activity id="819" ActivityType="5" flags="0" name="DVD_Comm">
<Rect left="14942" top="366" right="15042" bottom="398"/>
<SubProcesses>
<SubProcess id="DVD_Comm">
<Parameters>
<Parameter id="CommErr" ret="CommErr"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="820" ActivityType="4" flags="0" name="路由节点">
<Rect left="14801" top="235" right="14833" bottom="267"/>
</Activity>
<Activity id="821" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14917" top="684" right="15017" bottom="716"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="822" ActivityType="4" flags="0" name="路由节点">
<Rect left="14840" top="685" right="14872" bottom="717"/>
</Activity>
<Activity id="823" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14917" top="747" right="15017" bottom="779"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="824" ActivityType="4" flags="0" name="路由节点">
<Rect left="14840" top="748" right="14872" bottom="780"/>
</Activity>
<Activity id="825" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="14918" top="814" right="15018" bottom="846"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="826" ActivityType="4" flags="0" name="路由节点">
<Rect left="14841" top="815" right="14873" bottom="847"/>
</Activity>
<Activity id="830" ActivityType="4" flags="0" name="路由节点">
<Rect left="10891" top="746" right="10923" bottom="778"/>
</Activity>
<Activity id="831" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="10949" top="686" right="11049" bottom="718"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0416-81}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="836" ActivityType="4" flags="0" name="路由节点">
<Rect left="13750" top="614" right="13782" bottom="646"/>
</Activity>
<Activity id="837" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="13829" top="606" right="13929" bottom="638"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="838" ActivityType="4" flags="0" name="路由节点">
<Rect left="13746" top="662" right="13778" bottom="694"/>
</Activity>
<Activity id="839" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="13808" top="666" right="13908" bottom="698"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="840" ActivityType="4" flags="0" name="路由节点">
<Rect left="12525" top="736" right="12557" bottom="768"/>
</Activity>
<Activity id="841" ActivityType="4" flags="0" name="路由节点">
<Rect left="12529" top="801" right="12561" bottom="833"/>
</Activity>
<Activity id="842" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="12589" top="739" right="12689" bottom="771"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="843" ActivityType="4" flags="0" name="路由节点">
<Rect left="13748" top="718" right="13780" bottom="750"/>
</Activity>
<Activity id="844" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="13812" top="720" right="13912" bottom="752"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B1359-00}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="845" ActivityType="4" flags="0" name="路由节点">
<Rect left="13749" top="767" right="13781" bottom="799"/>
</Activity>
<Activity id="846" ActivityType="3" flags="0" name="清DTC">
<Rect left="430" top="584" right="530" bottom="616"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="847" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="6020" top="694" right="6120" bottom="726"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{U0126-08,U1607-08,U1605-04}&quot;"/>
</Parameters>
</FunctionRef>
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
<Variable id="CAN_SND_ID" type="3" data="0x7F0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7F1" description="CANId"/>
</Variables>
<Rect left="430" top="344" right="530" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="851" ActivityType="3" flags="0" name="通讯">
<Rect left="430" top="404" right="530" bottom="436"/>
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
<Rect left="590" top="404" right="690" bottom="436"/>
<Line1Text Enable="1" Text="GATEWAY 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="853" ActivityType="3" flags="0" name="结束通讯">
<Rect left="590" top="344" right="690" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="854" ActivityType="4" flags="0" name="路由节点">
<Rect left="464" top="464" right="496" bottom="496"/>
</Activity>
<Activity id="857" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="750" top="344" right="850" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="858" ActivityType="3" flags="0" name="通讯">
<Rect left="750" top="404" right="850" bottom="436"/>
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
<Activity id="859" ActivityType="3" flags="0" name="通讯失败">
<Rect left="910" top="404" right="1010" bottom="436"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="860" ActivityType="3" flags="0" name="结束通讯">
<Rect left="910" top="344" right="1010" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="861" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="464" right="816" bottom="496"/>
</Activity>
<Activity id="864" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="1390" top="344" right="1490" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="865" ActivityType="3" flags="0" name="通讯">
<Rect left="1390" top="404" right="1490" bottom="436"/>
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
<Activity id="866" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1550" top="404" right="1650" bottom="436"/>
<Line1Text Enable="1" Text="ACC 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="867" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1550" top="344" right="1650" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="868" ActivityType="4" flags="0" name="路由节点">
<Rect left="1424" top="464" right="1456" bottom="496"/>
</Activity>
<Activity id="871" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="1710" top="344" right="1810" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="872" ActivityType="3" flags="0" name="通讯">
<Rect left="1710" top="404" right="1810" bottom="436"/>
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
<Activity id="873" ActivityType="3" flags="0" name="通讯失败">
<Rect left="1870" top="404" right="1970" bottom="436"/>
<Line1Text Enable="1" Text="DDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="874" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1870" top="344" right="1970" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="875" ActivityType="4" flags="0" name="路由节点">
<Rect left="1744" top="464" right="1776" bottom="496"/>
</Activity>
<Activity id="878" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="2030" top="344" right="2130" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="879" ActivityType="3" flags="0" name="通讯">
<Rect left="2030" top="404" right="2130" bottom="436"/>
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
<Activity id="880" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2190" top="404" right="2290" bottom="436"/>
<Line1Text Enable="1" Text="PDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="881" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2190" top="344" right="2290" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="882" ActivityType="4" flags="0" name="路由节点">
<Rect left="2064" top="464" right="2096" bottom="496"/>
</Activity>
<Activity id="883" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="2350" top="344" right="2450" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="884" ActivityType="3" flags="0" name="通讯">
<Rect left="2350" top="404" right="2450" bottom="436"/>
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
<Activity id="885" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2510" top="404" right="2610" bottom="436"/>
<Line1Text Enable="1" Text="RLDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="886" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2510" top="344" right="2610" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="887" ActivityType="4" flags="0" name="路由节点">
<Rect left="2384" top="464" right="2416" bottom="496"/>
</Activity>
<Activity id="888" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="2830" top="404" right="2930" bottom="436"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="889" ActivityType="3" flags="0" name="通讯">
<Rect left="2830" top="464" right="2930" bottom="496"/>
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
<Activity id="890" ActivityType="3" flags="0" name="通讯失败">
<Rect left="2990" top="464" right="3090" bottom="496"/>
<Line1Text Enable="1" Text="RRDCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="891" ActivityType="3" flags="0" name="结束通讯">
<Rect left="2990" top="404" right="3090" bottom="436"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="892" ActivityType="4" flags="0" name="路由节点">
<Rect left="2864" top="524" right="2896" bottom="556"/>
</Activity>
<Activity id="894" ActivityType="3" flags="0" name="连接ECU">
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
<Rect left="3310" top="344" right="3410" bottom="376"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="895" ActivityType="3" flags="0" name="通讯">
<Rect left="3310" top="404" right="3410" bottom="436"/>
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
<Activity id="896" ActivityType="3" flags="0" name="通讯失败">
<Rect left="3470" top="404" right="3570" bottom="436"/>
<Line1Text Enable="1" Text="SAS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="897" ActivityType="3" flags="0" name="结束通讯">
<Rect left="3470" top="344" right="3570" bottom="376"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="898" ActivityType="4" flags="0" name="路由节点">
<Rect left="3344" top="464" right="3376" bottom="496"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="727" type="0">
</Transition>
<Transition StartId="35" EndId="850" type="0">
</Transition>
<Transition StartId="37" EndId="846" type="0">
</Transition>
<Transition StartId="38" EndId="45" type="4">
</Transition>
<Transition StartId="38" EndId="695" type="3">
</Transition>
<Transition StartId="45" EndId="58" type="0">
</Transition>
<Transition StartId="46" EndId="857" type="0">
</Transition>
<Transition StartId="48" EndId="698" type="3">
</Transition>
<Transition StartId="48" EndId="53" type="4">
</Transition>
<Transition StartId="52" EndId="48" type="0">
</Transition>
<Transition StartId="52" EndId="777" type="1">
<Expression>DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1HM11" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1BM33"</Expression></Transition>
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
<Transition StartId="59" EndId="864" type="0">
</Transition>
<Transition StartId="61" EndId="64" type="4">
</Transition>
<Transition StartId="61" EndId="566" type="3">
</Transition>
<Transition StartId="63" EndId="61" type="0">
</Transition>
<Transition StartId="64" EndId="75" type="0">
</Transition>
<Transition StartId="68" EndId="700" type="3">
</Transition>
<Transition StartId="68" EndId="73" type="4">
</Transition>
<Transition StartId="71" EndId="68" type="0">
</Transition>
<Transition StartId="72" EndId="871" type="0">
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
<Transition StartId="79" EndId="81" type="0">
</Transition>
<Transition StartId="80" EndId="878" type="0">
</Transition>
<Transition StartId="81" EndId="701" type="3">
</Transition>
<Transition StartId="81" EndId="85" type="4">
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
<Transition StartId="88" EndId="90" type="0">
</Transition>
<Transition StartId="89" EndId="883" type="0">
</Transition>
<Transition StartId="90" EndId="578" type="3">
</Transition>
<Transition StartId="90" EndId="94" type="4">
</Transition>
<Transition StartId="94" EndId="84" type="0">
</Transition>
<Transition StartId="96" EndId="107" type="1">
<Expression>SAS00_partnumber ~= ""</Expression></Transition>
<Transition StartId="96" EndId="105" type="0">
</Transition>
<Transition StartId="97" EndId="888" type="0">
</Transition>
<Transition StartId="99" EndId="100" type="0">
</Transition>
<Transition StartId="100" EndId="580" type="3">
</Transition>
<Transition StartId="100" EndId="103" type="4">
</Transition>
<Transition StartId="103" EndId="96" type="0">
</Transition>
<Transition StartId="105" EndId="115" type="1">
<Expression>AFS00_partnumber ~= ""</Expression></Transition>
<Transition StartId="105" EndId="122" type="0">
</Transition>
<Transition StartId="107" EndId="894" type="0">
</Transition>
<Transition StartId="109" EndId="110" type="0">
</Transition>
<Transition StartId="110" EndId="702" type="3">
</Transition>
<Transition StartId="110" EndId="113" type="4">
</Transition>
<Transition StartId="113" EndId="105" type="0">
</Transition>
<Transition StartId="115" EndId="277" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="0">
</Transition>
<Transition StartId="118" EndId="703" type="3">
</Transition>
<Transition StartId="118" EndId="120" type="4">
</Transition>
<Transition StartId="120" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="131" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="1">
<Expression>BCM10_partnumber ~= ""</Expression></Transition>
<Transition StartId="123" EndId="278" type="0">
</Transition>
<Transition StartId="125" EndId="730" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="125" EndId="752" type="0">
</Transition>
<Transition StartId="126" EndId="704" type="3">
</Transition>
<Transition StartId="126" EndId="129" type="4">
</Transition>
<Transition StartId="129" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="139" type="0">
</Transition>
<Transition StartId="131" EndId="151" type="1">
<Expression>BCM20_partnumber ~= ""</Expression></Transition>
<Transition StartId="132" EndId="280" type="0">
</Transition>
<Transition StartId="134" EndId="729" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="134" EndId="753" type="0">
</Transition>
<Transition StartId="135" EndId="731" type="3">
</Transition>
<Transition StartId="135" EndId="137" type="4">
</Transition>
<Transition StartId="137" EndId="149" type="0">
</Transition>
<Transition StartId="139" EndId="149" type="0">
</Transition>
<Transition StartId="139" EndId="132" type="1">
<Expression>IC000_partnumber ~= ""</Expression></Transition>
<Transition StartId="141" EndId="314" type="0">
</Transition>
<Transition StartId="143" EndId="144" type="0">
</Transition>
<Transition StartId="143" EndId="766" type="1">
<Expression>VMTLOC=="TR2"</Expression></Transition>
<Transition StartId="144" EndId="706" type="3">
</Transition>
<Transition StartId="144" EndId="147" type="4">
</Transition>
<Transition StartId="147" EndId="158" type="0">
</Transition>
<Transition StartId="149" EndId="141" type="1">
<Expression>SDM00_partnumber ~= ""</Expression></Transition>
<Transition StartId="149" EndId="158" type="0">
</Transition>
<Transition StartId="150" EndId="153" type="0">
</Transition>
<Transition StartId="151" EndId="279" type="0">
</Transition>
<Transition StartId="153" EndId="705" type="3">
</Transition>
<Transition StartId="153" EndId="156" type="4">
</Transition>
<Transition StartId="156" EndId="139" type="0">
</Transition>
<Transition StartId="158" EndId="168" type="0">
</Transition>
<Transition StartId="158" EndId="160" type="1">
<Expression>(RMArm_partnumber ~= "") and VMTLOC ~= "TR1" and (DString_C131_Car_Tpye ~= "CH1GM11")</Expression></Transition>
<Transition StartId="159" EndId="707" type="3">
</Transition>
<Transition StartId="159" EndId="165" type="4">
</Transition>
<Transition StartId="160" EndId="282" type="0">
</Transition>
<Transition StartId="162" EndId="720" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="162" EndId="754" type="0">
</Transition>
<Transition StartId="165" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="765" type="0">
</Transition>
<Transition StartId="168" EndId="213" type="1">
<Expression>ESP00_partnumber ~= ""</Expression></Transition>
<Transition StartId="169" EndId="283" type="0">
</Transition>
<Transition StartId="171" EndId="172" type="0">
</Transition>
<Transition StartId="172" EndId="708" type="3">
</Transition>
<Transition StartId="172" EndId="175" type="4">
</Transition>
<Transition StartId="175" EndId="177" type="0">
</Transition>
<Transition StartId="177" EndId="178" type="1">
<Expression>LDW00_partnumber ~= ""</Expression></Transition>
<Transition StartId="177" EndId="185" type="0">
</Transition>
<Transition StartId="178" EndId="284" type="0">
</Transition>
<Transition StartId="179" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="709" type="3">
</Transition>
<Transition StartId="181" EndId="183" type="4">
</Transition>
<Transition StartId="183" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="194" type="0">
</Transition>
<Transition StartId="185" EndId="188" type="1">
<Expression>EMS00_partnumber ~= "" and LibGeneral.CarTNC_19_V6(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="186" EndId="710" type="3">
</Transition>
<Transition StartId="186" EndId="192" type="4">
</Transition>
<Transition StartId="188" EndId="285" type="0">
</Transition>
<Transition StartId="189" EndId="780" type="0">
</Transition>
<Transition StartId="192" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="203" type="0">
</Transition>
<Transition StartId="194" EndId="196" type="1">
<Expression>AT000_partnumber ~= ""</Expression></Transition>
<Transition StartId="195" EndId="711" type="3">
</Transition>
<Transition StartId="195" EndId="201" type="4">
</Transition>
<Transition StartId="196" EndId="286" type="0">
</Transition>
<Transition StartId="198" EndId="195" type="0">
</Transition>
<Transition StartId="201" EndId="203" type="0">
</Transition>
<Transition StartId="203" EndId="221" type="0">
</Transition>
<Transition StartId="203" EndId="205" type="1">
<Expression>DCT00_partnumber ~= "" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="205" EndId="287" type="0">
</Transition>
<Transition StartId="206" EndId="207" type="0">
</Transition>
<Transition StartId="207" EndId="712" type="3">
</Transition>
<Transition StartId="207" EndId="210" type="4">
</Transition>
<Transition StartId="210" EndId="221" type="0">
</Transition>
<Transition StartId="213" EndId="288" type="0">
</Transition>
<Transition StartId="215" EndId="713" type="3">
</Transition>
<Transition StartId="215" EndId="219" type="4">
</Transition>
<Transition StartId="217" EndId="215" type="0">
</Transition>
<Transition StartId="219" EndId="765" type="0">
</Transition>
<Transition StartId="221" EndId="229" type="0">
</Transition>
<Transition StartId="221" EndId="222" type="1">
<Expression>EHPS0_partnumber ~= "" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="222" EndId="289" type="0">
</Transition>
<Transition StartId="224" EndId="225" type="0">
</Transition>
<Transition StartId="225" EndId="714" type="3">
</Transition>
<Transition StartId="225" EndId="227" type="4">
</Transition>
<Transition StartId="227" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="238" type="0">
</Transition>
<Transition StartId="229" EndId="231" type="1">
<Expression>(PLGM0_partnumber~="") and (PLGM0_partnumber~="PLGM0_partnumber")</Expression></Transition>
<Transition StartId="231" EndId="241" type="0">
</Transition>
<Transition StartId="233" EndId="234" type="0">
</Transition>
<Transition StartId="234" EndId="715" type="3">
</Transition>
<Transition StartId="234" EndId="236" type="4">
</Transition>
<Transition StartId="236" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="298" type="0">
</Transition>
<Transition StartId="238" EndId="290" type="1">
<Expression>SCM00_partnumber~="" and SCM00_partnumber~="SCM00_partnumber"</Expression></Transition>
<Transition StartId="241" EndId="233" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="241" EndId="338" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="244" EndId="301" type="0">
</Transition>
<Transition StartId="246" EndId="728" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="246" EndId="755" type="0">
</Transition>
<Transition StartId="247" EndId="716" type="3">
</Transition>
<Transition StartId="247" EndId="250" type="4">
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
<Transition StartId="277" EndId="117" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="277" EndId="324" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="278" EndId="125" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="278" EndId="325" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="279" EndId="150" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="279" EndId="326" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="280" EndId="134" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="280" EndId="328" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="282" EndId="162" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="282" EndId="329" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="283" EndId="171" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="283" EndId="330" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="284" EndId="179" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="284" EndId="333" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="285" EndId="189" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="285" EndId="332" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="286" EndId="198" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="286" EndId="334" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="287" EndId="206" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="287" EndId="335" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="288" EndId="217" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="288" EndId="336" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="289" EndId="224" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="289" EndId="337" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="290" EndId="299" type="0">
</Transition>
<Transition StartId="291" EndId="292" type="0">
</Transition>
<Transition StartId="292" EndId="725" type="3">
</Transition>
<Transition StartId="292" EndId="294" type="4">
</Transition>
<Transition StartId="294" EndId="298" type="0">
</Transition>
<Transition StartId="298" EndId="244" type="1">
<Expression>PDC00_partnumber ~= ""</Expression></Transition>
<Transition StartId="298" EndId="252" type="0">
</Transition>
<Transition StartId="299" EndId="291" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="299" EndId="339" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="301" EndId="246" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="301" EndId="340" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="310" EndId="552" type="1">
<Expression>(DString_C131_Car_Tpye == "CH1GM11") or (DString_C131_Car_Tpye == "CH1GM12")</Expression></Transition>
<Transition StartId="310" EndId="356" type="0">
</Transition>
<Transition StartId="313" EndId="616" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM12"</Expression></Transition>
<Transition StartId="313" EndId="619" type="0">
</Transition>
<Transition StartId="314" EndId="143" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="314" EndId="327" type="1">
<Expression>CommErr==1</Expression></Transition>
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
<Transition StartId="350" EndId="540" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="350" EndId="353" type="0">
</Transition>
<Transition StartId="351" EndId="548" type="1">
<Expression>VMTLOC == "FUN"</Expression></Transition>
<Transition StartId="351" EndId="352" type="0">
</Transition>
<Transition StartId="352" EndId="549" type="1">
<Expression>VMTLOC == "FIN"</Expression></Transition>
<Transition StartId="352" EndId="365" type="0">
</Transition>
<Transition StartId="353" EndId="541" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM12"</Expression></Transition>
<Transition StartId="353" EndId="354" type="0">
</Transition>
<Transition StartId="354" EndId="546" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="354" EndId="355" type="0">
</Transition>
<Transition StartId="355" EndId="547" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="355" EndId="351" type="0">
</Transition>
<Transition StartId="356" EndId="553" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="356" EndId="360" type="0">
</Transition>
<Transition StartId="360" EndId="361" type="0">
</Transition>
<Transition StartId="360" EndId="554" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="361" EndId="362" type="0">
</Transition>
<Transition StartId="361" EndId="560" type="1">
<Expression>VMTLOC == "FUN" and DString_C131_Model_Name=="CA7201A"</Expression></Transition>
<Transition StartId="362" EndId="367" type="0">
</Transition>
<Transition StartId="362" EndId="561" type="1">
<Expression>VMTLOC == "FIN" and DString_C131_Model_Name=="CA7201A"</Expression></Transition>
<Transition StartId="365" EndId="551" type="0">
</Transition>
<Transition StartId="367" EndId="563" type="1">
<Expression>VMTLOC == "REP" and DString_C131_Model_Name=="CA7201A"</Expression></Transition>
<Transition StartId="367" EndId="565" type="0">
</Transition>
<Transition StartId="369" EndId="569" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="369" EndId="570" type="0">
</Transition>
<Transition StartId="417" EndId="717" type="3">
</Transition>
<Transition StartId="417" EndId="421" type="4">
</Transition>
<Transition StartId="418" EndId="457" type="0">
</Transition>
<Transition StartId="419" EndId="423" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="419" EndId="756" type="0">
</Transition>
<Transition StartId="421" EndId="260" type="0">
</Transition>
<Transition StartId="423" EndId="417" type="0">
</Transition>
<Transition StartId="426" EndId="427" type="0">
</Transition>
<Transition StartId="427" EndId="718" type="3">
</Transition>
<Transition StartId="427" EndId="430" type="4">
</Transition>
<Transition StartId="429" EndId="437" type="0">
</Transition>
<Transition StartId="430" EndId="435" type="0">
</Transition>
<Transition StartId="435" EndId="452" type="1">
<Expression>FWD00_partnumber ~= "" and  FWD00_partnumber ~="FWD00_partnumber"</Expression></Transition>
<Transition StartId="435" EndId="466" type="0">
</Transition>
<Transition StartId="437" EndId="426" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="437" EndId="459" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="446" EndId="447" type="0">
</Transition>
<Transition StartId="447" EndId="678" type="3">
</Transition>
<Transition StartId="447" EndId="448" type="4">
</Transition>
<Transition StartId="448" EndId="466" type="0">
</Transition>
<Transition StartId="451" EndId="446" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="451" EndId="460" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="452" EndId="451" type="0">
</Transition>
<Transition StartId="457" EndId="419" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="457" EndId="458" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="458" EndId="421" type="0">
</Transition>
<Transition StartId="459" EndId="430" type="0">
</Transition>
<Transition StartId="460" EndId="448" type="0">
</Transition>
<Transition StartId="462" EndId="463" type="0">
</Transition>
<Transition StartId="463" EndId="680" type="3">
</Transition>
<Transition StartId="463" EndId="464" type="4">
</Transition>
<Transition StartId="464" EndId="473" type="0">
</Transition>
<Transition StartId="466" EndId="517" type="1">
<Expression>DCDC0_partnumber~= "" and  DCDC0_partnumber ~="DCDC0_partnumber" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="466" EndId="473" type="0">
</Transition>
<Transition StartId="467" EndId="462" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="467" EndId="504" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="469" EndId="470" type="0">
</Transition>
<Transition StartId="470" EndId="471" type="4">
</Transition>
<Transition StartId="470" EndId="682" type="3">
</Transition>
<Transition StartId="471" EndId="481" type="0">
</Transition>
<Transition StartId="473" EndId="518" type="1">
<Expression>BMS00_partnumber ~= "" and  BMS00_partnumber~="BMS00_partnumber"</Expression></Transition>
<Transition StartId="473" EndId="481" type="0">
</Transition>
<Transition StartId="474" EndId="469" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="474" EndId="505" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="475" EndId="477" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="475" EndId="506" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="477" EndId="478" type="0">
</Transition>
<Transition StartId="478" EndId="479" type="4">
</Transition>
<Transition StartId="478" EndId="684" type="3">
</Transition>
<Transition StartId="479" EndId="488" type="0">
</Transition>
<Transition StartId="481" EndId="520" type="1">
<Expression>Oilpump_partnumber ~= "" and  Oilpump_partnumber~="OLP00_partnumber"</Expression></Transition>
<Transition StartId="481" EndId="488" type="0">
</Transition>
<Transition StartId="484" EndId="485" type="0">
</Transition>
<Transition StartId="485" EndId="486" type="4">
</Transition>
<Transition StartId="485" EndId="686" type="3">
</Transition>
<Transition StartId="486" EndId="496" type="0">
</Transition>
<Transition StartId="488" EndId="496" type="0">
</Transition>
<Transition StartId="488" EndId="522" type="1">
<Expression>HCU00_partnumber ~= "" and  HCU00_partnumber~="HCU00_partnumber" and VMTLOC~="TR1"</Expression></Transition>
<Transition StartId="489" EndId="491" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="489" EndId="508" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="491" EndId="492" type="0">
</Transition>
<Transition StartId="492" EndId="688" type="3">
</Transition>
<Transition StartId="492" EndId="493" type="4">
</Transition>
<Transition StartId="493" EndId="503" type="0">
</Transition>
<Transition StartId="496" EndId="523" type="1">
<Expression>Charger_partnumber ~= "" and  Charger_partnumber ~="CHG00_partnumber" and VMTLOC ~= "TR1"</Expression></Transition>
<Transition StartId="496" EndId="503" type="0">
</Transition>
<Transition StartId="497" EndId="749" type="1">
<Expression>VMTLOC~="REP"</Expression></Transition>
<Transition StartId="497" EndId="751" type="0">
</Transition>
<Transition StartId="498" EndId="500" type="4">
</Transition>
<Transition StartId="498" EndId="690" type="3">
</Transition>
<Transition StartId="500" EndId="526" type="0">
</Transition>
<Transition StartId="502" EndId="497" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="502" EndId="509" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="503" EndId="525" type="1">
<Expression>MCU00_partnumber ~= "" and MCU00_partnumber~="MCU00_partnumber" and VMTLOC~="TR1"</Expression></Transition>
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
<Transition StartId="510" EndId="484" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="510" EndId="507" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="517" EndId="467" type="0">
</Transition>
<Transition StartId="518" EndId="474" type="0">
</Transition>
<Transition StartId="520" EndId="475" type="0">
</Transition>
<Transition StartId="522" EndId="510" type="0">
</Transition>
<Transition StartId="523" EndId="489" type="0">
</Transition>
<Transition StartId="525" EndId="502" type="0">
</Transition>
<Transition StartId="526" EndId="534" type="1">
<Expression>BSD00_partnumber ~= "" and  BSD00_partnumber ~="BSD00_partnumber"</Expression></Transition>
<Transition StartId="526" EndId="537" type="0">
</Transition>
<Transition StartId="527" EndId="528" type="0">
</Transition>
<Transition StartId="528" EndId="693" type="3">
</Transition>
<Transition StartId="528" EndId="530" type="4">
</Transition>
<Transition StartId="530" EndId="537" type="0">
</Transition>
<Transition StartId="533" EndId="530" type="0">
</Transition>
<Transition StartId="534" EndId="535" type="0">
</Transition>
<Transition StartId="535" EndId="527" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="535" EndId="533" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="537" EndId="820" type="0">
</Transition>
<Transition StartId="537" EndId="735" type="1">
<Expression>TBOX0_partnumber ~= "" and TBOX0_partnumber ~="TBOX0_partnumber"</Expression></Transition>
<Transition StartId="539" EndId="268" type="0">
</Transition>
<Transition StartId="540" EndId="353" type="0">
</Transition>
<Transition StartId="541" EndId="354" type="0">
</Transition>
<Transition StartId="546" EndId="355" type="0">
</Transition>
<Transition StartId="546" EndId="355" type="0">
</Transition>
<Transition StartId="547" EndId="351" type="0">
</Transition>
<Transition StartId="548" EndId="352" type="0">
</Transition>
<Transition StartId="549" EndId="365" type="0">
</Transition>
<Transition StartId="551" EndId="45" type="0">
</Transition>
<Transition StartId="552" EndId="356" type="0">
</Transition>
<Transition StartId="553" EndId="360" type="0">
</Transition>
<Transition StartId="554" EndId="555" type="1">
<Expression>DString_C131_Model_Name=="CA7201A"</Expression></Transition>
<Transition StartId="554" EndId="361" type="0">
</Transition>
<Transition StartId="555" EndId="361" type="0">
</Transition>
<Transition StartId="561" EndId="367" type="0">
</Transition>
<Transition StartId="563" EndId="565" type="0">
</Transition>
<Transition StartId="564" EndId="53" type="0">
</Transition>
<Transition StartId="565" EndId="564" type="0">
</Transition>
<Transition StartId="566" EndId="567" type="0">
</Transition>
<Transition StartId="567" EndId="64" type="0">
</Transition>
<Transition StartId="569" EndId="570" type="0">
</Transition>
<Transition StartId="570" EndId="73" type="0">
</Transition>
<Transition StartId="571" EndId="575" type="0">
</Transition>
<Transition StartId="573" EndId="571" type="1">
<Expression>DString_C131_Car_Tpye == "CH1GM11"</Expression></Transition>
<Transition StartId="573" EndId="575" type="0">
</Transition>
<Transition StartId="575" EndId="85" type="0">
</Transition>
<Transition StartId="577" EndId="94" type="0">
</Transition>
<Transition StartId="578" EndId="577" type="0">
</Transition>
<Transition StartId="579" EndId="103" type="0">
</Transition>
<Transition StartId="580" EndId="579" type="0">
</Transition>
<Transition StartId="581" EndId="585" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="581" EndId="587" type="0">
</Transition>
<Transition StartId="582" EndId="584" type="0">
</Transition>
<Transition StartId="584" EndId="113" type="0">
</Transition>
<Transition StartId="585" EndId="587" type="0">
</Transition>
<Transition StartId="586" EndId="582" type="0">
</Transition>
<Transition StartId="587" EndId="586" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="587" EndId="582" type="0">
</Transition>
<Transition StartId="588" EndId="591" type="0">
</Transition>
<Transition StartId="589" EndId="120" type="0">
</Transition>
<Transition StartId="590" EndId="588" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="590" EndId="591" type="0">
</Transition>
<Transition StartId="591" EndId="589" type="0">
</Transition>
<Transition StartId="592" EndId="595" type="0">
</Transition>
<Transition StartId="593" EndId="129" type="0">
</Transition>
<Transition StartId="594" EndId="595" type="0">
</Transition>
<Transition StartId="594" EndId="592" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="595" EndId="593" type="0">
</Transition>
<Transition StartId="596" EndId="601" type="0">
</Transition>
<Transition StartId="597" EndId="602" type="0">
</Transition>
<Transition StartId="598" EndId="603" type="0">
</Transition>
<Transition StartId="599" EndId="156" type="0">
</Transition>
<Transition StartId="600" EndId="596" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="600" EndId="601" type="0">
</Transition>
<Transition StartId="601" EndId="597" type="1">
<Expression>VMTLOC == "FUN"</Expression></Transition>
<Transition StartId="601" EndId="602" type="0">
</Transition>
<Transition StartId="602" EndId="603" type="0">
</Transition>
<Transition StartId="602" EndId="598" type="1">
<Expression>VMTLOC == "FIN"</Expression></Transition>
<Transition StartId="603" EndId="599" type="0">
</Transition>
<Transition StartId="604" EndId="607" type="0">
</Transition>
<Transition StartId="605" EndId="608" type="0">
</Transition>
<Transition StartId="606" EndId="604" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="606" EndId="607" type="0">
</Transition>
<Transition StartId="607" EndId="608" type="0">
</Transition>
<Transition StartId="607" EndId="605" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="608" EndId="609" type="0">
</Transition>
<Transition StartId="609" EndId="137" type="0">
</Transition>
<Transition StartId="610" EndId="614" type="0">
</Transition>
<Transition StartId="611" EndId="615" type="0">
</Transition>
<Transition StartId="612" EndId="147" type="0">
</Transition>
<Transition StartId="613" EndId="610" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="613" EndId="614" type="0">
</Transition>
<Transition StartId="614" EndId="611" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="614" EndId="615" type="0">
</Transition>
<Transition StartId="615" EndId="612" type="0">
</Transition>
<Transition StartId="616" EndId="619" type="0">
</Transition>
<Transition StartId="617" EndId="620" type="0">
</Transition>
<Transition StartId="618" EndId="165" type="0">
</Transition>
<Transition StartId="619" EndId="617" type="1">
<Expression>VMTLOC ~= "REP"</Expression></Transition>
<Transition StartId="619" EndId="620" type="0">
</Transition>
<Transition StartId="620" EndId="618" type="0">
</Transition>
<Transition StartId="621" EndId="622" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="621" EndId="625" type="0">
</Transition>
<Transition StartId="622" EndId="625" type="0">
</Transition>
<Transition StartId="623" EndId="626" type="0">
</Transition>
<Transition StartId="624" EndId="175" type="0">
</Transition>
<Transition StartId="625" EndId="623" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="625" EndId="626" type="0">
</Transition>
<Transition StartId="626" EndId="624" type="0">
</Transition>
<Transition StartId="627" EndId="628" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="627" EndId="631" type="0">
</Transition>
<Transition StartId="628" EndId="631" type="0">
</Transition>
<Transition StartId="629" EndId="632" type="0">
</Transition>
<Transition StartId="630" EndId="183" type="0">
</Transition>
<Transition StartId="631" EndId="632" type="0">
</Transition>
<Transition StartId="631" EndId="629" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="632" EndId="630" type="0">
</Transition>
<Transition StartId="633" EndId="636" type="0">
</Transition>
<Transition StartId="634" EndId="762" type="0">
</Transition>
<Transition StartId="635" EndId="633" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="635" EndId="636" type="0">
</Transition>
<Transition StartId="636" EndId="760" type="1">
<Expression>DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13" or DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17" or DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30") or DString_C131_Car_Tpye=="CH1MM41"</Expression></Transition>
<Transition StartId="636" EndId="761" type="0">
</Transition>
<Transition StartId="637" EndId="640" type="0">
</Transition>
<Transition StartId="638" EndId="201" type="0">
</Transition>
<Transition StartId="639" EndId="640" type="0">
</Transition>
<Transition StartId="639" EndId="637" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="640" EndId="638" type="0">
</Transition>
<Transition StartId="641" EndId="642" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="641" EndId="645" type="0">
</Transition>
<Transition StartId="642" EndId="645" type="0">
</Transition>
<Transition StartId="643" EndId="646" type="0">
</Transition>
<Transition StartId="644" EndId="210" type="0">
</Transition>
<Transition StartId="645" EndId="643" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="645" EndId="646" type="0">
</Transition>
<Transition StartId="646" EndId="644" type="0">
</Transition>
<Transition StartId="647" EndId="648" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="647" EndId="651" type="0">
</Transition>
<Transition StartId="648" EndId="651" type="0">
</Transition>
<Transition StartId="649" EndId="652" type="0">
</Transition>
<Transition StartId="650" EndId="219" type="0">
</Transition>
<Transition StartId="651" EndId="649" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="651" EndId="652" type="0">
</Transition>
<Transition StartId="652" EndId="650" type="0">
</Transition>
<Transition StartId="652" EndId="847" type="1">
<Expression>engine.WorkPlace == "FUN" and engine.CarType == "CMNA01A"</Expression></Transition>
<Transition StartId="653" EndId="658" type="0">
</Transition>
<Transition StartId="653" EndId="654" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="654" EndId="658" type="0">
</Transition>
<Transition StartId="656" EndId="227" type="0">
</Transition>
<Transition StartId="658" EndId="656" type="0">
</Transition>
<Transition StartId="659" EndId="660" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="659" EndId="662" type="0">
</Transition>
<Transition StartId="660" EndId="662" type="0">
</Transition>
<Transition StartId="661" EndId="236" type="0">
</Transition>
<Transition StartId="662" EndId="661" type="0">
</Transition>
<Transition StartId="663" EndId="801" type="0">
</Transition>
<Transition StartId="664" EndId="294" type="0">
</Transition>
<Transition StartId="665" EndId="666" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="665" EndId="667" type="0">
</Transition>
<Transition StartId="666" EndId="667" type="0">
</Transition>
<Transition StartId="667" EndId="250" type="0">
</Transition>
<Transition StartId="669" EndId="670" type="1">
<Expression>VMTLOC ~= "REP"</Expression></Transition>
<Transition StartId="669" EndId="672" type="0">
</Transition>
<Transition StartId="670" EndId="672" type="0">
</Transition>
<Transition StartId="671" EndId="421" type="0">
</Transition>
<Transition StartId="672" EndId="671" type="0">
</Transition>
<Transition StartId="673" EndId="674" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="673" EndId="676" type="0">
</Transition>
<Transition StartId="674" EndId="676" type="0">
</Transition>
<Transition StartId="675" EndId="430" type="0">
</Transition>
<Transition StartId="676" EndId="675" type="0">
</Transition>
<Transition StartId="678" EndId="804" type="0">
</Transition>
<Transition StartId="680" EndId="681" type="0">
</Transition>
<Transition StartId="681" EndId="464" type="0">
</Transition>
<Transition StartId="682" EndId="683" type="0">
</Transition>
<Transition StartId="683" EndId="471" type="0">
</Transition>
<Transition StartId="684" EndId="685" type="0">
</Transition>
<Transition StartId="685" EndId="479" type="0">
</Transition>
<Transition StartId="686" EndId="774" type="0">
</Transition>
<Transition StartId="687" EndId="486" type="0">
</Transition>
<Transition StartId="688" EndId="689" type="0">
</Transition>
<Transition StartId="689" EndId="493" type="0">
</Transition>
<Transition StartId="690" EndId="691" type="0">
</Transition>
<Transition StartId="691" EndId="500" type="0">
</Transition>
<Transition StartId="693" EndId="836" type="0">
</Transition>
<Transition StartId="694" EndId="530" type="0">
</Transition>
<Transition StartId="695" EndId="350" type="0">
</Transition>
<Transition StartId="698" EndId="310" type="0">
</Transition>
<Transition StartId="700" EndId="369" type="0">
</Transition>
<Transition StartId="701" EndId="573" type="0">
</Transition>
<Transition StartId="702" EndId="581" type="0">
</Transition>
<Transition StartId="703" EndId="590" type="0">
</Transition>
<Transition StartId="704" EndId="594" type="0">
</Transition>
<Transition StartId="705" EndId="600" type="0">
</Transition>
<Transition StartId="706" EndId="807" type="1">
<Expression>DString_C131_Car_Tpye=="CH1LM21" or DString_C131_Car_Tpye=="CH1LM11" or DString_C131_Car_Tpye=="CH1MM21" or DString_C131_Car_Tpye=="CH1GM21" or DString_C131_Car_Tpye=="CH1GM22" or DString_C131_Car_Tpye=="CH1AM41" or DString_C131_Car_Tpye=="CH1AM42" or DString_C131_Car_Tpye=="CH1HM11" or DString_C131_Car_Tpye=="CH1DM14" or DString_C131_Car_Tpye=="CH1DM15" or DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or DString_C131_Car_Tpye=="CH1CM28" or DString_C131_Car_Tpye=="CH1CM29" or DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1BM33" or DString_C131_Car_Tpye=="CH1LM23" or DString_C131_Car_Tpye=="CH1LM13" or DString_C131_Car_Tpye=="CH1GM30" or DString_C131_Car_Tpye=="CH1GM23" or DString_C131_Car_Tpye=="CH1AM43" or DString_C131_Car_Tpye=="CH1AM44" or DString_C131_Car_Tpye=="CH1DM16" or DString_C131_Car_Tpye=="CH1DM17" or DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30" or DString_C131_Car_Tpye=="CH1CM31" or DString_C131_Car_Tpye=="CH1JM12" or DString_C131_Car_Tpye=="CH1BM34" or DString_C131_Car_Tpye=="CH1BNM11"</Expression></Transition>
<Transition StartId="706" EndId="808" type="0">
</Transition>
<Transition StartId="707" EndId="724" type="0">
</Transition>
<Transition StartId="708" EndId="621" type="0">
</Transition>
<Transition StartId="709" EndId="627" type="0">
</Transition>
<Transition StartId="710" EndId="635" type="0">
</Transition>
<Transition StartId="711" EndId="639" type="0">
</Transition>
<Transition StartId="712" EndId="641" type="0">
</Transition>
<Transition StartId="713" EndId="647" type="0">
</Transition>
<Transition StartId="714" EndId="653" type="0">
</Transition>
<Transition StartId="715" EndId="659" type="0">
</Transition>
<Transition StartId="716" EndId="722" type="0">
</Transition>
<Transition StartId="717" EndId="669" type="0">
</Transition>
<Transition StartId="718" EndId="673" type="0">
</Transition>
<Transition StartId="720" EndId="159" type="0">
</Transition>
<Transition StartId="722" EndId="665" type="0">
</Transition>
<Transition StartId="723" EndId="748" type="0">
</Transition>
<Transition StartId="724" EndId="313" type="0">
</Transition>
<Transition StartId="725" EndId="663" type="0">
</Transition>
<Transition StartId="727" EndId="744" type="1">
<Expression>VMTLOC=="REP"</Expression></Transition>
<Transition StartId="727" EndId="56" type="0">
</Transition>
<Transition StartId="728" EndId="247" type="0">
</Transition>
<Transition StartId="729" EndId="135" type="0">
</Transition>
<Transition StartId="730" EndId="126" type="0">
</Transition>
<Transition StartId="731" EndId="606" type="0">
</Transition>
<Transition StartId="732" EndId="733" type="0">
</Transition>
<Transition StartId="733" EndId="737" type="3">
</Transition>
<Transition StartId="733" EndId="740" type="4">
</Transition>
<Transition StartId="734" EndId="740" type="0">
</Transition>
<Transition StartId="735" EndId="741" type="0">
</Transition>
<Transition StartId="737" EndId="743" type="0">
</Transition>
<Transition StartId="738" EndId="740" type="0">
</Transition>
<Transition StartId="739" EndId="539" type="0">
</Transition>
<Transition StartId="740" EndId="820" type="0">
</Transition>
<Transition StartId="741" EndId="732" type="1">
<Expression>CommErr == 0</Expression></Transition>
<Transition StartId="741" EndId="734" type="1">
<Expression>CommErr == 1</Expression></Transition>
<Transition StartId="742" EndId="738" type="0">
</Transition>
<Transition StartId="743" EndId="742" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="743" EndId="738" type="0">
</Transition>
<Transition StartId="744" EndId="745" type="0">
</Transition>
<Transition StartId="745" EndId="746" type="0">
</Transition>
<Transition StartId="746" EndId="723" type="0">
</Transition>
<Transition StartId="748" EndId="56" type="0">
</Transition>
<Transition StartId="749" EndId="750" type="0">
</Transition>
<Transition StartId="750" EndId="498" type="0">
</Transition>
<Transition StartId="751" EndId="498" type="0">
</Transition>
<Transition StartId="752" EndId="126" type="0">
</Transition>
<Transition StartId="753" EndId="135" type="0">
</Transition>
<Transition StartId="754" EndId="159" type="0">
</Transition>
<Transition StartId="755" EndId="247" type="0">
</Transition>
<Transition StartId="756" EndId="417" type="0">
</Transition>
<Transition StartId="757" EndId="758" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="757" EndId="840" type="0">
</Transition>
<Transition StartId="758" EndId="840" type="0">
</Transition>
<Transition StartId="759" EndId="796" type="0">
</Transition>
<Transition StartId="760" EndId="759" type="0">
</Transition>
<Transition StartId="761" EndId="634" type="0">
</Transition>
<Transition StartId="762" EndId="795" type="1">
<Expression>VMTLOC=="TR2"</Expression></Transition>
<Transition StartId="762" EndId="192" type="0">
</Transition>
<Transition StartId="765" EndId="169" type="1">
<Expression>EPB00_partnumber ~= ""</Expression></Transition>
<Transition StartId="765" EndId="177" type="0">
</Transition>
<Transition StartId="766" EndId="778" type="0">
</Transition>
<Transition StartId="769" EndId="770" type="1">
<Expression>Write_VariCoding=="2EF1A1"</Expression></Transition>
<Transition StartId="769" EndId="771" type="1">
<Expression>Write_VariCoding=="2E0100"</Expression></Transition>
<Transition StartId="770" EndId="772" type="0">
</Transition>
<Transition StartId="771" EndId="772" type="0">
</Transition>
<Transition StartId="772" EndId="144" type="0">
</Transition>
<Transition StartId="773" EndId="757" type="0">
</Transition>
<Transition StartId="774" EndId="773" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="774" EndId="757" type="0">
</Transition>
<Transition StartId="777" EndId="698" type="3">
</Transition>
<Transition StartId="777" EndId="53" type="4">
</Transition>
<Transition StartId="778" EndId="769" type="0">
</Transition>
<Transition StartId="779" EndId="780" type="0">
</Transition>
<Transition StartId="780" EndId="186" type="0">
</Transition>
<Transition StartId="781" EndId="788" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="781" EndId="782" type="0">
</Transition>
<Transition StartId="782" EndId="789" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="782" EndId="783" type="0">
</Transition>
<Transition StartId="783" EndId="790" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="783" EndId="786" type="0">
</Transition>
<Transition StartId="786" EndId="793" type="0">
</Transition>
<Transition StartId="788" EndId="792" type="0">
</Transition>
<Transition StartId="789" EndId="792" type="0">
</Transition>
<Transition StartId="790" EndId="792" type="0">
</Transition>
<Transition StartId="791" EndId="794" type="0">
</Transition>
<Transition StartId="792" EndId="791" type="0">
</Transition>
<Transition StartId="793" EndId="794" type="0">
</Transition>
<Transition StartId="794" EndId="192" type="0">
</Transition>
<Transition StartId="795" EndId="781" type="0">
</Transition>
<Transition StartId="796" EndId="192" type="0">
</Transition>
<Transition StartId="797" EndId="727" type="0">
</Transition>
<Transition StartId="800" EndId="797" type="1">
<Expression>VMTLOC=="TR2" and ((DString_C131_Car_Tpye == "CH1AM31") or (DString_C131_Car_Tpye == "CH1AM32") or (DString_C131_Car_Tpye == "CH1GM11") or (DString_C131_Car_Tpye == "CH1GM12") or (DString_C131_Car_Tpye == "CH1CM26") or (DString_C131_Car_Tpye == "CH1CM27") or (DString_C131_Car_Tpye == "CH1CM28") or (DString_C131_Car_Tpye == "CH1CM29") or (DString_C131_Car_Tpye == "CH1GM21") or (DString_C131_Car_Tpye == "CH1GM22") or (DString_C131_Car_Tpye == "CH1AM41") or (DString_C131_Car_Tpye == "CH1AM42") or (DString_C131_Car_Tpye == "CH1BM32") or (DString_C131_Car_Tpye == "CH1BM33"))</Expression></Transition>
<Transition StartId="801" EndId="802" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="801" EndId="664" type="0">
</Transition>
<Transition StartId="802" EndId="664" type="0">
</Transition>
<Transition StartId="803" EndId="448" type="0">
</Transition>
<Transition StartId="804" EndId="806" type="0">
</Transition>
<Transition StartId="804" EndId="805" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="805" EndId="806" type="0">
</Transition>
<Transition StartId="806" EndId="830" type="0">
</Transition>
<Transition StartId="806" EndId="831" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="807" EndId="613" type="0">
</Transition>
<Transition StartId="808" EndId="613" type="0">
</Transition>
<Transition StartId="809" EndId="810" type="0">
</Transition>
<Transition StartId="810" EndId="813" type="3">
</Transition>
<Transition StartId="810" EndId="815" type="4">
</Transition>
<Transition StartId="811" EndId="815" type="0">
</Transition>
<Transition StartId="812" EndId="819" type="0">
</Transition>
<Transition StartId="813" EndId="818" type="0">
</Transition>
<Transition StartId="814" EndId="815" type="0">
</Transition>
<Transition StartId="815" EndId="739" type="0">
</Transition>
<Transition StartId="817" EndId="822" type="0">
</Transition>
<Transition StartId="818" EndId="817" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="818" EndId="822" type="0">
</Transition>
<Transition StartId="819" EndId="809" type="1">
<Expression>CommErr == 0</Expression></Transition>
<Transition StartId="819" EndId="811" type="1">
<Expression>CommErr == 1</Expression></Transition>
<Transition StartId="820" EndId="739" type="0">
</Transition>
<Transition StartId="820" EndId="812" type="1">
<Expression>DVD00_partnumber ~= "" and DVD00_partnumber ~="DVD00_partnumber"</Expression></Transition>
<Transition StartId="821" EndId="824" type="0">
</Transition>
<Transition StartId="822" EndId="821" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="822" EndId="824" type="0">
</Transition>
<Transition StartId="823" EndId="826" type="0">
</Transition>
<Transition StartId="824" EndId="823" type="1">
<Expression>VMTLOC == "FUN"</Expression></Transition>
<Transition StartId="824" EndId="826" type="0">
</Transition>
<Transition StartId="825" EndId="814" type="0">
</Transition>
<Transition StartId="826" EndId="825" type="1">
<Expression>VMTLOC == "FIN"</Expression></Transition>
<Transition StartId="826" EndId="814" type="0">
</Transition>
<Transition StartId="830" EndId="803" type="0">
</Transition>
<Transition StartId="831" EndId="830" type="0">
</Transition>
<Transition StartId="836" EndId="838" type="0">
</Transition>
<Transition StartId="836" EndId="837" type="1">
<Expression>VMTLOC == "TR1"</Expression></Transition>
<Transition StartId="837" EndId="838" type="0">
</Transition>
<Transition StartId="838" EndId="839" type="1">
<Expression>VMTLOC == "TR2"</Expression></Transition>
<Transition StartId="838" EndId="843" type="0">
</Transition>
<Transition StartId="839" EndId="843" type="0">
</Transition>
<Transition StartId="840" EndId="842" type="1">
<Expression>VMTLOC == "FUN"</Expression></Transition>
<Transition StartId="840" EndId="841" type="0">
</Transition>
<Transition StartId="841" EndId="687" type="0">
</Transition>
<Transition StartId="842" EndId="841" type="0">
</Transition>
<Transition StartId="843" EndId="844" type="1">
<Expression>VMTLOC == "FUN"</Expression></Transition>
<Transition StartId="843" EndId="845" type="0">
</Transition>
<Transition StartId="844" EndId="845" type="0">
</Transition>
<Transition StartId="845" EndId="694" type="0">
</Transition>
<Transition StartId="846" EndId="38" type="0">
</Transition>
<Transition StartId="847" EndId="650" type="0">
</Transition>
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
<Transition StartId="854" EndId="37" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="854" EndId="316" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="857" EndId="858" type="0">
</Transition>
<Transition StartId="858" EndId="861" type="3">
</Transition>
<Transition StartId="858" EndId="859" type="4">
</Transition>
<Transition StartId="859" EndId="860" type="0">
</Transition>
<Transition StartId="859" EndId="861" type="5">
</Transition>
<Transition StartId="860" EndId="857" type="0">
</Transition>
<Transition StartId="861" EndId="317" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="861" EndId="52" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="864" EndId="865" type="0">
</Transition>
<Transition StartId="865" EndId="868" type="3">
</Transition>
<Transition StartId="865" EndId="866" type="4">
</Transition>
<Transition StartId="866" EndId="867" type="0">
</Transition>
<Transition StartId="866" EndId="868" type="5">
</Transition>
<Transition StartId="867" EndId="864" type="0">
</Transition>
<Transition StartId="868" EndId="63" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="868" EndId="318" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="871" EndId="872" type="0">
</Transition>
<Transition StartId="872" EndId="875" type="3">
</Transition>
<Transition StartId="872" EndId="873" type="4">
</Transition>
<Transition StartId="873" EndId="874" type="0">
</Transition>
<Transition StartId="873" EndId="875" type="5">
</Transition>
<Transition StartId="874" EndId="871" type="0">
</Transition>
<Transition StartId="875" EndId="71" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="875" EndId="319" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="878" EndId="879" type="0">
</Transition>
<Transition StartId="879" EndId="882" type="3">
</Transition>
<Transition StartId="879" EndId="880" type="4">
</Transition>
<Transition StartId="880" EndId="881" type="0">
</Transition>
<Transition StartId="880" EndId="882" type="5">
</Transition>
<Transition StartId="881" EndId="878" type="0">
</Transition>
<Transition StartId="882" EndId="79" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="882" EndId="320" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="883" EndId="884" type="0">
</Transition>
<Transition StartId="884" EndId="887" type="3">
</Transition>
<Transition StartId="884" EndId="885" type="4">
</Transition>
<Transition StartId="885" EndId="886" type="0">
</Transition>
<Transition StartId="885" EndId="887" type="5">
</Transition>
<Transition StartId="886" EndId="883" type="0">
</Transition>
<Transition StartId="887" EndId="88" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="887" EndId="321" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="888" EndId="889" type="0">
</Transition>
<Transition StartId="889" EndId="892" type="3">
</Transition>
<Transition StartId="889" EndId="890" type="4">
</Transition>
<Transition StartId="890" EndId="891" type="0">
</Transition>
<Transition StartId="890" EndId="892" type="5">
</Transition>
<Transition StartId="891" EndId="888" type="0">
</Transition>
<Transition StartId="892" EndId="322" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="892" EndId="99" type="1">
<Expression>CommErr==0</Expression></Transition>
<Transition StartId="894" EndId="895" type="0">
</Transition>
<Transition StartId="895" EndId="898" type="3">
</Transition>
<Transition StartId="895" EndId="896" type="4">
</Transition>
<Transition StartId="896" EndId="897" type="0">
</Transition>
<Transition StartId="896" EndId="898" type="5">
</Transition>
<Transition StartId="897" EndId="894" type="0">
</Transition>
<Transition StartId="898" EndId="323" type="1">
<Expression>CommErr==1</Expression></Transition>
<Transition StartId="898" EndId="109" type="1">
<Expression>CommErr==0</Expression></Transition>
</Transitions>
</Process>

