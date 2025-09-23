"""A flask webserver."""

import sys
import uuid
from typing import Any, Dict, Optional, Tuple

from threejs_renderer import (
    ThreejsRenderer,
    OCC_VERSION,
    THREEJS_RELEASE,
    color_to_hex,
    export_edgedata_to_json,
)
from OCC.Extend.TopologyUtils import is_edge, is_wire, discretize_edge, discretize_wire
from OCC.Core.Tesselator import ShapeTesselator

# Import following for building vertex (or point cloud) in WebGL
from OCC.Core.gp import gp_Pnt
from OCC.Core.BRep import BRep_Builder
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeVertex

from flask import Flask, render_template


def format_color(r: int, g: int, b: int) -> str:
    """
    Formats a color from RGB to a hex string.

    Args:
        r (int): The red component (0-255).
        g (int): The green component (0-255).
        b (int): The blue component (0-255).

    Returns:
        str: The color as a hex string.
    """
    return "0x%02x%02x%02x" % (r, g, b)


class RenderWraper(ThreejsRenderer):
    """
    A wrapper for the ThreejsRenderer that adds support for Flask.
    """

    def __init__(
        self,
        path: Optional[str] = None,
        default_shape_color: str = format_color(166, 166, 166),  # light grey
        default_edge_color: str = format_color(32, 32, 32),  # dark grey
        default_vertex_color: str = format_color(8, 8, 8),
    ) -> None:  # darker gray
        """
        Initializes the RenderWraper.

        Args:
            path (str, optional): The path to the templates.
            default_shape_color (str, optional): The default color for shapes.
            default_edge_color (str, optional): The default color for edges.
            default_vertex_color (str, optional): The default color for vertices.
        """
        super().__init__(path)
        self._3js_vertex: Dict[str, Any] = {}
        self._default_shape_color = default_shape_color
        self._default_edge_color = default_edge_color
        self._default_vertex_color = default_vertex_color

    def convert_shape(
        self,
        shape: Any,
        export_edges: bool = False,
        color: Tuple[float, float, float] = (0.65, 0.65, 0.7),
        specular_color: Tuple[float, float, float] = (0.2, 0.2, 0.2),
        shininess: float = 0.9,
        transparency: float = 0.0,
        line_color: Tuple[float, float, float] = (0, 0.0, 0.0),
        line_width: float = 1.0,
        point_size: float = 1.0,
        mesh_quality: float = 1.0,
    ) -> Tuple[Dict[str, Any], Dict[str, Any], Dict[str, Any]]:
        """
        Converts a shape to a format that can be rendered by Three.js.

        Args:
            shape: The shape to convert.
            export_edges (bool, optional): Whether to export the edges of the shape.
            color (tuple, optional): The color of the shape.
            specular_color (tuple, optional): The specular color of the shape.
            shininess (float, optional): The shininess of the shape.
            transparency (float, optional): The transparency of the shape.
            line_color (tuple, optional): The color of the lines.
            line_width (float, optional): The width of the lines.
            point_size (float, optional): The size of the points.
            mesh_quality (float, optional): The quality of the mesh.

        Returns:
            A tuple containing the shapes, edges, and vertices.
        """
        # if the shape is an edge or a wire, use the related functions
        color = color_to_hex(color)
        specular_color = color_to_hex(specular_color)
        if is_edge(shape):
            print("discretize an edge")
            pnts = discretize_edge(shape)
            edge_hash = f"edg{uuid.uuid4().hex}"
            shape_content = export_edgedata_to_json(edge_hash, pnts)
            # store this edge hash
            self._3js_edges[edge_hash] = [color, line_width, shape_content]
            return self._3js_shapes, self._3js_edges, self._3js_vertex
        elif is_wire(shape):
            print("discretize a wire")
            pnts = discretize_wire(shape)
            wire_hash = f"wir{uuid.uuid4().hex}"
            shape_content = export_edgedata_to_json(wire_hash, pnts)
            # store this edge hash
            self._3js_edges[wire_hash] = [color, line_width, shape_content]
            return self._3js_shapes, self._3js_edges, self._3js_vertex
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
            points_hash = f"pnt{uuid.uuid4().hex}"
            # store this vertex hash. Note: TopoDS_Compound did not save now
            self._3js_vertex[points_hash] = [color, point_size, vertices_list]
            return self._3js_shapes, self._3js_edges, self._3js_vertex

        # convert as TopoDS_Shape
        shape_uuid = uuid.uuid4().hex
        shape_hash = f"shp{shape_uuid}"
        # tessellate
        tess = ShapeTesselator(shape)
        tess.Compute(
            compute_edges=export_edges, mesh_quality=mesh_quality, parallel=True
        )
        # update spinning cursor
        sys.stdout.write(
            f"\r{next(self.spinning_cursor)} mesh shape {shape_hash}, {tess.ObjGetTriangleCount()} triangles     "
        )
        sys.stdout.flush()
        # export to 3JS
        # generate the mesh
        shape_content = tess.ExportShapeToThreejsJSONString(shape_uuid)
        # add this shape to the shape dict, sotres everything related to it
        self._3js_shapes[shape_hash] = [
            export_edges,
            color,
            specular_color,
            shininess,
            transparency,
            line_color,
            line_width,
            shape_content,
        ]
        # draw edges if necessary
        if export_edges:
            # export each edge to a single json
            # get number of edges
            nbr_edges = tess.ObjGetEdgeCount()
            for i_edge in range(nbr_edges):
                # after that, the file can be appended
                edge_content = ""
                nbr_vertices = tess.ObjEdgeGetVertexCount(i_edge)
                edge_point_set = [
                    tess.GetEdgeVertex(i_edge, i_vert) for i_vert in range(nbr_vertices)
                ]
                # write to file
                edge_hash = f"edg{uuid.uuid4().hex}"
                edge_content += export_edgedata_to_json(edge_hash, edge_point_set)
                # store this edge hash, with black color
                self._3js_edges[edge_hash] = [
                    color_to_hex((0, 0, 0)),
                    line_width,
                    edge_content,
                ]
        return self._3js_shapes, self._3js_edges, self._3js_vertex


class RenderConfig:
    """
    Configuration for the renderer.
    """

    def __init__(
        self,
        bg_gradient_color1: str = "#ced7de",
        bg_gradient_color2: str = "#808080",
        vertex_shader: Optional[str] = None,
        fragment_shader: Optional[str] = None,
        uniforms: Optional[Dict[str, Any]] = None,
    ) -> None:
        """
        Initializes the RenderConfig.

        Args:
            bg_gradient_color1 (str, optional): The first color of the background gradient.
            bg_gradient_color2 (str, optional): The second color of the background gradient.
            vertex_shader (str, optional): The vertex shader to use.
            fragment_shader (str, optional): The fragment shader to use.
            uniforms (dict, optional): The uniforms to use.
        """
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


if __name__ == "__main__":

    @app.route("/")
    @app.route("/index")
    def index() -> str:
        """PythonOCC Demo Page"""
        # remove shapes from previous (avoid duplicate shape after F5 refresh)
        my_ren._3js_shapes = {}
        my_ren._3js_edges = {}
        my_ren._3js_vertex = {}

        # import additional modules for building a box and a torus.
        from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
        from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_Transform
        from OCC.Core.gp import gp_Trsf, gp_Vec
        from OCC.Core.TopoDS import TopoDS_Shape
        import time

        def translate_shp(
            shp: TopoDS_Shape, vec: gp_Vec, copy: bool = False
        ) -> TopoDS_Shape:
            trns = gp_Trsf()
            trns.SetTranslation(vec)
            brep_trns = BRepBuilderAPI_Transform(shp, trns, copy)
            brep_trns.Build()
            return brep_trns.Shape()

        box = BRepPrimAPI_MakeBox(100.0, 200.0, 300.0).Shape()
        torus = BRepPrimAPI_MakeTorus(300.0, 105).Shape()
        t_torus = translate_shp(torus, gp_Vec(700, 0, 0))

        init_time = time.time()
        my_ren.convert_shape(box, export_edges=True)
        my_ren.convert_shape(t_torus, export_edges=True)
        final_time = time.time()
        print("\nTotal meshing time : {:.2f}s".format(final_time - init_time))

        return render_template(
            "index.html",
            occ_version=OCC_VERSION,
            threejs_version=THREEJS_RELEASE,
            render_cfg=render_cfg,
            occ_shapes=my_ren._3js_shapes,
            occ_edges=my_ren._3js_edges,
            occ_vertex=my_ren._3js_vertex,
        )

    app.run(host="localhost", port=8080, debug=False)
