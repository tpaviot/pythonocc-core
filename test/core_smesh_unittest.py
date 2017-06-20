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
import os

from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere

from OCC.SMESH import SMESH_Gen, SMESH_MeshVSLink
from OCC.StdMeshers import (StdMeshers_Arithmetic1D, StdMeshers_TrianglePreference,
                            StdMeshers_Regular_1D, StdMeshers_Quadrangle_2D)

class TestSMESH(unittest.TestCase):
    def test_mesh_sphere_quadrangle(self):
        aShape = BRepPrimAPI_MakeSphere(10.).Shape()
        # Create the Mesh
        aMeshGen = SMESH_Gen()
        aMesh = aMeshGen.CreateMesh(0, True)
        # 1D
        an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)#discretization of the wire
        an1DHypothesis.SetLength(0.1, False) #the smallest distance between 2 points
        an1DHypothesis.SetLength(0.5, True) # the longest distance between 2 points
        an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen) # interpolation
        # 2D
        a2dHypothseis = StdMeshers_TrianglePreference(2, 0, aMeshGen) #define the boundary
        a2dAlgo = StdMeshers_Quadrangle_2D(3, 0, aMeshGen) # the 2D mesh
        #Calculate mesh
        aMesh.ShapeToMesh(aShape)
        #Assign hyptothesis to mesh
        aMesh.AddHypothesis(aShape, 0)
        aMesh.AddHypothesis(aShape, 1)
        aMesh.AddHypothesis(aShape, 2)
        aMesh.AddHypothesis(aShape, 3)
        #Compute the data
        aMeshGen.Compute(aMesh, aMesh.GetShapeToMesh())


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestSMESH))
    return suite

if __name__ == "__main__":
    unittest.main()
