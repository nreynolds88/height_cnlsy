param(
    [string]$StataExe = "C:\Program Files\StataNow19\StataMP-64.exe",
    [string]$DoFile = "code/00_master.do",
    [string]$LogDir = "results/logs"
)

if (-not (Test-Path $StataExe)) {
    Write-Error "Stata executable not found: $StataExe"
    exit 1
}

if (-not (Test-Path $DoFile)) {
    Write-Error "Do-file not found: $DoFile"
    exit 1
}

if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
}

$before = Get-ChildItem -Path $LogDir -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$proc = Start-Process -FilePath $StataExe -ArgumentList "/e do `"$DoFile`"" -NoNewWindow -PassThru -Wait
$after = Get-ChildItem -Path $LogDir -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $after) {
    Write-Error "No log file found after run. Treating as failure."
    exit 2
}

if ($before -and $after.FullName -eq $before.FullName -and $after.LastWriteTime -le $before.LastWriteTime) {
    Write-Error "No new log file detected after run. Stata process exited with code $($proc.ExitCode)."
    exit 3
}

$logText = Get-Content -Raw -Path $after.FullName
if ($logText -match "Pipeline finished successfully\\.") {
    Write-Host "Pipeline reported success. Log: $($after.FullName)"
    exit 0
}

Write-Error "Pipeline did not report success. Check log: $($after.FullName)"
exit 4
