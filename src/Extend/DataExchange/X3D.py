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

__doc__ = "Everything related to X3D export """
import os
import re

import uuid
from OCC.Core.gp import gp_XYZ
from OCC.Core.TopoDS import TopoDS_Shell
from OCC.Core.BRep import BRep_Builder
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                              XCAFDoc_DocumentTool_ColorTool)
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.TCollection import TCollection_ExtendedString
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                              XCAFDoc_DocumentTool_ColorTool,
                              XCAFDoc_DocumentTool_LayerTool,
                              XCAFDoc_DocumentTool_MaterialTool)

from OCC.Core.TDF import TDF_LabelSequence, TDF_Label
from OCC.Core.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
from OCC.Extend.TopologyUtils import TopologyExplorer, get_type_as_string
from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity

import OCC.Extend.DataExchange.x3d_standard.x3d as XX3D
from OCC.Extend.DataExchange.XDE import SceneGraphFromDoc, DocFromSTEP
from OCC.Extend.TopologyUtils import is_edge, is_wire

from OCC.Extend.Tesselator import ShapeTesselator, EdgeDiscretizer, WireDiscretizer
from OCC.Core.TopAbs import TopAbs_ShapeEnum

##############
# X3D export #
##############
X3DFILE_TEMPLATE = """<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE X3D PUBLIC "ISO//Web3D//DTD X3D 4.0//EN" "https://www.web3d.org/specifications/x3d-4.0.dtd">
<X3D profile='Immersive' version='4.0' xmlns:xsd='http://www.w3.org/2001/XMLSchema-instance' xsd:noNamespaceSchemaLocation='http://www.web3d.org/specifications/x3d-4.0.xsd'>
<head>
    <meta name='generator' content='pythonocc-%s X3D exporter (www.pythonocc.org)'/>
    <meta name='creator' content='pythonocc-%s generator'/>
    <meta name='identifier' content='http://www.pythonocc.org'/>
    <meta name='description' content='pythonocc-%s x3dom based shape rendering'/>
</head>
<Scene>
    %s
</Scene>
</X3D>
"""


X3D_INDEXEDTRIANGLESET_TEMPLATE = """
<IndexedTriangleSet creaseAngle='0.2' normalPerVertex='true' index='%s' solid='false'>
  <Coordinate DEF='%s' point='%s'/>
</IndexedTriangleSet>
"""

X3D_INDEXEDTRIANGLESET_TEMPLATE_WITH_NORMALS = """
<IndexedTriangleSet normalPerVertex='true' index='%s' solid='false'>
  <Coordinate DEF='%s' point='%s'/>
  <Normal vector='%s'/>
</IndexedTriangleSet>
"""


X3D_VISIBLE_EDGE_TEMPLATE = """<Shape>
  <IndexedLineSet coordIndex='%s'>
    <Coordinate USE='%s'></Coordinate>
  </IndexedLineSet>
  <Appearance>
     <Material emissiveColor='0 0 0'/>
     <LineProperties applied='true' linetype='1' linewidthScaleFactor='1'>
     </LineProperties>
  </Appearance>
</Shape>
"""

class X3DBaseExporter:
    """ Abstract class that supports common methods for each
    subclass
    """
    def __init__(self,
                 shape,  # the TopoDS shape to mesh
                 vertex_shader=None,  # the vertex_shader, passed as a string
                 compute_normals=False,
                 fragment_shader=None,  # the fragment shader, passed as a string
                 export_edges=True,  # if yes, edges are exported to IndexedLineSet (might be SLOWW)
                 color=(0.65, 0.65, 0.7),  # the default shape color
                 specular_color=(0.2, 0.2, 0.2),  # shape specular color (white by default)
                 shininess=0.9,  # shape shininess
                 transparency=0.,  # shape transparency
                 line_color=(0, 0., 0.),  # edge color
                 line_width=2.,  # edge liewidth,
                 mesh_quality=1., # mesh quality default is 1., good is <1, bad is >1
                 verbose=False, # if True, log info related to export,
                 optimize_mesh=True # if true, post process mesh to improve quality/performance
                ):
        self._shape = shape
        # by default, shape_id is computed
        self._shape_id = uuid.uuid4().hex
        # the shape DEF, computed by default
        self._shape_def = "%s" % self._shape_id
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
        # maybe composed of dozains of TriangleSet
        self._triangle_sets = []
        self._line_sets = []
        self._x3d_string = ""  # the string that contains the x3d description
        self._computed = False  # will be true when mesh is computed
        self._verbose = False
        self._optimize_mesh = optimize_mesh

    def set_shape_id(self, shape_id):
        self._shape_def = shape_def

    def get_shape_id(self):
        return self._shape_id

    def set_shape_def(self, shape_def):
        self._shape_def = shape_def

    def get_shape_def(self):
        return self._shape_def


class X3DCurveExporter(X3DBaseExporter):
    """ A class for exporting 1d topology such as TopoDS_Wire or TopoDS_Edge
    This class takes either a TopoDS_Edge, a TopoDS_Wire or a list of TopoDS_Edge
    or a list of TopoDS_Wire.
    In any case, all that is passd to this exporter is exported to a single
    LineSet instance."""
    def __init__(self, *kargs):
        super().__init__(*kargs)
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
        coord.DEF = "thomas3233edge"
        self._geo = XX3D.LineSet(coord=coord)#, vertex_count=len(flattened_coords))

class X3DShapeExporter(X3DBaseExporter):
    """ A class for exporting a single TopoDS_Shape to x3d
    """
    def __init__(self, *args, **kargs):
        super(X3DShapeExporter, self).__init__(*args, **kargs)
        self._indexed_triangle_set = None
        self._geo = None
        self._edges = None
        self._compute_normals = False
        self._compute_edges = True
        self._DEF = None

        self.compute()

    def get_geo(self):
        return self._geo

    def get_edges(self):
        return self._edges

    def compute(self):
        """ compute meshes, return True if successful
        """
        shape_tesselator = ShapeTesselator(self._shape)                                   

        idx = shape_tesselator.get_flattened_vertex_indices()
        coord = XX3D.Coordinate(point = shape_tesselator.get_vertex_coords())
        coord.DEF = uuid.uuid4().hex # "thomas3233"#print('DEF:', coord.DEF)
        if self._compute_normals:
            normal = XX3D.Normal(shape_tesselator.get_normal_coords())
        else:
            normal = None
        self._geo = XX3D.IndexedTriangleSet(coord=coord, index=idx, normal=normal, solid=False)
        # TODO : issue with x3d standard creaseAngle is not a property of this node
        # we need here a creaseAngle of creaseAngle=0.2)
        
        if self._compute_edges:
            # flatten edges indices            
            tmp1 = [[a for a in l] + [-1] for l in shape_tesselator._edges_indices]
            edge_idx = [item for sublist in tmp1 for item in sublist]
            self._edges = XX3D.IndexedLineSet(USE=coord.DEF, coordIndex=edge_idx)

    def write_to_file(self, path, filename="", auto_filename=False):
        """ write to a file. If autofilename is set to True then
        the file name is "shp" and the shape id appended.
        """
        if auto_filename:
            filename = "shp%s" % self._shape_id + ".x3d"
        full_filename = os.path.join(path, filename)
        with open(full_filename, "w") as f:
            f.write(self.to_x3dfile_string())
        # check that the file was written
        if not os.path.isfile(full_filename):
            raise IOError("x3d file not written.")
        return filename

    
class X3DScene:
    """ the root class for builing an X3D exporter
    """
    def __init__(self):
        # the self._shapes list is a collection
        # for all <Group><Shapes> strings
        self._shapes = []

    def add_shape(self, a_topods_shape, shape_color=(0.65, 0.65, 0.7)):
        """ the a_topo_ds_shape can be either a TopoDS_Solid, TopoDS_Face, 
        TopoDS_Edge or TopoDS_Wire
        """
        shape_type = a_topods_shape.ShapeType()
        if shape_type in [TopAbs_ShapeEnum.TopAbs_EDGE, TopAbs_ShapeEnum.TopAbs_WIRE]:
            new_curve = X3DCurveExporter(a_topods_shape)
            new_curve.compute()
            shape_str = new_curve.to_x3dfile_string()
            self._shapes.append(shape_str)
        else:
            new_shp = X3DShapeExporter(a_topods_shape, color=shape_color)
            new_shp.compute()
            shape_str = new_shp.to_x3dfile_string()
            self._shapes.append(shape_str)

    def export_to_single_file(self, filename):
        """ ff """
        # we simply concatenate all shapes strings
        # in this case, the filename cannot be ommitted, it's
        # a mandatory parameter
        all_shapes_str = ''.join(self._shapes)

        x3d_content = X3DFILE_TEMPLATE % (OCC_VERSION, OCC_VERSION, OCC_VERSION, all_shapes_str)
        
        fp = open(filename, "w")
        fp.write(x3d_content)
        fp.close()



def approximate_listoffloat_to_str(list_of_floats, ndigits=4, epsilon=1e-3):
    """ take a list of floats, returns a simplified list
    of formatted floats
    """
    precision_dict = {1: "{0:.1g}", 2: "{0:.2g}", 3: "{0:.3g}", 4: "{0:.4g}", 5: "{0:.5g}",
                      6: "{0:.6g}", 7: "{0:.7g}", 8: "{0:.8g}", 9: "{0:.9g}"}
    listoffloat_to_str = ' '.join(['0' if abs(float_number) < epsilon
                                   else precision_dict[ndigits].format(float_number)
                                   for float_number in list_of_floats])
    return listoffloat_to_str


def write_x3d_file(shape, path, filename):
    x3d_exporter = X3DShapeExporter(shape)
    x3d_exporter.compute()
    x3d_exporter.write_to_file(path, filename)


def x3d_from_scenegraph(scene=[], facesInSolids=None, show_edges=True, edge_color=(0,0,0), log=False):#, doc=None):
    a_x3d_scene = X3DScene()
    appDEFset = set()
    if facesInSolids is None:
        facesInSolids = set()
        
    def print_log( message ):
        if (log):
            print (message)
        return
    
    def _x3dapplyLocation(x3dtransformnode, location):
            # get translation and rotation from location
            transformation = location.Transformation()
            rot_axis = gp_XYZ()
            #rot_angle = 0.0
            success, rot_angle = transformation.GetRotation(rot_axis)#.GetVectorAndAngle(rot_axis, rot_angle)
            translation = transformation.TranslationPart()
            scale_factor = transformation.ScaleFactor()
            x3dtransformnode.rotation = (rot_axis.X(), rot_axis.Y(), rot_axis.Z(), rot_angle)
            x3dtransformnode.translation = (translation.X(), translation.Y(), translation.Z())
            x3dtransformnode.scale = (scale_factor, scale_factor, scale_factor)
            return

    def _x3dgeofromTShape(shape):
        if is_edge(shape) or is_wire(shape):
            x3d_exporter = X3DCurveExporter(shape)
        else:
            x3d_exporter = X3DShapeExporter(shape, compute_normals=False, export_edges=True)

        return {'x3dgeo': x3d_exporter.get_geo(), 'x3dedges': x3d_exporter.get_edges()}

    def _MFVec3ffromString(sepString):
        mflist = sepString.split()
        mf = []
        for i in range(len(mflist)):
            if (i % 3 == 2):
                mf.append((float(mflist[i-2]), float(mflist[i-1]), float(mflist[i])))
        return mf
    
    def _x3dappfromColor(c, DEFname, emissive):
        if (emissive):
            DEFname = DEFname + "-emissive"
        if DEFname in appDEFset:
            return XX3D.Appearance(USE = DEFname)
        else:
            appDEFset.add(DEFname)
            if (emissive):
                x3dmat = XX3D.Material(emissiveColor = c)
            else:
                x3dmat = XX3D.Material(diffuseColor = c, specularColor = (0.9, 0.9, 0.9), shininess = 1, ambientIntensity = 0.1)
            return XX3D.Appearance(DEF = DEFname, material = x3dmat)
    
    def _getx3dnode(node):
        
        def _sanitizeDEF(name):
# IdFirstChar ::=
# Any ISO-10646 character encoded using UTF-8 except: 0x30-0x3a, 0x0-0x20, 0x22, 0x23, 0x27, 0x2b, 0x2c, 0x2d, 0x2e, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
# first no [0-9],space,",#,',+,comma,-,.,[,\,],{,}
# IdRestChars ::=
# Any number of ISO-10646 characters except: 0x0-0x20, 0x22, 0x23, 0x27, 0x2c, 0x2e, 0x3a, 0x5b, 0x5c, 0x5d, 0x7b, 0x7d, 0x7f ;
# rest no space,",#,',comma,.,:,[,\,],{,}
            return 'L-' + ( name
                          .replace(" ","_")
                          .replace('"','^')
                          .replace('#','N')
                          .replace("'","^")
                          .replace(",",";")
                          .replace(".",";")
                          .replace(":","-")
                          .replace("[","(")
                          .replace("]",")")
                          .replace("{","(")
                          .replace("}",")")
                          .replace("\\","/") )

        def _applyDEFUSE(x3dnode):
            if 'USE' in node:
                x3dnode.USE = _sanitizeDEF(node['USE'])
            if 'DEF' in node:
                x3dnode.DEF = _sanitizeDEF(node['DEF'])
            return

        def _applychildren(x3dnode):
            if 'children' in node:
                for n in node['children']:
                    success, childlist = _getx3dnode(n)
                    if success:
                        x3dnode.children.extend(childlist)
            return

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
            x3dnode = XX3D.Group(class_ = node['name'], children = [])
            _applyDEFUSE(x3dnode)
            _applychildren(x3dnode)
        
        elif (ntype == 'Transform'):
            x3dnode = XX3D.Transform(class_ = node['name'], children = [])
            if 'transform' in node:
                _x3dapplyLocation(x3dnode, node['transform'])
            _applyDEFUSE(x3dnode)
            _applychildren(x3dnode)

        elif (ntype == 'Shape' or ntype == 'SubShape'):
            shape_type = node['shapeType']
#             if (shape_type != "Solid" and shape_type != "Shell"):
#                 return False, None
            x3dnode = XX3D.Shape (class_ = node['name'])
            _applyDEFUSE(x3dnode)
            if 'shape' in node:
                shape = node['shape']
                geometryDict = _x3dgeofromTShape(shape)
                x3dnode.geometry = geometryDict['x3dgeo']
                isEdgeOrWire = is_edge(shape) or is_wire(shape)
                if 'color' in node:
                    colorDEF = _sanitizeDEF(node['colorDEF'])
                    x3dnode.appearance = _x3dappfromColor(node['color'], colorDEF, isEdgeOrWire)
                if (not isEdgeOrWire):
                    edgeNode = XX3D.Shape (class_ = node['name']+'-edge', visible = show_edges)
                    edgeNode.geometry = geometryDict['x3dedges']
                    edgeNode.appearance = _x3dappfromColor(edge_color, 'app-faceedge', True)
        else:
            print_log ('unknown node: --' + ntype + "--")

        x3dnodelist = [x3dnode] 
        if edgeNode is not None:
            x3dnodelist.append(edgeNode)
        return True, x3dnodelist

    x3dscene = XX3D.Scene(children=[])
    x3ddoc = XX3D.X3D(Scene = x3dscene)

    for node in scene:
        success, x3dnodelist = _getx3dnode(node)
        if success:
            x3dscene.children.extend(x3dnodelist)
        else:
            print_log ('no x3d for root node, skipped')

    return x3ddoc.XML()


if __name__ == "__main__":
    # test with the as1_pe.stp file
    from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
    shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    exp = X3DShapeExporter(shp, compute_normals=True)

    step_file = os.path.join('..', '..', '..', 'test', 'test_io', 'as1_pe_203.stp')
    doc_exp = DocFromSTEP(step_file)
    document = doc_exp.get_doc()
    scenegraph = SceneGraphFromDoc(document, log=True)
    x3dXML = x3d_from_scenegraph(scenegraph.get_scene(), scenegraph.get_internalFaceEntries())
    print(x3dXML)
