##Copyright 2009-2017 Thomas Paviot (tpaviot@gmail.com)
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

import sys

from OCC.gp import gp_Pnt
from OCC.TopAbs import TopAbs_FACE
from OCC.TopExp import TopExp_Explorer
from OCC.TopoDS import TopoDS_Compound, topods_Face
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeFace
from OCC.GeomAPI import GeomAPI_PointsToBSpline
from OCC.GeomFill import GeomFill_ConstrainedFilling, GeomFill_SimpleBound
from OCC.GeomAdaptor import GeomAdaptor_HCurve
from OCC.TColgp import TColgp_Array1OfPnt
from OCC.BRep import BRep_Builder, BRep_Tool
from OCC.BRepMesh import BRepMesh_IncrementalMesh
from OCC.TopLoc import TopLoc_Location
from OCC.MeshVS import MeshVS_Mesh, MeshVS_BP_Mesh, MeshVS_MeshPrsBuilder, MeshVS_DMF_NodalColorDataPrs

# SMESH wrappers
from OCC.SMESH import SMESH_Gen, SMESH_MeshVSLink
from OCC.StdMeshers import (StdMeshers_Arithmetic1D, StdMeshers_TrianglePreference,
                            StdMeshers_Regular_1D, StdMeshers_Quadrangle_2D,
                            StdMeshers_MEFISTO_2D)

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()

def point_list_to_TColgp_Array1OfPnt(li):
    pts = TColgp_Array1OfPnt(0, len(li)-1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts

def get_simple_bound(pts):
    spl1 = GeomAPI_PointsToBSpline(pts).Curve()
    spl1_adap_h = GeomAdaptor_HCurve(spl1).GetHandle()
    bound1_h = GeomFill_SimpleBound(spl1_adap_h, 0.001, 0.001).GetHandle()
    return spl1, bound1_h

def constrained_filling(event=None):

    # left
    pts1 = point_list_to_TColgp_Array1OfPnt((gp_Pnt(0, 0, 0.0),
                                             gp_Pnt(0, 1, 0.3),
                                             gp_Pnt(0, 2, -0.3),
                                             gp_Pnt(0, 3, 0.15),
                                             gp_Pnt(0, 4, 0)))
    # front
    pts2 = point_list_to_TColgp_Array1OfPnt((gp_Pnt(0, 0, 0.0),
                                             gp_Pnt(1, 0, -0.3),
                                             gp_Pnt(2, 0, 0.15),
                                             gp_Pnt(3, 0, 0),
                                             gp_Pnt(4, 0, 0)))
    # back
    pts3 = point_list_to_TColgp_Array1OfPnt((gp_Pnt(0, 4, 0),
                                             gp_Pnt(1, 4, 0.3),
                                             gp_Pnt(2, 4, -0.15),
                                             gp_Pnt(3, 4, 0),
                                             gp_Pnt(4, 4, 1)))
    # rechts
    pts4 = point_list_to_TColgp_Array1OfPnt((gp_Pnt(4, 0, 0),
                                             gp_Pnt(4, 1, 0),
                                             gp_Pnt(4, 2, 2),
                                             gp_Pnt(4, 3, -0.15),
                                             gp_Pnt(4, 4, 1)))

    spl1, b1 = get_simple_bound(pts1)
    spl2, b2 = get_simple_bound(pts2)
    spl3, b3 = get_simple_bound(pts3)
    spl4, b4 = get_simple_bound(pts4)

    # build the constrained surface
    bConstrainedFilling = GeomFill_ConstrainedFilling(8, 2)
    bConstrainedFilling.Init(b1, b2, b3, b4, False)
    srf1 = bConstrainedFilling.Surface()

    display.EraseAll()
    for i in [spl1, spl2, spl3, spl4]:
        edg = BRepBuilderAPI_MakeEdge(i)
        edg.Build()
        _edg = edg.Shape()
        display.DisplayShape(_edg)

    f = BRepBuilderAPI_MakeFace(srf1, 1e-6)
    f.Build()
    shp = f.Shape()
    return shp

def exit(event=None):
    sys.exit(0)

def occ_triangle_mesh(event=None):
    #
    # Mesh the shape
    #
    BRepMesh_IncrementalMesh(aShape, 0.1)
    builder = BRep_Builder()
    Comp = TopoDS_Compound()
    builder.MakeCompound(Comp)

    ex = TopExp_Explorer(aShape, TopAbs_FACE)
    while ex.More():
        F = topods_Face(ex.Current())
        L = TopLoc_Location()
        facing = (BRep_Tool().Triangulation(F, L)).GetObject()
        tab = facing.Nodes()
        tri = facing.Triangles()
        for i in range(1, facing.NbTriangles()+1):
            trian = tri.Value(i)
            #print trian
            index1, index2, index3 = trian.Get()
            for j in range(1, 4):
                if j == 1:
                    M = index1
                    N = index2
                elif j == 2:
                    N = index3
                elif j == 3:
                    M = index2
                ME = BRepBuilderAPI_MakeEdge(tab.Value(M), tab.Value(N))
                if ME.IsDone():
                    builder.Add(Comp, ME.Edge())
        ex.Next()
    display.DisplayShape(Comp, update=True)

def smesh_quadrangle_mesh(event=None):
    # Create the Mesh
    aMeshGen = SMESH_Gen()
    aMesh = aMeshGen.CreateMesh(0, True)
    # 1D
    an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)#discretization of the wire
    an1DHypothesis.SetLength(0.01, False)  # the smallest distance between 2 points
    an1DHypothesis.SetLength(0.3, True)  # the longest distance between 2 points
    an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen)  # interpolation
    # 2D
    a2dHypothseis = StdMeshers_TrianglePreference(2, 0, aMeshGen)  # define the boundary
    a2dAlgo = StdMeshers_Quadrangle_2D(3, 0, aMeshGen)  # the 2D mesh
    #Calculate mesh
    aMesh.ShapeToMesh(aShape)
    #Assign hyptothesis to mesh
    aMesh.AddHypothesis(aShape, 0)
    aMesh.AddHypothesis(aShape, 1)
    aMesh.AddHypothesis(aShape, 2)
    aMesh.AddHypothesis(aShape, 3)
    #Compute the data
    aMeshGen.Compute(aMesh, aMesh.GetShapeToMesh())
    # Display the data
    display_mesh(aMesh)

def smesh_MEFISTO2D(event=None):
    # Create the Mesh
    aMeshGen = SMESH_Gen()
    aMesh = aMeshGen.CreateMesh(0, True)
    # 1D
    an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)  # discretization of the wire
    an1DHypothesis.SetLength(0.1, False) # the smallest distance between 2 points
    an1DHypothesis.SetLength(0.5, True)  # the longest distance between 2 points
    an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen)  # interpolation
    # 2D
    a2dHypothseis = StdMeshers_TrianglePreference(2, 0, aMeshGen)  # define the boundary
    a2dAlgo = StdMeshers_MEFISTO_2D(3, 0, aMeshGen)
    # alculate mesh
    aMesh.ShapeToMesh(aShape)
    # Assign hyptothesis to mesh
    aMesh.AddHypothesis(aShape, 0)
    aMesh.AddHypothesis(aShape, 1)
    aMesh.AddHypothesis(aShape, 2)
    aMesh.AddHypothesis(aShape, 3)
    # Compute the data
    aMeshGen.Compute(aMesh, aMesh.GetShapeToMesh())
    # Display the data
    display_mesh(aMesh)

def display_mesh(the_mesh):
    # First, erase all
    display.EraseAll()
    # then redisplay the shape
    display.DisplayShape(aShape)
    # then the mesh
    aDS = SMESH_MeshVSLink(the_mesh)
    aMeshVS = MeshVS_Mesh(True)
    DMF = 1 # to wrap!
    aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(),
                                        DMF,
                                        aDS.GetHandle(),
                                        0,
                                        MeshVS_BP_Mesh)
    aMeshVS.SetDataSource(aDS.GetHandle())
    aMeshVS.AddBuilder(aPrsBuilder.GetHandle(), True)
    #Create the graphic window and display the mesh
    context = display.Context
    context.Display(aMeshVS.GetHandle())
    context.Deactivate(aMeshVS.GetHandle())

    display.FitAll()

aShape = constrained_filling()

if __name__ == '__main__':
    add_menu('surfacic mesh')
    add_function_to_menu('surfacic mesh', occ_triangle_mesh)
    add_function_to_menu('surfacic mesh', smesh_quadrangle_mesh)
    add_function_to_menu('surfacic mesh', smesh_MEFISTO2D)
    add_function_to_menu('surfacic mesh', exit)
    display.DisplayShape(aShape, update=True)
    start_display()
