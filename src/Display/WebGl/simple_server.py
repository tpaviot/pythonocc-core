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

""" A very simple webserver. """

import os
import socket
import webbrowser
import errno


def get_available_port(port):
    """ sometimes, the python webserver is closed but the
    port is not made available for a further call. So let's find
    any available port to prevent such issue. This function:
    * takes a port number (an integer), above 1024
    * check if it is available
    * if not, take another one
    * returns the port numer
    """
    if not port > 1024:
        raise AssertionError("port number should be > 1024")
    # check this port is available
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        s.bind(("127.0.0.1", port))
    except socket.error as e:
        if e.errno == errno.EADDRINUSE:
            print("\nPort %i is already in use. Picking another one." % port)
            # take another one
            s.bind(("", 0))
            port = s.getsockname()[1]
            print("Using port number %i" % port)
        else:
            print("Can't bind to port %i." % port)
    s.close()
    return port


def start_server(addr="127.0.0.1", port=8080, x3d_path='.', open_webbrowser=False):
    """ starts the server if the PYTHONOCC_SHUNT_WEB_SERVER
    env var is not set
    * port: the port number to use (if available) ;
    * path: where thehtml files are located
    * open_webbrower: if True, open the web browser to the correct url
    """
    if os.getenv("PYTHONOCC_SHUNT_WEB_SERVER") == "1":
        return False
    # prefer using Flask, if installed
    try:
        from flask import Flask, send_from_directory
        HAVE_FLASK = True
    except ImportError:
        HAVE_FLASK = False
    if not HAVE_FLASK:  # use simple http server
        from http.server import SimpleHTTPRequestHandler, HTTPServer
        os.chdir(x3d_path)
        port = get_available_port(port)
        httpd = HTTPServer((addr, port), SimpleHTTPRequestHandler)
        print("\n## Serving %s \n## using SimpleHTTPServer" % x3d_path)
        print("## Open your webbrowser at the URL: http://localhost:%i" % port)
        print("## CTRL-C to shutdown the server")
        # open webbrowser
        if open_webbrowser:
            webbrowser.open('http://localhost:%i' % port, new=2)
        # starts the web_server
        httpd.serve_forever()
    else:  # use flask
        # set the project root directory as the static folder, you can set others.
        app = Flask(__name__)

        @app.route('/')
        def root():
            fp = open(os.path.join(x3d_path, 'index.html'))
            html_content = fp.read()
            fp.close()
            return html_content
        @app.route('/<path:path>')
        def send_x3d_content(path):
            return send_from_directory(x3d_path, path)
        print("\n## Serving %s \n## using Flask" % x3d_path)
        print("## Open your webbrowser at the URL: http://localhost:%i" % port)
        print("## CTRL-C to shutdown the server")
        port = get_available_port(port)
        app.run(host=addr, port=port)


if __name__ == "__main__":
    get_available_port(port=8080)
    get_available_port(port=5022)
    start_server(port=8080)
