core_mesh_fast_stl_load.py
==========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_mesh_fast_stl_load.py

------


Code
^^^^


.. code-block:: python

  
  import time
  import os
  import os.path
  
  from OCC.Core.SMESH import SMESH_Gen, SMESH_MeshVSLink
  from OCC.Core.MeshVS import MeshVS_Mesh, MeshVS_BP_Mesh, MeshVS_MeshPrsBuilder, MeshVS_DMF_WireFrame
  from OCC.Display.SimpleGui import init_display
  
  # Create the Mesh
  print('Creating mesh ...', end='')
  aMeshGen = SMESH_Gen()
  aMesh = aMeshGen.CreateMesh(0, True)
  print('Done.')
  
  # Model from https://grabcad.com/library/5-spoke-wheel-2
  # courtesy of Mauricio Oliveira
  print('Loading STL geometry ...', end='')
  init_time = time.time()
  aMesh.STLToMesh(os.path.join('.', 'models', 'five_spoke_wheel.stl'))
  final_time = time.time()
  delta_t = final_time - init_time
  print('Done.')
  print('STL model loaded in %.2fs' % delta_t)
  # Data statistics
  print("Model statistics:")
  print("\tNb Nodes", aMesh.NbNodes())
  print("\tNb Faces", aMesh.NbFaces())
  print("\tTransfer rate: %i triangles per seconds" % (aMesh.NbFaces() / delta_t))
  
  # Display mesh
  display, start_display, add_menu, add_function_to_menu = init_display()
  aDS = SMESH_MeshVSLink(aMesh)
  aMeshVS = MeshVS_Mesh(True)
  aPrsBuilder = MeshVS_MeshPrsBuilder(aMeshVS.GetHandle(),
  	                               MeshVS_DMF_WireFrame,
  	                               aDS.GetHandle(),
  	                               0,
  	                               MeshVS_BP_Mesh)
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
