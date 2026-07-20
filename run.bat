@echo off
title Slender Web - lanzador
cd /d "%~dp0"
echo.
echo   SLENDER: THE EIGHT PAGES (Web)
echo   Iniciando servidor local en http://localhost:8000 ...
echo.
start "Slender server (NO cerrar mientras juegas)" python -m http.server 8000
timeout /t 2 /nobreak >nul
start "" "http://localhost:8000/index.html"
echo   Listo. El juego se abrio en tu navegador.
echo   Para DETENER el juego, cierra la ventana del servidor.
echo   (Esta ventana se cerrara sola)
timeout /t 3 /nobreak >nul
exit
