##Copyright Thomas Paviot (tpaviot@gmail.com) and Andreas Plesch (@andreasplesch)
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

__doc__ = "BRep/STEP to X3D exporter """

import os
import uuid
import xml.etree.ElementTree as ET

# core OCC packages
from OCC.Core.gp import gp_XYZ
from OCC.Core.TopAbs import TopAbs_ShapeEnum

# OCC extensions
from OCC.Extend.TopologyUtils import is_edge, is_wire
from OCC.Extend.DataExchange.XDE import SceneGraphFromDoc, DocFromSTEP
from OCC.Extend.Tesselator import ShapeTesselator, EdgeDiscretizer, WireDiscretizer

# official x3d package
import OCC.Extend.DataExchange.x3d_standard.x3d as XX3D


class X3DCurveExporter:
    """ A class for exporting 1d topology such as TopoDS_Wire or TopoDS_Edge
    This class takes either a TopoDS_Edge, a TopoDS_Wire or a list of TopoDS_Edge
    or a list of TopoDS_Wire.
    In any case, all that is passd to this exporter is exported to a single
    LineSet instance."""
    def __init__(self, shape):
        self._shape = shape
        self._cd = None

        self._geo = None
        self._edges = None

        self.compute()

    def get_geo(self):
        return self._geo

    def get_edges(self):
        return self._edges

    def compute(self):
        shape_type = self._shape.ShapeType()
        if shape_type == TopAbs_ShapeEnum.TopAbs_EDGE:
            self._cd = EdgeDiscretizer(self._shape)
        elif shape_type == TopAbs_ShapeEnum.TopAbs_WIRE:
            self._cd = WireDiscretizer(self._shape)
        else:
            raise AssertionError('you must provide an edge or a wire to the X3DCurveExporter')

        coord = XX3D.Coordinate(point=self._cd.get_points())
        coord.DEF = "COORD" + uuid.uuid4().hex
        self._geo = XX3D.LineSet(coord=coord)


class X3DShapeExporter:
    """ A class for exporting a single TopoDS_Shape to x3d
    """
    def __init__(self, shape, compute_normals=False, compute_edges=True, uid=None):
        self._compute_normals = compute_normals
        self._compute_edges = compute_edges

        if uid is None:
            self._uid = uuid.uuid4().hex
        else:
            self._uid = uid

        self._shape = shape

        self._geo = None
        self._edges = None

        self.compute()

    def get_geo(self):
        return self._geo

    def get_edges(self):
        return self._edges

    def compute(self):
        """ compute meshes, return True if successful
        """
        shape_tesselator = ShapeTesselator(self._shape,
                                           compute_normals=self._compute_normals,
                                           compute_edges=self._compute_edges)

        idx = shape_tesselator.get_flattened_vertex_indices()
        coord = XX3D.Coordinate(point=shape_tesselator.get_vertex_coords())
        coord.DEF = "ITS-COORD-" + self._uid
        if self._compute_normals:
            normal = XX3D.Normal(vector=shape_tesselator.get_normal_coords())
        else:
            normal = None
        if coord:
            self._geo = XX3D.IndexedTriangleSet(coord=coord, index=idx, normal=normal, solid=False)
        # TODO : issue with x3d standard creaseAngle is not a property of this node
        # we need here a creaseAngle of creaseAngle=0.2)

        if self._compute_edges:
            # flatten edges indices
            tmp1 = [[a for a in l] + [-1] for l in shape_tesselator._edges_indices]
            edge_idx = [item for sublist in tmp1 for item in sublist]
            if edge_idx:
                self._edges = XX3D.IndexedLineSet(USE=coord.DEF, coordIndex=edge_idx)


    def to_x3d_scene_XML(self):
        x3dnode_geometry = XX3D.Shape()
        x3dnode_geometry.geometry = self._geo

        x3dnode_edges = XX3D.Shape()
        x3dnode_edges.geometry = self._edges

        x3dscene = XX3D.Scene(children=[x3dnode_geometry, x3dnode_edges])
        x3ddoc = XX3D.X3D(Scene=x3dscene)

        return x3ddoc.XML()

    def write_to_file(self, filename):
        """ write to a file. If autofilename is set to True then
        the file name is "shp" and the shape id appended.
        """
        with open(filename, "w") as f:
            f.write(self.to_x3d_scene_XML())

        # check that the file was written
        return os.path.isfile(filename)


def x3d_from_scenegraph(scene=[],
                        facesInSolids=None,
                        show_edges=True,
                        edge_color=(0, 0, 0),
                        log=False):
    appDEFset = set()
    if facesInSolids is None:
        facesInSolids = set()

    def print_log(message):
        if log:
            print(message)

    def _x3dapplyLocation(x3dtransformnode, location):
        # get translation and rotation from location
        transformation = location.Transformation()
        rot_axis = gp_XYZ()
        #rot_angle = 0.0
        success, rot_angle = transformation.GetRotation(rot_axis)
        translation = transformation.TranslationPart()
        scale_factor = transformation.ScaleFactor()
        x3dtransformnode.rotation = (rot_axis.X(), rot_axis.Y(), rot_axis.Z(), rot_angle)
        x3dtransformnode.translation = (translation.X(), translation.Y(), translation.Z())
        x3dtransformnode.scale = (scale_factor, scale_factor, scale_factor)

    def _x3dgeofromTShape(shape):
        if is_edge(shape) or is_wire(shape):
            x3d_exporter = X3DCurveExporter(shape)
        else:
            x3d_exporter = X3DShapeExporter(shape, compute_normals=False, compute_edges=True)

        return {'x3dgeo': x3d_exporter.get_geo(), 'x3dedges': x3d_exporter.get_edges()}

    def _x3dappfromColor(c, DEFname, emissive):
        if emissive:
            DEFname = DEFname + "-emissive"
        if DEFname in appDEFset:
            return XX3D.Appearance(USE=DEFname)
        else:
            appDEFset.add(DEFname)
            if emissive:
                x3dmat = XX3D.Material(emissiveColor=c)
            else:
                x3dmat = XX3D.Material(diffuseColor=c, specularColor=(0.9, 0.9, 0.9),
                                       shininess=1, ambientIntensity=0.1)
            return XX3D.Appearance(DEF=DEFname, material=x3dmat)

    def _getx3dnode(node):

        def _sanitizeDEF(name):
# IdFirstChar ::=
# Any ISO-10646 character encoded using UTF-8 except: 0x30-0x3a, 0x0-0x20, 0x22,
# 0x23, 0x27, 0x2b, 0x2c, 0x2d, 0x2e, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
# first no [0-9],space,",#,',+,comma,-,.,[,\,],{,}
# IdRestChars ::=
# Any number of ISO-10646 characters except: 0x0-0x20, 0x22, 0x23, 0x27, 0x2c, 0x2e,
# 0x3a, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
# rest no space,",#,',comma,.,:,[,\,],{,}
            replace_dict = {" ": "_", '"': '^', '#': 'N', "'": "^", ",": ";",
                            ".": ";", ":": "-", "[": "(", "]": ")", "{": "(",
                            "}": ")", "\\": "/"}
            for k, v in replace_dict.items():
                name = name.replace(k, v)
            return 'L-' + name

        def _applyDEFUSE(x3dnode):
            if 'USE' in node:
                x3dnode.USE = _sanitizeDEF(node['USE'])
            if 'DEF' in node:
                x3dnode.DEF = _sanitizeDEF(node['DEF'])

        def _applychildren(x3dnode):
            if 'children' in node:
                for n in node['children']:
                    success, childlist = _getx3dnode(n)
                    if success:
                        x3dnode.children.extend(childlist)

        if not 'node' in node:
            print_log('no node type, skipping')
            return False, None

        if 'DEF' in node:
            if node['DEF'] in facesInSolids:
                #print('in skipped list')
                return False, None

        ntype = node['node']
        edgeNode = None

        if ntype == 'Group':
            x3dnode = XX3D.Group(class_=node['name'], children=[])
            _applyDEFUSE(x3dnode)
            _applychildren(x3dnode)

        elif ntype == 'Transform':
            x3dnode = XX3D.Transform(class_=node['name'], children=[])
            if 'transform' in node:
                _x3dapplyLocation(x3dnode, node['transform'])
            _applyDEFUSE(x3dnode)
            _applychildren(x3dnode)

        elif ntype in ['Shape', 'SubShape']:
            x3dnode = XX3D.Shape(class_=node['name'])
            _applyDEFUSE(x3dnode)
            if 'shape' in node:
                shape = node['shape']
                geometryDict = _x3dgeofromTShape(shape)
                x3dnode.geometry = geometryDict['x3dgeo']
                isEdgeOrWire = is_edge(shape) or is_wire(shape)
                if 'color' in node:
                    colorDEF = _sanitizeDEF(node['colorDEF'])
                    x3dnode.appearance = _x3dappfromColor(node['color'], colorDEF, isEdgeOrWire)
                if not isEdgeOrWire:
                    edgeNode = XX3D.Shape(class_=node['name'] + '-edge', visible=show_edges)
                    edgeNode.geometry = geometryDict['x3dedges']
                    edgeNode.appearance = _x3dappfromColor(edge_color, 'app-faceedge', True)
        else:
            print_log('unknown node: --' + ntype + "--")

        x3dnodelist = [x3dnode]
        if edgeNode is not None:
            x3dnodelist.append(edgeNode)
        return True, x3dnodelist

    x3dscene = XX3D.Scene(children=[])
    x3ddoc = XX3D.X3D(Scene=x3dscene)

    for node in scene:
        success, x3dnodelist = _getx3dnode(node)
        if success:
            x3dscene.children.extend(x3dnodelist)
        else:
            print_log('no x3d for root node, skipped')

    return x3ddoc.XML()


def x3dXML_to_x3domHTML(x3dXML):
    x3domHEAD = '''<script type='text/javascript' src='https://www.x3dom.org/download/dev/x3dom-full.debug.js'> </script>
    <link rel='stylesheet' type='text/css' href='https://www.x3dom.org/download/dev/x3dom.css'></link>'''
    x3dele = list(ET.XML(x3dXML).iter('X3D'))[0]
    next(x3dele.iter('Scene')).append(ET.XML('<Environment gammaCorrectionDefault="none"/>'))
    x3dHTML = ET.tostring(x3dele, encoding="unicode", short_empty_elements=False)
    x3dHTML = x3dHTML.replace("visible=", 'render=')
    return x3domHEAD + x3dHTML


if __name__ == "__main__":
    # test with the as1_pe.stp file
    from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
    shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    exp = X3DShapeExporter(shp, compute_normals=True)
    exp.write_to_file("ess.x3d")

    step_file = os.path.join('..', '..', '..', 'test', 'test_io', 'as1_pe_203.stp')
    doc_exp = DocFromSTEP(step_file)
    document = doc_exp.get_doc()
    scenegraph = SceneGraphFromDoc(document)
    x3dXML = x3d_from_scenegraph(scenegraph.get_scene(), scenegraph.get_internalFaceEntries())
    print(x3dXML_to_x3domHTML(x3dXML))
