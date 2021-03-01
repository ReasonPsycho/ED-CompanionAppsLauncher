#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ShortcutFolderPath := A_ScriptDir . "\" . "ShortcutsToLaunch"
SteamDefaultPath := "C:\Program Files (x86)\Steam\steamapps\common\Elite Dangerous\"
ExeName := "EDLaunch.exe"

FileRemoveDir,  %ShortcutFolderPath%, 1
FileMove, %A_ScriptDir%\true_%ExeName%, %A_ScriptDir%\%ExeName% ,1

if (ErrorLevel){
    MsgBox, There was an error during uninstalation!
}else{
    MsgBox, Uninstalation was succesfull.
}

FileDelete, %A_ScriptDir%\%A_ScriptName%
ExitApp
