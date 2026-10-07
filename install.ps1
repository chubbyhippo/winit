Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force

# debloat
git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
rm -fo -r Win11Debloat

# winget
runas.exe /user:$(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName) "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/winget/refs/heads/main/install.ps1 | Invoke-Expression\""

# scoop
runas.exe /user:$(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName) "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/scoop/refs/heads/main/install.ps1 | Invoke-Expression\""

# setup autohotkey
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/chubbyhippo/ahk/master/remap.ahk" -OutFile "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/chubbyhippo/ahk/master/xcape.ahk" -OutFile "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\xcape.ahk"

# ideavim
Invoke-WebRequest -Uri https://raw.githubusercontent.com/chubbyhippo/ideavimrc/main/.ideavimrc -OutFile $Home\.ideavimrc

# vscode setup
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/code-settings/main/install.ps1| Invoke-Expression

# allow running unsigned scripts 
Set-ExecutionPolicy RemoteSigned
