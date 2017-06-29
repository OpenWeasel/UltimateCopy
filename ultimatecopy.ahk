Loop{
; Run, notepad "C:\Program Files\UltimateCopy\ultimatecopy.txt"
KeyWait, Control
KeyWait, c
copybreak:
FileDelete,%A_AppData%\ultimatecopy.txt
FileAppend,%Clipboard%,%A_AppData%\ultimatecopy.txt
Run, notepad %A_AppData%\ultimatecopy.txt
; Each array must be initialized before use:
  Array := Object()

; Array%j% := A_LoopField
  Array[j] := A_LoopField

; Array%j%_%k% := A_LoopReadLine
  Array[j, k] := A_LoopReadLine

  ArrayCount := 0                        
  Loop, Read, %A_AppData%\ultimatecopy.txt
  {
      ArrayCount += 1
    ; Array%ArrayCount% := A_LoopReadLine
      Array[ArrayCount] := A_LoopReadLine
  }

  Loop %ArrayCount%
  {
    ; element := Array%A_Index%
      element := Array[A_Index]
    ; MsgBox % "Element number " . A_Index . " is " . Array%A_Index%
    ;  MsgBox % "Element number " . A_Index . " is " . Array[A_Index]
  }

Loop %ArrayCount%
{


KeyWait, F12, D
Send % Array[A_Index]
Send {Enter}


}
MsgBox % "Clipboard has been emptied!"
}