#!/usr/bin/python

##Copyright 2010-2014 Thomas Paviot (tpaviot@gmail.com)
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

from __future__ import print_function

import unittest
import os

from OCC.Display.WebGl import threejs_renderer, x3dom_renderer
from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeBox


class TestWebGL(unittest.TestCase):
    def test_threejs_render_torus(self):
        '''Test: point from curve'''
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_renderer = threejs_renderer.ThreejsRenderer(background_color="#123345")
        js_file, html_file = my_renderer.create_files(torus_shp)
        assert os.path.isfile(js_file)
        assert os.path.isfile(html_file)

    def test_three_jsshaders(self):
        '''Test: point from curve'''
        torus_shp = BRepPrimAPI_MakeBox(20., 10., 30.).Shape()
        vertex_shader = """
            attribute vec3 center;
            varying vec3 vCenter;
            void main() {
                vCenter = center;
                gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
            }
        """
        fragment_shader = """
            #extension GL_OES_standard_derivatives : enable
            varying vec3 vCenter;
            float edgeFactorTri() {
                vec3 d = fwidth( vCenter.xyz );
                vec3 a3 = smoothstep( vec3( 0.0 ), d * 1.5, vCenter.xyz );
                return min( min( a3.x, a3.y ), a3.z );
            }
            void main() {
                gl_FragColor.rgb = mix( vec3( 1.0 ), vec3( 0.2 ), edgeFactorTri() );
                gl_FragColor.a = 1.0;
            }
            """
        my_renderer = threejs_renderer.ThreejsRenderer("#123345", vertex_shader, fragment_shader, path="./test_io")
        js_file, html_file = my_renderer.create_files(torus_shp)
        assert os.path.isfile(js_file)
        assert os.path.isfile(html_file)

    def test_x3dom_render_torus(self):
        '''Test: point from curve'''
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_renderer = x3dom_renderer.X3DomRenderer(path="./test_io")
        x3d_file, html_file = my_renderer.create_files(torus_shp)
        assert os.path.isfile(x3d_file)
        assert os.path.isfile(html_file)


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestWebGL))
    return suite

if __name__ == "__main__":
    unittest.main()
