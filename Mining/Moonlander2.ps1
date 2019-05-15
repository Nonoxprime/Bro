### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure Moonlander 2 USB Litecoin#>

if (-not (Test-Path ".\Soft\BFGminer-5.4.2")) {
    New-Item -Path ".\Soft\" -Name "BFGminer-5.4.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Moonlander2_Scrypt_bundle.zip" -OutFile ".\Download\Moonlander2_Scrypt_bundle.zip"
    expand-archive -path '.\Download\Moonlander2_Scrypt_bundle.zip' -destinationpath '.\Download\' -Force
    expand-archive -path '.\Download\BFGminer-5.4.2.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    expand-archive -path '.\Download\CP210x_Universal_Windows_Driver.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    start-process -filepath .\Soft\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe

    }Else {
    remove-item ".\Soft\BFGminer-5.4.2\" -Force -Recurse
    New-Item -Path ".\Soft\" -Name "BFGminer-5.4.2" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Moonlander2_Scrypt_bundle.zip" -OutFile ".\Download\Moonlander2_Scrypt_bundle.zip"
    expand-archive -path '.\Download\Moonlander2_Scrypt_bundle.zip' -destinationpath '.\Download\' -Force
    expand-archive -path '.\Download\BFGminer-5.4.2.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    expand-archive -path '.\Download\CP210x_Universal_Windows_Driver.zip' -destinationpath '.\Soft\BFGminer-5.4.2\' -Force
    start-process -filepath .\Soft\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe
    start-process -filepath .\Soft\BFGminer-5.4.2\CP210xVCPInstaller_x64.exe /S
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

if (-not (Test-Path ".\Config\_Start_BFGMINER_Moonlander-Edition.bat")) {
    New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u $LTCUser -p $LTCPass,d=128  -S MLD:all --set MLD:clock=660" 
    }Else {
    remove-item ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u $LTCUser -p $LTCPass,d=128  -S MLD:all --set MLD:clock=660" 
}

$Startup = Read-Host "Add to Startup ? [Y/N] "
$Confsetup = ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}

exit