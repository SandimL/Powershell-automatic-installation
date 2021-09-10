$listPath = 'programList.json'
$programs = (Get-Content -Raw -Path $listPath | ConvertFrom-Json).list
$listOk = @()
$someFailed = $false
$choice = $null


function startProccess{
    Write-Output "`nChecking packages...`n"
    foreach($i in $programs){
        $result = choco find $i
        if($result.Length -gt 2){
            $listOk = $listOk + $i
            $i + ' - ok'
        }else{
            $someFailed = $true
            $i + ' - failed'
        }
    }
    Write-Output "`n"

    if($someFailed){
        Write-Warning "Failed to find some packages"

        while ($choice -notmatch "[y|n]"){
            $choice = Read-Host "Wish to continue? (y/n):"
        }
    }

    $hasUserAccepted = $null -eq $continue -or $continue -eq 'y'

    if($hasUserAccepted){
        startInstallation
    }
    else{
        Write-Error "Verify your package list and try again"
    }
}


function progressBar{
    param($percent)
    Write-Progress -Activity 'Installation in progress' -PercentComplete $percent
}


function install{
    param($item)
    choco install $item -y --acceptlicense --force
}


function startInstallation{
    try{
        Write-Output "Starting installation `n"
        for ($i = 1; $i -le $listOk.length; $i++){
            progressBar(($i/$listOk.length*100))
            install($listOk[$i - 1])
        }
    }
    catch{
        Write-Error "Failure to install packages"
    }
}


startProccess