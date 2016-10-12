#!/usr/bin/python

##Copyright 2010-2016 Thomas Paviot (tpaviot@gmail.com)
#6
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

import unittest
import random
import os

from OCC.Display.WebGl import threejs_renderer, x3dom_renderer
from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeBox


class TestWebGL(unittest.TestCase):
    def test_threejs_render_torus(self):
        """ Render a simple torus in threejs
        """
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_threejs_renderer = threejs_renderer.ThreejsRenderer()
        my_threejs_renderer.DisplayShape(torus_shp)

    def test_threejs_random_boxes(self):
        """ Test: threejs 10 random boxes
        """
        my_threejs_renderer = threejs_renderer.ThreejsRenderer()
        for i in range(10):
            box_shp = BRepPrimAPI_MakeBox(random.random()*20, random.random()*20, random.random()*20).Shape()
            rnd_color = (random.random(), random.random(), random.random())
            rnd_export_edges = bool(random.random() > 0.5)
            my_threejs_renderer.DisplayShape(box_shp, export_edges=True, color=rnd_color, transparency=random.random())
    
    def test_x3dom_random_mesh_quality(self):
        """ Test: threejs 10 random boxes
        """
        my_threejs_renderer = threejs_renderer.ThreejsRenderer()
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_threejs_renderer.DisplayShape(torus_shp, mesh_quality=1.0)
        my_threejs_renderer.DisplayShape(torus_shp, mesh_quality=0.8)
        my_threejs_renderer.DisplayShape(torus_shp, mesh_quality=2.0)

    def test_x3dom_render_torus(self):
        """ Render a simple torus using x3dom
        """
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
        my_x3dom_renderer.DisplayShape(torus_shp)

    def test_x3dom_random_boxes(self):
        """ Test: threejs 10 random boxes
        """
        my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
        for i in range(10):
            box_shp = BRepPrimAPI_MakeBox(random.random()*20, random.random()*20, random.random()*20).Shape()
            rnd_color = (random.random(), random.random(), random.random())
            rnd_export_edges = bool(random.random() > 0.5)
            my_x3dom_renderer.DisplayShape(box_shp, export_edges=True, color=rnd_color, transparency=random.random())
   
    def test_x3dom_random_mesh_quality(self):
        """ Test: threejs 10 random boxes
        """
        my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
        torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
        my_x3dom_renderer.DisplayShape(torus_shp, mesh_quality=1.0)
        my_x3dom_renderer.DisplayShape(torus_shp, mesh_quality=0.8)
        my_x3dom_renderer.DisplayShape(torus_shp, mesh_quality=2.0)
     
def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestWebGL))
    return suite

if __name__ == "__main__":
    unittest.main()
