@echo off
setlocal enabledelayedexpansion
title Slender Web - lanzador
cd /d "%~dp0"

rem Find a free port starting at 8000
set PORT=8000
:checkport
netstat -an | findstr /r /c:"[:.]%PORT% .*LISTENING" >nul
if not errorlevel 1 (
    set /a PORT+=1
    goto checkport
)

echo.
echo   SLENDER: THE EIGHT PAGES (Web)
echo   Iniciando servidor local en http://localhost:%PORT% ...
echo.
start "Slender server (NO cerrar mientras juegas)" python -m http.server %PORT%
timeout /t 2 /nobreak >nul
start "" "http://localhost:%PORT%/index.html"
echo   Listo. El juego se abrio en tu navegador.
echo   Para DETENER el juego, cierra la ventana del servidor.
echo   (Esta ventana se cerrara sola)
timeout /t 3 /nobreak >nul
exit
