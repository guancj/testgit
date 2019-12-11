<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="SWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
<Variable id="SWE_CarID" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="382" top="80" right="482" bottom="112"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="380" top="484" right="480" bottom="516"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="54" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="382" top="136" right="482" bottom="168"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="55" ActivityType="3" flags="0" name="结果判断">
<Rect left="380" top="414" right="480" bottom="446"/>
<Script>isOK = true;
engine.LastError = 0
engine.StatValue = "SWE 22 Service"
engine.println(" &lt;SWE_22_VehicleID&gt; ")
</Script><assessment no="11" name="DEP1297" type="8" flags="97"/>
</Activity>
<Activity id="60" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="550" top="134" right="650" bottom="166"/>
<Script>ret = false
engine.println(" &lt;SWE_22_VehicleID&gt; : handle invalid --&gt;")</Script></Activity>
<Activity id="63" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="380" top="194" right="480" bottom="226"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00010110@5==0b00000010&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String" value="engine.VIN"/>
<Parameter id="StringStartPos" value="21"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="64" ActivityType="13" flags="0" name="SWE_22_VehicleID">
<Rect left="380" top="344" right="480" bottom="376"/>
<Line2Text Enable="1" Text="大灯发送车型"/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="5"/>
<Parameter id="pHndl" value="SWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="65" ActivityType="3" flags="0" name="NOK">
<Rect left="550" top="344" right="650" bottom="376"/>
<Script>isOK = false;
engine.LastError = 1
engine.StatValue = "SWE 发送车型ID失败"
engine.SetLineText(1,"SWE SERVICE 22 ERROR")
engine.DialogBackColor = "red";
engine.Delay(2000)
engine.DialogBackColor = -1;

engine.println(" &lt;SWE_22_VehicleID_Err&gt; @Dpin ")</Script><assessment no="11" name="DEP1297" type="8" flags="97"/>
</Activity>
<Activity id="66" ActivityType="4" flags="0" name="路由节点">
<Rect left="584" top="484" right="616" bottom="516"/>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="车型设置">
<Rect left="380" top="264" right="480" bottom="296"/>
<Script>print("SWE_CarID:"..SWE_CarID)
idt_tel = LibIDT.idtSetBytes(idt_tel,8,1,SWE_CarID)
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="54" type="0">
</Transition>
<Transition StartId="54" EndId="60" type="0">
</Transition>
<Transition StartId="54" EndId="63" type="1">
<Expression>SWEHndl~=nil and SWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="55" EndId="2" type="0">
</Transition>
<Transition StartId="60" EndId="65" type="0">
</Transition>
<Transition StartId="63" EndId="67" type="0">
</Transition>
<Transition StartId="64" EndId="55" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="64" EndId="65" type="0">
</Transition>
<Transition StartId="65" EndId="66" type="0">
</Transition>
<Transition StartId="66" EndId="2" type="0">
</Transition>
<Transition StartId="67" EndId="64" type="0">
</Transition>
</Transitions>
</Process>

