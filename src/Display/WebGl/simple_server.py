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


def start_server(port):
    """ starts the server if the PYTHONOCC_SHUNT_WEB_SERVER
    env var is not set
    """
    if os.getenv("PYTHONOCC_SHUNT_WEB_SERVER") == "1":
        return False
    else:
        try:
            from SimpleHTTPServer import SimpleHTTPRequestHandler as handler
            from BaseHTTPServer import HTTPServer as server
        except:
            from http.server import (SimpleHTTPRequestHandler as handler,
                                     HTTPServer as server)
        httpd = server(("", port), handler)
        httpd.serve_forever()


if __name__ == "__main__":
    start_server(8080)
