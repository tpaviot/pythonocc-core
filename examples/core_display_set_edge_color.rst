core_display_set_edge_color.py
==============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_set_edge_color.py

------


Code
^^^^


.. code-block:: python

  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.AIS import AIS_Shape
  from OCC.Quantity import Quantity_NOC_BLACK
  from OCC.Display.SimpleGui import init_display
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  myBox = BRepPrimAPI_MakeBox(60, 60, 50).Shape()
  context = display.Context
  context.SetAutoActivateSelection(False)
  
  aisShape = AIS_Shape(myBox)
  h_aisShape = aisShape.GetHandle()
  context.Display(h_aisShape)
  
  # Set shape transparency, a float number from 0.0 to 1.0
  context.SetTransparency(h_aisShape, 0.6)
  context.HilightWithColor(h_aisShape, Quantity_NOC_BLACK)
  
  display.View_Iso()
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


No available screenshot.
