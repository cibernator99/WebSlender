# WebSlender

A fan-made, browser-based remake of `Slender: The Eight Pages.`

WebSlender is a free, open-source reimagining of the classic horror game,
rebuilt to run entirely in your web browser using WebGL.

Wander a dark forest at night, collect all 8 pages, and survive — because you are not alone.

> [!NOTE]
> This is a non-commercial fan project made out of love for the original game.
> All rights to the Slender concept and the original `Slender: The Eight Pages` belong to Mark Hadley / Parsec Productions (2012).
> This project is not affiliated with or endorsed by the original author.

## About

You're alone in the woods after dark.
Hidden among the trees and abandoned structures are 8 pages.
Find them all to win — but every page you collect draws him closer.

### Core Mechanic

Looking directly at the Slender Man slows his approach… but drains your sanity. Lose too much, and the static closes in.

### Controls

| **Input Action** | **Key / Mouse**       |
| ---------------- | :-------------------- |
| Move             | **WASD / Arrow keys** |
| Look around      | **Mouse**             |
| Run              | **Shift**             |
| Flashlight       | **F or Right click**  |
| Pick up page     | **Left click**        |
| Pause            | **Esc**               |

## Features

* 🌲 Real-time 3D forest rendered with Three.js (WebGL)
* 🔦 Dynamic flashlight with limited battery
* 🧠 Sanity system — VHS static and a closing vignette as terror rises
* 🎞️ Post-processing effects (bloom, TV/VHS static overlay)
* 🪵 PBR textures (bark, brick, ground, metal, rock, rust, wood) with color/normal/roughness maps
* 📄 Classic 8-pages objective and escalating tension
* 🌐 Runs 100% in the browser — no install required

## How to Play

### Local Play

Modern browsers block local file access (`file://index.html`),
so the game needs to be served over a local web server. A tiny launcher,
`serve.py`, does everything in one step: it picks a free port automatically,
serves the game folder, and opens it in your default browser.

**Requirements:** Python 3.6+ (standard library only — no dependencies to install).
Keep the launcher window/terminal open while playing; closing it stops the server.
Press `Ctrl+C` in that window to quit.

#### Recommended (any OS)

```sh
python serve.py
```

On some systems the command is `python3 serve.py`.

#### Convenience wrappers

If you prefer not to type a command:

- **Windows:** double-click `run.bat`
- **Linux / macOS:** run `./run.sh`

Both wrappers simply call `python serve.py`.

> [!NOTE]
> **Why a `serve.py` instead of doing everything inside `run.bat`?**
> Antivirus / SmartScreen heuristics tend to flag batch files that scan ports,
> start a network server, and auto-open a browser — that chain of actions looks
> like malware even when it is harmless. Moving the logic into a plain Python
> script run through the trusted `python` interpreter avoids those false
> positives, and `serve.py` binds only to `127.0.0.1` (localhost, so no firewall
> prompt) on an OS-assigned free port (no port scanning).

> [!TIP]
> A `run.bat` **downloaded** from the web still carries Windows' "Mark of the Web"
> and may be warned about by SmartScreen. Either run `python serve.py` directly,
> or unblock the file: right-click `run.bat` → **Properties** → check **Unblock**
> (or run `Unblock-File .\run.bat` in PowerShell). Cloning the repo with `git`
> does not add that mark at all.

#### Manual (any OS)

If you'd rather skip the launcher entirely, serve the folder yourself:

```sh
python -m http.server 8000
```

Then open [http://localhost:8000/index.html](http://localhost:8000/index.html) in your browser.

## Project Structure

```plaintext
WebSlender/
├── index.html        # Game entry point (HTML/CSS/JS)
├── three.min.js      # Three.js engine
├── libs/             # Post-processing (EffectComposer, UnrealBloomPass, shaders…)
├── assets/           # PBR textures (color / normal / roughness)
├── serve.py          # Local server launcher (all platforms)
├── run.bat           # Windows convenience wrapper → serve.py
├── run.sh            # Linux / macOS convenience wrapper → serve.py
└── LICENSE           # Full licensing terms
```

## Credits

* Original game: Slender: The Eight Pages by Mark Hadley (Parsec Productions)
* Web remake (WebSlender): fan project by cibernator and the community who wants to help with it
* Engine: Three.js

This project is completely free and open for anyone who wants to play, learn from, or support it. If you enjoy it, please support the original creator first. 💛

## License / Disclaimer

Fan-made and distributed for non-commercial, educational, and entertainment purposes only, no copyright infringement intended.
All Slender trademarks and the original game belong to their respective owners. Made by fans, for fans.

Source code licensed under the MIT License. See [LICENSE](LICENSE) for details.
Game assets and compiled distribution licensed under the
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0).
