##Copyright 2009-2014 Thomas Paviot (tpaviot@gmail.com)
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

# This is a simple port of Fotis'code to python
# see: http://www.opencascade.org/org/forum/thread_14890/

from OCC.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.SMESH import SMESH_Gen, SMESH_MeshVSLink
from OCC.StdMeshers import (StdMeshers_Arithmetic1D,
                            StdMeshers_QuadranglePreference,
                            StdMeshers_Regular_1D,
                            StdMeshers_Quadrangle_2D)
from OCC.MeshVS import MeshVS_MeshPrsBuilder, MeshVS_Mesh

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()

# create the shape to mesh
aShape = BRepPrimAPI_MakeTorus(400, 80).Shape()

# create mesh
aMeshGen = SMESH_Gen()
aMesh = aMeshGen.CreateMesh(0, True)

# create hypotheses
an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)
an1DHypothesis.SetLength(1., False)
an1DHypothesis.SetLength(5., True)
an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen)

a2dHypothseis = StdMeshers_QuadranglePreference(2, 0, aMeshGen)
a2dAlgo = StdMeshers_Quadrangle_2D(3, 0, aMeshGen)

# set shape to mesh
aMesh.ShapeToMesh(aShape)

# assign hyptothesis to mesh
aMesh.AddHypothesis(aShape, 0)
aMesh.AddHypothesis(aShape, 1)
aMesh.AddHypothesis(aShape, 2)
aMesh.AddHypothesis(aShape, 3)

#Compute the mesh
aMeshGen.Compute(aMesh, aMesh.GetShapeToMesh())

# Display the data
aDS = SMESH_MeshVSLink(aMesh)
aMeshVS = MeshVS_Mesh(True)
DMF = 1  # to wrap!
MeshVS_BP_Mesh = 5  # To wrap!

aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(),
                                    DMF,
                                    aDS.GetHandle(),
                                    0,
                                    MeshVS_BP_Mesh)
aMeshVS.SetDataSource(aDS.GetHandle())
aMeshVS.AddBuilder(aPrsBuilder.GetHandle(), True)

# display both shape and mesh
context = display.Context
context.Display(aMeshVS.GetHandle())
context.Deactivate(aMeshVS.GetHandle())
display.DisplayShape(aShape)
start_display()
