core_display_z_order_transparency.py
====================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_z_order_transparency.py

------


Code
^^^^


.. code-block:: python

  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
  from OCC.Display.SimpleGui import init_display
  from OCC.gp import gp_Vec, gp_Pnt
  
  from core_geometry_utils import translate_shp
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  # Create Box
  box = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
  # Create Sphere
  sphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()
  # move the sphere
  moved_sphere = translate_shp(sphere, gp_Vec(0., -200., 0.))
  
  ais_box = display.DisplayShape(box)
  display.Context.SetTransparency(ais_box, 0.1)
  ais_sphere = display.DisplayColoredShape(moved_sphere, color="BLUE")
  display.Context.SetTransparency(ais_sphere, 0.9)
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_z_order_transparency-1-1511701728.jpeg

  .. image:: images/screenshots/capture-core_display_z_order_transparency-2-1511701729.jpeg

