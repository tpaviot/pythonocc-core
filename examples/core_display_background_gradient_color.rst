core_display_background_gradient_color.py
=========================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_background_gradient_color.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.Core.Quantity import Quantity_NOC_ALICEBLUE, Quantity_NOC_ANTIQUEWHITE
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  
  display.View.SetBgGradientColors(Quantity_NOC_ALICEBLUE, Quantity_NOC_ANTIQUEWHITE, 2, True)
  display.Repaint()
  display.DisplayShape(my_box, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_background_gradient_color-1-1511701658.jpeg

