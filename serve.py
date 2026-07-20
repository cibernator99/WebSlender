#!/usr/bin/env python3
"""
Slender Web - local launcher.

Starts a tiny static file server for the game in THIS folder, opens the game
in your default web browser, and keeps running until you press Ctrl+C.

Why a .py instead of doing everything in a .bat:
  Antivirus / SmartScreen heuristics tend to flag batch files that scan ports
  with netstat, spawn a network server, and then pop open a browser -- that
  chain of actions looks like malware. Here the same work is done by a plain,
  readable Python script run through the trusted python interpreter, which
  avoids those heuristics. See README.md for the full explanation.

Requires: Python 3.6+  (standard library only, no dependencies).
"""

import os
import sys
import webbrowser
from functools import partial

try:
    # Python 3.7+ ships a threaded server so multiple asset requests
    # (images, JS, audio) can be served at once without blocking.
    from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer as _Server
except ImportError:  # Python 3.6 has no ThreadingHTTPServer
    from http.server import SimpleHTTPRequestHandler, HTTPServer as _Server

HOST = "127.0.0.1"   # localhost only: no Windows Firewall prompt, not network-exposed
PORT = 0             # 0 = ask the OS for a free port (so we never have to scan ports)
PAGE = "index.html"  # the file to open in the browser


def make_handler(root):
    """Return a request handler that serves `root`, on any Python 3.6+."""
    if sys.version_info >= (3, 7):
        # SimpleHTTPRequestHandler gained a `directory=` argument in 3.7.
        return partial(SimpleHTTPRequestHandler, directory=root)
    # Python 3.6 fallback: the handler serves the process working directory,
    # so switch into the game folder before serving.
    os.chdir(root)
    return SimpleHTTPRequestHandler


def main():
    # Serve the folder that contains THIS script, regardless of where the
    # launcher was invoked from (double-click, different cwd, etc.).
    root = os.path.dirname(os.path.abspath(__file__))
    handler = make_handler(root)

    # Bind to port 0 and read back the port the OS actually assigned.
    server = _Server((HOST, PORT), handler)
    port = server.server_address[1]
    # Use the SAME literal IPv4 address we bound to (not the name "localhost").
    # On many systems "localhost" resolves to IPv6 ::1 first; since we only bind
    # IPv4 127.0.0.1, a "localhost" URL can stall for seconds on the dead IPv6
    # attempt before falling back. 127.0.0.1 connects immediately.
    url = "http://{0}:{1}/{2}".format(HOST, port, PAGE)

    bar = "=" * 60
    print(bar)
    print("  SLENDER: THE EIGHT PAGES (Web)")
    print(bar)
    print("  Serving : {0}".format(root))
    print("  Address : {0}".format(url))
    print("")
    print("  Your browser should open automatically.")
    print("  If it does not, open the address above manually.")
    print("")
    print("  >> Keep this window open while you play. <<")
    print("  Press Ctrl+C here to stop the server and quit.")
    print(bar)

    try:
        # Opening the browser must never crash the launcher (e.g. headless box).
        try:
            webbrowser.open(url)
        except Exception:
            print("  (Could not launch a browser automatically -- open the URL yourself.)")

        server.serve_forever()
    except KeyboardInterrupt:
        # Also covers Ctrl+C during the browser-launch step above.
        print("\n  Stopping server... goodbye!")
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
