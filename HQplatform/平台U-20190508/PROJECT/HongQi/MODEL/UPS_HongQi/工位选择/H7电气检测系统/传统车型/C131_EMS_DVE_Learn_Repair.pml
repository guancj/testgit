<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1202" pbltext="DEP1243">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E8" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="329" right="429" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="328" top="991" right="428" bottom="1023"/>
<Script>#STOPCOMM</Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="328" top="151" right="428" bottom="183"/>
<Line1Text Enable="1" Text="连接ECU"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="DVE自学习条件检测">
<Rect left="327" top="47" right="427" bottom="79"/>
<TitleText Enable="1" Text="DVE自学习条件检测"/>
<Script></Script></Activity>
<Activity id="124" ActivityType="3" flags="0" name="切诊断">
<Rect left="328" top="256" right="428" bottom="288"/>
<Script>#COMM 0x10 0x03

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3004" name="DEP1098" type="8" flags="97"/>
</Activity>
<Activity id="132" ActivityType="3" flags="0" name="清空所有行显示">
<Rect left="328" top="933" right="428" bottom="965"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="195" ActivityType="3" flags="0" name="通讯">
<Rect left="328" top="199" right="428" bottom="231"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="3000" name="DEP143" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="3" flags="0" name="通讯失败">
<Rect left="202" top="202" right="302" bottom="234"/>
<Line1Text Enable="1" Text="EMS 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="197" ActivityType="4" flags="0" name="路由节点">
<Rect left="235" top="933" right="267" bottom="965"/>
</Activity>
<Activity id="198" ActivityType="3" flags="0" name="结束通讯">
<Rect left="202" top="152" right="302" bottom="184"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="233" ActivityType="3" flags="0" name="普通节点">
<Rect left="2703" top="2203" right="2803" bottom="2235"/>
<Script></Script></Activity>
<Activity id="243" ActivityType="3" flags="0" name="等待30秒">
<Rect left="327" top="99" right="427" bottom="131"/>
<Line1Text Enable="1" Text="保持上电状态，自学习30秒"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=30,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="257" ActivityType="3" flags="0" name="读DTC">
<Rect left="328" top="417" right="428" bottom="449"/>
<Line1Text Enable="1" Text="读取DTC"/>
<Script>#COMM 0x19 0x02 0x0c
dtc_size=@@;
dtc=hexstr(@3-@dtc_size);
--engine.StatValue=dtc

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="113" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="259" ActivityType="13" flags="0" name="DtcExtract">
<Rect left="328" top="579" right="428" bottom="611"/>
<FunctionRef id="Dtc_Extract">
<Parameters>
<Parameter id="DTC" value="dtc"/>
<Parameter id="ECU_SECTION" value="&quot;C131_EMS&quot;"/>
</Parameters>
</FunctionRef>
<assessment no="49" name="DEP145" type="8" flags="97"/>
</Activity>
<Activity id="262" ActivityType="13" flags="0" name="DtcFilter">
<Rect left="328" top="473" right="428" bottom="505"/>
<FunctionRef id="Dtc_Filter">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_MASK"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="265" ActivityType="3" flags="0" name="非大陆故障码">
<Rect left="328" top="527" right="428" bottom="559"/>
<Script></Script></Activity>
<Activity id="266" ActivityType="4" flags="0" name="路由节点">
<Rect left="361" top="638" right="393" bottom="670"/>
</Activity>
<Activity id="267" ActivityType="3" flags="0" name="清DTC">
<Rect left="328" top="308" right="428" bottom="340"/>
<Line1Text Enable="1" Text="EMS清故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
</Script><assessment no="150" name="DEP144" type="8" flags="97"/>
</Activity>
<Activity id="268" ActivityType="3" flags="0" name="延时300MS">
<Rect left="329" top="362" right="429" bottom="394"/>
<Script>#DELAY  300</Script></Activity>
<Activity id="277" ActivityType="5" flags="0" name="C131_EMS_DVE_Learn">
<Rect left="687" top="803" right="787" bottom="835"/>
<SubProcesses>
<SubProcess id="C131_EMS_DVE_Learn">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="278" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="327" top="687" right="427" bottom="719"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1565-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="279" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="328" top="744" right="428" bottom="776"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1579-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="280" ActivityType="13" flags="0" name="Dtc_Find">
<Rect left="329" top="804" right="429" bottom="836"/>
<FunctionRef id="Dtc_Find">
<Parameters>
<Parameter id="DTC_INPUT" value="dtc"/>
<Parameter id="KEY_FIND" value="&quot;P1564-00&quot;"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="282" ActivityType="4" flags="0" name="路由节点">
<Rect left="496" top="686" right="528" bottom="718"/>
</Activity>
<Activity id="283" ActivityType="4" flags="0" name="路由节点">
<Rect left="496" top="743" right="528" bottom="775"/>
</Activity>
<Activity id="284" ActivityType="4" flags="0" name="路由节点">
<Rect left="496" top="803" right="528" bottom="835"/>
</Activity>
<Activity id="285" ActivityType="3" flags="0" name="自学习失败">
<Rect left="563" top="803" right="663" bottom="835"/>
<Line1Text Enable="1" Text="电子节气门自学习失败"/>
<Script>#DELAY 1000</Script><assessment no="50" name="DEP1241" type="8" flags="97"/>
</Activity>
<Activity id="286" ActivityType="3" flags="0" name="自学习成功">
<Rect left="328" top="854" right="428" bottom="886"/>
<Line1Text Enable="1" Text="电子节气门自学习成功"/>
<Script>#DELAY 1000</Script><assessment no="51" name="DEP1242" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="195" type="0">
</Transition>
<Transition StartId="4" EndId="243" type="0">
</Transition>
<Transition StartId="124" EndId="267" type="0">
</Transition>
<Transition StartId="132" EndId="2" type="0">
</Transition>
<Transition StartId="195" EndId="124" type="3">
</Transition>
<Transition StartId="195" EndId="196" type="4">
</Transition>
<Transition StartId="196" EndId="198" type="0">
</Transition>
<Transition StartId="196" EndId="197" type="5">
</Transition>
<Transition StartId="197" EndId="132" type="0">
</Transition>
<Transition StartId="198" EndId="3" type="0">
</Transition>
<Transition StartId="243" EndId="3" type="0">
</Transition>
<Transition StartId="257" EndId="262" type="0">
</Transition>
<Transition StartId="259" EndId="266" type="0">
</Transition>
<Transition StartId="262" EndId="265" type="0">
</Transition>
<Transition StartId="265" EndId="259" type="0">
</Transition>
<Transition StartId="266" EndId="278" type="0">
</Transition>
<Transition StartId="267" EndId="268" type="0">
</Transition>
<Transition StartId="268" EndId="257" type="0">
</Transition>
<Transition StartId="277" EndId="132" type="0">
</Transition>
<Transition StartId="278" EndId="279" type="0">
</Transition>
<Transition StartId="278" EndId="282" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="279" EndId="280" type="0">
</Transition>
<Transition StartId="279" EndId="283" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="280" EndId="284" type="1">
<Expression>FindErr==1</Expression></Transition>
<Transition StartId="280" EndId="286" type="0">
</Transition>
<Transition StartId="282" EndId="285" type="0">
</Transition>
<Transition StartId="283" EndId="285" type="0">
</Transition>
<Transition StartId="284" EndId="285" type="0">
</Transition>
<Transition StartId="285" EndId="277" type="0">
</Transition>
<Transition StartId="286" EndId="132" type="0">
</Transition>
</Transitions>
</Process>

