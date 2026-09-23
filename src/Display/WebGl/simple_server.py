##Copyright 2016 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""A very simple webserver."""

import errno
import functools
import os
import socket
import webbrowser


def get_available_port(port: int) -> int:
    """
    Gets an available port.

    Sometimes, the python webserver is closed but the port is not made
    available for a further call. So let's find any available port to
    prevent such issue. This function:
    - takes a port number (an integer), above 1024
    - check if it is available
    - if not, take another one
    - returns the port number

    Args:
        port (int): The port to check.

    Returns:
        int: An available port.
    """
    if port <= 1024:
        raise ValueError("port number should be > 1024")
    # check this port is available. The check is not atomic: the port may be
    # taken between the check and the start of the server, which is unlikely
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.bind(("127.0.0.1", port))
        except OSError as e:
            if e.errno != errno.EADDRINUSE:
                raise
            print(f"\nPort {port} is already in use. Picking another one.")
            # take any free one
            s.bind(("127.0.0.1", 0))
            port = s.getsockname()[1]
            print(f"Using port number {port}")
    return port


def get_interface_ip(family: socket.AddressFamily) -> str:
    """
    Get the IP address of an external interface.

    Used when binding to 0.0.0.0 or ::1 to show a more useful URL.
    Inspired by `werkzeug`.

    Args:
        family (socket.AddressFamily): The address family.

    Returns:
        str: The IP address.
    """
    # arbitrary private address
    host = "2001:db8::1" if family == socket.AF_INET6 else "192.0.2.1"

    with socket.socket(family, socket.SOCK_DGRAM) as s:
        try:
            s.connect((host, 58162))
        except OSError:
            return "::1" if family == socket.AF_INET6 else "127.0.0.1"

        return s.getsockname()[0]  # type: ignore


def start_server(
    addr: str = "127.0.0.1",
    port: int = 8080,
    x3d_path: str = ".",
    open_webbrowser: bool = False,
) -> None:
    """
    Starts a simple web server.

    The server is started if the PYTHONOCC_SHUNT_WEB_SERVER environment
    variable is not set.

    Args:
        addr (str, optional): The address to bind to.
        port (int, optional): The port to use.
        x3d_path (str, optional): The path to the HTML files.
        open_webbrowser (bool, optional): Whether to open a web browser.
    """
    if os.getenv("PYTHONOCC_SHUNT_WEB_SERVER") == "1":
        return
    # prefer using Flask, if installed
    try:
        from flask import Flask, send_from_directory

        HAVE_FLASK = True
    except ImportError:
        HAVE_FLASK = False
    if not HAVE_FLASK:  # use simple http server
        from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer

        # the browser requests the json/x3d files in parallel, serve them from
        # x3d_path without changing the working directory of the process
        handler = functools.partial(SimpleHTTPRequestHandler, directory=x3d_path)
        port = get_available_port(port)
        httpd = ThreadingHTTPServer((addr, port), handler)
        print(f"\n## Serving {x3d_path} using SimpleHTTPServer")
        # Did not consider ipv6 `::` because httpd does not support it
        if addr == "0.0.0.0":
            display_hostname = get_interface_ip(socket.AF_INET)
            print(f"## Running on all addresses ({addr})")
        elif addr in ("127.0.0.1", "localhost"):
            display_hostname = "localhost"
        else:
            display_hostname = addr
        url = f"http://{display_hostname}:{port}"
        print(f"## Open your webbrowser at the URL: {url}")
        # open webbrowser
        if open_webbrowser:
            webbrowser.open(url, new=2)
        # starts the web_server
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n## Server stopped")
        finally:
            httpd.server_close()
    else:  # use flask
        # set the project root directory as the static folder, you can set others.
        app = Flask(__name__)

        @app.route("/")
        def root():
            with open(os.path.join(x3d_path, "index.html"), encoding="utf-8") as fp:
                return fp.read()

        @app.route("/<path:path>")
        def send_x3d_content(path):
            return send_from_directory(x3d_path, path)

        print(f"\n## Serving {x3d_path} using Flask")

        port = get_available_port(port)
        app.run(host=addr, port=port)


if __name__ == "__main__":
    get_available_port(port=8080)
    get_available_port(port=5022)
    start_server(addr="0.0.0.0", port=8080)
