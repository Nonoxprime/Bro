### By Nox Prime for Gameoverblog.fr ###
### 1.515.19 ###

### If you want to Help me with coffee/Vodka ... or Both :) ?: 

### Vodka or Coffee Donation ###
### LTC : LP9QYLNG7HEXFPawhoPJqJizFvXkyeuRUb
### BTC : 3NZk6iirCUGe8WPtXTUWGZudni2CC2BjCu
### XMR : 4GdoN7NCTi8a5gZug7PrwZNKjvHFmKeV11L6pNJPgj5QNEHsN6eeX3DaAQFwZ1ufD4LYCZKArktt113W7QjWvQ7CWEwrVU97D5U8RrdECm

### Found News on 
## Site : https://Gameoverblog.fr
## GITHUB : https://github.com/Nonoxprime/Bro
### Thanks for your help, enjoy this script

### HOW I CAN RUN THIS SCRIPT ###
<#
Create a folder named Nox_Script
Copy scripts inside this folder
Open Powershell
Use this command to go in your folder : cd C:/Nox_Script
Run this : Set-ExecutionPolicy Bypass -Scope Process
Validate script execution with T (Tout) or A (All)
Enjoy
#>

Set-ExecutionPolicy Bypass -Scope Process

### Directory Creation ###
if (-not (Test-Path ".\Config")) {New-Item -Path ".\" -Name "Config" -ItemType Directory -force}
if (-not (Test-Path ".\Soft")) {New-Item -Path ".\" -Name "Soft" -ItemType Directory -force}
if (-not (Test-Path ".\Download")) {New-Item -Path ".\" -Name "Download" -ItemType Directory -force}

### Download File ###
Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/InMymine.zip" -OutFile ".\Download\InMymine.zip"
expand-archive -path '.\Download\InMymine.zip' -destinationpath '.\' -Force

### Run Program ###
.\InMyMine.ps1
exit