global CurMode = normal
 
#IfWinActive  ahk_exe WindowsTerminal.exe
:*:o::
{
	sendinput,{o}
	if (%CurMode% = normal)
	{
		PostMessage, 0x50, 0, 0x8040804, , A
		CurMode = input
	}
}
return
#If
 
#IfWinActive  ahk_exe WindowsTerminal.exe
:*:a::
{
	sendinput,{a}
	if (%CurMode% = normal)
	{
		PostMessage, 0x50, 0, 0x8040804, , A
		CurMode = input
	}
}
return
#If
 
#IfWinActive  ahk_exe WindowsTerminal.exe
:*:i::
{
	sendinput,{i}
	if (%CurMode% = normal)
	{
		PostMessage, 0x50, 0, 0x8040804, , A
		CurMode = input
	}
}
return
#If
 
#IfWinActive  ahk_exe WindowsTerminal.exe
ESC::
{
	sendinput,{Esc}
	if (%CurMode% = input)
	{
		PostMessage, 0x50, 0, 0x4090409, , A
		CurMode = normal
	}
}
return
#If
