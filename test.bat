@echo off
setlocal
cd /d "%~dp0"

echo ===================================================
echo   UPI Offline Mesh - Running Test Suite
echo ===================================================
echo.

call .\mvnw.cmd test
if %ERRORLEVEL% equ 0 (
    echo.
    echo ===================================================
    echo   All tests passed successfully!
    echo ===================================================
) else (
    echo.
    echo [ERROR] Some tests failed.
)
pause
endlocal
