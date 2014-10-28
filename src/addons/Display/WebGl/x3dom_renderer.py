##Copyright 2011-2014 Thomas Paviot (tpaviot@gmail.com)
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

from __future__ import print_function

import webbrowser
from OCC.Visualization import Tesselator
import OCC
from time import time
import os

# <script type="text/javascript" src="@x3dom-full.jsPath@/x3dom-full.js"></script>
    
HEADER = """
<head>
    <title>pythonOCC @VERSION@ x3dom renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonOCC'>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="@jspath@/x3dom.css" charset="utf-8" ></link>
    <script type="text/javascript" src="@jspath@/x3dom-full.js"></script>
    <style type="text/css">
        body {
            background-color: @background-color@;
            margin: 0px;
            overflow: hidden;
        }
        #info {
            position: absolute;
            top: 96%;
            width: 96%;
            color: #808080;
            padding: 5px;
            font-family: Monospace;
            font-size: 13px;
            text-align: right;
            opacity: 1;
            }
        #pythonocc_rocks {
            padding: 5px;
            position: absolute;
            left: 1%;
            top: 85%;
            height: 60px;
            width: 305px;
            border-radius: 5px;
            border: 2px solid #f7941e;
            opacity: 0.7;
            font-family: Arial;
            background-color: #414042;
            color: #ffffff;
            font-size: 16px;
            opacity: 0.7;
        }
        a {
            color: #f7941e;
            text-decoration: none;
        }
        a:hover {
            color: #ffffff;
        }
    </style>
</head>
"""

BODY = """
<body>
    <div id="x3d_scene">@X3DSCENE@</div>
    <div id="info">
        <a href="htpp://www.x3dom.org" target="_blank"> x3dom </a> based renderer
    </div>
    <div id="pythonocc_rocks">
        <b>pythonOCC @VERSION@ x3dom renderer</b><hr>
        CAD in a browser
        <a style="font-size:14px;" href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>
    <script>
    x3dom.runtime.ready = function()
    {
        document.getElementsByTagName('x3d')[0].runtime.showAll();
    }
    </script>
</body>
"""


class HTMLHeader(object):
    def __init__(self, background_color='#000000'):
        self._background_color = background_color

    def get_str(self):
        x3dom_build_location = os.sep.join([OCC.__path__[0], 'Display', 'WebGl', 'js'])
        header_str = HEADER.replace('@background-color@', '%s' % self._background_color)
        header_str = header_str.replace('@jspath@', '%s' % x3dom_build_location)
        header_str = header_str.replace('@VERSION@', OCC.VERSION)
        return header_str


class HTMLBody(object):
    def __init__(self, background_color='#000000'):
        self._background_color = background_color

    def get_str(self):
        # get the location where pythonocc is running from
        body_str = BODY.replace('@background-color@', '%s' % self._background_color)
        body_str = body_str.replace('@VERSION@', OCC.VERSION)
        x3dfile_content = open('shape.x3d', 'r').read()
        body_str = body_str.replace('@X3DSCENE@', x3dfile_content)
        return body_str


class X3DomRenderer:
    def __init__(self, background_color="#123345"):
        self._x3d_filename = "shape.x3d"
        self._html_filename = "x3dom_topods_shape.html"
        self._background_color = background_color

    def DisplayShape(self, shape):
        self._shape = shape
        print("Tesselate shape ...")
        t0 = time()
        tess = Tesselator(self._shape)
        t1 = time()
        print("done in %f s." % (t1-t0))
        print("Exporting tesselation to X3D ...")
        t2 = time()
        tess.ExportShapeToX3D(self._x3d_filename)
        t3 = time()
        print("done in %f s." % (t3-t2))
        print("Generating HTML stream ...")
        self.GenerateHTMLFile()
        print("done.")
        print("Opening html output in the default webbrowser ...")
        # open the file in the browser
        _path = "file:///{0}".format(os.path.join(os.getcwd(), self._html_filename))
        webbrowser.open_new_tab(_path)

    def GenerateHTMLFile(self):
        """ Generate the HTML file to be rendered wy the web browser
        """
        fp = open(self._html_filename, "w")
        fp.write("<!DOCTYPE HTML>")
        fp.write('<html lang="en">')
        # header
        fp.write(HTMLHeader(self._background_color).get_str())
        # body
        fp.write(HTMLBody(self._background_color).get_str())
        fp.write("</html>\n")
        fp.close()

if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box_shp = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
    my_ren = X3DomRenderer()
    my_ren.DisplayShape(box_shp)
