try{
    Invoke-Expression (Invoke-RestMethod 'https://community.chocolatey.org/install.ps1')
}
catch{
    exit 1
}
finally{
    exit 0
}


