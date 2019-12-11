<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="180" pbltext="DEP1060">
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="131" right="231" bottom="32"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="1" name="结束节点">
<Rect left="132" top="293" right="232" bottom="325"/>
<Script>date=os.date("%Y%m%d_%H%M%S");
engine.WorkPlace="FIN";
engine.SaveResultXml("");</Script></End>
<Activities>
<Activity id="150" ActivityType="3" flags="0" name="蓝牙模块连接器完好吗？">
<Rect left="701" top="113" right="801" bottom="145"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<Line1Text Enable="1" Text="蓝牙模块连接器完好吗？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(2,"#L=OK？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(2,"#L=OK？#R=BMPNOK");
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="5701" name="DEP182" type="8" flags="97"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect left="701" top="170" right="801" bottom="202"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if (0 == engine.TestResult) then
  --OK
  engine.DialogBackColor = "Green";
else
  --NOK
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end
</Script></Activity>
<Activity id="152" ActivityType="5" flags="0" name="C131_HCU_Flash">
<Rect left="131" top="163" right="231" bottom="195"/>
<SubProcesses>
<SubProcess id="C131_HCU_Flash">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="Stop_Flag" value="&quot;stop_flag&quot;"/>
</Parameters>
</SubProcess>
<SubProcess id="Functional_Addressing">
<Parameters>
<Parameter id="Stop_Flag" value="&quot;stop_flag&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="153" ActivityType="3" flags="0" name="普通节点">
<Rect left="580" top="113" right="680" bottom="145"/>
<Script>vin="ABCDEFG"
#COMM 0x2E 0xF1 0x90 vin</Script></Activity>
<Activity id="155" ActivityType="3" flags="0" name="普通节点">
<Rect left="847" top="112" right="947" bottom="144"/>
<Script>doc = XmlDocument();
doc.load("d:/test/LFPH4BCNXG1L01731.xml");
nodes = doc.selectNodes("/CCMS/CCM");
for i=0,nodes.length-1 do
  node = nodes[i];
  print("nodeName" .. node.nodeName);
  print("NAME" .. node.getAttribute("NAME"));
  print("DID" .. node.getAttribute("DID"));
  print("SIZE" .. node.getAttribute("SIZE"));
  --print("DATA" .. node.childNodes[0].nodeValue);
  --print("DATA" .. node.getFirstChild().getAttribute("DATA"));
  --print("DATA" .. node.text);
  --print(node.text);
  print("DATA".. doc.selectNodes("/CCMS/CCM/DATA")[i].text);

end</Script></Activity>
<Activity id="156" ActivityType="5" flags="0" name="c131_bcm2-test">
<Rect top="91" right="100" bottom="123"/>
<SubProcesses>
<SubProcess id="C131_BCM2-Test">
<Parameters>
<Parameter id="C131_BCM2_Brake_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Rear_Fog_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Reverse_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_License_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_HM_Brake_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Turn_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Truck_Lamps_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Rear_Fog_Switch_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Roof_Control_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_Curtain_Check_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="C131_BCM2_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_SN_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_BCM2_VIN_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_EID_Execute_Flag" value="false"/>
<Parameter id="C131_BCM2_WD_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_BCM2_Position_Lamps_Execute_Flag" value="false"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="157" ActivityType="5" flags="0" name="c131_pdc">
<Rect top="158" right="100" bottom="190"/>
<SubProcesses>
<SubProcess id="C131_PDC">
<Parameters>
<Parameter id="C131_PDC_System_Self_Checking_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_Function_Activation_Check_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Sensor_Data_Execute_Flag" value="false"/>
<Parameter id="C131_PDC_Read_Switch_Data_Execute_Flag" value="false"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="C131_PDC_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PDC_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="显示OK/NOK">
<Rect top="229" right="100" bottom="261"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>if (0 == engine.TestResult) then
  engine.DialogBackColor = "Green";
else
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end

engine.println("OilPump_partnumber="..OilPump_partnumber)</Script></Activity>
<Activity id="159" ActivityType="3" flags="0" name="设置共享变量">
<Rect left="132" top="90" right="232" bottom="122"/>
<Script>Stop_Flag="stop_flag";
engine.SharedVarSet(Stop_Flag,0);
engine.println("设置共享变量，Stop_Flag="..engine.SharedVarGet(Stop_Flag));</Script></Activity>
<Activity id="160" ActivityType="3" flags="0" name="普通节点">
<Rect left="387" top="160" right="487" bottom="192"/>
<Script>
   engine.println("测试:");
#COMMINIT
#COMM 0x22 0xF1 0x96
if(@0==0x62)then
   DString1=bin2hex(@3-@5);
   engine.SetLineText(3,DString1);
   engine.println("软件号:"..DString1.."A");
   DString1=string.sub(DString1,1,6);
   engine.println("软件号:"..DString1.."B");   
else
end

#STOPCOMM</Script></Activity>
<Activity id="162" ActivityType="5" flags="0" name="C131_TBOX_TEST">
<Rect left="432" top="88" right="532" bottom="120"/>
<SubProcesses>
<SubProcess id="C131_TBOX_Test">
<Parameters>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="&quot;LFPH4BCN7G1L03355&quot;"/>
<Parameter id="C131_TBOX_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SN_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_TBOX_EID_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="163" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="476" top="277" right="576" bottom="309"/>
<Strategy TotalTime="3" NokTime="3" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5

if(@0 == 0x67)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2932" name="DEP77" type="8" flags="97"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="发送key">
<Rect left="474" top="381" right="574" bottom="413"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3

if (@0==0x67) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2933" name="DEP78" type="8" flags="97"/>
</Activity>
<Activity id="165" ActivityType="13" flags="0" name="计算">
<Rect left="475" top="328" right="575" bottom="360"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x6C799B6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="166" ActivityType="4" flags="0" name="路由节点">
<Rect left="542" top="438" right="574" bottom="470"/>
</Activity>
<Activity id="167" ActivityType="3" flags="0" name="初始安全访问次数">
<Rect left="478" top="223" right="578" bottom="255"/>
<Script>SATimes=0;
engine.println("初始化安全访问次数："..SATimes);</Script></Activity>
<Activity id="168" ActivityType="3" flags="0" name="累积安全访问次数">
<Rect left="356" top="381" right="456" bottom="413"/>
<Script>SATimes = SATimes + 1;
engine.println("安全访问次数："..SATimes);</Script></Activity>
<Activity id="169" ActivityType="3" flags="0" name="切诊断">
<Rect left="637" top="264" right="737" bottom="296"/>
<Script>#COMM 0x10 0x01</Script></Activity>
<Activity id="170" ActivityType="3" flags="0" name="读DTC">
<Rect left="638" top="313" right="738" bottom="345"/>
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
<Activity id="171" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="638" top="361" right="738" bottom="393"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;B0004-13&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="通讯">
<Rect left="635" top="212" right="735" bottom="244"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="普通节点">
<Rect left="599" top="414" right="699" bottom="446"/>
<Line1Text Enable="1" Text="有故障"/>
<Script>#DELAY 2000

engine.println("有故障");
engine.println("dtc:"..dtc);
engine.println("FindErr:"..FindErr);</Script></Activity>
<Activity id="174" ActivityType="3" flags="0" name="普通节点">
<Rect left="753" top="413" right="853" bottom="445"/>
<Line1Text Enable="1" Text="无故障"/>
<Script>#DELAY 2000

engine.println("有故障");
engine.println("dtc:"..dtc);
engine.println("FindErr:"..FindErr);</Script></Activity>
<Activity id="175" ActivityType="3" flags="0" name="普通节点">
<Rect left="669" top="496" right="769" bottom="528"/>
<Script></Script></Activity>
<Activity id="176" ActivityType="13" flags="0" name="Dtc_Filter">
<Rect left="763" top="356" right="863" bottom="388"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK" value="&quot;{B0004-13,B0002-13}&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="sec_F30_ABAG">
<Rect left="228" top="140" right="328" bottom="172"/>
<Script>--seed=0xAA55;
--seed=0xBB8A;
seed=0x8411;
--seed=0x09E2;
Key_Mask=0x33453137;--确定Mask是正确的
--Key_Mask=0x33443237;
engine.println("seed:"..string.format("%04X",seed)); 
engine.println("Key_Mask:"..string.format("%08X",Key_Mask)); 

KeyArray_A={0x42,0x72,0x69,0x6C,0x6C,0x69,0x61,0x6E,0x63,0x65,0x41,0x75,0x74,0x6F,0x20,0x41};
KeyArray_M={0x42,0x72,0x69,0x6C,0x6C,0x69,0x61,0x6E,0x63,0x65,0x41,0x75,0x74,0x6F,0x20,0x4D};
KeyArray_C={0x42,0x72,0x69,0x6C,0x6C,0x69,0x61,0x6E,0x63,0x65,0x41,0x75,0x74,0x6F,0x20,0x43};
KeyArray_P={0x42,0x72,0x69,0x6C,0x6C,0x69,0x61,0x6E,0x63,0x65,0x41,0x75,0x74,0x6F,0x20,0x43};
PowArray_P={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
PowArray_N={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

Key_P=0;
Key_N=0;
Key_temp=0;

for i=0,15,1 do
	PowArray_P[i]=bit32.band(bit32.rshift(seed,15-i),1);
	PowArray_N[i]=bit32.band(bit32.bxor(PowArray_P[i],1),1);
end	
print("PowArray_P:".."{"..PowArray_P[0]..","..PowArray_P[1]..","..PowArray_P[2]..","..PowArray_P[3]..","..PowArray_P[4]..","..PowArray_P[5]..","..PowArray_P[6]..","..PowArray_P[7]..","..PowArray_P[8]..","..PowArray_P[9]..","..PowArray_P[10]..","..PowArray_P[11]..","..PowArray_P[12]..","..PowArray_P[13]..","..PowArray_P[14]..","..PowArray_P[15].."}");
print("PowArray_N:".."{"..PowArray_N[0]..","..PowArray_N[1]..","..PowArray_N[2]..","..PowArray_N[3]..","..PowArray_N[4]..","..PowArray_N[5]..","..PowArray_N[6]..","..PowArray_N[7]..","..PowArray_N[8]..","..PowArray_N[9]..","..PowArray_N[10]..","..PowArray_N[11]..","..PowArray_N[12]..","..PowArray_N[13]..","..PowArray_N[14]..","..PowArray_N[15].."}");

for j=0,15,1 do
	Key_P=Key_P + (PowArray_P[j] * KeyArray_M[j+1]);--使用售后，需改成M
	--print(PowArray_P[j].."*"..KeyArray_A[j+1]);
	Key_N=Key_N + (PowArray_N[j] * KeyArray_M[j+1]);--使用售后，需改成M
	--print(PowArray_N[j].."*"..KeyArray_A[j+1]);
end	

print("Key_P:"..Key_P);
print("Key_N:"..Key_N);

Key_temp=math.abs(Key_P - Key_N)*32 + bit32.band(Key_P,0x16);--使用售后，需改成M
Key=bit32.band(Key_temp,Key_Mask);
engine.println("0xKey:"..string.format("%08X",Key)); 
Key = string.format("%08X",Key);
print("Key_temp:"..Key_temp);
print("Key:"..Key);


</Script></Activity>
<Activity id="178" ActivityType="13" flags="0" name="Sec_4wd">
<Rect left="550" top="64" right="650" bottom="96"/>
<FunctionRef id="Sec_4wd">
<Parameters>
<Parameter id="s0" value="0x53"/>
<Parameter id="s1" value="0x2e"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="179" ActivityType="3" flags="0" name="普通节点">
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
<Variable id="CAN_RCV_ID" type="3" data="0X6C3" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Rect left="341" top="63" right="441" bottom="95"/>
<Script>--#COMMINIT
vciHandle = 0;
vciHandle=engine.EcuOpen();
engine.println("红旗上测试vciHandle");
engine.println("vciHandle:"..vciHandle);</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="普通节点">
<Rect top="343" right="100" bottom="375"/>
<Script>DString_C131_Car_Tpye = "CH1FM2sa0";


if(CarTNC_Is_CFace(DString_C131_Car_Tpye))then
	engine.println("isChangeFace:可以");
else
	engine.println("isChangeFace:不可以");
end</Script></Activity>
<Activity id="181" ActivityType="13" flags="0" name="sec_dvd">
<Rect left="56" top="391" right="156" bottom="423"/>
<FunctionRef id="sec_dvd">
<Parameters>
<Parameter id="s0" value="0x50"/>
<Parameter id="s1" value="0x2f"/>
<Parameter id="s2" value="0x71"/>
<Parameter id="s3" value="0xe0"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="182" ActivityType="5" flags="0" name="C131_DVD">
<Rect left="277" top="302" right="377" bottom="334"/>
<SubProcesses>
<SubProcess id="C131_DVD">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="C131_DVD_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_HN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_SN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_EID_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_DVD_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_DVD_HVP_Execute_Flag" value="true"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="183" ActivityType="5" flags="0" name="C131_PLGM">
<Rect left="235" top="91" right="335" bottom="123"/>
<SubProcesses>
<SubProcess id="C131_PLGM">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="C131_PLGM_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_HN_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_SN_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_EID_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_WD_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_VIN_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="C131_PLGM_Open_With_Button_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_Anti_Pinch_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_Anti_Collsion_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_Open_With_Kick_Execute_Flag" value="true"/>
<Parameter id="C131_PLGM_Open_With_Key_Execute_Flag" value="true"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="184" ActivityType="5" flags="0" name="C131_ESP">
<Rect left="235" top="50" right="335" bottom="82"/>
<SubProcesses>
<SubProcess id="C131_ESP">
<Parameters>
<Parameter id="C131_ESP_Brake_Light_Execute_Flag" value="false"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
<Parameter id="C131_ESP_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SN_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_EID_Execute_Flag" value="true"/>
<Parameter id="C131_ESP_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="&quot;CH1AM31&quot;"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="185" ActivityType="5" flags="0" name="C131_CLUSTER">
<Rect left="738" top="39" right="838" bottom="71"/>
<SubProcesses>
<SubProcess id="C131_CLUSTER">
<Parameters>
<Parameter id="DString_Write_VIN" value="DString_Write_VIN"/>
<Parameter id="DString_C131_VariCoding" value="DString_C131_VariCoding"/>
<Parameter id="DString_C131_Partnumber" value="DString_C131_Partnumber"/>
<Parameter id="C131_Cluster_Telltale_Check_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_Buzzer_Check_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_Pointer_Check_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_Backlight_Check_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_OEM_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_HN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_HVP_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_SN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_SVP_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_VIN_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_EID_Execute_Flag" value="true"/>
<Parameter id="C131_Cluster_WD_Execute_Flag" value="true"/>
<Parameter id="DString_C131_Car_Tpye" value="DString_C131_Car_Tpye"/>
<Parameter id="VMTLOC" value="VMTLOC"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="普通节点">
<Rect left="186" top="405" right="286" bottom="437"/>
<Line1Text Enable="1" Text="a"/>
<Line2Text Enable="1" Text="b"/>
<Script>print("Hello World！")</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="0" EndId="186" type="0">
</Transition>
<Transition StartId="150" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="1" type="0">
</Transition>
<Transition StartId="152" EndId="1" type="0">
</Transition>
<Transition StartId="153" EndId="1" type="0">
</Transition>
<Transition StartId="155" EndId="1" type="0">
</Transition>
<Transition StartId="156" EndId="1" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="1" type="0">
</Transition>
<Transition StartId="158" EndId="1" type="0">
</Transition>
<Transition StartId="159" EndId="152" type="0">
</Transition>
<Transition StartId="160" EndId="1" type="0">
</Transition>
<Transition StartId="162" EndId="1" type="0">
</Transition>
<Transition StartId="167" EndId="1" type="0">
</Transition>
<Transition StartId="169" EndId="170" type="0">
</Transition>
<Transition StartId="170" EndId="176" type="0">
</Transition>
<Transition StartId="171" EndId="173" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="171" EndId="174" type="0">
</Transition>
<Transition StartId="172" EndId="169" type="0">
</Transition>
<Transition StartId="173" EndId="175" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="174" EndId="175" type="0">
</Transition>
<Transition StartId="175" EndId="1" type="0">
</Transition>
<Transition StartId="176" EndId="175" type="0">
</Transition>
<Transition StartId="177" EndId="1" type="0">
</Transition>
<Transition StartId="178" EndId="1" type="0">
</Transition>
<Transition StartId="179" EndId="1" type="0">
</Transition>
<Transition StartId="180" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="1" type="0">
</Transition>
<Transition StartId="182" EndId="1" type="0">
</Transition>
<Transition StartId="183" EndId="1" type="0">
</Transition>
<Transition StartId="184" EndId="1" type="0">
</Transition>
<Transition StartId="185" EndId="1" type="0">
</Transition>
<Transition StartId="186" EndId="1" type="0">
</Transition>
</Transitions>
</Process>

