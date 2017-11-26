core_2d_fillet.py
=================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_2d_fillet.py

------


Code
^^^^


.. code-block:: python

  from OCC.gp import gp_Pnt,gp_Dir,gp_Pln
  from OCC.Display.SimpleGui import init_display
  from OCC.ChFi2d import ChFi2d_AnaFilletAlgo
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge,BRepBuilderAPI_MakeWire
  
  from core_geometry_utils import make_wire
  display,start_display, add_menu,add_functionto_menu = init_display()
  
  # Defining the points
  p1 = gp_Pnt(0, 0, 0) 
  p2 = gp_Pnt(5, 5, 0)
  p3 = gp_Pnt(-5,5, 0)
  
  # Making the edges
  ed1 = BRepBuilderAPI_MakeEdge(p3,p2).Edge()
  ed2 = BRepBuilderAPI_MakeEdge(p2,p1).Edge()
  
  #Making the 2dFillet
  f = ChFi2d_AnaFilletAlgo()
  f.Init(ed1,ed2,gp_Pln())
  radius = 1.0
  f.Perform(radius)
  fillet2d = f.Result(ed1,ed2)
  
  # Create and display a wire
  w = make_wire([ed1, fillet2d, ed2])
  display.DisplayShape(w)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_2d_fillet-1-1511701614.jpeg

