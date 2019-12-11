<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Parameters>
<Variable id="vciHandle" type="8" dir="0" data=""/>
</Parameters>
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="210" top="14" right="310" bottom="46"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="210" top="424" right="310" bottom="456"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="普通节点">
<Rect left="210" top="184" right="310" bottom="216"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>engine.SetLineText(1,"手动按上倾开关")
#COMMEX vciHandle -1 0x22 "\x3C\xC0"
recvTel = @0-;
if(engine.LastError == 0 ) then 
  if(string.byte(recvTel,4)==0x01) then 
  engine.SetLineText(2,"#L=开关状态".."#R=bmpok")
  else
   engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
   engine.LastError = 1
   end 
else
 engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
end 

engine.StatValue =  LibGeneral.hex2str(recvTel)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="29" name="DEP2155" type="8" flags="97"/>
</Activity>
<Activity id="4" ActivityType="3" flags="0" name="普通节点">
<Rect left="210" top="114" right="310" bottom="146"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>engine.SetLineText(1,"手动按下倾开关")
#COMMEX vciHandle -1 0x22 "\x3C\xC1"
recvTel = @0-;
if(engine.LastError == 0 ) then 
  if(string.byte(recvTel,4)==0x01) then 
  engine.SetLineText(2,"#L=开关状态".."#R=bmpok")
  else
   engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
   engine.LastError = 1;
   end
else
 engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
end 

engine.StatValue =  LibGeneral.hex2str(recvTel)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="30" name="DEP2156" type="8" flags="97"/>
</Activity>
<Activity id="5" ActivityType="3" flags="0" name="普通节点">
<Rect left="210" top="264" right="310" bottom="296"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>engine.SetLineText(1,"手动按缩短开关")
#COMMEX vciHandle -1 0x22 "\x3C\xC2"
recvTel = @0-;
if(engine.LastError == 0 ) then 
  if(string.byte(recvTel,4)==0x01) then 
  engine.SetLineText(2,"#L=开关状态".."#R=bmpok")
  else
   engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
   engine.LastError = 1;
  end
else
 engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
end 

engine.StatValue =  LibGeneral.hex2str(recvTel)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="31" name="DEP2157" type="8" flags="97"/>
</Activity>
<Activity id="6" ActivityType="3" flags="1" name="普通节点">
<Rect left="210" top="344" right="310" bottom="376"/>
<Strategy TotalTime="200" NokTime="0" RetryTimeOut="20" DelayTime="100"/>
<Line1Text Enable="1"/>
<Line4Text Enable="1"/>
<InputText Enable="1"/>
<Script>engine.SetLineText(1,"手动按伸长开关")
#COMMEX vciHandle -1 0x22 "\x3C\xC3"
recvTel = @0-;
if(engine.LastError == 0 ) then 
  if(string.byte(recvTel,4)==0x01) then 
  engine.SetLineText(2,"#L=开关状态".."#R=bmpok")
  else
   engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
   engine.LastError = 1;
   end
else
 engine.SetLineText(2,"#L=开关状态".."#R=bmpnok")
end 

engine.StatValue =  LibGeneral.hex2str(recvTel)</Script><assessment block="1" ptbtext="DEP164" group="3024" pbltext="DEP205" no="32" name="DEP2158" type="8" flags="97"/>
</Activity>
</Activities>
<Transitions>
<Transition StartId="1" EndId="4" type="0">
</Transition>
<Transition StartId="3" EndId="5" type="0">
</Transition>
<Transition StartId="4" EndId="3" type="0">
</Transition>
<Transition StartId="5" EndId="6" type="0">
</Transition>
<Transition StartId="6" EndId="2" type="0">
</Transition>
</Transitions>
</Process>

