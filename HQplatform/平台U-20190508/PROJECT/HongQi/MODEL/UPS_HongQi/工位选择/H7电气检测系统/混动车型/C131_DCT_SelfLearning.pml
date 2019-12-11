<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="1042" pbltext="DEP1225">
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
<Variable id="CAN_SND_ID" type="3" data="0x7E1" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7E9" description="CANId"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="285" right="385" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="475" top="718" right="575" bottom="750"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="连接ECU">
<Rect left="284" top="148" right="384" bottom="180"/>
<Strategy TotalTime="2" NokTime="2" RetryTimeOut="3" DelayTime="500"/>
<Line1Text Enable="1" Text="建立通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMINIT</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="切诊断">
<Rect left="286" top="278" right="386" bottom="310"/>
<Script>#COMM 0x10 0x03
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="2" name="DEP1027" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="安全访问种子">
<Rect left="285" top="342" right="385" bottom="374"/>
<Line1Text Enable="1" Text="安全访问"/>
<Script>#COMM 0x27 0x01
s0=@2
s1=@3
s2=@4
s3=@5
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="3" name="DEP194" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="13" flags="0" name="计算key">
<Rect left="286" top="403" right="386" bottom="435"/>
<FunctionRef id="sec_Generic">
<Parameters>
<Parameter id="s0" value="s0"/>
<Parameter id="s1" value="s1"/>
<Parameter id="s2" value="s2"/>
<Parameter id="s3" value="s3"/>
<Parameter id="mask" value="0xC2E0F1D3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="9" ActivityType="3" flags="0" name="发送key">
<Rect left="286" top="470" right="386" bottom="502"/>
<Strategy TotalTime="5" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x27 0x02 key0 key1 key2 key3
if (@1==0x02) then
  engine.LastError = 0;
else
  engine.LastError = 1;
end
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="4" name="DEP154" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="3" flags="0" name="离合器Kisspoint测试请求">
<Rect left="471" top="102" right="571" bottom="134"/>
<Line1Text Enable="1" Text="离合器Kisspoint测试请求"/>
<Script>#COMM 0x2f 0x02 0x0d 0x03 0x01
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="5" name="DEP1030" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="返回测试控制器权">
<Rect left="470" top="164" right="570" bottom="196"/>
<Line1Text Enable="1" Text="返回测试控制器权"/>
<Script>#COMM 0x2f 0x02 0x0d 0x00
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="6" name="DEP1031" type="8" flags="97"/>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="读取奇数离合器Kisspoint点">
<Rect left="471" top="231" right="571" bottom="263"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取奇数离合器Kisspoint点"/>
<Script>#COMM 0x22 0x01 0x80
if(@0==0x62)then
  oddValue = hexstr(@3-@4);
  oddValueCal = (@3*256+@4)*0.00064;
  print("读取奇数离合器Kisspoint点oddValueCal"..oddValueCal);
  if (oddValueCal&gt;=1.5 and oddValueCal&lt;=3.5) then
    engine.LastError = 0;
    engine.SetLineText(1,"奇数离合器kisspoint点");
    engine.SetLineText(2,oddValue);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"奇数离合器kisspoint点");
    engine.SetLineText(2,oddValueCal);  
  end
    engine.StatValue=oddValueCal;
    engine.StatLower=1.5;
    engine.StatUpper=3.5;
else
    engine.LastError = 1;
    engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="7" name="DEP1032" type="8" flags="97"/>
</Activity>
<Activity id="13" ActivityType="3" flags="0" name="读取奇数离合器Kisspoint点">
<Rect left="472" top="341" right="572" bottom="373"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取奇数离合器Kisspoint点状态"/>
<Script>#COMM 0x22 0x01 0x82

if(@0==0x62)then
if (@3 == 0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"奇数离合器kisspoint点状态");
  engine.SetLineText(2,@3);
else
  engine.LastError = 1;
  engine.TestResult=1;
  engine.SetLineText(1,"奇数离合器kisspoint点状态");
  engine.SetLineText(2,@3);  
end
engine.StatValue=@3;
engine.StatPoint=0;
engine.println("奇数离合器kisspoint点状态".. @3);
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="8" name="DEP1033" type="8" flags="97"/>
</Activity>
<Activity id="14" ActivityType="3" flags="0" name="异常退出，停止检查">
<Rect left="923" top="403" right="1023" bottom="435"/>
<Line1Text Enable="1" Text="学习失败，请检测电机及其控制器"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>  engine.LastError = 1;
  engine.TestResult=1;
#DELAY 3000</Script><assessment no="12" name="DEP1038" type="8" flags="97"/>
</Activity>
<Activity id="15" ActivityType="3" flags="0" name="读取偶数离合器Kisspoint点">
<Rect left="473" top="405" right="573" bottom="437"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="10"/>
<Line1Text Enable="1" Text="读取偶数离合器Kisspoint点"/>
<Script>#COMM 0x22 0x01 0x81
if(@0==0x62)then
  evenValue = hexstr(@3-@4);
  evenValueCal = (@3*256+@4)*0.00064;
  print("读取偶数离合器Kisspoint点evenValueCal"..evenValueCal);
  if (evenValueCal&gt;=1.5 and evenValueCal&lt;=3.5) then
    engine.LastError = 0;
    engine.SetLineText(1,"偶数离合器kisspoint点");
    engine.SetLineText(2,evenValueCal);
  else
    engine.LastError = 1;
    engine.TestResult=1;
    engine.SetLineText(1,"偶数离合器kisspoint点");
    engine.SetLineText(2,evenValueCal); 
  end
    engine.StatValue=evenValueCal;
    engine.StatLower=1.5;
    engine.StatUpper=3.5; 
else
    engine.LastError = 1;
    engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="9" name="DEP1034" type="8" flags="97"/>
</Activity>
<Activity id="16" ActivityType="3" flags="0" name="读取偶数离合器Kisspoint点状态">
<Rect left="474" top="516" right="574" bottom="548"/>
<Line1Text Enable="1" Text="读取偶数离合器Kisspoint点状态"/>
<Script>#COMM 0x22 0x01 0x83

if(@0==0x62)then
if (@3 == 0x00) then
  engine.LastError = 0;
  engine.SetLineText(1,"偶数离合器kisspoint点状态");
  engine.SetLineText(2,@3);
else
  engine.LastError = 1;
  engine.TestResult=1;
  engine.SetLineText(1,"偶数离合器kisspoint点状态");
  engine.SetLineText(2,@3);  
end
engine.StatValue=@3;
engine.StatPoint=0;
else
  engine.LastError = 1;
  engine.TestResult=1;
local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);
end</Script><assessment no="10" name="DEP1035" type="8" flags="97"/>
</Activity>
<Activity id="17" ActivityType="3" flags="0" name="清除结束">
<Rect left="475" top="653" right="575" bottom="685"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#STOPCOMM</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="双离合变速器（DCT）">
<Rect left="285" top="86" right="385" bottom="118"/>
<TitleText Enable="1" Text="双离合变速器（DCT）"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="通讯失败">
<Rect left="152" top="212" right="252" bottom="244"/>
<Line1Text Enable="1" Text="DCT 控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="结束通讯">
<Rect left="153" top="149" right="253" bottom="181"/>
<Script>#STOPCOMM
</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="通讯">
<Rect left="285" top="211" right="385" bottom="243"/>
<Script>#COMM 0x22 0xf1 0x87

if(@0 == 0x62)then
     engine.LastError = 0;
else
     engine.LastError = 1;
end
</Script><assessment no="1" name="DEP151" type="8" flags="97"/>
</Activity>
<Activity id="22" ActivityType="3" flags="0" name="普通节点">
<Rect top="723" right="100" bottom="755"/>
<Script></Script></Activity>
<Activity id="23" ActivityType="4" flags="0" name="路由节点">
<Rect left="187" top="653" right="219" bottom="685"/>
</Activity>
<Activity id="25" ActivityType="3" flags="0" name="自学习成功">
<Rect left="475" top="605" right="575" bottom="637"/>
<Line1Text Enable="1" Text="双离合器半接合点学习成功"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY 2000</Script><assessment no="11" name="DEP1037" type="8" flags="97"/>
</Activity>
<Activity id="27" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="595" top="342" right="695" bottom="374"/>
<Line2Text Enable="1" Text="奇数离合器kisspoint点状态不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="28" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="599" top="516" right="699" bottom="548"/>
<Line2Text Enable="1" Text="偶数离合器kisspoint点状态不正常，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="29" ActivityType="3" flags="0" name="不正常，退出">
<Rect left="598" top="404" right="698" bottom="436"/>
<Line2Text Enable="1" Text="偶数离合器kisspoint点不正确，退出"/>
<Script>#DELAY 2000</Script></Activity>
<Activity id="31" ActivityType="3" flags="0" name="存储奇数离合器Kisspoint点">
<Rect left="471" top="290" right="571" bottom="322"/>
<Script>engine.LastError = 0;
engine.StatValue=oddValue;</Script><assessment no="14" name="DEP1056" type="8" flags="97"/>
</Activity>
<Activity id="32" ActivityType="3" flags="0" name="存储偶数离合器Kisspoint点">
<Rect left="474" top="460" right="574" bottom="492"/>
<Script>engine.LastError = 0;
engine.StatValue=evenValue;</Script><assessment no="15" name="DEP1057" type="8" flags="97"/>
</Activity>
<Activity id="33" ActivityType="3" flags="0" name="写入奇数偶数离合器Kisspoint点">
<Rect left="474" top="562" right="574" bottom="594"/>
<Line1Text Enable="1" Text="写入奇数偶数离合器Kisspoint点"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.println("奇数离合点"..oddValue.."偶数离合点"..evenValue);
#COMM 0x2E 0x01 0x0b hex2bin(oddValue) hex2bin(evenValue)

local StringRes;
StringRes = engine.GetResponseString(0,engine.GetResponseSize());
engine.StatValue=hexstr(StringRes);</Script><assessment no="16" name="DEP1058" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="18" type="0">
</Transition>
<Transition StartId="3" EndId="21" type="0">
</Transition>
<Transition StartId="4" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="9" type="0">
</Transition>
<Transition StartId="9" EndId="10" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="12" type="0">
</Transition>
<Transition StartId="12" EndId="31" type="3">
</Transition>
<Transition StartId="13" EndId="27" type="4">
</Transition>
<Transition StartId="13" EndId="15" type="3">
</Transition>
<Transition StartId="14" EndId="17" type="0">
</Transition>
<Transition StartId="15" EndId="32" type="3">
</Transition>
<Transition StartId="15" EndId="29" type="4">
</Transition>
<Transition StartId="16" EndId="28" type="4">
</Transition>
<Transition StartId="16" EndId="33" type="3">
</Transition>
<Transition StartId="17" EndId="2" type="0">
</Transition>
<Transition StartId="18" EndId="3" type="0">
</Transition>
<Transition StartId="19" EndId="20" type="0">
</Transition>
<Transition StartId="19" EndId="23" type="5">
</Transition>
<Transition StartId="20" EndId="3" type="0">
</Transition>
<Transition StartId="21" EndId="4" type="3">
</Transition>
<Transition StartId="21" EndId="19" type="4">
</Transition>
<Transition StartId="23" EndId="17" type="0">
</Transition>
<Transition StartId="25" EndId="17" type="0">
</Transition>
<Transition StartId="27" EndId="14" type="0">
</Transition>
<Transition StartId="28" EndId="14" type="0">
</Transition>
<Transition StartId="29" EndId="14" type="0">
</Transition>
<Transition StartId="31" EndId="13" type="0">
</Transition>
<Transition StartId="32" EndId="16" type="0">
</Transition>
<Transition StartId="33" EndId="25" type="0">
</Transition>
</Transitions>
</Process>

