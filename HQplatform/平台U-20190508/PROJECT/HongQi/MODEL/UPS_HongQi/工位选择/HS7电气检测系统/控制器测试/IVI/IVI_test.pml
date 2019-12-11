<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3033" pbltext="DEP1773">
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="180" top="34" right="280" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="IVI功能测试"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="770" top="564" right="870" bottom="596"/>
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
<Activity id="10" ActivityType="13" flags="0" name="安全访问">
<Rect left="180" top="264" right="280" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0x96B968CA"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP1778" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="Backlight Level 5">
<Rect left="180" top="344" right="280" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开5级背景光"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xD3\x61\x03\x00\x04") </Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="手动确认">
<Rect left="180" top="424" right="280" bottom="456"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(2,"#L=请确认5级背景光点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script><assessment no="24" name="DEP2177" type="8" flags="97"/>
</Activity>
<Activity id="556" ActivityType="3" flags="0" name="Backlight Level 1">
<Rect left="380" top="174" right="480" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="自动打开1级背景光"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xD3\x61\x03\x00\x00") </Script></Activity>
<Activity id="557" ActivityType="3" flags="0" name="手动确认">
<Rect left="380" top="254" right="480" bottom="286"/>
<Line1Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(2,"#L=请确认1级背景光点亮".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script><assessment no="25" name="DEP2178" type="8" flags="97"/>
</Activity>
<Activity id="558" ActivityType="3" flags="0" name="返回控制">
<Rect left="380" top="334" right="480" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xD3\x61\x00") </Script></Activity>
<Activity id="559" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="770" top="504" right="870" bottom="536"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="560" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="180" top="104" right="280" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment no="21" name="DEP1774" type="8" flags="97"/>
</Activity>
<Activity id="561" ActivityType="13" flags="0" name="扩展会话">
<Rect left="180" top="184" right="280" bottom="216"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP1776" type="8" flags="97"/>
</Activity>
<Activity id="562" ActivityType="3" flags="0" name="返回控制">
<Rect left="380" top="94" right="480" bottom="126"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="返回控制权"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x2F,0x6F,"\xD3\x61\x00") </Script></Activity>
<Activity id="564" ActivityType="13" flags="0" name="读制动液传感器状态">
<Rect left="380" top="424" right="480" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读制动液传感器状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x60\x03&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="565" ActivityType="3" flags="0" name="普通节点">
<Rect left="570" top="94" right="670" bottom="126"/>
<Script>local value = string.byte(result,4)
if(value == 0x01) then 
engine.SetLineText(1,"#L=制动液传感器状态".."#R=bmpok")
else
engine.SetLineText(1,"#L=制动液传感器状态".."#R=bmpnok")
end 
engine.Delay(300)</Script><assessment no="26" name="DEP2179" type="8" flags="97"/>
</Activity>
<Activity id="566" ActivityType="13" flags="0" name="前轮磨损信号状态">
<Rect left="570" top="174" right="670" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读前轮磨损信号状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x60\x04&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="567" ActivityType="3" flags="0" name="普通节点">
<Rect left="570" top="254" right="670" bottom="286"/>
<Script>local value = string.byte(result,4)
if(value == 0x00) then 
engine.SetLineText(1,"#L=前轮磨损信号状态".."#R=bmpok")
else
engine.SetLineText(1,"#L=前轮磨损信号状态".."#R=bmpnok")
end 
engine.Delay(300)</Script><assessment no="27" name="DEP2180" type="8" flags="97"/>
</Activity>
<Activity id="568" ActivityType="13" flags="0" name="后轮磨损信号状态">
<Rect left="570" top="334" right="670" bottom="366"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读后轮磨损信号状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x60\x05&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="569" ActivityType="3" flags="0" name="普通节点">
<Rect left="570" top="424" right="670" bottom="456"/>
<Script>local value = string.byte(result,4)
if(value == 0x00) then 
engine.SetLineText(1,"#L=后轮磨损信号状态".."#R=bmpok")
else
engine.SetLineText(1,"#L=后轮磨损信号状态".."#R=bmpnok")
end 
engine.Delay(300)</Script><assessment no="29" name="DEP2181" type="8" flags="97"/>
</Activity>
<Activity id="570" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="94" right="870" bottom="126"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.SetLineText(1,"#L=请确认发动机是启动状态".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="571" ActivityType="13" flags="0" name="机油压力开关输入">
<Rect left="770" top="174" right="870" bottom="206"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="读机油压力传感器状态"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&apos;\x60\x02&apos;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="572" ActivityType="3" flags="0" name="普通节点">
<Rect left="770" top="254" right="870" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local value = string.byte(result,4)
if(value == 0x01) then 
engine.SetLineText(1,"#L=机油压力传感器状态".."#R=bmpok")
else
engine.SetLineText(1,"#L=机油压力传感器状态".."#R=bmpnok")
end 
engine.Delay(300)</Script><assessment no="30" name="DEP2182" type="8" flags="97"/>
</Activity>
<Activity id="573" ActivityType="3" flags="0" name="清零开关检测">
<Rect left="900" top="334" right="1000" bottom="366"/>
<Strategy TotalTime="100" NokTime="100" RetryTimeOut="20" DelayTime="200"/>
<Line2Text Enable="1" Text="按下清零开关"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x60\x01") 
local value = string.byte(recvTel,4)
engine.SetLineText(2,@3);
if(value == 0x01) then 
	engine.LastError = 0 ;
	engine.TestResult = 0;
else
	engine.LastError = 1;
	engine.TestResult = 1;
end 

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="31" name="DEP2183" type="8" flags="97"/>
</Activity>
<Activity id="574" ActivityType="3" flags="0" name="娱乐主机功能检查">
<Rect left="770" top="424" right="870" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"#L=请确认娱乐主机功能正常".."#R=bmpeye")
#PRESSBUTTON
if(engine.RButtonPressed==true)then
 engine.LastError = 0;
end 
if(engine.LButtonPressed==true)then
 engine.LastError = 1;
 engine.TestResult = 1;
end</Script><assessment no="32" name="DEP2184" type="8" flags="97"/>
</Activity>
<Activity id="576" ActivityType="3" flags="0" name="通讯失败">
<Rect left="30" top="184" right="130" bottom="216"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="577" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="30" top="104" right="130" bottom="136"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="578" ActivityType="4" flags="0" name="路由节点">
<Rect left="64" top="504" right="96" bottom="536"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="560" type="0">
</Transition>
<Transition StartId="10" EndId="564" type="0">
</Transition>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="14" EndId="562" type="0">
</Transition>
<Transition StartId="556" EndId="557" type="0">
</Transition>
<Transition StartId="557" EndId="558" type="0">
</Transition>
<Transition StartId="558" EndId="564" type="0">
</Transition>
<Transition StartId="559" EndId="2" type="0">
</Transition>
<Transition StartId="560" EndId="561" type="0">
</Transition>
<Transition StartId="561" EndId="10" type="0">
</Transition>
<Transition StartId="561" EndId="576" type="4">
</Transition>
<Transition StartId="562" EndId="556" type="0">
</Transition>
<Transition StartId="564" EndId="565" type="0">
</Transition>
<Transition StartId="565" EndId="566" type="0">
</Transition>
<Transition StartId="566" EndId="567" type="0">
</Transition>
<Transition StartId="567" EndId="568" type="0">
</Transition>
<Transition StartId="568" EndId="569" type="0">
</Transition>
<Transition StartId="569" EndId="570" type="0">
</Transition>
<Transition StartId="570" EndId="571" type="0">
</Transition>
<Transition StartId="571" EndId="572" type="0">
</Transition>
<Transition StartId="572" EndId="574" type="0">
</Transition>
<Transition StartId="574" EndId="559" type="0">
</Transition>
<Transition StartId="576" EndId="577" type="0">
</Transition>
<Transition StartId="576" EndId="578" type="5">
</Transition>
<Transition StartId="577" EndId="560" type="0">
</Transition>
<Transition StartId="578" EndId="559" type="0">
</Transition>
</Transitions>
</Process>

