<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1123" pbltext="DEP550">
<Parameters>
<Variable id="C131_DSCU_Driver_Seat_Swch_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_Seat_Up_Down_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_Seat_Forwad_Back_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_Pan_Up_Down_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_Backrest_F_B_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_Seat_Memory_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="C131_DSCU_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_DSCU_WD_Execute_Flag" type="8" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="Car_Type" type="8" dir="0" data="DString_C131_Car_Tpye"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x760" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x780" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="231" top="7" right="331" bottom="39"/>
<Script>engine.println("DSCU:"..DString_C131_Car_Tpye);

if(#DString_C131_Car_Tpye~=7)then
	engine.println("正常途径获取车型失败");
	if(#Car_Type == 7)then
		DString_C131_Car_Tpye = Car_Type;
		engine.println("Car_Type:获取到了车型");
	else
		engine.println("Car_Type:也没有获取到车型");
	end
else
	engine.println("正常途径获取车型成功");
end</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="609" top="1230" right="709" bottom="1262"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="座椅系统 (DSCU)">
<Rect left="230" top="65" right="330" bottom="97"/>
<TitleText Enable="1" Text="DSCU座椅系统"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="232" top="207" right="332" bottom="239"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="1314" name="DEP159" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="座椅前进自动测试">
<Rect left="1" top="1317" right="101" bottom="1349"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅前进"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="DSCU 座椅向前(开关)初始位置">
<Rect left="1" top="1364" right="101" bottom="1396"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1C
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="13" name="DEP533" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="驾驶员座椅后退">
<Rect top="1410" right="100" bottom="1442"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅后退"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="10" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="519" right="666" bottom="551"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="DSCU 座椅向后(开关)初始位置">
<Rect top="1456" right="100" bottom="1488"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1D
if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="14" name="DEP534" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="座椅上升自动测试">
<Rect left="1" top="1503" right="101" bottom="1535"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅整体上升"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="DSCU 座椅整体向上(开关)初始位置">
<Rect left="1" top="1551" right="101" bottom="1583"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="200"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1E

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="15" name="DEP535" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="座椅下降自动测试">
<Rect top="1601" right="100" bottom="1633"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅整体下降"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="DSCU 座椅整体向下(开关)初始位置">
<Rect left="1" top="1650" right="101" bottom="1682"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1f

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
 engine.SetLineText(3,@3);
</Script><assessment no="16" name="DEP536" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="腰拖向前自动测试">
<Rect left="2" top="1698" right="102" bottom="1730"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅腰拖向前"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="腰拖向前自动测试">
<Rect left="1" top="1749" right="101" bottom="1781"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x20

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
 -- engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="17" name="DEP537" type="8" flags="97"/>
</Activity>
<Activity id="18" ActivityType="3" flags="0" name="腰拖向后自动测试">
<Rect left="1" top="1798" right="101" bottom="1830"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="驾驶员座椅腰拖向后"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="腰拖向后自动测试">
<Rect top="1848" right="100" bottom="1880"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line3Text Enable="1" Text="驾驶员座椅腰拖向后"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x21

if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="18" name="DEP538" type="8" flags="97"/>
</Activity>
<Activity id="20" ActivityType="3" flags="0" name="前端向上自动测试">
<Rect top="1897" right="100" bottom="1929"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向上"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="DSCU 座椅前端向上(开关)初始位置">
<Rect top="1946" right="100" bottom="1978"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x22


if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="19" name="DEP539" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="前端向下自动测试">
<Rect top="1996" right="100" bottom="2028"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向下"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="DSCU 座椅前端向下(开关)初始位置">
<Rect left="1" top="2045" right="101" bottom="2077"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x23


if (@3==0x00) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);</Script><assessment no="20" name="DEP540" type="8" flags="97"/>
</Activity>
<Activity id="24" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="2" top="2097" right="102" bottom="2129"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="26" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动向前状态">
<Rect left="601" top="587" right="701" bottom="619"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前进"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1C

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
 engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP541" type="8" flags="97"/>
</Activity>
<Activity id="28" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动向后状态">
<Rect left="601" top="634" right="701" bottom="666"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅后退"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1D


if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP542" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动整体向上状态">
<Rect left="601" top="682" right="701" bottom="714"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅整体上升"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1E

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP543" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动整体向下状态">
<Rect left="602" top="733" right="702" bottom="765"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅整体下降"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1F

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="24" name="DEP544" type="8" flags="97"/>
</Activity>
<Activity id="35" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动靠背向前状态">
<Rect left="603" top="786" right="703" bottom="818"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅靠背向前"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x20

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="25" name="DEP545" type="8" flags="97"/>
</Activity>
<Activity id="37" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动靠背向后状态">
<Rect left="603" top="837" right="703" bottom="869"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅靠背向后"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x21

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="26" name="DEP546" type="8" flags="97"/>
</Activity>
<Activity id="39" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动前端向上状态">
<Rect left="604" top="890" right="704" bottom="922"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向上"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x22

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="27" name="DEP547" type="8" flags="97"/>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动前端向下状态">
<Rect left="606" top="940" right="706" bottom="972"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向下"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x23

if (@3==0x01) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP548" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="607" top="988" right="707" bottom="1020"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="4" flags="0" name="条件2">
<Rect left="641" top="1034" right="673" bottom="1066"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="整体上下移动自动测试">
<Rect left="822" top="1517" right="922" bottom="1549"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="整体上下移动"/>
<Script></Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="DSCU 驾驶员座椅整体向上初始化">
<Rect left="823" top="1468" right="923" bottom="1500"/>
<Strategy TotalTime="200" ExpectedTime="2" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line2Text Enable="1" Text="向上"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x00 0x03 0x00</Script></Activity>
<Activity id="46" ActivityType="3" flags="0" name="自动测试">
<Rect left="823" top="1418" right="923" bottom="1450"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="整体上下移动"/>
<Line3Text Enable="1"/>
<Script></Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="上升停止">
<Rect left="823" top="1319" right="923" bottom="1351"/>
<Script>#COMM  0x2f  0x02 0x00 0x03 0x02

</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="整体下移动">
<Rect left="940" top="1318" right="1040" bottom="1350"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="整体上下移动"/>
<Script></Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="座椅整体向下">
<Rect left="940" top="1366" right="1040" bottom="1398"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x00 0x03 0x01</Script></Activity>
<Activity id="50" ActivityType="3" flags="0" name="自动测试">
<Rect left="939" top="1417" right="1039" bottom="1449"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="整体上下移动"/>
<Line3Text Enable="1" Text="向下"/>
<Script></Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="发送 停止下降">
<Rect left="938" top="1518" right="1038" bottom="1550"/>
<Script>#COMM  0x2f  0x02 0x00 0x03 0x02

</Script></Activity>
<Activity id="52" ActivityType="3" flags="0" name="默认复位">
<Rect left="938" top="1567" right="1038" bottom="1599"/>
<Script>#COMM 0x2f  0x02 0x00 0x00


</Script></Activity>
<Activity id="53" ActivityType="4" flags="0" name="条件3">
<Rect left="974" top="1615" right="1006" bottom="1647"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="自动测试">
<Rect left="941" top="1669" right="1041" bottom="1701"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="向前移动"/>
<Script></Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="座椅向前">
<Rect left="941" top="1718" right="1041" bottom="1750"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x01 0x03 0x00

</Script></Activity>
<Activity id="56" ActivityType="3" flags="0" name="自动测试">
<Rect left="942" top="1812" right="1042" bottom="1844"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="前后移动停止"/>
<Script>--#COMM 0x2f  0x02 0x01 0x03 0x02
</Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="发送">
<Rect left="943" top="1862" right="1043" bottom="1894"/>
<Script>#COMM 0x2f  0x02 0x01 0x03 0x02



</Script></Activity>
<Activity id="58" ActivityType="3" flags="0" name="DSCU 驾驶员座椅向后初始化">
<Rect left="946" top="1909" right="1046" bottom="1941"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x01 0x03 0x01</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="自动测试">
<Rect left="945" top="1955" right="1045" bottom="1987"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="前后移动"/>
<Line3Text Enable="1" Text="向后"/>
<Script></Script></Activity>
<Activity id="60" ActivityType="3" flags="0" name="发送">
<Rect left="946" top="2052" right="1046" bottom="2084"/>
<Script>#COMM  0x2f  0x02 0x01 0x03 0x02




</Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="默认复位">
<Rect left="949" top="2097" right="1049" bottom="2129"/>
<Script>#COMM 0x2f  0x02 0x01 0x00




</Script></Activity>
<Activity id="62" ActivityType="4" flags="0" name="条件4">
<Rect left="1107" top="2096" right="1139" bottom="2128"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="自动测试">
<Rect left="1073" top="2153" right="1173" bottom="2185"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="前端上下移动."/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--#DELAY 2000
</Script></Activity>
<Activity id="64" ActivityType="3" flags="0" name="DSCU 座椅前端上移初始化">
<Rect left="1073" top="2203" right="1173" bottom="2235"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x02 0x03 0x00</Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="前端向上自动测试">
<Rect left="1072" top="2249" right="1172" bottom="2281"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="前端上下移动"/>
<Line3Text Enable="1" Text="前端上"/>
<Script></Script></Activity>
<Activity id="66" ActivityType="3" flags="0" name="发送向上停止">
<Rect left="1196" top="2202" right="1296" bottom="2234"/>
<Script>#COMM 0x2f  0x02 0x02 0x03 0x02




</Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="前端下移">
<Rect left="1194" top="2104" right="1294" bottom="2136"/>
<Strategy NokTime="0" RetryTimeOut="20"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x02 0x03 0x01
</Script></Activity>
<Activity id="68" ActivityType="3" flags="0" name="自动测试">
<Rect left="1196" top="2155" right="1296" bottom="2187"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="前端上下移动"/>
<Line3Text Enable="1" Text="前端下"/>
<Script></Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="发送">
<Rect left="1194" top="2006" right="1294" bottom="2038"/>
<Script>#COMM  0x2f  0x02 0x02 0x03 0x02







</Script></Activity>
<Activity id="70" ActivityType="3" flags="0" name="默认复位">
<Rect left="1194" top="1955" right="1294" bottom="1987"/>
<Script>#COMM 0x2f  0x02 0x02 0x00




</Script></Activity>
<Activity id="71" ActivityType="4" flags="0" name="条件5">
<Rect left="1227" top="1904" right="1259" bottom="1936"/>
</Activity>
<Activity id="72" ActivityType="3" flags="0" name="自动测试">
<Rect left="1193" top="1850" right="1293" bottom="1882"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="靠背前后移动."/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>--#DELAY 2000
</Script></Activity>
<Activity id="73" ActivityType="3" flags="0" name="靠背向前">
<Rect left="1193" top="1804" right="1293" bottom="1836"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f 0x02 0x03 0x03 0x00

</Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="自动测试">
<Rect left="1192" top="1756" right="1292" bottom="1788"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="靠背前后移动."/>
<Line3Text Enable="1" Text="靠背向前"/>
<Script></Script></Activity>
<Activity id="75" ActivityType="3" flags="0" name="发送停止向前">
<Rect left="1191" top="1658" right="1291" bottom="1690"/>
<Script>#COMM   0x2f  0x02 0x03 0x03 0x02






</Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="靠背向后">
<Rect left="1190" top="1563" right="1290" bottom="1595"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2f  0x02 0x03 0x03 0x01

</Script></Activity>
<Activity id="77" ActivityType="3" flags="0" name="自动测试">
<Rect left="1190" top="1610" right="1290" bottom="1642"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1" Text="靠背前后移动."/>
<Line3Text Enable="1" Text="靠背向后"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="发送向后停止">
<Rect left="1190" top="1465" right="1290" bottom="1497"/>
<Script>#COMM   0x2f  0x02 0x03 0x03 0x02







</Script></Activity>
<Activity id="79" ActivityType="3" flags="0" name="默认复位">
<Rect left="1190" top="1417" right="1290" bottom="1449"/>
<Script>#COMM 0x2f  0x02 0x03 0x00




</Script></Activity>
<Activity id="80" ActivityType="4" flags="0" name="条件6">
<Rect left="1224" top="1364" right="1256" bottom="1396"/>
</Activity>
<Activity id="82" ActivityType="3" flags="0" name="手动测试">
<Rect left="607" top="1084" right="707" bottom="1116"/>
<Line1Text Enable="1" Text="按座椅记忆1和3持续3秒"/>
<Line2Text Enable="1" Text="听到滴滴声了吗？"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
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

</Script><assessment no="29" name="DEP549" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="608" top="1131" right="708" bottom="1163"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="85" ActivityType="4" flags="0" name="路由节点">
<Rect left="1127" top="1644" right="1159" bottom="1676"/>
</Activity>
<Activity id="91" ActivityType="3" flags="0" name="延时">
<Rect left="823" top="1368" right="923" bottom="1400"/>
<Line3Text Enable="1" Text="向上"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="92" ActivityType="3" flags="0" name="延时">
<Rect left="940" top="1468" right="1040" bottom="1500"/>
<Line3Text Enable="1" Text="向下"/>
<Script>#DELAY 2000
</Script></Activity>
<Activity id="93" ActivityType="3" flags="0" name="延时">
<Rect left="941" top="1764" right="1041" bottom="1796"/>
<Line3Text Enable="1" Text="向前"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="94" ActivityType="3" flags="0" name="延时">
<Rect left="946" top="2005" right="1046" bottom="2037"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="延时">
<Rect left="1195" top="2248" right="1295" bottom="2280"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="96" ActivityType="3" flags="0" name="延时">
<Rect left="1194" top="2057" right="1294" bottom="2089"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="延时">
<Rect left="1192" top="1706" right="1292" bottom="1738"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="延时">
<Rect left="1190" top="1515" right="1290" bottom="1547"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="检测失败">
<Rect left="121" top="1365" right="221" bottom="1397"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="检测失败">
<Rect left="117" top="1457" right="217" bottom="1489"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="检测失败">
<Rect left="115" top="1551" right="215" bottom="1583"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="检测失败">
<Rect left="118" top="1651" right="218" bottom="1683"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="检测失败">
<Rect left="117" top="1749" right="217" bottom="1781"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="检测失败">
<Rect left="118" top="1848" right="218" bottom="1880"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="检测失败">
<Rect left="117" top="1946" right="217" bottom="1978"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="检测失败">
<Rect left="116" top="2045" right="216" bottom="2077"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="检测失败">
<Rect left="714" top="589" right="814" bottom="621"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="检测失败">
<Rect left="713" top="634" right="813" bottom="666"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="检测失败">
<Rect left="713" top="682" right="813" bottom="714"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="检测失败">
<Rect left="714" top="733" right="814" bottom="765"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="检测失败">
<Rect left="716" top="784" right="816" bottom="816"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="检测失败">
<Rect left="717" top="836" right="817" bottom="868"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="检测失败">
<Rect left="715" top="891" right="815" bottom="923"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="检测失败">
<Rect left="718" top="939" right="818" bottom="971"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="连接ECU">
<Rect left="231" top="113" right="331" bottom="145"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="切诊断">
<Rect left="233" top="253" right="333" bottom="285"/>
<Script>#COMM 0x10 0x03
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

end</Script><assessment no="1315" name="DEP1077" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="234" top="301" right="334" bottom="333"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
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

end</Script></Activity>
<Activity id="121" ActivityType="3" flags="0" name="发送key">
<Rect left="236" top="397" right="336" bottom="429"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<Line1Text Enable="1" Text="发送KEY"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
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

end</Script></Activity>
<Activity id="122" ActivityType="13" flags="0" name="函数调用节点">
<Rect left="235" top="349" right="335" bottom="381"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xA0CEDFB1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="比对零件号">
<Rect left="350" top="74" right="450" bottom="106"/>
<Line1Text Enable="1" Text="比对零件号"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x87
engine.SetLineText(2,DString_C131_Partnumber);
engine.println("零件号标准值:"..DString_C131_Partnumber);
if(@0==0x62)then
	--DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12); 
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
recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end
</Script><assessment no="1" name="DEP526" type="8" flags="105"/>
</Activity>
<Activity id="127" ActivityType="4" flags="0" name="路由节点">
<Rect left="384" top="14" right="416" bottom="46"/>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="读硬件号">
<Rect left="470" top="64" right="570" bottom="96"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件号:"..DString1);

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

end</Script><assessment no="2" name="DEP527" type="8" flags="105"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="延时300MS">
<Rect left="470" top="124" right="570" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="130" ActivityType="4" flags="0" name="路由节点">
<Rect left="504" top="14" right="536" bottom="46"/>
</Activity>
<Activity id="131" ActivityType="4" flags="0" name="路由节点">
<Rect left="784" top="14" right="816" bottom="46"/>
</Activity>
<Activity id="132" ActivityType="4" flags="0" name="路由节点">
<Rect left="654" top="14" right="686" bottom="46"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="620" top="74" right="720" bottom="106"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("硬件版本号:"..DString1);

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

end</Script><assessment no="3" name="DEP528" type="8" flags="105"/>
</Activity>
<Activity id="134" ActivityType="3" flags="0" name="延时300MS">
<Rect left="620" top="114" right="720" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="读软件号">
<Rect left="750" top="74" right="850" bottom="106"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@18);
engine.SetLineText(3,DString1);
engine.println("软件号:"..DString1);

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

end</Script><assessment no="4" name="DEP529" type="8" flags="105"/>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="延时300MS">
<Rect left="750" top="124" right="850" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="137" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="880" top="74" right="980" bottom="106"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
StandValue="1.37";
engine.SetLineText(2,StandValue);
engine.println("软件版本号标准值:"..StandValue);
if(@0==0x62)then
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("1.37" == DString1) then 
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
recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="5" name="DEP530" type="8" flags="105"/>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="延时300MS">
<Rect left="880" top="124" right="980" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="139" ActivityType="4" flags="0" name="路由节点">
<Rect left="914" top="14" right="946" bottom="46"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1750" top="524" right="1850" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1300" top="64" right="1400" bottom="96"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>vin=DString_Write_VIN;
engine.SetLineText(3,vin);
#COMM 0x2E 0xF1 0x90 vin


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

end</Script><assessment no="6" name="DEP531" type="8" flags="97"/>
</Activity>
<Activity id="142" ActivityType="3" flags="0" name="读VIN">
<Rect left="1300" top="124" right="1400" bottom="156"/>
<Line1Text Enable="1" Text="读VIN"/>
<Script>#COMM 0x22 0xF1 0x90
engine.SetLineText(2,DString_Write_VIN);
engine.println("VIN标准值:"..DString_Write_VIN);
if(@0==0x62)then
	--DString1=bytesStr(@3-@19);
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
recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="7" name="DEP532" type="8" flags="97"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="日期读取">
<Rect left="1420" top="124" right="1520" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="9" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="144" ActivityType="3" flags="0" name="发送时间">
<Rect left="1420" top="64" right="1520" bottom="96"/>
<Line1Text Enable="1" Text="发送时间"/>
<Script>engine.println("时间:");
date=os.date("%Y%m%d");
engine.SetLineText(3,date);
engine.println(date);
#COMM 0x2E 0xF1 0x9D hex2dec(date,1) hex2dec(date,3) hex2dec(date,5) hex2dec(date,7) 


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

end</Script><assessment no="8" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="145" ActivityType="4" flags="0" name="路由节点">
<Rect left="1334" top="14" right="1366" bottom="46"/>
</Activity>
<Activity id="146" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1530" top="124" right="1630" bottom="156"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="147" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1650" top="64" right="1750" bottom="96"/>
<Line1Text Enable="1" Text="比对配置码"/>
<Script>#COMM 0x22 0x01 0x00
engine.println("配置码标准值:"..DString_C131_VariCoding);
if(@0==0x62)then
	DString_Read_Config_Code_From_ECU=hexstr(@3-@18);
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
end</Script><assessment no="12" name="DEP239" type="8" flags="97"/>
</Activity>
<Activity id="148" ActivityType="3" flags="0" name="写配置码">
<Rect left="1530" top="64" right="1630" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2E 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)


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

end</Script><assessment no="11" name="DEP238" type="8" flags="97"/>
</Activity>
<Activity id="149" ActivityType="4" flags="0" name="路由节点">
<Rect left="1564" top="14" right="1596" bottom="46"/>
</Activity>
<Activity id="150" ActivityType="4" flags="0" name="路由节点">
<Rect left="1454" top="14" right="1486" bottom="46"/>
</Activity>
<Activity id="152" ActivityType="4" flags="0" name="路由节点">
<Rect left="1694" top="14" right="1726" bottom="46"/>
</Activity>
<Activity id="153" ActivityType="4" flags="0" name="路由节点">
<Rect left="542" top="809" right="574" bottom="841"/>
</Activity>
<Activity id="154" ActivityType="4" flags="0" name="路由节点">
<Rect left="555" top="1087" right="587" bottom="1119"/>
</Activity>
<Activity id="155" ActivityType="3" flags="0" name="通讯">
<Rect left="231" top="159" right="331" bottom="191"/>
<Script>#COMM 0x22 0xf1 0x87

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

end</Script><assessment no="1313" name="DEP158" type="8" flags="97"/>
</Activity>
<Activity id="156" ActivityType="3" flags="0" name="通讯失败">
<Rect left="102" top="162" right="202" bottom="194"/>
<Line1Text Enable="1" Text="DSCU 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="157" ActivityType="4" flags="0" name="路由节点">
<Rect left="135" top="1132" right="167" bottom="1164"/>
</Activity>
<Activity id="158" ActivityType="3" flags="0" name="结束通讯">
<Rect left="101" top="112" right="201" bottom="144"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="159" ActivityType="4" flags="0" name="路由节点">
<Rect left="1784" top="14" right="1816" bottom="46"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1010" top="124" right="1110" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="2.00";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="1.37";
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM42" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="1.37";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or DString_C131_Car_Tpye=="CH1AM48" or DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="1.37";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="1.37";
	else
		StandValue="1.37";
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5,@6);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
	--if("1.37" == DString1) then 
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
end</Script><assessment no="5" name="DEP530" type="8" flags="105"/>
</Activity>
<Activity id="161" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1010" top="174" right="1110" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="162" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="14" right="1076" bottom="46"/>
</Activity>
<Activity id="163" ActivityType="4" flags="0" name="路由节点">
<Rect left="1044" top="224" right="1076" bottom="256"/>
</Activity>
<Activity id="164" ActivityType="3" flags="0" name="改脸">
<Rect left="1010" top="74" right="1110" bottom="106"/>
<Script></Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1140" top="124" right="1240" bottom="156"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue="1.37"
        engine.println("软件版本号标准值:"..StandValue);
	if(StandValue~="")then
		engine.SetLineText(2,StandValue);
                DString1 = engine.GetResponseString(3,2+#StandValue);
		engine.SetLineText(3,DString1);
		engine.println("软件版本号:"..DString1);
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
		StringRes = engine.GetResponseString(0,engine.GetResponseSize());
		engine.StatValue=hexstr(StringRes);
		engine.println("不比对软件版本号");
                
	end              
else
	engine.LastError = 1;
	engine.TestResult = 1;
recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="5" name="DEP530" type="8" flags="105"/>
</Activity>
<Activity id="166" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1140" top="174" right="1240" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="167" ActivityType="3" flags="0" name="19年型">
<Rect left="1140" top="74" right="1240" bottom="106"/>
<Script></Script></Activity>
<Activity id="168" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="14" right="1206" bottom="46"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="117" type="0">
</Transition>
<Transition StartId="4" EndId="118" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="99" type="4">
</Transition>
<Transition StartId="8" EndId="9" type="3">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="10" EndId="26" type="1">
<Expression>C131_DSCU_Driver_Seat_Swch_Execute_Flag == true</Expression></Transition>
<Transition StartId="10" EndId="153" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="3">
</Transition>
<Transition StartId="11" EndId="100" type="4">
</Transition>
<Transition StartId="12" EndId="13" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="3">
</Transition>
<Transition StartId="13" EndId="101" type="4">
</Transition>
<Transition StartId="14" EndId="15" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="3">
</Transition>
<Transition StartId="15" EndId="102" type="4">
</Transition>
<Transition StartId="16" EndId="17" type="0">
</Transition>
<Transition StartId="17" EndId="18" type="3">
</Transition>
<Transition StartId="17" EndId="103" type="4">
</Transition>
<Transition StartId="18" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="3">
</Transition>
<Transition StartId="19" EndId="104" type="4">
</Transition>
<Transition StartId="20" EndId="21" type="0">
</Transition>
<Transition StartId="21" EndId="22" type="3">
</Transition>
<Transition StartId="21" EndId="105" type="4">
</Transition>
<Transition StartId="22" EndId="23" type="0">
</Transition>
<Transition StartId="23" EndId="24" type="3">
</Transition>
<Transition StartId="23" EndId="106" type="4">
</Transition>
<Transition StartId="26" EndId="28" type="3">
</Transition>
<Transition StartId="26" EndId="107" type="4">
</Transition>
<Transition StartId="28" EndId="31" type="3">
</Transition>
<Transition StartId="28" EndId="108" type="4">
</Transition>
<Transition StartId="31" EndId="33" type="3">
</Transition>
<Transition StartId="31" EndId="109" type="4">
</Transition>
<Transition StartId="33" EndId="35" type="3">
</Transition>
<Transition StartId="33" EndId="110" type="4">
</Transition>
<Transition StartId="35" EndId="37" type="3">
</Transition>
<Transition StartId="35" EndId="111" type="4">
</Transition>
<Transition StartId="37" EndId="39" type="3">
</Transition>
<Transition StartId="37" EndId="112" type="4">
</Transition>
<Transition StartId="39" EndId="113" type="4">
</Transition>
<Transition StartId="39" EndId="41" type="3">
</Transition>
<Transition StartId="41" EndId="42" type="3">
</Transition>
<Transition StartId="41" EndId="114" type="4">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="82" type="1">
<Expression>C131_DSCU_Seat_Memory_Execute_Flag == true</Expression></Transition>
<Transition StartId="43" EndId="154" type="0">
</Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="0">
</Transition>
<Transition StartId="46" EndId="91" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="0">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="50" type="0">
</Transition>
<Transition StartId="50" EndId="92" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="0">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="54" type="1">
<Expression>C131_DSCU_Seat_Forwad_Back_Execute_Flag == true</Expression></Transition>
<Transition StartId="53" EndId="62" type="0">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="93" type="0">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="94" type="0">
</Transition>
<Transition StartId="60" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="0">
</Transition>
<Transition StartId="62" EndId="63" type="1">
<Expression>C131_DSCU_Pan_Up_Down_Execute_Flag == true</Expression></Transition>
<Transition StartId="62" EndId="71" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="0">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="95" type="0">
</Transition>
<Transition StartId="66" EndId="68" type="0">
</Transition>
<Transition StartId="67" EndId="96" type="0">
</Transition>
<Transition StartId="68" EndId="67" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="0">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="1">
<Expression>C131_DSCU_Backrest_F_B_Execute_Flag == true</Expression></Transition>
<Transition StartId="71" EndId="85" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="97" type="0">
</Transition>
<Transition StartId="75" EndId="77" type="0">
</Transition>
<Transition StartId="76" EndId="98" type="0">
</Transition>
<Transition StartId="77" EndId="76" type="0">
</Transition>
<Transition StartId="78" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="82" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="2" type="0">
</Transition>
<Transition StartId="85" EndId="80" type="0">
</Transition>
<Transition StartId="91" EndId="47" type="0">
</Transition>
<Transition StartId="92" EndId="51" type="0">
</Transition>
<Transition StartId="93" EndId="56" type="0">
</Transition>
<Transition StartId="94" EndId="60" type="0">
</Transition>
<Transition StartId="95" EndId="66" type="0">
</Transition>
<Transition StartId="96" EndId="69" type="0">
</Transition>
<Transition StartId="97" EndId="75" type="0">
</Transition>
<Transition StartId="98" EndId="78" type="0">
</Transition>
<Transition StartId="99" EndId="9" type="0">
</Transition>
<Transition StartId="100" EndId="12" type="0">
</Transition>
<Transition StartId="101" EndId="14" type="0">
</Transition>
<Transition StartId="102" EndId="16" type="0">
</Transition>
<Transition StartId="103" EndId="18" type="0">
</Transition>
<Transition StartId="104" EndId="20" type="0">
</Transition>
<Transition StartId="105" EndId="22" type="0">
</Transition>
<Transition StartId="106" EndId="24" type="0">
</Transition>
<Transition StartId="107" EndId="28" type="0">
</Transition>
<Transition StartId="108" EndId="31" type="0">
</Transition>
<Transition StartId="109" EndId="33" type="0">
</Transition>
<Transition StartId="110" EndId="35" type="0">
</Transition>
<Transition StartId="111" EndId="37" type="0">
</Transition>
<Transition StartId="112" EndId="39" type="0">
</Transition>
<Transition StartId="113" EndId="41" type="0">
</Transition>
<Transition StartId="114" EndId="42" type="0">
</Transition>
<Transition StartId="117" EndId="155" type="0">
</Transition>
<Transition StartId="118" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="122" type="0">
</Transition>
<Transition StartId="121" EndId="127" type="0">
</Transition>
<Transition StartId="122" EndId="121" type="0">
</Transition>
<Transition StartId="126" EndId="130" type="0">
</Transition>
<Transition StartId="127" EndId="126" type="1">
<Expression>C131_DSCU_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="127" EndId="130" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="0">
</Transition>
<Transition StartId="129" EndId="132" type="0">
</Transition>
<Transition StartId="130" EndId="128" type="1">
<Expression>C131_DSCU_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="130" EndId="132" type="0">
</Transition>
<Transition StartId="131" EndId="135" type="1">
<Expression>C131_DSCU_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="131" EndId="139" type="0">
</Transition>
<Transition StartId="132" EndId="133" type="1">
<Expression>C131_DSCU_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="132" EndId="131" type="0">
</Transition>
<Transition StartId="133" EndId="134" type="0">
</Transition>
<Transition StartId="134" EndId="131" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="0">
</Transition>
<Transition StartId="136" EndId="139" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="0">
</Transition>
<Transition StartId="138" EndId="163" type="0">
</Transition>
<Transition StartId="139" EndId="137" type="1">
<Expression>C131_DSCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFace(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="139" EndId="162" type="0">
</Transition>
<Transition StartId="140" EndId="10" type="0">
</Transition>
<Transition StartId="141" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="150" type="0">
</Transition>
<Transition StartId="143" EndId="149" type="0">
</Transition>
<Transition StartId="144" EndId="143" type="0">
</Transition>
<Transition StartId="145" EndId="141" type="1">
<Expression>C131_DSCU_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="145" EndId="150" type="0">
</Transition>
<Transition StartId="146" EndId="152" type="0">
</Transition>
<Transition StartId="147" EndId="159" type="0">
</Transition>
<Transition StartId="148" EndId="146" type="0">
</Transition>
<Transition StartId="149" EndId="148" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_DSCU_WD_Execute_Flag == true) and VMTLOC ~= "FIN"</Expression></Transition>
<Transition StartId="149" EndId="152" type="0">
</Transition>
<Transition StartId="150" EndId="144" type="1">
<Expression>C131_DSCU_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="150" EndId="149" type="0">
</Transition>
<Transition StartId="152" EndId="147" type="1">
<Expression>((DString_C131_VariCoding ~= "") and (C131_DSCU_WD_Execute_Flag == true or VMTLOC=="FIN"))</Expression></Transition>
<Transition StartId="152" EndId="159" type="0">
</Transition>
<Transition StartId="153" EndId="43" type="0">
</Transition>
<Transition StartId="154" EndId="83" type="0">
</Transition>
<Transition StartId="155" EndId="4" type="3">
</Transition>
<Transition StartId="155" EndId="156" type="4">
</Transition>
<Transition StartId="156" EndId="157" type="5">
</Transition>
<Transition StartId="156" EndId="158" type="0">
</Transition>
<Transition StartId="157" EndId="83" type="0">
</Transition>
<Transition StartId="158" EndId="117" type="0">
</Transition>
<Transition StartId="159" EndId="140" type="0">
</Transition>
<Transition StartId="160" EndId="161" type="0">
</Transition>
<Transition StartId="161" EndId="163" type="0">
</Transition>
<Transition StartId="162" EndId="164" type="1">
<Expression>C131_DSCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="162" EndId="168" type="0">
</Transition>
<Transition StartId="163" EndId="145" type="0">
</Transition>
<Transition StartId="164" EndId="160" type="0">
</Transition>
<Transition StartId="165" EndId="166" type="0">
</Transition>
<Transition StartId="166" EndId="163" type="0">
</Transition>
<Transition StartId="167" EndId="165" type="0">
</Transition>
<Transition StartId="168" EndId="145" type="0">
</Transition>
<Transition StartId="168" EndId="167" type="1">
<Expression>C131_DSCU_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
</Transitions>
</Process>

