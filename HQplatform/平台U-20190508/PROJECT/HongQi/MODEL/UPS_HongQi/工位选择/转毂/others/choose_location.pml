<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" name="开始节点">
<Rect left="148" top="80" right="248" bottom="112"/>
<Script></Script></Start>
<End id="2" ActivityType="2" name="结束节点">
<Rect left="146" top="317" right="246" bottom="349"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" name="工位列表">
<Rect left="147" top="139" right="247" bottom="171"/>
<TitleText Enable="1" Text="工位选择"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--工位设置
engine.WorkPlace = "NUL";
strLocationAdm = "ADM - 系统管理员";
strLocationVp1 = "VP1 - 一次内饰工位";
strLocationVp2 = "VP2 - 二次内饰工位";
strLocationZp7 = "EC7 - 机能线工位";
strLocationAls = "ALS - 前束大灯检测";
strLocationRts = "RTS - 转毂检测";
strLocationRtsRepair = "RTS - 转毂检测 返修";
strLocationOpt = "OPT - 返修工作站";
strLocationZp8 = "ZP8 - 终检线工位";

--列表添加
engine.DialogBackColor = -1;


engine.ListClear();
--engine.ListAddString(strLocationAdm,false);
--engine.ListAddString(strLocationVp1,false);
--engine.ListAddString(strLocationVp2,false);
--engine.ListAddString(strLocationZp7,true);
--engine.ListAddString(strLocationAls,false);
engine.ListAddString(strLocationRts,true);
engine.ListAddString(strLocationRtsRepair,false);
--engine.ListAddString(strLocationOpt,false);
--engine.ListAddString(strLocationZp8,false);

engine.SelectLayout(1);
#INPUT strLocationSel
engine.println("已选择工位：" .. tostring(strLocationSel));
engine.DialogBackColor = -1;
</Script></Activity>
<Activity id="4" ActivityType="3" name="设置工位">
<Rect left="146" top="199" right="246" bottom="231"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>
local Tmp_StrLocation = "";

if (strLocationSel == strLocationAdm ) then 
Tmp_StrLocation = "ADM";
elseif(strLocationSel == strLocationVp1) then
Tmp_StrLocation = "VP1";
elseif(strLocationSel == strLocationVp2) then
Tmp_StrLocation = "VP2";
elseif(strLocationSel == strLocationZp7) then
Tmp_StrLocation = "EC7";
elseif(strLocationSel == strLocationAls) then
Tmp_StrLocation = "ALS";
elseif(strLocationSel == strLocationRts) then
Tmp_StrLocation = "ROL";
elseif(strLocationSel == strLocationRtsRepair) then
Tmp_StrLocation = "ROR";
elseif(strLocationSel == strLocationOpt) then
Tmp_StrLocation = "OPT";
elseif(strLocationSel == strLocationZp8) then
Tmp_StrLocation = "EC8";
end;

engine.WorkPlace = Tmp_StrLocation;
engine.SelectLayout(0);</Script></Activity>
<Activity id="5" ActivityType="3" name="普通节点">
<Rect left="145" top="261" right="245" bottom="293"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonRText Enable="1" Text="确定"/>
<Script></Script></Activity>
<Activity id="7" ActivityType="3" name="刷新">
<Rect left="315" top="220" right="415" bottom="252"/>
<Script>engine.WorkPlace = "NUL";
engine.SelectLayout(0);</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="6">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="2" type="0">
</Transition>
<Transition StartId="7" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

