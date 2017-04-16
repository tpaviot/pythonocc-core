# #Copyright 2009-2011 Thomas Paviot (tpaviot@gmail.com)
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
from OCC.BRep import BRep_Tool_Triangulation, BRep_Builder
from OCC.BRepAlgoAPI import BRepAlgoAPI_Fuse
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, BRepBuilderAPI_Transform
from OCC.BRepMesh import brepmesh
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
from OCC.Display.SimpleGui import init_display
from OCC.TopAbs import TopAbs_FACE
from OCC.TopExp import TopExp_Explorer
from OCC.TopLoc import TopLoc_Location
from OCC.TopoDS import topods_Face, TopoDS_Compound
from OCC.gp import gp_Pnt, gp_Trsf, gp_Vec

display, start_display, add_menu, add_function_to_menu = init_display()
# be able to select all the vertices in the reconstructed mesh
display.SetSelectionModeVertex()

def simple_mesh(event=None):
    # Create the shape
    box = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
    sphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()

    # fuse the `box` and `sphere` with a boolean operation
    shape = BRepAlgoAPI_Fuse(sphere, box).Shape()

    # create a mesh from the `shape`
    brepmesh.Mesh(shape, 0.8)

    # Create a TopoDS_Compound instance
    # the edges of the mesh will be stored in this object
    builder = BRep_Builder()
    recreated_mesh = TopoDS_Compound()
    builder.MakeCompound(recreated_mesh)

    ex = TopExp_Explorer(shape, TopAbs_FACE)

    while ex.More():
        F = topods_Face(ex.Current())
        L = TopLoc_Location()
        facing = (BRep_Tool_Triangulation(F, L)).GetObject()
        tab = facing.Nodes()
        tri = facing.Triangles()
        for i in range(1, facing.NbTriangles() + 1):
            trian = tri.Value(i)
            index1, index2, index3 = trian.Get()

            # rebuild the triangle, with TopoDS_Edge's
            for j in range(1, 4):
                if j == 1:
                    M = index1
                    N = index2
                elif j == 2:
                    N = index3
                elif j == 3:
                    M = index2
                # construct the edge
                ME = BRepBuilderAPI_MakeEdge(tab.Value(M), tab.Value(N))
                if ME.IsDone():
                    # append the edge to the TopoDS_Compound instance `recreated_mesh`
                    builder.Add(recreated_mesh, ME.Edge())
        # explore the next face in the `shape`
        ex.Next()
    # clean the viewer
    display.EraseAll()
    # draw the `shape`
    # by default, the view is not updated, so you won't be able to see it until the view is redrawn
    display.DisplayShape(shape)
    # draw the recreated mesh
    # or, have viewer redraw, by setting `update` to true

    trans = gp_Trsf()
    trans.SetTranslation(gp_Vec(200,0,0))

    translate_mesh = BRepBuilderAPI_Transform(recreated_mesh, trans, False)
    translate_mesh.Build()
    translated_recreated_mesh = translate_mesh.Shape()


    display.DisplayShape(translated_recreated_mesh, update=True)


if __name__ == '__main__':
    # add_menu('mesh')
    # add_function_to_menu('mesh', simple_mesh)
    simple_mesh()
    start_display()


