### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure NanoMiner#>

if (-not (Test-Path ".\Soft\Nanominer-1.2.4")) {
    New-Item -Path ".\Soft\" -Name "Nanominer-1.2.4" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/nanominer-windows-1.2.4.zip" -OutFile ".\Soft\nanominer-windows-1.2.4.zip"
    expand-archive -path '.\Soft\nanominer-windows-1.2.4.zip' -destinationpath '.\Soft\Nanominer-1.2.4' -force
    Remove-Item .\Soft\nanominer-windows-1.2.4.zip -force
    }Else {
    Remove-item -Force -Recurse ".\Soft\Nanominer-1.2.4"
    New-Item -Path ".\Soft\" -Name "Nanominer-1.2.4" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/nanominer-windows-1.2.4zip" -OutFile ".\Soft\nanominer-windows-1.2.4.zip"
    expand-archive -path '.\Soft\nanominer-windows-1.2.4.zip' -destinationpath '.\Soft\Nanominer-1.2.4' -force
    Remove-Item .\Soft\nanominer-windows-1.2.4.zip -force}

Rename-Item -Path ".\Soft\Nanominer-1.2.4\config.ini" -NewName "Sample_config.ini" -Force
New-Item -Path ".\Soft\Nanominer-1.2.4" -Name "config.ini" -ItemType file -Force

$Random = Get-Random
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "wallet=4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "algorithm=Cryptonightv8"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "coin=XMR"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "rigName=$Random"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "email=Contact@gameoverblog.fr"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "pool1 = xmr-eu1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "pool2 = xmr-eu2.nanopool.org:14444"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "pool3 = xmr-us-east1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "pool4 = xmr-us-west1.nanopool.org:14444"
    ADD-Content -Path ".\Soft\nanominer-1.2.4\config.ini" -Value "pool5 = xmr-asia1.nanopool.org:14444"

exit