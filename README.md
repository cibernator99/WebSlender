WebSlender
A fan-made, browser-based remake of Slender: The Eight Pages.

WebSlender is a free, open-source reimagining of the classic horror game, rebuilt to run entirely in your web browser using WebGL. Wander a dark forest at night, collect all 8 pages, and survive — because you are not alone.

⚠️ This is a non-commercial fan project made out of love for the original game. All rights to the Slender concept and the original Slender: The Eight Pages belong to Mark Hadley / Parsec Productions (2012). This project is not affiliated with or endorsed by the original author.

About
You're alone in the woods after dark. Hidden among the trees and abandoned structures are 8 pages. Find them all to win — but every page you collect draws him closer.

The core mechanic: looking directly at the Slender Man slows his approach… but drains your sanity. Lose too much, and the static closes in.

Controls
Input	Action
WASD / Arrow keys	Move
Mouse	Look around
Shift	Run
F or Right click	Flashlight
Left click	Pick up page
Esc	Pause
✨ Features
🌲 Real-time 3D forest rendered with Three.js (WebGL)
🔦 Dynamic flashlight with limited battery
🧠 Sanity system — VHS static and a closing vignette as terror rises
🎞️ Post-processing effects (bloom, TV/VHS static overlay)
🪵 PBR textures (bark, brick, ground, metal, rock, rust, wood) with color/normal/roughness maps
📄 Classic 8-pages objective and escalating tension
🌐 Runs 100% in the browser — no install required
🚀 How to Play
The game needs to be served over a local web server (loading index.html directly won't load the assets correctly).

Easiest way (Windows)
Double-click run.bat. It starts a local server and opens the game in your browser automatically.

Requires Python installed. Keep the server window open while playing; close it to stop.

Manual way (any OS)
From the project folder, run:


python -m http.server 8000
Then open http://localhost:8000/index.html in your browser.

Project Structure

WebSlender/
├── index.html        # Game entry point (HTML/CSS/JS)
├── three.min.js      # Three.js engine
├── libs/             # Post-processing (EffectComposer, UnrealBloomPass, shaders…)
├── assets/           # PBR textures (color / normal / roughness)
└── run.bat           # Local server launcher (Windows)
Credits
Original game: Slender: The Eight Pages by Mark Hadley (Parsec Productions)
Web remake (WebSlender): fan project by cibernator and the community who wants to help with it
Engine: Three.js
This project is completely free and open for anyone who wants to play, learn from, or support it. If you enjoy it, please support the original creator first. 💛

License / Disclaimer
Fan-made and distributed for non-commercial, educational, and entertainment purposes only. All Slender trademarks and the original game belong to their respective owners. Made by fans, for fans.
