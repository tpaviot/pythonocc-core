##Copyright 2011-2016 Thomas Paviot (tpaviot@gmail.com)
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

from __future__ import print_function, absolute_import

import os
import tempfile

from OCC.Visualization import Tesselator
from OCC.gp import gp_Vec
from OCC import VERSION as OCC_VERSION

from .simple_server import start_server

HEADER = """
<head>
    <title>pythonOCC @VERSION@ x3dom renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonOCC'>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="https://x3dom.org/release/x3dom.css" charset="utf-8" ></link>
    <script type="text/javascript" src="https://x3dom.org/release/x3dom-full.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.0.min.js" ></script>
    <style type="text/css">
        body {
            background: linear-gradient(@bg_gradient_color1@, @bg_gradient_color2@);
            margin: 0px;
            overflow: hidden;
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
            height: 22px;
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
    <div id="pythonocc_rocks">
        <b>pythonOCC @VERSION@ <a href="https://www.x3dom.org" target="_blank">x3dom</a> renderer</b><hr>
        Check our blog at
        <a style="font-size:14px;" href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>
    <div id="selection_info">
        <input type="button" value="Fit All" onclick="fitAll();">
    </div>
    <script>
    function fitAll(){
        document.getElementsByTagName('x3d')[0].runtime.showAll();
    }
    </script>
</body>
"""


def ExportEdgeToILS(edge_point_set):
    str_x3d_to_return = "\t<LineSet vertexCount='%i'>" % len(edge_point_set)
    str_x3d_to_return += "<Coordinate point='"
    for p in edge_point_set:
        str_x3d_to_return += "%g %g %g " % (p[0], p[1], p[2])
    str_x3d_to_return += "'/></LineSet>\n"
    return str_x3d_to_return


class HTMLHeader(object):
    def __init__(self, bg_gradient_color1="#ced7de", bg_gradient_color2="#808080"):
        self._bg_gradient_color1 = bg_gradient_color1
        self._bg_gradient_color2 = bg_gradient_color2


    def get_str(self):
        header_str = HEADER.replace('@bg_gradient_color1@', '%s' % self._bg_gradient_color1)
        header_str = header_str.replace('@bg_gradient_color2@', '%s' % self._bg_gradient_color2)
        header_str = header_str.replace('@VERSION@', OCC_VERSION)
        return header_str


class HTMLBody(object):
    def __init__(self, x3d_shapes):
        """ x3d_shapes is a list that contains uid for each shape
        """
        self._x3d_shapes = x3d_shapes

    def get_str(self):
        # get the location where pythonocc is running from
        body_str = BODY.replace('@VERSION@', OCC_VERSION)
        x3dcontent = '\n\t<X3D style="width:100%;border: none" >\n\t\t<Scene>\n'
        for shp_uid in self._x3d_shapes:
            # TODO: here is the code related to orientation/translation
            # trans, ori = self._x3d_shapes_dict[shp]
            # vx, vy, vz = trans
            # ori_vx, ori_vy, ori_vz, angle = ori
            x3dcontent += '\t\t\t<Inline mapDEFToID="true" url="shp%s.x3d"></Inline>\n' % shp_uid
        x3dcontent += "\t\t</Scene>\n\t</X3D>\n"
        body_str = body_str.replace('@X3DSCENE@', x3dcontent)
        return body_str


class X3DExporter(object):
    """ A class for exporting a TopoDS_Shape to an x3d file """
    def __init__(self,
                 shape,  # the TopoDS shape to mesh
                 vertex_shader,  # the vertex_shader, passed as a string
                 fragment_shader,  # the fragment shader, passed as a string
                 export_edges,  # if yes, edges are exported to IndexedLineSet (might be SLOWW)
                 color,  # the default shape color
                 specular_color,  # shape specular color (white by default)
                 shininess,  # shape shininess
                 transparency,  # shape transparency
                 line_color,  # edge color
                 line_width,  # edge liewidth,
                 mesh_quality  # mesh quality default is 1., good is <1, bad is >1
                ):
        self._shape = shape
        self._vs = vertex_shader
        self._fs = fragment_shader
        self._export_edges = export_edges
        self._color = color
        self._shininess = shininess
        self._specular_color = specular_color
        self._transparency = transparency
        self._mesh_quality = mesh_quality
        # the list of indexed face sets that compose the shape
        # if ever the map_faces_to_mesh option is enabled, this list
        # maybe composed of dozains of IndexedFaceSet
        self._triangle_sets = []
        self._line_sets = []
        self._x3d_string = ""  # the string that contains the x3d description

    def compute(self):
        shape_tesselator = Tesselator(self._shape)
        shape_tesselator.Compute(compute_edges=self._export_edges,
                                 mesh_quality=self._mesh_quality)
        self._triangle_sets.append(shape_tesselator.ExportShapeToX3DIndexedFaceSet())
        # then process edges
        if self._export_edges:
            # get number of edges
            nbr_edges = shape_tesselator.ObjGetEdgeCount()
            for i_edge in range(nbr_edges):
                edge_point_set = []
                nbr_vertices = shape_tesselator.ObjEdgeGetVertexCount(i_edge)
                for i_vert in range(nbr_vertices):
                    edge_point_set.append(shape_tesselator.GetEdgeVertex(i_edge, i_vert))
                ils = ExportEdgeToILS(edge_point_set)
                self._line_sets.append(ils)

    def to_x3dfile_string(self):
        x3dfile_str = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE X3D PUBLIC "ISO//Web3D//DTD X3D 3.3//EN" "http://www.web3d.org/specifications/x3d-3.3.dtd">
<X3D profile="Immersive" version="3.3" xmlns:xsd="http://www.w3.org/2001/XMLSchema-instance" xsd:noNamespaceSchemaLocation="http://www.web3d.org/specifications/x3d-3.3.xsd">
<head>
    <meta name="generator" content="pythonocc-%s X3D exporter (www.pythonocc.org)"/>
    <meta name="title" content="shape-export.x3d"/>
    <meta name="creator" content="pythonocc-%s generator"/>
    <meta name="identifier" content="http://www.pythonocc.org"/>
    <meta name="description" content="pythonocc-%s x3dom based shape rendering"/>
</head>
<Scene>
        """ % (OCC_VERSION, OCC_VERSION, OCC_VERSION)
        shape_id = 0
        for triangle_set in self._triangle_sets:
            x3dfile_str += '<Shape DEF="shape%i"><Appearance>\n' % shape_id
            #
            # set Material or shader
            #
            if self._vs is None and self._fs is None:
                x3dfile_str += "<Material diffuseColor="
                x3dfile_str += "'%g %g %g'" % (self._color[0],
                                        self._color[1],
                                        self._color[2])
                x3dfile_str += " shininess="
                x3dfile_str += "'%g'" % self._shininess
                x3dfile_str += " specularColor="
                x3dfile_str += "'%g %g %g'" % (self._specular_color[0],
                                        self._specular_color[1],
                                        self._specular_color[2])
                x3dfile_str += " transparency='%g'>\n" % self._transparency
                x3dfile_str += "</Material>\n"
            else:  # set shaders
                x3dfile_str += '<ComposedShader><ShaderPart type="VERTEX" style="display:none;">\n'
                x3dfile_str += self._vs
                x3dfile_str += '</ShaderPart>\n'
                x3dfile_str += '<ShaderPart type="FRAGMENT" style="display:none;">\n'
                x3dfile_str += self._fs
                x3dfile_str += '</ShaderPart></ComposedShader>\n'
            x3dfile_str += '</Appearance>\n'
            # export triangles
            x3dfile_str += triangle_set
            x3dfile_str += "</Shape>\n"
            shape_id += 1
        # and now, process edges
        if self._export_edges:
            edge_id = 0
            # below '0' means show all
            # -1 means doesn' show line
            # the "Switch" node selects the group to be displayed
            x3dfile_str += "<Switch whichChoice='0'>\n"
            x3dfile_str += "\t<Group>\n"
            for line_set in self._line_sets:
                x3dfile_str += '\t\t<Shape DEF="edg%i">\n' % edge_id
                x3dfile_str += '\t\t\t<Appearance><Material emissiveColor="0 0 0"/></Appearance>\n\t\t'  # empty appearance, but the x3d validator complains if nothing set
                x3dfile_str += line_set
                x3dfile_str += "\t\t</Shape>\n"
                edge_id += 1
            x3dfile_str += "\t</Group>\n"
            x3dfile_str += "</Switch>\n"
        x3dfile_str += '</Scene>\n</X3D>\n'
        return x3dfile_str
   
    def write_to_file(self, filename):
        with open(filename, "w") as f:
            f.write(self.to_x3dfile_string())


class X3DomRenderer(object):
    def __init__(self, path=None):
        if not path:  # by default, write to a temp directory
            self._path = tempfile.mkdtemp()
        else:
            self._path = path
        self._html_filename = os.path.join(self._path, 'index.html')
        self._x3d_shapes = []
        print("X3DomRenderer initiliazed. Waiting for shapes to be added to the buffer.")

    def DisplayShape(self,
                     shape,
                     vertex_shader=None,
                     fragment_shader=None,
                     export_edges=False,
                     color=(0.65, 0.65, 0.65),
                     specular_color=(1, 1, 1),
                     shininess=0.9,
                     transparency=0.,
                     line_color=(0, 0., 0.),
                     line_width=2.,
                     mesh_quality=1.):
        """ Adds a shape to the rendering buffer. This class computes the x3d file
        """
        shape_hash = hash(shape)
        x3d_exporter = X3DExporter(shape, vertex_shader, fragment_shader,
                                   export_edges, color,
                                   specular_color, shininess, transparency,
                                   line_color, line_width, mesh_quality)
        x3d_exporter.compute()
        x3d_filename = os.path.join(self._path, "shp%s.x3d" % shape_hash)
        # the x3d filename is computed from the shape hash
        x3d_exporter.write_to_file(x3d_filename)
        ## TODO : orientation and translation
        # get shape translation and orientation
        # trans = shape.Location().Transformation().TranslationPart().Coord()  # vector
        # v = gp_Vec()
        # angle = shape.Location().Transformation().GetRotation().GetVectorAndAngle(v)
        # ori = (v.X(), v.Y(), v.Z(), angle)  # angles
        # fill the shape dictionnary with shape hash, translation and orientation
        #  self._x3d_shapes[shape_hash] = [trans, ori]
        self._x3d_shapes.append(shape_hash)

    def render(self, server_port=8080):
        """ Call the render() method to display the X3D scene.
        """
        # log path
        print("Files written to %s" % self._path)
        # first generate the HTML root file
        self.GenerateHTMLFile()
        # then create a simple web server
        os.chdir(self._path)
        print("## Serving at port", server_port, "using SimpleHTTPServer")
        print("## Open your webbrowser at the URL: http://localhost:%i" % server_port)
        print("## CTRL-C to shutdown the server")
        start_server(server_port)


    def GenerateHTMLFile(self):
        """ Generate the HTML file to be rendered wy the web browser
        """
        print("File written to %s" % self._path)
        with open(self._html_filename, "w") as fp:
            fp.write("<!DOCTYPE HTML>")
            fp.write('<html lang="en">')
            # header
            fp.write(HTMLHeader().get_str())
            # body
            fp.write(HTMLBody(self._x3d_shapes).get_str())
            fp.write("</html>\n")


if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box = BRepPrimAPI_MakeBox(1., 2., 3.).Shape()
    my_ren = X3DomRenderer()
    my_ren.DisplayShape(box, export_edges=True)
    my_ren.render()
