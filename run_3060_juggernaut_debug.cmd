@echo off
setlocal
cd /d "%~dp0"
chcp 65001 >nul
title FooocusPlus - diagnostico RTX 3060

if not exist logs mkdir logs
set "LOGFILE=logs\fooocusplus_debug_%RANDOM%.log"

echo ================================================================
echo FooocusPlus - diagnostico de carga
echo ================================================================
echo Carpeta: %CD%
echo Registro: %CD%\%LOGFILE%
echo.
echo --- GPU detectada ---
nvidia-smi --query-gpu=name,memory.total,memory.free,driver_version --format=csv,noheader 2>nul
if errorlevel 1 echo No se pudo consultar nvidia-smi.
echo.
echo --- Checkpoints locales ---
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -LiteralPath '%CD%\models\checkpoints' -File -Include *.safetensors,*.ckpt,*.gguf -ErrorAction SilentlyContinue | Sort-Object Length -Descending | ForEach-Object { '{0}  ({1:N2} GB)' -f $_.Name, ($_.Length/1GB) }"
echo.
echo Pulsa Ctrl+C para cancelar la ejecucion.
echo.
if not exist ".venv\Scripts\python.exe" (
    echo No se encontro .venv\Scripts\python.exe
    pause
    exit /b 1
)
set PYTHONUNBUFFERED=1
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { & '%CD%\.venv\Scripts\python.exe' -u entry_without_update.py --preset Juggernaut8 --always-low-vram --always-offload-from-vram --mode dark 2>&1 | Tee-Object -FilePath '%CD%\%LOGFILE%' }"

echo.
echo FooocusPlus se ha detenido. Registro guardado en:
echo %CD%\%LOGFILE%
pause
endlocal
