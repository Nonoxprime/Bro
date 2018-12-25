Clear-Host

Write-Host "This Script need to by run as admin"
Set-ExecutionPolicy Bypass -Scope Process
Start-Sleep -s 2

Write-Host " --- Mini Mining --- "
Write-Host "Tool Version 0.01"
Write-Host ""

### Identification des variable ###
$PoolMining = "stratum+tcp://litecoinpool.org:3333"
$PoolUser = "Nox81.guest"
$PoolPass = "1"

while ($Start -ne "y"){
#### Give Choice ####
if ($miner -eq "n") {
    write-host ""
    write-host "You need to download CPUMiner ... Please Press 'D' " -ForegroundColor red -BackgroundColor Black
    }
if (-not (Test-Path ".\minerd.exe")) {
    write-host "System Check Failed : Missing CPUminer. Press 'D' to download" -ForegroundColor red -BackgroundColor Black
    }
elseif (-not (Test-Path ".\_start_.bat")) {
    write-host "System Check Failed : Missing Conf file. Press 'C' to generate" -ForegroundColor red -BackgroundColor Black }
    else {write-host "System Check done : ready to mine " -ForegroundColor green -BackgroundColor Black
        }

Write-Host ""
write-host "Config" -ForegroundColor Green -BackgroundColor Black
Write-Host [D] - Download CPU Miner
Write-Host [1] - Mining Pool Conf
Write-Host [2] - User.worker 
Write-Host [C] - check config
Write-Host [S] - Start Mining
Write-Host [Q] - Quit 
Write-Host ""

write-host "SELECT" -ForegroundColor Green -BackgroundColor Black
$Choix = Read-Host "Select ? " 
Write-Host ""

switch ( $Choix )
{
    D { $Action = 'Download'}
    1 { $Action = 'Conf_pool'}
	2 { $Action = 'Conf_User'}
    C { $Action = 'Check'}
    S { $Action = 'Start'}
	Q { $Action = 'Q'}
}

### Download Files
if ($Action -eq "Download") {
    Clear-Host
    Invoke-WebRequest -Uri "https://gameoverblog.fr/Scripting/Cpuminer-2.5.0.zip" -OutFile ".\Cpuminer.zip"
    expand-archive -path '.\Cpuminer.zip' -destinationpath '.\'
    Remove-Item .\Cpuminer.zip
    $miner = "y"
}
### Config Pool Acces ###
if ($Action -eq "Conf_Pool") {
    Clear-Host 
    $PoolMining = Read-Host "Mining Pool Addres - (Default: stratum+tcp://litecoinpool.org:3333) "
        if ($PoolMining -eq $null) {$PoolMining = "stratum+tcp://litecoinpool.org:3333"}
        clear-host
}

if ($Action -eq "Conf_User") {
    Clear-Host
    $PoolUser = Read-Host "Pool User Like User.worker - (Default: Nox81.guest) "
        if ($PoolUser -eq $null) {$PoolUser = "Nox81.guest"}
    $PoolPass = Read-Host "Worker Password (Default: What you want) "
        if ($PoolPass -eq $null) {$PoolPass = "1"}
        clear-host
}

if ($Action -eq "Check") {
    Clear-Host
    Write-host "Configuration File" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your Pool Mining set on : " -NoNewline 
    Write-host "$PoolMining" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your User and Worker set on : " -NoNewline 
    Write-host "$PoolUser" -ForegroundColor Green -BackgroundColor Black
    Write-host "Your Pass for $PoolUser is set on :" -NoNewline 
    Write-host "$PoolPass" -ForegroundColor Green -BackgroundColor Black
    Write-host ""
    $Job = "Processing"

while ($Job -ne "d"){
    write-host "CONFIGURATION" -ForegroundColor Yellow -BackgroundColor Black
    if ($write -eq "y") {
                        write-host ""
                        write-host "Configugartion  Saved" -ForegroundColor red -BackgroundColor Black
                        }
    write-host ""
                        write-host "Menu" -ForegroundColor Green -BackgroundColor Black
                        Write-Host [w] - Write Conf file
                        Write-Host [v] - verifying conf
                        Write-Host [s] - Start Job
                        Write-Host [r] - Return
                        Write-host ""
                        $Job = read-host "Your Choice "

                        if ($Job -eq "v")   {
                            Clear-Host
                            Write-Host ""
                            write-host "verifying Conf"           
                            Write-Host ""
                            if (-not (Test-Path ".\_start_.bat")) {
                                Write-host "Waiting Configuration File" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your Pool Mining set on : " -NoNewline 
                                Write-host "$PoolMining" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your User and Worker set on : " -NoNewline 
                                Write-host "$PoolUser" -ForegroundColor Green -BackgroundColor Black
                                Write-host "Your Pass for $PoolUser is set on :" -NoNewline 
                                Write-host "$PoolPass" -ForegroundColor Green -BackgroundColor Black
                                Write-host ""
                                write-host "System Check Failed : Missing Conf file. Press 'w' to generate" -ForegroundColor red -BackgroundColor Black
                                Write-Host ""
                             }
                          else {$check = Get-Content -Path ".\_start_.bat" | where { $_ -ne "$null" } | Select-Object -Index 0
                          Write-Host $check}
                        }

                    if ($Job -eq "w")   {
                        Write-Host ""
                        write-host "Writing _Start_.bat"           
                        Write-Host ""
                        del *.bat
                        New-Item -Path ".\" -Name "_Start_.bat" -ItemType file
                        Write-Host ""
                        $escape = ":"
                        $Confsetup= ".\_Start_.bat"
                        ADD-content -path $Confsetup -value "minerd --url=$Poolmining --userpass=$PoolUser$escape$PoolPass"
                        $write ="y"
                    }
                    if ($Job -eq "s")   {
                                        write-host "Start Job"
                                        If (-not (Test-Path ".\minerd.exe")) {
                                            Write-host "CpuMiner Not present please Download it" -ForegroundColor red -BackgroundColor Black
                                            $Job = "r"
                                            $miner = "n"
                                            start-Sleep -s 3
                                        }
                                        $Start = "y"
                                        Write-Host ""
                                        .\_Start_.bat
                                    }
                    if ($job -eq "r")   {clear-host
                                        $Start = "N"
                                        $Job = "d"}
                    }

                    }

if ($Action -eq "Start"){
    Clear-Host
    write-host "Start Job"
    Write-Host ""
    .\_Start_.bat
    Write-Host ""
}
if ($Action -eq "Q"){Exit}
}