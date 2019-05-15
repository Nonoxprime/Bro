### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure ZecMiner#>

if (-not (Test-Path ".\Soft\ZecMiner0.3.4b")) {New-Item -Path ".\Soft\" -Name "ZecMiner0.3.4b" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Zec.miner.0.3.4b.zip" -OutFile ".\Download\ZecMiner0.3.4b.zip"
    expand-archive -path '.\download\ZecMiner0.3.4b.zip' -destinationpath '.\Soft\ZecMiner0.3.4b\'
}Else{
    Remove-Item -Force -Recurse ".\Soft\ZecMiner0.3.4b"
    New-Item -Path ".\Soft\" -Name "ZecMiner0.3.4b" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Zec.miner.0.3.4b.zip" -OutFile ".\Download\ZecMiner0.3.4b.zip"
    expand-archive -path '.\download\ZecMiner0.3.4b.zip' -destinationpath '.\Soft\ZecMiner0.3.4b\'
}

if (-not (Test-Path ".\Config\_Start_ZecMiner.bat")) {
    New-Item -Path ".\Config\" -Name "_Start_ZecMiner.bat" -ItemType file -force
    $escape = ":"
    $Confsetup= ".\Config\_Start_ZecMiner.bat"
    ADD-content -path $Confsetup -value ".\Soft\ZecMiner0.3.4b\miner --server zec-eu1.nanopool.org --user t1h6bbfjysJo25qaAdtEwVhTozJpsNPz72L.RTX2080TI/Contact@gameoverblog.fr --pass z --port 6666"
}Else{
    Remove-Item -Force -Recurse ".\Config\_Start_ZecMiner.bat"
    New-Item -Path ".\Config\" -Name "_Start_ZecMiner.bat" -ItemType file
    $escape = ":"
    $Confsetup= ".\Config\_Start_ZecMiner.bat"
    ADD-content -path $Confsetup -value ".\Soft\ZecMiner0.3.4b\miner --server zec-eu1.nanopool.org --user t1h6bbfjysJo25qaAdtEwVhTozJpsNPz72L.RTX2080TI/Contact@gameoverblog.fr --pass z --port 6666"
    }

exit