<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Variables>
<Variable id="ProtocolType" type="3" data="1" description="通讯协议"/>
<Variable id="ProtocolPort" type="3" data="0" description="接口号"/>
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
<Variable id="CAN_SND_ID" type="3" data="0" description="CANId"/>
<Variable id="CAN_RCV_ID" type="3" data="0" description="CANId"/>
<Variable id="PrtHeadString" type="8" data="" description="打印标题"/>
</Variables>
<Start id="0" ActivityType="1" flags="0" name="开始节点">
<Rect left="56" top="84" right="156" bottom="116"/>
<Script></Script></Start>
<End id="1" ActivityType="2" flags="0" name="结束节点">
<Rect left="55" top="232" right="155" bottom="264"/>
<Script></Script></End>
<Activities>
<Activity id="2" ActivityType="3" flags="0" name="倒计时">
<Rect left="392" top="155" right="492" bottom="187"/>
<Script>delay_time=10;
text_line=2;
time_interval=1000;
for i=delay_time,1,-1 do
engine.SetLineText(text_line,"倒计时"..i.."s");
#DELAY time_interval
end
</Script></Activity>
<Activity id="3" ActivityType="3" flags="0" name="正计时">
<Rect left="248" top="179" right="348" bottom="211"/>
<Script>delay_time=10;
text_line=2;
time_interval=1000;

for i=1,delay_time,1 do
engine.SetLineText(text_line,"计时"..i.."s");
#DELAY time_interval
end
</Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="循环判断">
<Rect left="417" top="103" right="517" bottom="135"/>
<Script>OKcount=0;
for i=1,10,1 do

--J71R51 SCBS标靶中心反射板反面
#IDTCOMM 2000 0x05 0x07 0x51 0x03
#DELAY 1000
 if(@2==0x21) then
   OKcount=OKcount+1;
 end
engine.SetLineText(2,"成功次数"..OKcount);

 
end</Script></Activity>
<Activity id="5" ActivityType="3" flags="0" name="OK次数循环">
<Rect left="433" top="46" right="533" bottom="78"/>
<Script>OKcount=0;
for i=1,10,1 do
#COMM 0x22 0xD9 0x17
#DELAY 1000
 if(@4==0x01) then
   OKcount=OKcount+1;
 end
engine.SetLineText(2,"成功次数"..OKcount);
 --if(OKcount==6) then
  --break;
 --end
#DELAY 2000
 
end</Script></Activity>
<Activity id="6" ActivityType="3" flags="0" name="NOK和OK次数">
<Rect left="264" top="111" right="364" bottom="143"/>
<Script>OKcount=0;
NOKcount=0;
for i=1,10,1 do
#COMM 0x22 0xD9 0x17
engine.SaveResultComm();
 if(@0==0x72) then
   OKcount=OKcount+1;
 else
   NOKcount=NOKcount+1;
 end
engine.SetLineText(2,"距离成功次数"..OKcount);
engine.SetLineText(3,"距离NOK次数"..NOKcount);
 if(OKcount==6 or  NOKcount==5) then
  break;
 end
#DELAY 1000
 
end</Script></Activity>
<Activity id="8" ActivityType="3" flags="0" name="新版OK循环">
<Rect left="277" top="248" right="377" bottom="280"/>
<Strategy TotalTime="15" ExpectedTime="5" NokTime="0" RetryTimeOut="6" DelayTime="100"/>
<Line1Text Enable="1" Text="loop界面"/>
<Script>#COMM 0x22 0xD9 0x17
if (@0==0x12) then
  engine.LastError = 0;
  --OK=OK+1;
  engine.SetLineText(2,"成功次数"..OK);
 engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end</Script></Activity>
<Activity id="11" ActivityType="3" flags="0" name="读取@0-@n">
<Rect left="203" top="56" right="303" bottom="88"/>
<Script>S2=get_comm_str(@1-@5,5)
engine.SetLineText(3,S2)
#PRESSBUTTON</Script></Activity>
<Activity id="12" ActivityType="3" flags="0" name="有符号计算">
<Rect left="229" top="309" right="329" bottom="341"/>
<Strategy TotalTime="20" ExpectedTime="5" NokTime="0" RetryTimeOut="15" DelayTime="100"/>
<Line4Text Enable="1"/>
<Script>#COMM 0x22 0x3f
if (@3&gt;= 128) then
	resu = (((@3* 256 + @4 - 32768)*0.04375) + 0.0) * (-1.0);
else
	resu = (((@3* 256 + @4)* 0.04375 ) + 0.0) * 1.0;
end
LeftSensor=resu;

if (1&lt;LeftSensor and LeftSensor&lt;300) then
  engine.LastError = 0;
  --OK=OK+1;
  --engine.SetLineText(2,"成功次数"..OK);
 --engine.println(" engine.LastError=".. engine.LastError);
else
  engine.LastError = 1;
  --NOK=NOK+1;
  --engine.SetLineText(3,"失败次数"..NOK);
end</Script></Activity>
<Activity id="13" ActivityType="3" flags="0" name="读当前状态">
<Rect left="579" top="65" right="679" bottom="97"/>
<Script>#COMM 0x22 0x01 0x11
flag_Result=@2;</Script></Activity>
<Activity id="14" ActivityType="3" flags="0" name="三判断读状态">
<Rect left="580" top="129" right="680" bottom="161"/>
<Strategy TotalTime="100" ExpectedTime="5" NokTime="0" RetryTimeOut="10" DelayTime="100"/>
<Script>#COMM 0x22 0x01 0x12
engine.SetLineText(3,flag_Result);
if(flag_Result==0)then
  Mult=1
  Smd=0
  UTG=0
  OTG=10
elseif(flag_Result==1)then
  Mult=1
  Smd=0
  UTG=0
  OTG=10
elseif(flag_Result==2)then
  Mult=1
  Smd=0
  UTG=0
  OTG=10
else
  break;
end
resu = (((@3 * 256 + @4) * Mult ) + Smd);

if( (UTG&lt;resu) and (resu&lt;OTG) )  then
   engine.LastError = 0;
else
   engine.LastError = 1;
end


</Script></Activity>
<Activity id="15" ActivityType="3" flags="0" name="安全访问alg1">
<Rect left="840" top="121" right="940" bottom="153"/>
<TitleText Enable="1" Text="安全访问"/>
<Script>--alg1安全访问
#COMM 0x22 0x01 0x00
#DELAY 50
str=@1..@2..@3..@4..@5;

engine.SetLineText(2,str);
out=Secure_compute1(str);
engine.println("first"..out)
engine.SetLineText(3,decstr(out));
engine.println("strOutCode = " .. hexstr(out));

key=hexstr(out);
#DELAY 500</Script></Activity>
<Activity id="16" ActivityType="3" flags="0" name="发送种子">
<Rect left="839" top="198" right="939" bottom="230"/>
<Script>#COMM 0x22 0x01 hex2dec(key,1) hex2dec(key,3) hex2dec(key,5)</Script></Activity>
<Activity id="17" ActivityType="3" flags="0" name="显示界面颜色">
<Rect left="456" top="229" right="556" bottom="261"/>
<TitleText Enable="1"/>
<Line1Text Enable="1"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<Line4Text Enable="1"/>
<Script>if (0 == engine.TestResult) then
  --OK
  engine.DialogBackColor = "Green";
else
  --NOK
  engine.DialogBackColor = "Red" ;--"Blue"  "Black" "Yellow"
end
</Script></Activity>
<Activity id="18" ActivityType="3" flags="0" name="检测失败">
<Rect left="121" top="150" right="221" bottom="182"/>
<Script>engine.TestResult = 1;</Script></Activity>
<Activity id="19" ActivityType="3" flags="0" name="统计">
<Rect left="577" top="227" right="677" bottom="259"/>
<Script> engine.StatText="EHPS 读助力泵转速";
   engine.StatValue=resu;
   engine.StatPoint=7000
     engine.StatLower=5650;
     engine.StatUpper=5950;</Script></Activity>
<Activity id="20" ActivityType="3" flags="0" name="眼睛界面变换">
<Rect left="413" top="291" right="513" bottom="323"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=请耐心等待10秒#R=BMPOK");
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=请耐心等待10秒#R=BMPNOK");
else
end</Script></Activity>
<Activity id="21" ActivityType="3" flags="0" name="眼睛变化">
<Rect left="683" top="234" right="783" bottom="266"/>
<Script>#PRESSBUTTON
if(engine.RButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPOK");
   engine.LastError = 0;
elseif(engine.LButtonPressed==true)then
   engine.SetLineText(1,"#L=化妆镜灯可以点亮吗？#R=BMPNOK");
   engine.LastError = 1;
else
end

#DELAY 500</Script></Activity>
<Activity id="22" ActivityType="3" flags="0" name="进度条">
<Rect left="550" top="282" right="650" bottom="314"/>
<Script>engine.SetLineText(3,"#L=BMPBAR,".."5650"..",".."5950"..",".."5"..","..tostring(resu));</Script></Activity>
<Activity id="23" ActivityType="3" flags="0" name="测试">
<Rect left="115" top="415" right="215" bottom="447"/>
<Script>#COMM 0x22 0x01 0x01

aa=bin2hex(@3-@4)
bb=bin2hex(@3)
cc=bin2hex(string.char(@3))
dd=bin2hex(@3-@3)

engine.println("aa"..aa)
engine.println("bb"..bb)
engine.println("cc"..cc)
engine.println("dd"..dd)</Script></Activity>
<Activity id="24" ActivityType="3" flags="0" name="等待20秒">
<Rect left="72" top="300" right="172" bottom="332"/>
<Line1Text Enable="1" Text="15秒后上电"/>
<Line2Text Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>for t=15,1,-1 do
engine.SetLineText(2,"倒计时"..t.."s");
#DELAY 1000
end</Script></Activity>
<Activity id="149" ActivityType="3" flags="0" name="请下电">
<Rect left="28" top="352" right="128" bottom="384"/>
<Line1Text Enable="1" Text="请确保下电"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<ButtonLText Enable="1" Text="放弃"/>
<ButtonRText Enable="1" Text="确认"/>
<Script>#PRESSBUTTON</Script></Activity>
<Activity id="150" ActivityType="3" flags="0" name="提示扫码-备份">
<Rect left="36" top="150" right="136" bottom="182"/>
<Line1Text Enable="1" Text="扫描VIN码"/>
<Line2Text Enable="1"/>
<Line3Text Enable="1"/>
<InputText Enable="1"/>
<ButtonLText Enable="1"/>
<ButtonRText Enable="1"/>
<Script>#INPUT engine.ResultVid
--engine.ResultVid="LFPH4BCN2G1L02257"
DString_Write_VIN=string.upper(engine.ResultVid)
engine.SetLineText(3,DString_Write_VIN);
engine.ResultVid=DString_Write_VIN;    
engine.KNR = string.sub(DString_Write_VIN,10)

engine.println("扫码:"..tostring(DString_Write_VIN));
engine.println("KNR:"..tostring(engine.KNR));
engine.Speak("扫码完成")
engine.println("扫码完成，提示音")

</Script></Activity>
</Activities>
<Transitions>
<Transition StartId="13" EndId="14" type="0">
</Transition>
<Transition StartId="15" EndId="16" type="0">
</Transition>
</Transitions>
</Process>

