#z::
SetFormat, Integer, H
WinID:=WinActive("A")
ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0) 
InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt") 
Clipboard:=InputLocaleID
MsgBox, %InputLocaleID%
return
