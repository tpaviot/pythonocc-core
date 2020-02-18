##Copyright 2011-2019 Thomas Paviot (tpaviot@gmail.com)
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

import os
import sys
import tempfile
import uuid
import json

from OCC.Core.gp import gp_Vec
from OCC.Core.Tesselator import ShapeTesselator
from OCC import VERSION as OCC_VERSION

from OCC.Extend.TopologyUtils import is_edge, is_wire, discretize_edge, discretize_wire
from OCC.Display.WebGl.simple_server import start_server

THREEJS_RELEASE = "r113"

def spinning_cursor():
    while True:
        for cursor in '|/-\\':
            yield cursor

def color_to_hex(rgb_color):
    """ Takes a tuple with 3 floats between 0 and 1.
    Returns a hex. Useful to convert occ colors to web color code
    """
    r, g, b = rgb_color
    if not (0 <= r <= 1. and 0 <= g <= 1. and 0 <= b <= 1.):
        raise AssertionError("rgb values must be between 0.0 and 1.0")
    rh = int(r * 255.)
    gh = int(g * 255.)
    bh = int(b * 255.)
    return "0x%.02x%.02x%.02x" % (rh, gh, bh)

def export_edgedata_to_json(edge_hash, point_set):
    """ Export a set of points to a LineSegment buffergeometry
    """
    # first build the array of point coordinates
    # edges are built as follows:
    # points_coordinates  =[P0x, P0y, P0z, P1x, P1y, P1z, P2x, P2y, etc.]
    points_coordinates = []
    for point in point_set:
        for coord in point:
            points_coordinates.append(coord)
    # then build the dictionnary exported to json
    edges_data = {"metadata": {"version": 4.4,
                               "type": "BufferGeometry",
                               "generator": "pythonocc"},
                  "uuid": edge_hash,
                  "type": "BufferGeometry",
                  "data": {"attributes": {"position": {"itemSize": 3,
                                                       "type": "Float32Array",
                                                       "array": points_coordinates}
                                         }
                          }
                  }
    return json.dumps(edges_data)


HEADER = """
<head>
    <title>pythonocc @VERSION@ webgl renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonocc'>
    <meta charset="utf-8">
    <style>
        body {
            background: linear-gradient(@bg_gradient_color1@, @bg_gradient_color2@);
            margin: 0px;
            overflow: hidden;
        }
        #pythonocc_rocks {
            padding: 5px;
            position: absolute;
            left: 1%;
            bottom: 2%;
            height: 38px;
            width: 280px;
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
BODY_PART0 = """
<body>
    <div id="container"></div>
    <div id="pythonocc_rocks">
        pythonocc-@VERSION@ <a href="https://github.com/mrdoob/three.js" target="_blank">three.js %s</a> renderer
        <br>Check our blog at
        <a href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>
    <div id="commands">
    <b>t</b> view/hide shape<br>
    <b>w</b> toggle wireframe/shaded<br>
    <b>g</b> view/hide grid<br>
    <b>a</b> view/hide axis<br>
    </div>
    <script src="https://rawcdn.githack.com/mrdoob/three.js/%s/build/three.min.js"></script>
    <script src="https://rawcdn.githack.com/mrdoob/three.js/%s/examples/js/controls/TrackballControls.js"></script>
    <script src="https://rawcdn.githack.com/mrdoob/three.js/%s/examples/js/libs/stats.min.js"></script>

""" % (THREEJS_RELEASE, THREEJS_RELEASE, THREEJS_RELEASE, THREEJS_RELEASE)

BODY_PART1 = """

    @VertexShaderDefinition@
    @FragmentShaderDefinition@
    <script type="text/javascript">
        var camera, scene, renderer, object, stats, container, shape_material;
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
            //controls = new THREE.OrbitControls(camera);
            //controls = new THREE.OrbitControls(camera);
            // for selection
            raycaster = new THREE.Raycaster();
            mouse = new THREE.Vector2();
            // create scene
            scene = new THREE.Scene();
            scene.add(new THREE.AmbientLight(0x101010));
            directionalLight = new THREE.DirectionalLight(0xffffff);
            directionalLight.position.x = 1;
            directionalLight.position.y = -1;
            directionalLight.position.z = 2;
            directionalLight.position.normalize();
            scene.add(directionalLight);
            light1 = new THREE.PointLight(0xffffff);
            scene.add(light1);
            @Uniforms@
            @ShaderMaterialDefinition@
            """
            # here comes the shape definition
BODY_PART2 = """
            renderer = new THREE.WebGLRenderer({antialias:true, alpha: true});
            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.setPixelRatio( window.devicePixelRatio );
            container.appendChild(renderer.domElement);
            //renderer.gammaInput = true;
            //renderer.gammaOutput = true;
            // for shadow rendering
            renderer.shadowMap.enabled = true;
            renderer.shadowMap.type = THREE.PCFShadowMap;
            controls = new THREE.TrackballControls(camera, renderer.domElement);
            // show stats, is it really useful ?
            stats = new Stats();
            stats.domElement.style.position = 'absolute';
            stats.domElement.style.top = '2%';
            stats.domElement.style.left = '1%';
            container.appendChild(stats.domElement);
            // add events
            document.addEventListener('keypress', onDocumentKeyPress, false);
            document.addEventListener('click', onDocumentMouseClick, false);
            window.addEventListener('resize', onWindowResize, false);
        }
        function animate() {
            requestAnimationFrame(animate);
            controls.update();
            render();
            stats.update();
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
            camera.far = lnew*50;
            camera.near = lnew*50*0.001;
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
    </script>
</body>
"""


class HTMLHeader:
    def __init__(self, bg_gradient_color1="#ced7de", bg_gradient_color2="#808080"):
        self._bg_gradient_color1 = bg_gradient_color1
        self._bg_gradient_color2 = bg_gradient_color2

    def get_str(self):
        header_str = HEADER.replace('@bg_gradient_color1@', '%s' % self._bg_gradient_color1)
        header_str = header_str.replace('@bg_gradient_color2@', '%s' % self._bg_gradient_color2)
        header_str = header_str.replace('@VERSION@', OCC_VERSION)
        return header_str


class HTMLBody_Part1:
    def __init__(self, vertex_shader=None, fragment_shader=None, uniforms=None):
        self._vertex_shader = vertex_shader
        self._fragment_shader = fragment_shader
        self._uniforms = uniforms

    def get_str(self):
        global BODY_PART2
        # get the location where pythonocc is running from
        body_str = BODY_PART1.replace('@VERSION@', OCC_VERSION)
        if (self._fragment_shader is not None) and (self._fragment_shader is not None):
            vertex_shader_string_definition = '<script type="x-shader/x-vertex" id="vertexShader">%s</script>' % self._vertex_shader
            fragment_shader_string_definition = '<script type="x-shader/x-fragment" id="fragmentShader">%s</script>' % self._fragment_shader
            shader_material_definition = """
            var vertexShader = document.getElementById('vertexShader').textContent;
            var fragmentShader = document.getElementById('fragmentShader').textContent;
            var shader_material = new THREE.ShaderMaterial({uniforms: uniforms,
                                                            vertexShader: vertexShader,
                                                            fragmentShader: fragmentShader});
            """
            if self._uniforms is None:
                body_str = body_str.replace('@Uniforms@', 'uniforms ={};\n')
                BODY_PART2 = BODY_PART2.replace('@IncrementTime@', '')
            else:
                body_str = body_str.replace('@Uniforms@', self._uniforms)
                if 'time' in self._uniforms:
                    BODY_PART2 = BODY_PART2.replace('@IncrementTime@', 'uniforms.time.value += 0.05;')
                else:
                    BODY_PART2 = BODY_PART2.replace('@IncrementTime@', '')
            body_str = body_str.replace('@VertexShaderDefinition@', vertex_shader_string_definition)
            body_str = body_str.replace('@FragmentShaderDefinition@', fragment_shader_string_definition)
            body_str = body_str.replace('@ShaderMaterialDefinition@', shader_material_definition)
            body_str = body_str.replace('@ShapeMaterial@', 'shader_material')
        else:
            body_str = body_str.replace('@Uniforms@', '')
            body_str = body_str.replace('@VertexShaderDefinition@', '')
            body_str = body_str.replace('@FragmentShaderDefinition@', '')
            body_str = body_str.replace('@ShaderMaterialDefinition@', '')
            body_str = body_str.replace('@ShapeMaterial@', 'phong_material')
            body_str = body_str.replace('@IncrementTime@', '')
        return body_str


class ThreejsRenderer:
    def __init__(self, path=None):
        if not path:
            self._path = tempfile.mkdtemp()
        else:
            self._path = path
        self._html_filename = os.path.join(self._path, "index.html")
        self._3js_shapes = {}
        self._3js_edges = {}
        self.spinning_cursor = spinning_cursor()
        print("## threejs %s webgl renderer" % THREEJS_RELEASE)

    def DisplayShape(self,
                     shape,
                     export_edges=False,
                     color=(0.65, 0.65, 0.7),
                     specular_color=(0.2, 0.2, 0.2),
                     shininess=0.9,
                     transparency=0.,
                     line_color=(0, 0., 0.),
                     line_width=1.,
                     mesh_quality=1.):
        # if the shape is an edge or a wire, use the related functions
        if is_edge(shape):
            print("discretize an edge")
            pnts = discretize_edge(shape)
            edge_hash = "edg%s" % uuid.uuid4().hex
            str_to_write = export_edgedata_to_json(edge_hash, pnts)
            edge_full_path = os.path.join(self._path, edge_hash + '.json')
            with open(edge_full_path, "w") as edge_file:
                edge_file.write(str_to_write)
            # store this edge hash
            self._3js_edges[edge_hash] = [color, line_width]
            return self._3js_shapes, self._3js_edges
        elif is_wire(shape):
            print("discretize a wire")
            pnts = discretize_wire(shape)
            wire_hash = "wir%s" % uuid.uuid4().hex
            str_to_write = export_edgedata_to_json(wire_hash, pnts)
            wire_full_path = os.path.join(self._path, wire_hash + '.json')
            with open(wire_full_path, "w") as wire_file:
                wire_file.write(str_to_write)
            # store this edge hash
            self._3js_edges[wire_hash] = [color, line_width]
            return self._3js_shapes, self._3js_edges
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
        shape_full_path = os.path.join(self._path, shape_hash + '.json')
        # add this shape to the shape dict, sotres everything related to it
        self._3js_shapes[shape_hash] = [export_edges, color, specular_color, shininess, transparency, line_color, line_width]
        # generate the mesh
        #tess.ExportShapeToThreejs(shape_hash, shape_full_path)
        # and also to JSON
        with open(shape_full_path, 'w') as json_file:
            json_file.write(tess.ExportShapeToThreejsJSONString(shape_uuid))
        # draw edges if necessary
        if export_edges:
            # export each edge to a single json
            # get number of edges
            nbr_edges = tess.ObjGetEdgeCount()
            for i_edge in range(nbr_edges):
                # after that, the file can be appended
                str_to_write = ''
                edge_point_set = []
                nbr_vertices = tess.ObjEdgeGetVertexCount(i_edge)
                for i_vert in range(nbr_vertices):
                    edge_point_set.append(tess.GetEdgeVertex(i_edge, i_vert))
                # write to file
                edge_hash = "edg%s" % uuid.uuid4().hex
                str_to_write += export_edgedata_to_json(edge_hash, edge_point_set)
                # create the file
                edge_full_path = os.path.join(self._path, edge_hash + '.json')
                with open(edge_full_path, "w") as edge_file:
                    edge_file.write(str_to_write)
                # store this edge hash, with black color
                self._3js_edges[edge_hash] = [(0, 0, 0), line_width]
        return self._3js_shapes, self._3js_edges


    def generate_html_file(self):
        """ Generate the HTML file to be rendered by the web browser
        """
        global BODY_PART0
        # loop over shapes to generate html shapes stuff
        # the following line is a list that will help generating the string
        # using "".join()
        shape_string_list = []
        shape_string_list.append("loader = new THREE.BufferGeometryLoader();\n")
        shape_idx = 0
        for shape_hash in self._3js_shapes:
            # get properties for this shape
            export_edges, color, specular_color, shininess, transparency, line_color, line_width = self._3js_shapes[shape_hash]
            # creates a material for the shape
            shape_string_list.append('\t\t\t%s_phong_material = new THREE.MeshPhongMaterial({' % shape_hash)
            shape_string_list.append('color:%s,' % color_to_hex(color))
            shape_string_list.append('specular:%s,' % color_to_hex(specular_color))
            shape_string_list.append('shininess:%g,' % shininess)
            # force double side rendering, see issue #645
            shape_string_list.append('side: THREE.DoubleSide,')
            if transparency > 0.:
                shape_string_list.append('transparent: true, premultipliedAlpha: true, opacity:%g,' % transparency)
            #var line_material = new THREE.LineBasicMaterial({color: 0x000000, linewidth: 2});
            shape_string_list.append('});\n')
            # load json geometry files
            shape_string_list.append("\t\t\tloader.load('%s.json', function(geometry) {\n" % shape_hash)
            shape_string_list.append("\t\t\t\tmesh = new THREE.Mesh(geometry, %s_phong_material);\n" % shape_hash)
            # enable shadows for object
            shape_string_list.append("\t\t\t\tmesh.castShadow = true;\n")
            shape_string_list.append("\t\t\t\tmesh.receiveShadow = true;\n")
            # add mesh to scene
            shape_string_list.append("\t\t\t\tscene.add(mesh);\n")
            # last shape, we request for a fit_to_scene
            if shape_idx == len(self._3js_shapes) - 1:
                shape_string_list.append("\tfit_to_scene();});\n")
            else:
                shape_string_list.append("\t\t\t});\n\n")
            shape_idx += 1
        # Process edges
        edge_string_list = []
        for edge_hash in self._3js_edges:
            color, line_width = self._3js_edges[edge_hash]
            edge_string_list.append("\tloader.load('%s.json', function(geometry) {\n" % edge_hash)
            edge_string_list.append("\tline_material = new THREE.LineBasicMaterial({color: %s, linewidth: %s});\n" % ((color_to_hex(color), line_width)))
            edge_string_list.append("\tline = new THREE.Line(geometry, line_material);\n")
        # add mesh to scene
            edge_string_list.append("\tscene.add(line);\n")
            edge_string_list.append("\t});\n")
        # write the string for the shape
        with open(self._html_filename, "w") as fp:
            fp.write("<!DOCTYPE HTML>\n")
            fp.write("<html lang='en'>")
            # header
            fp.write(HTMLHeader().get_str())
            # body
            BODY_PART0 = BODY_PART0.replace('@VERSION@', OCC_VERSION)
            fp.write(BODY_PART0)
            fp.write(HTMLBody_Part1().get_str())
            fp.write("".join(shape_string_list))
            fp.write("".join(edge_string_list))
            # then write header part 2
            fp.write(BODY_PART2)
            fp.write("</html>\n")

    def render(self, addr="localhost", server_port=8080, open_webbrowser=False):
        ''' render the scene into the browser.
        '''
        # generate HTML file
        self.generate_html_file()
        # then create a simple web server
        start_server(addr, server_port, self._path, open_webbrowser)

if __name__ == "__main__":
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
    my_ren = ThreejsRenderer()
    init_time = time.time()
    my_ren.DisplayShape(box, export_edges=True)
    my_ren.DisplayShape(t_torus, export_edges=True)
    final_time = time.time()
    print("\nTotal meshing time : ", final_time - init_time)
    my_ren.render()
