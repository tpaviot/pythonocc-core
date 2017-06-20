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
import uuid

from OCC.gp import gp_Vec
from OCC.Visualization import Tesselator
from OCC import VERSION as OCC_VERSION

from .simple_server import start_server

def color_to_hex(rgb_color):
    """ Takes a tuple with 3 floats between 0 and 1.
    Returns a hex. Useful to convert occ colors to web color code
    """
    r, g, b = rgb_color
    assert 0 <= r <= 1.
    assert 0 <= g <= 1.
    assert 0 <= b <= 1.
    rh = int(r * 255.)
    gh = int(g * 255.)
    bh = int(b * 255.)
    return "0x%.02x%.02x%.02x" %(rh, gh,bh)

def ExportEdgeToJSON(edge_hash, point_set):
    """ Export a set of points to a LineSegment buffergeometry
    """
    edge_uuid = uuid.uuid4()
    nbr_of_points = len(point_set)
    json_string = '{\n\t"metadata": {\n\t\t"version": 4.4,\n'
    json_string += '\t\t"type": "BufferGeometry",\n\t\t"generator": "pythonOCC"\n\t},\n'
    json_string += '\t"uuid": "%s",\n' % edge_uuid
    json_string += '\t"type": "BufferGeometry",\n'
    json_string += '\t"data": {\n\t\t"attributes": {\n'
    json_string += '\t\t\t"position": {\n'
    json_string += '\t\t\t\t"itemSize": 3,\n'
    json_string += '\t\t\t\t"type": "Float32Array",\n'
    json_string += '\t\t\t\t"array": ['
    for point_index in range(nbr_of_points - 1):
        fp_x = point_set[point_index][0]
        fp_y = point_set[point_index][1]
        fp_z = point_set[point_index][2]
        sp_x = point_set[point_index + 1][0]
        sp_y = point_set[point_index + 1][1]
        sp_z = point_set[point_index + 1][2]
        if point_index <= nbr_of_points - 3:
            json_string += "%s, %s, %s, %s, %s, %s," % (fp_x, fp_y, fp_z, sp_x, sp_y, sp_z)
        else:
            json_string += "%s, %s, %s, %s, %s, %s]\n" % (fp_x, fp_y, fp_z, sp_x, sp_y, sp_z)
        # careful, json doesn't like the last comma
    # so we write the 
    json_string += '\t\t\t}\n'
    json_string += '\t\t}\n'
    json_string += '\t}\n'
    json_string += '}\n'
    return json_string


HEADER = """
<head>
    <title>pythonOCC @VERSION@ webgl renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonOCC'>
    <meta charset="utf-8">
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
            top: 88%;
            height: 60px;
            width: 305px;
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
BODY_Part0 = """
<body>
    <div id="container"></div>
    <div id="pythonocc_rocks">
        Commands: <b>t</b> toggle visibility
        <hr>
        pythonocc-@VERSION@ <a href="https://github.com/mrdoob/three.js" target="_blank">three.js</a> renderer
        <br>Check our blog at
        <a href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>

    <script type="text/javascript" src="https://cdn.rawgit.com/mrdoob/three.js/r85/build/three.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/mrdoob/three.js/r85/examples/js/controls/OrbitControls.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/mrdoob/three.js/r85/examples/js/libs/stats.min.js"></script>

"""

BODY_Part1 = """

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
            controls = new THREE.OrbitControls(camera);
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
BODY_Part2 = """
            renderer = new THREE.WebGLRenderer({antialias:true, alpha: true});
            renderer.setSize( window.innerWidth, window.innerHeight);
            container.appendChild(renderer.domElement);
            // for shadow rendering
            renderer.shadowMap.enabled = true;
            renderer.shadowMap.type = THREE.PCFShadowMap;
            // show stats, is it really useful ?
            stats = new Stats();
            stats.domElement.style.position = 'absolute';
            stats.domElement.style.top = '0px';
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
            // performe selection
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
                center.divideScalar(radiuses.length);
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
        }
        function render() {
            //@IncrementTime@  TODO UNCOMMENT
            update_lights();
            renderer.render(scene, camera);
        }
    </script>
</body>
"""


class HTMLHeader(object):
    def __init__(self, bg_gradient_color1="#ced7de", bg_gradient_color2="#808080"):
        self._bg_gradient_color1 = bg_gradient_color1
        self._bg_gradient_color2 = bg_gradient_color2

    def get_str(self):
        header_str = HEADER.replace('@bg_gradient_color1@', '%s' % self._bg_gradient_color1)
        header_str = header_str.replace('@bg_gradient_color2@', '%s' % self._bg_gradient_color2)
        header_str = header_str.replace('@VERSION@', OCC_VERSION)
        return header_str


class HTMLBody_Part1(object):
    def __init__(self, vertex_shader=None, fragment_shader=None, uniforms=None):
        self._vertex_shader = vertex_shader
        self._fragment_shader = fragment_shader
        self._uniforms = uniforms

    def get_str(self):
        global BODY_Part2
        # get the location where pythonocc is running from
        body_str = BODY_Part1.replace('@VERSION@', OCC_VERSION)
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
                BODY_Part2 = BODY_Part2.replace('@IncrementTime@', '')
            else:
                body_str = body_str.replace('@Uniforms@', self._uniforms)
                if 'time' in self._uniforms:
                    BODY_Part2 = BODY_Part2.replace('@IncrementTime@', 'uniforms.time.value += 0.05;')
                else:
                    BODY_Part2 = BODY_Part2.replace('@IncrementTime@', '')
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


class ThreejsRenderer(object):
    def __init__(self, path=None):
        if not path:
            self._path = tempfile.mkdtemp()
        else:
            self._path = path
        self._html_filename = os.path.join(self._path, "index.html")
        self._3js_shapes = {}
        self._edges_hash = []

    def DisplayShape(self,
                     shape,
                     vertex_shader=None,
                     fragment_shader=None,
                     map_faces_to_mesh=False,
                     export_edges=False,
                     color=(0.65, 0.65, 0.65),
                     specular_color=(1, 1, 1),
                     shininess=0.9,
                     transparency=0.,
                     line_color=(0, 0., 0.),
                     line_width=2.,
                     mesh_quality=1.):
        # create the shape hash
        shape_uuid = uuid.uuid4().hex
        shape_hash = "shp%s" % shape_uuid
        # tesselate
        tess = Tesselator(shape)
        tess.Compute(compute_edges=export_edges, mesh_quality=mesh_quality)
        print("Number of triangles: %i" % tess.ObjGetTriangleCount())
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
        edges = []
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
                str_to_write += ExportEdgeToJSON(edge_hash, edge_point_set)
                # create the file
                edge_full_path = os.path.join(self._path, edge_hash + '.json')
                with open(edge_full_path, "w") as edge_file:
                    edge_file.write(str_to_write)
                # store this edge hash
                self._edges_hash.append(edge_hash)

    def GenerateHTMLFile(self):
        """ Generate the HTML file to be rendered by the web browser
        """
        global BODY_Part0
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
            shape_string_list.append('\t%s_phong_material = new THREE.MeshPhongMaterial({' % shape_hash)
            shape_string_list.append('color:%s,' % color_to_hex(color))
            shape_string_list.append('specular:%s,' % color_to_hex(specular_color))
            shape_string_list.append('shininess:%g,' % shininess)
            if transparency > 0.:
                shape_string_list.append('transparent: true, premultipliedAlpha: true, opacity:%g,' % transparency)
            #var line_material = new THREE.LineBasicMaterial({color: 0x000000, linewidth: 2});
            shape_string_list.append('});\n')
            # load json geometry files
            shape_string_list.append("\tloader.load('%s.json', function(geometry) {\n" % shape_hash)
            shape_string_list.append("\tmesh = new THREE.Mesh(geometry, %s_phong_material);\n" % shape_hash)
            # add mesh to scene
            shape_string_list.append("\tscene.add(mesh);\n")
            # last shape, we request for a fit_to_scene
            if shape_idx == len(self._3js_shapes) - 1:
                shape_string_list.append("\tfit_to_scene();});\n")
            else:
                shape_string_list.append("\t});\n")
            shape_idx += 1
        # Process edges
        edge_string_list = []
        for edge_id in self._edges_hash:
            edge_string_list.append("\tloader.load('%s.json', function(geometry) {\n" % edge_id)
            edge_string_list.append("\tline_material = new THREE.LineBasicMaterial({color: 0x000000, linewidth: 2});\n")
            edge_string_list.append("\tline = new THREE.LineSegments(geometry, line_material);\n")
        # add mesh to scene
            edge_string_list.append("\tscene.add(line);\n")
            edge_string_list.append("\t});\n")
        # write the string for the shape
        with open(self._html_filename, "w") as fp:
            fp.write("<!DOCTYPE HTML>")
            fp.write('<html>')
            # header
            fp.write(HTMLHeader().get_str())
            # body
            BODY_Part0 = BODY_Part0.replace('@VERSION@', OCC_VERSION)
            fp.write(BODY_Part0)
            fp.write(HTMLBody_Part1().get_str())
            fp.write("".join(shape_string_list))
            fp.write("".join(edge_string_list))
            # then write header part 2
            fp.write(BODY_Part2)
            fp.write("</html>\n")
        print("File written to %s" % self._html_filename)

    def render(self, server_port=8080):
        ''' render the scene into the browser.
        '''
        # log path
        print("Files written to %s" % self._path)
        # generate HTML file
        self.GenerateHTMLFile()
        # then create a simple web server
        os.chdir(self._path)
        print("## Serving at port", server_port, "using SimpleHTTPServer")
        print("## Open your webbrowser at the URL: http://localhost:%i" % server_port)
        print("## CTRL-C to shutdown the server")
        start_server(server_port)

if __name__ == "__main__":
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
    box = BRepPrimAPI_MakeBox(1., 2., 3.).Shape()
    my_ren = ThreejsRenderer()
    my_ren.DisplayShape(box)
    my_ren.render()
