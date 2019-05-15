### Download Session ###

### By Nox Prime for Gameoverblog.fr ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : MQQVGFmm5poyeQLxLycmDLvNGCtsXXUTDB
### BTC : 34Zg1fvPjxhNTSsWs9KJMX7iBMR85dHu73
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

while ($Completed -ne "OK") {
    Write-Host ""
    Write-host "Download Software" -ForegroundColor Green -BackgroundColor Black
    Write-Host ""
    Write-Host [1] " - CPUMiner -- (CPU)"
    Write-Host [2] " - CGMiner -- (GPU)"
    write-Host [3] " - NanoMiner -- (GPU)"

    Write-Host [4] " - BFGMiner Moonlander 2 Edition -- (USB)"
    Write-Host [5] " - CGminer GekkoScience 2Pac Edition -- (USB)"
    
    Write-Host [6] " - ZecMiner -- (Zcash)"
    
    write-Host [R] " - Return"
    write-host ""
    $Download = read-host "Which Client do you want to install download ? "
    
    if ($Download -eq "1") { $Action = 'Download_CPUminer'}
    if ($Download -eq "2") { $Action = 'Download_CGminer'}
    if ($Download -eq "3") { $Action = 'Download_NanoMiner'}
    
    if ($Download -eq "4") { $Action = 'Download_Moonlander2'}
    if ($Download -eq "5") { $Action = 'Download_Gekko2pac'}
    
    if ($Download -eq "6") { $Action = 'Download_ZecMiner'}

        if ($Download -eq "R") { 
        .\InMyMine.ps1
        exit}
    
        if ($Download -eq $null) { 
        .\InMyMine.ps1
        exit}

if ($Action -eq "Download_CPUminer") {
    .\CPUminer.ps1
    }

if ($Action -eq "Download_CGminer") {
    .\CGminer.ps1
    }

if ($Action -eq "Download_NanoMiner"){
    .\Nanominer.ps1
    }

if ($Action -eq "Download_Moonlander2") {
    .\Moonlander2.ps1
    }

if ($Action -eq "Download_Gekko2pac") {
    .\Gekko2Pac.ps1
    }

if ($Action -eq "Download_ZecMiner") {
    .\ZecMiner.ps1
    }

}