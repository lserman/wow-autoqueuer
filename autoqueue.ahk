#Persistent

SetTitleMatchMode, 1

Gui, +Owner
Gui, Add, Text,, What time do you want to queue?
Gui, Add, DateTime, vQueueAt, dddd MMMM d, yyyy hh:mm:ss tt
Gui, Add, Button, Default, Submit
Gui, Show,, AutoQueue
Return

ButtonSubmit:
Gui, Submit

; Get difference between queue time and current time
EnvSub, QueueAt, %A_Now%, Seconds

; Make sure user did not enter a time in the past
If (QueueAt < 0)
{
  Say("Please choose a time that is in the future.")
  Reload
}

; Set a timer to run Queue routine--value is negative so that the timer only runs once
SetTimer, Queue, % QueueAt * -1000
Say("Attempting to enter queue in " . QueueAt . " seconds. Leave the Battle.net launcher open with WoW selected while waiting to queue. This script will not attempt to open the launcher by itself.")
Return

Queue:
IfWinExist, Battle.net
{
  WinActivate, Battle.net

  ; Click PLAY button
  WinGetPos, X, Y, Width, Height, Battle.net
  PlayX := 300
  PlayY := Height - 70
  MsgBox, %PlayX% %PlayY%
  MouseClick, Left, %PlayX%, %PlayY%
}
else
{
  Say("Failed to queue- cannot find the launcher window.")
}
Return

Say(msg)
{
  MsgBox, 1, AutoQueue, % msg
}
