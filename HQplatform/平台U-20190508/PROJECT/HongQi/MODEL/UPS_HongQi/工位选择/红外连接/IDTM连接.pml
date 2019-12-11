<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Result" type="3" dir="1" data="1"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="134" right="580" bottom="166"/>
<Script>Result = 0;
DStr_IDTMName ="";</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="594" right="580" bottom="626"/>
<Script></Script></End>
<Activities>
<Activity id="9" ActivityType="13" flags="0" name="GetFirapName">
<Rect left="480" top="294" right="580" bottom="326"/>
<Line1Text Enable="1" Text="VMT连接红外接收器"/>
<Line2Text Enable="1" Text="将VMT对准红外接收器"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="GetFirapName" model="LibGeneral">
<Parameters>
<Parameter id="firapName" ret="DStr_IDTMName"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="红外重新连接">
<Rect left="630" top="294" right="730" bottom="326"/>
<Line1Text Enable="1" Text="IDTM连接失败"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.SetLineText(2,"#L=" .. "重试？" .. "#R=BMPEYE");
#PRESSBUTTON
if (engine.LButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "重试？" .. "#R=BMPNOK");
engine.ShowMessage();
engine.LastError = 1;
engine.StatValue = "NOK";

elseif (engine.RButtonPressed == true) then

engine.SetLineText(2,"#L=" .. "重试？" .. "#R=BMPOK");
engine.ShowMessage();
engine.LastError = 0;
engine.StatValue = "OK";

end;
print(" xx DStr_IDTMName = "..tostring(DStr_IDTMName));
engine.IrdaSetState(false)
engine.Delay(500)</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="退出">
<Rect left="780" top="294" right="880" bottom="326"/>
<Script>engine.IrdaSetState(false)
Result = 1;</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="check_IDTM_connect_NOK">
<Rect left="640" top="434" right="740" bottom="466"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>
engine.SetLineText(2,"红外建立连接失败，正在重新连接");
engine.Delay(500)
print("Timestart ="..tostring(Timestart));
Timeused = os.clock() - Timestart;
RunningTime = string.format("%d",Timeused)
engine.SetLineText(3,"连接时间:"..tostring(RunningTime))</Script></Activity>
<Activity id="555" ActivityType="4" flags="0" name="路由节点">
<Rect left="674" top="374" right="706" bottom="406"/>
</Activity>
<Activity id="556" ActivityType="3" flags="0" name="check_IDTM_connect_OK">
<Rect left="480" top="514" right="580" bottom="546"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>
engine.SetLineText(2,"红外建立连接成功");</Script></Activity>
<Activity id="558" ActivityType="3" flags="1" name="退出">
<Rect left="780" top="434" right="880" bottom="466"/>
<Script>engine.IrdaSetState(false)
Result = 1;</Script></Activity>
<Activity id="559" ActivityType="3" flags="0" name="红外名字显示">
<Rect left="480" top="354" right="580" bottom="386"/>
<Line1Text Enable="1" Text="找到的红外模块设备名称："/>
<Line2Text Enable="1" Text="&amp;DStr_IDTMName"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>engine.Delay(2000)
if(DStr_IDTMName == "ALSHQIDTM01") then
    engine.WorkPlace = "FWE";
elseif(DStr_IDTMName == "ROLHQIDTM01")then
    engine.WorkPlace = "ROL";
elseif(DStr_IDTMName == "BSDHQIDTM01")then
    engine.WorkPlace = "FAS";
end;

print(" ##DStr_IDTMName = "..tostring(DStr_IDTMName));
engine.println("###engine.WorkPlace From IDTM###"..tostring(engine.WorkPlace))
Timestart = os.clock();</Script></Activity>
<Activity id="560" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="224" right="696" bottom="256"/>
</Activity>
<Activity id="561" ActivityType="13" flags="0" name="idtmConnect_check_connectionV2">
<Rect left="480" top="434" right="580" bottom="466"/>
<FunctionRef id="idtmConnect_check_connectionV2" model="LibGeneral">
<Parameters>
<Parameter id="ret" ret="ret"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="562" ActivityType="3" flags="0" name="开启红外">
<Rect left="480" top="204" right="580" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.IrdaSetState(true)
engine.Delay(1000)
--Timestart = os.clock();</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="562" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="1">
<Expression>DStr_IDTMName ==""</Expression></Transition>
<Transition StartId="9" EndId="559" type="0">
</Transition>
<Transition StartId="10" EndId="12" type="0">
</Transition>
<Transition StartId="10" EndId="560" type="3">
</Transition>
<Transition StartId="15" EndId="561" type="0">
</Transition>
<Transition StartId="15" EndId="558" type="1">
<Expression>engine.LButtonPressed == true or Timeused &gt;= 15</Expression></Transition>
<Transition StartId="555" EndId="15" type="0">
</Transition>
<Transition StartId="556" EndId="2" type="0">
</Transition>
<Transition StartId="559" EndId="561" type="0">
</Transition>
<Transition StartId="560" EndId="9" type="0">
</Transition>
<Transition StartId="561" EndId="556" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="561" EndId="555" type="0">
</Transition>
<Transition StartId="562" EndId="9" type="0">
</Transition>
</Transitions>
</Process>

