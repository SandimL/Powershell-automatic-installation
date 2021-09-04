try{
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
catch{
    exit 1
}
finally{
    exit 0
}


