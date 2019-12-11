<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3029" pbltext="DEP91">
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
<Variable id="CAN_SND_ID" type="3" data="0x721" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x729"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect top="4" right="100" bottom="36"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1350" top="694" right="1450" bottom="726"/>
<Script>engine.DialogBackColor = -1
if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="关闭点火开关">
<Rect left="131" top="3" right="231" bottom="35"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请关闭点火开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="锁定4个车门，准备测试">
<Rect left="130" top="164" right="230" bottom="196"/>
<Line1Text Enable="1" Text="拿着钥匙在车外，完全关闭4个车门"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="锁定4个车门，准备测试！"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃测试"/>
<ButtonRText Enable="1" Text="开始测试"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script><assessment no="47" name="DEP2508" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="PEPS 司机门完全关闭">
<Rect left="130" top="234" right="230" bottom="266"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1b") 
if (recvTel:byte(4)==0x00) then
	engine.LastError = 0;
	engine.TestResult = 0;
        engine.SetLineText(2,"#L=左前车门关闭".."#R=bmpok")
else
	engine.LastError = 1;
	engine.SetLineText(2,"#L=左前车门未关闭".."#R=bmpnok")
	engine.TestResult = 1;
end
--engine.SetLineText(3,recvTel:byte(4));

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP726" type="8" flags="97"/>
</Activity>
<Activity id="560" ActivityType="3" flags="0" name="PEPS副驾驶门完全关闭">
<Rect left="130" top="304" right="230" bottom="336"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x22") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(2,"#L=右前车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=右前车门关闭".."#R=bmpnok")
   engine.TestResult = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="23" name="DEP727" type="8" flags="97"/>
</Activity>
<Activity id="561" ActivityType="3" flags="0" name="PEPS 左后门完全关闭">
<Rect left="130" top="384" right="230" bottom="416"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x25") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(2,"#L=左后车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(2,"#L=左后车门关闭".."#R=bmpnok")
     engine.TestResult = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="24" name="DEP728" type="8" flags="97"/>
</Activity>
<Activity id="562" ActivityType="3" flags="0" name="PEPS 右后门完全关闭">
<Rect left="130" top="464" right="230" bottom="496"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x28") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
     engine.SetLineText(2,"#L=右后车门关闭".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(2,"#L=右后车门关闭".."#R=bmpok")
     engine.TestResult = 1;
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="25" name="DEP729" type="8" flags="97"/>
</Activity>
<Activity id="563" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="260" top="464" right="360" bottom="496"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1A") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
   engine.SetLineText(1,"#L=左前车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
     engine.SetLineText(1,"#L=左前车门锁定".."#R=bmpnok")
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="26" name="DEP730" type="8" flags="97"/>
</Activity>
<Activity id="586" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="260" top="374" right="360" bottom="406"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x23") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=左后车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=左后车门锁定".."#R=bmpnok")
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="28" name="DEP732" type="8" flags="97"/>
</Activity>
<Activity id="587" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="260" top="304" right="360" bottom="336"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x26") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右后车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右后车门锁定".."#R=bmpnok")
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="29" name="DEP733" type="8" flags="97"/>
</Activity>
<Activity id="588" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="260" top="234" right="360" bottom="266"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"#L=右前车门锁定".."#R=bmpok")
else
  engine.LastError = 1;
    engine.SetLineText(1,"#L=右前车门锁定".."#R=bmpnok")
end


local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="27" name="DEP731" type="8" flags="97"/>
</Activity>
<Activity id="589" ActivityType="3" flags="0" name="读取接近状态">
<Rect left="410" top="294" right="510" bottom="326"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10" DelayTime="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x07") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="30" name="DEP734" type="8" flags="97"/>
</Activity>
<Activity id="596" ActivityType="3" flags="0" name="读取解锁状态">
<Rect left="410" top="394" right="510" bottom="426"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10" DelayTime="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1A") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
 
else
  engine.LastError = 1;

end

engine.SetLineText(3,recvTel:byte(4));
</Script><assessment no="31" name="DEP735" type="8" flags="97"/>
</Activity>
<Activity id="597" ActivityType="3" flags="0" name="读取接近状态">
<Rect left="540" top="294" right="640" bottom="326"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x08") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));
</Script><assessment no="33" name="DEP737" type="8" flags="97"/>
</Activity>
<Activity id="598" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="540" top="394" right="640" bottom="426"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x23") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="34" name="DEP738" type="8" flags="97"/>
</Activity>
<Activity id="599" ActivityType="3" flags="0" name="读取接近状态">
<Rect left="810" top="294" right="910" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x09") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));
</Script><assessment no="39" name="DEP743" type="8" flags="97"/>
</Activity>
<Activity id="600" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="810" top="394" right="910" bottom="426"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="46" name="DEP744" type="8" flags="97"/>
</Activity>
<Activity id="601" ActivityType="3" flags="0" name="读取接近状态">
<Rect left="670" top="294" right="770" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x0A") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="36" name="DEP740" type="8" flags="97"/>
</Activity>
<Activity id="602" ActivityType="3" flags="0" name="读取锁定状态">
<Rect left="670" top="394" right="770" bottom="426"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x26") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="37" name="DEP741" type="8" flags="97"/>
</Activity>
<Activity id="603" ActivityType="3" flags="0" name="PEPS 乘客门上锁">
<Rect left="940" top="294" right="1040" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x05") 
if (recvTel:byte(4)==0x01) then
 engine.LastError = 0;
 engine.DialogBackColor = "Blue";
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="42" name="DEP746" type="8" flags="97"/>
</Activity>
<Activity id="605" ActivityType="3" flags="0" name="PEPS 右后门上锁">
<Rect left="1080" top="294" right="1180" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x06") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.DialogBackColor = "Blue";
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));
</Script><assessment no="43" name="DEP747" type="8" flags="97"/>
</Activity>
<Activity id="606" ActivityType="3" flags="0" name="PEPS 左后门上锁">
<Rect left="1220" top="294" right="1320" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x04") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
  engine.DialogBackColor = "Blue";
else
  engine.LastError = 1;
 
end
engine.SetLineText(3,recvTel:byte(4));



</Script><assessment no="44" name="DEP748" type="8" flags="97"/>
</Activity>
<Activity id="607" ActivityType="3" flags="0" name="PEPS 司机门上锁">
<Rect left="1350" top="294" right="1450" bottom="326"/>
<Strategy TotalTime="300" NokTime="0" RetryTimeOut="10"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x03") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
engine.DialogBackColor = "Blue";  
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="45" name="DEP749" type="8" flags="97"/>
</Activity>
<Activity id="608" ActivityType="3" flags="0" name="PEPS 左后门打开状态">
<Rect left="540" top="494" right="640" bottom="526"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x25") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="35" name="DEP739" type="8" flags="97"/>
</Activity>
<Activity id="609" ActivityType="3" flags="0" name="PEPS副驾驶门打开状态">
<Rect left="810" top="494" right="910" bottom="526"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x22") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="41" name="DEP745" type="8" flags="97"/>
</Activity>
<Activity id="610" ActivityType="3" flags="0" name="读取司机门打开状态">
<Rect left="410" top="494" right="510" bottom="526"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1b") 
if (recvTel:byte(4)==0x01) then
 engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,recvTel:byte(4));
</Script><assessment no="32" name="DEP736" type="8" flags="97"/>
</Activity>
<Activity id="611" ActivityType="3" flags="0" name="PEPS 右后门打开状态">
<Rect left="670" top="494" right="770" bottom="526"/>
<Strategy TotalTime="600" NokTime="0" RetryTimeOut="20"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x28") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end

engine.SetLineText(3,recvTel:byte(4));</Script><assessment no="50" name="DEP742" type="8" flags="97"/>
</Activity>
<Activity id="612" ActivityType="3" flags="0" name="打开点火开关">
<Rect left="1350" top="574" right="1450" bottom="606"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将点火开关切换ON挡"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
--engine.EcuClose(vciHandle)
--#STOPCOMM
</Script></Activity>
<Activity id="615" ActivityType="3" flags="0" name="接近感应传感器">
<Rect left="410" top="234" right="510" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开司机门"/>
<Line3Text Enable="1" Text="接近传感器状态"/>
<Script></Script></Activity>
<Activity id="616" ActivityType="3" flags="1" name="解锁司机门">
<Rect left="410" top="344" right="510" bottom="376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除司机门锁"/>
<Line3Text Enable="1" Text="车门解锁状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="617" ActivityType="3" flags="0" name="打开司机门">
<Rect left="410" top="444" right="510" bottom="476"/>
<Strategy NokTime="0" RetryTimeOut="22" DelayTime="20000"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开司机门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="618" ActivityType="3" flags="0" name="接近感应传感器">
<Rect left="540" top="234" right="640" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开左后门"/>
<Line3Text Enable="1" Text="接近传感器状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="619" ActivityType="3" flags="0" name="解锁左后门">
<Rect left="540" top="344" right="640" bottom="376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除左后门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="620" ActivityType="3" flags="0" name="打开左侧后门">
<Rect left="540" top="444" right="640" bottom="476"/>
<Strategy NokTime="0" RetryTimeOut="22" DelayTime="20000"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开左后门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="621" ActivityType="3" flags="0" name="接近感应传感器">
<Rect left="670" top="234" right="770" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开右后门"/>
<Line3Text Enable="1" Text="接近传感器 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="622" ActivityType="3" flags="0" name="打开右侧后门">
<Rect left="670" top="444" right="770" bottom="476"/>
<Strategy NokTime="0" RetryTimeOut="22" DelayTime="20000"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开右后门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="623" ActivityType="3" flags="0" name="解锁右后门">
<Rect left="670" top="344" right="770" bottom="376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除右后门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="624" ActivityType="3" flags="0" name="接近感应传感器">
<Rect left="810" top="234" right="910" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="从外面感应式打开乘客门"/>
<Line3Text Enable="1" Text="接近传感器 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="625" ActivityType="3" flags="0" name="解锁副驾驶门">
<Rect left="810" top="344" right="910" bottom="376"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="感应式解除副驾驶门锁"/>
<Line3Text Enable="1" Text="车门解锁 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="626" ActivityType="3" flags="0" name="副驾驶门打开">
<Rect left="810" top="444" right="910" bottom="476"/>
<Strategy NokTime="0" RetryTimeOut="22" DelayTime="20000"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请打开副驾驶门"/>
<Line3Text Enable="1" Text="车门打开 状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="627" ActivityType="3" flags="0" name="PDCU 智能锁开关手动测试">
<Rect left="940" top="234" right="1040" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按乘客侧智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="628" ActivityType="3" flags="0" name="RRDCU 智能锁开关手动测试">
<Rect left="1080" top="234" right="1180" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按右后门智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script> engine.DialogBackColor = -1</Script></Activity>
<Activity id="629" ActivityType="3" flags="0" name="RLDCU 智能锁开关手动测试">
<Rect left="1220" top="234" right="1320" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按左后门智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="630" ActivityType="3" flags="0" name="DDCU 智能锁开关手动测试">
<Rect left="1350" top="234" right="1450" bottom="266"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1" Text="请按司机侧智能锁开关"/>
<Line3Text Enable="1" Text="智能锁开关状态"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.DialogBackColor = -1</Script></Activity>
<Activity id="636" ActivityType="3" flags="0" name="通讯失败">
<Rect left="260" top="114" right="360" bottom="146"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script><assessment no="1" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="637" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="130" top="54" right="230" bottom="86"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="638" ActivityType="13" flags="0" name="通讯">
<Rect left="130" top="114" right="230" bottom="146"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\xf1\x87&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="90" name="DEP92" type="8" flags="97"/>
</Activity>
<Activity id="639" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="260" top="54" right="360" bottom="86"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="640" ActivityType="4" flags="0" name="路由节点">
<Rect left="1514" top="114" right="1546" bottom="146"/>
</Activity>
<Activity id="641" ActivityType="3" flags="0" name="普通节点">
<Rect left="1700" top="264" right="1800" bottom="296"/>
<Script></Script></Activity>
<Activity id="642" ActivityType="4" flags="0" name="路由节点">
<Rect left="1514" top="574" right="1546" bottom="606"/>
</Activity>
<Activity id="644" ActivityType="4" flags="0" name="路由节点">
<Rect left="1464" top="164" right="1496" bottom="196"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="637" type="0">
</Transition>
<Transition StartId="28" EndId="206" type="0">
</Transition>
<Transition StartId="28" EndId="644" type="4">
</Transition>
<Transition StartId="206" EndId="560" type="0">
</Transition>
<Transition StartId="560" EndId="561" type="0">
</Transition>
<Transition StartId="561" EndId="562" type="0">
</Transition>
<Transition StartId="562" EndId="563" type="0">
</Transition>
<Transition StartId="563" EndId="586" type="0">
</Transition>
<Transition StartId="586" EndId="587" type="0">
</Transition>
<Transition StartId="587" EndId="588" type="0">
</Transition>
<Transition StartId="588" EndId="616" type="0">
</Transition>
<Transition StartId="596" EndId="617" type="0">
</Transition>
<Transition StartId="598" EndId="620" type="0">
</Transition>
<Transition StartId="600" EndId="609" type="0">
</Transition>
<Transition StartId="600" EndId="626" type="0">
</Transition>
<Transition StartId="602" EndId="622" type="0">
</Transition>
<Transition StartId="603" EndId="628" type="0">
</Transition>
<Transition StartId="605" EndId="629" type="0">
</Transition>
<Transition StartId="606" EndId="630" type="0">
</Transition>
<Transition StartId="607" EndId="612" type="0">
</Transition>
<Transition StartId="608" EndId="623" type="0">
</Transition>
<Transition StartId="609" EndId="627" type="0">
</Transition>
<Transition StartId="610" EndId="619" type="0">
</Transition>
<Transition StartId="611" EndId="625" type="0">
</Transition>
<Transition StartId="612" EndId="2" type="0">
</Transition>
<Transition StartId="615" EndId="589" type="0">
</Transition>
<Transition StartId="616" EndId="596" type="0">
</Transition>
<Transition StartId="617" EndId="610" type="0">
</Transition>
<Transition StartId="618" EndId="597" type="0">
</Transition>
<Transition StartId="619" EndId="598" type="0">
</Transition>
<Transition StartId="620" EndId="608" type="0">
</Transition>
<Transition StartId="621" EndId="601" type="0">
</Transition>
<Transition StartId="622" EndId="611" type="0">
</Transition>
<Transition StartId="623" EndId="602" type="0">
</Transition>
<Transition StartId="624" EndId="599" type="0">
</Transition>
<Transition StartId="625" EndId="600" type="0">
</Transition>
<Transition StartId="627" EndId="603" type="0">
</Transition>
<Transition StartId="628" EndId="605" type="0">
</Transition>
<Transition StartId="629" EndId="606" type="0">
</Transition>
<Transition StartId="630" EndId="607" type="0">
</Transition>
<Transition StartId="636" EndId="639" type="0">
</Transition>
<Transition StartId="636" EndId="640" type="5">
</Transition>
<Transition StartId="637" EndId="638" type="0">
</Transition>
<Transition StartId="638" EndId="28" type="0">
</Transition>
<Transition StartId="638" EndId="636" type="4">
</Transition>
<Transition StartId="639" EndId="637" type="0">
</Transition>
<Transition StartId="640" EndId="642" type="0">
</Transition>
<Transition StartId="642" EndId="612" type="0">
</Transition>
<Transition StartId="644" EndId="640" type="0">
</Transition>
</Transitions>
</Process>

