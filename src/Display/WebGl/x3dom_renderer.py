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
import tempfile

from OCC.Visualization import Tesselator
from OCC.TopExp import TopExp_Explorer
from OCC.TopAbs import TopAbs_FACE
import OCC
import os
try:  # python2
    import urlparse
    import urllib
except ImportError:  # python3
    import urllib.parse as urlparse
    import urllib.request as urllib

# <script type="text/javascript" src="@x3dom-full.jsPath@/x3dom-full.js"></script>
    
HEADER = """
<head>
    <title>pythonOCC @VERSION@ x3dom renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonOCC'>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="@jspath@/x3dom.css" charset="utf-8" ></link>
    <script type="text/javascript" src="@jspath@/x3dom-full.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
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
        #selection_info {
            padding: 5px;
            position: absolute;
            left: 85%;
            top: 1%;
            height: 60px;
            width: 200px;
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
    <div id="selection_info">
        <b>Selection</b><hr>
        <span id="lastClickedObject">id: -</span>
    </div>
    <script>
    x3dom.runtime.ready = function()
    {
        document.getElementsByTagName('x3d')[0].runtime.showAll();
    }
    </script>
     <script>
        //Round a float value to x.xx format
        function roundWithTwoDecimals(value)
        {
            return (Math.round(value * 100)) / 100;
        }
        //Handle click on any group member
        function handleGroupClick(event)
        {
            console.log(event);
            //Display coordinates of hitting point (rounded)
            //var coordinates = event.hitPnt;
            //$('#coordX').html(roundWithTwoDecimals(coordinates[0]));
            //$('#coordY').html(roundWithTwoDecimals(coordinates[1]));
            //$('#coordZ').html(roundWithTwoDecimals(coordinates[2]));
        }
        //Handle click on a shape
        function handleSingleClick(shape)
        {
            $('#lastClickedObject').html('id: ' + $(shape).attr("def"));
        }
        $(document).ready(function(){
            //Add a onclick callback to every shape
            $("shape").each(function() {
                $(this).attr("onclick", "handleSingleClick(this)");
            });
        });
        </script>
</body>
"""


def path2url(path):
    """
    Converts a file path into a file URL
    """
    return urlparse.urljoin('file:', urllib.pathname2url(path))


class HTMLHeader(object):
    def __init__(self, background_color='#000000'):
        self._background_color = background_color

    def get_str(self):
        x3dom_build_location = path2url(os.sep.join([OCC.__path__[0], 'Display', 'WebGl', 'js']))
        header_str = HEADER.replace('@background-color@', '%s' % self._background_color)
        header_str = header_str.replace('@jspath@', '%s' % x3dom_build_location)
        header_str = header_str.replace('@VERSION@', OCC.VERSION)
        return header_str


class HTMLBody(object):
    def __init__(self, background_color, x3d_filename):
        self._background_color = background_color
        self._x3d_filename = x3d_filename

    def get_str(self):
        # get the location where pythonocc is running from
        body_str = BODY.replace('@background-color@', '%s' % self._background_color)
        body_str = body_str.replace('@VERSION@', OCC.VERSION)
        x3dfile = open(self._x3d_filename, 'r')
        x3dfile_content = x3dfile.read()
        x3dfile.close()
        body_str = body_str.replace('@X3DSCENE@', x3dfile_content)
        return body_str


class X3DExporter(object):
    """ A class for exporting a TopoDS_Shape to an x3d file """
    def __init__(self, shape, vertex_shader=None, fragment_shader=None, map_faces_to_mesh=False):
        self._shape = shape
        self._vs = vertex_shader
        self._fs = fragment_shader
        self._map_faces_to_mesh = map_faces_to_mesh
        # the list of indexed face sets that compose the shape
        self._indexed_face_sets = []

    def compute(self):
        # get faces
        explorer = TopExp_Explorer()
        explorer.Init(self._shape, TopAbs_FACE)
        if self._map_faces_to_mesh:  # one mesh per face
            faces = []
            while explorer.More():
                current_face = explorer.Current()
                faces.append(current_face)
                explorer.Next()
            # loop over faces
            for face in faces:
                face_tesselator = Tesselator(face)
                self._indexed_face_sets.append(face_tesselator.ExportShapeToX3DIndexedFaceSet())
        else:  # only one mesh for the whole shape
            shape_tesselator = Tesselator(self._shape)
            self._indexed_face_sets.append(shape_tesselator.ExportShapeToX3DIndexedFaceSet())

    def write_to_file(self, filename):
        # write header
        f = open(filename, "w")
        f.write("""<?xml version="1.0" encoding="UTF-8"?>
<X3D profile="Immersive" version="3.2" xmlns:xsd="http://www.w3.org/2001/XMLSchema-instance" xsd:noNamespaceSchemaLocation="http://www.web3d.org/specifications/x3d-3.2.xsd">
<head>
    <meta name="generator" content="pythonOCC (www.pythonocc.org)"/>
</head>
<Scene>
        """)
        f.write('<Group onclick="handleGroupClick(event)">\n')
        shape_id = 0
        for indexed_face_set in self._indexed_face_sets:
            f.write('<Shape DEF="shape_%i"><Appearance>\n' % shape_id)
            #
            # set Material or shader
            #
            if self._vs is None and self._fs is None:
                f.write("<Material diffuseColor='0.65 0.65 0.65' shininess='0.9' specularColor='1 1 1'></Material>\n")
            else:  # set shaders
                f.write('<ComposedShader><ShaderPart type="VERTEX" style="display:none;">\n')
                f.write(self._vs)
                f.write('</ShaderPart>\n')
                f.write('<ShaderPart type="FRAGMENT" style="display:none;">\n')
                f.write(self._fs)
                f.write('</ShaderPart></ComposedShader>\n')
            f.write('</Appearance>\n')
            # export triangles
            f.write(indexed_face_set)
            f.write("</Shape>\n")
            shape_id += 1
        f.write("</Group>\n")
        f.write('</Scene>\n</X3D>\n')
        f.close()

def test_X3DExporter():
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box_shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    # loop over faces
    x3d_exporter = X3DExporter(box_shp)
    x3d_exporter.compute()
    x3d_exporter.write_to_file("popo.x3d")


class X3DomRenderer(object):
    def __init__(self, background_color="#123345", path=None):
        self._background_color = background_color
        if not path:  # by default, write to a temp directory
            self._path = tempfile.mkdtemp()
        else:
            self._path = path
        self._html_filename = "x3dom_topods_shape.html"
        self._x3d_filename = os.path.join(self._path, 'shape.x3d')
        self._html_filename = os.path.join(self._path, 'x3dom_topods_shape.html')

    def create_files(self, shape, vertex_shader=None, fragment_shader=None, map_faces_to_mesh=False):
        # First, the x3d file
        x3d_exporter = X3DExporter(shape, vertex_shader, fragment_shader, map_faces_to_mesh)
        x3d_exporter.compute()
        x3d_exporter.write_to_file(self._x3d_filename)
        # then the html file
        self.GenerateHTMLFile()
        return self._x3d_filename, self._html_filename

    def DisplayShape(self, shape, vertex_shader=None, fragment_shader=None, map_faces_to_mesh=False):
        self.create_files(shape, vertex_shader, fragment_shader, map_faces_to_mesh)
        # open the file in the browser
        _path = "file:///{0}".format(os.path.join(os.getcwd(),
                                     self._html_filename))
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
        fp.write(HTMLBody(self._background_color, self._x3d_filename).get_str())
        fp.write("</html>\n")
        fp.close()

if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box_shp = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
    my_ren = X3DomRenderer()
    my_ren.DisplayShape(box_shp)
