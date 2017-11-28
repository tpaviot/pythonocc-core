core_topology_boolean_general_fuse_algorithm.py
===============================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_boolean_general_fuse_algorithm.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.BOPAlgo import BOPAlgo_Builder
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  my_box2 = BRepPrimAPI_MakeBox(20., 1., 30.).Shape()
  
  # use the General Fuse Algorithm
  builder = BOPAlgo_Builder()
  builder.AddArgument(my_box1)
  builder.AddArgument(my_box2)
  builder.SetRunParallel(True)
  builder.Perform()  # or .PerformWithFiller(a_filler)
  error_code = builder.ErrorStatus()
  if error_code != 0:
      raise AssertionError("Failed with error code %i" % error_code)
  result = builder.Shape()
  display.DisplayShape(result, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_boolean_general_fuse_algorithm-1-1511702232.jpeg

