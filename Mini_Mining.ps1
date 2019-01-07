### By Nox Prime for Gameoverblog.fr ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : MQQVGFmm5poyeQLxLycmDLvNGCtsXXUTDB
### BTC : 34Zg1fvPjxhNTSsWs9KJMX7iBMR85dHu73
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

Write-Host "This Script need to by run as admin"
Set-ExecutionPolicy Bypass -Scope Process

### Identification des variable ###
$Version = Get-Content -Path .\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 1
$PoolMining = Get-Content -Path .\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 3
$PoolUser = Get-Content -Path .\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 5
$PoolPass = Get-Content -Path .\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 7

while ($Start -ne "y"){

#### Check Files and Folder ####
clear-Host
if ($fail -eq "n"){Write-Host "Check system"  -ForegroundColor green -BackgroundColor Black}
else {Write-Host "Check system"  -ForegroundColor red -BackgroundColor Black}

### Check CPUMINER###
if (-not (Test-Path ".\CPUMINER2.5.0\minerd.exe")) {
    write-host "CPUMINER - System Check Failed : Missing CPUminer. Press '1' to download" -ForegroundColor red -BackgroundColor Black
$Fail1 = "y"
}
elseif (-not (Test-Path ".\_start_CPUMINER.bat")) {
    write-host "CPUMINER - System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black 
$Fail1 = "y"
}
else {write-host "CPUMINER - System Check done : ready to mine with your CPU" -ForegroundColor green -BackgroundColor Black
$Fail1 = "n"
}

### Check CGMINER ###
if (-not (Test-Path ".\CGMINER3.7.2\cgminer.exe")) {
            write-host "CGMINER - System Check Failed : Missing CGminer. Press '2' to download" -ForegroundColor red -BackgroundColor Black
$Fail2 = "y"    
}
elseif (-not (Test-Path ".\_start_CGMINER.bat")) {
            write-host "CGMINER - System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black 
$Fail2 = "y"
}
else {write-host "CGMINER - System Check done : ready to mine with your GPU" -ForegroundColor green -BackgroundColor Black
$Fail2 = "n"
}

### Check BFG MoonLanders USB ###
if (-not (Test-Path ".\BFGminer-5.4.2\bfgminer.exe")) {
    write-host "MoonLander 2 Scrypt - System Check Failed : Missing Drivers and BFGMiner. Press '3' to download" -ForegroundColor red -BackgroundColor Black
$Fail3 = "y"
}
elseif (-not (Test-Path ".\_start_BFGMINER_Moonlander-Edition.bat")) {
    write-host "MoonLander 2 Scrypt - System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black 
$Fail3 = "y"
}
else {write-host "MoonLander 2 Scrypt - System Check done : ready to mine with your Moonlander" -ForegroundColor green -BackgroundColor Black
$Fail3 = "n"
}

$Fail = $Fail1+$Fail2

if ($Fail = "nn") {$Fail = "n"}

Write-Host ""
Write-Host " --- Mini Mining --- "
Write-Host "Tool Version 1.0107.19"
Write-Host ""
Write-Host "News"  -ForegroundColor Green -BackgroundColor Black
Write-Host "Exe Convert"
Write-Host ""
write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host "Download" -ForegroundColor Yellow -BackgroundColor Black
Write-Host [1] " - CPU Miner -- CPUminer "
Write-Host [2] " - GPU Miner -- CGMiner "
Write-Host [3] " - Moonlander 2 -- Drivers and Soft (BFGMiner) "
Write-Host ""
write-host "Config" -ForegroundColor Green -BackgroundColor Black
Write-Host [4] " - Configuration "
Write-Host [5] " - Generate Config files "
Write-Host ""
write-host "Work" -ForegroundColor Green -BackgroundColor Black
Write-Host [7]" - Start CPU Mining (CPUminer)"
Write-Host [8]" - Start GPU Mining (CGminer)"
Write-Host [9]" - Start Moonlander 2 Mining (BFGminer)"
Write-Host [Q] - "Quit" 
Write-Host ""

write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    1 { $Action = 'Download_CPUminer'}
    2 { $Action = 'Download_CGminer'}
    3 { $Action = 'Download_Moonlander2'}

    4 { $Action = 'Configuration'}
    5 { $Action = 'Generate'}

    6 { $Action = 'StartCPU'}
    7 { $Action = 'StartGPU'}
    8 { $Action = 'Moonlander'}
	Q { $Action = 'Q'}
}

### Download Files
if ($Action -eq "Download_CPUminer") {
    write-host ""
    if (-not (Test-Path ".\CPUminer2.5.0")) {
        New-Item -Path ".\" -Name "CPUminer2.5.0" -ItemType directory -force
        }
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Cpuminer-2.5.0.zip" -OutFile ".\CPUminer2.5.0\Cpuminer.zip"
    expand-archive -path '.\CPUminer2.5.0\Cpuminer.zip' -destinationpath '.\CPUminer2.5.0\'
    Remove-Item .\CPUminer2.5.0\Cpuminer.zip
    New-Item -Path ".\" -Name "_Start_CPUMINER.bat" -ItemType file
    $escape = ":"
    $Confsetup= ".\_Start_CPUMINER.bat"
    ADD-content -path $Confsetup -value ".\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
    Write-host "Reloading Mini_Mining"
    start-sleep -s 2
    start-process .\Mini_Mining.exe
    exit
}

if ($Action -eq "Download_CGminer") {
    write-host ""
    if (-not (Test-Path ".\CGminer3.7.2")) {
        New-Item -Path ".\" -Name "CGminer3.7.2" -ItemType directory -force
        }
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\CGminer3.7.2\Cgminer.zip"
    expand-archive -path '.\CGminer3.7.2\Cgminer.zip' -destinationpath '.\CGminer3.7.2\'
    Remove-Item .\CGminer3.7.2\Cgminer.zip
    New-Item -Path ".\" -Name "_Start_CGMINER.bat" -ItemType file
    $Confsetup= ".\_Start_CGMINER.bat"
    ADD-content -path $Confsetup -value ".\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"
    Write-host "Reloading Mini_Mining"
    start-sleep -s 2
    start-process .\Mini_Mining.exe
    exit
}

if ($Action -eq "Download_Moonlander2") {
    write-host ""
    if (-not (Test-Path ".\BFGminer-5.4.2")) {
        New-Item -Path ".\" -Name "BFGminer-5.4.2" -ItemType directory -force
        }
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Moonlander2_Scrypt_bundle.zip" -OutFile ".\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip"
    expand-archive -path '.\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip' -destinationpath '.\BFGminer-5.4.2\'
    Remove-Item .\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip
    expand-archive -path '.\BFGminer-5.4.2\BFGminer-5.4.2.zip' -destinationpath '.\BFGminer-5.4.2\'
    Remove-Item .\BFGminer-5.4.2\BFGminer-5.4.2.zip
    expand-archive -path '.\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip' -destinationpath '.\BFGminer-5.4.2\'
    Remove-Item .\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip
    start-process -filepath .\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe
    New-Item -Path ".\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\BFGminer-5.4.2\bfgminer.exe --scrypt -o $Poolmining -u $PoolUser -p $PoolPass,d=128  -S MLD:all --set MLD:clock=660" 
    Write-host "Reloading Mini_Mining"
    start-sleep -s 2
    start-process .\Mini_Mining.exe
    exit
}

if ($Action -eq "Configuration") {

### Config Pool Acces ###
    write-host ""
    $Pool = Read-Host "Mining Pool Address - (Default: stratum+tcp://litecoinpool.org:3333) "
    if ($Pool -eq $null) {$Pool = "stratum+tcp://litecoinpool.org:3333"}
    $PoolMining = $PoolMining.Replace("$PoolMining", "$Pool")

### Config USER Acces ###
    write-host ""
    $PUser = Read-Host "Pool User Like User.worker - (Default: Nox81.guest) "
    if ($PUser -eq $null) {$PUser = "Nox81.guest"}
    $PoolUser = $PoolUser.Replace("$PoolUser", "$PUser")

### Config Pool Pass ###
    write-host ""
    $PPass = Read-Host "Worker Password (Default: What you want) "
    if ($PPass -eq $null) {$PPass = "1"}
    $PoolPass = $PoolPass.Replace("$PoolPass", "$PPass")
    
    remove-item ".\Userconfig.conf"
    New-Item -Path ".\" -Name "Userconfig.conf" -ItemType file
    ADD-Content -Path ".\Userconfig.conf" -Value "[Config File]"
    ADD-Content -Path ".\Userconfig.conf" -Value $Version
    ADD-Content -Path ".\Userconfig.conf" -Value "[Mining Pool]"
    ADD-Content -Path ".\Userconfig.conf" -Value $PoolMining
    ADD-Content -Path ".\Userconfig.conf" -Value "[User.worker]"
    ADD-Content -Path ".\Userconfig.conf" -Value $PoolUser
    ADD-Content -Path ".\Userconfig.conf" -Value "[WorkerPassword]"
    ADD-Content -Path ".\Userconfig.conf" -Value $PoolPass
    write-host ""
}

### Generate config file ###
if ($Action -eq "Generate") {
    
    write-host ""
    Write-host "Configuration File" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your Pool Mining set on : " -NoNewline 
    Write-host "$PoolMining" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your User and Worker set on : " -NoNewline 
    Write-host "$PoolUser" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your Pass for $PoolUser is set on :" -NoNewline 
    Write-host "$PoolPass" -ForegroundColor Green -BackgroundColor Black
    Write-host ""
    $Job = "Processing"

while ($Job -ne "d"){
    write-host "CONFIGURATION" -ForegroundColor Yellow -BackgroundColor Black
    if ($writeCPU -eq "y") {
                        write-host "CPUMINER - Configugartion  Saved" -ForegroundColor red -BackgroundColor Black
                        }
    if ($writeGPU -eq "y") {
                        write-host "CGMINER - Configugartion  Saved" -ForegroundColor red -BackgroundColor Black
                        }
    if ($Writemoon -eq "y") {
                        Write-Host "Moonlander Scrypt USB - config Saved" -ForegroundColor red -BackgroundColor Black
    }
    write-host ""
                        write-host "Menu" -ForegroundColor Green -BackgroundColor Black
                        Write-Host [1] "- Write CPUMINER Configuration (CPU)"
                        Write-Host [2] "- Write CGMINER Configuration (GPU)"
                        Write-Host [3] "- Write Moonlander 2 Configuration (USB)" 
                        Write-Host [R] - return
                        Write-host ""
                        $Job = read-host "Your Choice "

                    if ($Job -eq "1")   {
                        Write-Host ""
                        write-host "Writing _Start_CPUMINER.bat"           
                        Write-Host ""
                        if (-not (Test-Path ".\_start_CPUMINER.bat")) {
                        New-Item -Path ".\" -Name "_Start_CPUMINER.bat" -ItemType file
                        } else {
                            remove-item .\_start_CPUMINER.bat
                            New-Item -Path ".\" -Name "_Start_CPUMINER.bat" -ItemType file
                        }                         
                        Write-Host ""
                        $escape = ":"
                        $Confsetup= ".\_Start_CPUMINER.bat"
                        ADD-content -path $Confsetup -value ".\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
                        $writeCPU ="y"
                        $writeGPU ="n"
                        $Writemoon ="n"
                    }


                    if ($Job -eq "2")   {
                        Write-Host ""
                        write-host "Writing _Start_CGMINER.bat"           
                        Write-Host ""
                        if (-not (Test-Path ".\_start_CGMINER.bat")) {
                        New-Item -Path ".\" -Name "_Start_CGMINER.bat" -ItemType file
                        } else {
                            remove-item .\_Start_CGMINER.bat
                            New-Item -Path ".\" -Name "_Start_CGMINER.bat" -ItemType file
                        }                         
                        Write-Host ""
                        $Confsetup= ".\_Start_CGMINER.bat"
                        ADD-content -path $Confsetup -value ".\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"
                        $writeCPU ="n"
                        $writeGPU ="y"
                        $Writemoon ="n"
                    }

                    if ($Job -eq "3")   {
                        Write-Host ""
                        write-host "Writing _Start_BFGMINER_Moonlander-Edition.bat"           
                        Write-Host ""
                        
                        while ($pass -ne "ok") {
                            if ($pass -eq "no"){write-host "Warning Wrong value please choose a num between 600 and 660"  -ForegroundColor red -BackgroundColor Black}
                            write-host ""
                            $OC = read-host "MoonLander 2 Clock [600-660] "
                            if ($OC -ge 600 -and $OC -le 660){
                                write-host "You have set your Moonlander Clock at " -NoNewline
                                write-host "$OC" -ForegroundColor green -BackgroundColor Black
                                $Pass = "ok"
                            }
                            else {
                                Clear-Host
                                $pass = "no"

                                }
                            }

                        if (-not (Test-Path ".\_Start_BFGMINER_Moonlander-Edition.bat")) {
                        New-Item -Path ".\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
                        } else {
                            remove-item .\_Start_BFGMINER_Moonlander-Edition.bat
                            New-Item -Path ".\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
                        }                         
                        Write-Host ""
                        $Confsetup= ".\_Start_BFGMINER_Moonlander-Edition.bat"
                        ADD-content -path $Confsetup -value ".\BFGminer-5.4.2\bfgminer.exe --scrypt -o $Poolmining -u $PoolUser -p $PoolPass,d=128  -S MLD:all --set MLD:clock=$OC" 
                        $writeCPU ="n"
                        $writeGPU ="n"
                        $Writemoon ="y"
                    }

                    if ($job -eq "r")   {clear-host
                                        $Start = "N"
                                        $writeCPU ="n"
                                        $writeGPU ="n"
                                        $Writemoon ="n"
                                        $Job = "d"}
                    }

                    }

if ($Action -eq "StartCPU"){
    write-host "Start CPUminer Job"
    Write-Host ""
    start-process -filepath .\_Start_CPUMINER.bat
    Write-Host ""
}

if ($Action -eq "StartGPU"){
    write-host "Start CGminer Job"
    Write-Host ""
    start-process -filepath .\_Start_CGMINER.bat
    Write-Host ""
}

if ($Action -eq "MoonLander"){
    write-host "Start Moonlander Job"
    Write-Host ""
    start-process -filepath .\_start_BFGMINER_Moonlander-Edition.bat
    Write-Host ""
    exit
}

if ($Action -eq "Q"){Exit}
}