<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="Hndl" type="3" dir="0" data="-1"/>
<Variable id="FAScalibration" type="3" dir="0" data="0"/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="640" top="24" right="740" bottom="56"/>
<Script>engine.SharedVarSet("S0Az",0)
engine.SharedVarSet("S0EL",0)
engine.SharedVarSet("S1Az",0)
engine.SharedVarSet("S1EL",0)
engine.SharedVarSet("LED",0)</Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="960" top="1014" right="1060" bottom="1046"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="5" flags="0" name="IDT_Service_04">
<Rect left="640" top="104" right="740" bottom="136"/>
<SubProcesses>
<SubProcess id="IDT_Service_04">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="CalibFlag" value="FAScalibration"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="4" ActivityType="5" flags="0" name="IDT_Service_02">
<Rect left="960" top="894" right="1060" bottom="926"/>
<SubProcesses>
<SubProcess id="IDT_Service_02">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="5" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="640" top="244" right="740" bottom="276"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="6" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="960" top="784" right="1060" bottom="816"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="8" ActivityType="3" flags="0" name="退出">
<Rect left="800" top="74" right="900" bottom="106"/>
<Script>engine.println(" 04 &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="完成">
<Rect left="960" top="954" right="1060" bottom="986"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>engine.SharedVarSet("_ProcessOK",1)
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="35" ActivityType="3" flags="0" name="退出">
<Rect left="790" top="244" right="890" bottom="276"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; :15 service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="37" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="784" right="1210" bottom="816"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="38" ActivityType="3" flags="0" name="退出">
<Rect left="1120" top="954" right="1220" bottom="986"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="40" ActivityType="5" flags="0" name="IDT_Service_19">
<Rect left="960" top="184" right="1060" bottom="216"/>
<SubProcesses>
<SubProcess id="IDT_Service_19">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="41" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="184" right="1210" bottom="216"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="42" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="960" top="304" right="1060" bottom="336"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="43" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="304" right="1210" bottom="336"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="45" ActivityType="5" flags="0" name="IDT_Service_18">
<Rect left="960" top="714" right="1060" bottom="746"/>
<SubProcesses>
<SubProcess id="IDT_Service_18">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFCresult" value="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="46" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="714" right="1210" bottom="746"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="51" ActivityType="5" flags="0" name="IFC_Calibration">
<Rect left="960" top="634" right="1060" bottom="666"/>
<SubProcesses>
<SubProcess id="IFC_Calibration">
<Parameters>
<Parameter id="IFCresult" ret="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="57" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="640" top="464" right="740" bottom="496"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="59" ActivityType="3" flags="0" name="退出">
<Rect left="790" top="464" right="890" bottom="496"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 16 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="61" ActivityType="5" flags="0" name="IDT_Service_17">
<Rect left="960" top="434" right="1060" bottom="466"/>
<SubProcesses>
<SubProcess id="IDT_Service_17">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="62" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="434" right="1210" bottom="466"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 17 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="63" ActivityType="5" flags="0" name="IDT_Service_21">
<Rect left="960" top="494" right="1060" bottom="526"/>
<SubProcesses>
<SubProcess id="IDT_Service_21">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="64" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="494" right="1210" bottom="526"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="65" ActivityType="5" flags="0" name="BSDproMain">
<Rect left="960" top="364" right="1060" bottom="396"/>
<SubProcesses>
<SubProcess id="BSDproMain">
<Parameters>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="66" ActivityType="5" flags="0" name="IDT_Service_18">
<Rect left="640" top="384" right="740" bottom="416"/>
<SubProcesses>
<SubProcess id="IDT_Service_18">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFCresult" value="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="67" ActivityType="3" flags="0" name="退出">
<Rect left="790" top="384" right="890" bottom="416"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="68" ActivityType="5" flags="0" name="IFC_Calibration">
<Rect left="640" top="314" right="740" bottom="346"/>
<SubProcesses>
<SubProcess id="IFC_Calibration">
<Parameters>
<Parameter id="IFCresult" ret="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="73" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="90" top="194" right="190" bottom="226"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="74" ActivityType="5" flags="0" name="BSDproMain">
<Rect left="90" top="534" right="190" bottom="566"/>
<SubProcesses>
<SubProcess id="BSDproMain">
<Parameters>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="75" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="90" top="714" right="190" bottom="746"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="76" ActivityType="3" flags="0" name="退出">
<Rect left="230" top="714" right="330" bottom="746"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="77" ActivityType="5" flags="0" name="IDT_Service_17">
<Rect left="90" top="594" right="190" bottom="626"/>
<SubProcesses>
<SubProcess id="IDT_Service_17">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="78" ActivityType="3" flags="0" name="退出">
<Rect left="230" top="594" right="330" bottom="626"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 17 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="79" ActivityType="5" flags="0" name="IDT_Service_21">
<Rect left="90" top="654" right="190" bottom="686"/>
<SubProcesses>
<SubProcess id="IDT_Service_21">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="80" ActivityType="3" flags="0" name="退出">
<Rect left="230" top="654" right="330" bottom="686"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="82" ActivityType="3" flags="0" name="退出">
<Rect left="240" top="194" right="340" bottom="226"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; :15 service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="88" ActivityType="5" flags="0" name="IDT_Service_22">
<Rect left="90" top="404" right="190" bottom="436"/>
<SubProcesses>
<SubProcess id="IDT_Service_22">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="89" ActivityType="3" flags="0" name="退出">
<Rect left="220" top="404" right="320" bottom="436"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 22 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="94" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="370" top="234" right="470" bottom="266"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="95" ActivityType="3" flags="0" name="退出">
<Rect left="500" top="234" right="600" bottom="266"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; :15 service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="96" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="370" top="454" right="470" bottom="486"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="97" ActivityType="5" flags="0" name="IDT_Service_22">
<Rect left="370" top="374" right="470" bottom="406"/>
<SubProcesses>
<SubProcess id="IDT_Service_22">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="98" ActivityType="3" flags="0" name="退出">
<Rect left="500" top="374" right="600" bottom="406"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 22 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="99" ActivityType="3" flags="0" name="退出">
<Rect left="500" top="454" right="600" bottom="486"/>
<Script>engine.println(" 16&lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="100" ActivityType="3" flags="0" name="等待17s">
<Rect left="370" top="304" right="470" bottom="336"/>
<Script>local strTime = os.clock()
local endTime
while (true) do
	engine.Delay(1000)
        endTime = os.clock()
	engine.SetLineText(1,"请等待:".. (17 -math.floor(endTime - strTime)))
	if(math.floor(endTime - strTime) &gt; 17) then
		break
        end   
end</Script></Activity>
<Activity id="102" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="960" top="574" right="1060" bottom="606"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="103" ActivityType="3" flags="0" name="退出">
<Rect left="1110" top="574" right="1210" bottom="606"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="104" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="90" top="474" right="190" bottom="506"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="106" ActivityType="3" flags="0" name="倒车影像完成">
<Rect left="90" top="264" right="190" bottom="296"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="倒车影像是否完成？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON
</Script></Activity>
<Activity id="107" ActivityType="3" flags="0" name="退出">
<Rect left="220" top="474" right="320" bottom="506"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; :15 service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="108" ActivityType="5" flags="0" name="IDT_Service_19">
<Rect left="1290" top="174" right="1390" bottom="206"/>
<SubProcesses>
<SubProcess id="IDT_Service_19">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="109" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="174" right="1540" bottom="206"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="110" ActivityType="5" flags="0" name="IDT_Service_18">
<Rect left="1290" top="434" right="1390" bottom="466"/>
<SubProcesses>
<SubProcess id="IDT_Service_18">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFCresult" value="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="111" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="434" right="1540" bottom="466"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="112" ActivityType="5" flags="0" name="IFC_Calibration">
<Rect left="1290" top="304" right="1390" bottom="336"/>
<SubProcesses>
<SubProcess id="IFC_Calibration">
<Parameters>
<Parameter id="IFCresult" ret="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="113" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="1290" top="244" right="1390" bottom="276"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="114" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="244" right="1540" bottom="276"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="115" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="1290" top="514" right="1390" bottom="546"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="116" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="514" right="1540" bottom="546"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="117" ActivityType="5" flags="0" name="IDT_Service_17">
<Rect left="1290" top="664" right="1390" bottom="696"/>
<SubProcesses>
<SubProcess id="IDT_Service_17">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="118" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="664" right="1540" bottom="696"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 17 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="119" ActivityType="5" flags="0" name="IDT_Service_21">
<Rect left="1290" top="744" right="1390" bottom="776"/>
<SubProcesses>
<SubProcess id="IDT_Service_21">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="120" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="744" right="1540" bottom="776"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="121" ActivityType="5" flags="0" name="BSDproMain">
<Rect left="1290" top="594" right="1390" bottom="626"/>
<SubProcesses>
<SubProcess id="BSDproMain">
<Parameters>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="122" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="1290" top="814" right="1390" bottom="846"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="123" ActivityType="3" flags="0" name="退出">
<Rect left="1440" top="814" right="1540" bottom="846"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="124" ActivityType="5" flags="0" name="BSD_Wait">
<Rect left="90" top="334" right="190" bottom="366"/>
<SubProcesses>
<SubProcess id="BSD_Wait">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="125" ActivityType="5" flags="0" name="BSD_Wait">
<Rect left="1290" top="374" right="1390" bottom="406"/>
<SubProcesses>
<SubProcess id="BSD_Wait">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="126" ActivityType="5" flags="0" name="BSD_Wait">
<Rect left="520" top="64" right="620" bottom="96"/>
<SubProcesses>
<SubProcess id="BSD_Wait">
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="127" ActivityType="3" flags="0" name="HS7中PDC和IFC">
<Rect left="1600" top="144" right="1700" bottom="176"/>
<Script></Script></Activity>
<Activity id="128" ActivityType="5" flags="0" name="IDT_Service_19">
<Rect left="1710" top="214" right="1810" bottom="246"/>
<SubProcesses>
<SubProcess id="IDT_Service_19">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="129" ActivityType="3" flags="0" name="退出">
<Rect left="1830" top="214" right="1930" bottom="246"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="130" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="1710" top="284" right="1810" bottom="316"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="131" ActivityType="3" flags="0" name="退出">
<Rect left="1850" top="284" right="1950" bottom="316"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 21 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="132" ActivityType="3" flags="0" name="等待17s">
<Rect left="1600" top="644" right="1700" bottom="676"/>
<Script>local strTime = os.clock()
local endTime
while (true) do
	engine.Delay(1000)
        endTime = os.clock()
	engine.SetLineText(1,"请等待:".. (17 -math.floor(endTime - strTime)))
	if(math.floor(endTime - strTime) &gt; 17) then
		break
        end   
end</Script></Activity>
<Activity id="133" ActivityType="3" flags="0" name="倒车影像完成">
<Rect left="1710" top="344" right="1810" bottom="376"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="倒车影像是否完成？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>
#PRESSBUTTON
</Script></Activity>
<Activity id="134" ActivityType="5" flags="0" name="IFC_Calibration">
<Rect left="1600" top="574" right="1700" bottom="606"/>
<SubProcesses>
<SubProcess id="IFC_Calibration">
<Parameters>
<Parameter id="IFCresult" ret="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="135" ActivityType="5" flags="0" name="IDT_Service_16">
<Rect left="1600" top="794" right="1700" bottom="826"/>
<SubProcesses>
<SubProcess id="IDT_Service_16">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="136" ActivityType="3" flags="0" name="退出">
<Rect left="1750" top="794" right="1850" bottom="826"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 16 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="137" ActivityType="5" flags="0" name="IDT_Service_18">
<Rect left="1600" top="714" right="1700" bottom="746"/>
<SubProcesses>
<SubProcess id="IDT_Service_18">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
<Parameter id="IFCresult" value="IFCresult"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="138" ActivityType="3" flags="0" name="退出">
<Rect left="1750" top="714" right="1850" bottom="746"/>
<Script>engine.println(" &lt;TestProcess&gt; :Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="139" ActivityType="3" flags="0" name="将执行结束服务">
<Rect left="1720" top="1044" right="1820" bottom="1076"/>
<Script></Script></Activity>
<Activity id="140" ActivityType="5" flags="0" name="IDT_Service_22">
<Rect left="1710" top="424" right="1810" bottom="456"/>
<SubProcesses>
<SubProcess id="IDT_Service_22">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="141" ActivityType="3" flags="0" name="退出">
<Rect left="1850" top="424" right="1950" bottom="456"/>
<Script>engine.println(" BSD &lt;TestProcess&gt; : 22 Service Error")
engine.UdpHandleVarSet(Hndl, "_FINISHFLAG",true)</Script></Activity>
<Activity id="142" ActivityType="5" flags="0" name="IDT_Service_15">
<Rect left="1600" top="494" right="1700" bottom="526"/>
<SubProcesses>
<SubProcess id="IDT_Service_15">
<Parameters>
<Parameter id="Hndl" value="Hndl"/>
<Parameter id="isOK" ret="isOK"/>
</Parameters>
</SubProcess>
</SubProcesses>
</Activity>
<Activity id="143" ActivityType="3" flags="0" name="倒车影像完成">
<Rect left="1600" top="894" right="1700" bottom="926"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1" Text="倒车影像是否完成？"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>
#PRESSBUTTON
</Script></Activity>
<Activity id="144" ActivityType="4" flags="0" name="HS7 bsd_IFC">
<Rect left="444" top="44" right="476" bottom="76"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="108" type="1">
<Expression>FAScalibration == 3</Expression></Transition>
<Transition StartId="3" EndId="8" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="3" EndId="5" type="1">
<Expression>FAScalibration == 2</Expression></Transition>
<Transition StartId="3" EndId="73" type="1">
<Expression>FAScalibration == 4</Expression></Transition>
<Transition StartId="3" EndId="94" type="1">
<Expression>FAScalibration == 5</Expression></Transition>
<Transition StartId="3" EndId="127" type="1">
<Expression>FAScalibration == 6</Expression></Transition>
<Transition StartId="4" EndId="11" type="0">
</Transition>
<Transition StartId="4" EndId="38" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="5" EndId="35" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="5" EndId="68" type="0">
</Transition>
<Transition StartId="6" EndId="4" type="0">
</Transition>
<Transition StartId="6" EndId="37" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="11" EndId="2" type="0">
</Transition>
<Transition StartId="40" EndId="41" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="40" EndId="42" type="0">
</Transition>
<Transition StartId="42" EndId="43" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="42" EndId="65" type="0">
</Transition>
<Transition StartId="45" EndId="46" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="45" EndId="6" type="0">
</Transition>
<Transition StartId="51" EndId="45" type="0">
</Transition>
<Transition StartId="57" EndId="59" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="57" EndId="4" type="0">
</Transition>
<Transition StartId="61" EndId="62" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="61" EndId="63" type="0">
</Transition>
<Transition StartId="63" EndId="64" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="63" EndId="102" type="0">
</Transition>
<Transition StartId="65" EndId="61" type="0">
</Transition>
<Transition StartId="66" EndId="67" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="66" EndId="57" type="0">
</Transition>
<Transition StartId="68" EndId="66" type="0">
</Transition>
<Transition StartId="73" EndId="106" type="0">
</Transition>
<Transition StartId="73" EndId="82" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="74" EndId="77" type="0">
</Transition>
<Transition StartId="75" EndId="76" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="75" EndId="4" type="0">
</Transition>
<Transition StartId="77" EndId="78" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="77" EndId="79" type="0">
</Transition>
<Transition StartId="79" EndId="80" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="79" EndId="75" type="0">
</Transition>
<Transition StartId="88" EndId="89" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="88" EndId="104" type="0">
</Transition>
<Transition StartId="94" EndId="100" type="0">
</Transition>
<Transition StartId="94" EndId="95" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="96" EndId="99" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="96" EndId="4" type="0">
</Transition>
<Transition StartId="97" EndId="96" type="0">
</Transition>
<Transition StartId="97" EndId="98" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="100" EndId="97" type="0">
</Transition>
<Transition StartId="102" EndId="51" type="0">
</Transition>
<Transition StartId="102" EndId="103" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="104" EndId="74" type="0">
</Transition>
<Transition StartId="104" EndId="107" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="106" EndId="124" type="0">
</Transition>
<Transition StartId="108" EndId="109" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="108" EndId="113" type="0">
</Transition>
<Transition StartId="110" EndId="111" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="110" EndId="115" type="0">
</Transition>
<Transition StartId="112" EndId="125" type="0">
</Transition>
<Transition StartId="113" EndId="112" type="0">
</Transition>
<Transition StartId="113" EndId="114" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="115" EndId="116" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="115" EndId="121" type="0">
</Transition>
<Transition StartId="117" EndId="118" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="117" EndId="119" type="0">
</Transition>
<Transition StartId="119" EndId="120" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="119" EndId="122" type="0">
</Transition>
<Transition StartId="121" EndId="117" type="0">
</Transition>
<Transition StartId="122" EndId="123" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="122" EndId="4" type="0">
</Transition>
<Transition StartId="124" EndId="88" type="0">
</Transition>
<Transition StartId="125" EndId="110" type="0">
</Transition>
<Transition StartId="126" EndId="3" type="0">
</Transition>
<Transition StartId="127" EndId="142" type="0">
</Transition>
<Transition StartId="128" EndId="129" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="130" EndId="131" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="130" EndId="133" type="0">
</Transition>
<Transition StartId="132" EndId="137" type="0">
</Transition>
<Transition StartId="133" EndId="140" type="0">
</Transition>
<Transition StartId="134" EndId="132" type="0">
</Transition>
<Transition StartId="135" EndId="136" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="135" EndId="143" type="0">
</Transition>
<Transition StartId="137" EndId="138" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="137" EndId="135" type="0">
</Transition>
<Transition StartId="140" EndId="141" type="1">
<Expression>isOK == false</Expression></Transition>
<Transition StartId="140" EndId="142" type="0">
</Transition>
<Transition StartId="142" EndId="134" type="0">
</Transition>
<Transition StartId="143" EndId="4" type="0">
</Transition>
<Transition StartId="144" EndId="126" type="1">
<Expression>FAScalibration == 3</Expression></Transition>
</Transitions>
</Process>

