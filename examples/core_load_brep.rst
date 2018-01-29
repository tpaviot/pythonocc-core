core_load_brep.py
=================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_load_brep.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepTools import breptools_Read
  from OCC.Core.TopoDS import TopoDS_Shape
  from OCC.Core.BRep import BRep_Builder
  
  cylinder_head = TopoDS_Shape()
  builder = BRep_Builder()
  breptools_Read(cylinder_head, './models/cylinder_head.brep', builder)
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.DisplayShape(cylinder_head, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_load_brep-1-1511701987.jpeg

