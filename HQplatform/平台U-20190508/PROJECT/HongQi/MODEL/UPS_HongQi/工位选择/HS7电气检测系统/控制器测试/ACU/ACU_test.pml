<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3006" pbltext="DEP1616">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="1" description="物理通道"/>
<Variable id="FunctionAddress" type="3" data="0" description="功能地址"/>
<Variable id="ECUAddress" type="3" data="0" description="ECU地址"/>
<Variable id="TesterAddress" type="3" data="241" description="VMT地址"/>
<Variable id="Baudrate" type="3" data="500000" description="比特率"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x720" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x728" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="260" top="34" right="360" bottom="66"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1430" top="1064" right="1530" bottom="1096"/>
<Script></Script></End>
<Activities>
<Activity id="4" ActivityType="3" flags="1" name="打开气囊警示灯">
<Rect left="450" top="214" right="550" bottom="246"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="打开气囊警示灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x00 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="31" name="DEP2376" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="440" top="284" right="540" bottom="316"/>
<Line1Text Enable="1" Text="气囊警示灯已打开，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="32" name="DEP2377" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="4" flags="0" name="条件1">
<Rect left="474" top="104" right="506" bottom="136"/>
</Activity>
<Activity id="139" ActivityType="3" flags="0" name="检查乘客安全气囊禁用灯">
<Rect left="1190" top="1134" right="1290" bottom="1166"/>
<Script>#COMM 0x2f 0xC0 0x01 0x03 0x00
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



</Script></Activity>
<Activity id="179" ActivityType="3" flags="0" name="延时">
<Rect left="1190" top="1194" right="1290" bottom="1226"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="180" ActivityType="3" flags="0" name="乘客安全气囊禁用灯灭">
<Rect left="1190" top="1194" right="1290" bottom="1226"/>
<Line1Text Enable="1" Text="乘客安全气囊禁用灯灭了吗？"/>
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
</Script></Activity>
<Activity id="181" ActivityType="3" flags="0" name="返回控制权">
<Rect left="1190" top="1434" right="1290" bottom="1466"/>
<Script>#COMM 0x2f 0xC0 0x01 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="182" ActivityType="3" flags="0" name="打开提示灯">
<Rect left="1190" top="1254" right="1290" bottom="1286"/>
<Script>#COMM 0x2f 0xC0 0x01 0x03 0x01
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
</Script></Activity>
<Activity id="183" ActivityType="3" flags="0" name="乘客安全气囊禁用灯灭">
<Rect left="1190" top="1374" right="1290" bottom="1406"/>
<Line1Text Enable="1" Text="乘客安全气囊禁用灯亮了吗？"/>
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
</Script></Activity>
<Activity id="184" ActivityType="3" flags="0" name="延时">
<Rect left="1190" top="1314" right="1290" bottom="1346"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="185" ActivityType="3" flags="0" name="检测失败">
<Rect left="1030" top="1374" right="1130" bottom="1406"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="186" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="54" right="696" bottom="86"/>
</Activity>
<Activity id="659" ActivityType="3" flags="0" name="碰撞信号开启">
<Rect left="1530" top="1194" right="1630" bottom="1226"/>
<Script>#COMM 0x2f 0xC0 0x02 0x03 0x01
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



</Script></Activity>
<Activity id="660" ActivityType="3" flags="0" name="延时">
<Rect left="1530" top="1194" right="1630" bottom="1226"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="661" ActivityType="3" flags="0" name="确认所有车门解锁">
<Rect left="1530" top="1254" right="1630" bottom="1286"/>
<Line1Text Enable="1" Text="所有车门解锁了吗？"/>
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
</Script></Activity>
<Activity id="662" ActivityType="3" flags="0" name="发送前端碰撞输出打开信号">
<Rect left="1530" top="1314" right="1630" bottom="1346"/>
<Script>#COMM 0x2f 0xC0 0x02 0x03 0x02
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
</Script></Activity>
<Activity id="663" ActivityType="3" flags="0" name="确认所有车门解锁">
<Rect left="1530" top="1434" right="1630" bottom="1466"/>
<Line1Text Enable="1" Text="所有车门解锁了吗？"/>
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
</Script></Activity>
<Activity id="664" ActivityType="3" flags="0" name="延时">
<Rect left="1530" top="1374" right="1630" bottom="1406"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="665" ActivityType="3" flags="0" name="检测失败">
<Rect left="1360" top="1314" right="1460" bottom="1346"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="666" ActivityType="3" flags="0" name="锁定所有车门">
<Rect left="1530" top="1134" right="1630" bottom="1166"/>
<Line1Text Enable="1" Text="请锁定所有车门"/>
<Line2Text Enable="1" Text="请按确定，继续测试！"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script></Script></Activity>
<Activity id="667" ActivityType="3" flags="0" name="驾驶员侧碰撞输出打开信号">
<Rect left="1530" top="1494" right="1630" bottom="1526"/>
<Script>#COMM 0x2f 0xC0 0x02 0x03 0x04
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



</Script></Activity>
<Activity id="668" ActivityType="3" flags="0" name="延时">
<Rect left="1530" top="1554" right="1630" bottom="1586"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="669" ActivityType="3" flags="0" name="确认所有车门解锁">
<Rect left="1530" top="1554" right="1630" bottom="1586"/>
<Line1Text Enable="1" Text="所有车门解锁了吗？"/>
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
</Script></Activity>
<Activity id="670" ActivityType="3" flags="0" name="乘客侧碰撞输出打开信号">
<Rect left="1530" top="1614" right="1630" bottom="1646"/>
<Script>#COMM 0x2f 0xC0 0x02 0x03 0x08
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
</Script></Activity>
<Activity id="671" ActivityType="3" flags="0" name="确认所有车门解锁">
<Rect left="1530" top="1734" right="1630" bottom="1766"/>
<Line1Text Enable="1" Text="所有车门解锁了吗？"/>
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
</Script></Activity>
<Activity id="672" ActivityType="3" flags="0" name="延时">
<Rect left="1530" top="1674" right="1630" bottom="1706"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="673" ActivityType="3" flags="0" name="硬件侧面碰撞输出信号">
<Rect left="1530" top="1794" right="1630" bottom="1826"/>
<Script>#COMM 0x2f 0xC0 0x02 0x03 0x20
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
</Script></Activity>
<Activity id="674" ActivityType="3" flags="0" name="确认所有车门解锁">
<Rect left="1530" top="1854" right="1630" bottom="1886"/>
<Line1Text Enable="1" Text="所有车门解锁了吗？"/>
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
</Script></Activity>
<Activity id="675" ActivityType="3" flags="0" name="延时">
<Rect left="1530" top="1854" right="1630" bottom="1886"/>
<Script>#DELAY 1000</Script></Activity>
<Activity id="676" ActivityType="4" flags="0" name="路由节点">
<Rect left="874" top="104" right="906" bottom="136"/>
</Activity>
<Activity id="678" ActivityType="3" flags="0" name="返回控制权">
<Rect left="1530" top="1914" right="1630" bottom="1946"/>
<Script>#COMM 0x2f 0xC0 0x02 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);







</Script></Activity>
<Activity id="679" ActivityType="3" flags="0" name="结束通讯">
<Rect left="1430" top="1004" right="1530" bottom="1036"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="681" ActivityType="3" flags="0" name="关闭 SBR 开关手动确认">
<Rect left="2170" top="694" right="2270" bottom="726"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="关闭 SBR 开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="682" ActivityType="3" flags="0" name="关闭 SBR 开关">
<Rect left="2170" top="754" right="2270" bottom="786"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="30" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x2f 0xc0 0x03 0x03 0x00
engine.println(" engine.LastError=".. engine.LastError);
engine.SetLineText(3,@4);
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
<Activity id="683" ActivityType="3" flags="0" name="打开 SBR 手动确认">
<Rect left="2170" top="754" right="2270" bottom="786"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="打开 SBR 开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="684" ActivityType="3" flags="0" name="打开 SBR 开关">
<Rect left="2180" top="814" right="2280" bottom="846"/>
<Strategy TotalTime="1000" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#COMM 0x22 0x3f
#COMM 0x2f 0xc0 0x03 0x03 0x01
 engine.SetLineText(3,@4);
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

end</Script></Activity>
<Activity id="685" ActivityType="3" flags="0" name="坐在乘客位手动确认">
<Rect left="2180" top="874" right="2280" bottom="906"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="坐在乘客座位上"/>
<InputText Enable="1"/>
<Script></Script></Activity>
<Activity id="686" ActivityType="3" flags="0" name="坐在副驾驶位置">
<Rect left="2180" top="934" right="2280" bottom="966"/>
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
<Activity id="687" ActivityType="3" flags="0" name="离开副驾驶位置">
<Rect left="2180" top="994" right="2280" bottom="1026"/>
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
<Activity id="688" ActivityType="4" flags="0" name="条件4">
<Rect left="1464" top="94" right="1496" bottom="126"/>
</Activity>
<Activity id="689" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="1430" top="214" right="1530" bottom="246"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="690" ActivityType="3" flags="0" name="检测失败">
<Rect left="2060" top="754" right="2160" bottom="786"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="691" ActivityType="3" flags="0" name="检测失败">
<Rect left="2320" top="814" right="2420" bottom="846"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="692" ActivityType="3" flags="0" name="检测失败">
<Rect left="2060" top="934" right="2160" bottom="966"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="693" ActivityType="3" flags="0" name="离开乘客座位手动确认">
<Rect left="2180" top="994" right="2280" bottom="1026"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="离开乘客座位"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="694" ActivityType="5" flags="0" name="ACU_ReadDTC">
<Rect left="1580" top="144" right="1680" bottom="176"/>
<SubProcesses>
<SubProcess id="ACU_ReadDTC">
<Parameters>
<Parameter id="Station" value="{&quot;B1A101F&quot;}"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="705" ActivityType="3" flags="0" name="安全气囊(ACU)">
<Rect left="260" top="164" right="360" bottom="196"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Script></Script></Activity>
<Activity id="706" ActivityType="3" flags="0" name="连接ECU">
<Rect left="260" top="164" right="360" bottom="196"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="707" ActivityType="3" flags="0" name="切诊断">
<Rect left="260" top="284" right="360" bottom="316"/>
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

end</Script><assessment no="3" name="DEP1619" type="8" flags="97"/>
</Activity>
<Activity id="708" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="260" top="354" right="360" bottom="386"/>
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

end</Script><assessment no="4" name="DEP1620" type="8" flags="97"/>
</Activity>
<Activity id="709" ActivityType="13" flags="0" name="计算">
<Rect left="260" top="414" right="360" bottom="446"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xB9ED8BFE"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="710" ActivityType="3" flags="0" name="发送key">
<Rect left="260" top="474" right="360" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
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

end</Script><assessment no="5" name="DEP1621" type="8" flags="97"/>
</Activity>
<Activity id="711" ActivityType="3" flags="0" name="通讯">
<Rect left="260" top="224" right="360" bottom="256"/>
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

end</Script><assessment no="1" name="DEP1617" type="8" flags="97"/>
</Activity>
<Activity id="712" ActivityType="3" flags="0" name="通讯失败">
<Rect left="60" top="224" right="160" bottom="256"/>
<Line1Text Enable="1" Text="ACU控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="713" ActivityType="3" flags="0" name="结束通讯">
<Rect left="60" top="164" right="160" bottom="196"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="714" ActivityType="3" flags="0" name="安全气囊(ACU)">
<Rect left="260" top="104" right="360" bottom="136"/>
<TitleText Enable="1" Text="安全气囊(ACU)"/>
<Script></Script></Activity>
<Activity id="715" ActivityType="3" flags="0" name="关闭气囊警示灯">
<Rect left="440" top="354" right="540" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="关闭气囊警示灯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x00 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="33" name="DEP2378" type="8" flags="97"/>
</Activity>
<Activity id="716" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="440" top="414" right="540" bottom="446"/>
<Line1Text Enable="1" Text="气囊警示灯已关闭，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="34" name="DEP2379" type="8" flags="97"/>
</Activity>
<Activity id="717" ActivityType="3" flags="0" name="返回控制权">
<Rect left="440" top="494" right="540" bottom="526"/>
<Script>#COMM 0x2F 0xC0 0x00 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="35" name="DEP2380" type="8" flags="97"/>
</Activity>
<Activity id="718" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="440" top="554" right="540" bottom="586"/>
<Line1Text Enable="1" Text="气囊警示灯已关闭，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="67" name="DEP2379" type="8" flags="97"/>
</Activity>
<Activity id="719" ActivityType="3" flags="0" name="气囊检测">
<Rect left="440" top="164" right="540" bottom="196"/>
<Script></Script></Activity>
<Activity id="720" ActivityType="3" flags="0" name="关闭乘客气囊激活开关">
<Rect left="630" top="224" right="730" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="关闭乘客安全气囊激活开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x01 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="36" name="DEP2381" type="8" flags="97"/>
</Activity>
<Activity id="721" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="630" top="284" right="730" bottom="316"/>
<Line1Text Enable="1" Text="乘客安全气囊禁用图标已亮，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="37" name="DEP2382" type="8" flags="97"/>
</Activity>
<Activity id="722" ActivityType="3" flags="0" name="打开乘客气囊激活开关">
<Rect left="630" top="354" right="730" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="打开乘客安全气囊激活开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x01 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="38" name="DEP2383" type="8" flags="97"/>
</Activity>
<Activity id="723" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="630" top="414" right="730" bottom="446"/>
<Line1Text Enable="1" Text="乘客安全气囊禁用图标已灭，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="39" name="DEP2384" type="8" flags="97"/>
</Activity>
<Activity id="724" ActivityType="3" flags="0" name="返回控制权">
<Rect left="630" top="494" right="730" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x01 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="68" name="DEP2380" type="8" flags="97"/>
</Activity>
<Activity id="725" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="630" top="554" right="730" bottom="586"/>
<Line1Text Enable="1" Text="乘客安全气囊禁用图标已灭，请再次确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="69" name="DEP2379" type="8" flags="97"/>
</Activity>
<Activity id="726" ActivityType="3" flags="0" name="乘客气囊激活开关检测">
<Rect left="696" top="159" right="796" bottom="191"/>
<Line1Text Enable="1" Text="请关闭乘客气囊激活开关？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script></Activity>
<Activity id="727" ActivityType="3" flags="0" name="发送Crash Output信号">
<Rect left="838" top="265" right="938" bottom="297"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送Crash Output信号"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x02 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="41" name="DEP2386" type="8" flags="97"/>
</Activity>
<Activity id="728" ActivityType="3" flags="0" name="人工确认车门上锁状态">
<Rect left="836" top="312" right="936" bottom="344"/>
<Line1Text Enable="1" Text="已发送Crash Output信号，请确认车门是否已解锁？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="42" name="DEP2391" type="8" flags="97"/>
</Activity>
<Activity id="729" ActivityType="3" flags="0" name="发送Front Side Carsh Output信号">
<Rect left="840" top="414" right="940" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送Front Side Carsh Output信号"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x02 0x03 0x02

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="43" name="DEP2387" type="8" flags="97"/>
</Activity>
<Activity id="731" ActivityType="3" flags="0" name="返回控制权">
<Rect left="960" top="1144" right="1060" bottom="1176"/>
<Script>#COMM 0xC0 0x01 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="35" name="DEP2380" type="8" flags="97"/>
</Activity>
<Activity id="732" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="960" top="1204" right="1060" bottom="1236"/>
<Line1Text Enable="1" Text="乘客气囊Deactivation Lamp已关闭，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="34" name="DEP2379" type="8" flags="97"/>
</Activity>
<Activity id="733" ActivityType="3" flags="0" name="检测Crash Output">
<Rect left="840" top="164" right="940" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="734" ActivityType="3" flags="0" name="锁上所有车门">
<Rect left="839" top="215" right="939" bottom="247"/>
<Line1Text Enable="1" Text="请锁上所有车门，测试Crash Output信号"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="40" name="DEP2385" type="8" flags="97"/>
</Activity>
<Activity id="735" ActivityType="3" flags="0" name="人工确认车门上锁状态">
<Rect left="840" top="474" right="940" bottom="506"/>
<Line1Text Enable="1" Text="发送Front Side Carsh Output信号，请确认车门是否已解锁？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="61" name="DEP2391" type="8" flags="97"/>
</Activity>
<Activity id="736" ActivityType="3" flags="0" name="发送Driver Side Carsh Output信号">
<Rect left="840" top="594" right="940" bottom="626"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送Driver Side Carsh Output信号"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x02 0x03 0x04

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="62" name="DEP2388" type="8" flags="97"/>
</Activity>
<Activity id="737" ActivityType="3" flags="0" name="人工确认车门上锁状态">
<Rect left="840" top="654" right="940" bottom="686"/>
<Line1Text Enable="1" Text="已发送Driver Side Carsh Output信号，请确认车门是否已解锁？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="63" name="DEP2391" type="8" flags="97"/>
</Activity>
<Activity id="738" ActivityType="3" flags="0" name="发送Passenger Side Carsh Output信号">
<Rect left="841" top="748" right="941" bottom="780"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送Passenger Side Carsh Output信号"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x02 0x03 0x08

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="45" name="DEP2389" type="8" flags="97"/>
</Activity>
<Activity id="739" ActivityType="3" flags="0" name="人工确认车门上锁状态">
<Rect left="842" top="796" right="942" bottom="828"/>
<Line1Text Enable="1" Text="已发送Passenger Side Carsh Output 信号，请确认车门是否已解锁"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="64" name="DEP2391" type="8" flags="97"/>
</Activity>
<Activity id="740" ActivityType="3" flags="0" name="发送Hardware Side Carsh Output信号">
<Rect left="840" top="894" right="940" bottom="926"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送Passenger Side Carsh Output信号"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x02 0x03 0x20

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="46" name="DEP2390" type="8" flags="97"/>
</Activity>
<Activity id="741" ActivityType="3" flags="0" name="人工确认车门上锁状态">
<Rect left="840" top="964" right="940" bottom="996"/>
<Line1Text Enable="1" Text="已发送Hardware Side Carsh Output信号，请确认车门是否已解锁？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="65" name="DEP2391" type="8" flags="97"/>
</Activity>
<Activity id="745" ActivityType="4" flags="0" name="路由节点">
<Rect left="1274" top="94" right="1306" bottom="126"/>
</Activity>
<Activity id="746" ActivityType="3" flags="0" name="打开SBR灯">
<Rect left="1240" top="274" right="1340" bottom="306"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送打开SBR灯指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x03 0x03 0x01

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="48" name="DEP2393" type="8" flags="97"/>
</Activity>
<Activity id="747" ActivityType="3" flags="0" name="人工确认打开">
<Rect left="1242" top="338" right="1342" bottom="370"/>
<Line1Text Enable="1" Text="SBR灯已打开，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="49" name="DEP2394" type="8" flags="97"/>
</Activity>
<Activity id="748" ActivityType="3" flags="0" name="关闭SBR灯">
<Rect left="1240" top="404" right="1340" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="发送关闭SBR灯指令"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x03 0x03 0x00

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);



</Script><assessment no="50" name="DEP2395" type="8" flags="97"/>
</Activity>
<Activity id="749" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="1237" top="462" right="1337" bottom="494"/>
<Line1Text Enable="1" Text="SBR已关闭，请确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="51" name="DEP2396" type="8" flags="97"/>
</Activity>
<Activity id="750" ActivityType="3" flags="0" name="返回控制权">
<Rect left="1240" top="524" right="1340" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMM 0x2F 0xC0 0x03 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);


</Script><assessment no="60" name="DEP2380" type="8" flags="97"/>
</Activity>
<Activity id="751" ActivityType="3" flags="0" name="人工确认关闭">
<Rect left="1240" top="604" right="1340" bottom="636"/>
<Line1Text Enable="1" Text="SBR灯已关闭，请再次确认？"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="66" name="DEP2396" type="8" flags="97"/>
</Activity>
<Activity id="752" ActivityType="3" flags="0" name="SBR检测">
<Rect left="1240" top="164" right="1340" bottom="196"/>
<Script></Script></Activity>
<Activity id="753" ActivityType="3" flags="0" name="关闭所有SBR灯">
<Rect left="1351" top="159" right="1451" bottom="191"/>
<Line1Text Enable="1" Text="关闭所有SBR灯"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script><assessment no="47" name="DEP2392" type="8" flags="97"/>
</Activity>
<Activity id="754" ActivityType="3" flags="0" name="人工系上所有安全带">
<Rect left="1030" top="224" right="1130" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请系上前后排全部安全带"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON



</Script></Activity>
<Activity id="755" ActivityType="3" flags="0" name="读取前后排所有安全带锁扣状态">
<Rect left="1030" top="344" right="1130" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取前后排所有安全带锁扣状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#COMM 0x22 0x29 0x02
if(@0 == 0x62)then
	if(@3 == 0x22 and bit32.band(@6,0x02) == 1 and bit32.band(@7,0x02) == 1 and bit32.band(@8,0x02) == 1)then
		engine.println("前后排所有安全带锁扣系上");
                engine.LastError = 0;
	else
		engine.LastError = 1;
        end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="70" name="DEP2397" type="8" flags="97"/>
</Activity>
<Activity id="756" ActivityType="3" flags="0" name="安全带检测">
<Rect left="1030" top="164" right="1130" bottom="196"/>
<Script></Script></Activity>
<Activity id="757" ActivityType="3" flags="0" name="等待2秒">
<Rect left="1030" top="284" right="1130" bottom="316"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="等待2秒"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="758" ActivityType="3" flags="0" name="人工解开所有安全带">
<Rect left="1030" top="414" right="1130" bottom="446"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="人工解开所有安全带"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON



</Script></Activity>
<Activity id="759" ActivityType="3" flags="0" name="读取前后排所有安全带锁扣状态">
<Rect left="1030" top="534" right="1130" bottom="566"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取前后排所有安全带锁扣状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#COMM 0x22 0x29 0x02
if(@0 == 0x62)then
	if(@3 == 0x33 and bit32.band(@6,0x03) == 1 and bit32.band(@7,0x03) == 1 and bit32.band(@8,0x03) == 1)then
		engine.println("前后排所有安全带锁扣解开");
                engine.LastError = 0;
	else
		engine.LastError = 1;
        end
else
	engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="71" name="DEP2397" type="8" flags="97"/>
</Activity>
<Activity id="760" ActivityType="3" flags="0" name="等待2秒">
<Rect left="1030" top="474" right="1130" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="等待2秒"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="761" ActivityType="4" flags="0" name="路由节点">
<Rect left="1064" top="104" right="1096" bottom="136"/>
</Activity>
<Activity id="762" ActivityType="4" flags="0" name="路由节点">
<Rect left="94" top="1004" right="126" bottom="1036"/>
</Activity>
<Activity id="763" ActivityType="3" flags="0" name="锁上所有车门">
<Rect left="836" top="365" right="936" bottom="397"/>
<Line1Text Enable="1" Text="请锁上所有车门，测试Front Side Crash Output信号"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="80" name="DEP2385" type="8" flags="97"/>
</Activity>
<Activity id="764" ActivityType="3" flags="0" name="锁上所有车门">
<Rect left="839" top="539" right="939" bottom="571"/>
<Line1Text Enable="1" Text="请锁上所有车门，测试Driver Side Crash Output信号"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="81" name="DEP2385" type="8" flags="97"/>
</Activity>
<Activity id="765" ActivityType="3" flags="0" name="锁上所有车门">
<Rect left="841" top="706" right="941" bottom="738"/>
<Line1Text Enable="1" Text="请锁上所有车门，测试Passenger Side Crash Output信号"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="82" name="DEP2385" type="8" flags="97"/>
</Activity>
<Activity id="766" ActivityType="3" flags="0" name="锁上所有车门">
<Rect left="840" top="841" right="940" bottom="873"/>
<Line1Text Enable="1" Text="请锁上所有车门，测试Hardware Side Crash Output信号"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃";
end
</Script><assessment no="83" name="DEP2385" type="8" flags="97"/>
</Activity>
<Activity id="767" ActivityType="4" flags="0" name="路由节点">
<Rect left="474" top="54" right="506" bottom="86"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="714" type="0">
</Transition>
<Transition StartId="4" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="715" type="0">
</Transition>
<Transition StartId="11" EndId="719" type="0">
</Transition>
<Transition StartId="139" EndId="179" type="0">
</Transition>
<Transition StartId="179" EndId="180" type="0">
</Transition>
<Transition StartId="180" EndId="182" type="0">
</Transition>
<Transition StartId="180" EndId="185" type="4">
</Transition>
<Transition StartId="182" EndId="184" type="0">
</Transition>
<Transition StartId="183" EndId="181" type="0">
</Transition>
<Transition StartId="183" EndId="185" type="4">
</Transition>
<Transition StartId="184" EndId="183" type="0">
</Transition>
<Transition StartId="185" EndId="181" type="0">
</Transition>
<Transition StartId="186" EndId="720" type="0">
</Transition>
<Transition StartId="659" EndId="660" type="0">
</Transition>
<Transition StartId="660" EndId="661" type="0">
</Transition>
<Transition StartId="661" EndId="662" type="0">
</Transition>
<Transition StartId="661" EndId="665" type="4">
</Transition>
<Transition StartId="662" EndId="664" type="0">
</Transition>
<Transition StartId="663" EndId="665" type="4">
</Transition>
<Transition StartId="663" EndId="667" type="0">
</Transition>
<Transition StartId="664" EndId="663" type="0">
</Transition>
<Transition StartId="666" EndId="665" type="0">
</Transition>
<Transition StartId="666" EndId="659" type="3">
</Transition>
<Transition StartId="667" EndId="668" type="0">
</Transition>
<Transition StartId="668" EndId="669" type="0">
</Transition>
<Transition StartId="669" EndId="670" type="0">
</Transition>
<Transition StartId="670" EndId="672" type="0">
</Transition>
<Transition StartId="671" EndId="673" type="0">
</Transition>
<Transition StartId="672" EndId="671" type="0">
</Transition>
<Transition StartId="673" EndId="675" type="0">
</Transition>
<Transition StartId="675" EndId="674" type="0">
</Transition>
<Transition StartId="676" EndId="733" type="0">
</Transition>
<Transition StartId="679" EndId="2" type="0">
</Transition>
<Transition StartId="681" EndId="682" type="0">
</Transition>
<Transition StartId="682" EndId="683" type="3">
</Transition>
<Transition StartId="682" EndId="690" type="4">
</Transition>
<Transition StartId="683" EndId="684" type="0">
</Transition>
<Transition StartId="684" EndId="685" type="3">
</Transition>
<Transition StartId="684" EndId="690" type="4">
</Transition>
<Transition StartId="685" EndId="686" type="0">
</Transition>
<Transition StartId="686" EndId="693" type="3">
</Transition>
<Transition StartId="686" EndId="692" type="4">
</Transition>
<Transition StartId="687" EndId="691" type="4">
</Transition>
<Transition StartId="688" EndId="689" type="0">
</Transition>
<Transition StartId="689" EndId="679" type="0">
</Transition>
<Transition StartId="690" EndId="685" type="0">
</Transition>
<Transition StartId="692" EndId="693" type="0">
</Transition>
<Transition StartId="693" EndId="687" type="0">
</Transition>
<Transition StartId="694" EndId="689" type="0">
</Transition>
<Transition StartId="705" EndId="706" type="0">
</Transition>
<Transition StartId="706" EndId="711" type="0">
</Transition>
<Transition StartId="707" EndId="708" type="0">
</Transition>
<Transition StartId="708" EndId="709" type="0">
</Transition>
<Transition StartId="709" EndId="710" type="0">
</Transition>
<Transition StartId="710" EndId="767" type="0">
</Transition>
<Transition StartId="711" EndId="707" type="3">
</Transition>
<Transition StartId="711" EndId="712" type="4">
</Transition>
<Transition StartId="712" EndId="713" type="0">
</Transition>
<Transition StartId="712" EndId="762" type="5">
</Transition>
<Transition StartId="713" EndId="706" type="0">
</Transition>
<Transition StartId="714" EndId="705" type="0">
</Transition>
<Transition StartId="715" EndId="716" type="0">
</Transition>
<Transition StartId="716" EndId="717" type="0">
</Transition>
<Transition StartId="717" EndId="186" type="0">
</Transition>
<Transition StartId="719" EndId="4" type="0">
</Transition>
<Transition StartId="720" EndId="721" type="0">
</Transition>
<Transition StartId="721" EndId="722" type="0">
</Transition>
<Transition StartId="722" EndId="723" type="0">
</Transition>
<Transition StartId="723" EndId="724" type="0">
</Transition>
<Transition StartId="724" EndId="745" type="0">
</Transition>
<Transition StartId="726" EndId="720" type="0">
</Transition>
<Transition StartId="727" EndId="728" type="0">
</Transition>
<Transition StartId="728" EndId="763" type="0">
</Transition>
<Transition StartId="729" EndId="735" type="0">
</Transition>
<Transition StartId="731" EndId="732" type="0">
</Transition>
<Transition StartId="733" EndId="734" type="0">
</Transition>
<Transition StartId="734" EndId="727" type="0">
</Transition>
<Transition StartId="735" EndId="764" type="0">
</Transition>
<Transition StartId="736" EndId="737" type="0">
</Transition>
<Transition StartId="737" EndId="765" type="0">
</Transition>
<Transition StartId="738" EndId="739" type="0">
</Transition>
<Transition StartId="739" EndId="766" type="0">
</Transition>
<Transition StartId="740" EndId="741" type="0">
</Transition>
<Transition StartId="741" EndId="745" type="0">
</Transition>
<Transition StartId="745" EndId="752" type="0">
</Transition>
<Transition StartId="746" EndId="747" type="0">
</Transition>
<Transition StartId="747" EndId="748" type="0">
</Transition>
<Transition StartId="748" EndId="749" type="0">
</Transition>
<Transition StartId="749" EndId="750" type="0">
</Transition>
<Transition StartId="750" EndId="688" type="0">
</Transition>
<Transition StartId="752" EndId="746" type="0">
</Transition>
<Transition StartId="753" EndId="746" type="0">
</Transition>
<Transition StartId="754" EndId="757" type="0">
</Transition>
<Transition StartId="755" EndId="758" type="0">
</Transition>
<Transition StartId="756" EndId="754" type="0">
</Transition>
<Transition StartId="757" EndId="755" type="0">
</Transition>
<Transition StartId="758" EndId="760" type="0">
</Transition>
<Transition StartId="759" EndId="745" type="0">
</Transition>
<Transition StartId="760" EndId="759" type="0">
</Transition>
<Transition StartId="761" EndId="756" type="0">
</Transition>
<Transition StartId="762" EndId="679" type="0">
</Transition>
<Transition StartId="763" EndId="729" type="0">
</Transition>
<Transition StartId="764" EndId="736" type="0">
</Transition>
<Transition StartId="765" EndId="738" type="0">
</Transition>
<Transition StartId="766" EndId="740" type="0">
</Transition>
<Transition StartId="767" EndId="186" type="0">
</Transition>
</Transitions>
</Process>

