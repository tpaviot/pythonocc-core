##Copyright 2010-2017 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.SMESH import SMESH_Gen
from OCC.StdMeshers import (StdMeshers_Arithmetic1D, StdMeshers_Regular_1D,
                            StdMeshers_TrianglePreference, StdMeshers_MEFISTO_2D,
                            StdMeshers_QuadranglePreference, StdMeshers_Quadrangle_2D)

#Create the shape to mesh

aShape = BRepPrimAPI_MakeBox(10, 20, 40).Shape()

aMeshGen = SMESH_Gen()
aMesh = aMeshGen.CreateMesh(0, True)

def ComputeMesh(MEFISTO2=False):
    an1DHypothesis = StdMeshers_Arithmetic1D(0,0,aMeshGen)
    #print dir(an1DHypothesis)
    #print an1DHypothesis.SaveTo()
    
    an1DHypothesis.SetLength(1.,False)
    an1DHypothesis.SetLength(2.,True)
    an1DAlgo = StdMeshers_Regular_1D(1,0,aMeshGen)
    
    if MEFISTO2:
    #2D
        a2dHypothseis = StdMeshers_TrianglePreference(2,0,aMeshGen) #define the boundary
        a2dAlgo = StdMeshers_MEFISTO_2D(3,0,aMeshGen)
    else:
        a2dHypothseis = StdMeshers_QuadranglePreference(2,0,aMeshGen)
        a2dAlgo = StdMeshers_Quadrangle_2D(3,0,aMeshGen)
 
   
    #Calculate mesh
    aMesh.ShapeToMesh(aShape)
    
    #Assign hyptothesis to mesh
    aMesh.AddHypothesis(aShape,0)
    aMesh.AddHypothesis(aShape,1)
    aMesh.AddHypothesis(aShape,2)
    aMesh.AddHypothesis(aShape,3)
    
    #Compute the data
    aMeshGen.Compute(aMesh,aMesh.GetShapeToMesh())

ComputeMesh()
# Traverse mesh nodes, edges and faces
# Get the SMESHDS mesh
mesh_ds = aMesh.GetMeshDS()

print("Results:")
print("Nb Nodes", aMesh.NbNodes())
print("Nb Edges", aMesh.NbEdges())
print("Nb Faces", aMesh.NbFaces())

node_iter = mesh_ds.nodesIterator()
for i in range(mesh_ds.NbNodes()-1):
    node = node_iter.next()
    assert node is not None
    print('Coordinates of node %i:(%f,%f,%f)'%(i, node.X(), node.Y(), node.Z()))

edge_iter = mesh_ds.edgesIterator()
for i in range(mesh_ds.NbEdges()-1):
    edge = edge_iter.next()
    assert edge is not None
    print('Edge %i: connected to %i nodes, shared between %i faces'%(i,edge.NbNodes(),edge.NbFaces()))

face_iter = mesh_ds.facesIterator()
for i in range(mesh_ds.NbFaces()-1):
    face = face_iter.next()
    print('Face %i, type %i' % (i, face.GetType()))
