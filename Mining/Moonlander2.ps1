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

if (-not (Test-Path ".\Config\_Start_BFGMINER_Moonlander-Edition.bat")) {
    New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1,d=128  -S MLD:all --set MLD:clock=720" 
    }Else {
    remove-item ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    New-Item -Path ".\Config\" -Name "_Start_BFGMINER_Moonlander-Edition.bat" -ItemType file
    $Confsetup= ".\Config\_Start_BFGMINER_Moonlander-Edition.bat"
    ADD-content -path $Confsetup -value ".\Soft\BFGminer-5.4.2\bfgminer.exe --scrypt -o stratum+tcp://litecoinpool.org:3333 -u Nox81.guest -p 1,d=128  -S MLD:all --set MLD:clock=660" 
}

exit