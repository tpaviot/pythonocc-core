core_load_step_ap203.py
=======================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_load_step_ap203.py

------


Code
^^^^


.. code-block:: python

  from __future__ import print_function
  
  import random
  import os
  import os.path
  import sys
  
  from OCC.STEPControl import STEPControl_Reader
  from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
  from OCC.Quantity import Quantity_Color, Quantity_TOC_RGB
  from OCC.Display.SimpleGui import init_display
  
  from core_topology_traverse import Topo
  
  def read_step_file(filename):
      """ read the STEP file and returns a compound
      """
      step_reader = STEPControl_Reader()
      status = step_reader.ReadFile(filename)
  
      if status == IFSelect_RetDone:  # check status
          failsonly = False
          step_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
          step_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
  
          ok = step_reader.TransferRoot(1)
          _nbs = step_reader.NbShapes()
          aResShape = step_reader.Shape(1)
      else:
          print("Error: can't read file.")
          sys.exit(0)
      return aResShape
  
  def import_as_one_shape(event=None):
      shp = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
      display.EraseAll()
      display.DisplayShape(shp, update=True)
  
  def import_as_compound(event=None):
      compound = read_step_file(os.path.join('.', 'models', 'as1_pe_203.stp'))
      t = Topo(compound)
      display.EraseAll()
      for solid in t.solids():
          color = Quantity_Color(random.random(),
                                 random.random(),
                                 random.random(),
                                 Quantity_TOC_RGB)
          display.DisplayColoredShape(solid, color)
      display.FitAll()
  
  def exit(event=None):
      sys.exit()
  
  
  if __name__ == '__main__':
      display, start_display, add_menu, add_function_to_menu = init_display()
      add_menu('STEP import')
      add_function_to_menu('STEP import', import_as_one_shape)
      add_function_to_menu('STEP import', import_as_compound)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_load_step_ap203-1-1511701994.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-10-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-11-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-12-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-13-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-14-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-15-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-16-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-17-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-18-1511701996.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-19-1511701997.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-2-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-3-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-4-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-5-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-6-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-7-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-8-1511701995.jpeg

  .. image:: images/screenshots/capture-core_load_step_ap203-9-1511701996.jpeg

