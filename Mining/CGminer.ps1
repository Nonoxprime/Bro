### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Download and configure CGMiner#>

if (-not (Test-Path ".\Soft\CGminer3.7.2")) {New-Item -Path ".\Soft\" -Name "CGminer3.7.2" -ItemType directory -force
        Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\Download\Cgminer.zip"
        expand-archive -path '.\Download\Cgminer.zip' -destinationpath '.\Soft\CGminer3.7.2\' -Force
    }else{
        remove-item ".\Soft\CGminer3.7.2\" -Force -Recurse
        New-Item -Path ".\Soft\" -Name "CGminer3.7.2" -ItemType directory -force
        Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-3.7.2.zip" -OutFile ".\Download\Cgminer.zip"
        expand-archive -path '.\Download\Cgminer.zip' -destinationpath '.\Soft\CGminer3.7.2\' -Force
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

exit