$scritpChoco = '.\install_choco.ps1'
$scritpPrograms = '.\install_programs.ps1'

$return = iex $scritpChoco
echo $return 

$return = iex $scritpPrograms
echo $return 