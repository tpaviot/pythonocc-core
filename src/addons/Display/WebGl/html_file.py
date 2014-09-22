##Copyright 2011-2013 Thomas Paviot (tpaviot@gmail.com)
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
import OCC

HEADER = """
<head>
    <title>pythonOCC @VERSION@ webgl renderer</title>
    <meta name='Author' content='Thomas Paviot - tpaviot@gmail.com'>
    <meta name='Keywords' content='WebGl,pythonOCC'>
    <meta charset="utf-8">
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
    <div id="container"></div>
    <div id="info">
                WebGL engine by <a href="http://github.com/mrdoob/three.js" target="_blank">three.js</a>
    </div>
    <div id="pythonocc_rocks">
        <b>pythonOCC @VERSION@ WebGL renderer</b><hr>
        CAD in a browser
        <a style="font-size:14px;" href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>

    <script type="text/javascript" src="@Three.jsPath@/three.min.js"></script>
    <script type="text/javascript" src="@Three.jsPath@/OrbitControls.js"></script>
    <script type="text/javascript" src="@Three.jsPath@/stats.min.js"></script>
    @VertexShaderDefinition@
    @FragmentShaderDefinition@
    <script type="text/javascript" src="./shape.js"></script>
    <script type="text/javascript">
        var camera, scene, renderer, object, stats, container, shape_material;
        var targetRotation = 0;
        var targetRotationOnMouseDown = 0;
        var targetRotationY = 0;
        var targetRotationYOnMouseDown = 0;
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

        init();
        animate();

        function init() {
            container = document.createElement( 'div' );
            document.body.appendChild( container );

            camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 200 );
            camera.position.z = 100;
            controls = new THREE.OrbitControls( camera );
            scene = new THREE.Scene();
            scene.add( new THREE.AmbientLight(0x101010));
            directionalLight = new THREE.DirectionalLight( 0xffffff );
            directionalLight.position.x = 1;
            directionalLight.position.y = 1;
            directionalLight.position.z = 2;
            directionalLight.position.normalize();
            scene.add( directionalLight );
            light1 = new THREE.PointLight( 0xffffff );
            scene.add( light1 );
            @ShaderMaterialDefinition@
            phong_material = new THREE.MeshPhongMaterial( { ambient: 0x000000, color: 0xffaa00, specular: 0x555555, shininess: 30 } )
            object = new THREE.Mesh( new Shape(), @ShapeMaterial@);
            object.overdraw = true;
            object.rotation.x = -1.57/2;
            scene.add( object );
            renderer = new THREE.WebGLRenderer({antialias:true});
            renderer.setClearColor("@background-color@");
            renderer.setSize( window.innerWidth, window.innerHeight );
            container.appendChild( renderer.domElement );

            renderer.shadowMapEnabled = true;
            renderer.shadowMapType = THREE.PCFShadowMap;

            stats = new Stats();
            stats.domElement.style.position = 'absolute';
            stats.domElement.style.top = '0px';
            container.appendChild( stats.domElement );
            window.addEventListener( 'resize', onWindowResize, false );
        }
        function animate() {
                requestAnimationFrame( animate );
                controls.update();
                render();
                stats.update();

        }
        function render() {
               renderer.render( scene, camera );
        }
        function onWindowResize() {
            camera.aspect = window.innerWidth / window.innerHeight;
            camera.updateProjectionMatrix();
            renderer.setSize( window.innerWidth, window.innerHeight );
        }
    </script>
</body>
"""


class HTMLHeader(object):
    def __init__(self, background_color='#000000'):
        self._background_color = background_color

    def get_str(self):
        header_str = HEADER.replace('@background-color@', '%s' % self._background_color)
        header_str = header_str.replace('@VERSION@', OCC.VERSION)
        return header_str


class HTMLBody(object):
    def __init__(self, background_color='#000000', vertex_shader=None, fragment_shader=None):
        self._background_color = background_color
        self._vertex_shader = vertex_shader
        self._fragment_shader = fragment_shader

    def get_str(self):
        # get the location where pythonocc is running from
        threejs_build_location = os.sep.join([OCC.__path__[0], 'Display', 'WebGl'])
        body_str = BODY.replace('@Three.jsPath@', '%s' % threejs_build_location)
        body_str = body_str.replace('@background-color@', '%s' % self._background_color)
        body_str = body_str.replace('@VERSION@', OCC.VERSION)
        if (self._fragment_shader is not None) and (self._fragment_shader is not None):
            vertex_shader_string_definition = '<script type="x-shader/x-vertex" id="vertexShader">%s</script>' % self._vertex_shader
            fragment_shader_string_definition = '<script type="x-shader/x-fragment" id="fragmentShader">%s</script>' % self._fragment_shader
            shader_material_definition = """
            var vertexShader = document.getElementById( 'vertexShader' ).textContent;
            var fragmentShader = document.getElementById( 'fragmentShader' ).textContent;
            var shader_material = new THREE.ShaderMaterial( { uniforms: {}, vertexShader: vertexShader, fragmentShader: fragmentShader } );
            """
            body_str = body_str.replace('@VertexShaderDefinition@', vertex_shader_string_definition)
            body_str = body_str.replace('@FragmentShaderDefinition@', fragment_shader_string_definition)
            body_str = body_str.replace('@ShaderMaterialDefinition@', shader_material_definition)
            body_str = body_str.replace('@ShapeMaterial@', 'shader_material')
        else:
            body_str = body_str.replace('@VertexShaderDefinition@', '')
            body_str = body_str.replace('@FragmentShaderDefinition@', '')
            body_str = body_str.replace('@ShaderMaterialDefinition@', '')
            body_str = body_str.replace('@ShapeMaterial@', 'phong_material')
        return body_str

