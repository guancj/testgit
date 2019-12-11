<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3023" pbltext="DEP157">
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
<Variable id="CAN_SND_ID" type="3" data="0x760" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x768" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="490" top="174" right="590" bottom="206"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="490" top="1034" right="590" bottom="1066"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动向前状态">
<Rect left="490" top="344" right="590" bottom="376"/>
<Strategy TotalTime="295" NokTime="0" RetryTimeOut="40" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前进"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1C") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
 engine.SetLineText(3,@3);
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="15" name="DEP541" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动向后状态">
<Rect left="490" top="414" right="590" bottom="446"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅后退"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1D") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP542" type="8" flags="97"/>
</Activity>
<Activity id="29" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动整体向上状态">
<Rect left="490" top="464" right="590" bottom="496"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅整体上升"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1E") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="17" name="DEP543" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动整体向下状态">
<Rect left="490" top="514" right="590" bottom="546"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅整体下降"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x1F") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="18" name="DEP544" type="8" flags="97"/>
</Activity>
<Activity id="34" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动靠背向前状态">
<Rect left="490" top="564" right="590" bottom="596"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅靠背向前"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x20") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="19" name="DEP545" type="8" flags="97"/>
</Activity>
<Activity id="36" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动靠背向后状态">
<Rect left="490" top="614" right="590" bottom="646"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅靠背向后"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x21") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="20" name="DEP546" type="8" flags="97"/>
</Activity>
<Activity id="38" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动前端向上状态">
<Rect left="490" top="674" right="590" bottom="706"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向上"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x22") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="21" name="DEP547" type="8" flags="97"/>
</Activity>
<Activity id="40" ActivityType="3" flags="0" name="DSCU 驾驶员座椅手动前端向下状态">
<Rect left="490" top="724" right="590" bottom="756"/>
<Strategy TotalTime="80" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1" Text="手动测试"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="手动调整驾驶员座椅前端向下"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>local recvTel  = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,"\x01\x23") 
if (recvTel:byte(4)==0x01) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
engine.SetLineText(3,@3);

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="22" name="DEP548" type="8" flags="97"/>
</Activity>
<Activity id="42" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="490" top="784" right="590" bottom="816"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script></Script></Activity>
<Activity id="43" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="490" top="224" right="590" bottom="256"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="46" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="490" top="944" right="590" bottom="976"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="手动测试">
<Rect left="680" top="864" right="780" bottom="896"/>
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
end</Script><assessment no="29" name="DEP549" type="8" flags="97"/>
</Activity>
<Activity id="83" ActivityType="3" flags="0" name="清空所有显示">
<Rect left="490" top="864" right="590" bottom="896"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="84" ActivityType="3" flags="0" name="通讯失败">
<Rect left="340" top="284" right="440" bottom="316"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="185" ActivityType="13" flags="0" name="扩展会话">
<Rect left="490" top="284" right="590" bottom="316"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="1" name="DEP158" type="8" flags="97"/>
</Activity>
<Activity id="186" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="340" top="224" right="440" bottom="256"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="214" ActivityType="4" flags="0" name="路由节点">
<Rect left="374" top="944" right="406" bottom="976"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="43" type="0">
</Transition>
<Transition StartId="3" EndId="27" type="0">
</Transition>
<Transition StartId="27" EndId="29" type="0">
</Transition>
<Transition StartId="29" EndId="32" type="0">
</Transition>
<Transition StartId="32" EndId="34" type="0">
</Transition>
<Transition StartId="34" EndId="36" type="0">
</Transition>
<Transition StartId="36" EndId="38" type="0">
</Transition>
<Transition StartId="38" EndId="40" type="0">
</Transition>
<Transition StartId="40" EndId="42" type="0">
</Transition>
<Transition StartId="42" EndId="83" type="0">
</Transition>
<Transition StartId="43" EndId="185" type="0">
</Transition>
<Transition StartId="46" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="83" type="0">
</Transition>
<Transition StartId="83" EndId="46" type="0">
</Transition>
<Transition StartId="84" EndId="186" type="0">
</Transition>
<Transition StartId="84" EndId="214" type="5">
</Transition>
<Transition StartId="185" EndId="84" type="4">
</Transition>
<Transition StartId="185" EndId="3" type="0">
</Transition>
<Transition StartId="186" EndId="43" type="0">
</Transition>
<Transition StartId="214" EndId="46" type="0">
</Transition>
</Transitions>
</Process>

