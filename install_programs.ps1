$program_list = @('telegram', 'gsudo','steam', 'git', 'winrar', '032920923trtes')
$program_finded = @()
$program_n_finded = @()
$continue = ''

foreach($i in $program_list){
    $result = choco find $i
    if($result.Length -gt 2){
        $program_finded += $i
    }else{
        echo "Não foi possível encontrar o pacote: " $i
        $program_n_finded += $i
    }
}

if($program_n_finded -gt 0){
    echo 'Falha ao encontrar o(s) pacote(s): '$program_n_finded
    $continue = Read-Host -Prompt 'Deseja continuar? [y - to yes] / [n - to no]' 
}

if($continue -eq 'y' -or $continue -eq ''){
    echo 'Lista de pacotes encontrados: '$program_finded

    echo (choco install $program_finded -y --acceptlicense --force)

    $colItems = Get-WmiObject Win32_Process -Filter "Name='powershell.exe' AND CommandLine LIKE '%choco install%'"
    echo $colItems

}
else{
    echo "Verifique a lista de pacotes e tente novamente"
}
