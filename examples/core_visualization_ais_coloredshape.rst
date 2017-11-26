core_visualization_ais_coloredshape.py
======================================

Abstract
^^^^^^^^

imagine importing a CAD file and wanting to set color to a subshape of the imported CAD data
with OCE 0.17 / OCC 6.8.0, this became easy, since colors can be set for subshapes

------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_visualization_ais_coloredshape.py

------


Code
^^^^


.. code-block:: python

  imagine importing a CAD file and wanting to set color to a subshape of the imported CAD data
  with OCE 0.17 / OCC 6.8.0, this became easy, since colors can be set for subshapes
  
  """
  
  from __future__ import print_function
  
  from random import random
  
  from OCC.AIS import AIS_ColoredShape
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.Display.OCCViewer import rgb_color
  from OCC.Display.SimpleGui import init_display
  
  from core_topology_traverse import Topo
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  
  ais = AIS_ColoredShape(my_box)
  
  for fc in Topo(my_box).faces():
      # set a custom color per-face
      ais.SetCustomColor(fc, rgb_color(random(), random(), random()))
  
  display.Context.Display(ais.GetHandle())
  display.FitAll()
  
  start_display()

Screenshots
^^^^^^^^^^^


No available screenshot.
