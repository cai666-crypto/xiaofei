@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ==========================================
echo   AI Shopping Copilot - Streamlit Demo
echo ==========================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found.
    echo Please install Python 3.9+ from https://www.python.org/downloads/
    echo During install, remember to check "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)

echo [1/3] Python OK
python --version
echo.

echo [2/3] Installing Streamlit, first run may take 1-2 minutes ...
python -m pip install --upgrade streamlit -q
if errorlevel 1 (
    echo [WARN] pip install failed, trying mirror ...
    python -m pip install --upgrade streamlit -i https://pypi.tuna.tsinghua.edu.cn/simple -q
)
echo.

echo [3/3] Starting demo, browser will open automatically
echo Address: http://localhost:8501
echo Press Ctrl+C in this window to stop.
echo.

python -m streamlit run app.py

pause
