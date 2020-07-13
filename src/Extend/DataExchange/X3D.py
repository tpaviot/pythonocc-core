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


_X3DOM_HEADER = '''<script type='text/javascript' src='https://www.x3dom.org/download/dev/x3dom-full.debug.js'> </script>
<link rel='stylesheet' type='text/css' href='https://www.x3dom.org/download/dev/x3dom.css'></link>
'''
def _flatten(lst):
    """ take nested lists and return flattened values
    """
    return [item for sublist in lst for item in sublist]

def _sanitize_DEF(name):
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
    def __init__(self, shape, compute_normals=False, compute_edges=True, uid=None,
                 decimation_ratio=0.):
        self._compute_normals = compute_normals
        self._compute_edges = compute_edges

        if uid is None:
            self._uid = uuid.uuid4().hex
        else:
            self._uid = uid

        self._shape = shape
        self._decimation_ratio = decimation_ratio

        self._geo = None
        self._edges = None

        self._bb_center = None
        self._bb_size = None

        self._rotation_vector = None
        self._rotation_angle = None
        self._translation = None
        self._scale_factor = None

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
        if self._decimation_ratio > 0.:
            shape_tesselator.decimate(self._decimation_ratio)

        # store shape information
        self._bb_center = shape_tesselator.get_bb_center()
        self._bb_size = shape_tesselator.get_bb_size()

        self._rotation_vector, self._rotation_angle = shape_tesselator.get_rotation()
        self._translation = shape_tesselator.get_translation()
        self._scale_factor = shape_tesselator.get_scale_factor()

        idx = shape_tesselator.get_flattened_vertex_indices()

        coord = XX3D.Coordinate(point=shape_tesselator.get_vertex_coords())
        coord.DEF = "ITS-COORD-" + self._uid
        if self._compute_normals:
            # convert list of list to list of tuples since
            # Normal expects a list of tuples as the vector
            normals_as_tuples = list(map(tuple, shape_tesselator.get_normal_coords()))
            normal = XX3D.Normal(vector=normals_as_tuples)
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
                if self._decimation_ratio == 0.:  # no decimation, use the vertex coord
                    edge_coord = XX3D.Coordinate(USE=coord.DEF)
                else:  # we can't use the same coordinates that the faces
                    # we use the LOD 0 vertex coordinates, more precise
                    # and decimation algorithm may alter sharp edges
                    default_vert_coord, _, _ = shape_tesselator.get_lod()[0.]
                    edge_coord = XX3D.Coordinate(point=default_vert_coord)
                self._edges = XX3D.IndexedLineSet(coord=edge_coord, coordIndex=edge_idx)


class X3DSceneExporter:
    """ creates an x3d scene
    """
    def __init__(self):
        self._x3dscene = XX3D.Scene(children=[])
        self._x3ddoc = XX3D.X3D(Scene=self._x3dscene)

        # keep references for DEFs
        # use a set to prevent duplicates
        self._app_def_set = set()


    def get_scene(self):
        return self._x3dscene


    def get_doc(self):
        return self._x3ddoc


    def add_group(self, group_def_name, DEF=None, USE=None):
        group = XX3D.Group()
        if DEF:
            group.DEF = DEF
        elif USE:
            group.USE = USE
        self._x3dscene.children()


    def add_shape(self, shape, shape_DEF_name=None, shape_color=(0.4, 0.4, 0.4),
                  color_DEF_name=None, emissive=True, edge_color=(0, 0, 0),
                  decimation_ratio = 0., export_edges=True):
        if decimation_ratio < 0. or decimation_ratio > 1.:
            raise ValueError("decimation ration must be > 0. and < 1.")

        # create the material
        if emissive:
            x3d_material = XX3D.Material(emissiveColor=shape_color)
        else:
            x3d_material = XX3D.Material(diffuseColor=shape_color,
                                         specularColor=(0.9, 0.9, 0.9),
                                         shininess=1, ambientIntensity=0.1)
        if color_DEF_name is not None:
            if color_DEF_name in self._app_def_set:
                shape_appearance = XX3D.Appearance(USE=color_DEF_name)
            else:
                self._app_def_set.add(color_DEF_name)
                shape_appearance = XX3D.Appearance(DEF=color_DEF_name, material=x3d_material)
        else:
            shape_appearance = XX3D.Appearance(material=x3d_material)

        # then process shape
        if is_edge(shape) or is_wire(shape):
            x3dcurve_geometry = XX3D.Shape()
            x3d_exporter = X3DCurveExporter(shape)
            x3dcurve_geometry.geometry = x3d_exporter.get_geo()
            x3dcurve_geometry.appearance = shape_appearance

            self._x3dscene.children.extend([x3dcurve_geometry])
        else:
            x3d_exporter = X3DShapeExporter(shape,
                                            compute_normals=False,
                                            compute_edges=True,
                                            decimation_ratio= decimation_ratio)

            x3dshape_geometry = XX3D.Shape()
            x3dshape_geometry.geometry = x3d_exporter.get_geo()
            x3dshape_geometry.appearance = shape_appearance
            x3dshape_geometry.bboxCenter = tuple(x3d_exporter._bb_center)
            x3dshape_geometry.bboxSize = tuple(x3d_exporter._bb_size)

            child_nodes = [x3dshape_geometry]

            if export_edges:
                x3dvisible_edge_geometry = XX3D.Shape()
                x3dvisible_edge_geometry.geometry = x3d_exporter.get_edges()

                edge_material = XX3D.Material(emissiveColor=edge_color)
                edge_appearance = XX3D.Appearance(DEF="edge_material", material=edge_material)
                x3dvisible_edge_geometry.appearance = edge_appearance

                child_nodes.append(x3dvisible_edge_geometry)

            transform_node = XX3D.Transform(children=child_nodes)
            transform_node.rotation = tuple(x3d_exporter._rotation_vector + [x3d_exporter._rotation_angle])
            transform_node.translation = tuple(x3d_exporter._translation)
            sf = x3d_exporter._scale_factor
            transform_node.scale = (sf, sf, sf)

            self._x3dscene.children.append(transform_node)


    def to_xml(self):
        return self._x3ddoc.XML()


    def to_x3dom_html(self):
        """ x3d adaptation to x3dom library
        """
        xml_content = self.to_xml()
        # root node
        x3d_element = list(ET.XML(xml_content).iter('X3D'))[0]

        # remove gama correction
        next(x3d_element.iter('Scene')).append(ET.XML('<Environment gammaCorrectionDefault="none"/>'))

        # add crease angle to IndexedTriangleSet instances, supported by x3dom
        # but not part of the X3D standard
        for idx_ts in x3d_element.iter('IndexedTriangleSet'):
            idx_ts.set('creaseAngle', '0.2')
            print(idx_ts)
        
        x3dHTML = ET.tostring(x3d_element, encoding="unicode", short_empty_elements=False)
        x3dHTML = x3dHTML.replace("visible=", 'render=')
        return _X3DOM_HEADER + x3dHTML


    def write_to_file(self, filename):
        with open(filename, "w") as f:
            f.write(self.to_x3dom_html())


class X3DFromSceneGraph:
    def __init__(self, scene=None, faces_in_solids=None, show_edges=True,
                 edge_color=(0, 0, 0), log=True):
        self._app_def_set = set()

        if faces_in_solids is None:
            self._faces_in_solids = set()
        else:
            self._faces_in_solids = faces_in_solids

        self._scene = scene
        self._show_edges = show_edges
        self._edge_color = edge_color
        self._log = log

        self._x3d_scene = None
        self._x3d_doc = None

        self.build_x3d_scene()


    def to_xml(self):
        return self._x3ddoc.XML()


    def to_x3dom_html(self):
        x3dele = list(ET.XML(self.to_xml()).iter('X3D'))[0]
        next(x3dele.iter('Scene')).append(ET.XML('<Environment gammaCorrectionDefault="none"/>'))
        x3d_html = ET.tostring(x3dele, encoding="unicode", short_empty_elements=False)
        x3d_html = x3d_html.replace("visible=", 'render=')
        return _X3DOM_HEADER + x3d_html


    def build_x3d_scene(self):
        self._x3dscene = XX3D.Scene(children=[])
        self._x3ddoc = XX3D.X3D(Scene=self._x3dscene)

        for node in self._scene:
            success, x3dnodelist = self.get_x3d_node(node)
            if success:
                self._x3dscene.children.extend(x3dnodelist)
            else:
                self.print_log('no x3d for root node, skipped')


    def print_log(self, message):
        if self._log:
            print(message)


    def x3d_apply_location(self, x3dtransformnode, location):
        # get translation and rotation from location
        transformation = location.Transformation()
        rot_axis = gp_XYZ()

        success, rot_angle = transformation.GetRotation(rot_axis)
        translation = transformation.TranslationPart()
        scale_factor = transformation.ScaleFactor()
        x3dtransformnode.rotation = (rot_axis.X(), rot_axis.Y(), rot_axis.Z(), rot_angle)
        x3dtransformnode.translation = (translation.X(), translation.Y(), translation.Z())
        x3dtransformnode.scale = (scale_factor, scale_factor, scale_factor)


    def x3d_geometry_from_TShape(self, shape):
        if is_edge(shape) or is_wire(shape):
            x3d_exporter = X3DCurveExporter(shape)
        else:
            x3d_exporter = X3DShapeExporter(shape, compute_normals=False, compute_edges=True)

        return {'x3dgeo': x3d_exporter.get_geo(), 'x3dedges': x3d_exporter.get_edges()}


    def x3d_appearance_from_color(self, color, DEFname, emissive):
        if emissive:
            DEFname = DEFname + "-emissive"
        if DEFname in self._app_def_set:
            return XX3D.Appearance(USE=DEFname)
        else:
            self._app_def_set.add(DEFname)
            if emissive:
                x3dmat = XX3D.Material(emissiveColor=color)
            else:
                x3dmat = XX3D.Material(diffuseColor=color, specularColor=(0.9, 0.9, 0.9),
                                       shininess=1, ambientIntensity=0.1)
            return XX3D.Appearance(DEF=DEFname, material=x3dmat)


    def apply_DEF_or_USE(self, node, x3dnode):
        if 'USE' in node:
            x3dnode.USE = _sanitize_DEF(node['USE'])
        if 'DEF' in node:
            x3dnode.DEF = _sanitize_DEF(node['DEF'])


    def set_children(self, node, x3dnode):
        if 'children' in node:
            for n in node['children']:
                success, childlist = self.get_x3d_node(n)
                if success:
                    x3dnode.children.extend(childlist)


    def get_x3d_node(self, node):
        if not 'node' in node:
            self.print_log('no node type, skipping')
            return False, None

        if 'DEF' in node:
            if node['DEF'] in self._faces_in_solids:
                return False, None

        ntype = node['node']
        edge_node = None

        if ntype == 'Group':
            x3dnode = XX3D.Group(class_=node['name'], children=[])
            self.apply_DEF_or_USE(node, x3dnode)
            self.set_children(node, x3dnode)

        elif ntype == 'Transform':
            x3dnode = XX3D.Transform(class_=node['name'], children=[])
            if 'transform' in node:
                self.x3d_apply_location(x3dnode, node['transform'])
            self.apply_DEF_or_USE(node, x3dnode)
            self.set_children(node, x3dnode)

        elif ntype in ['Shape', 'SubShape']:
            x3dnode = XX3D.Shape(class_=node['name'])
            self.apply_DEF_or_USE(node, x3dnode)
            if 'shape' in node:
                shape = node['shape']
                geometry_dict = self.x3d_geometry_from_TShape(shape)
                x3dnode.geometry = geometry_dict['x3dgeo']
                is_edge_or_wire = is_edge(shape) or is_wire(shape)
                if 'color' in node:
                    color_def = _sanitize_DEF(node['color_uid'])
                    x3dnode.appearance = self.x3d_appearance_from_color(tuple(node['color']), color_def, is_edge_or_wire)
                if not is_edge_or_wire:
                    edge_node = XX3D.Shape(class_=node['name'] + '-edge', visible=self._show_edges)
                    edge_node.geometry = geometry_dict['x3dedges']
                    edge_node.appearance = self.x3d_appearance_from_color(self._edge_color, 'app-faceedge', True)
        else:
            self.print_log('unknown node: --' + ntype + "--")

        x3dnodelist = [x3dnode]
        if edge_node is not None:
            x3dnodelist.append(edge_node)

        return True, x3dnodelist


if __name__ == "__main__":
    # test with the as1_pe.stp file
    from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
    #shp = BRepPrimAPI_MakeBox(10, 20, 30).Shape()

    #scene_exp = X3DSceneExporter()
    #scene_exp.add_shape(shp, shape_color=(0.5, 0.6, 0.7), emissive=False)

    #scene_exp.write_to_file('ess.x3d')
    step_file = os.path.join('..', '..', '..', 'test', 'test_io', 'as1_pe_203.stp')
    doc_exp = DocFromSTEP(step_file)
    document = doc_exp.get_doc()
    scenegraph = SceneGraphFromDoc(document)
    x3dXML = X3DFromSceneGraph(scene=scenegraph.get_scene(),
                               faces_in_solids=scenegraph.get_internal_face_entries(),
                               log=True)
    with open('out.x3d', 'w') as f:
        f.write(x3dXML.to_xml())
    x3dXML.to_x3dom_html()
