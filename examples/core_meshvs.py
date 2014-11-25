import os
from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()

directory = os.path.split(__name__)[0]
pth = os.path.join(directory, "..", "models", "fan.stl")

def load_stl_fast(_path):
    """
    :param _path: path to an STL file
    :return: OCC.SMESH.SMESH_Mesh
    :raise ValueError: when an invalid path is found or a mesh that has no vertices
    """
    from OCC.SMESH import SMESH_Gen
    gen = SMESH_Gen()
    mesh = gen.CreateMesh(0, True)
    # .STLToMesh does a poor job in catching errors when an incorrect path is specified
    #  so let's check the path...
    # finally, with OCC < 6.8.0 unicode paths are a no-no

    _path = str(_path) if not isinstance(_path, str) else _path
    if not os.path.isfile(_path):
        raise ValueError("{0} is not a valid path".format(_path))

    mesh.STLToMesh(_path)
    # test for a minimal number of mesh vertices
    if mesh.NbNodes() < 1:
        raise ValueError("stl file {0} contains no geometry".format(_path))
    return mesh

def meshvs_link_from_mesh(mesh):
    """
    create a renderable instance from a `mesh`, which is a OCC.SMESH.SMESH_Mesh instance
    the returned MeshVS_Mesh is a subclass of AIS_InteractiveShape, used to render TopoDS_Shape's

    :param mesh:
    :return: MeshVS_Mesh
    """
    from OCC.SMESH import SMESH_MeshVSLink
    aDS = SMESH_MeshVSLink(mesh)
    aMeshVS = MeshVS_Mesh(True)
    DMF = 2  # to wrap; 1 is wireframe
    aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(), DMF, aDS.GetHandle())  # ,0,MeshVS_BP_Mesh)

    aMeshVS.SetDataSource(aDS.GetHandle())
    aMeshVS.AddBuilder(aPrsBuilder.GetHandle(), False)
    MeshVS_DMF_Shading = int(0x0002)
    aMeshVS.SetDisplayMode(MeshVS_DMF_Shading)  # 1 -> wireframe, 2 -> shaded
    # Create the graphic window and display the mesh
    mesh_to_display = aMeshVS.GetHandle()
    # display the mesh edges in black
    mesh_drawer = aMeshVS.GetDrawer().GetObject()
    mesh_drawer.SetColor(MeshVS_DA_InteriorColor, STATE_COLOR["all_good"])
    mesh_drawer.SetMaterial(MeshVS_DA_FrontMaterial, Graphic3d_MaterialAspect(Graphic3d_NOM_PLASTIC))
    mesh_drawer.SetBoolean(MeshVS_DA_DisplayNodes, False)
    mesh_drawer.SetBoolean(MeshVS_DA_ShowEdges, False)
    mesh_drawer.SetBoolean(MeshVS_DA_SmoothShading, True)
    mesh_drawer.SetBoolean(MeshVS_DA_ColorReflection, True)
    mesh_drawer.SetBoolean(MeshVS_DA_Reflection, True)
    msh = mesh_to_display.GetObject()
    return msh

def get_fast_stl_mesh_from_path(_path):
    """
    open/parse STL file and get the resulting TopoDS_Shape instance
    """
    mesh = load_stl_fast(_path)
    msh = meshvs_link_from_mesh(mesh)
    return msh

mesh = get_fast_stl_mesh_from_path(pth)

display.DisplayShape(mesh)
start_display()

