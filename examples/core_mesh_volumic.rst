core_mesh_volumic.py
====================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_mesh_volumic.py

------


Code
^^^^


.. code-block:: python

  
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
  from OCC.Core.gp import gp_Pnt
  from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Cut
  from OCC.Core.SMESH import SMESH_Gen, SMESH_MeshVSLink
  from OCC.Core.StdMeshers import (StdMeshers_Arithmetic1D, StdMeshers_QuadranglePreference,
  	                        StdMeshers_Regular_1D, StdMeshers_Prism_3D, StdMeshers_CompositeHexa_3D,
  	                        StdMeshers_Quadrangle_2D)
  from OCC.Core.MeshVS import (MeshVS_Mesh, MeshVS_BP_Mesh, MeshVS_MeshPrsBuilder,
  	                    MeshVS_DMF_NodalColorDataPrs)
  from OCC.Core.SMDSAbs import SMDSAbs_Face
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  # First create a 'complex' shape (actually a boolean op between a box and a cylinder)
  print('Creating geometry ...', end='')
  box = BRepPrimAPI_MakeBox(200, 30, 30).Shape()
  sphere = BRepPrimAPI_MakeSphere(gp_Pnt(150, 20, 20), 80).Shape()
  aShape = BRepAlgoAPI_Cut(box, sphere).Shape()
  print('Done.')
  
  # Create the Mesh
  print('Creating mesh ...', end='')
  aMeshGen = SMESH_Gen()
  aMesh = aMeshGen.CreateMesh(0, True)
  print('Done.')
  
  print('Adding hypothesis and algorithms ...', end='')
  # 1D
  an1DHypothesis = StdMeshers_Arithmetic1D(0, 0, aMeshGen)#discretization of the wire
  an1DHypothesis.SetLength(5., False) #the smallest distance between 2 points
  an1DHypothesis.SetLength(10., True) # the longest distance between 2 points
  an1DAlgo = StdMeshers_Regular_1D(1, 0, aMeshGen) # interpolation
  
  # 2D
  a2dHypothseis = StdMeshers_QuadranglePreference(2, 0, aMeshGen) #define the boundary
  a2dAlgo = StdMeshers_Quadrangle_2D(3, 0, aMeshGen) # the 2D mesh
  
  # 3D: Just uncomment the line to use the volumic mesher you want
  a3dHypothesis = StdMeshers_Prism_3D(4, 0, aMeshGen) #OK
  
  #Calculate mesh
  aMesh.ShapeToMesh(aShape)
  
  #Assign hyptothesis to mesh
  aMesh.AddHypothesis(aShape, 0)
  aMesh.AddHypothesis(aShape, 1)
  aMesh.AddHypothesis(aShape, 2)
  aMesh.AddHypothesis(aShape, 3)
  aMesh.AddHypothesis(aShape, 4)
  print('Done.')
  
  #Compute the data
  print('Computing mesh ...', end='')
  aMeshGen.Compute(aMesh,aMesh.GetShapeToMesh())
  print('Done.')
  print(aMesh.NbNodes())
  # Display the data
  aDS = SMESH_MeshVSLink(aMesh)
  aMeshVS = MeshVS_Mesh(True)
  DMF = 1 # to wrap!
  MeshVS_BP_Mesh =  5 # To wrap!
  
  aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(), DMF, aDS.GetHandle(), 0, MeshVS_BP_Mesh)
  aMeshVS.SetDataSource(aDS.GetHandle())
  aMeshVS.AddBuilder(aPrsBuilder.GetHandle(), True)
  context = display.Context
  context.Display(aMeshVS.GetHandle())
  context.Deactivate(aMeshVS.GetHandle())
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


No available screenshot.
