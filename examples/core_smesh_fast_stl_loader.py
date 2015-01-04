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

import os
import time

from OCC.MeshVS import (MeshVS_Mesh, MeshVS_MeshPrsBuilder,
                        MeshVS_DA_Reflection, MeshVS_DA_InteriorColor,
                        MeshVS_DA_FrontMaterial,
                        MeshVS_DMF_Shading, MeshVS_DA_SmoothShading,
                        MeshVS_DA_ColorReflection,
                        MeshVS_DA_DisplayNodes, MeshVS_DA_ShowEdges)
from OCC.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.SMESH import SMESH_Gen, SMESH_MeshVSLink
from OCC.Graphic3d import Graphic3d_MaterialAspect, Graphic3d_NOM_PLASTIC
from OCC.Display.SimpleGui import init_display

directory = os.path.split(__name__)[0]
pth = os.path.join(directory, "models", "Helicopter.stl")


def load_stl_fast(_path):
    """
    :param _path: path to an STL file
    :return: OCC.SMESH.SMESH_Mesh
    :raise ValueError: when an invalid path is found or a mesh that has no vertices
    """
    # create a mesh
    gen = SMESH_Gen()
    mesh = gen.CreateMesh(0, True)

    print("Load stl file and convert to mesh ...", end="")
    mesh.STLToMesh(_path)
    print("done")
    print("STLToMesh - NbNodes() = ", mesh.NbNodes())
    print("STLToMesh - NbEdges() = ", mesh.NbEdges())
    print("STLToMesh - NbFaces() = ", mesh.NbFaces())
    print("STLToMesh - NbVolumes() = ", mesh.NbVolumes())
    return mesh


def meshvs_link_from_mesh(mesh):
    """
    create a renderable instance from a `mesh`, which is a
    OCC.SMESH.SMESH_Mesh instance the returned MeshVS_Mesh is a subclass of
    AIS_InteractiveShape, used to render TopoDS_Shape's

    :param mesh:
    :return: MeshVS_Mesh
    """
    aDS = SMESH_MeshVSLink(mesh)
    aMeshVS = MeshVS_Mesh(True)
    aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(),
                                        MeshVS_DMF_Shading, aDS.GetHandle())
    aMeshVS.SetDataSource(aDS.GetHandle())
    aMeshVS.AddBuilder(aPrsBuilder.GetHandle(), True)
    aMeshVS.SetDisplayMode(MeshVS_DMF_Shading)
    # Create the graphic window and display the mesh
    mesh_to_display = aMeshVS.GetHandle()
    # display the mesh edges in black
    mesh_drawer = aMeshVS.GetDrawer().GetObject()
    # set color
    interior_red = 0.2
    interior_green = 0.2
    interior_blue = 0.2
    interior_color = Quantity_Color(interior_red,
                                    interior_green,
                                    interior_blue,
                                    Quantity_TOC_RGB)
    mesh_drawer.SetColor(MeshVS_DA_InteriorColor, interior_color)
    mesh_drawer.SetMaterial(MeshVS_DA_FrontMaterial, Graphic3d_MaterialAspect(Graphic3d_NOM_PLASTIC))
    mesh_drawer.SetBoolean(MeshVS_DA_DisplayNodes, False)
    mesh_drawer.SetBoolean(MeshVS_DA_ShowEdges, True)
    mesh_drawer.SetBoolean(MeshVS_DA_SmoothShading, True)
    mesh_drawer.SetBoolean(MeshVS_DA_ColorReflection, True)
    mesh_drawer.SetBoolean(MeshVS_DA_Reflection, True)
    msh = mesh_to_display
    return msh


def get_fast_stl_mesh_from_path(_path):
    """
    open/parse STL file and get the resulting TopoDS_Shape instance
    """
    init_time = time.time()
    mesh = load_stl_fast(_path)
    msh = meshvs_link_from_mesh(mesh)
    total_loading_time = time.time() - init_time
    print("Loading time: %f" % total_loading_time)
    return msh

# get the file and create the mesh
mesh = get_fast_stl_mesh_from_path(pth)

# then display
display, start_display, add_menu, add_function_to_menu = init_display()
context = display.Context
context.Display(mesh)
display.FitAll()
start_display()
