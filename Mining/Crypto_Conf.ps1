### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure CGMiner#>

Write-Host ""
Write-Host " --- Crypto Configuration --- "
Write-Host ""

while ($Completed -ne "OK") {
write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host 1 - [BTC] "Bitcoin" -ForegroundColor Yellow -BackgroundColor Black
Write-Host 2 - [LTC] "Litecoin"-ForegroundColor Yellow -BackgroundColor Black
Write-Host 3 - [ZEC] "Zcash"-ForegroundColor Yellow -BackgroundColor Black
Write-Host 4 - [XMR] "Monero"-ForegroundColor Yellow -BackgroundColor Black
Write-Host 5 - [ETH] "Etherium"-ForegroundColor Yellow -BackgroundColor Black
Write-Host R - "Return" 
Write-Host ""

write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    1 { $Action = "Bitcoin"}
    2 { $Action = "LiteCoin"}
    3 { $Action = "Zcash"}
    4 { $Action = "Monero"}
    5 { $Action = "Etherium"}
    R { $Action = "Return"}
}

if ($Download -eq "Return") { 
    .\InMyMine.ps1
    exit}

    if ($Action -eq "Bitcoin"){
        if (-not (Test-Path ".\Config\BTC_config.ini")) {
                New-Item -Path ".\Config\" -Name "BTC_config.ini" -Force
                } Else {
                    Remove-item -Path ".\Config\BTC_config.ini" -ItemType file -Force
                    New-Item -Path ".\Config\" -Name "BTC_config.ini" -ItemType file -Force
                }
                if (-not (Test-Path ".\Config\BTC_config.bat")) {
                    New-Item -Path ".\Config\" -Name "BTC_config.bat" -Force
                    } Else {
                        Remove-item -Path ".\Config\BTC_config.bat" -ItemType file -Force
                        New-Item -Path ".\Config\" -Name "BTC_config.bat" -ItemType file -Force
                    }
    
                Write-Host ""
                write-host "Configuration BiteCoin" -ForegroundColor Green -BackgroundColor Black
                write-host "Before configuration you need"
                write-host "- Create an BTC wallet"
                write-host "- Register Slushpool account : " -NoNewLine 
                write-host "https://slushpool.com/" -ForegroundColor Green -BackgroundColor Black
                Write-Host ""
    
                $BTCUser = Read-Host "User.Worker "
    
                ADD-Content -Path ".\Config\CGminer_BTC_config.ini" -Value ".\Soft\CGminer3.7.2\cgminer -o stratum+tcp://eu.stratum.slushpool.com:3333 -u $BTCUser -p x"
                ADD-Content -Path ".\Config\CGminer_BTC_config.bat" -Value ".\Soft\CGminer3.7.2\cgminer -o stratum+tcp://eu.stratum.slushpool.com:3333 -u $BTCUser -p x"
           
                $Startup = Read-Host "Add to Startup ? [Y/N] "
                $Confsetup = ".\Config\BTC_config.bat"
                if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}
           
            }

if ($Action -eq "LiteCoin"){
    if (-not (Test-Path ".\Config\LTC_config.ini")) {
            New-Item -Path ".\Config\" -Name "LTC_config.ini" -Force
            } Else {
                Remove-item -Path ".\Config\LTC_config.ini" -ItemType file -Force
                New-Item -Path ".\Config\" -Name "LTC_config.ini" -ItemType file -Force
            }
            if (-not (Test-Path ".\Config\LTC_Miner.bat")) {
                New-Item -Path ".\Config\" -Name "LTC_Miner.bat" -Force
                } Else {
                    Remove-item -Path ".\Config\LTC_Miner.bat" -ItemType file -Force
                    New-Item -Path ".\Config\" -Name "LTC_Miner.bat" -ItemType file -Force
                }

            Write-Host ""
            write-host "Configuration Litecoin" -ForegroundColor Green -BackgroundColor Black
            write-host "Before configuration you need"
            write-host "- Create an LTC wallet"
            write-host "- Register Litecoinpool account : " -NoNewLine 
            write-host "https://www.litecoinpool.org" -ForegroundColor Green -BackgroundColor Black
            Write-Host ""

            $LTCUser = Read-Host "User.Worker "
            $LTCPass = Read-Host "WorkerPass "
            $a = ":"

            ADD-Content -Path ".\Config\LTC_config.ini" -Value ".\Soft\CPUminer2.5.0\minerd.exe --url=stratum+tcp://litecoinpool.org:3333 --userpass=$LTCUser$a$LTCPass"
            ADD-Content -Path ".\Config\LTC_Miner.bat" -Value ".\Soft\CPUminer2.5.0\minerd.exe --url=stratum+tcp://litecoinpool.org:3333 --userpass=$LTCUser$a$LTCPass"

            $Startup = Read-Host "Add to Startup ? [Y/N] "
            $Confsetup = ".\Config\LTC_Miner.bat"
            if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}

        }


if ($Action -eq "Zcash"){
    if (-not (Test-Path ".\Config\ZEC_config.ini")) {
        New-Item -Path ".\Config\" -Name "ZEC_config.ini" -Force
        } Else {
            Remove-item -Path ".\Config\ZEC_config.ini" -ItemType file -Force
            New-Item -Path ".\Config\" -Name "ZEC_config.ini" -ItemType file -Force
        }
        if (-not (Test-Path ".\Config\ZEC_config.bat")) {
            New-Item -Path ".\Config\" -Name "ZEC_config.bat" -Force
            } Else {
                Remove-item -Path ".\Config\ZEC_config.bat" -ItemType file -Force
                New-Item -Path ".\Config\" -Name "ZEC_config.bat" -ItemType file -Force
            }

        Write-Host ""
        write-host "Configuration Zcash" -ForegroundColor Green -BackgroundColor Black
        write-host "Before configuration you need to create an ZEC wallet" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""

        $ZECWallet = Read-Host "Monero Wallet : "
        $RigName = Read-Host "RigName : "
        $Mail = Read-Host "Mail : "

        ADD-Content -Path ".\Config\ZEC_config.ini" -Value ".\Soft\ZecMiner0.3.4b\miner --server zec-eu1.nanopool.org --user $ZECWallet.$RigName/$Mail --pass z --port 6666"
        ADD-Content -Path ".\Config\ZEC_config.bat" -Value ".\Soft\ZecMiner0.3.4b\miner --server zec-eu1.nanopool.org --user $ZECWallet.$RigName/$Mail --pass z --port 6666"

        Write-Host "In few minutes you can check your mining here : " -NoNewLine
        Write-Host "https://xmr.nanopool.org/account/$ZECWallet" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""

        $Startup = Read-Host "Add to Startup ? [Y/N] "
        $Confsetup = ".\Config\ZEC_config.bat"
        if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}

    }

if ($Action -eq "Monero"){
    
        if (-not (Test-Path ".\Config\XMR_config.ini")) {
        New-Item -Path ".\Config\" -Name "XMR_config.ini" -Force
        } Else {
            Remove-item -Path ".\Config\XMR_config.ini" -ItemType file -Force
            New-Item -Path ".\Config\" -Name "XMR_config.ini" -ItemType file -Force
        }
    
        write-host "Configuration Monero" -ForegroundColor Green -BackgroundColor Black
        write-host "Before configuration you need to create an XMR wallet" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""
    
        $XMRWallet = Read-Host "Monero Wallet "
        $RigName = Read-Host "RigName "
        $Mail = Read-Host "Mail "
        
        Write-Host ""
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "wallet=$XMR"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "algorithm=Cryptonightv8"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "coin=XMR"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "rigName=$RigName"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "email=$mail"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool1 = xmr-eu1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool2 = xmr-eu2.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool3 = xmr-us-east1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool4 = xmr-us-west1.nanopool.org:14444"
        ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"

        Write-Host "In few minutes you can check your mining here : " -NoNewLine
        Write-Host "https://xmr.nanopool.org/account/$XMRWallet" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""

        if (-not (Test-Path ".\Config\XMR_config.bat")) {
            New-Item -Path ".\Config\" -Name "XMR_config.bat" -Force
            } Else {
                Remove-item -Path ".\Config\XMR_config.bat" -ItemType file -Force
                New-Item -Path ".\Config\" -Name "XMR_config.bat" -ItemType file -Force
            }

        ADD-Content -Path ".\Config\XMR_config.bat" -Value ".\Soft\nanominer-windows-1.2.4\nanominer.exe"
        $Startup = Read-Host "Add to Startup ? [Y/N] "
        $Confsetup = ".\Config\XMR_config.bat"
        if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}
    }


if ($Action -eq "Etherium"){
    
    if (-not (Test-Path ".\Config\ETH_config.ini")) {
    New-Item -Path ".\Config\" -Name "ETH_config.ini" -Force
    } Else {
        Remove-item -Path ".\Config\ETH_config.ini" -ItemType file -Force
        New-Item -Path ".\Config\" -Name "ETH_config.ini" -ItemType file -Force
    }

    write-host "Configuration Etherium" -ForegroundColor Green -BackgroundColor Black
    write-host "Before configuration you need to create an ETH wallet" -ForegroundColor Green -BackgroundColor Black
    Write-Host ""

    $ETHWallet = Read-Host "Etherium Wallet "
    $RigName = Read-Host "RigName "
    $Mail = Read-Host "Mail "
    
    Write-Host ""
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
    Write-Host "In few minutes you can check your mining here : " -NoNewLine
    Write-Host "https://eth.nanopool.org/account/$ETHWallet" -ForegroundColor Green -BackgroundColor Black
    Write-Host ""

    if (-not (Test-Path ".\Config\ETH_config.bat")) {
        New-Item -Path ".\Config\" -Name "ETH_config.bat" -Force
        } Else {
            Remove-item -Path ".\Config\ETH_config.bat" -ItemType file -Force
            New-Item -Path ".\Config\" -Name "ETH_config.bat" -ItemType file -Force
        }

    ADD-Content -Path ".\Config\ETH_config.bat" -Value ".\Soft\nanominer-windows-1.2.4\nanominer.exe"
    $Startup = Read-Host "Add to Startup ? [Y/N] "
    $Confsetup = ".\Config\ETH_config.bat"
    if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}

}

}