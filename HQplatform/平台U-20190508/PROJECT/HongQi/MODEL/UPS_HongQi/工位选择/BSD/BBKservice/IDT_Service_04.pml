<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3040" pbltext="DEP2333">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="CalibFlag" type="3" dir="0" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="300" top="24" right="400" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="300" top="414" right="400" bottom="446"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="300" top="154" right="400" bottom="186"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000100&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String" value="engine.VIN"/>
<Parameter id="StringStartPos" value="25"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="IDT_SERVICE_4_ Vehicle type">
<Rect left="300" top="274" right="400" bottom="306"/>
<Line2Text Enable="1" Text="发送底盘号以及操作类型"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="3"/>
<Parameter id="pHndl" value="Hndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="3" flags="1" name="OK">
<Rect left="300" top="334" right="400" bottom="366"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "04 Service is successful"
engine.println(" &lt;BAS_01_Start&gt; ")</Script><assessment no="2" name="DEP2325" type="8" flags="97"/>
</Activity>
<Activity id="47" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="274" right="650" bottom="306"/>
<Line2Text Enable="1" Text="IDT SERVICE 04 ERROR"/>
<Script>isOK = false

engine.LastError = 1
engine.StatValue = "04 Service is failuer"
engine.DialogBackColor = "red"
engine.Delay(2000)</Script><assessment no="2" name="DEP2325" type="8" flags="97"/>
</Activity>
<Activity id="48" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="300" top="94" right="400" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="49" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="550" top="94" right="650" bottom="126"/>
<Script>engine.println(" &lt;BSD 04 Vehicle type : handle invalid --&gt;"..tostring(Hndl))</Script></Activity>
<Activity id="51" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="414" right="616" bottom="446"/>
</Activity>
<Activity id="52" ActivityType="3" flags="0" name="检测设置">
<Rect left="300" top="214" right="400" bottom="246"/>
<Script>if (CalibFlag == 1) then                      --BSD
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x01))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x00))
elseif(CalibFlag == 2) then 	   	  --IFC
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x01))
elseif(CalibFlag == 3) then		  --IFC,BSD
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x01))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x01))
elseif(CalibFlag == 4) then		  --H7-BSD, Back
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x01))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x01))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x00))
elseif(CalibFlag == 5) then		  --H7 Back
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x01))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x00))
elseif(CalibFlag == 6) then		  --HS7 Back,IFC
	idt_tel = LibIDT.idtSetBytes(idt_tel,22,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,23,1,string.char(0x00))
	idt_tel = LibIDT.idtSetBytes(idt_tel,24,1,string.char(0x01))        
else
end


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

