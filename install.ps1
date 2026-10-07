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

# vscode setup
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/code-settings/main/install.ps1| Invoke-Expression

# allow running unsigned scripts 
Set-ExecutionPolicy RemoteSigned
