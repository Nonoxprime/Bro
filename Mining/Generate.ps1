### Generate Config File ###

### By Nox Prime for Gameoverblog.fr ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : MQQVGFmm5poyeQLxLycmDLvNGCtsXXUTDB
### BTC : 34Zg1fvPjxhNTSsWs9KJMX7iBMR85dHu73
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

### Variables ###
$Version = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 1
$PoolMining = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 3
$PoolUser = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 5
$PoolPass = Get-Content -Path .\Config\Userconfig.conf | where { $_ -ne "$null" } | Select-Object -Index 7

$Job = "Processing"

while ($Job -ne "done"){

if ($writeCPU -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
                    write-host "CPUMINER - Configuration  Saved" -ForegroundColor red -BackgroundColor Black
                    }
if ($writeGPU -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
                    write-host "CGMINER - Configuration  Saved" -ForegroundColor red -BackgroundColor Black
                    }
if ($Writemoon -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
                    Write-Host "Moonlander Scrypt USB - config Saved" -ForegroundColor red -BackgroundColor Black
}
if ($Write2Pac -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
                    Write-Host "GekkoScience 2Pac USB - config Saved" -ForegroundColor red -BackgroundColor Black
}
if ($WriteFinminer -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
                    Write-Host "FinMiner - config Saved" -ForegroundColor red -BackgroundColor Black
}
if ($Restore -eq "y") {
    write-host "CONFIGURATION" -ForegroundColor Green -BackgroundColor Black
    Write-Host "Default Configuration restored " -ForegroundColor red -BackgroundColor Black
}

write-host ""
    write-host "Write Config" -ForegroundColor Green -BackgroundColor Black
    Write-Host [1] "- Write CPUMINER Configuration (CPU) -All "
    Write-Host [2] "- Write CGMINER Configuration (GPU) - All "
    Write-Host [3] "- Write Moonlander 2 Configuration (USB) - SCRYPT "
    Write-Host [4] "- Write Moonlander 2 Configuration (USB) - SHA-256 "
    Write-Host [5] "- Write FinMiner Configuration (Monero/Etherium) "
    Write-Host [X] "- Config Error : Regen it"
    Write-Host [R] "- RETURN "
    Write-host ""
    
    $ConfigJob = read-host "Your Choice "
    if ($ConfigJob -eq $null) {$Job = "r"}
    switch ( $ConfigJob )
{
    1 { $Job = "CPU"}
    2 { $Job = "GPU"}
    3 { $Job = "Moon"}
    4 { $Job = "2Pac"}
    5 { $Job = "Finminer"}
    
    X { $Job = "X"}
    R { $Job = "r"}
}
    if ($Job -eq "CPU")   {
        
        $writeCPU = "y"
        $writeGPU = "n"
        $Writemoon = "n"
        $Write2Pac = "n"
        $WriteFinminer = "n"
        $Restore = "n"

        Write-Host ""
        write-host "Writing _Start_CPUMINER.bat"           
        Write-Host ""
        if (-not (Test-Path ".\Config\_start_CPUMINER.bat")) {
        New-Item -Path ".\Config\" -Name "_Start_CPUMINER.bat" -ItemType file
        } else {
               remove-item .\Config\_start_CPUMINER.bat
               New-Item -Path ".\Config\" -Name "_Start_CPUMINER.bat" -ItemType file
                }                         
        Write-Host ""
        $escape = ":"
        $Confsetup= ".\Config\_Start_CPUMINER.bat"
        ADD-content -path $Confsetup -value ".\Soft\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
        
#Startup#
    $Startup = Read-Host "Add to Startup ? [Y/N] "
    if ($startup -eq "Y"){
        if (-not (Test-Path ".\Config\CPUMINER_Startup.bat")) {
            New-Item -Path ".\Config\" -Name "CPUMINER_Startup.bat" -ItemType file
            $Confsetup = ".\Config\CPUMINER_Startup.bat"
            $loc = Get-Location
            ADD-content -path $Confsetup -value "$loc\Soft\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
        }
        Else {
            Remove-item .\Config\CPUMINER_Startup.bat
            New-Item -Path ".\Config\" -Name "CPUMINER_Startup.bat" -ItemType file
            $Confsetup = ".\Config\CPUMINER_Startup.bat"
            $loc = Get-Location
            ADD-content -path $Confsetup -value "$loc\Soft\CPUminer2.5.0\minerd.exe --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
        }
    }
#Startup#
    
    }

        if ($Job -eq "GPU")   {
        Write-Host ""
        write-host "Writing _Start_CGMINER.bat"           
        Write-Host ""
        if (-not (Test-Path ".\Config\_start_CGMINER.bat")) {
                    New-Item -Path ".\Config\" -Name "_Start_CGMINER.bat" -ItemType file
                    } else {
                    remove-item .\Config\_Start_CGMINER.bat
                    New-Item -Path ".\Config\" -Name "_Start_CGMINER.bat" -ItemType file
                    }                         
        Write-Host ""
        $Confsetup= ".\Config\_Start_CGMINER.bat"
        ADD-content -path $Confsetup -value ".\Soft\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"

#Startup#
        $Startup = Read-Host "Add to Startup ? [Y/N] "
        if ($startup -eq "Y"){
            if (-not (Test-Path ".\Config\CGMINER_Startup.bat")) {
                New-Item -Path ".\Config\" -Name "CGMINER_Startup.bat" -ItemType file
                $Confsetup = ".\Config\CGMINER_Startup.bat"
                $loc = Get-Location
                ADD-content -path $Confsetup -value "$loc\Soft\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"
                Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
            }
            Else {
                Remove-item .\Config\CGMINER_Startup.bat
                New-Item -Path ".\Config\" -Name "CGMINER_Startup.bat" -ItemType file
                $Confsetup = ".\Config\CGMINER_Startup.bat"
                $loc = Get-Location
                ADD-content -path $Confsetup -value "$loc\Soft\CGminer3.7.2\cgminer -o $Poolmining -u $PoolUser -p $PoolPass"
                Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
            }
        }
#Startup#

        $writeCPU ="n"
        $writeGPU ="y"
        $Writemoon ="n"
        $Write2Pac = "n"
        $WriteFinminer ="n"
        $Restore = "n"
                }

        if ($Job -eq "Moon")   {
            Write-Host ""
            write-host "Writing _Start_BFGMINER_Moonlander-Edition.bat"           
            Write-Host ""
                    
            while ($pass -ne "y") {
                    if ($pass -eq "n"){write-host "Warning Wrong value please choose a num between 600 and 660"  -ForegroundColor red -BackgroundColor Black}
                    write-host ""
                    $OC = read-host "MoonLander 2 Clock [600-954] "
                    if ($OC -ge 600 -and $OC -le 954){
                        write-host "You have set your Moonlander Clock at " -NoNewline
                        write-host "$OC" -ForegroundColor green -BackgroundColor Black
                        $Pass = "y"
                    }else {
                            Clear-Host
                            $pass = "n"

                            }
            }

                    if (-not (Test-Path ".\Config\_Start_BFGMINER_Moonlander-Edition.bat")) {
                    New-Item -Path ".\Config" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
                    } else {
                        remove-item .\Config\_Start_BFGMINER_Moonlander-Edition.bat
                        New-Item -Path ".\Config" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
                    }                         
                    Write-Host ""
                    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
                    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o $Poolmining -u $PoolUser -p $PoolPass,d=128  -S MLD:all --set MLD:clock=$OC" 
                    $Startup = Read-Host "Add to Startup ? [Y/N] "
                    if ($startup -eq "Y"){
                        if (-not (Test-Path ".\Config\BFGMINER_Moonlander-Edition_Startup.bat")) {
                            New-Item -Path ".\Config" -Name "BFGMINER_Moonlander-Edition_Startup.bat" -ItemType file
                            $Confsetup = ".\Config\BFGMINER_Moonlander-Edition_Startup.bat"
                            $loc = Get-Location
                            ADD-content -path $Confsetup -value "$loc\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o $Poolmining -u $PoolUser -p $PoolPass,d=128  -S MLD:all --set MLD:clock=$OC"
                            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
                        }
                        Else {
                            Remove-item .\Config\BFGminer-5.4.2\BFGMINER_Moonlander-Edition_Startup.bat
                            New-Item -Path ".\Config" -Name "BFGMINER_Moonlander-Edition_Startup.bat" -ItemType file
                            $Confsetup = ".\Config\BFGMINER_Moonlander-Edition_Startup.bat"
                            $loc = Get-Location
                            ADD-content -path $Confsetup -value "$loc\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o $Poolmining -u $PoolUser -p $PoolPass,d=128  -S MLD:all --set MLD:clock=$OC"
                            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
                        }
                    }

                    $writeCPU ="n"
                    $writeGPU ="n"
                    $Writemoon ="y"
                    $Write2Pac = "n"
                    $WriteFinminer ="n"
                    $Restore = "n"
                }


                if ($Job -eq "2Pac")   {
                    Write-Host ""
                    write-host "Writing _Start_CGMINER_2Pac_Edition.bat"           
                    Write-Host ""
                    if (-not (Test-Path ".\Config\_start_CGMINER_Gekko2Pac.bat")) {
                                New-Item -Path ".\Config\" -Name "_Start_CGMINER_Gekko2Pac.bat" -ItemType file
                                } else {
                                remove-item .\Config\_Start_CGMINER.bat
                                New-Item -Path ".\Config\" -Name "_Start_CGMINER_Gekko2Pac.bat" -ItemType file
                                }                         
                    Write-Host ""
                    $Confsetup= ".\Config\_Start_CGMINER_Gekko2Pac.bat"
                    ADD-content -path $Confsetup -value ".\Soft\CGminer-4.10.0_Gekko\cgminer -o $Poolmining -u $PoolUser -p $PoolPass --suggest-diff 32 --gekko-2pac-freq 150"
            
            #Startup#
                    $Startup = Read-Host "Add to Startup ? [Y/N] "
                    if ($startup -eq "Y"){
                        if (-not (Test-Path ".\Config\CGMINER_2Pac_Startup.bat")) {
                            New-Item -Path ".\Config\" -Name "CGMINER_2Pac_Startup.bat" -ItemType file
                            $Confsetup = ".\Config\CGMINER_2Pac_Startup.bat"
                            $loc = Get-Location
                            ADD-content -path $Confsetup -value "$loc\Soft\CGminer-4.10.0_Gekko\cgminer -o $Poolmining -u $PoolUser -p $PoolPass --suggest-diff 32 --gekko-2pac-freq 150"
                            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
                        }
                        Else {
                            Remove-item .\Config\CGMINER_2Pac_Startup.bat
                            New-Item -Path ".\Config\" -Name "CGMINER_2Pac_Startup.bat" -ItemType file
                            $Confsetup = ".\Config\CGMINER_2Pac_Startup.bat"
                            $loc = Get-Location
                            ADD-content -path $Confsetup -value "$loc\Soft\CGminer-4.10.0_Gekko\cgminer -o stratum+tcp://stratum.slushpool.com:3333 -u Noxquartek.test -p 1234 --suggest-diff 32 --gekko-2pac-freq 150"
                            Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
                        }
                    }
            #Startup#
            
                    $writeCPU ="n"
                    $writeGPU ="n"
                    $Writemoon ="n"
                    $Write2Pac = "y"
                    $WriteFinminer ="n"
                    $Restore = "n"
                            }
            

                if ($Job -eq "Finminer")   {
                    Write-Host ""
                    write-host "Writing FinMiner Config"           
                    Write-Host ""

                    if (-not (Test-Path -Path ".\Soft\FinMiner-windows-2.4.7")) {
                        Write-host "Finminer is not installed"
                        Write-host "Please install it before" -foregroundColor Magenta -BackgroundColor Black 
                        start-Sleep -s 3
                        exit
                    }

                    if (-not (Test-Path -Path ".\Soft\FinMiner-windows-2.4.7\config.ini")) {
                        Copy-Item -Path ".\XMR_config.ini" -Destination ".\Soft\FinMiner-windows-2.4.7\"
                        Rename-Item -Path ".\Soft\FinMiner-windows-2.4.7\XMR_config.ini" -NewName "config.ini"
                    } else {
                            remove-item .\Soft\FinMiner-windows-2.4.7\config.ini
                            Copy-Item -Path ".\Config\XMR_config.ini" -Destination ".\Soft\FinMiner-windows-2.4.7\"
                            Rename-Item -Path ".\Soft\FinMiner-windows-2.4.7\XMR_config.ini" -NewName "config.ini"    
                        }

                    $writeCPU ="n"
                    $writeGPU ="n"
                    $Writemoon ="n"
                    $Write2Pac = "n"
                    $WriteFinminer ="y"
                    $Restore = "n"
                            }

                if ($job -eq "X") {

                    Write-host "Config.Conf Default" -ForegroundColor red -BackgroundColor Black

                    Remove-item ".\Config\Userconfig.conf" -Force
                    New-Item -Path ".\Config\" -Name "Userconfig.conf" -ItemType file -force
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Config File]"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1.0113.19"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Mining Pool]"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "stratum+tcp://litecoinpool.org:3333"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[User.worker]"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "Nox81.guest"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[WorkerPassword]"
                    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1"
                    write-host ""

                    Write-host "XMR_Config.ini Default" -ForegroundColor red -BackgroundColor Black
                    Remove-item ".\Config\XMR_config.ini" -Force
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
                    ADD-Content -Path ".\Config\XMR_config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"
                
                    $writeCPU ="n"
                    $writeGPU ="n"
                    $Writemoon ="n"
                    $Write2Pac = "n"
                    $WriteFinminer ="n"
                    $Restore = "y"
                }

                if ($job -eq "r")   {
                        $writeCPU ="n"
                        $writeGPU ="n"
                        $Writemoon ="n"
                        $Write2Pac = "n"
                        $Restore = "n"
                        $Job = "done"
                    .\InMyMine.ps1
                exit}
}
.\InMyMine.ps1
exit