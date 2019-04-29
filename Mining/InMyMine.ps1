### By Nox Prime for Gameoverblog.fr ###
### 1.0213.19 ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : MQQVGFmm5poyeQLxLycmDLvNGCtsXXUTDB
### BTC : 34Zg1fvPjxhNTSsWs9KJMX7iBMR85dHu73
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
Then after run this commande : .\Sources_Mining.Ps1
Enjoy
#>
Set-ExecutionPolicy Bypass -Scope Process

### Directory Creation ###
if (-not (Test-Path ".\Config")) {New-Item -Path ".\" -Name "Config" -ItemType Directory -force}
if (-not (Test-Path ".\Soft")) {New-Item -Path ".\" -Name "Soft" -ItemType Directory -force}

### Default config ###
if (-not (Test-Path ".\Config\Userconfig.conf")) {
    New-Item -Path ".\Config\" -Name "Userconfig.conf" -ItemType file -force
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Config File]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1.0213.19"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Mining Pool]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "stratum+tcp://litecoinpool.org:3333"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[User.worker]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "Nox81.guest"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[WorkerPassword]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1"
    write-host ""
}

if (-not (Test-Path ".\Config\XMR_config.ini")) {
New-Item -Path ".\Config\" -Name "XMR_config.ini" -ItemType file -Force
$Random = Get-Random
ADD-Content -Path ".\Config\XMR_config.ini" -Value "wallet=41qxwkdHtMBHN7P8qAKptN6gQkZAUvY6AMtymXhVYH2j13Hxb9LEX1RCKE3Hr852RDGPUwe7xF8uf3iK75c3PZYt6d4KnUo"
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
Write-Host "Tool Version 1.0213.19"
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
    if (-not (Test-Path ".\Soft\CGminer3.7.2")) {New-Item -Path ".\Soft\" -Name "CGminer3.7.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\Soft\CGminer3.7.2\Cgminer.zip"
    expand-archive -path '.\Soft\CGminer3.7.2\Cgminer.zip' -destinationpath '.\Soft\CGminer3.7.2\' -Force
    Remove-Item .\Soft\CGminer3.7.2\Cgminer.zip -Force
    }else{
    remove-item ".\Soft\CGminer3.7.2\" -Force -Recurse
    New-Item -Path ".\Soft\" -Name "CGminer3.7.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\Soft\CGminer3.7.2\Cgminer.zip"
    expand-archive -path '.\Soft\CGminer3.7.2\Cgminer.zip' -destinationpath '.\Soft\CGminer3.7.2\' -Force
    Remove-Item .\Soft\CGminer3.7.2\Cgminer.zip -Force
    }
    if (-not (Test-Path ".\Config\_Start_CGMINER.bat")) {
        New-Item -Path ".\Config\" -Name "_Start_CGMINER.bat" -ItemType file -force
        $escape = ":"
        $Confsetup= ".\Config\_Start_CGMINER.bat"
        ADD-content -path $Confsetup -value ".\Soft\CGminer3.7.2\cgminer -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1"
    }Else{
        Remove-Item -Force -Recurse ".\Config\_Start_Donation.bat"
        New-Item -Path ".\Config\" -Name "_Start_Donation.bat" -ItemType file
        $escape = ":"
        $Confsetup= ".\Config\_Start_Donation.bat"    
        ADD-content -path $Confsetup -value ".\Soft\CGminer3.7.2\cgminer -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1"
        }
    
    start-process -filepath .\Config\_Start_CGMINER.bat
$Donation = 0
write-host "Donation Time (1Hour) : " -NoNewline
    while($Donation -ne "3061"){
        start-sleep -s 1
        write-host "$Donation " -ForegroundColor Green -BackgroundColor Black -NoNewline
        $Donation ++
    }
stop-Process -name cgminer
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