### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure CPU Miner#>

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
}Else{
    Remove-Item -Force -Recurse ".\Config\_Start_CPUMINER.bat"
    New-Item -Path ".\Config\" -Name "_Start_CPUMINER.bat" -ItemType file
    $escape = ":"
    $Confsetup= ".\Config\_Start_CPUMINER.bat"
    ADD-content -path $Confsetup -value ".\Soft\CPUminer2.5.0\minerd.exe --url=stratum+tcp://litecoinpool.org:3333 --userpass=Nox81.guest:1"
    }

#.\InMyMine.ps1
exit