<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="54" right="400" bottom="86"/>
<Script></Script><TitleText Enable="1" Text="自动变速器 (AT)"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="840" top="814" right="940" bottom="846"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="AT 挂 P 档">
<Rect left="310" top="274" right="410" bottom="306"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到P档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="17" name="DEP504" type="8" flags="97"/>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="AT 挂 R 档">
<Rect left="310" top="334" right="410" bottom="366"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到R档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x01) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="18" name="DEP505" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="AT 挂 N 档">
<Rect left="310" top="464" right="410" bottom="496"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到N档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x02) then
   engine.LastError = 0;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="40" name="DEP506" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="AT 挂 D 档">
<Rect left="310" top="674" right="410" bottom="706"/>
<Strategy TotalTime="125" NokTime="125" RetryTimeOut="25" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到D档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x03 or recvTel:byte(4)==0x08) then
	engine.LastError = 0;
	--engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
	engine.LastError = 1;
	--engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="19" name="DEP507" type="8" flags="97"/>
</Activity>
<Activity id="19" ActivityType="3" flags="0" name="AT 切 手动 档">
<Rect left="460" top="274" right="560" bottom="306"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换到手动模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x05) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="22" name="DEP512" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="3" flags="0" name="切换回D档">
<Rect left="460" top="594" right="560" bottom="626"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换回D档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x25") 
if (recvTel:byte(4)==0x00) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=驾驶模式状态".."#R=bmpok")
else
  engine.LastError = 1;
  engine.SetLineText(2,"#L=驾驶模式状态状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="23" name="DEP510" type="8" flags="97"/>
</Activity>
<Activity id="128" ActivityType="3" flags="0" name="Tip 模式">
<Rect left="1080" top="454" right="1180" bottom="486"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换驾驶模式:手动模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x25") 
if (recvTel:byte(4)==0x02) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=驾驶模式状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=驾驶模式状态".."#R=bmpnok")
 end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" no="0" type="8" flags="97"/>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="AT Tip 到 Tip 模式">
<Rect left="460" top="334" right="560" bottom="366"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换到手动模式"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x23") 
if (recvTel:byte(4)==0x20) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="25" name="DEP513" type="8" flags="97"/>
</Activity>
<Activity id="130" ActivityType="3" flags="0" name="AT Tip 到 Tip + 模式">
<Rect left="460" top="394" right="560" bottom="426"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换到+挡"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x23") 
if (recvTel:byte(4)==0x60) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="26" name="DEP477" type="8" flags="97"/>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="AT Tip 到 Tip 模式">
<Rect left="460" top="464" right="560" bottom="496"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将档位切换到手动模式"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x23") 
if (recvTel:byte(4)==0x20) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="AT Tip到Tip-模式">
<Rect left="460" top="524" right="560" bottom="556"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请切换-档"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x23") 
if (recvTel:byte(4)==0xA0) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end 
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="27" name="DEP478" type="8" flags="97"/>
</Activity>
<Activity id="223" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="840" top="644" right="940" bottom="676"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="225" ActivityType="13" flags="0" name="安全访问">
<Rect left="310" top="224" right="410" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x31540365"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="14" name="DEP35" type="8" flags="97"/>
</Activity>
<Activity id="226" ActivityType="3" flags="0" name="AT 读油温">
<Rect left="630" top="154" right="730" bottom="186"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取油温度"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x08") 
--[[if (recvTel:byte(4)==0x00 or recvTel:byte(4)==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);]]--

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="29" name="DEP515" type="8" flags="97"/>
</Activity>
<Activity id="227" ActivityType="3" flags="0" name="AT 读车速">
<Rect left="630" top="84" right="730" bottom="116"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读取车速"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x18") 
--[[if (recvTel:byte(4)==0x00) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=当前车速".."#R=".."0")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=当前车速".."#R=bmpnok")
end]]--
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="28" name="DEP514" type="8" flags="97"/>
</Activity>
<Activity id="228" ActivityType="3" flags="0" name="换挡电磁阀测试S1">
<Rect left="630" top="224" right="730" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行换挡电池阀A命令(S1)"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x67\x03\x01") 

Pram_1 = nil;</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="51" name="DEP2214" type="8" flags="97"/>
</Activity>
<Activity id="229" ActivityType="3" flags="0" name="Shift Solenoid A Monitor">
<Rect left="630" top="284" right="730" bottom="316"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x01") 
value = string.byte(recvTel ,4)</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="50" name="DEP2213" type="8" flags="97"/>
</Activity>
<Activity id="230" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="630" top="364" right="730" bottom="396"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="MeasInt" value="value"/>
<Parameter id="RightViewText" value="&quot;监视器开启&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="30" name="DEP2212" type="8" flags="97"/>
</Activity>
<Activity id="231" ActivityType="4" flags="0" name="路由节点">
<Rect left="754" top="324" right="786" bottom="356"/>
</Activity>
<Activity id="232" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="630" top="424" right="730" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x67\x00") 
</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="52" name="DEP2215" type="8" flags="97"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="换挡电磁阀测试S2">
<Rect left="630" top="484" right="730" bottom="516"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行换挡电池阀A命令(S2)"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x68\x03\x01") 

Pram_1 = nil;</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="53" name="DEP2218" type="8" flags="97"/>
</Activity>
<Activity id="234" ActivityType="3" flags="0" name="Shift Solenoid A Monitor">
<Rect left="630" top="554" right="730" bottom="586"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x01") 
value = string.byte(recvTel ,4)</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="54" name="DEP2217" type="8" flags="97"/>
</Activity>
<Activity id="235" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="630" top="644" right="730" bottom="676"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????001?&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="MeasInt" value="value"/>
<Parameter id="RightViewText" value="&quot;监视器开启&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="10"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="31" name="DEP2216" type="8" flags="97"/>
</Activity>
<Activity id="236" ActivityType="4" flags="0" name="路由节点">
<Rect left="744" top="604" right="776" bottom="636"/>
</Activity>
<Activity id="237" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="840" top="84" right="940" bottom="116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x68\x00") 
</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="55" name="DEP2215" type="8" flags="97"/>
</Activity>
<Activity id="238" ActivityType="3" flags="0" name="EOP Command">
<Rect left="840" top="164" right="940" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动执行EOP"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x69\x03\x01") 

Pram_1 = nil;</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="56" name="DEP2219" type="8" flags="97"/>
</Activity>
<Activity id="239" ActivityType="3" flags="0" name="ReadDataByIdentifier">
<Rect left="840" top="244" right="940" bottom="276"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x33") 
value = string.byte(recvTel ,4)*(100/255)</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="57" name="DEP2220" type="8" flags="97"/>
</Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="964" top="284" right="996" bottom="316"/>
</Activity>
<Activity id="242" ActivityType="13" flags="0" name="Tolerance_view_Float_A">
<Rect left="840" top="324" right="940" bottom="356"/>
<FunctionRef id="Tolerance_view_Float_A" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="LastErr" value="engine.LastError"/>
<Parameter id="UpperLimit" value="100"/>
<Parameter id="LowerLimit" value="0"/>
<Parameter id="MeasValue" value="value"/>
<Parameter id="RightViewText" value="&quot;EOP反馈值&quot;"/>
<Parameter id="barUpper" value="0"/>
<Parameter id="barLimit" value="0"/>
<Parameter id="barScale" value="5"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="3"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="15"/>
<Parameter id="BarType" value="1"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="StatUnit" value="&quot;&quot;"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="58" name="DEP2221" type="8" flags="97"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="ReturnControlToECU">
<Rect left="840" top="404" right="940" bottom="436"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xA8\x69\x00") 
</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="59" name="DEP2215" type="8" flags="97"/>
</Activity>
<Activity id="254" ActivityType="5" flags="0" name="AT_Linear_solenoid_current_check">
<Rect left="840" top="484" right="940" bottom="516"/>
<SubProcesses>
<SubProcess id="AT_Linear_solenoid_current_check">
<Parameters>
<Parameter id="vciHandle" value="vciHandle"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="256" ActivityType="3" flags="0" name="AT 挂 P 档">
<Rect left="460" top="684" right="560" bottom="716"/>
<Strategy TotalTime="75" NokTime="75" RetryTimeOut="15" DelayTime="200"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到P档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x00) then
  engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="17" name="DEP504" type="8" flags="97"/>
</Activity>
<Activity id="257" ActivityType="3" flags="0" name="切AUTO模式">
<Rect left="120" top="674" right="220" bottom="706"/>
<Line2Text Enable="1" Text="将驾驶模式调到 AUTO模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="258" ActivityType="3" flags="0" name="切SPORT模式">
<Rect left="310" top="724" right="410" bottom="756"/>
<Line2Text Enable="1" Text="将驾驶模式调到 SPORT模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="259" ActivityType="3" flags="0" name="获取S挡状态">
<Rect left="180" top="774" right="280" bottom="806"/>
<Strategy TotalTime="150" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请手动切换到D档"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x04\x19") 
if (recvTel:byte(4)==0x04) then
 engine.LastError = 0;
  engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpok")
    engine.SetLineText(3,"#L=请保持在D挡".."#R=bmpok")
else
  engine.LastError = 1;
   engine.SetLineText(2,"#L=读挡位切换状态".."#R=bmpnok")
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="45" name="DEP2342" type="8" flags="97"/>
</Activity>
<Activity id="260" ActivityType="3" flags="0" name="切AOTU模式">
<Rect left="120" top="724" right="220" bottom="756"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请确保模式在AUTO模式下"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="262" ActivityType="3" flags="0" name="请确认PDC功能激活">
<Rect left="310" top="394" right="410" bottom="426"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>--if(engine.CarType ~= "DAPNHACC0003" and engine.CarType ~="DAPNHACC0002" and engine.CarType ~="DAPNHACC0001" and engine.CarType ~="DAPNHACC0000") then
if( LibGeneral.CarTNC_HS7_L(engine.CarType) == false) then
	engine.SetLineText(1,"#L=请确认PDC功能激活并且指示灯亮?".."#R=bmpeye")
        engine.println("非L车型");      
else
	engine.SetLineText(1,"#L=请确认PDC功能激活?".."#R=bmpeye")
        engine.println("L车型");    
end
#PRESSBUTTON
if(engine.RButtonPressed==true)then
	engine.LastError = 0;
	engine.TestResult = 0;
	engine.StatValue="人工操作点击确定！";
elseif(engine.LButtonPressed==true)then
	engine.LastError = 1;
	engine.TestResult = 1;
	engine.StatValue="人工操作点击放弃！";
end
</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="66" name="DEP2317" type="8" flags="97"/>
</Activity>
<Activity id="263" ActivityType="3" flags="0" name="请关闭PDC开关">
<Rect left="310" top="524" right="410" bottom="556"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>--engine.SetLineText(1,"#L=请并关闭PDC开关".."#R=bmpeye")
--#PRESSBUTTON
engine.SetLineText(2,"#L=请关闭PDC开关".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工点击确定";
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
  engine.StatValue = "人工点击放弃";
end</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="67" name="DEP2313" type="8" flags="97"/>
</Activity>
<Activity id="264" ActivityType="3" flags="0" name="请确认PDC功能关闭且指示灯灭了么">
<Rect left="310" top="594" right="410" bottom="626"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>--if(engine.CarType ~= "DAPNHACC0003" and engine.CarType ~="DAPNHACC0002" and engine.CarType ~="DAPNHACC0001" and engine.CarType ~="DAPNHACC0000") then
if(  LibGeneral.CarTNC_HS7_L(engine.CarType) == false) then
  
	engine.SetLineText(1,"#L=请确认PDC功能关闭并且指示灯灭?".."#R=bmpeye")
        engine.println("非L车型");
else
	engine.SetLineText(1,"#L=请确认PDC功能关闭?".."#R=bmpeye")
        engine.println("L车型");    
end
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工操作点击确认" ;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
 engine.StatValue = "人工操作点击放弃";
end</Script><assessment block="1" ptbtext="DEP164" group="3013" pbltext="DEP73" no="68" name="DEP2318" type="8" flags="97"/>
</Activity>
<Activity id="265" ActivityType="3" flags="0" name="通讯失败">
<Rect top="164" right="100" bottom="196"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="266" ActivityType="13" flags="0" name="AT建立通讯">
<Rect left="310" top="104" right="410" bottom="136"/>
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
<Activity id="267" ActivityType="13" flags="0" name="扩展会话">
<Rect left="310" top="164" right="410" bottom="196"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="12" name="DEP1086" type="8" flags="97"/>
</Activity>
<Activity id="268" ActivityType="13" flags="0" name="ECU_Close">
<Rect top="104" right="100" bottom="136"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="269" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="814" right="66" bottom="846"/>
</Activity>
<Activity id="270" ActivityType="4" flags="0" name="路由节点">
<Rect left="774" top="814" right="806" bottom="846"/>
</Activity>
<Activity id="271" ActivityType="4" flags="0" name="路由节点">
<Rect left="204" top="524" right="236" bottom="556"/>
</Activity>
<Activity id="273" ActivityType="3" flags="0" name="连接失败">
<Rect left="120" top="334" right="220" bottom="366"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(0,"获取R挡状态失败，重试按确定")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
 engine.StatValue = "人工点击重试";
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
  engine.StatValue = "人工点击放弃";
end</Script><assessment block="1" ptbtext="DEP164" group="3003" pbltext="DEP31" no="68" name="DEP2520" type="8" flags="97"/>
</Activity>
<Activity id="274" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="334" right="66" bottom="366"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="266" type="0">
</Transition>
<Transition StartId="3" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="262" type="0">
</Transition>
<Transition StartId="9" EndId="273" type="4">
</Transition>
<Transition StartId="11" EndId="263" type="0">
</Transition>
<Transition StartId="11" EndId="271" type="1">
<Expression>LibGeneral.CarTNC_HS7_L(engine.CarType)</Expression></Transition>
<Transition StartId="13" EndId="19" type="0">
</Transition>
<Transition StartId="19" EndId="129" type="0">
</Transition>
<Transition StartId="126" EndId="256" type="0">
</Transition>
<Transition StartId="129" EndId="130" type="0">
</Transition>
<Transition StartId="130" EndId="131" type="0">
</Transition>
<Transition StartId="131" EndId="132" type="0">
</Transition>
<Transition StartId="132" EndId="126" type="0">
</Transition>
<Transition StartId="223" EndId="2" type="0">
</Transition>
<Transition StartId="225" EndId="3" type="0">
</Transition>
<Transition StartId="226" EndId="228" type="0">
</Transition>
<Transition StartId="227" EndId="226" type="0">
</Transition>
<Transition StartId="228" EndId="229" type="0">
</Transition>
<Transition StartId="229" EndId="230" type="0">
</Transition>
<Transition StartId="230" EndId="231" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="230" EndId="232" type="0">
</Transition>
<Transition StartId="231" EndId="229" type="0">
</Transition>
<Transition StartId="232" EndId="233" type="0">
</Transition>
<Transition StartId="233" EndId="234" type="0">
</Transition>
<Transition StartId="234" EndId="235" type="0">
</Transition>
<Transition StartId="235" EndId="236" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="235" EndId="237" type="0">
</Transition>
<Transition StartId="236" EndId="234" type="0">
</Transition>
<Transition StartId="237" EndId="238" type="0">
</Transition>
<Transition StartId="238" EndId="239" type="0">
</Transition>
<Transition StartId="239" EndId="242" type="0">
</Transition>
<Transition StartId="241" EndId="239" type="0">
</Transition>
<Transition StartId="242" EndId="241" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="242" EndId="247" type="0">
</Transition>
<Transition StartId="247" EndId="254" type="0">
</Transition>
<Transition StartId="254" EndId="223" type="0">
</Transition>
<Transition StartId="256" EndId="227" type="0">
</Transition>
<Transition StartId="257" EndId="13" type="0">
</Transition>
<Transition StartId="258" EndId="259" type="0">
</Transition>
<Transition StartId="262" EndId="11" type="0">
</Transition>
<Transition StartId="263" EndId="264" type="0">
</Transition>
<Transition StartId="264" EndId="13" type="0">
</Transition>
<Transition StartId="265" EndId="268" type="0">
</Transition>
<Transition StartId="265" EndId="274" type="5">
</Transition>
<Transition StartId="266" EndId="267" type="0">
</Transition>
<Transition StartId="267" EndId="265" type="4">
</Transition>
<Transition StartId="267" EndId="225" type="0">
</Transition>
<Transition StartId="268" EndId="266" type="0">
</Transition>
<Transition StartId="269" EndId="270" type="0">
</Transition>
<Transition StartId="270" EndId="223" type="0">
</Transition>
<Transition StartId="271" EndId="13" type="0">
</Transition>
<Transition StartId="273" EndId="268" type="1">
<Expression>engine.RButtonPressed == true</Expression></Transition>
<Transition StartId="273" EndId="274" type="0">
</Transition>
<Transition StartId="274" EndId="269" type="0">
</Transition>
</Transitions>
</Process>

