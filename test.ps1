# PowerShell script to run UPI Offline Mesh test suite
Set-Location $PSScriptRoot

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  UPI Offline Mesh - Running Test Suite" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

$javaCmd = Get-Command java.exe -ErrorAction SilentlyContinue
if (-not $javaCmd -and $env:JAVA_HOME) {
    if (Test-Path "$env:JAVA_HOME\bin\java.exe") {
        $javaCmd = "$env:JAVA_HOME\bin\java.exe"
    }
}

if (-not $javaCmd) {
    Write-Host "[ERROR] Java executable was not found on PATH or in JAVA_HOME." -ForegroundColor Red
    exit 1
}

& .\mvnw.cmd test

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nAll tests passed successfully!" -ForegroundColor Green
} else {
    Write-Host "`nSome tests failed." -ForegroundColor Red
}
