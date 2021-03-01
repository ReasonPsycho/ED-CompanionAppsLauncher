#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ShortcutFolderPath := A_ScriptDir . "\" . "ShortcutsToLaunch" ; Folder in which shortcust should be luanched.
ExeName := "EDLaunch.exe" ; Name of game launcher;

try{ ; Try to open game launcher.
	Run, %A_ScriptDir%\true_%ExeName% ; True game launcher should be under true_ + ExeName
}catch e{
	MsgBox, Couldn't open! true_%ExeName% ; Show an error.
	ExitApp ; Exit app 'couse there is no point in opening other apps
}

Loop, Files, %ShortcutFolderPath%\*.url ; Loop throught all the url files in ShortcutsToLaunch folder
{
	try{  ; Try to run url file.
		Run, %A_LoopFileFullPath%
	}catch e{
		FileAppend,%A_Now%`n%e%`n, %ShortcutFolderPath%\ErrorLog.txt ; Save an error to txt file, saved in ShortcutsToLaunch folder.
	}
}

Loop, Files, %ShortcutFolderPath%\*.lnk ; Loop throught all the lnk files in ShortcutsToLaunch folder
{
	try{ ; Try to run lnk file.
		Run, %A_LoopFileFullPath%
	}catch e{
		FileAppend, %A_Now%`n%e%`n, %ShortcutFolderPath%\ErrorLog.txt  ; Save an error to txt file, saved in ShortcutsToLaunch folder.
	}
}


ExitApp