### By Nox Prime for Gameoverblog.fr ###
### 1.0112.19 ###
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
Copy InMyMine.ps1 inside this folder
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

while ($Start -ne "y"){

Write-Host ""
Write-Host " --- Mining ToolBag --- "
Write-Host "Tool Version 1.0111.19"
Write-Host ""

write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host [D] "Download Mining Client" -ForegroundColor Yellow -BackgroundColor Black
Write-Host [S] "Setup and generate Config File"-ForegroundColor Yellow -BackgroundColor Black
Write-Host [C] "Check Your System"-ForegroundColor Yellow -BackgroundColor Black
Write-Host ""
write-host "Work" -ForegroundColor Green -BackgroundColor Black
Write-Host [6]" - Start CPU Mining (CPUminer)"
Write-Host [7]" - Start GPU Mining (CGminer)"
Write-Host [8]" - Start Moonlander 2 Mining (BFGminer)"
Write-Host [9]" - Monero Mining (Finminer)"
Write-Host [Q] - "Quit" 
Write-Host ""

write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    D { $Action = "Download"}
    S { $Action = "Configuration"}
    C { $Action = "Check"}
    

    6 { $Action = "StartCPU"}
    7 { $Action = "StartGPU"}
    8 { $Action = "Moonlander"}
    9 { $Action = "FinMiner"}
    Q { $Action = "Quit"}
}

### Go To Download Script ###
if ($Action -eq "Download"){
    .\Download.ps1
    exit}

### Go To config Script ###
if ($Action -eq "Configuration") {
    .\Configuration.ps1
    exit}

### Go To System Check
if ($Action -eq "Check") {
    .\System_Check.ps1
    exit}

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

if ($Action -eq "FinMiner"){
    write-host "Start FinMiner Job"
    Write-Host ""
    cd .\Soft\FinMiner-windows-2.4.7\
    Start-Process .\finminer.exe
    cd ..
    cd ..
}

if ($Action -eq "Quit"){exit}

}