core_load_stl.py
================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_load_stl.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.TopoDS import TopoDS_Shape
  from OCC.StlAPI import StlAPI_Reader
  
  stl_reader = StlAPI_Reader()
  fan_shp = TopoDS_Shape()
  stl_reader.Read(fan_shp, './models/fan.stl')
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.DisplayShape(fan_shp, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_load_stl-1-1511702016.jpeg

