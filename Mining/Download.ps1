### Download Session ###

### By Nox Prime for Gameoverblog.fr ###
### 1.0110.19 ###
### Help me for a coffee/Vodka ... Both :) ?: 
### LTC : MQQVGFmm5poyeQLxLycmDLvNGCtsXXUTDB
### BTC : 34Zg1fvPjxhNTSsWs9KJMX7iBMR85dHu73
### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

if (-not (Test-Path ".\Config\Userconfig.conf")) {
    New-Item -Path ".\Config\" -Name "Userconfig.conf" -ItemType file -force
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "[Config File]"
    ADD-Content -Path ".\Config\Userconfig.conf" -Value "1.0110.19"
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



$Completed = "KO"
while ($Completed -ne "OK") {
    Write-host "Download Software" -ForegroundColor Green -BackgroundColor Black
    Write-Host [1] " - CPUMiner -- (CPU)"
    Write-Host [2] " - CGMiner -- (GPU)"
    Write-Host [3] " - BFGMiner Moonlander 2 -- (USB)"
    write-Host [4] " - FinMiner -- Monero (GPU)"
    write-Host [R] " - Return"
    write-host ""
    $Download = read-host "Which Client do you want to download ?"
    
    if ($Download -eq "1") { $Action = 'Download_CPUminer'}
    if ($Download -eq "2") { $Action = 'Download_CGminer'}
    if ($Download -eq "3") { $Action = 'Download_Moonlander2'}
    if ($Download -eq "4") { $Action = 'Download_FinMiner'}
    
        if ($Download -eq "R") { 
        .\InMyMine.ps1
        exit}
    
        if ($Download -eq $null) { 
        .\InMyMine.ps1
        exit}

if ($Action -eq "Download_CPUminer") {
    if (-not (Test-Path ".\Soft\CPUminer2.5.0")) {New-Item -Path ".\Soft\" -Name "CPUminer2.5.0" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Cpuminer-2.5.0.zip" -OutFile ".\Soft\CPUminer2.5.0\Cpuminer.zip"
    expand-archive -path '.\Soft\CPUminer2.5.0\Cpuminer.zip' -destinationpath '.\Soft\CPUminer2.5.0\'
    Remove-Item .\Soft\CPUminer2.5.0\Cpuminer.zip -Force
    }Else{
    Remove-Item -Force -Recurse ".\Soft\CPUminer2.5.0"
    New-Item -Path ".\Soft\" -Name "CPUminer2.5.0" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Cpuminer-2.5.0.zip" -OutFile ".\Soft\CPUminer2.5.0\Cpuminer.zip"
    expand-archive -path '.\Soft\CPUminer2.5.0\Cpuminer.zip' -destinationpath '.\Soft\CPUminer2.5.0\'
    }
    if (-not (Test-Path ".\Config\_Start_CPUMINER.bat")) {
        New-Item -Path ".\Config\" -Name "_Start_CPUMINER.bat" -ItemType file -force
        $escape = ":"
        $Confsetup= ".\Config\_Start_CPUMINER.bat"
        ADD-content -path $Confsetup -value ".\Soft\CPUminer2.5.0\minerd.exe --url=stratum+tcp://litecoinpool.org:3333 --userpass=Nox81.guest:1"
        $Completed = "OK"
    }Else{
        Remove-Item -Force -Recurse ".\Config\_Start_CPUMINER.bat"
        New-Item -Path ".\Config\" -Name "_Start_CPUMINER.bat" -ItemType file
        $escape = ":"
        $Confsetup= ".\Config\_Start_CPUMINER.bat"
        ADD-content -path $Confsetup -value ".\Soft\CPUminer2.5.0\minerd.exe --url=stratum+tcp://litecoinpool.org:3333 --userpass=Nox81.guest:1"
        $Completed = "OK"
        }    
    }

if ($Action -eq "Download_CGminer") {
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
        $Completed = "OK"
    }Else{
        Remove-Item -Force -Recurse ".\Config\_Start_CGMINER.bat"
        New-Item -Path ".\Config\" -Name "_Start_CGMINER.bat" -ItemType file
        $escape = ":"
        $Confsetup= ".\Config\_Start_CGMINER.bat"    
        ADD-content -path $Confsetup -value ".\Soft\CGminer3.7.2\cgminer -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1"
        $Completed = "OK"
        }
}

if ($Action -eq "Download_Moonlander2") {
    if (-not (Test-Path ".\Soft\BFGminer-5.4.2")) {New-Item -Path ".\Soft\" -Name "BFGminer-5.4.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Moonlander2_Scrypt_bundle.zip" -OutFile ".\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip"
    expand-archive -path '.\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip -Force
    expand-archive -path '.\Soft\BFGminer-5.4.2\BFGminer-5.4.2.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\BFGminer-5.4.2.zip -Force
    expand-archive -path '.\Soft\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip -Force
    start-process -filepath .\Soft\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe
    }Else {
    remove-item ".\Soft\BFGminer-5.4.2\" -Force -Recurse
    New-Item -Path ".\Soft\" -Name "BFGminer-5.4.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Moonlander2_Scrypt_bundle.zip" -OutFile ".\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip"
    expand-archive -path '.\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\Moonlander2_Scrypt_bundle.zip -Force
    expand-archive -path '.\Soft\BFGminer-5.4.2\BFGminer-5.4.2.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\BFGminer-5.4.2.zip -Force
    expand-archive -path '.\Soft\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    Remove-Item .\Soft\BFGminer-5.4.2\CP210x_Universal_Windows_Driver.zip -Force
    start-process -filepath .\Soft\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe /S
    }

    if (-not (Test-Path ".\Config\_Start_BFGMINER_Moonlander-Edition.bat")) {New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1,d=128  -S MLD:all --set MLD:clock=720" 
    $Completed = "OK"}
    Else {
        remove-item ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
        New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
        $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
        ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1,d=128  -S MLD:all --set MLD:clock=660" 
        $Completed = "OK"
        }
}

if ($Action -eq "Download_FinMiner"){
    if (-not (Test-Path ".\Soft\FinMiner-windows-2.4.7")) {New-Item -Path ".\Soft\" -Name "FinMiner-windows-2.4.7" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/FinMiner-windows-2.4.7.zip" -OutFile ".\Soft\FinMiner-windows-2.4.7.zip"
    expand-archive -path '.\Soft\FinMiner-windows-2.4.7.zip' -destinationpath '.\Soft\' -force
    Remove-Item .\Soft\FinMiner-windows-2.4.7.zip -force
    }Else {
    Remove-item -Force -Recurse ".\Soft\FinMiner-windows-2.4.7"
    New-Item -Path ".\Soft\" -Name "FinMiner-windows-2.4.7" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/FinMiner-windows-2.4.7.zip" -OutFile ".\Soft\FinMiner-windows-2.4.7.zip"
    expand-archive -path '.\Soft\FinMiner-windows-2.4.7.zip' -destinationpath '.\Soft\' -force
    Remove-Item .\Soft\FinMiner-windows-2.4.7.zip -force}

    Rename-Item -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -NewName "Sample_config.ini" -Force
    New-Item -Path ".\Soft\FinMiner-windows-2.4.7\" -Name "config.ini" -ItemType file -Force
    $Random = Get-Random
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "wallet=41qxwkdHtMBHN7P8qAKptN6gQkZAUvY6AMtymXhVYH2j13Hxb9LEX1RCKE3Hr852RDGPUwe7xF8uf3iK75c3PZYt6d4KnUo"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "algorithm=Cryptonightv8"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "coin=XMR"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "rigName=$Random"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "email=Contact@gameoverblog.fr"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "pool1 = xmr-eu1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "pool2 = xmr-eu2.nanopool.org:14444"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "pool3 = xmr-us-east1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "pool4 = xmr-us-west1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\FinMiner-windows-2.4.7\config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"
    $Completed = "OK"
    }
}
.\InMyMine.ps1
exit