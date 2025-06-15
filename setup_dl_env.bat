@echo off
REM =============================================================
REM Deep Learning GPU Environment Setup Script for Windows
REM Author: nayandas69
REM =============================================================

setlocal
set ENV_NAME=dl_env

echo.
echo ============================================================
echo [1/4] Creating Conda environment: %ENV_NAME%
echo ============================================================

call conda env create -f dl_env.yml
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to create conda environment. Check dl_env.yml for issues.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo [2/4] Activating environment and generating GPU test script
echo ============================================================

REM You can adjust this path if Anaconda is installed elsewhere
call "%UserProfile%\anaconda3\Scripts\activate.bat" %ENV_NAME%

REM Create a Python script to test GPU support
> test_gpu.py (
    echo # -*- coding: utf-8 -*-
    echo import torch
    echo print("Total GPUs:", torch.cuda.device_count())
    echo print("GPU Name:", torch.cuda.get_device_name(0) if torch.cuda.is_available() else "No GPU found")
    echo device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    echo print("Using device:", device)
)

echo.
echo ============================================================
echo [3/4] Running GPU test script
echo ============================================================

python test_gpu.py

echo.
echo ============================================================
echo [4/4] Setup Complete
echo Environment '%ENV_NAME%' is ready to use.
echo ============================================================

pause
endlocal
