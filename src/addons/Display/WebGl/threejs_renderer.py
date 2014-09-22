##Copyright 2011-2013 Thomas Paviot (tpaviot@gmail.com)
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
from html_file import HTMLHeader, HTMLBody
from time import time
import os


class ThreejsRenderer:
    def __init__(self, background_color="#000000", vertex_shader=None, fragment_shader=None):
        self._js_filename = "shape.js"
        self._html_filename = "webgl_topods_shape.html"
        self._background_color = background_color
        self._vertex_shader = vertex_shader
        self._fragment_shader = fragment_shader

    def set_vertex_shader(self, vertex_shader):
        ''' adds a vertex shader definition '''
        self._vertex_shader = vertex_shader

    def set_fragment_shader(self, fragment_shader):
        ''' adds a fragment shader '''
        self._fragment_shader = fragment_shader

    def DisplayShape(self, shape):
        self._shape = shape
        print("Tesselate shape ...")
        t0 = time()
        tess = Tesselator(self._shape)
        t1 = time()
        print("done in %f s." % (t1-t0))
        print("Exporting tesselation to JSON ...")
        t2 = time()
        tess.ExportShapeToJSON(self._js_filename)
        t3 = time()
        print("done in %f s." % (t3-t2))
        print("Generating HTML stream ...")
        self.GenerateHTMLFile()
        print("done.")
        print("Opening html output in the default webbrowser ...")
        # previous version us a os.system call to the "open" command
        # but this is a platform (osx) specific solution
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
        fp.write(HTMLBody(self._background_color,
                          self._vertex_shader,
                          self._fragment_shader).get_str())
        fp.write("</html>\n")
        fp.close()

if __name__ == "__name__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box_shp = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
    my_ren = ThreejsRenderer()
    my_ren.DisplayShape(box_shp)
