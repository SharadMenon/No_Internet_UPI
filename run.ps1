# PowerShell runtime script for UPI Offline Mesh Backend
Set-Location $PSScriptRoot

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "  UPI Offline Mesh - Starting Backend Server" -ForegroundColor Cyan
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
    Write-Host "Please install JDK 17+ and make sure 'java' is accessible in PATH." -ForegroundColor Red
    exit 1
}

Write-Host "Java detected: $(if ($javaCmd.Source) { $javaCmd.Source } else { $javaCmd })" -ForegroundColor Green
Write-Host ""
Write-Host "Launching Spring Boot server on http://localhost:8080 ..." -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop the server.`n" -ForegroundColor DarkGray

& .\mvnw.cmd spring-boot:run
