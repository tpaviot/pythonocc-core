core_helloworld.py
==================

Abstract
^^^^^^^^

The very first pythonocc example. This uses to be the script
used to check the following points:

pythonocc installation is correct, i.e. pythonocc modules are found
and properly imported

a GUI manager is installed. Wether it is wxpython or pyqt/pyside, it's necessary
to display a 3d window

the rendering window can be initialized and set up, that is to say the
graphic driver and OpenGl works correctly.

If this example run on your machine, that means you're ready to explore the wide
pythonocc world and run all the other examples.

------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_helloworld.py

------


Code
^^^^


.. code-block:: python

  """
  The very first pythonocc example. This uses to be the script
  used to check the following points:
  
  pythonocc installation is correct, i.e. pythonocc modules are found
  and properly imported
  
  a GUI manager is installed. Wether it is wxpython or pyqt/pyside, it's necessary
  to display a 3d window
  
  the rendering window can be initialized and set up, that is to say the
  graphic driver and OpenGl works correctly.
  
  If this example run on your machine, that means you're ready to explore the wide
  pythonocc world and run all the other examples.
  """
  
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  
  display.DisplayShape(my_box, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_helloworld-1-1511701977.jpeg

