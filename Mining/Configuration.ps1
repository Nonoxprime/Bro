### Download Session ###

### By Nox Prime for Gameoverblog.fr ###
### Help me for a coffee/Vodka ... Both :) ?: 
### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

### Variables identification ###

$Version = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 1
$PoolMining = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 3
$PoolUser = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 5
$PoolPass = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 7

### Config Pool Acces ###
$Completed = "KO"
while ($Completed -ne "OK") {

    write-host "POOL CONFIGURATION" -ForegroundColor green -BackgroundColor Black
    write-host ""
    Write-host [1] "BTC Pool - BitCoin "-ForegroundColor yellow -BackgroundColor Black
    Write-host [2] "LTC Pool - LiteCoin "-ForegroundColor red -BackgroundColor Black
    Write-host [3] "XMR Pool - Monero " -ForegroundColor magenta -BackgroundColor Black
    Write-host [4] "ETH Pool - Etherium " -ForegroundColor magenta -BackgroundColor Black
    Write-host [G] "Generate config File" -ForegroundColor Blue -BackgroundColor Black
    Write-Host [Q] "Quit" -ForegroundColor magenta -BackgroundColor Black
    write-host ""

$Crypto = Read-host "What you want to mine ? "

### Completed or Exit ###
if ($Crypto -eq "Q") {exit}

### Go Generate.ps1
if ($Crypto -eq "G") {
    .\Generate.ps1 
    exit}

write-host ""
if ($Crypto -eq "1"){
    $Cryptoini = "KO"
    while ($Cryptoini -ne "Done") {
    write-host "BTC Pool Selector" -ForegroundColor Green -BackgroundColor Black
    Write-Host [1] " - SlushPool : stratum+tcp://stratum.slushpool.com:3333"
    Write-Host [2] " - AntPool : stratum+tcp://stratum.antpool.com:3333"
    Write-Host [3] " - Bitcoin Mining Merge Pool : stratum+tcp://mmpool.org:3334"
    Write-Host [C] " - Pool is not listed here" 
    Write-Host [R] " - No Change" -ForegroundColor magenta -BackgroundColor Black
    write-host ""

    $Pool = Read-Host "Your BTC Pool Choice "

    if ($Pool -eq "r") {
    $Pool = $PoolMining
    $Cryptoini = "Done"}

    if ($Pool -eq "1") {
    $Pool = "stratum+tcp://stratum.slushpool.com:3333"
    $Cryptoini = "Done"}

    if ($Pool -eq "2") {
    $Pool = "stratum+tcp://stratum.antpool.com:3333"
    $Cryptoini = "Done"}

    if ($Pool -eq "3") {
    $Pool = "stratum+tcp://mmpool.org:3334"
    $Cryptoini = "Done"}

    if ($Pool -eq "C") {
    $Pool = read-host "Your Custom Pool "
    $Cryptoini = "Done"}

    if ($Pool -eq $null) {
    $Pool = "stratum+tcp://stratum.slushpool.com:3333"
    $Cryptoini = "Done"}
    
    }
}

if ($Crypto -eq "2") { 

    $Cryptoini = "KO"
    while ($Cryptoini -ne "Done") {
    write-host "LTC Pool Selector" -ForegroundColor Green -BackgroundColor Black
    Write-Host [1] " - LiteCoin Pool : stratum+tcp://litecoinpool.org:3333"
    Write-Host [C] " - Pool is not listed here" 
    Write-Host [R] " - No Change" -ForegroundColor magenta -BackgroundColor Black
    write-host ""

    $Pool = Read-Host "Your LTC Pool Choice "

    if ($Pool -eq "r") {
    $Pool = $PoolMining
    $Cryptoini = "Done"}

    if ($Pool -eq "1") {
    $Pool = "stratum+tcp://litecoinpool.org:3333"
    $Cryptoini = "Done"}

    if ($Pool -eq "C") {
    $Pool = read-host "Your Custom Pool "
    $Cryptoini = "Done"}
    
    if ($Pool -eq $null) {
    $Pool = "stratum+tcp://litecoinpool.org:3333"
    $Cryptoini = "Done"}

    }
}

if ($Crypto -eq "3") { 
    $Cryptoini = "KO"
    while ($Cryptoini -ne "Done") {

    Write-host "XMR Pool Selector"-ForegroundColor yellow -BackgroundColor Black
    Write-Host [1] " Moneropool : mine.moneropool.com:7777 "
    Write-Host [2] " NanoPool : xmr.nanopool.org:14444"
    Write-Host [C] " - Pool is not listed here" 
    Write-Host [R] " - No Change" -ForegroundColor magenta -BackgroundColor Black
    write-host ""

    $Pool = Read-Host "Your Monero Pool Choice "

    if ($Pool -eq "1") {
        write-host ""
        remove-item ".\Config\XMR_config.ini"
        $XMRWallet = Read-host "Your Monero Wallet "
        $RigName = Read-host "Your Rig Name "
        $Mail = Read-host "Your mail "
        New-Item -Path ".\Config\" -Name "XMR_config.ini" -ItemType file -Force
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "wallet=$XMRWallet"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "algorithm=Cryptonightv8"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "coin=XMR"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "rigName=$RigName"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "email=$Mail"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool1 = mine.moneropool.com:7777"
        $Cryptoini = "Done"
        $Pool = "Set for Monero Mining - See XMR-Config.ini"    
        }

    if ($Pool -eq "2") {
        write-host ""
        $XMRWallet = Read-host "Your Monero Wallet "
        $RigName = Read-host "Your Rig Name "
        $Mail = Read-host "Your mail "
        remove-item ".\Config\XMR_config.ini"
        New-Item -Path ".\Config\" -Name "XMR_config.ini" -ItemType file -Force
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "wallet=$XMRWallet"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "algorithm=Cryptonightv8"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "coin=XMR"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "rigName=$RigName"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "email=$Mail"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool1 = xmr-eu1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool2 = xmr-eu2.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool3 = xmr-us-east1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool4 = xmr-us-west1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"
        $Cryptoini = "Done"
        $Pool = "Set for Monero Mining - See XMR-Config.ini"    
        }

    if ($Pool -eq "C") {
            $Pool = read-host "Your Custom Pool "
            $Cryptoini = "Done"
            $Pool = "Set for Monero Mining - See XMR-Config.ini"}

    if ($Pool -eq $null) {
        $Cryptoini = "Done"
        $Pool = "Set for Monero Mining - See XMR-Config.ini"}
   
    }
}

if ($Crypto -eq "4") { 
    $Cryptoini = "KO"
    while ($Cryptoini -ne "Done") {

    Write-host "ETH Pool Selector"-ForegroundColor yellow -BackgroundColor Black
    Write-Host [1] " NanoPool : eth.nanopool.org:9999"
    Write-Host [R] " - No Change" -ForegroundColor magenta -BackgroundColor Black
    write-host ""

    $Pool = Read-Host "Your choice ? "

    if ($Pool -eq "1") {
        write-host ""
        $ETHWallet = Read-host "Your ETH Wallet "
        $RigName = Read-host "Your Rig Name "
        $Mail = Read-host "Your mail "
        remove-item ".\Config\ETH_config.ini"
        New-Item -Path ".\Config\" -Name "ETH_config.ini" -ItemType file -Force
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "wallet=$ETHWallet"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "algorithm=Ethash"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "coin=ETH"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "rigName=$RigName"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "email=$Mail"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "pool1 = eth-eu1.nanopool.org:9999"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "pool2 = eth-eu2.nanopool.org:9999"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "pool3 = eth-us-east1.nanopool.org:9999"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "pool4 = eth-us-west1.nanopool.org:9999"
        ADD-Content -Path ".\Config\ETH_config.ini" -Value "pool5 = eth-asia1.nanopool.org:9999"
        $Cryptoini = "Done"
        $Pool = "Set for ETH Mining - See ETH-Config.ini"    
        }

    if ($Pool -eq "C") {
            $Pool = read-host "Your Custom Pool "
            $Cryptoini = "Done"
            $Pool = "Set for ETH Mining - See ETH-Config.ini"}

    if ($Pool -eq $null) {
        $Cryptoini = "Done"
        $Pool = "Set for ETH Mining - See ETH-Config.ini"}
   
    }
}

$PoolMining = $PoolMining.Replace("$PoolMining", "$Pool")

### Config USER Acces ###
    write-host ""
    write-host "USER POOL CONFIGURATION"-ForegroundColor green -BackgroundColor Black
    if ($Pool -eq "Set for ETH Mining - See ETH-Config.ini"){
        write-host "$pool"-ForegroundColor magenta -BackgroundColor Black
        $PUser = $Pool
        $PoolUser = $PoolUser.Replace("$PoolUser", "$PUser")
        start-sleep -s 2
    }
    
    else {$PUser = Read-Host "Pool User Like User.worker "
            if ($PUser -eq $null) {$PUser = "Nox81.guest"}
        $PoolUser = $PoolUser.Replace("$PoolUser", "$PUser")
        }

### Config Pool Pass ###
    write-host ""
    write-host "PASSWORD POOL CONFIGURATION"-ForegroundColor green -BackgroundColor Black
    if ($Pool -eq "Set for Monero Mining - See XMR-Config.ini"){
        write-host "$Pool"-ForegroundColor magenta -BackgroundColor Black
        $PPass = $Pool
        $PoolPass = $PoolPass.Replace("$PoolPass", "$PPass")
        start-sleep -s 2
    }
    else {
        $PPass = Read-Host "Worker Password "
            if ($PPass -eq $null) {$PPass = "1"}
        $PoolPass = $PoolPass.Replace("$PoolPass", "$PPass")
        }
if ($pool -ne "Set for Monero Mining - See XMR-Config.ini") {
    remove-item ".\Config\Userconfig.conf"
    New-Item -Path ".\Config\" -Name "Userconfig.conf" -ItemType file -Force
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Config File]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value $Version
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Mining Pool]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value $PoolMining
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[User.worker]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value $PoolUser
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[WorkerPassword]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value $PoolPass
    write-host ""
    }
    $Completed = "OK"
    $Action = "Generate"
}

### Generate config file ###
if ($Action -eq "Generate") {
    .\Generate.ps1
    exit}

.\InMyMine.ps1
exit