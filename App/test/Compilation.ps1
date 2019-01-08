$inputfile = Read-Host "Where is you Script ? "
$outputfile = Read-Host "Compilation Name ? "
$iconfile = Read-host "Where is your Ico ? (leave blank if don't) "

if ($iconfile -eq $null) {$ico = ""}
else {$ico = $iconfile }

.\Labo\ps2exe.ps1 -inputFile $inputfile -outputFile $outputfile -iconFile $ico