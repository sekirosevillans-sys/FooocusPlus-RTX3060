@echo off
cd /d "%~dp0"
".venv\Scripts\python.exe" entry_without_update.py --preset 4GB_SDXL --always-low-vram --always-offload-from-vram --mode dark
pause
