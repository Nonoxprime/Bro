### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# What is this File ? 
Download and configure Gekko 2 Pac USB Bitcoin#>

if (-not (Test-Path ".\Soft\CGminer-4.10.0_Gekko")) {New-Item -Path ".\Soft\" -Name "CGminer-4.10.0_Gekko" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-4.10.0_Gekko.zip" -OutFile ".\Download\Cgminer_Gekko.zip"
    expand-archive -path '.\Download\Cgminer_Gekko.zip' -destinationpath '.\Soft\CGminer-4.10.0_Gekko\' -Force
  
    Write-Host ""
    Write-Host "Zadig Config" -ForegroundColor Green -BackgroundColor black
    Write-Host "Select - Options" -ForegroundColor red -BackgroundColor black
    Write-Host "Select - List All devices" -ForegroundColor red -BackgroundColor black
    Write-Host "Select - 2Pac BM1384 Bitcoin Miner " -ForegroundColor red -BackgroundColor black
    Write-Host "Select - WinUSB" -ForegroundColor red -BackgroundColor black
    Write-Host "Select - Replace or Install Driver " -ForegroundColor red -BackgroundColor black
    Write-Host "You can Close Zadig" -ForegroundColor Green -BackgroundColor black
    start-process -filepath .\Soft\CGminer-4.10.0_Gekko\zadig-2.4.exe -Wait
    }else{
    New-Item -Path ".\Soft\" -Name "CGminer-4.10.0_Gekko" -ItemType directory -force
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/cgminer-4.10.0_Gekko.zip" -OutFile ".\Download\Cgminer_Geeko.zip"
    expand-archive -path '.\Download\Cgminer_Gekko.zip' -destinationpath '.\Soft\CGminer-4.10.0_Gekko\' -Force
    
    Write-Host ""
    Write-Host "Zadig Config" -ForegroundColor Green -BackgroundColor black
    Write-Host "Select - Options" -ForegroundColor red -BackgroundColor black
    Write-Host "Select - List All devices" -ForegroundColor red -BackgroundColor black
    Write-Host "Select - 2Pac BM1384 Bitcoin Miner " -ForegroundColor red -BackgroundColor black
    Write-Host "Select - WinUSB " -ForegroundColor red -BackgroundColor black
    Write-Host "Select - Replace or Install Driver " -ForegroundColor red -BackgroundColor black
    Write-Host "You can Close Zadig" -ForegroundColor Green -BackgroundColor black
    start-process -filepath .\Soft\CGminer-4.10.0_Gekko\zadig-2.4.exe -Wait
}

       Write-Host ""
        write-host "Configuration BiteCoin" -ForegroundColor Green -BackgroundColor Black
        write-host "Before configuration you need"
        write-host "- Create an BTC wallet"
        write-host "- Register Slushpool account : " -NoNewLine 
        write-host "https://slushpool.com/" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""

        $BTCUser = Read-Host "User.Worker "

        if (-not (Test-Path ".\Config\_Start_CGMINER_Gekko2Pac.bat")) {
            New-Item -Path ".\Config\" -Name "_Start_CGMINER_Gekko2Pac.bat" -ItemType file -force
            $Confsetup= ".\Config\_Start_CGMINER_Gekko2Pac.bat"
            ADD-content -path $Confsetup -value ".\Soft\CGminer-4.10.0_Gekko\cgminer -o stratum+tcp://stratum.slushpool.com:3333 -u $BTCUser -p 1234 --suggest-diff 32 --gekko-2pac-freq 150"
        }Else{
            Remove-Item -Force -Recurse ".\Config\_Start_CGMINER_Gekko2Pac.bat"
            New-Item -Path ".\Config\" -Name "_Start_CGMINER_Gekko2Pac.bat" -ItemType file
            $Confsetup= ".\Config\_Start_CGMINER_Gekko2Pac.bat"    
            ADD-content -path $Confsetup -value ".\Soft\CGminer-4.10.0_Gekko\cgminer -o stratum+tcp://stratum.slushpool.com:3333 -u $BTCUser -p 1234 --suggest-diff 32 --gekko-2pac-freq 150"
            }

            $Startup = Read-Host "Add to Startup ? [Y/N] "
            $Confsetup = "_Start_CGMINER_Gekko2Pac.bat"
            if ($startup -eq "Y"){Copy-Item $Confsetup -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"}

exit