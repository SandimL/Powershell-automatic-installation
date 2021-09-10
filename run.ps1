$installPrograms = '.\install_programs.ps1'
$customizePswh = '.\customize_pswh.ps1'

Invoke-Expression (Invoke-RestMethod 'https://community.chocolatey.org/install.ps1')

Invoke-Expression $installPrograms
<#Invoke-Expression $customizePswh#>
