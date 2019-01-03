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