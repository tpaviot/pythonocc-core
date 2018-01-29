core_export_stl.py
==================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_export_stl.py

------


Code
^^^^


.. code-block:: python

  import os
  from OCC.Core.StlAPI import StlAPI_Writer
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
  from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
  
  # first, create the shape
  my_torus = BRepPrimAPI_MakeTorus(20., 10.).Shape()
  # then mesh it. This mesh is used by the STL exporter
  # Note : if the mesh is not performed, the STL exporter
  # won't do nothing
  mesh = BRepMesh_IncrementalMesh(my_torus, 0.9)
  mesh.Perform()
  assert mesh.IsDone()
  
  # set the directory where to output the
  directory = os.path.split(__name__)[0]
  stl_output_dir = os.path.abspath(os.path.join(directory, "models"))
  
  # make sure the path exists otherwise OCE get confused
  assert os.path.isdir(stl_output_dir)
  stl_low_resolution_file = os.path.join(stl_output_dir, "torus_low_resolution.stl")
  stl_exporter = StlAPI_Writer()
  stl_exporter.SetASCIIMode(True)  # change to False if you need binary export
  stl_exporter.Write(my_torus, stl_low_resolution_file)
  # make sure the program was created
  assert os.path.isfile(stl_low_resolution_file)
  
  # then we change the mesh resolution
  #
  mesh.SetDeflection(0.05)
  mesh.Perform()
  assert mesh.IsDone()
  stl_high_resolution_file = os.path.join(stl_output_dir, "torus_high_resolution.stl")
  # we set the format to binary
  stl_exporter.SetASCIIMode(False)
  stl_exporter.Write(my_torus, stl_high_resolution_file)
  assert os.path.isfile(stl_high_resolution_file)

Screenshots
^^^^^^^^^^^


No available screenshot.
