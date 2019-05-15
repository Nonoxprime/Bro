Clear-Host

while ($Start -ne "y"){

Write-Host ""
Write-Host " --- Mining ToolBag --- "
Write-Host "Tool Version 1.515.19"
Write-Host ""

write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host [D] "Download Mining Client" -ForegroundColor Yellow -BackgroundColor Black
Write-Host [M] "Config"-ForegroundColor Yellow -BackgroundColor Black
Write-Host [C] "Check Your System"-ForegroundColor Yellow -BackgroundColor Black
Write-Host [0]" Donation (only 1hour CGminer For Dev)"
Write-Host ""
write-host "Rig Mining" -ForegroundColor Green -BackgroundColor Black
Write-Host [1]" ZEC Mining"
Write-Host [2]" LTC Mining"
Write-Host [3]" BTC Mining"
Write-Host [4]" XMR Mining"
Write-Host [5]" ETH Mining"
Write-Host ""
write-host "Specific Hardware" -ForegroundColor Green -BackgroundColor Black
Write-Host [8]" LTC Moonlander2"
Write-Host [9]" BTC GekkoScience 2Pac"
Write-Host ""
Write-Host [Q] "Quit" 
Write-Host ""

if ($Donation -eq 3601) {
    write-host "thanks you for your help" -Foregroundcolor Green -Backgroundcolor Black
}

Write-Host ""
write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    D { $Action = "Download"}
    S { $Action = "Configuration"}
    C { $Action = "Check"}
    M { $Action = "Crypto"}
    
    1 { $Action = "Zec"}
    2 { $Action = "LTC"}
    3 { $Action = "BTC"}
    4 { $Action = "XMR"}
    5 { $Action = "ETH"}


    8 { $Action = "Moonlander"}
    9 { $Action = "2Pac"}
    0 { $Action = "Donation"}

    Q { $Action = "Quit"}
}

### Go To Download Script ###
if ($Action -eq "Download"){
    .\Download.ps1
    exit}

### Donation Script ###    
if ($Action -eq "Donation"){
    .\Donation.ps1
    }

### Go To config Script ###
if ($Action -eq "Configuration") {
    .\Configuration.ps1
    exit}

### Go To System Check
if ($Action -eq "Check") {
    .\System_Check.ps1
    exit}

### Go To Crypto Script Config ###
if ($Action -eq "Crypto"){
    .\Crypto_Conf.ps1
    exit}


### Start Work ###    
if ($Action -eq "Zec"){
    write-host "Start Zecminer Job"
    Write-Host ""
    start-process -filepath .\Config\ZEC_config.bat
}

if ($Action -eq "LTC"){
    write-host "Start CPUminer Job"
    Write-Host ""
    start-process -filepath .\Config\LTC_Miner.bat
}

if ($Action -eq "BTC"){
    write-host "Start Bitcoin Mining Job"
    Write-Host ""
    start-process -filepath .\Config\BTC_Config.bat
}

if ($Action -eq "MoonLander"){
    write-host "Start Moonlander Job"
    Write-Host ""
    start-process -filepath .\Config\_start_BFGMINER_Moonlander-Edition.bat
}

if ($Action -eq "2Pac"){
    write-host "Start 2Pac Job"
    Write-Host ""
    start-process -filepath .\Config\_Start_CGMINER_Gekko2Pac.bat
}

if ($Action -eq "XMR"){
    write-host "Start Monero Mining Job"
    Write-Host ""
    remove-item .\Soft\nanominer-1.2.4\config.ini
    Copy-Item -Path ".\Config\XMR_config.ini" -Destination ".\Soft\nanominer-1.2.4\"
    Rename-Item -Path ".\Soft\nanominer-1.2.4\XMR_config.ini" -NewName "config.ini"
    start-process -filepath .\Config\XMR_config.bat
}

if ($Action -eq "ETH"){
    write-host "Start Etherium Mining Job"
    Write-Host ""
    remove-item .\Soft\nanominer-1.2.4\config.ini
    Copy-Item -Path ".\Config\ETH_config.ini" -Destination ".\Soft\nanominer-1.2.4\"
    Rename-Item -Path ".\Soft\nanominer-1.2.4\ETH_config.ini" -NewName "config.ini"
    start-process -filepath .\Config\ETH_config.bat
}


if ($Action -eq "Quit"){exit}

}