#!/usr/bin/env bash
# Slender Web - lanzador

cd "$(dirname "$0")" || exit 1

# Find a free port starting at 8000
PORT=8000
while ss -tln | grep -q ":$PORT "; do
    PORT=$((PORT+1))
done
URL="http://localhost:$PORT/index.html"

echo
echo "  SLENDER: THE EIGHT PAGES (Web)"
echo "  Iniciando servidor local en $URL ..."
echo

python3 -m http.server "$PORT" 2>&1 >/dev/null &
SERVER_PID=$!

sleep 2

URL="http://localhost:$PORT/index.html"
if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL"        # Linux
elif command -v open >/dev/null 2>&1; then
    open "$URL"            # macOS
else
    echo "  Abre manualmente: $URL"
fi

echo "  Listo. El juego se abrio en tu navegador."
echo "  Para DETENER el juego, presiona Ctrl+C en esta terminal."
echo "  (Servidor corriendo con PID $SERVER_PID)"

# Keep the script alive so the server stays up; Ctrl+C kills both
trap "kill $SERVER_PID 2>/dev/null; exit 0" INT TERM
wait $SERVER_PID
