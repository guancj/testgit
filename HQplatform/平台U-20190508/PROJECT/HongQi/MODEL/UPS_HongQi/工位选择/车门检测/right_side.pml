<?xml version="1.0" encoding="utf-8" ?>
<Process flags="1">
<Start id="1" ActivityType="1" flags="0" name="开始节点">
<Rect left="575" top="16" right="675" bottom="48"/>
<Script></Script></Start>
<End id="2" ActivityType="2" flags="0" name="结束节点">
<Rect left="576" top="438" right="676" bottom="470"/>
<Script></Script></End>
<Activities>
<Activity id="3" ActivityType="3" flags="0" name="IntSetValue_DTimeOut">
<Rect left="575" top="77" right="675" bottom="109"/>
<TitleText Enable="1" Text="Door righe side test"/>
<Script></Script></Activity>
<Activity id="4" ActivityType="3" flags="0" name="普通节点">
<Rect left="575" top="144" right="675" bottom="176"/>
<Line1Text Enable="1" Text="开始检测"/>
<Line2Text Enable="1" Text="#L=OK？#R=BMPEYE"/>
<Script></Script></Activity>
</Activities>
<Transitions>
</Transitions>
</Process>

