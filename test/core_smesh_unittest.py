#!/usr/bin/env python

##Copyright 2009-2013 Thomas Paviot (tpaviot@gmail.com)
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
import time
import sys

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeTorus
from OCC.StdMeshers import (StdMeshers_TrianglePreference,
                            StdMeshers_AutomaticLength,
                            StdMeshers_Regular_1D,
                            StdMeshers_QuadranglePreference,
                            StdMeshers_Quadrangle_2D,
                            StdMeshers_Arithmetic1D)
from OCC.SMESH import SMESH_Gen


class TestSMESH(unittest.TestCase):
    def test_create_simple_mesh(self):
        meshgen = SMESH_Gen()
        print(dir(meshgen))
        mesh = meshgen.CreateMesh(0, True)
        assert(mesh.GetId() == 0)

    def test_create_two_meshes(self):
        meshgen = SMESH_Gen()
        mesh1 = meshgen.CreateMesh(0, True)
        mesh2 = meshgen.CreateMesh(1, True)
        assert(mesh1.GetId() == 0)
        assert(mesh2.GetId() == 1)

    def test_create_simple_mesh_not_embedded_mode(self):
        meshgen = SMESH_Gen()
        mesh = meshgen.CreateMesh(0, False)
        assert(mesh.GetId() == 0)

    def test_create_mesh_default_segments(self):
        meshgen = SMESH_Gen()
        meshgen.SetDefaultNbSegments(300)
        assert(meshgen.GetDefaultNbSegments() == 300)

    def test_mesh_box(self):
        # create a box, mixing integers and floats
        my_box = BRepPrimAPI_MakeBox(10., 10., 10.)
        my_box.Build()
        assert(my_box.IsDone())
        # create the Mesh
        meshgen = SMESH_Gen()
        mesh = meshgen.CreateMesh(0, True)
        # set geometry to be meshed
        mesh.ShapeToMesh(my_box.Shape())
        assert(mesh.HasShapeToMesh())
        # check bounding box. It should be 10.sqrt(3)==17.32050807568877
        diagonal_size = mesh.GetShapeDiagonalSize(mesh.GetShapeToMesh())
        assert(diagonal_size > 17.320508)
        assert(diagonal_size < 17.320509)
        # create and add hypothesis
        hyp1d = StdMeshers_AutomaticLength(0, 0, meshgen)
        hyp2d = StdMeshers_TrianglePreference(1, 0, meshgen)
        mesh.AddHypothesis(mesh.GetShapeToMesh(), 0)
        mesh.AddHypothesis(mesh.GetShapeToMesh(), 1)
        # compute the mesh
        meshgen.Compute(mesh, mesh.GetShapeToMesh())

    def test_mesh_torus(self):
        aShape = BRepPrimAPI_MakeTorus(400, 80).Shape()
        aMeshGen = SMESH_Gen()
        aMesh = aMeshGen.CreateMesh(0, True)
        an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)
        an1DHypothesis.SetLength(1., False)
        an1DHypothesis.SetLength(5., True)
        an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen)
        a2dHypothseis = StdMeshers_QuadranglePreference(2, 0, aMeshGen)
        a2dAlgo = StdMeshers_Quadrangle_2D(3, 0, aMeshGen)
        #Calculate mesh
        aMesh.ShapeToMesh(aShape)
        #Assign hyptothesis to mesh
        aMesh.AddHypothesis(aShape, 0)
        aMesh.AddHypothesis(aShape, 1)
        aMesh.AddHypothesis(aShape, 2)
        aMesh.AddHypothesis(aShape, 3)
        #Compute the data
        aMeshGen.Compute(aMesh, aMesh.GetShapeToMesh())
        # test exporters
        aMesh.ExportDAT("export_dat.dat")
        aMesh.ExportSTL("export_stl.stl", True)  # True if ascii
        aMesh.ExportUNV("export_unv.unv")


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestSMESH))
    return suite

if __name__ == "__main__":
    unittest.main()
