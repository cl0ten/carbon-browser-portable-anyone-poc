$baseFolder = Split-Path $MyInvocation.MyCommand.Definition
Set-Location $baseFolder
$browserExe = Join-Path $baseFolder "..\browser.exe"
$shortcutName1 = "browser-with-proxy.lnk"
$shortcutPath1 = Join-Path $baseFolder $shortcutName1
$proxyServer = "socks5://127.0.0.1:9050"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut1 = $WScriptShell.CreateShortcut($shortcutPath1)
$Shortcut1.TargetPath = $browserExe
$Shortcut1.Arguments = "--incognito --proxy-server=$proxyServer https://carbon.website https://anyone.io https://check.en.anyone.tech https://browserleaks.com/ip"
$Shortcut1.WorkingDirectory = $baseFolder
$Shortcut1.IconLocation = $browserExe
$Shortcut1.Save()
$batFilePath = Join-Path $baseFolder "start_anon_carbon.bat"
$parentFolder = Split-Path $baseFolder -Parent
$shortcutName2 = "Carbon Anon Browser POC.lnk"
$shortcutPath2 = Join-Path $parentFolder $shortcutName2
$Shortcut2 = $WScriptShell.CreateShortcut($shortcutPath2)
$Shortcut2.TargetPath = $batFilePath
$Shortcut2.WorkingDirectory = $baseFolder
$Shortcut2.IconLocation = $browserExe
$Shortcut2.Save()
