core_display_background_image.py
================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_background_image.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  
  display.SetBackgroundImage('./images/nevers-pont-de-loire.jpg', stretch=True)
  display.DisplayShape(my_box, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_background_image-1-1511701661.jpeg

