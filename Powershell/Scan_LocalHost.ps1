### Write by Nox ###
Clear-Host
Write-Host "This Script need to be run as admin"
Set-ExecutionPolicy Bypass -Scope Process

write-host "MENU" -ForegroundColor Green -BackgroundColor Black
Write-Host [1] - Scan Localhost
Write-Host [Whatever] - Quit
Write-Host ""

$Process = Read-Host "What you want to do ? "

If ($Process -eq "1") {

#Create Log File
If (-not (Test-Path "c:\Nox_Script")) {
	New-Item -ItemType Directory -Path "c:\" -Name "Nox_Script"
}

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

### Memory ###
$Memory = Get-CimInstance win32_ComputerSystem | foreach {[math]::truncate($_.TotalPhysicalMemory /1GB)}
### Graphic Card ###
$gpu = Get-WmiObject Win32_VideoController
$Graphic = $gpu.Name
$GraphicDrivers = $gpu.DriverVersion
### My IP ###
$Lanscan = Get-NetIPAddress|Where {$_.IPAddress.length -gt 1}  | Where{$_.AddressFamily -eq "IPV4"} | Where{$_.PrefixOrigin -eq "DHCP"} 
$LocalIP = foreach ($IP in $Lanscan.IPAddress) { "/$IP\" }
$PublicIP = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
### Last user ###
$LastLoggedOnUser = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\').LastLoggedOnUser;
### OS Install Date ### 
$InstallDate = Get-Date -Date ($OS.ConvertToDateTime($OS.InstallDate))
### Date ###
$date = Get-Date -Format g
### Model ###
$Manufacturer = $ComputerSystem.Manufacturer
### HostName ###
$Hostname = $ComputerSystem.Name
### OS Model ###
$OSCaption = $Os.Caption
### OS Version ###
$OSArchitecture = $Os.OSArchitecture
$Build = $OS.BuildNumber
#Bios Stuff
$computerBIOS = get-wmiobject Win32_BIOS
$computerBIOSSerialNumber = $computerBIOS.SerialNumber
$computerBIOSname = $computerBIOS.name

$Diskscan = Get-PSDrive -PSProvider 'FileSystem'
$Diskroot = $Diskscan.Root

### Debug ###
Write-Host ""
write-host "Scan Date : $date"
Write-Host ""
Write-Host "Local Host" -ForegroundColor Green -BackgroundColor Black
write-host "Hostname : $Hostname"
write-host "Local IP : $LocalIP"
write-host "Public IP Address : $PublicIP"
write-host "Last User : $LastLoggedOnUser"
Write-Host ""
Write-Host "Computer" -ForegroundColor Green -BackgroundColor Black
write-host "Vendor : $Manufacturer"
write-host "Computer Model : $Model"
write-host "Memory : $Memory GB"
write-host "Serial : $computerBIOSSerialNumber"
write-host "Bios Version : $computerBIOSname"
Write-Host ""
Write-Host "Graphic Specs" -ForegroundColor Green -BackgroundColor Black
Write-Host "Video Card : $Graphic"
Write-Host "Graphic Driver : $GraphicDrivers"
Write-Host "Drive Specs" -ForegroundColor Green -BackgroundColor Black
Get-PSDrive -PSProvider 'FileSystem'
Write-Host ""
Write-Host "OS" -ForegroundColor Green -BackgroundColor Black
write-host "Install Date $InstallDate"
write-host "OS : $OsCaption"
write-host "Architecture : $OsArchitecture"
write-host "Build : $Build"
### Debug ###

### Create Log file Hostname.log ###
If (-not (Test-Path "c:\Nox_Script\$hostname.log")) {
	New-Item -ItemType File -Path "c:\Nox_Script" -Name "$hostname.log"
} Else {
	Remove-Item "c:\Nox_Script\$hostname.log"
	New-Item -ItemType File -Path "c:\Nox_Script" -Name "$hostname.log"
}

### Insert Info into Hostname.log ###
$Local= "c:\Nox_Script\$hostname.log"
ADD-content -path $Local -value "-----------------------------------------------"
ADD-content -path $Local -value "Scan Date : $date"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Local Host"
ADD-content -path $Local -value "Hostname : $Hostname"
ADD-content -path $Local -value "Local IP : $LocalIP"
ADD-content -path $Local -value "Public IP Address : $PublicIP"
ADD-content -path $Local -value "Last User : $LastLoggedOnUser"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Computer"
ADD-content -path $Local -value "Vendor : $Manufacturer"
ADD-content -path $Local -value "Computer Model : $Model"
ADD-content -path $Local -value "Memory : $Memory GB"
ADD-content -path $Local -value "Serial : $computerBIOSSerialNumber"
ADD-content -path $Local -value "Bios Version : $computerBIOSname"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "Graphic Specs"
ADD-content -path $Local -value "Video Card : $Graphic"
ADD-content -path $Local -value "Graphic Driver : $GraphicDrivers"
ADD-content -path $Local -value ""
ADD-content -path $Local -value "OS"
ADD-content -path $Local -value "Install Date $InstallDate"
ADD-content -path $Local -value "OS : $OsCaption"
ADD-content -path $Local -value "Architecture : $OsArchitecture"
ADD-content -path $Local -value "Build : $Build"
ADD-content -path $Local -value "-----------------------------------------------"
#########
Write-Host "All is done"
write-host ""
$Open = Read-Host "Open Scan Log ? [y/n] "
if ($Open -eq "y"){write.exe c:\Nox_Script\$hostname.log}
write-host ""
write-host "Thanks You"
Start-sleep -s 5
Exit
}