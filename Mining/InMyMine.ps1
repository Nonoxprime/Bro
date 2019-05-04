### By Nox Prime for Gameoverblog.fr ###
### 1.45.19 ###

### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

### HOW I CAN RUN THIS SCRIPT ###
<#
Create a folder named Nox_Script
Copy scripts inside this folder
Open Powershell
Use this command to go in your folder : cd C:/Nox_Script
Run this : Set-ExecutionPolicy Bypass -Scope Process
Validate script execution with O (Oui) or Y (Yes)
Enjoy
#>

Set-ExecutionPolicy Bypass -Scope Process

### Directory Creation ###
if (-not (Test-Path ".\Config")) {New-Item -Path ".\" -Name "Config" -ItemType Directory -force}
if (-not (Test-Path ".\Soft")) {New-Item -Path ".\" -Name "Soft" -ItemType Directory -force}

### Default config Creation ###
## Configuraiton for Litecoin
if (-not (Test-Path ".\Config\Userconfig.conf")) {
    New-Item -Path ".\Config\" -Name "Userconfig.conf" -ItemType file -force
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Config File]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1.45.19"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Mining Pool]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "stratum+tcp://litecoinpool.org:3333"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[User.worker]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "Nox81.guest"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[WorkerPassword]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1"
    write-host ""
}

##Configuration for Monero
if (-not (Test-Path ".\Config\XMR_config.ini")) {
New-Item -Path ".\Config\" -Name "XMR_config.ini" -ItemType file -Force
$Random = Get-Random
ADD-Content -Path ".\Config\XMR_config.ini" -Value "wallet=4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "algorithm=Cryptonightv8"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "coin=XMR"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "rigName=$Random"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "email=Contact@gameoverblog.fr"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool1 = xmr-eu1.nanopool.org:14444"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool2 = xmr-eu2.nanopool.org:14444"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool3 = xmr-us-east1.nanopool.org:14444"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool4 = xmr-us-west1.nanopool.org:14444"
ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"}




while ($Start -ne "y"){

Write-Host ""
Write-Host " --- Mining ToolBag --- "
Write-Host "Tool Version 1.45.19"
Write-Host ""

write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host [D] "Download Mining Client" -ForegroundColor Yellow -BackgroundColor Black
Write-Host [S] "Setup and generate Config File"-ForegroundColor Yellow -BackgroundColor Black
Write-Host [C] "Check Your System"-ForegroundColor Yellow -BackgroundColor Black
Write-Host [0]" Donation (only 1hour CGminer For Dev)"
Write-Host ""
write-host "Work" -ForegroundColor Green -BackgroundColor Black
Write-Host [5]" - Start CPU Mining (CPUminer)"
Write-Host [6]" - Start GPU Mining (CGminer)"
Write-Host [7]" - Start Moonlander Mining (BFGminer Moonlander 2 Edition)"
Write-Host [8]" - Start 2Pac Mining (CGminer 2Pac Edition)"
Write-Host [9]" - Monero Mining (Nanominer)"

Write-Host [Q] - "Quit" 
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
    A { $Action = "Automation"}
    

    5 { $Action = "StartCPU"}
    6 { $Action = "StartGPU"}
    7 { $Action = "Moonlander"}
    8 { $Action = "2Pac"}
    9 { $Action = "Nanominer"}
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

### Start Work ###    
if ($Action -eq "StartCPU"){
    write-host "Start CPUminer Job"
    Write-Host ""
    start-process -filepath .\Config\_Start_CPUMINER.bat
}

if ($Action -eq "StartGPU"){
    write-host "Start CGminer Job"
    Write-Host ""
    start-process -filepath .\Config\_Start_CGMINER.bat
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

if ($Action -eq "Nanominer"){
    write-host "Start Nanominer Job"
    Write-Host ""
    cd .\Soft\nanominer-windows-1.2.4\
    Start-Process .\nanominer.exe
    cd ..
    cd ..
}

if ($Action -eq "Quit"){exit}

}