Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force

# debloat
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))

# scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
runas.exe /user:$(Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName) "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/scoop/refs/heads/main/install.ps1 | Invoke-Expression\""
