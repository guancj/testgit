<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="0" description="通讯句柄"/>
<Variable id="modeControl" type="3" dir="0" data="0" description="模式控制，设置发送报文中第6字节值，范围0-7"/>
<Variable id="speedFL" type="5" dir="0" data="0" description="左前毂速度,单位km/h"/>
<Variable id="speedFR" type="5" dir="0" data="0" description="右前毂速度,单位km/h"/>
<Variable id="speedRL" type="5" dir="0" data="0" description="左后毂速度,单位km/h"/>
<Variable id="speedRR" type="5" dir="0" data="0" description="右后毂速度,单位km/h"/>
<Variable id="torqueFL" type="3" dir="0" data="0" description="左前毂扭矩"/>
<Variable id="torqueFR" type="3" dir="0" data="0" description="右前毂扭矩"/>
<Variable id="torqueRL" type="3" dir="0" data="0" description="左后毂扭矩"/>
<Variable id="torqueRR" type="3" dir="0" data="0" description="右后毂扭矩"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="HolderPosition" type="11" dir="0" data=""/>
<Variable id="ExhaustFlag" type="11" dir="0" data=""/>
<Variable id="withEngine" type="11" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="430" top="64" right="530" bottom="96"/>
<Script>engine.Delay(50)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="430" top="424" right="530" bottom="456"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="430" top="184" right="530" bottom="216"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000011@3==0b00000010&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="1" name="IDT_03_ControlActuators">
<Rect left="430" top="304" right="530" bottom="336"/>
<Line2Text Enable="1" Text="驾驶模式设置"/>
<Line4Text Enable="1" Text="请等待.."/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="50"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="OK">
<Rect left="430" top="364" right="530" bottom="396"/>
<Script>isOK = true;
engine.println(" &lt;RTS_03_ControlActuators&gt; ")</Script></Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="680" top="304" right="780" bottom="336"/>
<Line2Text Enable="1" Text="IDT SERVICE 01 ERROR"/>
<Script>isOK = false
engine.DialogBackColor = "red"
engine.Delay(2000)
</Script></Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="430" top="124" right="530" bottom="156"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="680" top="124" right="780" bottom="156"/>
<Script>engine.println(" &lt;IDT_03_ControlActuators : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="714" top="424" right="746" bottom="456"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="模式以及各毂速度扭矩设置">
<Rect left="430" top="244" right="530" bottom="276"/>
<Script>actionValue = 0x00
if(withEngine == true) then
	actionValue = bit32.bor(actionValue,0x02);
else
	actionValue = bit32.band(actionValue,0xFD);
end


if (HolderPosition == true) then
	actionValue = bit32.bor(actionValue,0x40)
else
	actionValue = bit32.band(actionValue,0xBF)
end

if(ExhaustFlag == true) then
	actionValue = bit32.bor(actionValue,0x80);    --设置第8bit位
else
	actionValue = bit32.band(actionValue,0x7F);
end

idt_tel = LibIDT.idtSetBytes(idt_tel,5,1,string.char(actionValue))
idt_tel = LibIDT.idtSetBytes(idt_tel,6,1,string.char(modeControl))


local factor = 100;

local hexStr = "";
--设置左前毂速度,第7、8字节
hexStr = LibIDT.idtword2hex(speedFL*factor);
idt_tel = LibIDT.idtSetBytes(idt_tel,7,2,hexStr);

--设置左前毂扭矩值,第9、10字节
hexStr = LibIDT.idtword2hex(torqueFL);
idt_tel = LibIDT.idtSetBytes(idt_tel,9,2,hexStr);

--设置右前毂速度,第11、12字节
hexStr = LibIDT.idtword2hex(speedFR*factor);
idt_tel = LibIDT.idtSetBytes(idt_tel,11,2,hexStr);

--设置右前毂扭矩值,第13、14字节
hexStr = LibIDT.idtword2hex(torqueFR);
idt_tel = LibIDT.idtSetBytes(idt_tel,13,2,hexStr);

--设置左后毂速度,第15、16字节
hexStr = LibIDT.idtword2hex(speedRL*factor);
idt_tel = LibIDT.idtSetBytes(idt_tel,15,2,hexStr);

--设置左后毂扭矩值,第17、18字节
hexStr = LibIDT.idtword2hex(torqueRL);
idt_tel = LibIDT.idtSetBytes(idt_tel,17,2,hexStr);

--设置右后毂速度,第19、20字节
hexStr = LibIDT.idtword2hex(speedRR*factor);
idt_tel = LibIDT.idtSetBytes(idt_tel,19,2,hexStr);

--设置右后毂扭矩值,第21、22字节
hexStr = LibIDT.idtword2hex(torqueRR);
idt_tel = LibIDT.idtSetBytes(idt_tel,21,2,hexStr);
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="48" type="0">
</Transition>
<Transition StartId="3" EndId="52" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="4" EndId="47" type="0">
</Transition>
<Transition StartId="5" EndId="2" type="0">
</Transition>
<Transition StartId="47" EndId="51" type="0">
</Transition>
<Transition StartId="48" EndId="3" type="1">
<Expression>Hndl~=nil and Hndl&gt;= 0</Expression></Transition>
<Transition StartId="48" EndId="49" type="0">
</Transition>
<Transition StartId="49" EndId="47" type="0">
</Transition>
<Transition StartId="51" EndId="2" type="0">
</Transition>
<Transition StartId="52" EndId="4" type="0">
</Transition>
</Transitions>
</Process>

