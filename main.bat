@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo You need to run the prompt in administrator rights
    pause
    exit /b
)

cd /d "%~dp0"

reg import "scripts resources\Auto_Accept_EULA.reg"
powershell -WindowStyle Hidden -Command "while($true){ Start-Process 'scripts resources\RAMMap.exe' -ArgumentList '-Ew' -WindowStyle Hidden -Wait; Start-Process 'scripts resources\RAMMap.exe' -ArgumentList '-Et' -WindowStyle Hidden -Wait; Start-Sleep -Seconds 300 }"
