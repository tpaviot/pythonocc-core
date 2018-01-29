core_gfa.py
===========

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_gfa.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.Core.BOPAlgo import BOPAlgo_Builder
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box1 = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  my_box2 = BRepPrimAPI_MakeBox(20., 1., 30.).Shape()
  
  # use the GFA
  builder = BOPAlgo_Builder()
  builder.AddArgument(my_box1)
  builder.AddArgument(my_box2)
  builder.SetRunParallel(True)
  builder.Perform()  # or .PerformWithFiller(aPF);
  error_code = builder.ErrorStatus()
  if error_code != 0:
  	raise AssertionError("Failed with error code %i" % error_code)
  result = builder.Shape()
  display.DisplayShape(result, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_gfa-1-1511701974.jpeg

