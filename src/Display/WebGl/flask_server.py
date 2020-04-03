""" A flask webserver. """

import sys
import uuid

from OCC.Display.WebGl.threejs_renderer import ThreejsRenderer, OCC_VERSION, \
        THREEJS_RELEASE, color_to_hex, export_edgedata_to_json, spinning_cursor
from OCC.Extend.TopologyUtils import is_edge, is_wire, discretize_edge, discretize_wire
from OCC.Core.Tesselator import ShapeTesselator
# Import following for building vertex (or point cloud) in WebGL
from OCC.Core.gp import gp_Pnt
from OCC.Core.BRep import BRep_Builder
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeVertex

from flask import Flask, render_template


def format_color(r, g, b):
    return '0x%02x%02x%02x' % (r, g, b)


class RenderWraper(ThreejsRenderer):
    def __init__(self, path=None,
            default_shape_color=format_color(166, 166, 166), # light grey
            default_edge_color=format_color(32, 32, 32), # dark grey
            default_vertex_color=format_color(8, 8, 8)): # darker gray
        super().__init__(path)
        self._3js_vertex = {}
        self._default_shape_color = default_shape_color
        self._default_edge_color = default_edge_color
        self._default_vertex_color = default_vertex_color

    def ConvertShape(self,
                     shape,
                     export_edges=False,
                     color=(0.65, 0.65, 0.7),
                     specular_color=(0.2, 0.2, 0.2),
                     shininess=0.9,
                     transparency=0.,
                     line_color=(0, 0., 0.),
                     line_width=1.,
                     point_size=1.,
                     mesh_quality=1.):
        # if the shape is an edge or a wire, use the related functions
        color = color_to_hex(color)
        specular_color = color_to_hex(specular_color)
        if is_edge(shape):
            print("discretize an edge")
            pnts = discretize_edge(shape)
            edge_hash = "edg%s" % uuid.uuid4().hex
            shape_content = export_edgedata_to_json(edge_hash, pnts)
            # store this edge hash
            self._3js_edges[edge_hash] = [color, line_width, shape_content]
            return self._3js_shapes, self._3js_edges, self._3js_vertex
        elif is_wire(shape):
            print("discretize a wire")
            pnts = discretize_wire(shape)
            wire_hash = "wir%s" % uuid.uuid4().hex
            shape_content = export_edgedata_to_json(wire_hash, pnts)
            # store this edge hash
            self._3js_edges[wire_hash] = [color, line_width, shape_content]
            return self._3js_shapes, self._3js_edges, self._3js_vertex
        # if shape is array of gp_Pnt
        elif isinstance(shape, list) and isinstance(shape[0], gp_Pnt):
            print("storage points")
            vertices_list = []  # will be passed to javascript
            BB = BRep_Builder()
            compound = TopoDS_Compound()
            BB.MakeCompound(compound)

            for vertex in shape:
                vertext_to_add = BRepBuilderAPI_MakeVertex(vertex).Shape()
                BB.Add(compound, vertext_to_add)
                vertices_list.append([vertex.X(), vertex.Y(), vertex.Z()])
            points_hash = "pnt%s" % uuid.uuid4().hex
            # store this vertex hash. Note: TopoDS_Compound did not save now
            self._3js_vertex[points_hash] = [color, point_size, vertices_list]
            return self._3js_shapes, self._3js_edges, self._3js_vertex

        # convert as TopoDS_Shape
        shape_uuid = uuid.uuid4().hex
        shape_hash = "shp%s" % shape_uuid
        # tesselate
        tess = ShapeTesselator(shape)
        tess.Compute(compute_edges=export_edges,
                     mesh_quality=mesh_quality,
                     parallel=True)
        # update spinning cursor
        sys.stdout.write("\r%s mesh shape %s, %i triangles     " % (next(self.spinning_cursor),
                                                                    shape_hash,
                                                                    tess.ObjGetTriangleCount()))
        sys.stdout.flush()
        # export to 3JS
        # generate the mesh
        shape_content = tess.ExportShapeToThreejsJSONString(shape_uuid)
        # add this shape to the shape dict, sotres everything related to it
        self._3js_shapes[shape_hash] = [export_edges, color, specular_color, shininess, transparency,
                                        line_color, line_width, shape_content]
        # draw edges if necessary
        if export_edges:
            # export each edge to a single json
            # get number of edges
            nbr_edges = tess.ObjGetEdgeCount()
            for i_edge in range(nbr_edges):
                # after that, the file can be appended
                edge_content = ''
                edge_point_set = []
                nbr_vertices = tess.ObjEdgeGetVertexCount(i_edge)
                for i_vert in range(nbr_vertices):
                    edge_point_set.append(tess.GetEdgeVertex(i_edge, i_vert))
                # write to file
                edge_hash = "edg%s" % uuid.uuid4().hex
                edge_content += export_edgedata_to_json(edge_hash, edge_point_set)
                # store this edge hash, with black color
                self._3js_edges[edge_hash] = [color_to_hex((0, 0, 0)), line_width, edge_content]
        return self._3js_shapes, self._3js_edges, self._3js_vertex


class RenderConfig(object):
    def __init__(self, bg_gradient_color1="#ced7de", bg_gradient_color2="#808080",
                 vertex_shader=None, fragment_shader=None, uniforms=None):
        self._occ_version = OCC_VERSION
        self._3js_version = THREEJS_RELEASE
        self._bg_gradient_color1 = bg_gradient_color1
        self._bg_gradient_color2 = bg_gradient_color2
        self._vertex_shader = vertex_shader
        self._fragment_shader = fragment_shader
        self._uniforms = uniforms


app = Flask(__name__)
my_ren = RenderWraper()
render_cfg = RenderConfig()


if __name__ == '__main__':
    @app.route('/')
    @app.route('/index')
    def index():
        """PythonOCC Demo Page"""
        # remove shapes from previous (avoid duplicate shape after F5 refresh)
        my_ren._3js_shapes={}
        my_ren._3js_edges={}
        my_ren._3js_vertex={}

        # import additional modules for building a box and a torus.
        from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
        from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform
        from OCC.Core.gp import gp_Trsf
        import time


        def translate_shp(shp, vec, copy=False):
            trns = gp_Trsf()
            trns.SetTranslation(vec)
            brep_trns = BRepBuilderAPI_Transform(shp, trns, copy)
            brep_trns.Build()
            return brep_trns.Shape()
        box = BRepPrimAPI_MakeBox(100., 200., 300.).Shape()
        torus = BRepPrimAPI_MakeTorus(300., 105).Shape()
        t_torus = translate_shp(torus, gp_Vec(700, 0, 0))


        init_time = time.time()
        my_ren.ConvertShape(box, export_edges=True)
        my_ren.ConvertShape(t_torus, export_edges=True)
        final_time = time.time()
        print("\nTotal meshing time : ", final_time - init_time)

        return render_template('index.html', occ_version=OCC_VERSION, threejs_version=THREEJS_RELEASE,
                               render_cfg=render_cfg, occ_shapes=my_ren._3js_shapes, occ_edges=my_ren._3js_edges,
                               occ_vertex=my_ren._3js_vertex)

    app.run(host='localhost', port=8080, debug=False)
