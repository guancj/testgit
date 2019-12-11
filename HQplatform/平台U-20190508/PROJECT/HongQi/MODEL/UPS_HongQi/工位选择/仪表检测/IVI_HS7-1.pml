<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1" block="1" ptbtext="DEP164" group="3033" pbltext="DEP1773">
<Parameters>
<Variable id="DString_C131_Partnumber_IVI" type="8" dir="0" data="DString_C131_Partnumber_IVI"/>
<Variable id="DString_C131_Car_Tpye" type="8" dir="0" data="DString_C131_Car_Tpye"/>
<Variable id="DString_Car_Tpye" type="8" dir="0" data=""/>
</Parameters>
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="物理通道"/>
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
<Variable id="CAN_SND_ID" type="3" data="0x770" description="CAN的发送ID"/>
<Variable id="CAN_RCV_ID" type="3" data="0x778" description="CAN的接收ID"/>
</Variables>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="280" top="44" right="380" bottom="76"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="280" top="654" right="380" bottom="686"/>
<Script>--engine.registerPacket(1,4000,0x7DF,"",0);

if( vciHandle == nil or vciHandle &lt; 0) then 
	engine.LastError = 1;
	engine.StatValue = "ECU Handle nil ";
	return 
else
	engine.EcuClose(vciHandle) ;
end
engine.ecu_CAN_control_2 = false;</Script><TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
</End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="(IVI)">
<Rect left="280" top="114" right="380" bottom="146"/>
<TitleText Enable="1" Text="IVI组合仪表"/>
<Script>--engine.yellow_power=false
engine.plc_test_finished=true
engine.ecu_CAN_control_1 = false
engine.Delay(100)
--engine.yellow_power=true
engine.ecu_CAN_control_2 = true;
engine.Delay(400)</Script></Activity>
<Activity id="4" ActivityType="13" flags="0" name="ECU_Open">
<Rect left="280" top="184" right="380" bottom="216"/>
<Line1Text Enable="1" Text="控制器通讯"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Open" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" ret="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="5" ActivityType="13" flags="0" name="StartDiagSession">
<Rect left="280" top="244" right="380" bottom="276"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x10"/>
<Parameter id="resTitle" value="0x50"/>
<Parameter id="sendTel" value="&apos;\x03&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="11" ActivityType="13" flags="0" name="ECU_Close">
<Rect left="70" top="184" right="170" bottom="216"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<FunctionRef id="ECU_Close" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="12" ActivityType="3" flags="0" name="重试？">
<Rect left="70" top="244" right="170" bottom="276"/>
<Line1Text Enable="1" Text="IVI 控制器连接失败！"/>
<Line2Text Enable="1" Text="#L=重试吗？#R=BMPEYE"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<ButtonLText Enable="1" Text="放弃连接"/>
<ButtonRText Enable="1" Text="重新连接"/>
<Script>#PRESSBUTTON
--flag = 0;
--repeat
--        if (engine.start_press == false ) then
--		flag = 1
 --       elseif (engine.stop_press == true) then
--		flag = 2
   --     else
--		flag = 0
  --      end
--until(flag ~= 0)
--engine.println("stop_press:"..tostring(engine.stop_press));
--engine.println("start_press:"..tostring(engine.start_press));
--engine.println("flag:"..tostring(flag));</Script></Activity>
<Activity id="14" ActivityType="13" flags="0" name="ECU_DataExchange">
<Rect left="280" top="304" right="380" bottom="336"/>
<Line1Text Enable="1" Text="清故障码"/>
<FunctionRef id="ECU_DataExchange" model="LibGeneral">
<Parameters>
<Parameter id="ECU_Handle" value="vciHandle"/>
<Parameter id="reqTitle" value="0x14"/>
<Parameter id="resTitle" value="0x54"/>
<Parameter id="sendTel" value="&apos;\xFF\xFF\xFF&apos;"/>
<Parameter id="recvTel" ret="DVciResult"/>
</Parameters>
</FunctionRef>
</Activity>
<Activity id="1109" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="200" top="414" right="300" bottom="446"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then   
    StandValue="0960r"
	    if(StandValue~="")then
		   DString1 = engine.GetResponseString(3,2+#StandValue)
		   engine.SetLineText(3,DString1);
		   engine.println("软件版本号:"..DString1)
			  if(StandValue == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对软件版本号成功"..DString1.."  "..StandValue);
				else
				 engine.LastError = 1;
				 engine.println("比对软件版本号失败"..DString1.."  "..StandValue);
			  end
		else
			engine.println("不比对软件版本号");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=StandValue;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
<Activity id="1129" ActivityType="3" flags="0" name="清除界面">
<Rect left="70" top="654" right="170" bottom="686"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script></Script></Activity>
<Activity id="1161" ActivityType="3" flags="0" name="延时100MS">
<Rect left="280" top="364" right="380" bottom="396"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="1165" ActivityType="3" flags="0" name="延时100MS">
<Rect left="280" top="474" right="380" bottom="506"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>#DELAY  100</Script></Activity>
<Activity id="1166" ActivityType="13" flags="0" name="读故障码">
<Rect left="280" top="534" right="380" bottom="566"/>
<Line1Text Enable="1"/>
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
<assessment no="18" name="DEP1853" type="8" flags="97"/>
</Activity>
<Activity id="1167" ActivityType="13" flags="0" name="过滤以及解释">
<Rect left="280" top="594" right="380" bottom="626"/>
<FunctionRef id="UDS_DTCFilterStatisticList" model="LibGeneral">
<Parameters>
<Parameter id="UDS_DTC_CODE" value="aDTC_Tab_pCode"/>
<Parameter id="Filter_Pcode" value="{&quot;B143DF1&quot;,&quot;B143CF1&quot;,&quot;B141F13&quot;,&quot;B141E13&quot;,&quot;B140D13&quot;,&quot;U014687&quot;,&quot;U02FA87&quot;,&quot;U123587&quot;,&quot;U125687&quot;,&quot;U016487&quot;,&quot;U118087&quot;,&quot;U114087&quot;,&quot;U114187&quot;,&quot;U120887&quot;,&quot;U114687&quot;,&quot;U115987&quot;,&quot;U118587&quot;,&quot;U112687&quot;,&quot;U119887&quot;,&quot;U123287&quot;,&quot;U015787&quot;,&quot;U124387&quot;,&quot;U123A87&quot;,&quot;U113887&quot;,&quot;B1430F0&quot;,&quot;B1430F0&quot;,&quot;B1431F0&quot;,&quot;B144015&quot;}"/>
<Parameter id="ViewList_Flag" value="false"/>
<Parameter id="Timeout" value="0"/>
<Parameter id="section" value="&quot;C079_IVI&quot;"/>
<Parameter id="DTC_Table_list_Pcode" ret="aPcode"/>
<Parameter id="DTC_Table_list_Pcode_String" ret="aPcode_String"/>
</Parameters>
</FunctionRef>
<assessment no="20" name="DEP2087" type="8" flags="97"/>
</Activity>
<Activity id="1168" ActivityType="3" flags="0" name="读软件版本号">
<Rect left="360" top="414" right="460" bottom="446"/>
<Line1Text Enable="1" Text="读软件版本号"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#COMMEX vciHandle -1 0x22 0xF1 0x95
if(@0==0x62)then
    StandValue="1600r"
    StandValue1="1700r"
	    if(StandValue~="")then
		   DString1 = engine.GetResponseString(3,2+#StandValue)
		   engine.SetLineText(3,DString1);
		   engine.println("软件版本号:"..DString1)
			  if(StandValue == DString1 or StandValue1 == DString1)then                                
				 engine.LastError = 0;
				 engine.println("比对软件版本号成功"..DString1.."  "..StandValue.."or"..StandValue1);
				else
				 engine.LastError = 1;
				 engine.println("比对软件版本号失败"..DString1.."  "..StandValue.."or"..StandValue1);
			  end
		else
			engine.println("不比对软件版本号");
                      DString1 = engine.GetResponseString(3,engine.GetResponseSize())
		end                 
	engine.StatValue=DString1;
	engine.StatPoint=StandValue.."or"..StandValue1;
else
	engine.LastError = 1;
	recvTel = @0-;
	if(recvTel ~= nil and @0 == 0x7F and #recvTel &gt;=3) then
		local tmpStatValue = LibGeneral.ECU_NegativeResponseValues(@2) ;
		engine.StatValue = "NegativeResponse : "..tostring(@2).." "..tostring(tmpStatValue);
	else
		engine.StatValue = "Lost Connection or time out ";
	end
end</Script><assessment no="10" name="DEP1783" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="4" type="0">
</Transition>
<Transition StartId="4" EndId="5" type="0">
</Transition>
<Transition StartId="5" EndId="14" type="0">
</Transition>
<Transition StartId="5" EndId="12" type="4">
</Transition>
<Transition StartId="11" EndId="4" type="0">
</Transition>
<Transition StartId="12" EndId="11" type="6">
</Transition>
<Transition StartId="12" EndId="1129" type="5">
</Transition>
<Transition StartId="14" EndId="1161" type="0">
</Transition>
<Transition StartId="1109" EndId="1165" type="0">
</Transition>
<Transition StartId="1129" EndId="2" type="0">
</Transition>
<Transition StartId="1161" EndId="1109" type="1">
<Expression>LibGeneral.CarTNC_HS7_C081(DString_Car_Tpye)</Expression></Transition>
<Transition StartId="1161" EndId="1168" type="0">
</Transition>
<Transition StartId="1165" EndId="1166" type="0">
</Transition>
<Transition StartId="1166" EndId="1167" type="0">
</Transition>
<Transition StartId="1167" EndId="2" type="0">
</Transition>
<Transition StartId="1168" EndId="1165" type="0">
</Transition>
</Transitions>
</Process>

