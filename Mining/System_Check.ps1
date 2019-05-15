### By Nox Prime for Gameoverblog.fr ###
### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

<# Why this File ? 
Check System
#>

clear-Host

### Date ###
$date = Get-Date -Format g

if ($fail -ne "n"){Write-Host "Check system"  -ForegroundColor green -BackgroundColor Black}
else {Write-Host "Check system"  -ForegroundColor Magenta -BackgroundColor Black}

### Hostname
if ($PowerShellVersion -ge 6) {
	$OS = Get-CimInstance Win32_OperatingSystem
	$ComputerSystem = Get-CimInstance Win32_ComputerSystem
	if ($ComputerSystem.Manufacturer -like 'Lenovo') { $Model = (Get-CimInstance Win32_ComputerSystemProduct).Version }
	else { $Model = $ComputerSystem.Model }
}
else {
	$OS = Get-WmiObject Win32_OperatingSystem
	$ComputerSystem = Get-WmiObject Win32_ComputerSystem
	if ($ComputerSystem.Manufacturer -like 'Lenovo') { $Model = (Get-WmiObject Win32_ComputerSystemProduct).Version }
	else { $Model = $ComputerSystem.Model }
}
$Hostname = $ComputerSystem.Name

### GPU Model ###
$gpu = Get-WmiObject Win32_VideoController
$Graphic = $gpu.Name
$GraphicDrivers = $gpu.DriverVersion

### LAN ###
$ip=get-WmiObject Win32_NetworkAdapterConfiguration|Where {$_.Ipaddress.length -gt 1}
$IP = $ip.ipaddress[0]

### Create Log file Hostname.log ###
If (-not (Test-Path ".\Config\$hostname.log")) {
	New-Item -ItemType File -Path ".\Config\" -Name "$hostname.log"
} Else {
	Remove-Item ".\Config\$hostname.log"
	New-Item -ItemType File -Path ".\Config\" -Name "$hostname.log"
}

### Check CPUMINER###
if (-not (Test-Path ".\Soft\CPUMINER2.5.0\minerd.exe")) {
    $CPUMiner = "CPUMINER : Missing CPUminer Folder"
}
else {
    $CPUMiner = "CPUMINER : Ready to mine with your CPU"
}

### Check CGMINER ###
if (-not (Test-Path ".\Soft\CGMINER3.7.2\cgminer.exe")) {
    $CGMINER = "CGMINER : Missing CGminer Folder"
}
else {
    $CGMiner = "CGMINER : Ready to mine with your GPU"
}

### Check BFG MoonLanders USB ###
if (-not (Test-Path ".\Soft\BFGminer-5.4.2\bfgminer.exe")) {
    $Moon = "MoonLander 2 Scrypt : Missing Drivers and BFGMiner"
}
else {
    $Moon = "MoonLander 2 Scrypt : Ready to mine with your Moonlander"
}

### Check Nanominer XMR / ETH ###
if (-not (Test-Path ".\Soft\Nanominer-1.2.4\nanominer.exe")) {
    $Nanominer = "Nanominer : Missing Folder."
}
else {
    $Nanominer = "Nanominer : Ready to mine Monero / Etherium"
}

### Check ZecMiner Zcash ###
if (-not (Test-Path ".\Soft\ZecMiner0.3.4b\miner.exe")) {
    $Nanominer = "Zecminer : Missing Folder."
}
else {
    $Nanominer = "Zecminer : Ready to mine Monero / Etherium"
}


### Insert Info into Hostname.log ###
$Local= ".\Config\$hostname.log"
ADD-content -path $Local -value "-----------------------------------------------"
ADD-content -path $Local -value "Scan Date : $date"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Local Host"
ADD-content -path $Local -value "Hostname : $Hostname"
ADD-content -path $Local -value "Local IP Adress : $IP"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Graphic Specs"
ADD-content -path $Local -value "Video Card : $Graphic"
ADD-content -path $Local -value "Graphic Driver : $GraphicDrivers"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Your Miner"
ADD-content -path $Local -value "$CPUMiner"
ADD-content -path $Local -value "$CGMiner"
ADD-content -path $Local -value "$Moon"
ADD-content -path $Local -value "$Nanominer"
ADD-content -path $Local -value "$Zec"
ADD-content -path $Local -value "-----------------------------------------------"
#########

### Screen the Scan ###
write-host "----------------------------------------------------------------------"
write-Host ""
write-host "Scan Date : $date"
Write-Host ""
Write-Host "Your RIG" -ForegroundColor Green -BackgroundColor Black
write-host "Hostname : $Hostname"
write-host "Local IP Adress : $IP"
Write-Host ""
Write-Host "Graphic Specs" -ForegroundColor Green -BackgroundColor Black
Write-Host "Video Card : $Graphic"
Write-Host "Graphic Driver : $GraphicDrivers"
Write-Host ""
Write-Host "Your Miner" -ForegroundColor Green -BackgroundColor Black

if ($CPUMiner -eq "CPUMINER : Missing CPUminer Folder") {Write-Host "$CPUMiner" -foregroundcolor Red -backgroundcolor black}
Else {Write-Host "$CPUMiner" -foregroundcolor Green -backgroundcolor black}

if ($CGMiner -eq "CGMINER : Missing CGminer Folder") {Write-Host "$CGMiner" -foregroundcolor Red -backgroundcolor black}
Else {Write-Host "$CGMiner" -foregroundcolor Green -backgroundcolor black}

if ($Moon -eq "MoonLander 2 Scrypt : Missing Drivers and BFGMiner") {Write-Host "$Moon" -foregroundcolor Red -backgroundcolor black}
Else {Write-Host "$Moon" -foregroundcolor Green -backgroundcolor black}

if ($Nanominer -eq "Nanominer : Missing Folder.") {Write-Host "$Nanominer" -foregroundcolor Red -backgroundcolor black}
Else {Write-Host "$Nanominer" -foregroundcolor Green -backgroundcolor black}

if ($Zec -eq "Nanominer : Missing Folder.") {Write-Host "$Zec" -foregroundcolor Red -backgroundcolor black}
Else {Write-Host "$Zec" -foregroundcolor Green -backgroundcolor black}

write-host "----------------------------------------------------------------------"
write.exe .\Config\$hostname.log
Pause
.\InMyMine.ps1
exit