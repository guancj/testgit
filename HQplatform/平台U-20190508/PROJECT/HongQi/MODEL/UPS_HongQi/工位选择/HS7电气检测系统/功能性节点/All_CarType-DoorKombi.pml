<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="DString_C131_Car_Tpye" type="8" dir="1" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="240" top="94" right="340" bottom="126"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="240" top="224" right="340" bottom="256"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="车型手动选择">
<Rect left="240" top="154" right="340" bottom="186"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>engine.ListClear();
engine.SelectLayout(1);

engine.ListAddString("CH1GM40",true);
engine.ListAddString("CH1GM41",false);
engine.ListAddString("CH1GM42",false);
engine.ListAddString("CH1AM46",false);
engine.ListAddString("CH1AM47",true);
engine.ListAddString("CH1AM48",false);
engine.ListAddString("CH1BM35",false);
engine.ListAddString("CH1CM32",false);
engine.ListAddString("CH1BM35",false);
engine.ListAddString("CH1CM32",false);
engine.ListAddString("CH1CM33",false);
engine.ListAddString("CH1MM41",false);
engine.ListAddString("CH1GM23",false);
engine.ListAddString("CH1GM30",false);

--HS7
engine.ListAddString("DAPNHACC0000",true);
engine.ListAddString("DAPNHACC0001",false);
engine.ListAddString("DAPMHACC0000",false);
engine.ListAddString("DAPMHACC0001",false);
engine.ListAddString("DAPYHACC0000",false);
engine.ListAddString("DAPYHACC0001",false);
engine.ListAddString("DAPSHACC0000",false);
engine.ListAddString("DAPSHACC0001",false);

--Hs7  20190507
engine.ListAddString("DAPNHACC0003",true);
engine.ListAddString("DAPNHACC0002",false);
engine.ListAddString("DAPMHACC0003",false);
engine.ListAddString("DAPMHACC0002",false);
engine.ListAddString("DAPYHACC0003",false);
engine.ListAddString("DAPYHACC0002",false);
engine.ListAddString("DAPSHACC0003",false);
engine.ListAddString("DAPSHACC0002",false);

--HS7 C081 20190909
engine.ListAddString("DAPFHACC0000",false);

--19年型
engine.ListAddString("CMNA02A",true);
engine.ListAddString("CMNA01A",false);
engine.ListAddString("CH1QM30",false);
engine.ListAddString("CH1QM40",false);
engine.ListAddString("CH1QM50",false);
engine.ListAddString("CNDA01A",false);
engine.ListAddString("CH1PM30",false);
engine.ListAddString("CH1PM20",false);

#INPUT  DString_C131_Car_Tpye
engine.CarType=DString_C131_Car_Tpye;
engine.SetLineText(3,DString_C131_Car_Tpye);
engine.println("手动选择车型:"..DString_C131_Car_Tpye);
engine.SelectLayout(0);
</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="3" type="0">
</Transition>
<Transition StartId="3" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

