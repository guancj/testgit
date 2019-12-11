<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3011" pbltext="DEP1663">
<Parameters>
<Variable id="DString_Partnumber" type="8" dir="0" data=""/>
<Variable id="DString_VariCoding" type="8" dir="0" data=""/>
<Variable id="DString_Write_VIN" type="8" dir="0" data=""/>
</Parameters>
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
<Rect left="300" top="64" right="400" bottom="96"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="870" top="1744" right="970" bottom="1776"/>
<Script>if( vciHandle == nil or vciHandle &lt; 0) then 

	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 

else

	engine.EcuClose(vciHandle) ;
	--[[if(engine.LastError ~= 0) then
	engine.StatValue = "ECU Close fail ";	
	end --]]

end</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="4" ActivityType="3" flags="0" name="空气悬架(AirS)">
<Rect left="300" top="124" right="400" bottom="156"/>
<TitleText Enable="1" Text="空气悬架(AirS)"/>
<Script></Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="Pressure Measurement Start FL">
<Rect left="300" top="704" right="400" bottom="736"/>
<Line1Text Enable="1" Text="压力测量-前左"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x08")
</Script><assessment no="95" name="DEP2345" type="8" flags="97"/>
</Activity>
<Activity id="119" ActivityType="3" flags="0" name="获取前左压力结果">
<Rect left="300" top="764" right="400" bottom="796"/>
<Line2Text Enable="1" Text="获取前左压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>MeasInt1 = 0;
MeasInt2 = 0;
request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
if(@0 == 0x71)then
	MeasInt1 = string.byte(recvTel:sub(5,5)); 
	MeasInt2 = string.byte(recvTel:sub(6,6)); 
else
	engine.LastError = 1;
end</Script><assessment no="71" name="DEP2346" type="8" flags="97"/>
</Activity>
<Activity id="120" ActivityType="13" flags="0" name="清DTC">
<Rect left="300" top="494" right="400" bottom="526"/>
<Line2Text Enable="1" Text="切换诊断模式"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="46" name="DEP1665" type="8" flags="97"/>
</Activity>
<Activity id="124" ActivityType="3" flags="0" name="Pressure Measurement Start FR">
<Rect left="300" top="864" right="400" bottom="896"/>
<Line1Text Enable="1" Text="压力测量-前右"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x04")

if(@0 == 0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="通讯失败";
end
</Script><assessment no="72" name="DEP2347" type="8" flags="97"/>
</Activity>
<Activity id="125" ActivityType="3" flags="0" name="获取前右压力结果">
<Rect left="300" top="914" right="400" bottom="946"/>
<Line2Text Enable="1" Text="获取前右压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script><assessment no="73" name="DEP2348" type="8" flags="97"/>
</Activity>
<Activity id="126" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="814" right="400" bottom="846"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="137" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="974" right="400" bottom="1006"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="74" name="DEP2349" type="8" flags="97"/>
</Activity>
<Activity id="140" ActivityType="3" flags="0" name="延时50ms">
<Rect left="450" top="944" right="550" bottom="976"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="144" ActivityType="3" flags="0" name="延时50ms">
<Rect left="440" top="784" right="540" bottom="816"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="149" ActivityType="13" flags="0" name="ReadDTCInformation">
<Rect left="300" top="364" right="400" bottom="396"/>
<Line2Text Enable="1" Text="读故障码"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0x09"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="44" name="DEP1848" type="8" flags="97"/>
</Activity>
<Activity id="150" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="300" top="444" right="400" bottom="476"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_AirS&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="50" name="DEP2066" type="8" flags="97"/>
</Activity>
<Activity id="152" ActivityType="3" flags="0" name="init">
<Rect left="300" top="644" right="400" bottom="676"/>
<Script>Pram_1 = nil;
Pram_2 = nil;
Pram_3 = nil;
Pram_4 = nil;
Pram_5 = nil;</Script></Activity>
<Activity id="178" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="300" top="174" right="400" bottom="206"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="179" ActivityType="13" flags="0" name="SecAce_General">
<Rect left="300" top="294" right="400" bottom="326"/>
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
<Activity id="180" ActivityType="3" flags="1" name="扩展会话">
<Rect left="300" top="234" right="400" bottom="266"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="扩展会话"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x10,0x50,"\x03")</Script><assessment no="1" name="DEP1664" type="8" flags="97"/>
</Activity>
<Activity id="182" ActivityType="3" flags="0" name="开始服务模式激活">
<Rect left="300" top="544" right="400" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="模式激活"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x60\x01")</Script><assessment no="47" name="DEP1914" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="3" flags="0" name="获取激活状态">
<Rect left="300" top="594" right="400" bottom="626"/>
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
<Activity id="189" ActivityType="3" flags="0" name="Pressure Measurement Start RL">
<Rect left="300" top="1024" right="400" bottom="1056"/>
<Line1Text Enable="1" Text="压力测量-后左"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x02")
if(@0 == 0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="通讯失败";
end
</Script><assessment no="75" name="DEP2350" type="8" flags="97"/>
</Activity>
<Activity id="190" ActivityType="3" flags="0" name="获取后左压力结果">
<Rect left="300" top="1074" right="400" bottom="1106"/>
<Line2Text Enable="1" Text="获取后左压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script><assessment no="76" name="DEP2350" type="8" flags="97"/>
</Activity>
<Activity id="191" ActivityType="3" flags="0" name="Pressure Measurement Start FL">
<Rect left="300" top="1174" right="400" bottom="1206"/>
<Line1Text Enable="1" Text="压力测量-后右"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x01")

if(@0 == 0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="通讯失败";
end
</Script><assessment no="78" name="DEP2352" type="8" flags="97"/>
</Activity>
<Activity id="192" ActivityType="3" flags="0" name="获取后右压力结果">
<Rect left="300" top="1234" right="400" bottom="1266"/>
<Line2Text Enable="1" Text="获取后右压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script><assessment no="79" name="DEP2352" type="8" flags="97"/>
</Activity>
<Activity id="193" ActivityType="3" flags="0" name="Reservoir">
<Rect left="300" top="1334" right="400" bottom="1366"/>
<Line1Text Enable="1" Text="Reservoir"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x10")
</Script><assessment no="80" name="DEP2353" type="8" flags="97"/>
</Activity>
<Activity id="194" ActivityType="3" flags="0" name="Reservoir">
<Rect left="300" top="1384" right="400" bottom="1416"/>
<Line2Text Enable="1" Text="Reservoir"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) 
</Script><assessment no="81" name="DEP2354" type="8" flags="97"/>
</Activity>
<Activity id="195" ActivityType="3" flags="0" name="return">
<Rect left="300" top="1574" right="400" bottom="1606"/>
<Line1Text Enable="1" Text="准备测试下一个"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x02\xDF\x66")
</Script><assessment no="82" name="DEP2355" type="8" flags="97"/>
</Activity>
<Activity id="196" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="1124" right="400" bottom="1156"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_3"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="197" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="1284" right="400" bottom="1316"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_4"/>
<Parameter id="PramOut" ret="Pram_4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="198" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="300" top="1444" right="400" bottom="1476"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_5"/>
<Parameter id="PramOut" ret="Pram_5"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="199" ActivityType="3" flags="0" name="延时50ms">
<Rect left="430" top="1094" right="530" bottom="1126"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="200" ActivityType="3" flags="0" name="延时50ms">
<Rect left="430" top="1264" right="530" bottom="1296"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="201" ActivityType="3" flags="0" name="延时50ms">
<Rect left="440" top="1424" right="540" bottom="1456"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="202" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="870" top="1694" right="970" bottom="1726"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="203" ActivityType="3" flags="0" name="停止ALL">
<Rect left="870" top="1634" right="970" bottom="1666"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="停止ALL"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x02\xDF\x60"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)</Script><assessment no="94" name="DEP2366" type="8" flags="97"/>
</Activity>
<Activity id="204" ActivityType="4" flags="0" name="路由节点">
<Rect left="74" top="1694" right="106" bottom="1726"/>
</Activity>
<Activity id="205" ActivityType="3" flags="0" name="Store FL air">
<Rect left="170" top="834" right="270" bottom="866"/>
<Script>MeasInt3 = MeasInt2 / 10;
engine.println("Store FL air spring pressure"..MeasInt3.."Bar");
--engine.println("标准值："..PointValue);
engine.SetLineText(2,"读到的压力值："..MeasInt3.."Bar");
engine.StatValue="获取的前左压力值："..MeasInt3.."Bar";
--engine.StatPoint = "0-25.4Bar";
#DELAY  600
--engine.SetLineText(2,"标准值："..PointValue);
--[[
if(resu == PointValue)then
	engine.LastErro = 0;
        engine.println("比对成功");

else
        engine.LastErro = 1;
        engine.println("比对失败");
end
--]]</Script><assessment no="96" name="DEP2480" type="8" flags="97"/>
</Activity>
<Activity id="206" ActivityType="3" flags="0" name="Store FR air">
<Rect left="170" top="974" right="270" bottom="1006"/>
<Script>resu = string.byte(recvTel:sub(6,6)) ;
resu1 = resu / 10 ;
engine.println("Store FR air spring pressure："..resu1.."Bar");
engine.SetLineText(2,"读到的压力值："..resu1.."Bar");
engine.StatValue="获取的前右压力值："..resu1.."Bar";
--engine.StatPoint = "0-25.4Bar";
#DELAY  600</Script><assessment no="97" name="DEP2481" type="8" flags="97"/>
</Activity>
<Activity id="207" ActivityType="3" flags="0" name="Store RR air">
<Rect left="170" top="1284" right="270" bottom="1316"/>
<Script>resu = string.byte(recvTel:sub(6,6)) ;
resu1 = resu / 10 ;
engine.println("Store RR air spring pressure："..resu1.."Bar");
engine.SetLineText(2,"读到的压力值："..resu1.."Bar");
engine.StatValue="获取的后右压力值："..resu1.."Bar";
--engine.StatPoint = "0-25.4Bar";
#DELAY  600</Script><assessment no="99" name="DEP2483" type="8" flags="97"/>
</Activity>
<Activity id="208" ActivityType="3" flags="0" name="Store RL air">
<Rect left="170" top="1124" right="270" bottom="1156"/>
<Script>resu = string.byte(recvTel:sub(6,6)) ;
resu1 = resu / 10 ;
engine.println("Store RL air spring pressure："..resu1.."Bar");
engine.SetLineText(2,"读到的压力值："..resu1.."Bar");
engine.StatValue="获取的后左压力值："..resu1.."Bar";
--engine.StatPoint = "0-25.4Bar";
#DELAY  600</Script><assessment no="98" name="DEP2482" type="8" flags="97"/>
</Activity>
<Activity id="209" ActivityType="3" flags="0" name="Store">
<Rect left="300" top="1514" right="400" bottom="1546"/>
<Script>resu = string.byte(recvTel:sub(6,6)) ;
engine.println("Store Reservoir pressure："..resu);
engine.SetLineText(2,"读到的压力值："..resu);
#DELAY  600
</Script></Activity>
<Activity id="210" ActivityType="3" flags="0" name="Height Sensor Check Start">
<Rect left="810" top="744" right="910" bottom="776"/>
<Line1Text Enable="1" Text="Height Sensor"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>engine.println("Test Start");
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x6A\03")
if(@0 == 0x71)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end
</Script><assessment no="83" name="DEP2356" type="8" flags="97"/>
</Activity>
<Activity id="211" ActivityType="3" flags="0" name="Height Sensor Check Result">
<Rect left="810" top="804" right="910" bottom="836"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="60" DelayTime="300"/>
<Line1Text Enable="1" Text="Height Sensor Check Result"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x6A"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) 
--MeasInt2 = string.byte(recvTel:sub(6,6)) 
--engine.println("MeasInt1="..MeasInt1..",MeasInt2="..MeasInt2);
engine.println("Height sensor status:"..MeasInt1);
if(@0 ==  0x71)then
	if(MeasInt1 == 0x00)then
		engine.LastError = 0;
                engine.TestResult = 0;
		engine.SetLineText(2,"Height Sensor Check Result OK");
                engine.println("Height Sensor Check Result OK");
                engine.StatValue="Result:0x00 OK/Successfully finished";
--#DELAY 500    
	elseif(MeasInt1 == 0xF1)then
		engine.LastError = 1;
                engine.TestResult = 1;
		engine.SetLineText(2,"Height Sensor Check :F1");
                engine.println("Height Sensor Check Result NOK F1");
                engine.StatValue="Result:Aborted due to time limit exceed";
        elseif(MeasInt1 == 0xF3)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.SetLineText(2,"Height Sensor Check :F3");
                engine.println("Height Sensor Check Result NOK F3");
                engine.StatValue="Result:0xF3 Aborted due to car-lift detection";
	elseif(MeasInt1 == 0x01)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.SetLineText(2,"Height Sensor Check :01");
                engine.println("Height Sensor Check Result NOK 01");
                engine.StatValue="Result:0x01 Function still running";
	else
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.SetLineText(2,"Height Sensor Check other error");
                engine.println("Height Sensor Check Result NOK other error");
	end
else
	engine.LastError = 1;	
        engine.TestResult = 1;
	local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
        engine.SetLineText(2,"Height Sensor Check Result NOK");
        engine.println("Height Sensor Check Result NOK ");
--#DELAY 500     
end</Script><assessment no="84" name="DEP2357" type="8" flags="97"/>
</Activity>
<Activity id="213" ActivityType="3" flags="0" name="获取前右压力结果">
<Rect left="1490" top="1434" right="1590" bottom="1466"/>
<Line2Text Enable="1" Text="获取前右压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script></Activity>
<Activity id="215" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1490" top="1494" right="1590" bottom="1526"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;00000000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="0"/>
<Parameter id="MeasInt" value="MeasInt1"/>
<Parameter id="RightViewText" value="&quot;状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="1"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="216" ActivityType="3" flags="0" name="延时50ms">
<Rect left="1640" top="1464" right="1740" bottom="1496"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="218" ActivityType="3" flags="0" name="Pressure Measurement Start RL">
<Rect left="1490" top="1544" right="1590" bottom="1576"/>
<Line1Text Enable="1" Text="压力测量-后左"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x02")
if(@0 == 0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="通讯失败";
end
</Script></Activity>
<Activity id="219" ActivityType="3" flags="0" name="获取后左压力结果">
<Rect left="1490" top="1594" right="1590" bottom="1626"/>
<Line2Text Enable="1" Text="获取后左压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script></Activity>
<Activity id="220" ActivityType="3" flags="0" name="Pressure Measurement Start FL">
<Rect left="1490" top="1694" right="1590" bottom="1726"/>
<Line1Text Enable="1" Text="压力测量-后右"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确定"/>
<Script>--#PRESSBUTTON
LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x66\x01")

if(@0 == 0x71)then
     engine.LastError = 0;
else
     engine.LastError = 1;
        engine.StatValue="通讯失败";
end
</Script></Activity>
<Activity id="221" ActivityType="3" flags="0" name="获取后右压力结果">
<Rect left="1490" top="1754" right="1590" bottom="1786"/>
<Line2Text Enable="1" Text="获取后右压力结果"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x66"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) </Script></Activity>
<Activity id="222" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1490" top="1644" right="1590" bottom="1676"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_3"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="223" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1490" top="1804" right="1590" bottom="1836"/>
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
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_4"/>
<Parameter id="PramOut" ret="Pram_4"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="224" ActivityType="3" flags="0" name="延时50ms">
<Rect left="1620" top="1614" right="1720" bottom="1646"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="225" ActivityType="3" flags="0" name="延时50ms">
<Rect left="1620" top="1784" right="1720" bottom="1816"/>
<Script>engine.Delay(50)</Script></Activity>
<Activity id="227" ActivityType="3" flags="0" name="Store FR air">
<Rect left="1360" top="1494" right="1460" bottom="1526"/>
<Script>--resu = string.byte(recvTel:sub(6,6)) ;
resu = string.byte(recvTel:sub(6,6)) ;
--PointValue = ;
engine.println("Store FR air spring pressure："..resu);
--engine.println("标准值："..PointValue);
engine.SetLineText(2,"读到的压力值："..resu);
#DELAY  600
--engine.SetLineText(2,"标准值："..PointValue);
--[[
if(resu == PointValue)then
	engine.LastErro = 0;
        engine.println("比对成功");

else
        engine.LastErro = 1;
        engine.println("比对失败");
end
--]]</Script></Activity>
<Activity id="228" ActivityType="3" flags="0" name="Store RR air">
<Rect left="1360" top="1804" right="1460" bottom="1836"/>
<Script>--resu = string.byte(recvTel:sub(6,6)) ;
resu = string.byte(recvTel:sub(6,6)) ;
--PointValue = ;
engine.println("Store RR air spring pressure："..resu);
--engine.println("标准值："..PointValue);
engine.SetLineText(2,"读到的压力值："..resu);
#DELAY  600
--engine.SetLineText(2,"标准值："..PointValue);
--[[
if(resu == PointValue)then
	engine.LastErro = 0;
        engine.println("比对成功");

else
        engine.LastErro = 1;
        engine.println("比对失败");
end
--]]</Script></Activity>
<Activity id="229" ActivityType="3" flags="0" name="Store RL air">
<Rect left="1360" top="1644" right="1460" bottom="1676"/>
<Script>--resu = string.byte(recvTel:sub(6,6)) ;
resu = string.byte(recvTel:sub(6,6)) ;
--PointValue = ;
engine.println("Store RL air spring pressure："..resu);
--engine.println("标准值："..PointValue);
engine.SetLineText(2,"读到的压力值："..resu);
#DELAY  600
--engine.SetLineText(2,"标准值："..PointValue);
--[[
if(resu == PointValue)then
	engine.LastErro = 0;
        engine.println("比对成功");

else
        engine.LastErro = 1;
        engine.println("比对失败");
end
--]]</Script></Activity>
<Activity id="232" ActivityType="3" flags="0" name="Read DTC">
<Rect left="810" top="864" right="910" bottom="896"/>
<Line1Text Enable="1" Text="ReadDTCInformation"/>
<Script>#COMM 0x19 0x02 0x09</Script><assessment no="85" name="DEP2362" type="8" flags="97"/>
</Activity>
<Activity id="233" ActivityType="3" flags="0" name="Clear DTC">
<Rect left="810" top="924" right="910" bottom="956"/>
<Line1Text Enable="1" Text="清楚故障码"/>
<Script>#COMM 0x14 0xFF 0xFF 0xFF</Script><assessment no="86" name="DEP2363" type="8" flags="97"/>
</Activity>
<Activity id="234" ActivityType="3" flags="0" name="Leveling Mode Control Dynamic Start">
<Rect left="810" top="1004" right="910" bottom="1036"/>
<Line1Text Enable="1" Text="Leveling Mode Control Dynamic Start"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x67\04")
if(@0 == 0x71)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end
</Script><assessment no="87" name="DEP2358" type="8" flags="97"/>
</Activity>
<Activity id="235" ActivityType="3" flags="0" name="Leveling Mode Control Dynamic Result">
<Rect left="810" top="1074" right="910" bottom="1106"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="60" DelayTime="300"/>
<Line1Text Enable="1" Text="Leveling Mode Control Dynamic Result"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x67"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5))
MeasInt2 = string.byte(recvTel:sub(6,6))
if(@0 ==  0x71)then
	if(MeasInt1 == 0x00)then
		engine.LastError = 0;
                engine.TestResult = 0;
                engine.SetLineText(2,"Leveling Mode Dynamic Control Result OK");
                engine.StatValue="Result:0x00 OK/Successfully finished";
--#DELAY 500                
	elseif(MeasInt1 == 0xF1)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0xF1 Aborted due to time limit exceed";
		engine.SetLineText(2,"Leveling Mode Dynamic :F1");
        elseif(MeasInt1 == 0xF3)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0x01 Aborted due to car-lift detection";
                engine.SetLineText(2,"Leveling Mode Dynamic :F3");
         elseif(MeasInt1 == 0x01)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0x01 Function still running";
                engine.SetLineText(2,"Leveling Mode Dynamic :01");
                engine.println("Leveling Mode Dynamic 01");
        else
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Leveling Mode Dynamic other error";
                engine.SetLineText(2,"Leveling Mode Dynamic other error");
                engine.println("Leveling Mode Dynamic other error");        
	end
else
	engine.LastError = 1;
        engine.TestResult = 1;
        local StringRes;
	StringRes = engine.GetResponseString(0,engine.GetResponseSize());
	engine.StatValue=hexstr(StringRes);
	engine.SetLineText(2,"Leveling Mode Control Result NOK");
--#DELAY 500     
end</Script><assessment no="88" name="DEP2359" type="8" flags="97"/>
</Activity>
<Activity id="236" ActivityType="3" flags="0" name="Leveling Mode Control Normal Start">
<Rect left="810" top="1164" right="910" bottom="1196"/>
<Line1Text Enable="1" Text="Leveling Mode Control Normal Start"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,"\x01\xDF\x67\05")
if(@0 == 0x71)then
	engine.LastError = 0;
else
	engine.LastError = 1;
end</Script><assessment no="89" name="DEP2360" type="8" flags="97"/>
</Activity>
<Activity id="238" ActivityType="3" flags="0" name="Read DTC">
<Rect left="810" top="1304" right="910" bottom="1336"/>
<Script>#COMM 0x19 0x02 0x09</Script><assessment no="91" name="DEP2362" type="8" flags="97"/>
</Activity>
<Activity id="239" ActivityType="3" flags="1" name="Test Failed">
<Rect left="940" top="1394" right="1040" bottom="1426"/>
<Line1Text Enable="1" Text="Test Failed"/>
<Script>#DELAY 2000</Script><assessment no="93" name="DEP2365" type="8" flags="97"/>
</Activity>
<Activity id="240" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="744" right="1006" bottom="776"/>
</Activity>
<Activity id="241" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="804" right="1006" bottom="836"/>
</Activity>
<Activity id="242" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="1004" right="1006" bottom="1036"/>
</Activity>
<Activity id="243" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="1074" right="1006" bottom="1106"/>
</Activity>
<Activity id="244" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="1164" right="1006" bottom="1196"/>
</Activity>
<Activity id="245" ActivityType="4" flags="0" name="路由节点">
<Rect left="974" top="1244" right="1006" bottom="1276"/>
</Activity>
<Activity id="246" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="744" right="726" bottom="776"/>
</Activity>
<Activity id="247" ActivityType="3" flags="0" name="Test Successfully">
<Rect left="810" top="1394" right="910" bottom="1426"/>
<Line1Text Enable="1" Text="Test Successfully"/>
<Script>#DELAY 2000</Script><assessment no="92" name="DEP2364" type="8" flags="97"/>
</Activity>
<Activity id="248" ActivityType="4" flags="0" name="路由节点">
<Rect left="904" top="1554" right="936" bottom="1586"/>
</Activity>
<Activity id="249" ActivityType="3" flags="0" name="Leveling Mode Control Normal Result">
<Rect left="810" top="1244" right="910" bottom="1276"/>
<Strategy TotalTime="200" NokTime="200" RetryTimeOut="60" DelayTime="300"/>
<Line1Text Enable="1" Text="Leveling Mode Control Normal Result"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>request = "\x03\xDF\x67"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,request)
MeasInt1 = string.byte(recvTel:sub(5,5)) 
MeasInt2 = string.byte(recvTel:sub(6,6)) 
if(@0 ==  0x71)then
	if(MeasInt1 == 0x00)then
		engine.LastError = 0;
                engine.TestResult = 0;
                engine.StatValue="Result:0x00 OK/Successfully finished";
                engine.SetLineText(2,"Leveling Mode Normal Control Result OK");
--#DELAY 500                
	elseif(MeasInt1 == 0xF1)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0xF1 Aborted due to time limit exceed";
		engine.SetLineText(2,"Leveling Mode Normal :F1");
        elseif(MeasInt1 == 0xF3)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0xF1 Aborted due to car-lift detection";
                engine.SetLineText(2,"Leveling Mode Normal :F3");
         elseif(MeasInt1 == 0x01)then
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Result:0x01 Function still running";
                engine.SetLineText(2,"Leveling Mode Normal :01");
                engine.println("Leveling Mode Normal 01");
        else
		engine.LastError = 1;
                engine.TestResult = 1;
                engine.StatValue="Leveling Mode Normal other error";
                engine.SetLineText(2,"Leveling Mode Normal other error");
                engine.println("Leveling Mode Normal other error ");        
	end
else
	engine.LastError = 1;
        engine.TestResult = 1;
	engine.SetLineText(2,"Leveling Mode Normal Result NOK");
--#DELAY 500     
end</Script><assessment no="90" name="DEP2361" type="8" flags="97"/>
</Activity>
<Activity id="250" ActivityType="4" flags="0" name="路由节点">
<Rect left="694" top="1574" right="726" bottom="1606"/>
</Activity>
<Activity id="251" ActivityType="4" flags="0" name="路由节点">
<Rect left="484" top="394" right="516" bottom="426"/>
</Activity>
<Activity id="252" ActivityType="3" flags="0" name="通讯失败">
<Rect left="40" top="234" right="140" bottom="266"/>
<Line1Text Enable="1" Text="控制器连接失败！"/>
<Line2Text Enable="1" Text="重试么？"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>engine.TestResult = 1;
#PRESSBUTTON</Script></Activity>
<Activity id="253" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="40" top="174" right="140" bottom="206"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="178" type="0">
</Transition>
<Transition StartId="5" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="126" type="0">
</Transition>
<Transition StartId="120" EndId="182" type="0">
</Transition>
<Transition StartId="124" EndId="125" type="0">
</Transition>
<Transition StartId="125" EndId="137" type="0">
</Transition>
<Transition StartId="126" EndId="205" type="0">
</Transition>
<Transition StartId="126" EndId="144" type="1">
<Expression>FinishFlag_1 == false</Expression></Transition>
<Transition StartId="137" EndId="140" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="137" EndId="206" type="0">
</Transition>
<Transition StartId="140" EndId="125" type="0">
</Transition>
<Transition StartId="144" EndId="119" type="0">
</Transition>
<Transition StartId="149" EndId="150" type="0">
</Transition>
<Transition StartId="152" EndId="5" type="0">
</Transition>
<Transition StartId="178" EndId="180" type="3">
</Transition>
<Transition StartId="179" EndId="251" type="3">
</Transition>
<Transition StartId="179" EndId="252" type="4">
</Transition>
<Transition StartId="180" EndId="179" type="3">
</Transition>
<Transition StartId="180" EndId="252" type="0">
</Transition>
<Transition StartId="182" EndId="183" type="0">
</Transition>
<Transition StartId="183" EndId="152" type="0">
</Transition>
<Transition StartId="189" EndId="190" type="0">
</Transition>
<Transition StartId="190" EndId="196" type="0">
</Transition>
<Transition StartId="191" EndId="192" type="0">
</Transition>
<Transition StartId="192" EndId="197" type="0">
</Transition>
<Transition StartId="193" EndId="194" type="0">
</Transition>
<Transition StartId="194" EndId="198" type="0">
</Transition>
<Transition StartId="195" EndId="250" type="0">
</Transition>
<Transition StartId="196" EndId="199" type="1">
<Expression>FinishFlag_3 == false</Expression></Transition>
<Transition StartId="196" EndId="208" type="0">
</Transition>
<Transition StartId="197" EndId="200" type="1">
<Expression>FinishFlag_4 == false</Expression></Transition>
<Transition StartId="197" EndId="207" type="0">
</Transition>
<Transition StartId="198" EndId="201" type="1">
<Expression>FinishFlag_5 == false</Expression></Transition>
<Transition StartId="198" EndId="209" type="0">
</Transition>
<Transition StartId="199" EndId="190" type="0">
</Transition>
<Transition StartId="200" EndId="192" type="0">
</Transition>
<Transition StartId="201" EndId="194" type="0">
</Transition>
<Transition StartId="202" EndId="2" type="0">
</Transition>
<Transition StartId="203" EndId="202" type="0">
</Transition>
<Transition StartId="204" EndId="202" type="0">
</Transition>
<Transition StartId="205" EndId="124" type="0">
</Transition>
<Transition StartId="206" EndId="189" type="0">
</Transition>
<Transition StartId="207" EndId="193" type="0">
</Transition>
<Transition StartId="208" EndId="191" type="0">
</Transition>
<Transition StartId="209" EndId="195" type="0">
</Transition>
<Transition StartId="210" EndId="211" type="0">
</Transition>
<Transition StartId="210" EndId="240" type="4">
</Transition>
<Transition StartId="211" EndId="232" type="0">
</Transition>
<Transition StartId="211" EndId="241" type="4">
</Transition>
<Transition StartId="213" EndId="215" type="0">
</Transition>
<Transition StartId="215" EndId="216" type="1">
<Expression>FinishFlag_2 == false</Expression></Transition>
<Transition StartId="215" EndId="227" type="0">
</Transition>
<Transition StartId="216" EndId="213" type="0">
</Transition>
<Transition StartId="218" EndId="219" type="0">
</Transition>
<Transition StartId="219" EndId="222" type="0">
</Transition>
<Transition StartId="220" EndId="221" type="0">
</Transition>
<Transition StartId="221" EndId="223" type="0">
</Transition>
<Transition StartId="222" EndId="224" type="1">
<Expression>FinishFlag_3 == false</Expression></Transition>
<Transition StartId="222" EndId="229" type="0">
</Transition>
<Transition StartId="223" EndId="225" type="1">
<Expression>FinishFlag_4 == false</Expression></Transition>
<Transition StartId="223" EndId="228" type="0">
</Transition>
<Transition StartId="224" EndId="219" type="0">
</Transition>
<Transition StartId="225" EndId="221" type="0">
</Transition>
<Transition StartId="227" EndId="218" type="0">
</Transition>
<Transition StartId="229" EndId="220" type="0">
</Transition>
<Transition StartId="232" EndId="233" type="0">
</Transition>
<Transition StartId="233" EndId="234" type="0">
</Transition>
<Transition StartId="234" EndId="235" type="0">
</Transition>
<Transition StartId="234" EndId="242" type="4">
</Transition>
<Transition StartId="235" EndId="236" type="0">
</Transition>
<Transition StartId="235" EndId="243" type="4">
</Transition>
<Transition StartId="236" EndId="249" type="0">
</Transition>
<Transition StartId="236" EndId="244" type="4">
</Transition>
<Transition StartId="238" EndId="247" type="0">
</Transition>
<Transition StartId="239" EndId="248" type="0">
</Transition>
<Transition StartId="240" EndId="241" type="0">
</Transition>
<Transition StartId="241" EndId="242" type="0">
</Transition>
<Transition StartId="242" EndId="243" type="0">
</Transition>
<Transition StartId="243" EndId="244" type="0">
</Transition>
<Transition StartId="244" EndId="245" type="0">
</Transition>
<Transition StartId="245" EndId="239" type="0">
</Transition>
<Transition StartId="246" EndId="210" type="0">
</Transition>
<Transition StartId="247" EndId="248" type="0">
</Transition>
<Transition StartId="248" EndId="203" type="0">
</Transition>
<Transition StartId="249" EndId="245" type="4">
</Transition>
<Transition StartId="249" EndId="238" type="0">
</Transition>
<Transition StartId="250" EndId="246" type="0">
</Transition>
<Transition StartId="251" EndId="120" type="0">
</Transition>
<Transition StartId="252" EndId="253" type="0">
</Transition>
<Transition StartId="252" EndId="204" type="5">
</Transition>
<Transition StartId="253" EndId="178" type="0">
</Transition>
</Transitions>
</Process>

