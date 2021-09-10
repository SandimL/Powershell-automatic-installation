Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI"

Install-Module oh-my-posh

Set-PoshPrompt -Theme material