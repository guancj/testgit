<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1145" pbltext="DEP91">
<Parameters>
<Variable id="DString_Write_VIN" type="8" dir="0" data="DString_Write_VIN"/>
<Variable id="DString_C131_VariCoding" type="8" dir="0" data="DString_C131_VariCoding"/>
<Variable id="DString_C131_Partnumber" type="8" dir="0" data="DString_C131_Partnumber"/>
<Variable id="DString_C131_handleswic_PEPS" type="8" dir="0" data="DString_C131_handleswic_PEPS"/>
<Variable id="C131_PEPS_Smart_Lock_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_Smart_Start_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="C131_PEPS_Smart_Unlock_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_OEM_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_HN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_HVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_SN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_SVP_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_CID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_VIN_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_EID_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="C131_PEPS_WD_Execute_Flag" type="11" dir="0" data="true"/>
<Variable id="VMTLOC" type="8" dir="0" data="VMTLOC"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x784" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="113" top="10" right="213" bottom="42"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="441" top="4017" right="541" bottom="4049"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="智能进入系统 (PEPS)">
<Rect left="112" top="67" right="212" bottom="99"/>
<TitleText Enable="1" Text="智能进入系统 (PEPS)"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="清DTC">
<Rect left="112" top="225" right="212" bottom="257"/>
<Line1Text Enable="1" Text="清除DTC"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF
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

end</Script><assessment no="2010" name="DEP93" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="4" flags="0" name="路由节点">
<Rect left="460" top="467" right="492" bottom="499"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="坐在驾驶员座椅手动确认">
<Rect left="426" top="524" right="526" bottom="556"/>
<Line1Text Enable="1" Text="请坐在驾驶员座椅上！"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="9" ActivityType="3" flags="0" name="按启动按钮手动确认">
<Rect left="426" top="577" right="526" bottom="609"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请长按启动按钮"/>
<Script></Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="PEPS 开关位置状态">
<Rect left="429" top="624" right="529" bottom="656"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x01
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

end</Script><assessment no="14" name="DEP718" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="待定">
<Rect left="429" top="675" right="529" bottom="707"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x02

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

end</Script><assessment no="15" name="DEP719" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="PEPS 匹配 ESCL 状态">
<Rect left="210" top="804" right="310" bottom="836"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="15"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="电子转向柱匹配状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x29

engine.SetLineText(3,@3);
if(@0 == 0x62)then
	if(@3==0x02)then
		engine.LastError = 0;
	else
		engine.LastError = 1;
        end
else
	engine.LastError = 1;
end
engine.println(" engine.LastError=".. engine.LastError);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);

--[[
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
--]]</Script><assessment no="16" name="DEP720" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="PEPS 读发动机转速">
<Rect left="429" top="892" right="529" bottom="924"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="发动机转速"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x32

if(@0==0x62)then
resu = ((@2*256+@3)*0.25) * 1.0;
speed=resu;

if (speed&gt;0 and speed&lt;16383.5) then
  engine.LastError = 0;
  engine.StatValue=speed;
  --OK=OK+1;
  --engine.SetLineText(4,@3..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  engine.StatValue=speed;
  engine.StatLower=0;
  engine.StatUpper=16383.5;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end
engine.SetLineText(3,@3);

else
engine.TestResult = 1;
engine.LastError = 1;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="17" name="DEP721" type="8" flags="97"/>
</Activity>
<Activity id="21" ActivityType="3" flags="0" name="PEPS IG1 控制">
<Rect left="431" top="1006" right="531" bottom="1038"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="IG1 继电器控制"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x11
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

end</Script><assessment no="19" name="DEP723" type="8" flags="97"/>
</Activity>
<Activity id="23" ActivityType="3" flags="0" name="PEPS IG2 控制">
<Rect left="430" top="1064" right="530" bottom="1096"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="IG2 继电器控制"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x12
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

end</Script><assessment no="20" name="DEP724" type="8" flags="97"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="PEPS 点火开关位置">
<Rect left="430" top="1119" right="530" bottom="1151"/>
<Strategy TotalTime="50" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="点火开关位置"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x2A

  if (@3==0x02) then
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

end</Script><assessment no="21" name="DEP725" type="8" flags="97"/>
</Activity>
<Activity id="26" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="430" top="1177" right="530" bottom="1209"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="27" ActivityType="3" flags="0" name="关闭点火开关">
<Rect left="430" top="1234" right="530" bottom="1266"/>
<Line1Text Enable="1" Text="请关闭点火开关"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="锁定4个车门，准备测试">
<Rect left="428" top="1363" right="528" bottom="1395"/>
<Line1Text Enable="1" Text="拿着钥匙在车外，完全关闭4个车门"/>
<Line3Text Enable="1" Text="锁定4个车门，准备测试！"/>
<ButtonLText Enable="1" Text="放弃测试"/>
<ButtonRText Enable="1" Text="开始测试"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="手动测试">
<Rect left="428" top="1410" right="528" bottom="1442"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将司机门完全关闭"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="30" ActivityType="3" flags="0" name="PEPS 司机门完全关闭">
<Rect left="428" top="1455" right="528" bottom="1487"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1b
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

end</Script><assessment no="22" name="DEP726" type="8" flags="97"/>
</Activity>
<Activity id="31" ActivityType="3" flags="0" name="手动测试">
<Rect left="429" top="1501" right="529" bottom="1533"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将乘客门完全关闭"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="32" ActivityType="3" flags="0" name="PEPS 乘客门完全关闭">
<Rect left="428" top="1554" right="528" bottom="1586"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
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
engine.SetLineText(3,@3);

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

end</Script><assessment no="23" name="DEP727" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="4" flags="0" name="路由节点">
<Rect left="463" top="1296" right="495" bottom="1328"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="手动测试">
<Rect left="428" top="1599" right="528" bottom="1631"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将左后门完全关闭"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="PEPS 左后门完全关闭">
<Rect left="429" top="1646" right="529" bottom="1678"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x25

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

end</Script><assessment no="24" name="DEP728" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="手动测试">
<Rect left="430" top="1693" right="530" bottom="1725"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请将右后门完全关闭"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="39" ActivityType="3" flags="0" name="PEPS 右后门完全关闭">
<Rect left="430" top="1742" right="530" bottom="1774"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28

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

end</Script><assessment no="25" name="DEP729" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="手动测试">
<Rect left="430" top="1787" right="530" bottom="1819"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="司机门，请上锁"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="41" ActivityType="3" flags="0" name="PEPS 司机门上锁">
<Rect left="430" top="1835" right="530" bottom="1867"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1a
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

end</Script><assessment no="26" name="DEP730" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="手动测试">
<Rect left="430" top="1882" right="530" bottom="1914"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="乘客门，请上锁"/>
<Line3Text Enable="1" Text="车门关闭状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="3" flags="0" name="PEPS 乘客门上锁">
<Rect left="431" top="1929" right="531" bottom="1961"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
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
engine.SetLineText(3,@3);
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

end</Script><assessment no="27" name="DEP731" type="8" flags="97"/>
</Activity>
<Activity id="44" ActivityType="3" flags="0" name="手动测试">
<Rect left="432" top="1977" right="532" bottom="2009"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="左后门，请上锁"/>
<Line3Text Enable="1" Text="车门 锁定状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="45" ActivityType="3" flags="0" name="PEPS 左后门上锁">
<Rect left="432" top="2031" right="532" bottom="2063"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x23
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
 engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="手动测试">
<Rect left="432" top="2078" right="532" bottom="2110"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="右后门，请上锁"/>
<Line3Text Enable="1" Text="车门 锁定状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="PEPS 右后门上锁">
<Rect left="433" top="2123" right="533" bottom="2155"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x26

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
engine.SetLineText(3,@3);

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

end</Script><assessment no="29" name="DEP733" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="手动测试">
<Rect left="432" top="2170" right="532" bottom="2202"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开司机门"/>
<Line3Text Enable="1" Text="车门 锁定状态"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="PEPS 司机门接近传感器">
<Rect left="432" top="2223" right="532" bottom="2255"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x07

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

end</Script><assessment no="30" name="DEP734" type="8" flags="97"/>
</Activity>
<Activity id="50" ActivityType="3" flags="0" name="手动测试">
<Rect left="432" top="2276" right="532" bottom="2308"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除司机门锁"/>
<Line3Text Enable="1" Text="车门解锁状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="51" ActivityType="3" flags="0" name="PEPS 司机门接近解锁">
<Rect left="433" top="2324" right="533" bottom="2356"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1a
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

end</Script><assessment no="31" name="DEP735" type="8" flags="97"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="打开司机门手动测试">
<Rect left="434" top="2371" right="534" bottom="2403"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开司机门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="53" ActivityType="3" flags="0" name="PEPS 手动打开司机门">
<Rect left="435" top="2418" right="535" bottom="2450"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x1b

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

end</Script><assessment no="32" name="DEP736" type="8" flags="97"/>
</Activity>
<Activity id="54" ActivityType="3" flags="0" name="感应式打开左后门手动测试">
<Rect left="436" top="2467" right="536" bottom="2499"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开左后门"/>
<Line3Text Enable="1" Text="接近传感器状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="PEPS 左后门接近传感器">
<Rect left="435" top="2512" right="535" bottom="2544"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x08
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

end</Script><assessment no="33" name="DEP737" type="8" flags="97"/>
</Activity>
<Activity id="56" ActivityType="3" flags="0" name="手动测试">
<Rect left="434" top="2559" right="534" bottom="2591"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除左后门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="57" ActivityType="3" flags="0" name="PEPS 左后门接近解锁">
<Rect left="434" top="2612" right="534" bottom="2644"/>
<Strategy TotalTime="100" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
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

end</Script><assessment no="34" name="DEP738" type="8" flags="97"/>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="打开左侧后门手动测试">
<Rect left="434" top="2658" right="534" bottom="2690"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左侧后门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="PEPS 手动打开左后门">
<Rect left="433" top="2705" right="533" bottom="2737"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x25
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

end</Script><assessment no="35" name="DEP739" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="手动测试">
<Rect left="433" top="2758" right="533" bottom="2790"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开右后门"/>
<Line3Text Enable="1" Text="接近传感器 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="61" ActivityType="3" flags="0" name="PEPS 右后门接近传感器">
<Rect left="433" top="2806" right="533" bottom="2838"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x0a
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

end</Script><assessment no="36" name="DEP740" type="8" flags="97"/>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="手动测试">
<Rect left="432" top="2857" right="532" bottom="2889"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除右后门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="63" ActivityType="3" flags="0" name="右后门接近解锁">
<Rect left="433" top="2904" right="533" bottom="2936"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x26
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

end</Script><assessment no="37" name="DEP741" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="手动测试">
<Rect left="434" top="2954" right="534" bottom="2986"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开右后门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="65" ActivityType="3" flags="0" name="手动打开右后门">
<Rect left="435" top="3000" right="535" bottom="3032"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x28
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

end</Script><assessment no="38" name="DEP742" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="3" flags="0" name="手动测试">
<Rect left="436" top="3050" right="536" bottom="3082"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开乘客门"/>
<Line3Text Enable="1" Text="接近传感器 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="67" ActivityType="3" flags="0" name="PEPS 乘客门接近传感器">
<Rect left="437" top="3098" right="537" bottom="3130"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x09
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

end</Script><assessment no="39" name="DEP743" type="8" flags="97"/>
</Activity>
<Activity id="68" ActivityType="3" flags="0" name="手动测试">
<Rect left="437" top="3144" right="537" bottom="3176"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除副驾驶门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="69" ActivityType="3" flags="0" name="PEPS 乘客门接近解锁">
<Rect left="438" top="3196" right="538" bottom="3228"/>
<Strategy TotalTime="600" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
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

end</Script><assessment no="40" name="DEP744" type="8" flags="97"/>
</Activity>
<Activity id="70" ActivityType="3" flags="0" name="副驾驶门打开手动测试">
<Rect left="438" top="3243" right="538" bottom="3275"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开副驾驶门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="71" ActivityType="3" flags="0" name="PEPS 手动打开乘客门">
<Rect left="439" top="3290" right="539" bottom="3322"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
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

end</Script><assessment no="41" name="DEP745" type="8" flags="97"/>
</Activity>
<Activity id="72" ActivityType="4" flags="0" name="路由节点">
<Rect left="472" top="3347" right="504" bottom="3379"/>
</Activity>
<Activity id="73" ActivityType="3" flags="0" name="PDCU 智能锁开关手动测试">
<Rect left="437" top="3412" right="537" bottom="3444"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按乘客侧智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="74" ActivityType="3" flags="0" name="PEPS PDCU智能锁开关">
<Rect left="440" top="3458" right="540" bottom="3490"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x05
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

end</Script><assessment no="42" name="DEP746" type="8" flags="97"/>
</Activity>
<Activity id="75" ActivityType="3" flags="0" name="RRDCU 智能锁开关手动测试">
<Rect left="440" top="3508" right="540" bottom="3540"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按右后门智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="76" ActivityType="3" flags="0" name="PEPS RRDCU智能锁开关">
<Rect left="440" top="3556" right="540" bottom="3588"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x06
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

end</Script><assessment no="43" name="DEP747" type="8" flags="97"/>
</Activity>
<Activity id="77" ActivityType="3" flags="0" name="RLDCU 智能锁开关手动测试">
<Rect left="440" top="3603" right="540" bottom="3635"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按左后门智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="PEPS RLDCU智能锁开关">
<Rect left="440" top="3649" right="540" bottom="3681"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x04
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

end</Script><assessment no="44" name="DEP748" type="8" flags="97"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="440" top="3953" right="540" bottom="3985"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="80" ActivityType="3" flags="0" name="检测失败">
<Rect left="321" top="2126" right="421" bottom="2158"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="DDCU 智能锁开关手动测试">
<Rect left="440" top="3699" right="540" bottom="3731"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按司机侧智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="88" ActivityType="3" flags="0" name="PEPS DDCU智能锁开关">
<Rect left="441" top="3749" right="541" bottom="3781"/>
<Strategy TotalTime="300" ExpectedTime="2" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x03

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

end</Script><assessment no="45" name="DEP749" type="8" flags="97"/>
</Activity>
<Activity id="92" ActivityType="3" flags="0" name="检测失败">
<Rect left="312" top="1006" right="412" bottom="1038"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="94" ActivityType="3" flags="0" name="检测失败">
<Rect left="307" top="893" right="407" bottom="925"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="95" ActivityType="3" flags="0" name="检测失败">
<Rect left="90" top="804" right="190" bottom="836"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="97" ActivityType="3" flags="0" name="检测失败">
<Rect left="310" top="1063" right="410" bottom="1095"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="98" ActivityType="3" flags="0" name="检测失败">
<Rect left="308" top="1119" right="408" bottom="1151"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="检测失败">
<Rect left="315" top="1456" right="415" bottom="1488"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="检测失败">
<Rect left="316" top="1558" right="416" bottom="1590"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="101" ActivityType="3" flags="0" name="检测失败">
<Rect left="317" top="1647" right="417" bottom="1679"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="检测失败">
<Rect left="316" top="1746" right="416" bottom="1778"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="检测失败">
<Rect left="318" top="1838" right="418" bottom="1870"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="104" ActivityType="3" flags="0" name="检测失败">
<Rect left="318" top="1931" right="418" bottom="1963"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="105" ActivityType="3" flags="0" name="检测失败">
<Rect left="319" top="2031" right="419" bottom="2063"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="106" ActivityType="3" flags="0" name="检测失败">
<Rect left="317" top="2224" right="417" bottom="2256"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="检测失败">
<Rect left="316" top="2329" right="416" bottom="2361"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="108" ActivityType="3" flags="0" name="检测失败">
<Rect left="316" top="2425" right="416" bottom="2457"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="109" ActivityType="3" flags="0" name="检测失败">
<Rect left="322" top="2515" right="422" bottom="2547"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="110" ActivityType="3" flags="0" name="检测失败">
<Rect left="323" top="2613" right="423" bottom="2645"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="111" ActivityType="3" flags="0" name="检测失败">
<Rect left="321" top="2705" right="421" bottom="2737"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="112" ActivityType="3" flags="0" name="检测失败">
<Rect left="319" top="2809" right="419" bottom="2841"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="113" ActivityType="3" flags="0" name="检测失败">
<Rect left="320" top="2907" right="420" bottom="2939"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="114" ActivityType="3" flags="0" name="检测失败">
<Rect left="321" top="3003" right="421" bottom="3035"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="115" ActivityType="3" flags="0" name="检测失败">
<Rect left="322" top="3099" right="422" bottom="3131"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="116" ActivityType="3" flags="0" name="检测失败">
<Rect left="323" top="3200" right="423" bottom="3232"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="117" ActivityType="3" flags="0" name="检测失败">
<Rect left="326" top="3293" right="426" bottom="3325"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="118" ActivityType="3" flags="0" name="检测失败">
<Rect left="326" top="3463" right="426" bottom="3495"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="119" ActivityType="3" flags="0" name="检测失败">
<Rect left="326" top="3560" right="426" bottom="3592"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="120" ActivityType="3" flags="0" name="检测失败">
<Rect left="327" top="3652" right="427" bottom="3684"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="121" ActivityType="3" flags="0" name="检测失败">
<Rect left="324" top="3750" right="424" bottom="3782"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="123" ActivityType="3" flags="0" name="连接ECU">
<Rect left="112" top="122" right="212" bottom="154"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="124" ActivityType="4" flags="0" name="路由节点">
<Rect left="572" top="2276" right="604" bottom="2308"/>
</Activity>
<Activity id="125" ActivityType="4" flags="0" name="路由节点">
<Rect left="559" top="890" right="591" bottom="922"/>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="113" top="333" right="213" bottom="365"/>
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

end</Script><assessment no="3752" name="DEP95" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="发送key">
<Rect left="112" top="446" right="212" bottom="478"/>
<Strategy NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3753" name="DEP96" type="8" flags="97"/>
</Activity>
<Activity id="130" ActivityType="13" flags="0" name="计算key">
<Rect left="112" top="389" right="212" bottom="421"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0x5B798A6C"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="切诊断">
<Rect left="113" top="278" right="213" bottom="310"/>
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

end</Script><assessment no="2011" name="DEP1096" type="8" flags="97"/>
</Activity>
<Activity id="133" ActivityType="3" flags="0" name="检测失败">
<Rect left="312" top="623" right="412" bottom="655"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="135" ActivityType="3" flags="0" name="检测失败">
<Rect left="317" top="1413" right="417" bottom="1445"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="141" ActivityType="3" flags="0" name="比对零件号">
<Rect left="239" top="67" right="339" bottom="99"/>
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
--[[
	if(string.len(DString_C131_Partnumber)==10)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12);
	elseif(string.len(DString_C131_Partnumber)==11)then
		DString1=string.char(@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13);
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
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="1" name="DEP359" type="8" flags="105"/>
</Activity>
<Activity id="142" ActivityType="4" flags="0" name="路由节点">
<Rect left="274" top="14" right="306" bottom="46"/>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="读硬件号">
<Rect left="366" top="63" right="466" bottom="95"/>
<Line1Text Enable="1" Text="读硬件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x92
DString1=hexstr(@3-@14);
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

end</Script><assessment no="2" name="DEP360" type="8" flags="105"/>
</Activity>
<Activity id="145" ActivityType="3" flags="0" name="延时300MS">
<Rect left="367" top="113" right="467" bottom="145"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="146" ActivityType="4" flags="0" name="路由节点">
<Rect left="401" top="13" right="433" bottom="45"/>
</Activity>
<Activity id="147" ActivityType="4" flags="0" name="路由节点">
<Rect left="659" top="13" right="691" bottom="45"/>
</Activity>
<Activity id="148" ActivityType="4" flags="0" name="路由节点">
<Rect left="531" top="13" right="563" bottom="45"/>
</Activity>
<Activity id="149" ActivityType="3" flags="0" name="读硬件版本号">
<Rect left="500" top="64" right="600" bottom="96"/>
<Line1Text Enable="1" Text="读硬件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x93
DString1=hexstr(@3-@5);
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

end</Script><assessment no="3" name="DEP361" type="8" flags="105"/>
</Activity>
<Activity id="151" ActivityType="3" flags="0" name="延时300MS">
<Rect left="495" top="113" right="595" bottom="145"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="158" ActivityType="3" flags="0" name="读软件号">
<Rect left="625" top="72" right="725" bottom="104"/>
<Line1Text Enable="1" Text="读软件号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x94
DString1=hexstr(@3-@14);
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

end</Script><assessment no="4" name="DEP362" type="8" flags="105"/>
</Activity>
<Activity id="160" ActivityType="3" flags="0" name="延时300MS">
<Rect left="625" top="123" right="725" bottom="155"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="165" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="744" top="70" right="844" bottom="102"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	DString1=string.char(@3,@4,@5);
	engine.SetLineText(3,DString1);
	if(( DString_C131_Car_Tpye == "CH1GM11" ) or ( DString_C131_Car_Tpye == "CH1GM12" ))then
		StandValue="320"
		--if("320" == DString1) then
        elseif(DString_Car_Tpye == "CH1GM42" or DString_Car_Tpye == "CH1AM48")then
                 StandValue="180"
	else
		StandValue="300"
		--if("300" == DString1) then    
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	DString1=string.char(@3,@4,@5);
	engine.SetLineText(3,DString1)
	engine.println("软件版本号:"..DString1);;
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
end

</Script><assessment no="5" name="DEP363" type="8" flags="105"/>
</Activity>
<Activity id="168" ActivityType="3" flags="0" name="延时300MS">
<Rect left="745" top="121" right="845" bottom="153"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="169" ActivityType="4" flags="0" name="路由节点">
<Rect left="777" top="14" right="809" bottom="46"/>
</Activity>
<Activity id="170" ActivityType="3" flags="0" name="发送VIN">
<Rect left="1410" top="64" right="1510" bottom="96"/>
<Line1Text Enable="1" Text="写VIN码"/>
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

end</Script><assessment no="7" name="DEP168" type="8" flags="97"/>
</Activity>
<Activity id="171" ActivityType="3" flags="0" name="检查VIN">
<Rect left="1410" top="114" right="1510" bottom="146"/>
<Line1Text Enable="1" Text="比对VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
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
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="8" name="DEP167" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="日期读取">
<Rect left="1530" top="114" right="1630" bottom="146"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0xF1 0x9D

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

end</Script><assessment no="10" name="DEP224" type="8" flags="97"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="发送时间">
<Rect left="1530" top="64" right="1630" bottom="96"/>
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

end</Script><assessment no="9" name="DEP223" type="8" flags="97"/>
</Activity>
<Activity id="175" ActivityType="4" flags="0" name="路由节点">
<Rect left="1444" top="14" right="1476" bottom="46"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="清除所有显示">
<Rect left="1800" top="464" right="1900" bottom="496"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="延时500ms">
<Rect left="1650" top="114" right="1750" bottom="146"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 500</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="检查配置码">
<Rect left="1760" top="64" right="1860" bottom="96"/>
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
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="12" name="DEP366" type="8" flags="105"/>
</Activity>
<Activity id="182" ActivityType="3" flags="0" name="写配置码">
<Rect left="1650" top="64" right="1750" bottom="96"/>
<Line1Text Enable="1" Text="写配置码"/>
<Script>VariCoding=DString_C131_VariCoding;
engine.SetLineText(3,VariCoding);
engine.println("配置码"..VariCoding);
#COMM 0x2e 0x01 0x00 hex2dec(VariCoding,1) hex2dec(VariCoding,3) hex2dec(VariCoding,5) hex2dec(VariCoding,7) hex2dec(VariCoding,9) hex2dec(VariCoding,11) hex2dec(VariCoding,13) hex2dec(VariCoding,15) hex2dec(VariCoding,17) hex2dec(VariCoding,19) hex2dec(VariCoding,21) hex2dec(VariCoding,23) hex2dec(VariCoding,25) hex2dec(VariCoding,27) hex2dec(VariCoding,29) hex2dec(VariCoding,31)

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

end</Script><assessment no="11" name="DEP365" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="4" flags="0" name="路由节点">
<Rect left="1684" top="14" right="1716" bottom="46"/>
</Activity>
<Activity id="184" ActivityType="3" flags="0" name="PEPS 读钥匙CID1">
<Rect left="1290" top="64" right="1390" bottom="96"/>
<Line1Text Enable="1" Text="PEPS 读钥匙CID1"/>
<Script>#COMM 0x22 0xF1 0xA2
local StringRes;
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

end</Script><assessment no="6" name="DEP364" type="8" flags="99"/>
</Activity>
<Activity id="185" ActivityType="4" flags="0" name="路由节点">
<Rect left="1324" top="14" right="1356" bottom="46"/>
</Activity>
<Activity id="186" ActivityType="3" flags="0" name="PEPS 读钥匙CID2">
<Rect left="1290" top="114" right="1390" bottom="146"/>
<Line1Text Enable="1" Text="PEPS 读钥匙CID2"/>
<Script>#COMM 0x22 0xF1 0xA3
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

end</Script><assessment no="13" name="DEP525" type="8" flags="99"/>
</Activity>
<Activity id="187" ActivityType="4" flags="0" name="路由节点">
<Rect left="1564" top="14" right="1596" bottom="46"/>
</Activity>
<Activity id="188" ActivityType="4" flags="0" name="路由节点">
<Rect left="1794" top="14" right="1826" bottom="46"/>
</Activity>
<Activity id="189" ActivityType="4" flags="0" name="路由节点">
<Rect left="557" top="3581" right="589" bottom="3613"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="按启动按钮至 IG ON">
<Rect left="429" top="723" right="529" bottom="755"/>
<Line1Text Enable="1" Text="再次按启动按钮至 IG ON"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="191" ActivityType="3" flags="0" name="检测失败">
<Rect left="309" top="723" right="409" bottom="755"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="193" ActivityType="3" flags="0" name="定速巡航控制">
<Rect left="431" top="948" right="531" bottom="980"/>
<Strategy TotalTime="100" ExpectedTime="2" NokTime="0" RetryTimeOut="5" DelayTime="100"/>
<Line1Text Enable="1" Text="自动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="定速巡航控制"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0x01 0x10

if (@3==0x01) then
  engine.LastError = 0;
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);
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

end</Script><assessment no="18" name="DEP722" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="检测失败">
<Rect left="310" top="948" right="410" bottom="980"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="打开点火开关">
<Rect left="439" top="3857" right="539" bottom="3889"/>
<Line1Text Enable="1" Text="请打开点火开关"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯">
<Rect left="113" top="173" right="213" bottom="205"/>
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

end</Script><assessment no="2000" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="197" ActivityType="3" flags="0" name="通讯失败">
<Rect top="176" right="100" bottom="208"/>
<Line1Text Enable="1" Text="PEPS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="198" ActivityType="4" flags="0" name="路由节点">
<Rect left="37" top="3954" right="69" bottom="3986"/>
</Activity>
<Activity id="199" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="3808" right="506" bottom="3840"/>
</Activity>
<Activity id="200" ActivityType="4" flags="0" name="路由节点">
<Rect left="564" top="3857" right="596" bottom="3889"/>
</Activity>
<Activity id="201" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1" top="121" right="101" bottom="153"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="202" ActivityType="4" flags="0" name="路由节点">
<Rect left="1884" top="14" right="1916" bottom="46"/>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="混动车型">
<Rect left="863" top="64" right="963" bottom="96"/>
<Script></Script></Activity>
<Activity id="204" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="864" top="119" right="964" bottom="151"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1LM23" )then
		StandValue="141";
        elseif(DString_C131_Car_Tpye=="CH1MM41")then
		StandValue="170";
        else
	        StandValue="170";
        end
	DString1=string.char(@3,@4,@5);
	engine.SetLineText(3,DString1)
	engine.println("软件版本号:"..DString1);
        engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue); 
	--if("121" == DString1) then  
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


</Script><assessment no="5" name="DEP363" type="8" flags="97"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="延时300MS">
<Rect left="866" top="169" right="966" bottom="201"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="206" ActivityType="4" flags="0" name="路由节点">
<Rect left="896" top="13" right="928" bottom="45"/>
</Activity>
<Activity id="207" ActivityType="4" flags="0" name="路由节点">
<Rect left="1033" top="216" right="1065" bottom="248"/>
</Activity>
<Activity id="208" ActivityType="3" flags="0" name="改脸">
<Rect left="995" top="66" right="1095" bottom="98"/>
<Script></Script></Activity>
<Activity id="209" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="996" top="121" right="1096" bottom="153"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	if(DString_C131_Car_Tpye=="CH1FM12" or DString_C131_Car_Tpye=="CH1FM13" or (DString_C131_Car_Tpye=="CH1FM20" or DString_C131_Car_Tpye=="CH1FM30"))then
		StandValue="170";
	elseif(DString_C131_Car_Tpye=="CH1JM11" or DString_C131_Car_Tpye=="CH1JM12")then
		StandValue="170";
	elseif((DString_C131_Car_Tpye == "CH1DM14" ) or ( DString_C131_Car_Tpye == "CH1DM15" ) or (DString_C131_Car_Tpye == "CH1DM16" or DString_C131_Car_Tpye == "CH1DM17"))then
		StandValue="170";	
        elseif(DString_C131_Car_Tpye=="CH1GM41" or DString_C131_Car_Tpye=="CH1GM40")then
		StandValue="170";
	elseif(DString_C131_Car_Tpye=="CH1AM46" or DString_C131_Car_Tpye=="CH1AM47" or  DString_C131_Car_Tpye=="CH1AM54")then
		StandValue="170";
	elseif(DString_C131_Car_Tpye=="CH1BM35" or DString_C131_Car_Tpye=="CH1CM33" or DString_C131_Car_Tpye=="CH1CM32")then
		StandValue="170";
         elseif(DString_C131_Car_Tpye == "CH1GM42" or DString_C131_Car_Tpye == "CH1AM48")then
                StandValue="180";
	else
		StandValue="170";		
	end
	engine.SetLineText(2,StandValue);
	engine.println("软件版本号标准值:"..StandValue);
	DString1=string.char(@3,@4,@5);
	engine.SetLineText(3,DString1);
	engine.println("软件版本号:"..DString1);
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
end</Script><assessment no="5" name="DEP363" type="8" flags="105"/>
</Activity>
<Activity id="210" ActivityType="3" flags="0" name="延时300MS">
<Rect left="998" top="171" right="1098" bottom="203"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="211" ActivityType="4" flags="0" name="路由节点">
<Rect left="1030" top="13" right="1062" bottom="45"/>
</Activity>
<Activity id="212" ActivityType="3" flags="0" name="延时2秒">
<Rect left="430" top="814" right="530" bottom="846"/>
<Line1Text Enable="1" Text="延时2秒"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.Delay(2000);</Script></Activity>
<Activity id="213" ActivityType="3" flags="0" name="19年型">
<Rect left="1140" top="64" right="1240" bottom="96"/>
<Script></Script></Activity>
<Activity id="214" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="1140" top="114" right="1240" bottom="146"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x22 0xF1 0x95
if(@0==0x62)then
	StandValue= "180"
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
end</Script><assessment no="5" name="DEP363" type="8" flags="105"/>
</Activity>
<Activity id="215" ActivityType="3" flags="0" name="延时300MS">
<Rect left="1140" top="164" right="1240" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="216" ActivityType="4" flags="0" name="路由节点">
<Rect left="1174" top="14" right="1206" bottom="46"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="123" type="0">
</Transition>
<Transition StartId="4" EndId="131" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="1">
<Expression>C131_PEPS_Smart_Start_Execute_Flag == true</Expression></Transition>
<Transition StartId="7" EndId="125" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="3">
</Transition>
<Transition StartId="11" EndId="133" type="4">
</Transition>
<Transition StartId="12" EndId="190" type="0">
</Transition>
<Transition StartId="15" EndId="95" type="4">
</Transition>
<Transition StartId="17" EndId="193" type="3">
</Transition>
<Transition StartId="17" EndId="94" type="4">
</Transition>
<Transition StartId="21" EndId="23" type="3">
</Transition>
<Transition StartId="21" EndId="92" type="4">
</Transition>
<Transition StartId="23" EndId="25" type="3">
</Transition>
<Transition StartId="23" EndId="97" type="4">
</Transition>
<Transition StartId="25" EndId="26" type="3">
</Transition>
<Transition StartId="25" EndId="98" type="4">
</Transition>
<Transition StartId="26" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="33" type="0">
</Transition>
<Transition StartId="28" EndId="29" type="6">
</Transition>
<Transition StartId="28" EndId="135" type="5">
</Transition>
<Transition StartId="29" EndId="30" type="0">
</Transition>
<Transition StartId="30" EndId="31" type="3">
</Transition>
<Transition StartId="30" EndId="99" type="4">
</Transition>
<Transition StartId="31" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="36" type="3">
</Transition>
<Transition StartId="32" EndId="100" type="4">
</Transition>
<Transition StartId="33" EndId="28" type="1">
<Expression>(C131_PEPS_Smart_Unlock_Execute_Flag == true) and LibGeneral.PEPShandtest(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="33" EndId="124" type="0">
</Transition>
<Transition StartId="36" EndId="37" type="0">
</Transition>
<Transition StartId="37" EndId="38" type="3">
</Transition>
<Transition StartId="37" EndId="101" type="4">
</Transition>
<Transition StartId="38" EndId="39" type="0">
</Transition>
<Transition StartId="39" EndId="40" type="3">
</Transition>
<Transition StartId="39" EndId="102" type="4">
</Transition>
<Transition StartId="40" EndId="41" type="0">
</Transition>
<Transition StartId="41" EndId="42" type="3">
</Transition>
<Transition StartId="41" EndId="103" type="4">
</Transition>
<Transition StartId="42" EndId="43" type="0">
</Transition>
<Transition StartId="43" EndId="44" type="3">
</Transition>
<Transition StartId="43" EndId="104" type="4">
</Transition>
<Transition StartId="44" EndId="45" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="3">
</Transition>
<Transition StartId="45" EndId="105" type="4">
</Transition>
<Transition StartId="46" EndId="47" type="0">
</Transition>
<Transition StartId="47" EndId="48" type="3">
</Transition>
<Transition StartId="47" EndId="80" type="4">
</Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="50" type="3">
</Transition>
<Transition StartId="49" EndId="106" type="4">
</Transition>
<Transition StartId="50" EndId="51" type="0">
</Transition>
<Transition StartId="51" EndId="52" type="3">
</Transition>
<Transition StartId="51" EndId="107" type="4">
</Transition>
<Transition StartId="52" EndId="53" type="0">
</Transition>
<Transition StartId="53" EndId="54" type="3">
</Transition>
<Transition StartId="53" EndId="108" type="4">
</Transition>
<Transition StartId="54" EndId="55" type="0">
</Transition>
<Transition StartId="55" EndId="56" type="3">
</Transition>
<Transition StartId="55" EndId="109" type="4">
</Transition>
<Transition StartId="56" EndId="57" type="0">
</Transition>
<Transition StartId="57" EndId="58" type="3">
</Transition>
<Transition StartId="57" EndId="110" type="4">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="60" type="3">
</Transition>
<Transition StartId="59" EndId="111" type="4">
</Transition>
<Transition StartId="60" EndId="61" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="3">
</Transition>
<Transition StartId="61" EndId="112" type="4">
</Transition>
<Transition StartId="62" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="3">
</Transition>
<Transition StartId="63" EndId="113" type="4">
</Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="3">
</Transition>
<Transition StartId="65" EndId="114" type="4">
</Transition>
<Transition StartId="66" EndId="67" type="0">
</Transition>
<Transition StartId="67" EndId="68" type="3">
</Transition>
<Transition StartId="67" EndId="115" type="4">
</Transition>
<Transition StartId="68" EndId="69" type="0">
</Transition>
<Transition StartId="69" EndId="70" type="3">
</Transition>
<Transition StartId="69" EndId="116" type="4">
</Transition>
<Transition StartId="70" EndId="71" type="0">
</Transition>
<Transition StartId="71" EndId="72" type="3">
</Transition>
<Transition StartId="71" EndId="117" type="4">
</Transition>
<Transition StartId="72" EndId="73" type="1">
<Expression>( C131_PEPS_Smart_Lock_Execute_Flag == true ) and LibGeneral.PEPShandtest(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="72" EndId="189" type="0">
</Transition>
<Transition StartId="73" EndId="74" type="0">
</Transition>
<Transition StartId="74" EndId="75" type="3">
</Transition>
<Transition StartId="74" EndId="118" type="4">
</Transition>
<Transition StartId="75" EndId="76" type="0">
</Transition>
<Transition StartId="76" EndId="77" type="3">
</Transition>
<Transition StartId="76" EndId="119" type="4">
</Transition>
<Transition StartId="77" EndId="78" type="0">
</Transition>
<Transition StartId="78" EndId="87" type="3">
</Transition>
<Transition StartId="78" EndId="120" type="4">
</Transition>
<Transition StartId="79" EndId="2" type="0">
</Transition>
<Transition StartId="80" EndId="48" type="0">
</Transition>
<Transition StartId="87" EndId="88" type="0">
</Transition>
<Transition StartId="88" EndId="199" type="3">
</Transition>
<Transition StartId="88" EndId="121" type="4">
</Transition>
<Transition StartId="92" EndId="23" type="0">
</Transition>
<Transition StartId="94" EndId="193" type="0">
</Transition>
<Transition StartId="97" EndId="25" type="0">
</Transition>
<Transition StartId="98" EndId="26" type="0">
</Transition>
<Transition StartId="99" EndId="31" type="0">
</Transition>
<Transition StartId="100" EndId="36" type="0">
</Transition>
<Transition StartId="101" EndId="38" type="0">
</Transition>
<Transition StartId="102" EndId="40" type="0">
</Transition>
<Transition StartId="103" EndId="42" type="0">
</Transition>
<Transition StartId="104" EndId="44" type="0">
</Transition>
<Transition StartId="105" EndId="46" type="0">
</Transition>
<Transition StartId="106" EndId="50" type="0">
</Transition>
<Transition StartId="107" EndId="52" type="0">
</Transition>
<Transition StartId="108" EndId="54" type="0">
</Transition>
<Transition StartId="109" EndId="56" type="0">
</Transition>
<Transition StartId="110" EndId="58" type="0">
</Transition>
<Transition StartId="111" EndId="60" type="0">
</Transition>
<Transition StartId="112" EndId="62" type="0">
</Transition>
<Transition StartId="113" EndId="64" type="0">
</Transition>
<Transition StartId="114" EndId="66" type="0">
</Transition>
<Transition StartId="115" EndId="68" type="0">
</Transition>
<Transition StartId="116" EndId="70" type="0">
</Transition>
<Transition StartId="117" EndId="72" type="0">
</Transition>
<Transition StartId="118" EndId="75" type="0">
</Transition>
<Transition StartId="119" EndId="77" type="0">
</Transition>
<Transition StartId="120" EndId="87" type="0">
</Transition>
<Transition StartId="121" EndId="199" type="0">
</Transition>
<Transition StartId="123" EndId="196" type="0">
</Transition>
<Transition StartId="124" EndId="72" type="0">
</Transition>
<Transition StartId="125" EndId="33" type="0">
</Transition>
<Transition StartId="127" EndId="130" type="0">
</Transition>
<Transition StartId="129" EndId="142" type="0">
</Transition>
<Transition StartId="130" EndId="129" type="0">
</Transition>
<Transition StartId="131" EndId="127" type="0">
</Transition>
<Transition StartId="133" EndId="12" type="0">
</Transition>
<Transition StartId="135" EndId="29" type="0">
</Transition>
<Transition StartId="141" EndId="146" type="0">
</Transition>
<Transition StartId="142" EndId="141" type="1">
<Expression>C131_PEPS_OEM_Execute_Flag == true</Expression></Transition>
<Transition StartId="142" EndId="146" type="0">
</Transition>
<Transition StartId="143" EndId="145" type="0">
</Transition>
<Transition StartId="145" EndId="148" type="0">
</Transition>
<Transition StartId="146" EndId="143" type="1">
<Expression>C131_PEPS_HN_Execute_Flag == true</Expression></Transition>
<Transition StartId="146" EndId="148" type="0">
</Transition>
<Transition StartId="147" EndId="158" type="1">
<Expression>C131_PEPS_SN_Execute_Flag == true</Expression></Transition>
<Transition StartId="147" EndId="169" type="0">
</Transition>
<Transition StartId="148" EndId="149" type="1">
<Expression>C131_PEPS_HVP_Execute_Flag == true</Expression></Transition>
<Transition StartId="148" EndId="147" type="0">
</Transition>
<Transition StartId="149" EndId="151" type="0">
</Transition>
<Transition StartId="151" EndId="147" type="0">
</Transition>
<Transition StartId="158" EndId="160" type="0">
</Transition>
<Transition StartId="160" EndId="169" type="0">
</Transition>
<Transition StartId="165" EndId="168" type="0">
</Transition>
<Transition StartId="168" EndId="207" type="0">
</Transition>
<Transition StartId="169" EndId="165" type="1">
<Expression>C131_PEPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Isnot_CFaceAndHrid(DString_C131_Car_Tpye) and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye) == false</Expression></Transition>
<Transition StartId="169" EndId="206" type="0">
</Transition>
<Transition StartId="170" EndId="171" type="0">
</Transition>
<Transition StartId="171" EndId="187" type="0">
</Transition>
<Transition StartId="172" EndId="183" type="0">
</Transition>
<Transition StartId="174" EndId="172" type="0">
</Transition>
<Transition StartId="175" EndId="170" type="1">
<Expression>C131_PEPS_VIN_Execute_Flag == true</Expression></Transition>
<Transition StartId="175" EndId="187" type="0">
</Transition>
<Transition StartId="178" EndId="7" type="0">
</Transition>
<Transition StartId="179" EndId="188" type="0">
</Transition>
<Transition StartId="180" EndId="202" type="0">
</Transition>
<Transition StartId="182" EndId="179" type="0">
</Transition>
<Transition StartId="183" EndId="182" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PEPS_WD_Execute_Flag == true) and VMTLOC ~= "RIN"</Expression></Transition>
<Transition StartId="183" EndId="188" type="0">
</Transition>
<Transition StartId="184" EndId="186" type="0">
</Transition>
<Transition StartId="185" EndId="184" type="1">
<Expression>C131_PEPS_CID_Execute_Flag == true</Expression></Transition>
<Transition StartId="185" EndId="175" type="0">
</Transition>
<Transition StartId="186" EndId="175" type="0">
</Transition>
<Transition StartId="187" EndId="174" type="1">
<Expression>C131_PEPS_EID_Execute_Flag == true</Expression></Transition>
<Transition StartId="187" EndId="183" type="0">
</Transition>
<Transition StartId="188" EndId="180" type="1">
<Expression>(DString_C131_VariCoding ~= "") and (C131_PEPS_WD_Execute_Flag == true or VMTLOC=="FIN")</Expression></Transition>
<Transition StartId="188" EndId="202" type="0">
</Transition>
<Transition StartId="189" EndId="199" type="0">
</Transition>
<Transition StartId="190" EndId="191" type="0">
</Transition>
<Transition StartId="190" EndId="212" type="6">
</Transition>
<Transition StartId="191" EndId="212" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="4">
</Transition>
<Transition StartId="193" EndId="21" type="3">
</Transition>
<Transition StartId="194" EndId="21" type="0">
</Transition>
<Transition StartId="195" EndId="79" type="0">
</Transition>
<Transition StartId="196" EndId="4" type="3">
</Transition>
<Transition StartId="196" EndId="197" type="4">
</Transition>
<Transition StartId="197" EndId="201" type="0">
</Transition>
<Transition StartId="197" EndId="198" type="5">
</Transition>
<Transition StartId="198" EndId="79" type="0">
</Transition>
<Transition StartId="199" EndId="195" type="1">
<Expression>VMTLOC=="TR2" and C131_PEPS_Smart_Start_Execute_Flag == true</Expression></Transition>
<Transition StartId="199" EndId="200" type="0">
</Transition>
<Transition StartId="200" EndId="79" type="0">
</Transition>
<Transition StartId="201" EndId="123" type="0">
</Transition>
<Transition StartId="202" EndId="178" type="0">
</Transition>
<Transition StartId="203" EndId="204" type="0">
</Transition>
<Transition StartId="204" EndId="205" type="0">
</Transition>
<Transition StartId="205" EndId="207" type="0">
</Transition>
<Transition StartId="206" EndId="211" type="0">
</Transition>
<Transition StartId="206" EndId="203" type="1">
<Expression>C131_PEPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_Hrid(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="207" EndId="185" type="0">
</Transition>
<Transition StartId="208" EndId="209" type="0">
</Transition>
<Transition StartId="209" EndId="210" type="0">
</Transition>
<Transition StartId="210" EndId="207" type="0">
</Transition>
<Transition StartId="211" EndId="208" type="1">
<Expression>C131_PEPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_Is_CFace(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="211" EndId="216" type="0">
</Transition>
<Transition StartId="212" EndId="17" type="0">
</Transition>
<Transition StartId="213" EndId="214" type="0">
</Transition>
<Transition StartId="214" EndId="215" type="0">
</Transition>
<Transition StartId="215" EndId="207" type="0">
</Transition>
<Transition StartId="216" EndId="213" type="1">
<Expression>C131_PEPS_SVP_Execute_Flag == true and LibGeneral.CarTNC_19year(DString_C131_Car_Tpye)</Expression></Transition>
<Transition StartId="216" EndId="185" type="0">
</Transition>
</Transitions>
</Process>

