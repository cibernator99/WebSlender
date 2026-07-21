@echo off
rem Slender Web launcher. All logic lives in serve.py.
cd /d "%~dp0"

rem Find a working Python. Try the Windows launcher first (most reliable),
rem then python, then python3 -- covers store/installer/PATH variations.
where py >nul 2>nul
if %errorlevel%==0 (
    py -3 serve.py
    goto :eof
)
where python >nul 2>nul
if %errorlevel%==0 (
    python serve.py
    goto :eof
)
where python3 >nul 2>nul
if %errorlevel%==0 (
    python3 serve.py
    goto :eof
)

echo.
echo   No se encontro Python 3 en el PATH.
echo   Instalalo desde https://www.python.org/downloads/
echo   (marca "Add Python to PATH" al instalar) y vuelve a ejecutar este archivo.
echo   O corre el juego manualmente:  python serve.py
echo.
pause
