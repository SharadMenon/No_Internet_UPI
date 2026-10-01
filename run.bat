@echo off
setlocal
cd /d "%~dp0"

echo ===================================================
echo   UPI Offline Mesh - Starting Backend Server
echo ===================================================
echo.

where java >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Java is not found on your PATH.
    echo Please install JDK 17 or higher and ensure 'java' is in your PATH.
    pause
    exit /b 1
)

echo Java found!
java -version
echo.
echo Launching Spring Boot server on http://localhost:8080 ...
echo (Press Ctrl+C to stop the server)
echo.

call .\mvnw.cmd spring-boot:run
if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] Server exited with error code %ERRORLEVEL%.
    pause
)
endlocal
