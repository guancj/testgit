<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3030" pbltext="DEP211">
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
<Variable id="CAN_SND_ID" type="3" data="0x764" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x76C" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="110" right="210" bottom="32"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="1240" top="884" right="1340" bottom="916"/>
<Script></Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="室内开启行李箱">
<Rect left="110" top="54" right="210" bottom="86"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请将点火开关调ON档"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="普通节点">
<Rect left="110" top="104" right="210" bottom="136"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请确认行李箱处于关闭状态"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="普通节点">
<Rect left="110" top="274" right="210" bottom="306"/>
<Line1Text Enable="1" Text="按下行李箱室内开关"/>
<Script></Script></Activity>
<Activity id="6" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="110" top="344" right="210" bottom="376"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x04&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="7" ActivityType="3" flags="0" name="字节处理">
<Rect left="110" top="404" right="210" bottom="436"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))
</Script></Activity>
<Activity id="8" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="110" top="474" right="210" bottom="506"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="1"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;开关状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3030" pbltext="DEP211" no="21" name="DEP2159" type="8" flags="97"/>
</Activity>
<Activity id="935" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="110" top="554" right="210" bottom="586"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x02&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="936" ActivityType="3" flags="0" name="字节处理">
<Rect left="110" top="614" right="210" bottom="646"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="937" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="110" top="684" right="210" bottom="716"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;解锁状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="22" name="DEP2160" type="8" flags="97"/>
</Activity>
<Activity id="938" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="110" top="744" right="210" bottom="776"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x03&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="939" ActivityType="3" flags="0" name="字节处理">
<Rect left="110" top="804" right="210" bottom="836"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="940" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="110" top="874" right="210" bottom="906"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_3"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;灯状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_3"/>
<Parameter id="PramOut" ret="Pram_3"/>
</Parameters>
</FunctionRef>
<assessment no="23" name="DEP751" type="8" flags="97"/>
</Activity>
<Activity id="941" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="944" right="66" bottom="976"/>
</Activity>
<Activity id="942" ActivityType="4" flags="0" name="路由节点">
<Rect left="34" top="274" right="66" bottom="306"/>
</Activity>
<Activity id="943" ActivityType="3" flags="0" name="endloop">
<Rect left="110" top="944" right="210" bottom="976"/>
<Script></Script></Activity>
<Activity id="944" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="944" right="316" bottom="976"/>
</Activity>
<Activity id="945" ActivityType="3" flags="0" name="普通节点">
<Rect left="410" top="204" right="510" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1" Text="请确认行李箱处于开启状态"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;</Script></Activity>
<Activity id="946" ActivityType="4" flags="0" name="路由节点">
<Rect left="284" top="204" right="316" bottom="236"/>
</Activity>
<Activity id="947" ActivityType="3" flags="0" name="普通节点">
<Rect left="410" top="264" right="510" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下行李箱内侧开关"/>
<Script></Script></Activity>
<Activity id="948" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="410" top="334" right="510" bottom="366"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x04&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="949" ActivityType="3" flags="0" name="字节处理">
<Rect left="410" top="394" right="510" bottom="426"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="950" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="464" right="510" bottom="496"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;开关按下状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="24" name="DEP754" type="8" flags="97"/>
</Activity>
<Activity id="951" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="410" top="534" right="510" bottom="566"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x01&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="952" ActivityType="3" flags="0" name="字节处理">
<Rect left="410" top="594" right="510" bottom="626"/>
<Script>down = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="953" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="410" top="664" right="510" bottom="696"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0101&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="down"/>
<Parameter id="RightViewText" value="&quot;执行下降动作&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="25" name="DEP756" type="8" flags="97"/>
</Activity>
<Activity id="954" ActivityType="3" flags="0" name="施加力量阻挡行李箱门关闭">
<Rect left="700" top="204" right="800" bottom="236"/>
<Line2Text Enable="1" Text="施加力量阻挡行李箱门关闭"/>
<Script></Script></Activity>
<Activity id="955" ActivityType="3" flags="0" name="endloop">
<Rect left="410" top="724" right="510" bottom="756"/>
<Script></Script></Activity>
<Activity id="956" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="724" right="386" bottom="756"/>
</Activity>
<Activity id="957" ActivityType="4" flags="0" name="路由节点">
<Rect left="354" top="264" right="386" bottom="296"/>
</Activity>
<Activity id="958" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="700" top="264" right="800" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x01&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="959" ActivityType="3" flags="0" name="字节处理">
<Rect left="700" top="324" right="800" bottom="356"/>
<Script>Anti_pinch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="960" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="700" top="394" right="800" bottom="426"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="Anti_pinch"/>
<Parameter id="RightViewText" value="&quot;执行防夹动作&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="27" name="DEP2161" type="8" flags="97"/>
</Activity>
<Activity id="961" ActivityType="3" flags="0" name="Init">
<Rect left="410" top="794" right="510" bottom="826"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;</Script></Activity>
<Activity id="962" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="794" right="586" bottom="826"/>
</Activity>
<Activity id="963" ActivityType="4" flags="0" name="路由节点">
<Rect left="554" top="204" right="586" bottom="236"/>
</Activity>
<Activity id="964" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="700" top="464" right="800" bottom="496"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x06&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="965" ActivityType="3" flags="0" name="字节处理">
<Rect left="700" top="524" right="800" bottom="556"/>
<Script>clip_alarm = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="966" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="700" top="594" right="800" bottom="626"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="clip_alarm"/>
<Parameter id="RightViewText" value="&quot;防夹报警激活&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="26" name="DEP758" type="8" flags="97"/>
</Activity>
<Activity id="968" ActivityType="3" flags="0" name="endloop">
<Rect left="700" top="664" right="800" bottom="696"/>
<Script></Script></Activity>
<Activity id="969" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="664" right="666" bottom="696"/>
</Activity>
<Activity id="970" ActivityType="4" flags="0" name="路由节点">
<Rect left="634" top="264" right="666" bottom="296"/>
</Activity>
<Activity id="971" ActivityType="3" flags="0" name="普通节点">
<Rect left="700" top="814" right="800" bottom="846"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="请将行李箱处于关闭状态"/>
<Line3Text Enable="1" Text="请将四个车门均处于解锁状态"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="取消"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;</Script></Activity>
<Activity id="973" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="814" right="886" bottom="846"/>
</Activity>
<Activity id="974" ActivityType="4" flags="0" name="路由节点">
<Rect left="854" top="204" right="886" bottom="236"/>
</Activity>
<Activity id="975" ActivityType="3" flags="0" name="按下行李箱外侧开关">
<Rect left="980" top="204" right="1080" bottom="236"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="按下行李箱外侧开关"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="976" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="980" top="264" right="1080" bottom="296"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x04&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="977" ActivityType="3" flags="0" name="字节处理">
<Rect left="980" top="324" right="1080" bottom="356"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="978" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="394" right="1080" bottom="426"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????0010&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;行李箱外侧开关状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="28" name="DEP760" type="8" flags="97"/>
</Activity>
<Activity id="979" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="980" top="464" right="1080" bottom="496"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x01&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="980" ActivityType="3" flags="0" name="字节处理">
<Rect left="980" top="524" right="1080" bottom="556"/>
<Script> Result = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="981" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="980" top="594" right="1080" bottom="626"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0100&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value=" Result "/>
<Parameter id="RightViewText" value="&quot;行李箱上升状态&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="30"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="29" name="DEP755" type="8" flags="97"/>
</Activity>
<Activity id="982" ActivityType="3" flags="0" name="endloop">
<Rect left="980" top="664" right="1080" bottom="696"/>
<Script></Script></Activity>
<Activity id="983" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="664" right="956" bottom="696"/>
</Activity>
<Activity id="984" ActivityType="4" flags="0" name="路由节点">
<Rect left="924" top="264" right="956" bottom="296"/>
</Activity>
<Activity id="985" ActivityType="3" flags="0" name="施加力量阻挡行李箱门开启">
<Rect left="980" top="744" right="1080" bottom="776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="开启动作到1半行程，施加力量阻挡开启"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>Pram_1 = nil ;
Pram_2 = nil ;
Pram_3 = nil ;</Script></Activity>
<Activity id="986" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="1240" top="204" right="1340" bottom="236"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x01&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="987" ActivityType="3" flags="0" name="字节处理">
<Rect left="1240" top="274" right="1340" bottom="306"/>
<Script>switch = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="988" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1240" top="344" right="1340" bottom="376"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_1"/>
<Parameter id="LineNr" value="2"/>
<Parameter id="TextCmp" value="&quot;????000&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value="switch"/>
<Parameter id="RightViewText" value="&quot;开启防撞保护&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="45"/>
<Parameter id="FinishFlag" ret="FinishFlag_1"/>
<Parameter id="PramOut" ret="Pram_1"/>
</Parameters>
</FunctionRef>
<assessment no="30" name="DEP2162" type="8" flags="97"/>
</Activity>
<Activity id="989" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="1240" top="414" right="1340" bottom="446"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x22"/>
<Parameter id="resTitle" value="0x62"/>
<Parameter id="sendTel" value="&quot;\x01\x07&quot;"/>
<Parameter id="recvTel" ret="result"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="990" ActivityType="3" flags="0" name="字节处理">
<Rect left="1240" top="474" right="1340" bottom="506"/>
<Script> Result = LibGeneral.hex2str(string.sub(result,4,4))</Script></Activity>
<Activity id="991" ActivityType="13" flags="0" name="Status_Check_view_8bit">
<Rect left="1240" top="544" right="1340" bottom="576"/>
<FunctionRef id="Status_Check_view_8bit" model="LibGeneral">
<Parameters>
<Parameter id="PramIn" value="Pram_2"/>
<Parameter id="LineNr" value="3"/>
<Parameter id="TextCmp" value="&quot;????0001&quot;"/>
<Parameter id="DialogHandle" value="0"/>
<Parameter id="LastErr" value="engine.LastError "/>
<Parameter id="MeasInt" value=" Result "/>
<Parameter id="RightViewText" value="&quot;防撞保护激活&quot;"/>
<Parameter id="CType" value="1"/>
<Parameter id="OKcount" value="2"/>
<Parameter id="NOKcount" value="0"/>
<Parameter id="TimeOut" value="45"/>
<Parameter id="FinishFlag" ret="FinishFlag_2"/>
<Parameter id="PramOut" ret="Pram_2"/>
</Parameters>
</FunctionRef>
<assessment no="31" name="DEP761" type="8" flags="97"/>
</Activity>
<Activity id="992" ActivityType="3" flags="0" name="endloop">
<Rect left="1240" top="614" right="1340" bottom="646"/>
<Script></Script></Activity>
<Activity id="993" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="614" right="1216" bottom="646"/>
</Activity>
<Activity id="994" ActivityType="4" flags="0" name="路由节点">
<Rect left="1184" top="204" right="1216" bottom="236"/>
</Activity>
<Activity id="995" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="744" right="1136" bottom="776"/>
</Activity>
<Activity id="996" ActivityType="4" flags="0" name="路由节点">
<Rect left="1104" top="204" right="1136" bottom="236"/>
</Activity>
<Activity id="997" ActivityType="3" flags="0" name="普通节点">
<Rect left="1240" top="694" right="1340" bottom="726"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"撤去外力，按下外侧开关")
engine.SetLineText(2,"#L=行李箱是否关闭".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="998" ActivityType="3" flags="0" name="普通节点">
<Rect left="700" top="744" right="800" bottom="776"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1" Text="NOK"/>
<ButtonRText Enable="1" Text="OK"/>
<Script>engine.SetLineText(1,"撤去外力，按下内侧开关")
engine.SetLineText(2,"#L=行李箱是否开启".."#R=bmpeye")
#PRESSBUTTON</Script></Activity>
<Activity id="999" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="110" top="164" right="210" bottom="196"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="建立通讯"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
<assessment block="1" ptbtext="DEP164" group="3030" pbltext="DEP211" no="20" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="1000" ActivityType="3" flags="1" name="普通节点">
<Rect left="110" top="224" right="210" bottom="256"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>if(engine.LastError ~= 0 ) then 
engine.SetLineText(1,"与ECU通讯失败")
engine.Delay(1000)
engine.TestResult=1;
return "";
end </Script><assessment no="20" name="DEP200" type="8" flags="97"/>
</Activity>
<Activity id="1001" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="1240" top="764" right="1340" bottom="796"/>
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
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="999" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="7" type="0">
</Transition>
<Transition StartId="7" EndId="8" type="0">
</Transition>
<Transition StartId="8" EndId="935" type="0">
</Transition>
<Transition StartId="935" EndId="936" type="0">
</Transition>
<Transition StartId="936" EndId="937" type="0">
</Transition>
<Transition StartId="937" EndId="938" type="0">
</Transition>
<Transition StartId="938" EndId="939" type="0">
</Transition>
<Transition StartId="939" EndId="940" type="0">
</Transition>
<Transition StartId="940" EndId="943" type="0">
</Transition>
<Transition StartId="941" EndId="942" type="0">
</Transition>
<Transition StartId="942" EndId="5" type="0">
</Transition>
<Transition StartId="943" EndId="941" type="1">
<Expression>FinishFlag_3 == false or FinishFlag_2 == false or FinishFlag_1 == false</Expression></Transition>
<Transition StartId="943" EndId="944" type="0">
</Transition>
<Transition StartId="944" EndId="946" type="0">
</Transition>
<Transition StartId="945" EndId="947" type="0">
</Transition>
<Transition StartId="946" EndId="945" type="0">
</Transition>
<Transition StartId="947" EndId="948" type="0">
</Transition>
<Transition StartId="948" EndId="949" type="0">
</Transition>
<Transition StartId="949" EndId="950" type="0">
</Transition>
<Transition StartId="950" EndId="951" type="0">
</Transition>
<Transition StartId="951" EndId="952" type="0">
</Transition>
<Transition StartId="952" EndId="953" type="0">
</Transition>
<Transition StartId="953" EndId="955" type="0">
</Transition>
<Transition StartId="954" EndId="958" type="0">
</Transition>
<Transition StartId="955" EndId="956" type="1">
<Expression>FinishFlag_2 == false or FinishFlag_1 == false</Expression></Transition>
<Transition StartId="955" EndId="961" type="0">
</Transition>
<Transition StartId="956" EndId="957" type="0">
</Transition>
<Transition StartId="957" EndId="947" type="0">
</Transition>
<Transition StartId="958" EndId="959" type="0">
</Transition>
<Transition StartId="959" EndId="960" type="0">
</Transition>
<Transition StartId="960" EndId="964" type="0">
</Transition>
<Transition StartId="961" EndId="962" type="0">
</Transition>
<Transition StartId="962" EndId="963" type="0">
</Transition>
<Transition StartId="963" EndId="954" type="0">
</Transition>
<Transition StartId="964" EndId="965" type="0">
</Transition>
<Transition StartId="965" EndId="966" type="0">
</Transition>
<Transition StartId="966" EndId="968" type="0">
</Transition>
<Transition StartId="968" EndId="969" type="1">
<Expression>FinishFlag_2 == false or FinishFlag_1 == false</Expression></Transition>
<Transition StartId="968" EndId="998" type="0">
</Transition>
<Transition StartId="969" EndId="970" type="0">
</Transition>
<Transition StartId="970" EndId="958" type="0">
</Transition>
<Transition StartId="971" EndId="973" type="0">
</Transition>
<Transition StartId="973" EndId="974" type="0">
</Transition>
<Transition StartId="974" EndId="975" type="0">
</Transition>
<Transition StartId="975" EndId="976" type="0">
</Transition>
<Transition StartId="976" EndId="977" type="0">
</Transition>
<Transition StartId="977" EndId="978" type="0">
</Transition>
<Transition StartId="978" EndId="979" type="0">
</Transition>
<Transition StartId="979" EndId="980" type="0">
</Transition>
<Transition StartId="980" EndId="981" type="0">
</Transition>
<Transition StartId="981" EndId="982" type="0">
</Transition>
<Transition StartId="982" EndId="983" type="1">
<Expression>FinishFlag_2 == false or FinishFlag_1 == false</Expression></Transition>
<Transition StartId="982" EndId="985" type="0">
</Transition>
<Transition StartId="983" EndId="984" type="0">
</Transition>
<Transition StartId="984" EndId="976" type="0">
</Transition>
<Transition StartId="985" EndId="995" type="0">
</Transition>
<Transition StartId="986" EndId="987" type="0">
</Transition>
<Transition StartId="987" EndId="988" type="0">
</Transition>
<Transition StartId="988" EndId="989" type="0">
</Transition>
<Transition StartId="989" EndId="990" type="0">
</Transition>
<Transition StartId="990" EndId="991" type="0">
</Transition>
<Transition StartId="991" EndId="992" type="0">
</Transition>
<Transition StartId="992" EndId="993" type="1">
<Expression>FinishFlag_2 == false or FinishFlag_1 == false</Expression></Transition>
<Transition StartId="992" EndId="997" type="0">
</Transition>
<Transition StartId="993" EndId="994" type="0">
</Transition>
<Transition StartId="994" EndId="986" type="0">
</Transition>
<Transition StartId="995" EndId="996" type="0">
</Transition>
<Transition StartId="996" EndId="994" type="0">
</Transition>
<Transition StartId="997" EndId="1001" type="0">
</Transition>
<Transition StartId="998" EndId="971" type="0">
</Transition>
<Transition StartId="999" EndId="1000" type="0">
</Transition>
<Transition StartId="1000" EndId="5" type="0">
</Transition>
<Transition StartId="1001" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

