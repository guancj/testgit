<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3011" pbltext="DEP1663">
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
<Variable id="CAN_SND_ID" type="3" data="0x7A3" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x7AB" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="350" top="34" right="450" bottom="66"/>
<Script></Script><TitleText Enable="1" Text="空气悬架最终完成"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="350" top="1524" right="450" bottom="1556"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="350" top="174" right="450" bottom="206"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="350" top="294" right="450" bottom="326"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="安全访问"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xA8DC7AED"/>
</Parameters>
</FunctionRef>
<assessment no="43" name="DEP1860" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="扩展会话">
<Rect left="350" top="234" right="450" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="42" name="DEP1666" type="8" flags="97"/>
</Activity>
<Activity id="71" ActivityType="3" flags="0" name="Init_Damping_Valve_Check">
<Rect left="270" top="494" right="370" bottom="526"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="Damping Valve 检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x69\x64\x64\x64\x64")</Script></Activity>
<Activity id="72" ActivityType="3" flags="0" name="Start Damping Valve Check">
<Rect left="780" top="524" right="880" bottom="556"/>
<Script>request = "\x03\xDF\x69"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5))


</Script></Activity>
<Activity id="73" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="780" top="594" right="880" bottom="626"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_3"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="60"/>
<Parameter id="FinishFlag" ret="FinishFlag_3"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="74" ActivityType="3" flags="0" name="初始化变量">
<Rect left="260" top="554" right="360" bottom="586"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="空气悬架电流检测"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_3=nil</Script></Activity>
<Activity id="75" ActivityType="3" flags="1" name="延时50ms">
<Rect left="660" top="554" right="760" bottom="586"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="78" ActivityType="3" flags="0" name="越野模式控制">
<Rect left="350" top="764" right="450" bottom="796"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换越野模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x67\x06")
engine.Delay(200)</Script><assessment no="49" name="DEP2090" type="8" flags="97"/>
</Activity>
<Activity id="79" ActivityType="3" flags="0" name="Start Leveling Mode Control">
<Rect left="350" top="944" right="450" bottom="976"/>
<Script>request = "\x03\xDF\x67"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script></Activity>
<Activity id="80" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="350" top="1014" right="450" bottom="1046"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_4"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="180"/>
<Parameter id="FinishFlag" ret="FinishFlag_4"/>
<Parameter id="PramOut" ret="Pram_4"/>
</Parameters>
</FunctionRef>
<assessment no="51" name="DEP2091" type="8" flags="97"/>
</Activity>
<Activity id="81" ActivityType="3" flags="0" name="初始化变量">
<Rect left="350" top="864" right="450" bottom="896"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="越野模式结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_4=nil</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="延时50ms">
<Rect left="210" top="1014" right="310" bottom="1046"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="83" ActivityType="3" flags="0" name="正常模式控制">
<Rect left="350" top="1084" right="450" bottom="1116"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="切换正常模式"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x67\x05")</Script><assessment no="52" name="DEP2092" type="8" flags="97"/>
</Activity>
<Activity id="84" ActivityType="3" flags="0" name="Start Leveling Mode Control2">
<Rect left="350" top="1194" right="450" bottom="1226"/>
<Script>
request = "\x03\xDF\x67"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5))

</Script></Activity>
<Activity id="85" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="350" top="1254" right="450" bottom="1286"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_5"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="180"/>
<Parameter id="FinishFlag" ret="FinishFlag_5"/>
<Parameter id="PramOut" ret="Pram_5"/>
</Parameters>
</FunctionRef>
<assessment no="53" name="DEP2093" type="8" flags="97"/>
</Activity>
<Activity id="86" ActivityType="3" flags="0" name="初始化">
<Rect left="350" top="1144" right="450" bottom="1176"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="正常模式结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>Pram_5=nil</Script></Activity>
<Activity id="87" ActivityType="3" flags="0" name="延时50ms">
<Rect left="210" top="1254" right="310" bottom="1286"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="95" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="1464" right="566" bottom="1496"/>
</Activity>
<Activity id="96" ActivityType="3" flags="0" name="开始服务模式激活">
<Rect left="350" top="354" right="450" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="模式激活"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x60\x01")</Script><assessment no="47" name="DEP1914" type="8" flags="97"/>
</Activity>
<Activity id="97" ActivityType="3" flags="0" name="获取激活状态">
<Rect left="350" top="414" right="450" bottom="446"/>
<Strategy TotalTime="20" NokTime="0" RetryTimeOut="20" DelayTime="20"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="获取激活结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel =LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x03\xDF\x60")

if (engine.LastError == 0) then
	if (recvTel:byte(5,5) ~= 0) then
		engine.LastError = 1
        end
end</Script><assessment no="48" name="DEP1915" type="8" flags="97"/>
</Activity>
<Activity id="101" ActivityType="3" flags="0" name="清除故障码">
<Rect left="210" top="294" right="310" bottom="326"/>
<Line2Text Enable="1" Text="清除故障码"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x14,0x54,"\xFF\xFF\xFF")</Script></Activity>
<Activity id="102" ActivityType="3" flags="0" name="延时500ms">
<Rect left="350" top="1404" right="450" bottom="1436"/>
<Script>engine.Delay(500)</Script></Activity>
<Activity id="103" ActivityType="3" flags="0" name="请启动发动机">
<Rect left="210" top="104" right="310" bottom="136"/>
<Line1Text Enable="1" Text="请启动发动机"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="104" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="350" top="1464" right="450" bottom="1496"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="106" ActivityType="4" flags="0" name="路由节点">
<Rect left="534" top="294" right="566" bottom="326"/>
</Activity>
<Activity id="766" ActivityType="3" flags="0" name="Start Damping Valve Check">
<Rect left="260" top="644" right="360" bottom="676"/>
<Strategy TotalTime="10" NokTime="0" RetryTimeOut="5" DelayTime="500"/>
<Script>--init
UpperLimit = 105;
LowerLimit = 95;
request = "\x03\xDF\x69"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
if(@0 == 0x71)then
resu5 = @4;--0x01
resu6 = string.byte(recvTel:sub(6,6)) ;
resu7 = string.byte(recvTel:sub(7,7)) ;
resu8 = string.byte(recvTel:sub(8,8)) ;
resu9 = string.byte(recvTel:sub(9,9)) ;
engine.println("空气悬架判断电流值");
engine.println("resu5="..resu5..",resu6="..resu6..",resu7="..resu7..",resu8="..resu8..",resu9="..resu9);

if(resu5 == 0x01)then
	if(LowerLimit &lt;= resu6 and resu6 &lt;= UpperLimit) then
		if(LowerLimit &lt;= resu7 and resu7 &lt;= UpperLimit) then
			if(LowerLimit &lt;= resu8 and resu8 &lt;= UpperLimit) then
				if(LowerLimit &lt;= resu9 and resu9 &lt;= UpperLimit) then
					engine.LastError = 0;
                                         resu6 = resu6 * 10;
                                         resu7 = resu7 * 10;
                                         resu8 = resu8 * 10;
                                         resu9 = resu9 * 10;
                                        engine.SetLineText(2,"状态"..resu5..",FL电流："..resu6.."mA,FR电流："..resu7.."mA,RL电流"..resu8.."mA,RR电流"..resu9.."mA");
                                        engine.Delay(500);
                                        engine.StatValue="获取电流值，".."FL："..resu6.."mA,FR："..resu7.."mA,RL"..resu8.."mA,RR"..resu9.."mA";
                                       -- local StringRes;    
					--StringRes = engine.GetResponseString(0,engine.GetResponseSize());
					--engine.StatValue=hexstr(StringRes);
                		else
					engine.LastError = 1;
                                        engine.println("判断字节9失败");
				end
			else
				engine.LastError = 1;
                                engine.println("判断字节8失败");
			end
		else
			engine.LastError = 1;
                        engine.println("判断字节7失败");
		end
        else
		engine.LastError = 1;
                engine.println("判断字节6失败");
	end
else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end

else
	engine.LastError = 1;
	engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
end
engine.Delay(200)</Script></Activity>
<Activity id="767" ActivityType="3" flags="0" name="越野模式高度值">
<Rect left="480" top="1014" right="580" bottom="1046"/>
<Script>resu5 = @4;--0x01
resu6 = string.byte(recvTel:sub(6,6)) ;
resu7 = string.byte(recvTel:sub(7,7)) ;
resu8 = string.byte(recvTel:sub(8,8)) ;
resu9 = string.byte(recvTel:sub(9,9)) ;
engine.println("越野模式高度值");
resu6 = resu6 - 127;
resu7 = resu7 - 127;
resu8 = resu8 - 127;
resu9 = resu9 - 127;
engine.println("resu5="..resu5..",resu6="..resu6..",resu7="..resu7..",resu8="..resu8..",resu9="..resu9);
engine.SetLineText(2,"状态"..resu5..",FL高度："..resu6.."mm,FR高度："..resu7.."mm,RL高度"..resu8.."mm,RR高度"..resu9.."mm");
engine.StatValue="获取高度值，".."FL："..resu6.."mm,FR："..resu7.."mm,RL"..resu8.."mm,RR"..resu9.."mm";
engine.Delay(500)</Script><assessment no="100" name="DEP2484" type="8" flags="97"/>
</Activity>
<Activity id="768" ActivityType="3" flags="0" name="正常模式高度值">
<Rect left="350" top="1324" right="450" bottom="1356"/>
<Script>resu5 = @4;--0x01
resu6 = string.byte(recvTel:sub(6,6)) ;
resu7 = string.byte(recvTel:sub(7,7)) ;
resu8 = string.byte(recvTel:sub(8,8)) ;
resu9 = string.byte(recvTel:sub(9,9)) ;
engine.println("正常模式高度值");
resu6 = resu6 - 127;
resu7 = resu7 - 127;
resu8 = resu8 - 127;
resu9 = resu9 - 127;
engine.println("resu5="..resu5..",resu6="..resu6..",resu7="..resu7..",resu8="..resu8..",resu9="..resu9);
engine.SetLineText(2,"状态"..resu5..",FL高度："..resu6.."mm,FR高度："..resu7.."mm,RL高度"..resu8.."mm,RR高度"..resu9.."mm");
engine.StatValue="获取正常模式高度值，".."FL："..resu6.."mm,FR："..resu7.."mm,RL"..resu8.."mm,RR"..resu9.."mm";
engine.Delay(500)</Script><assessment no="101" name="DEP2485" type="8" flags="97"/>
</Activity>
<Activity id="769" ActivityType="3" flags="0" name="电流检测结束">
<Rect left="260" top="694" right="360" bottom="726"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x02\xDF\x69")

if(@0 == 0x71)then
resu6 = string.byte(recvTel:sub(6,6)) ;
resu7 = string.byte(recvTel:sub(7,7)) ;
resu8 = string.byte(recvTel:sub(8,8)) ;
resu9 = string.byte(recvTel:sub(9,9)) ;
resu6 = resu6 * 10;
resu7 = resu7 * 10;
resu8 = resu8 * 10;
resu9 = resu9 * 10;
engine.Delay(500);
engine.println("resu5="..resu5..",resu6="..resu6..",resu7="..resu7..",resu8="..resu8..",resu9="..resu9);
engine.StatValue="获取的电流值，".."FL："..resu6.."mA,FR："..resu7.."mA,RL"..resu8.."mA,RR"..resu9.."mA";
else
        engine.LastError = 1;
        local StringRes;
       StringRes = engine.GetResponseString(0,engine.GetResponseSize());
       engine.StatValue=hexstr(StringRes);
end</Script><assessment no="54" name="DEP2371" type="8" flags="97"/>
</Activity>
<Activity id="770" ActivityType="3" flags="0" name="激活结束">
<Rect left="790" top="414" right="890" bottom="446"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x02\xDF\x60")
engine.Delay(200)</Script><assessment no="63" name="DEP2372" type="8" flags="97"/>
</Activity>
<Activity id="772" ActivityType="3" flags="0" name="越野模式结束">
<Rect left="470" top="1084" right="570" bottom="1116"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x02\xDF\x67")
engine.Delay(200)</Script><assessment no="64" name="DEP2373" type="8" flags="97"/>
</Activity>
<Activity id="774" ActivityType="3" flags="0" name="通讯失败">
<Rect left="580" top="234" right="680" bottom="266"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="775" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="580" top="174" right="680" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="776" ActivityType="4" flags="0" name="路由节点">
<Rect left="614" top="1464" right="646" bottom="1496"/>
</Activity>
<Activity id="777" ActivityType="3" flags="0" name="激活失败">
<Rect left="130" top="414" right="230" bottom="446"/>
<Line1Text Enable="1" Text="激活失败，是否重新激活？"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="放弃激活"/>
<ButtonRText Enable="1" Text="重新激活"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="778" ActivityType="4" flags="0" name="路由节点">
<Rect left="164" top="1464" right="196" bottom="1496"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="101" type="3">
</Transition>
<Transition StartId="4" EndId="106" type="0">
</Transition>
<Transition StartId="5" EndId="4" type="0">
</Transition>
<Transition StartId="5" EndId="774" type="4">
</Transition>
<Transition StartId="71" EndId="74" type="0">
</Transition>
<Transition StartId="72" EndId="73" type="0">
</Transition>
<Transition StartId="73" EndId="75" type="1">
<Expression>FinishFlag_3 == false</Expression></Transition>
<Transition StartId="74" EndId="766" type="0">
</Transition>
<Transition StartId="75" EndId="72" type="0">
</Transition>
<Transition StartId="78" EndId="81" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="0">
</Transition>
<Transition StartId="80" EndId="82" type="1">
<Expression>FinishFlag_4 == false</Expression></Transition>
<Transition StartId="80" EndId="767" type="0">
</Transition>
<Transition StartId="81" EndId="79" type="0">
</Transition>
<Transition StartId="82" EndId="79" type="0">
</Transition>
<Transition StartId="83" EndId="86" type="0">
</Transition>
<Transition StartId="84" EndId="85" type="0">
</Transition>
<Transition StartId="85" EndId="87" type="1">
<Expression>FinishFlag_5 == false</Expression></Transition>
<Transition StartId="85" EndId="768" type="0">
</Transition>
<Transition StartId="86" EndId="84" type="0">
</Transition>
<Transition StartId="87" EndId="84" type="0">
</Transition>
<Transition StartId="95" EndId="104" type="0">
</Transition>
<Transition StartId="96" EndId="97" type="0">
</Transition>
<Transition StartId="97" EndId="78" type="3">
</Transition>
<Transition StartId="97" EndId="777" type="4">
</Transition>
<Transition StartId="101" EndId="96" type="0">
</Transition>
<Transition StartId="102" EndId="104" type="0">
</Transition>
<Transition StartId="103" EndId="3" type="0">
</Transition>
<Transition StartId="104" EndId="2" type="0">
</Transition>
<Transition StartId="106" EndId="95" type="0">
</Transition>
<Transition StartId="766" EndId="769" type="0">
</Transition>
<Transition StartId="767" EndId="83" type="0">
</Transition>
<Transition StartId="768" EndId="102" type="0">
</Transition>
<Transition StartId="769" EndId="78" type="0">
</Transition>
<Transition StartId="772" EndId="83" type="0">
</Transition>
<Transition StartId="774" EndId="775" type="0">
</Transition>
<Transition StartId="774" EndId="776" type="5">
</Transition>
<Transition StartId="775" EndId="3" type="0">
</Transition>
<Transition StartId="776" EndId="95" type="0">
</Transition>
<Transition StartId="777" EndId="96" type="6">
</Transition>
<Transition StartId="777" EndId="778" type="0">
</Transition>
<Transition StartId="778" EndId="104" type="0">
</Transition>
</Transitions>
</Process>

