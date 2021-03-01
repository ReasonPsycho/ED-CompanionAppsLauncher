#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ShortcutFolderPath := A_ScriptDir . "\" . "ShortcutsToLaunch"
SteamDefaultPath := "C:\Program Files (x86)\Steam\steamapps\common\Elite Dangerous\"
ExeName := "EDLaunch.exe"

if (!FileExist(A_ScriptDir . "\CompanionAppsLauncher.exe")){ ; Check if CompanionAppsLauncher.exe exists if not exit app.
    MsgBox, Couldn't find CompanionAppsLauncher.exe
    ExitApp
}

if (!FileExist(A_ScriptDir . "\UnistallCompanionAppsLauncher.exe")){ ; Check if UnistallCompanionAppsLauncher.exe exists if not warn user.
    MsgBox, Couldn't find UnistallCompanionAppsLauncher
}

if (!InStr(FileExist(ShortcutFolderPath), "D")){ ; Check if ShortcutFolder exists if not just create one.
    FileCreateDir,  Couldn't find  ShortcutFolder
}

if (InStr(FileExist(SteamDefaultPath), "D")) { ; Check if SteamDefaultPath dir exists.
    if (FileExist(SteamDefaultPath . ExeName)) { ; Check if EDLaunch.exe dir exists.
       
    }else{
        MsgBox, Couldn't find EDLaunch.exe
        ExitApp
    }
    FileMove, %SteamDefaultPath%%ExeName%, %SteamDefaultPath%true_%ExeName% ,0 ; Change EDLaunch.exe name to true_EDLaunch.exe
    FileCopy, %A_ScriptDir%\CompanionAppsLauncher.exe,  %SteamDefaultPath%%ExeName%, 1 ; Copy CompanionAppsLauncher to SteamDefaultPath and change its name with EDLaunch.exe
    FileCopy, %A_ScriptDir%\UnistallCompanionAppsLauncher.exe,  %SteamDefaultPath%UnistallCompanionAppsLauncher.exe, 1 ; Copy UnistallCompanionAppsLauncher to SteamDefaultPath
    FileCopyDir, %ShortcutFolderPath%, %SteamDefaultPath%\ShortcutsToLaunch, 1 ; Copy ShortcutsToLaunch to SteamDefaultPath

    if (ErrorLevel){ ; Chceck if there was an error during insatation.
        MsgBox, There was an error during instalation!
        Run, explore %SteamDefaultPath%\ShortcutsToLaunch
    }else{
        MsgBox, Instalation was succesfull.
        Run, explore %SteamDefaultPath%\ShortcutsToLaunch
    }
}Else{
    MsgBox, Couldn't find ED default instalation path
}

ExitApp