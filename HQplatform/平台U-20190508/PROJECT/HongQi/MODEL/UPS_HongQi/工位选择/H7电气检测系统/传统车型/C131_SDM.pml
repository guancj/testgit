<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1127" pbltext="DEP68">
<Parameters>
<Variable id="C131_SDM_Warning_Lamp_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_Seat_Belt_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_SBR_Switch_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_Resistance_Check_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_SDM_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_SDM_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="Write_VariCoding" type="8" dir="0" data="Write_VariCoding"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x7A2" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7C2" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="113" top="8" right="213" bottom="40"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="574" top="2536" right="674" bottom="2568"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="安全气囊 (AirBag)">
<Rect left="114" top="60" right="214" bottom="92"/>
<TitleText Enable="1" Text="安全气囊 (AirBag)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="114" top="206" right="214" bottom="238"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="2301" name="DEP70" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="关闭警示灯灯">
<Rect left="559" top="893" right="659" bottom="925"/>
<Script>#COMM 0x2f 0xfa 0xfa 0x02

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);








</Script><assessment no="41" name="DEP1238" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="延时">
<Rect left="560" top="944" right="660" bottom="976"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="示警灯灭手动确认">
<Rect left="559" top="994" right="659" bottom="1026"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯灭了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="22" name="DEP608" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="返回控制权">
<Rect left="562" top="1196" right="662" bottom="1228"/>
<Script>#COMM 0x2f 0xfa 0xfa 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script><assessment no="43" name="DEP1240" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="扣上司机侧安全带手动确认">
<Rect left="561" top="1308" right="661" bottom="1340"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="扣上司机侧安全带"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="12" ActivityType="4" flags="0" name="条件2">
<Rect left="596" top="1248" right="628" bottom="1280"/>
</Activity>
<Activity id="13" ActivityType="4" flags="0" name="条件1">
<Rect left="596" top="829" right="628" bottom="861"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="SDM 系驾驶员安全带">
<Rect left="562" top="1355" right="662" bottom="1387"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x10
if (@9==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
end
engine.SetLineText(3,@9);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP610" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="解除司机侧安全带手动确认">
<Rect left="563" top="1402" right="663" bottom="1434"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="解除司机侧安全带"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="SDM 解除驾驶员安全带">
<Rect left="564" top="1450" right="664" bottom="1482"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x10
if (@9==0x03) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP611" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="564" top="1498" right="664" bottom="1530"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="乘客侧手动确认">
<Rect left="563" top="1600" right="663" bottom="1632"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="扣上乘客侧安全带"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="SDM 系副驾驶员安全带">
<Rect left="563" top="1648" right="663" bottom="1680"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x10
if (@10==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@10);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP612" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="手动确认">
<Rect left="563" top="1696" right="663" bottom="1728"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="解除乘客侧安全带"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="SDM 解除副驾驶员安全带">
<Rect left="564" top="1744" right="664" bottom="1776"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="100" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x10
if (@10==0x03) then
  engine.LastError = 0;
  --OK=OK+1;
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@10);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP613" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="4" flags="0" name="条件3">
<Rect left="597" top="1858" right="629" bottom="1890"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="关闭 PAD 开关手动确认">
<Rect left="564" top="1923" right="664" bottom="1955"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="关闭 PAD 开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="SDM 关闭PAD开关">
<Rect left="565" top="1972" right="665" bottom="2004"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x11
if (@5==0x03) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@5);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP614" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="打开pad手动确认">
<Rect left="566" top="2022" right="666" bottom="2054"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开 PAD 开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="SDM 打开PAD开关">
<Rect left="567" top="2069" right="667" bottom="2101"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x11
if (@5==0x02) then
  engine.LastError = 0;
  --OK=OK+1;
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
 engine.SetLineText(3,@5);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="29" name="DEP615" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="坐在乘客位手动确认">
<Rect left="568" top="2115" right="668" bottom="2147"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="坐在乘客座位上"/>
<InputText Enable="1"/>
<Script></Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="SDM 坐在副驾驶位置">
<Rect left="568" top="2163" right="668" bottom="2195"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x11
if (@6==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.SetLineText(3,@6);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="30" name="DEP616" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="SDM 离开副驾驶位置">
<Rect left="571" top="2260" right="671" bottom="2292"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x22 0xfd 0x11
if (@6==0x03 ) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.SetLineText(3,@6);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP617" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="4" flags="0" name="条件4">
<Rect left="607" top="2316" right="639" bottom="2348"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="SDM 读点火回路1电阻">
<Rect left="573" top="2379" right="673" bottom="2411"/>
<Strategy TotalTime="100" NokTime="0"/>
<Line2Text Enable="1" Text="读点火线圈1电阻"/>
<Script>--#COMM   0x22  0x3f
#COMM 0x22 0xfd 0x32
 engine.SetLineText(3,@6);
 engine.println(" engine.LastError=".. engine.LastError);

local recvTel = @0-;
if(engine.LastError ~= 0) then
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
	
else

	engine.StatValue = "Recv :"..LibGeneral.hex2str(recvTel);	

end
engine.Delay(60)


</Script><assessment no="32" name="DEP618" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="SDM 读点火回路2电阻">
<Rect left="573" top="2428" right="673" bottom="2460"/>
<Strategy TotalTime="100" NokTime="0"/>
<Line2Text Enable="1" Text="读点火线圈2电阻"/>
<Script>--#COMM   0x22  0x3f
#COMM 0x22 0xfd 0x33

 engine.SetLineText(3,@6);
 engine.println(" engine.LastError=".. engine.LastError);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);






</Script></Activity>
<Activity id="36" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="574" top="2481" right="674" bottom="2513"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="42" ActivityType="3" flags="0" name="打开提示灯">
<Rect left="560" top="1044" right="660" bottom="1076"/>
<Script>#COMM 0x2f 0xfa 0xfa 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script><assessment no="42" name="DEP1239" type="8" flags="97"/>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="示警灯亮手动确认">
<Rect left="561" top="1147" right="661" bottom="1179"/>
<Line1Text Enable="1" Text="仪表板安全气囊示警灯亮了吗？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.LastError = 1;
   engine.TestResult = 1;
else
end
</Script><assessment no="23" name="DEP609" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="延时">
<Rect left="561" top="1093" right="661" bottom="1125"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="检测失败">
<Rect left="452" top="1354" right="552" bottom="1386"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="检测失败">
<Rect left="450" top="1648" right="550" bottom="1680"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="检测失败">
<Rect left="452" top="1969" right="552" bottom="2001"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="检测失败">
<Rect left="457" top="2261" right="557" bottom="2293"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="连接ECU">
<Rect left="115" top="110" right="215" bottom="142"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
engine.Delay(60)</Script></Activity>
<Activity id="54" ActivityType="3" flags="0" name="切诊断">
<Rect left="113" top="254" right="213" bottom="286"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="2303" name="DEP1088" type="8" flags="97"/>
</Activity>
<Activity id="55" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="113" top="300" right="213" bottom="332"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="2311" name="DEP71" type="8" flags="97"/>
</Activity>
<Activity id="57" ActivityType="3" flags="0" name="发送key">
<Rect left="114" top="397" right="214" bottom="429"/>
<Strategy TotalTime="3" NokTime="0" RetryTimeOut="3"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.Delay(60)
#COMM 0x27 0x02 key0 key1 
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


engine.Delay(60)</Script><assessment no="2312" name="DEP72" type="8" flags="97"/>
</Activity>
<Activity id="59" ActivityType="13" flags="0" name="AirBag计算">
<Rect left="113" top="347" right="213" bottom="379"/>
<FunctionRef id="sec_airbag">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="坐在副驾驶手动确认">
<Rect left="564" top="1551" right="664" bottom="1583"/>
<Line1Text Enable="1" Text="请坐在副驾驶座椅上！"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="检测失败">
<Rect left="461" top="2380" right="561" bottom="2412"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="比对零件号">
<Rect left="230" top="74" right="330" bottom="106"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==11)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
	elseif(string.len(DString_C131_Partnumber)==12)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14);
	else
	end
        --]]
        DString_tmp=@3-;
        DString1 = string.sub(DString_tmp,1,string.len(DString_C131_Partnumber));
	engine.SetLineText(3,DString1);
	engine.println("读到零件号:"..DString1); 
	
	
	if (DString1==DString_C131_Partnumber) then
		engine.LastError = 0;
		engine.println("比对零件号成功"..DString1.."  "..DString_C131_Partnumber); 
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对零件号失败"..DString1.."  "..DString_C131_Partnumber);
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_C131_Partnumber;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="1" name="DEP276" type="8" flags="105"/>
</Activity>
<Activity id="69" ActivityType="4" flags="0" name="路由节点">
<Rect left="264" top="14" right="296" bottom="46"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="读硬件号">
<Rect left="350" top="64" right="450" bottom="96"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@4);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="2" name="DEP277" type="8" flags="105"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="延时300MS">
<Rect left="350" top="114" right="450" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="73" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="14" right="416" bottom="46"/>
</Activity>
<Activity id="74" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="14" right="706" bottom="46"/>
</Activity>
<Activity id="75" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="14" right="536" bottom="46"/>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="470" top="64" right="570" bottom="96"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@4);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="3" name="DEP278" type="8" flags="105"/>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="延时300MS">
<Rect left="470" top="124" right="570" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="79" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="14" right="956" bottom="46"/>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="890" top="64" right="990" bottom="96"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95

DString1=string.char(@3,@4,@5,@6);
engine.SetLineText(3,DString1);
engine.println("软件版本号:"..DString1);
engine.println("不比软件版本号");

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="5" name="DEP280" type="8" flags="105"/>
</Activity>
<Activity id="85" ActivityType="3" flags="0" name="读软件号">
<Rect left="640" top="64" right="740" bottom="96"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
StandValue="28479779";
engine.SetLineText(2,StandValue);
engine.println("软件号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("28479779" == DString1) then 
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="4" name="DEP279" type="8" flags="105"/>
</Activity>
<Activity id="87" ActivityType="3" flags="0" name="延时300MS">
<Rect left="640" top="114" right="740" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="89" ActivityType="3" flags="0" name="延时300MS">
<Rect left="890" top="114" right="990" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1140" top="64" right="1240" bottom="96"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="10" DelayTime="200"/>
<Line1Text Enable="1" Text="写VIN码"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="6" name="DEP281" type="8" flags="97"/>
</Activity>
<Activity id="99" ActivityType="3" flags="0" name="日期读取">
<Rect left="1270" top="124" right="1370" bottom="156"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="100" ActivityType="3" flags="0" name="比对VIN">
<Rect left="1140" top="114" right="1240" bottom="146"/>
<Line1Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19);
	engine.SetLineText(3,DString1);
	engine.println("读的VIN值:"..DString1);
	if (string.match(DString1,DString_Write_VIN)) then
		engine.LastError = 0;
		engine.println("比对成功");
	else
		engine.LastError = 1;
		engine.TestResult = 1;
		engine.println("比对失败");
	end
	engine.StatValue=DString1;
	engine.StatPoint=DString_Write_VIN;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="7" name="DEP282" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="发送时间">
<Rect left="1270" top="64" right="1370" bottom="96"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(60)</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="102" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="14" right="1206" bottom="46"/>
</Activity>
<Activity id="105" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1920" top="829" right="2020" bottom="861"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1520" top="124" right="1620" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1520" top="174" right="1620" bottom="206"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="11" name="DEP284" type="8" flags="105"/>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="写配置码">
<Rect left="1520" top="64" right="1620" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
if(string.len(VariCoding)==32)then
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)
else
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11)
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="10" name="DEP283" type="8" flags="97"/>
</Activity>
<Activity id="110" ActivityType="4" flags="0" name="路由节点">
<Rect left="1434" top="14" right="1466" bottom="46"/>
</Activity>
<Activity id="112" ActivityType="4" flags="0" name="路由节点">
<Rect left="1304" top="14" right="1336" bottom="46"/>
</Activity>
<Activity id="115" ActivityType="3" flags="0" name="写配置码">
<Rect left="1400" top="174" right="1500" bottom="206"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2E 0xF1 0xA1 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

</Script><assessment no="13" name="DEP283" type="8" flags="97"/>
</Activity>
<Activity id="117" ActivityType="3" flags="0" name="允许写入配置码">
<Rect left="1400" top="124" right="1500" bottom="156"/>
<Line1Text Enable="1" Text="允许写入配置码"/>
<Script>#COMM 0x2E 0xF1 0xA0 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

engine.Delay(100)</Script><assessment no="12" name="DEP285" type="8" flags="97"/>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="不允许写入配置码">
<Rect left="1400" top="224" right="1500" bottom="256"/>
<Line1Text Enable="1" Text="不允许写入配置码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2E 0xF1 0xA0 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="14" name="DEP286" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1400" top="274" right="1500" bottom="306"/>
<Line1Text Enable="1" Text="检查配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	engine.println(DString_C131_VariCoding);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="15" name="DEP284" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="硬件复位">
<Rect left="1400" top="324" right="1500" bottom="356"/>
<Line1Text Enable="1" Text="硬件复位"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x11 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="16" name="DEP287" type="8" flags="97"/>
</Activity>
<Activity id="121" ActivityType="3" flags="0" name="断开连接,延时2秒">
<Rect left="1400" top="364" right="1500" bottom="396"/>
<Line1Text Enable="1" Text="断开连接"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#STOPCOMM
#DELAY 2000
</Script></Activity>
<Activity id="122" ActivityType="3" flags="0" name="连接ECU">
<Rect left="1400" top="414" right="1500" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="17" name="DEP69" type="8" flags="97"/>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="清DTC">
<Rect left="1400" top="514" right="1500" bottom="546"/>
<Line1Text Enable="1" Text="清DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="19" name="DEP70" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="1400" top="464" right="1500" bottom="496"/>
<Script>#COMM 0x10 0x03</Script></Activity>
<Activity id="129" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1400" top="564" right="1500" bottom="596"/>
<Line1Text Enable="1" Text="检查配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
</Script><assessment no="21" name="DEP1237" type="8" flags="97"/>
</Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="597" top="1801" right="629" bottom="1833"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="检测失败">
<Rect left="456" top="2162" right="556" bottom="2194"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="离开乘客座位手动确认">
<Rect left="570" top="2213" right="670" bottom="2245"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="离开乘客座位"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="134" ActivityType="3" flags="0" name="检测失败">
<Rect left="461" top="2430" right="561" bottom="2462"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="137" ActivityType="4" flags="0" name="路由节点">
<Rect left="681" top="1550" right="713" bottom="1582"/>
</Activity>
<Activity id="138" ActivityType="4" flags="0" name="路由节点">
<Rect left="696" top="2403" right="728" bottom="2435"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="通讯">
<Rect left="114" top="160" right="214" bottom="192"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
engine.Delay(60)</Script><assessment no="2302" name="DEP69" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="通讯失败">
<Rect top="163" right="100" bottom="195"/>
<Line1Text Enable="1" Text="AirBag 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="141" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="2480" right="66" bottom="2512"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1" top="109" right="101" bottom="141"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="143" ActivityType="4" flags="0" name="路由节点">
<Rect left="1654" top="14" right="1686" bottom="46"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="1.8T后续车型写F1A1">
<Rect left="1400" top="64" right="1500" bottom="96"/>
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
   LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye) or 
   LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye) or
   LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))
then
    Write_VariCoding="2EF1A1";
else
    Write_VariCoding="2E0100";
end</Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1661" top="119" right="1761" bottom="151"/>
<Line1Text Enable="1" Text="检查配置码"/>
<Script>#COMM 0x22 0xF1 0xA1
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="33" name="DEP284" type="8" flags="105"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1786" top="119" right="1886" bottom="151"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@8);
	engine.println("配置码:"..DString_Read_Config_Code_From_ECU);
	if (string.match(DString_Read_Config_Code_From_ECU,DString_C131_VariCoding)) then
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
	engine.StatPoint=DString_C131_VariCoding;
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end</Script><assessment no="35" name="DEP284" type="8" flags="105"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="1.8T后续车型写F1A1">
<Rect left="1661" top="65" right="1761" bottom="97"/>
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
   LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye) or 
   LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)  or
      LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))
then
    Write_VariCoding="2EF1A1";
else
    Write_VariCoding="2E0100";
end</Script></Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="1954" top="14" right="1986" bottom="46"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="检测失败">
<Rect left="445" top="993" right="545" bottom="1025"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="681" top="1045" right="713" bottom="1077"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="2084" right="776" bottom="2116"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="804" top="14" right="836" bottom="46"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="读软件号">
<Rect left="770" top="114" right="870" bottom="146"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="28479779";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="28479779";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="28479779";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48")then
		StandValue="28479779";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="28479779";
	else
		StandValue="28479779";
	end	
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);
	--if("28479779" == DString1) then 
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="4" name="DEP279" type="8" flags="105"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="延时300MS">
<Rect left="770" top="164" right="870" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="157" ActivityType="3" flags="0" name="改脸">
<Rect left="770" top="64" right="870" bottom="96"/>
<Script></Script></Activity>
<Activity id="158" ActivityType="4" flags="0" name="路由节点">
<Rect left="794" top="344" right="826" bottom="376"/>
</Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="1054" top="14" right="1086" bottom="46"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1020" top="124" right="1120" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		--StandValue="28479779";不检软件版本号
		StandValue="";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="";
	else
		StandValue="";
	end	
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("28479779" == DString1) then 
	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="5" name="DEP280" type="8" flags="105"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1020" top="174" right="1120" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="162" ActivityType="3" flags="0" name="改脸">
<Rect left="1020" top="64" right="1120" bottom="96"/>
<Script></Script></Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="1054" top="224" right="1086" bottom="256"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="读软件号">
<Rect left="570" top="234" right="670" bottom="266"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
if(@0==0x62)then

	StandValue="28479779";
	engine.SetLineText(2,StandValue);
	engine.println("软件号标准值:"..StandValue);
	DString1 = engine.GetResponseString(3,2+#StandValue);
	engine.SetLineText(3,DString1);
	engine.println("软件号:"..DString1);

	if(StandValue~="")then
		if(StandValue == DString1)then                                
			engine.LastError = 0;
			engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
		else
			engine.LastError = 1;
			engine.TestResult = 1;
			engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
		end
		engine.StatValue=DString1;
		engine.StatPoint=StandValue;
	else
		engine.println("不比对软件版本号");
	end                        
	
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

engine.Delay(60)</Script><assessment no="4" name="DEP279" type="8" flags="97"/>
</Activity>
<Activity id="165" ActivityType="3" flags="0" name="延时300MS">
<Rect left="570" top="284" right="670" bottom="316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="166" ActivityType="3" flags="0" name="19年型">
<Rect left="570" top="184" right="670" bottom="216"/>
<Script></Script></Activity>
<Activity id="167" ActivityType="4" flags="0" name="路由节点">
<Rect left="604" top="14" right="636" bottom="46"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="53" type="0">
</Transition>
<Transition StartId="4" EndId="54" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="42" type="0">
</Transition>
<Transition StartId="9" EndId="151" type="4">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="11" EndId="14" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="1">
<Expression>C131_SDM_Seat_Belt_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="12" EndId="137" type="0">
</Transition>
<Transition StartId="13" EndId="7" type="1">
<Expression>C131_SDM_Warning_Lamp_Execute_Flag == true and LibGeneral.CarTNC_19year()</Expression></Transition>
<Transition StartId="13" EndId="152" type="0">
</Transition>
<Transition StartId="14" EndId="15" type="3">
</Transition>
<Transition StartId="14" EndId="45" type="4">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
<Transition StartId="16" EndId="17" type="3">
</Transition>
<Transition StartId="16" EndId="45" type="4">
</Transition>
<Transition StartId="17" EndId="60" type="0">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="21" EndId="49" type="4">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="131" type="3">
</Transition>
<Transition StartId="23" EndId="49" type="4">
</Transition>
<Transition StartId="24" EndId="25" type="1">
<Expression>C131_SDM_SBR_Switch_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="24" EndId="153" type="0">
</Transition>
<Transition StartId="25" EndId="26" type="0">
</Transition>
<Transition StartId="26" EndId="27" type="3">
</Transition>
<Transition StartId="26" EndId="50" type="4">
</Transition>
<Transition StartId="27" EndId="28" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="3">
</Transition>
<Transition StartId="28" EndId="50" type="4">
</Transition>
<Transition StartId="29" EndId="31" type="0">
</Transition>
<Transition StartId="31" EndId="133" type="3">
</Transition>
<Transition StartId="31" EndId="132" type="4">
</Transition>
<Transition StartId="32" EndId="52" type="4">
</Transition>
<Transition StartId="32" EndId="33" type="3">
</Transition>
<Transition StartId="33" EndId="34" type="1">
<Expression>C131_SDM_Resistance_Check_Execute_Flag == true</Expression></Transition>
<Transition StartId="33" EndId="138" type="0">
</Transition>
<Transition StartId="34" EndId="35" type="3">
</Transition>
<Transition StartId="34" EndId="61" type="4">
</Transition>
<Transition StartId="35" EndId="36" type="3">
</Transition>
<Transition StartId="35" EndId="134" type="4">
</Transition>
<Transition StartId="36" EndId="2" type="0">
</Transition>
<Transition StartId="42" EndId="44" type="0">
</Transition>
<Transition StartId="43" EndId="10" type="0">
</Transition>
<Transition StartId="43" EndId="151" type="4">
</Transition>
<Transition StartId="44" EndId="43" type="0">
</Transition>
<Transition StartId="45" EndId="17" type="0">
</Transition>
<Transition StartId="49" EndId="131" type="0">
</Transition>
<Transition StartId="50" EndId="29" type="0">
</Transition>
<Transition StartId="52" EndId="33" type="0">
</Transition>
<Transition StartId="53" EndId="139" type="0">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="59" type="0">
</Transition>
<Transition StartId="57" EndId="69" type="0">
</Transition>
<Transition StartId="59" EndId="57" type="0">
</Transition>
<Transition StartId="60" EndId="20" type="0">
</Transition>
<Transition StartId="61" EndId="35" type="0">
</Transition>
<Transition StartId="68" EndId="73" type="0">
</Transition>
<Transition StartId="69" EndId="68" type="1">
<Expression>C131_SDM_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="69" EndId="73" type="0">
</Transition>
<Transition StartId="70" EndId="72" type="0">
</Transition>
<Transition StartId="72" EndId="75" type="0">
</Transition>
<Transition StartId="73" EndId="70" type="1">
<Expression>C131_SDM_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="73" EndId="75" type="0">
</Transition>
<Transition StartId="74" EndId="85" type="1">
<Expression>C131_SDM_SN_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="74" EndId="154" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="1">
<Expression>C131_SDM_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="75" EndId="167" type="0">
</Transition>
<Transition StartId="76" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="167" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="1">
<Expression>C131_SDM_SVP_Execute_Flag == true and (LibGeneral.CarTNC_Isnot_CFace(DString_C131_Car_Tpye) or LibGeneral.CarTNC_19year(DString_C131_Car_Tpye))</Expression></Transition>
<Transition StartId="79" EndId="159" type="0">
</Transition>
<Transition StartId="80" EndId="89" type="0">
</Transition>
<Transition StartId="85" EndId="87" type="0">
</Transition>
<Transition StartId="87" EndId="158" type="0">
</Transition>
<Transition StartId="89" EndId="163" type="0">
</Transition>
<Transition StartId="97" EndId="100" type="0">
</Transition>
<Transition StartId="99" EndId="110" type="0">
</Transition>
<Transition StartId="100" EndId="112" type="0">
</Transition>
<Transition StartId="101" EndId="99" type="0">
</Transition>
<Transition StartId="102" EndId="97" type="1">
<Expression>C131_SDM_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="102" EndId="112" type="0">
</Transition>
<Transition StartId="105" EndId="13" type="0">
</Transition>
<Transition StartId="106" EndId="143" type="0">
</Transition>
<Transition StartId="106" EndId="107" type="1">
<Expression>VMTLOC=="REP"</Expression></Transition>
<Transition StartId="107" EndId="143" type="0">
</Transition>
<Transition StartId="109" EndId="106" type="0">
</Transition>
<Transition StartId="110" EndId="143" type="0">
</Transition>
<Transition StartId="110" EndId="144" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_SDM_WD_Execute_Flag == true) and VMTLOC~="RIN"</Expression></Transition>
<Transition StartId="112" EndId="101" type="1">
<Expression>C131_SDM_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="112" EndId="110" type="0">
</Transition>
<Transition StartId="115" EndId="118" type="0">
</Transition>
<Transition StartId="117" EndId="115" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="1">
<Expression>VMTLOC=="REP"</Expression></Transition>
<Transition StartId="118" EndId="143" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="0">
</Transition>
<Transition StartId="120" EndId="121" type="0">
</Transition>
<Transition StartId="121" EndId="122" type="0">
</Transition>
<Transition StartId="122" EndId="124" type="0">
</Transition>
<Transition StartId="123" EndId="129" type="0">
</Transition>
<Transition StartId="124" EndId="123" type="0">
</Transition>
<Transition StartId="129" EndId="143" type="0">
</Transition>
<Transition StartId="131" EndId="24" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="0">
</Transition>
<Transition StartId="133" EndId="32" type="0">
</Transition>
<Transition StartId="134" EndId="36" type="0">
</Transition>
<Transition StartId="137" EndId="24" type="0">
</Transition>
<Transition StartId="138" EndId="36" type="0">
</Transition>
<Transition StartId="139" EndId="4" type="3">
</Transition>
<Transition StartId="139" EndId="140" type="4">
</Transition>
<Transition StartId="140" EndId="142" type="0">
</Transition>
<Transition StartId="140" EndId="141" type="5">
</Transition>
<Transition StartId="141" EndId="36" type="0">
</Transition>
<Transition StartId="142" EndId="53" type="0">
</Transition>
<Transition StartId="143" EndId="149" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="143" EndId="150" type="0">
</Transition>
<Transition StartId="144" EndId="117" type="1">
<Expression>Write_VariCoding=="2EF1A1"</Expression></Transition>
<Transition StartId="144" EndId="109" type="1">
<Expression>Write_VariCoding=="2E0100"</Expression></Transition>
<Transition StartId="147" EndId="150" type="0">
</Transition>
<Transition StartId="148" EndId="150" type="0">
</Transition>
<Transition StartId="149" EndId="147" type="1">
<Expression>Write_VariCoding=="2EF1A1"</Expression></Transition>
<Transition StartId="149" EndId="148" type="1">
<Expression>Write_VariCoding=="2E0100"</Expression></Transition>
<Transition StartId="150" EndId="105" type="0">
</Transition>
<Transition StartId="151" EndId="10" type="0">
</Transition>
<Transition StartId="152" EndId="12" type="0">
</Transition>
<Transition StartId="153" EndId="33" type="0">
</Transition>
<Transition StartId="154" EndId="157" type="1">
<Expression>C131_SDM_SN_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="154" EndId="79" type="0">
</Transition>
<Transition StartId="155" EndId="156" type="0">
</Transition>
<Transition StartId="156" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="155" type="0">
</Transition>
<Transition StartId="158" EndId="79" type="0">
</Transition>
<Transition StartId="159" EndId="162" type="1">
<Expression>C131_SDM_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="159" EndId="102" type="0">
</Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="163" type="0">
</Transition>
<Transition StartId="162" EndId="160" type="0">
</Transition>
<Transition StartId="163" EndId="102" type="0">
</Transition>
<Transition StartId="164" EndId="165" type="0">
</Transition>
<Transition StartId="165" EndId="158" type="0">
</Transition>
<Transition StartId="166" EndId="164" type="0">
</Transition>
<Transition StartId="167" EndId="74" type="0">
</Transition>
<Transition StartId="167" EndId="166" type="1">
<Expression>C131_SDM_SN_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

