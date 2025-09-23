##Copyright 2011-2024 Thomas Paviot (tpaviot@gmail.com)
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

import json
import os
from string import Template
import sys
import tempfile
import uuid
from typing import Any, Dict, Generator, List, Optional, Tuple

from OCC.Core.gp import gp_Vec
from OCC.Core.Tesselator import ShapeTesselator
from OCC import VERSION

from OCC.Extend.TopologyUtils import is_edge, is_wire, discretize_edge, discretize_wire
from OCC.Display.WebGl.simple_server import start_server


def spinning_cursor() -> Generator[str, None, None]:
    """
    A spinning cursor generator.
    """
    while True:
        yield from "|/-\\"


def color_to_hex(rgb_color: Tuple[float, float, float]) -> str:
    """
    Converts a color from RGB to a hex string.

    Args:
        rgb_color (tuple): A tuple of 3 floats (R, G, B) between 0 and 1.

    Returns:
        str: The color as a hex string.
    """
    r, g, b = rgb_color
    if not (0 <= r <= 1.0 and 0 <= g <= 1.0 and 0 <= b <= 1.0):
        raise AssertionError("rgb values must be between 0.0 and 1.0")
    rh = int(r * 255.0)
    gh = int(g * 255.0)
    bh = int(b * 255.0)
    return "0x%.02x%.02x%.02x" % (rh, gh, bh)


def export_edgedata_to_json(edge_hash: str, point_set: List[List[float]]) -> str:
    """
    Exports a set of points to a LineSegment buffergeometry.

    Args:
        edge_hash (str): The hash of the edge.
        point_set (list): A list of points.

    Returns:
        str: The JSON string.
    """
    # first build the array of point coordinates
    # edges are built as follows:
    # points_coordinates  =[P0x, P0y, P0z, P1x, P1y, P1z, P2x, P2y, etc.]
    points_coordinates = []
    for point in point_set:
        points_coordinates.extend(iter(point))
    # then build the dictionary exported to json
    edges_data = {
        "metadata": {
            "version": 4.4,
            "type": "BufferGeometry",
            "generator": "pythonocc",
        },
        "uuid": edge_hash,
        "type": "BufferGeometry",
        "data": {
            "attributes": {
                "position": {
                    "itemSize": 3,
                    "type": "Float32Array",
                    "array": points_coordinates,
                }
            }
        },
    }
    return json.dumps(edges_data, indent=4)


HEADER_TEMPLATE = Template(
    """
<head>
    <title>pythonocc $VERSION webgl renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonocc'>
    <meta charset="utf-8">
    <style>
        body {
            background: linear-gradient($bg_gradient_color1, $bg_gradient_color2);
            margin: 0px;
            overflow: hidden;
        }
        #pythonocc_rocks {
            padding: 5px;
            position: absolute;
            left: 1%;
            bottom: 2%;
            height: 19px;
            width: 236px;
            border-radius: 5px;
            border: 2px solid #f7941e;
            opacity: 0.7;
            font-family: Arial;
            background-color: #414042;
            color: #ffffff;
            font-size: 14px;
            opacity: 0.5;
        }
        #commands {
            padding: 5px;
            position: absolute;
            right: 1%;
            top: 2%;
            height: 65px;
            width: 180px;
            border-radius: 5px;
            border: 2px solid #f7941e;
            opacity: 0.7;
            font-family: Arial;
            background-color: #414042;
            color: #ffffff;
            font-size: 14px;
            opacity: 0.5;
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
)

BODY_TEMPLATE = Template(
    """
    <body>
    <div id="container"></div>
    <div id="pythonocc_rocks">
        pythonocc-$VERSION <a href="https://threejs.org" target="_blank">three.js</a> renderer
    </div>
    <div id="commands">
    <b>t</b> view/hide shape<br>
    <b>w</b> toggle wireframe/shaded<br>
    <b>g</b> view/hide grid<br>
    <b>a</b> view/hide axis<br>
    </div>
    $VertexShaderDefinition
    $FragmentShaderDefinition
    <script async src="https://unpkg.com/es-module-shims@1.8.0/dist/es-module-shims.js"></script>
    <script type="importmap">
      {
        "imports": {
          "three": "https://unpkg.com/three/build/three.module.js",
          "three/addons/": "https://unpkg.com/three/examples/jsm/"
        }
      }
    </script>
    <script type="module" src="/main.js"></script>
    </body>
"""
)

MAIN_JS_TEMPLATE = Template(
    """
import * as THREE from 'three';
import { TrackballControls } from 'three/addons/controls/TrackballControls.js';

var camera, scene, renderer, object, container, shape_material;
var controls;
var directionalLight;
var axisHelper, gridHelper;
var light1;
var mouse;
var mouseX = 0;
var mouseXOnMouseDown = 0;
var mouseY = 0;
var mouseYOnMouseDown = 0;
var moveForward = false;
var moveBackward = false;
var moveLeft = false;
var moveRight = false;
var moveUp = false;
var moveDown = false;
var raycaster;
var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;
var selected_target_color_r = 0;
var selected_target_color_g = 0;
var selected_target_color_b = 0;
var selected_target = null;
init();
animate();

function init() {
    container = document.createElement( 'div' );
    document.body.appendChild( container );

    camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 1, 200);
    camera.position.z = 100;
    
    raycaster = new THREE.Raycaster();
    mouse = new THREE.Vector2();
    
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0xf0f0f0);
    const ambientLight = new THREE.AmbientLight(0x404040, 1.5);
    scene.add(ambientLight);

    directionalLight = new THREE.DirectionalLight(0xffffff, 1);
    directionalLight.position.set(1, 1, 1).normalize();
    scene.add(directionalLight);

    light1 = new THREE.PointLight(0xffffff, 0.8);
    light1.position.set(50, 50, 50);
    scene.add(light1);

    $Uniforms
    
    $ShaderMaterialDefinition

    $ShapeList

    $EdgeList

    renderer = new THREE.WebGLRenderer({antialias:true, alpha: true});
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio( window.devicePixelRatio );
    container.appendChild(renderer.domElement);
    
    // shadow rendering
    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    
    // tone mapping
    renderer.toneMapping = THREE.ACESFilmicToneMapping;
    renderer.toneMappingExposure = 1.0;
    renderer.outputColorSpace = THREE.SRGBColorSpace;
    
    controls = new TrackballControls(camera, renderer.domElement);
    
    document.addEventListener('keypress', onDocumentKeyPress, false);
    document.addEventListener('click', onDocumentMouseClick, false);
    window.addEventListener('resize', onWindowResize, false);
}

function animate() {
    requestAnimationFrame(animate);
    controls.update();
    render();
}

function update_lights() {
    if (directionalLight != undefined) {
        directionalLight.position.copy(camera.position);
    }
}

function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

function onDocumentKeyPress(event) {
  event.preventDefault();
  if (event.key=="t") {  // t key
      if (selected_target) {
            selected_target.material.visible = !selected_target.material.visible;
        }
  }
  else if (event.key=="g") { // g key, toggle grid visibility
       gridHelper.visible = !gridHelper.visible;
  }
  else if (event.key=="a") { // g key, toggle axisHelper visibility
       axisHelper.visible = !axisHelper.visible;
  }
  else if (event.key=="w") { // g key, toggle axisHelper visibility
       if (selected_target) {
            selected_target.material.wireframe = !selected_target.material.wireframe;
        }
  }
}

function onDocumentMouseClick(event) {
    event.preventDefault();
    mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
    mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
    // restore previous selected target color
    if (selected_target) {
        selected_target.material.color.setRGB(selected_target_color_r,
            selected_target_color_g,
            selected_target_color_b);
    }
    // perform selection
    raycaster.setFromCamera(mouse, camera);
    var intersects = raycaster.intersectObjects(scene.children);
    if (intersects.length > 0) {
        var target = intersects[0].object;
        selected_target_color_r = target.material.color.r;
        selected_target_color_g = target.material.color.g;
        selected_target_color_b = target.material.color.b;
        target.material.color.setRGB(1., 0.65, 0.);
        console.log(target);
        selected_target = target;
    }
}

function fit_to_scene() {
    // compute bounding sphere of whole scene
    var center = new THREE.Vector3(0,0,0);
    var radiuses = new Array();
    var positions = new Array();

    // compute center of all objects
    scene.traverse(function(child) {
        if (child instanceof THREE.Mesh) {
            child.geometry.computeBoundingBox();
            var box = child.geometry.boundingBox;
            var curCenter = new THREE.Vector3().copy(box.min).add(box.max).multiplyScalar(0.5);
            var radius = new THREE.Vector3().copy(box.max).distanceTo(box.min)/2.;
            center.add(curCenter);
            positions.push(curCenter);
            radiuses.push(radius);
        }
    });

    if (radiuses.length > 0) {
        center.divideScalar(radiuses.length*0.7);
    }

    var maxRad = 1.;
    // compute bounding radius
    for (var ichild = 0; ichild < radiuses.length; ++ichild) {
        var distToCenter = positions[ichild].distanceTo(center);
        var totalDist = distToCenter + radiuses[ichild];
        if (totalDist > maxRad) {
            maxRad = totalDist;
        }
    }

    maxRad = maxRad * 0.7; // otherwise the scene seems to be too far away
    camera.lookAt(center);
    var direction = new THREE.Vector3().copy(camera.position).sub(controls.target);
    var len = direction.length();
    direction.normalize();
    
    // compute new distance of camera to middle of scene to fit the object to screen
    var lnew = maxRad / Math.sin(camera.fov/180. * Math.PI / 2.);
    direction.multiplyScalar(lnew);
    
    var pnew = new THREE.Vector3().copy(center).add(direction);
    // change near far values to avoid culling of objects 
    camera.position.set(pnew.x, pnew.y, pnew.z);
    camera.far = lnew * 50;
    camera.near = lnew * 50 * 0.001;
    camera.updateProjectionMatrix();
    controls.target = center;
    controls.update();

    // adds and adjust a grid helper if needed
    gridHelper = new THREE.GridHelper(maxRad*4, 10)
    scene.add(gridHelper);

    // axisHelper
    axisHelper = new THREE.AxesHelper(maxRad);
    scene.add(axisHelper);
}

function render() {
    //@IncrementTime@  TODO UNCOMMENT
    update_lights();
    renderer.render(scene, camera);
}
"""
)


class HTMLHeader:
    """
    A class to generate the HTML header.
    """

    def __init__(
        self, bg_gradient_color1: str = "#ced7de", bg_gradient_color2: str = "#808080"
    ) -> None:
        """
        Initializes the HTMLHeader.

        Args:
            bg_gradient_color1 (str, optional): The first color of the background gradient.
            bg_gradient_color2 (str, optional): The second color of the background gradient.
        """
        self._bg_gradient_color1 = bg_gradient_color1
        self._bg_gradient_color2 = bg_gradient_color2

    def get_str(self) -> str:
        """
        Returns the HTML header as a string.
        """
        return HEADER_TEMPLATE.substitute(
            {
                "bg_gradient_color1": f"{self._bg_gradient_color1}",
                "bg_gradient_color2": f"{self._bg_gradient_color2}",
                "VERSION": VERSION,
            }
        )


class ThreejsRenderer:
    """
    A renderer that uses three.js to display shapes in a web browser.
    """

    def __init__(self, path: Optional[str] = None) -> None:
        """
        Initializes the ThreejsRenderer.

        Args:
            path (str, optional): The path to the directory where the HTML
                and JavaScript files will be created. If not specified, a
                temporary directory will be created.
        """
        self._path = tempfile.mkdtemp() if not path else path
        self._html_filename = os.path.join(self._path, "index.html")
        self._main_js_filename = os.path.join(self._path, "main.js")
        self._3js_shapes: Dict[str, Any] = {}
        self._3js_edges: Dict[str, Any] = {}
        self.spinning_cursor = spinning_cursor()
        print("## threejs renderer")

    def DisplayShape(
        self,
        shape: Any,
        export_edges: bool = False,
        color: Tuple[float, float, float] = (0.65, 0.65, 0.7),
        specular_color: Tuple[float, float, float] = (0.2, 0.2, 0.2),
        shininess: float = 0.9,
        transparency: float = 0.0,
        line_color: Tuple[float, float, float] = (0, 0.0, 0.0),
        line_width: float = 1.0,
        mesh_quality: float = 1.0,
    ) -> Tuple[Dict[str, Any], Dict[str, Any]]:
        """
        Displays a shape.

        Args:
            shape: The shape to display.
            export_edges (bool, optional): Whether to export the edges of the shape.
            color (tuple, optional): The color of the shape.
            specular_color (tuple, optional): The specular color of the shape.
            shininess (float, optional): The shininess of the shape.
            transparency (float, optional): The transparency of the shape.
            line_color (tuple, optional): The color of the lines.
            line_width (float, optional): The width of the lines.
            mesh_quality (float, optional): The quality of the mesh.

        Returns:
            A tuple containing the shapes and edges.
        """
        # if the shape is an edge or a wire, use the related functions
        if is_edge(shape):
            print("discretize an edge")
            pnts = discretize_edge(shape)
            edge_hash = f"edg{uuid.uuid4().hex}"
            str_to_write = export_edgedata_to_json(edge_hash, pnts)
            edge_full_path = os.path.join(self._path, f"{edge_hash}.json")
            with open(edge_full_path, "w") as edge_file:
                edge_file.write(str_to_write)
            # store this edge hash
            self._3js_edges[edge_hash] = [color, line_width]
            return self._3js_shapes, self._3js_edges
        elif is_wire(shape):
            print("discretize a wire")
            pnts = discretize_wire(shape)
            wire_hash = f"wir{uuid.uuid4().hex}"
            str_to_write = export_edgedata_to_json(wire_hash, pnts)
            wire_full_path = os.path.join(self._path, f"{wire_hash}.json")
            with open(wire_full_path, "w") as wire_file:
                wire_file.write(str_to_write)
            # store this edge hash
            self._3js_edges[wire_hash] = [color, line_width]
            return self._3js_shapes, self._3js_edges
        shape_uuid = uuid.uuid4().hex
        shape_hash = f"shp{shape_uuid}"
        # tesselatte
        tess = ShapeTesselator(shape)
        tess.Compute(
            compute_edges=export_edges, mesh_quality=mesh_quality, parallel=True
        )
        # update spinning cursor
        sys.stdout.write(
            "\r%s mesh shape %s, %i triangles     "
            % (next(self.spinning_cursor), shape_hash, tess.ObjGetTriangleCount())
        )
        sys.stdout.flush()
        # export to 3JS
        shape_full_path = os.path.join(self._path, f"{shape_hash}.json")
        # add this shape to the shape dict, sotres everything related to it
        self._3js_shapes[shape_hash] = [
            export_edges,
            color,
            specular_color,
            shininess,
            transparency,
            line_color,
            line_width,
        ]
        # generate the mesh
        # and also to JSON
        with open(shape_full_path, "w") as json_file:
            json_file.write(tess.ExportShapeToThreejsJSONString(shape_uuid))
        # draw edges if necessary
        if export_edges:
            # export each edge to a single json
            # get number of edges
            nbr_edges = tess.ObjGetEdgeCount()
            for i_edge in range(nbr_edges):
                # after that, the file can be appended
                str_to_write = ""
                nbr_vertices = tess.ObjEdgeGetVertexCount(i_edge)
                edge_point_set = [
                    tess.GetEdgeVertex(i_edge, i_vert) for i_vert in range(nbr_vertices)
                ]
                # write to file
                edge_hash = f"edg{uuid.uuid4().hex}"
                str_to_write += export_edgedata_to_json(edge_hash, edge_point_set)
                # create the file
                edge_full_path = os.path.join(self._path, f"{edge_hash}.json")
                with open(edge_full_path, "w") as edge_file:
                    edge_file.write(str_to_write)
                # store this edge hash, with black color
                self._3js_edges[edge_hash] = [(0, 0, 0), line_width]
        return self._3js_shapes, self._3js_edges

    def generate_html_file(self) -> None:
        """
        Generates the HTML file to be rendered by the web browser.
        """
        global BODY_TEMPLATE
        # loop over shapes to generate html shapes stuff
        # the following line is a list that will help generating the string
        # using "".join()
        shape_string_list = ["var loader = new THREE.BufferGeometryLoader();\n"]
        for shape_idx, shape_hash in enumerate(self._3js_shapes):
            # get properties for this shape
            (
                export_edges,
                color,
                specular_color,
                shininess,
                transparency,
                line_color,
                line_width,
            ) = self._3js_shapes[shape_hash]
            shape_string_list.extend(
                (
                    "\t\t\tvar %s_phong_material = new THREE.MeshPhongMaterial({"
                    % shape_hash,
                    f"color:{color_to_hex(color)},",
                    f"specular:{color_to_hex(specular_color)},",
                    "shininess:%g," % shininess,
                    "side: THREE.DoubleSide,",
                    "flatShading:false,",
                )
            )
            if transparency > 0.0:
                shape_string_list.append(
                    "transparent: true, premultipliedAlpha: true, opacity:%g,"
                    % transparency
                )
            shape_string_list.extend(
                (
                    "});\n",
                    "\t\t\tloader.load('%s.json', function(geometry) {\n" % shape_hash,
                    "\t\t\t\tvar mesh = new THREE.Mesh(geometry, %s_phong_material);\n"
                    % shape_hash,
                    "\t\t\t\tmesh.castShadow = true;\n",
                    "\t\t\t\tmesh.receiveShadow = true;\n",
                    "\t\t\t\tscene.add(mesh);\n",
                )
            )
            # last shape, we request for a fit_to_scene
            if shape_idx == len(self._3js_shapes) - 1:
                shape_string_list.append("\tfit_to_scene();});\n")
            else:
                shape_string_list.append("\t\t\t});\n\n")
        # Process edges
        edge_string_list = []
        for edge_hash in self._3js_edges:
            color, line_width = self._3js_edges[edge_hash]
            edge_string_list.extend(
                (
                    "\tloader.load('%s.json', function(geometry) {\n" % edge_hash,
                    "\tvar line_material = new THREE.LineBasicMaterial({color: %s, linewidth: %s});\n"
                    % ((color_to_hex(color), line_width)),
                    "\tvar line = new THREE.Line(geometry, line_material);\n",
                    "\tscene.add(line);\n",
                    "\t});\n",
                )
            )
        # write the main.js file
        with open(self._main_js_filename, "w") as fp:
            main_js = MAIN_JS_TEMPLATE.substitute(
                {
                    "ShapeList": "".join(shape_string_list),
                    "EdgeList": "".join(edge_string_list),
                    "Uniforms": "",
                    "ShaderMaterialDefinition": "",
                }
            )
            fp.write(main_js)

        # write the index.html file
        with open(self._html_filename, "w") as fp:
            fp.write("<!DOCTYPE HTML>\n")
            fp.write("<html lang='en'>")
            # header
            fp.write(HTMLHeader().get_str())
            # body
            body = BODY_TEMPLATE.substitute(
                {
                    "VERSION": VERSION,
                    "VertexShaderDefinition": "",
                    "FragmentShaderDefinition": "",
                }
            )  # = BODY_TEMPLATE_PART0.replace("@VERSION@", VERSION)
            fp.write(body)
            fp.write("</html>\n")

    def render(
        self,
        addr: str = "localhost",
        server_port: int = 8080,
        open_webbrowser: bool = False,
    ) -> None:
        """
        Renders the scene in the browser.

        Args:
            addr (str, optional): The address to bind the server to.
            server_port (int, optional): The port to use for the server.
            open_webbrowser (bool, optional): Whether to open a web browser.
        """
        # generate HTML file
        self.generate_html_file()
        # then create a simple web server
        start_server(addr, server_port, self._path, open_webbrowser)


if __name__ == "__main__":
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
    my_ren = ThreejsRenderer()
    init_time = time.time()
    my_ren.DisplayShape(box, export_edges=True)
    my_ren.DisplayShape(t_torus, export_edges=True)
    final_time = time.time()
    print("\nTotal meshing time : ", final_time - init_time)
    my_ren.render()
