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
	<meta name='Description' content='Cylinder head visualization using WebGL and pythonOCC'>
	<meta name='Keywords' content='WebGl,pythonOCC, cylinder, head, CAD'>
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
			height: 75px;
			width: 355px;
			border-radius: 5px;
			border: 2px solid #f7941e;
			opacity: 0.7;
			font-family: Arial;
			background-color: #414042;
			color: #ffffff;
			font-size: 20px;
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
    	<b>pythonOCC @VERSION@ WebGL renderer</b>
    	towards CAD in a webbrowser
    	<a style="font-size:15px;" href=http://www.pythonocc.org>http://www.pythonocc.org</a>
    </div>

	<script type="text/javascript" src="@Three.jsPath@"></script> 
	<script type="text/javascript" src="./shape.js"></script>

	<script type="text/javascript">
	    var camera, scene, renderer, object;
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
		setInterval( loop, 1000 / 60 );

		function init() {
			var container = document.getElementById( 'container' );
			camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 2000 );
			camera.position.z = 1000;
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
			object = new THREE.Mesh( new Shape(), new THREE.MeshPhongMaterial( { ambient: 0x000000, color: 0xffaa00, specular: 0x555555, shininess: 30 } ));
			object.overdraw = true;
			object.scale.x = object.scale.y = object.scale.z = 3.5;
			object.rotation.x = -1.57/2;
			object.position.y -= 100;
			targetRotationY = -1.57/2;
			scene.add( object );
			renderer = new THREE.WebGLRenderer({antialias:true});
			renderer.setSize( window.innerWidth, window.innerHeight );
			container.appendChild( renderer.domElement );
			document.addEventListener( 'mousedown', onDocumentMouseDown, false );
		}
		
		function onDocumentMouseDown( event ) {
						event.preventDefault();
						document.addEventListener( 'mousemove', onDocumentMouseMove, false );
						document.addEventListener( 'mouseup', onDocumentMouseUp, false );
						document.addEventListener( 'mouseout', onDocumentMouseOut, false );
						document.addEventListener( 'keydown', onDocumentKeyDown, false );
						document.addEventListener( 'keyup', onDocumentKeyUp, false );
						mouseXOnMouseDown = event.clientX - windowHalfX;
						mouseYOnMouseDown = event.clientY - windowHalfY;
						targetRotationOnMouseDown = targetRotation;
					}

					function onDocumentMouseMove( event ) {
						mouseX = event.clientX - windowHalfX;
						mouseY = event.clientY - windowHalfY;
						targetRotation = targetRotationOnMouseDown + ( mouseX - mouseXOnMouseDown ) * 0.01;
						targetRotationY = targetRotationYOnMouseDown + ( mouseY - mouseYOnMouseDown ) * 0.01;
					}

					function onDocumentMouseUp( event ) {
						document.removeEventListener( 'mousemove', onDocumentMouseMove, false );
						document.removeEventListener( 'mouseup', onDocumentMouseUp, false );
						document.removeEventListener( 'mouseout', onDocumentMouseOut, false );
					}

					function onDocumentMouseOut( event ) {
						document.removeEventListener( 'mousemove', onDocumentMouseMove, false );
						document.removeEventListener( 'mouseup', onDocumentMouseUp, false );
						document.removeEventListener( 'mouseout', onDocumentMouseOut, false );
					}
					
					function onDocumentKeyDown( event ) {
						switch( event.keyCode ) {
							case 87: /*W*/ moveForward = true; break;
							case 37: /*left*/
							case 65: /*A*/ moveLeft = true; break;
							case 83: /*S*/ moveBackward = true; break;
							case 39: /*right*/
							case 68: /*D*/ moveRight = true; break;
							case 38: /*up*/ moveUp = true; break;
							case 40: /*down*/ moveDown = true; break;
						}

					}

					function onDocumentKeyUp(event) {
						switch(event.keyCode) {
							case 87: /*W*/ moveForward = false; break;
							case 37: /*left*/
							case 65: /*A*/ moveLeft = false; break;
							case 83: /*S*/ moveBackward = false; break;
							case 39: /*right*/
							case 68: /*D*/ moveRight = false; break;
							case 38: /*up*/ moveUp = false; break;	
							case 40: /*down*/ moveDown = false; break;
						}
					}

		function loop() {
			var time = new Date().getTime() * 0.0005;
			object.rotation.y += ( targetRotation - object.rotation.y )*0.1;
			object.rotation.x += ( targetRotationY - object.rotation.x )*0.1;
			if (moveForward) camera.translateZ(-10);
			if (moveBackward) camera.translateZ(10);
			if (moveUp) camera.translateY(-10);
			if (moveDown) camera.translateY(10);
			if (moveLeft) camera.translateX(10);
			if (moveRight) camera.translateX(-10);	
			renderer.render(scene, camera);
		}
	</script>
</body>
"""


class HTMLHeader:
    def __init__(self, background_color='#000000'):
        self._background_color = background_color

    def get_str(self):
        header_str = HEADER.replace('@background-color@','%s'%self._background_color)
        header_str = header_str.replace('@VERSION@',OCC.VERSION)
        return header_str


class HTMLBody:
    def __init__(self):
        pass

    def get_str(self):
        # get the location where pythonocc is running from
        import OCC
        threejs_build_location = os.sep.join([OCC.__path__[0],'Display','WebGl','three.min.js'])
        body_str = BODY.replace('@Three.jsPath@','%s'%threejs_build_location)
        body_str = body_str.replace('@VERSION@',OCC.VERSION)
        return body_str

