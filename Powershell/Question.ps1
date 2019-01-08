##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2UjhTHwqUuqVvJK1zZe5w87juDDUTJQAWmhTlz39OHi+S/sCQfwbs+0FWhImE8YO8abvHv+sC6cSl4M=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
clear-host

while($validation -ne "O") {
write-host "MENU" -ForegroundColor green -BackgroundColor black
Write-Host [1] - Installation OBS
Write-Host [2] - Configuration Steam
Write-Host [3] - Decompression ZIP
Write-Host [4] - Creer un document txt
write-host ""
$Choix = Read-Host "Faites votre choix ? 1 - 4 "

if ($Choix -eq "1") { $Confirme = " Installation OBS" }
if ($Choix -eq "2") { $Confirme = " Configuration Steam" }
if ($Choix -eq "3") { $Confirme = " Decompression ZIP" }
if ($Choix -eq "4") { $Confirme = " Creer un document txt" }
write-host ""
$validation = Read-Host "Vous avez choisi $Confirme [O/N]" }
write-host ""
switch ( $Choix ) 
{
    1 { $Action = 'OBS' }
    2 { $Action = 'Steam' }
    3 { $Action = 'Unzip' }
    4 { $Action = 'AddTXT' }
}

if ($Action -eq "OBS")
{
    Write-host "Script pour installation OBS"
    exit
}

if ( $Action -eq "Steam" )
{
    Write-host "Script pour la configuration de Steam"
    exit
}

if ( $Action -eq "Unzip" )
{
    Write-host "Script pour decompresser avec 7Zip"
    exit
}

if ( $Action -eq "AddTXT" )
{
    Write-host "Script pour creer un document Txt"
    exit
}