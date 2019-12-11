<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3016" pbltext="DEP1708">
<Parameters>
<Variable id="IFCresult" type="11" dir="1" data=""/>
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
<Variable id="CAN_SND_ID" type="3" data="0x722" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x72A" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="270" top="44" right="370" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="270" top="1044" right="370" bottom="1076"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="13" flags="0" name="IFC建立通讯">
<Rect left="270" top="104" right="370" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="IFC 建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="4" ActivityType="13" flags="0" name="扩展会话">
<Rect left="270" top="254" right="370" bottom="286"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="IFC建立扩展会话"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="18" name="DEP1711" type="8" flags="97"/>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="读VIN码">
<Rect left="270" top="154" right="370" bottom="186"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\xF1\x90')
VINstr = recvTel:sub(4,-1)
engine.SetLineText(1,"读取VIN码")
engine.SetLineText(2,VINstr)
engine.Delay(100)


</Script><assessment no="16" name="DEP1720" type="8" flags="97"/>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="读取MCS串口号">
<Rect left="270" top="204" right="370" bottom="236"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x2A\x12')
MCSSerial = recvTel:sub(4,-1)
engine.SetLineText(1,"读取MCS串口号")
engine.SetLineText(2,MCSSerial)
engine.Delay(500)</Script><assessment no="17" name="DEP1890" type="8" flags="97"/>
</Activity>
<Activity id="10" ActivityType="13" flags="0" name="安全访问">
<Rect left="270" top="304" right="370" bottom="336"/>
<FunctionRef id="SecAce_General">
<Parameters>
<Parameter id="vciHandl" value="vciHandle"/>
<Parameter id="MASK" value="0xDBFEAD0F"/>
</Parameters>
</FunctionRef>
<assessment no="19" name="DEP1891" type="8" flags="97"/>
</Activity>
<Activity id="11" ActivityType="3" flags="0" name="写工站标定参数">
<Rect left="270" top="354" right="370" bottom="386"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="写入工站标定参数"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>exData = "2A100FCF009B009B01C20226008A0100"
exData = LibGeneral.str2hex(exData)

recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,exData)
</Script><assessment no="20" name="DEP1892" type="8" flags="97"/>
</Activity>
<Activity id="172" ActivityType="3" flags="0" name="写入标定追溯信息">
<Rect left="60" top="314" right="160" bottom="346"/>
<Script>exData = "\x2A\x02"
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x2E,0x6E,exData)</Script></Activity>
<Activity id="173" ActivityType="3" flags="0" name="启动标定">
<Rect left="270" top="424" right="370" bottom="456"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="开始标定"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,'\x01\xE0\x80')</Script><assessment no="21" name="DEP1893" type="8" flags="97"/>
</Activity>
<Activity id="174" ActivityType="3" flags="0" name="读取标定错误结果">
<Rect left="60" top="424" right="160" bottom="456"/>
<Script>engine.SetLineText(0,"IFC执行诊断")
engine.SetLineText(1,"IFC标定失败!")
engine.Delay(2000)
recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x2A\x0E')
</Script></Activity>
<Activity id="175" ActivityType="3" flags="0" name="延时6s">
<Rect left="270" top="484" right="370" bottom="516"/>
<Script>engine.Delay(6000)</Script></Activity>
<Activity id="176" ActivityType="3" flags="0" name="返回标定结果">
<Rect left="270" top="544" right="370" bottom="576"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,'\x03\xE0\x80')
</Script><assessment no="22" name="DEP1894" type="8" flags="97"/>
</Activity>
<Activity id="177" ActivityType="3" flags="0" name="停止标定">
<Rect left="270" top="674" right="370" bottom="706"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x31,0x71,'\x02\xE0\x80')</Script><assessment no="24" name="DEP1896" type="8" flags="97"/>
</Activity>
<Activity id="178" ActivityType="3" flags="0" name="读取标定结果">
<Rect left="270" top="734" right="370" bottom="766"/>
<Script>recvTel = LibGeneral.ECU_DataExchange(vciHandle,0x22,0x62,'\x2A\x0E')</Script><assessment no="25" name="DEP1897" type="8" flags="97"/>
</Activity>
<Activity id="179" ActivityType="13" flags="0" name="清除故障码">
<Rect left="270" top="794" right="370" bottom="826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="IFC 清除故障码"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="recvTel"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP1710" type="8" flags="97"/>
</Activity>
<Activity id="181" ActivityType="13" flags="0" name="读故障码">
<Rect left="270" top="854" right="370" bottom="886"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<FunctionRef id="UDS_ReadDTCByStatusMask" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="DTCInformType" value="0x02"/>
<Parameter id="DTCStatusMask" value="0xFF"/>
<Parameter id="DTC_Tab_Code" ret="aDTC_Tab_Code"/>
<Parameter id="DTC_Tab_pCode" ret="aDTC_Tab_pCode"/>
</Parameters>
</FunctionRef>
<assessment no="28" name="DEP1849" type="8" flags="97"/>
</Activity>
<Activity id="182" ActivityType="13" flags="0" name="统计故障码">
<Rect left="270" top="914" right="370" bottom="946"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{}"/>
<Parameter id="ViewList_Flag" value="true"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_IFC&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP1898" type="8" flags="97"/>
</Activity>
<Activity id="183" ActivityType="3" flags="1" name="结果判断">
<Rect left="270" top="604" right="370" bottom="636"/>
<Script>IFCresult = false
combyte = recvTel:sub(5,5)
combyte = string.byte(combyte)
if (combyte ~= 0x05) then
	engine.LastError  = 1
        engine.SetLineText(0,"IFC标定失败!")
        if (combyte == 0x01) then
		engine.SetLineText(1,"标定未完成")
        elseif(combyte == 0x02) then
		engine.SetLineText(1,"失败,重新安装")
        elseif(combyte == 0x03) then
		engine.SetLineText(1,"探测不到目标")
	elseif(combyte == 0x04) then
		engine.SetLineText(1,"探测到多个目标")
        else
        end
        engine.Delay(2000)
else
	engine.LastError = 0
        engine.SetLineText(1,"IFC标定成功!")
        IFCresult = true
        engine.Delay(2000)
end
engine.StatValue = combyte</Script><assessment no="23" name="DEP1895" type="8" flags="97"/>
</Activity>
<Activity id="184" ActivityType="4" flags="0" name="路由节点">
<Rect left="664" top="154" right="696" bottom="186"/>
</Activity>
<Activity id="185" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="270" top="974" right="370" bottom="1006"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="7" type="0">
</Transition>
<Transition StartId="4" EndId="10" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="3">
</Transition>
<Transition StartId="7" EndId="184" type="0">
</Transition>
<Transition StartId="8" EndId="4" type="0">
</Transition>
<Transition StartId="10" EndId="11" type="0">
</Transition>
<Transition StartId="11" EndId="173" type="0">
</Transition>
<Transition StartId="173" EndId="174" type="4">
</Transition>
<Transition StartId="173" EndId="175" type="0">
</Transition>
<Transition StartId="174" EndId="179" type="0">
</Transition>
<Transition StartId="175" EndId="176" type="0">
</Transition>
<Transition StartId="176" EndId="174" type="4">
</Transition>
<Transition StartId="176" EndId="183" type="3">
</Transition>
<Transition StartId="177" EndId="178" type="0">
</Transition>
<Transition StartId="178" EndId="179" type="0">
</Transition>
<Transition StartId="179" EndId="181" type="0">
</Transition>
<Transition StartId="181" EndId="182" type="0">
</Transition>
<Transition StartId="182" EndId="185" type="0">
</Transition>
<Transition StartId="183" EndId="177" type="0">
</Transition>
<Transition StartId="184" EndId="185" type="0">
</Transition>
<Transition StartId="185" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

