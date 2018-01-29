core_load_iges.py
=================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_load_iges.py

------


Code
^^^^


.. code-block:: python

  from __future__ import print_function
  
  import sys
  
  from OCC.Core.IGESControl import IGESControl_Reader
  from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
  from OCC.Display.SimpleGui import init_display
  
  iges_reader = IGESControl_Reader()
  status = iges_reader.ReadFile('./models/surf114.igs')
  
  if status == IFSelect_RetDone:  # check status
      failsonly = False
      iges_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
      iges_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
      ok = iges_reader.TransferRoots()
      aResShape = iges_reader.Shape(1)
  else:
      print("Error: can't read file.")
      sys.exit(0)
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.DisplayShape(aResShape, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_load_iges-1-1511701990.jpeg

