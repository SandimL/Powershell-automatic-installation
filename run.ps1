$installChoco = '.\install_choco.ps1'
$installPrograms = '.\install_programs.ps1'
$updateAndCustomizePswh = '.\update_and_customize_pswh.ps1'

Invoke-Expression $installChoco
Invoke-Expression $installPrograms
Invoke-Expression $updateAndCustomizePswh