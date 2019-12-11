<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1500" pbltext="DEP1284">
<Parameters>
<Variable id="FWEHndl" type="3" dir="0" data="0"/>
<Variable id="isOK" type="11" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="480" top="24" right="580" bottom="56"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="480" top="364" right="580" bottom="396"/>
<Script></Script><Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="判断通讯句柄">
<Rect left="480" top="94" right="580" bottom="126"/>
<Script>engine.DialogBackColor = -1;</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="idtCommonSend">
<Rect left="480" top="164" right="580" bottom="196"/>
<FunctionRef id="idtCommonSend" model="LibIDT">
<Parameters>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="BitOrByte" value="&quot;@2==0b00000101&quot;"/>
<Parameter id="Byte"/>
<Parameter id="String"/>
<Parameter id="StringStartPos"/>
<Parameter id="idt_tel" ret="idt_tel"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="56" ActivityType="13" flags="0" name="FWE_05_Basic">
<Rect left="480" top="224" right="580" bottom="256"/>
<Line2Text Enable="1" Text="回基本位"/>
<Line3Text Enable="1" Text="将方向盘水平仪放置原位..."/>
<FunctionRef id="idtDataExchange" model="LibIDT">
<Parameters>
<Parameter id="request" value="idt_tel"/>
<Parameter id="timeout" value="500"/>
<Parameter id="pHndl" value="FWEHndl"/>
<Parameter id="sendMode" value="0"/>
<Parameter id="ret" ret="ret"/>
<Parameter id="revTel" ret="recvData"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="58" ActivityType="3" flags="0" name="Handle invalid">
<Rect left="700" top="94" right="800" bottom="126"/>
<Script>engine.println(" &lt;FAS_52_TestReadiness&gt; : handle invalid --&gt;"..tostring(FWEHndl))</Script></Activity>
<Activity id="59" ActivityType="3" flags="0" name="NOK">
<Rect left="700" top="224" right="800" bottom="256"/>
<Line2Text Enable="1" Text="FWE SERVICE 05 ERROR"/>
<Script>isOK = false;
engine.DialogBackColor = "red";</Script><assessment no="125" name="DEP1573" type="8" flags="97"/>
</Activity>
<Activity id="63" ActivityType="3" flags="0" name="OK">
<Rect left="480" top="294" right="580" bottom="326"/>
<Script>isOK = true;

engine.println(" &lt;FWE_05&gt; ")</Script><assessment no="125" name="DEP1573" type="8" flags="97"/>
</Activity>
<Activity id="64" ActivityType="4" flags="0" name="路由节点">
<Rect left="734" top="364" right="766" bottom="396"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="1">
<Expression>FWEHndl~=nil and FWEHndl&gt;= 0</Expression></Transition>
<Transition StartId="3" EndId="58" type="0">
</Transition>
<Transition StartId="4" EndId="56" type="0">
</Transition>
<Transition StartId="56" EndId="63" type="1">
<Expression>ret == true</Expression></Transition>
<Transition StartId="56" EndId="59" type="0">
</Transition>
<Transition StartId="58" EndId="59" type="0">
</Transition>
<Transition StartId="59" EndId="64" type="0">
</Transition>
<Transition StartId="63" EndId="2" type="0">
</Transition>
<Transition StartId="64" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

