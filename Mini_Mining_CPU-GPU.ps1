### By Nox Prime for Gameoverblog.fr ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : 
### BTC :
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

Clear-Host

Write-Host "This Script need to by run as admin"
Set-ExecutionPolicy Bypass -Scope Process
Start-Sleep -s 2

Write-Host " --- Mini Mining --- "
Write-Host "Tool Version 1.0"
Write-Host ""

### Identification des variable ###
$PoolMining = "stratum+tcp://litecoinpool.org:3333"
$PoolUser = "Nox81.guest"
$PoolPass = "1"

while ($Start -ne "y"){
#### Give Choice ####
if (-not (Test-Path ".\CPUMINER2.5.0\minerd.exe")) {
    write-host "CPUMINER - System Check Failed : Missing CPUminer. Press '1' to download" -ForegroundColor red -BackgroundColor Black
    }
elseif (-not (Test-Path ".\_start_CPUMINER.bat")) {
    write-host "CPUMINER - System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black }
else {write-host "CPUMINER - System Check done : ready to mine with your CPU" -ForegroundColor green -BackgroundColor Black
        }

if (-not (Test-Path ".\CGMINER3.7.2\cgminer.exe")) {
            write-host "CGMINER - System Check Failed : Missing CGminer. Press '2' to download" -ForegroundColor red -BackgroundColor Black
            }
elseif (-not (Test-Path ".\_start_CGMINER.bat")) {
            write-host "CGMINER - System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black }
else {write-host "CGMINER - System Check done : ready to mine with your GPU" -ForegroundColor green -BackgroundColor Black
                }
Write-Host ""
write-host "Menu" -ForegroundColor Green -BackgroundColor Black
write-host "Download" -ForegroundColor Yellow -BackgroundColor Black
Write-Host [1] - Download CPU Miner
Write-Host [2] - DownLoad GPU Miner
Write-Host ""
write-host "Config" -ForegroundColor Green -BackgroundColor Black
Write-Host [P] - Pool Config 
Write-Host [U] - User.worker Config 
Write-Host [C] - Check config
Write-Host ""
write-host "Work" -ForegroundColor Green -BackgroundColor Black
Write-Host [CS] - "Start CPU Mining (CPUminer)"
Write-Host [CG] - "Start GPU Mining (CGminer)"
Write-Host [A] - "Start All miner (CPUMiner + CGminer)"
Write-Host [Q] - "Quit" 
Write-Host ""

write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    1 { $Action = 'Download_CPUminer'}
	2 { $Action = 'Download_CGminer'}

    P { $Action = 'Conf_pool'}
	U { $Action = 'Conf_User'}
    C { $Action = 'Check'}

    CS { $Action = 'StartCPU'}
    CG { $Action = 'StartGPU'}
    A { $Action = 'AllMiner'}
	Q { $Action = 'Q'}
}

### Download Files
if ($Action -eq "Download_CPUminer") {
    Clear-Host
    if (-not (Test-Path ".\CPUminer2.5.0")) {
        New-Item -Path ".\" -Name "CPUminer2.5.0" -ItemType directory -force
        }
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Cpuminer-2.5.0.zip" -OutFile ".\CPUminer2.5.0\Cpuminer.zip"
    expand-archive -path '.\CPUminer2.5.0\Cpuminer.zip' -destinationpath '.\CPUminer2.5.0\'
    Remove-Item .\CPUminer2.5.0\Cpuminer.zip
    $CPUminer = "y"
}

if ($Action -eq "Download_CGminer") {
    Clear-Host
    if (-not (Test-Path ".\CGminer3.7.2")) {
        New-Item -Path ".\" -Name "CGminer3.7.2" -ItemType directory -force
        }
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\CGminer3.7.2\Cgminer.zip"
    expand-archive -path '.\CGminer3.7.2\Cgminer.zip' -destinationpath '.\CGminer3.7.2\'
    Remove-Item .\CGminer3.7.2\Cgminer.zip
    $GPUminer = "y"
}

### Config Pool Acces ###
if ($Action -eq "Conf_Pool") {
    Clear-Host 
    $PoolMining = Read-Host "Mining Pool Addres - (Default: stratum+tcp://litecoinpool.org:3333) "
        if ($PoolMining -eq $null) {$PoolMining = "stratum+tcp://litecoinpool.org:3333"}
        clear-host
}

### Config USER Acces ###
if ($Action -eq "Conf_User") {
    Clear-Host
    $PoolUser = Read-Host "Pool User Like User.worker - (Default: Nox81.guest) "
        if ($PoolUser -eq $null) {$PoolUser = "Nox81.guest"}
    $PoolPass = Read-Host "Worker Password (Default: What you want) "
        if ($PoolPass -eq $null) {$PoolPass = "1"}
        clear-host
}

### Check and config file ###
if ($Action -eq "Check") {
    Clear-Host
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
                        write-host ""
                        write-host "CPUMINER - Configugartion  Saved" -ForegroundColor red -BackgroundColor Black
                        write-host ""
                        }
    if ($writeGPU -eq "y") {
                        write-host ""
                        write-host "CGMINER - Configugartion  Saved" -ForegroundColor red -BackgroundColor Black
                        write-host ""
                        }
    write-host ""
                        write-host "Menu" -ForegroundColor Green -BackgroundColor Black
                        Write-Host [C] "- Write Conf for CPUMINER (CPU)"
                        Write-Host [G] "- Write Conf for CGMINER (GPU)"
                        Write-Host [v] "- verifying conf"
                        Write-Host [R] - return
                        Write-host ""
                        $Job = read-host "Your Choice "

                        if ($Job -eq "v")   {
                            Clear-Host
                            Write-Host ""
                            write-host "verifying Conf"           
                            Write-Host ""
                            if (-not (Test-Path ".\_start_CPUMINER.bat")) {
                                Write-host "Waiting Configuration File" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your Pool Mining set on : " -NoNewline 
                                Write-host "$PoolMining" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your User and Worker set on : " -NoNewline 
                                Write-host "$PoolUser" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your Pass for $PoolUser is set on :" -NoNewline 
                                Write-host "$PoolPass" -ForegroundColor Green -BackgroundColor Black
                                Write-host ""
                                write-host "System Check Failed : Missing Conf file. Press 'w' to generate" -ForegroundColor red -BackgroundColor Black
                                Write-Host ""
                             }
                          else {$check = Get-Content -Path ".\_start_.bat" | where { $_ -ne "$null" } | Select-Object -Index 0
                          Write-Host $check}
                        }

                    if ($Job -eq "C")   {
                        Write-Host ""
                        write-host "Writing _Start_CPUMINER.bat"           
                        Write-Host ""
                        if (-not (Test-Path ".\_start_CPUMINER.bat")) {
                        New-Item -Path ".\" -Name "_Start_CPUMINER.bat" -ItemType file
                        } else {
                            del _start_CPUMINER.bat
                            New-Item -Path ".\" -Name "_Start_CPUMINER.bat" -ItemType file
                        }                         
                        Write-Host ""
                        $escape = ":"
                        $Confsetup= ".\_Start_CPUMINER.bat"
                        ADD-content -path $Confsetup -value ".\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
                        $writeCPU ="y"
                    }


                    if ($Job -eq "G")   {
                        Write-Host ""
                        write-host "Writing _Start_CGMINER.bat"           
                        Write-Host ""
                        if (-not (Test-Path ".\_start_CGMINER.bat")) {
                        New-Item -Path ".\" -Name "_Start_CGMINER.bat" -ItemType file
                        } else {
                            del _Start_CGMINER.bat
                            New-Item -Path ".\" -Name "_Start_CGMINER.bat" -ItemType file
                        }                         
                        Write-Host ""
                        $escape = ":"
                        $Confsetup= ".\_Start_CGMINER.bat"
                        ADD-content -path $Confsetup -value ".\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"
                        $writeGPU ="y"
                    }

                    if ($job -eq "r")   {clear-host
                                        $Start = "N"
                                        $Job = "d"}
                    }

                    }

if ($Action -eq "StartCPU"){
    Clear-Host
    write-host "Start CPUminer Job"
    Write-Host ""
    start-process -filepath .\_Start_CPUMINER.bat
    Write-Host ""
}

if ($Action -eq "StartGPU"){
    Clear-Host
    write-host "Start CGminer Job"
    Write-Host ""
    start-process -filepath .\_Start_CGMINER.bat
    Write-Host ""
}

if ($Action -eq "AllMiner"){
    Clear-Host
    write-host "Start Both Miner Job"
    Write-Host ""
    start-process -filepath .\_Start_CPUMINER.bat
    start-process -filepath .\_Start_CGMINER.bat
    Write-Host ""
    exit
}

if ($Action -eq "Q"){Exit}
}