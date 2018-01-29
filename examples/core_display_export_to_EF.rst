core_display_export_to_EF.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_export_to_EF.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.SimpleGui import init_display
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
  from OCC.Core.Graphic3d import (Graphic3d_EF_PDF,
                             Graphic3d_EF_SVG,
                             Graphic3d_EF_TEX,
                             Graphic3d_EF_PostScript,
                             Graphic3d_EF_EnhPostScript)
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  my_box = BRepPrimAPI_MakeTorus(40., 20.).Shape()
  
  display.DisplayShape(my_box, update=True)
  f = display.View.View().GetObject()
  
  #-------------------------------------------------------------------------------
  # for this example to work, pythonocc / OCE needs to be built with the gl2ps lib
  #-------------------------------------------------------------------------------
  
  def export_to_PDF(event=None):
      f.Export('torus_export.pdf', Graphic3d_EF_PDF)
  
  
  def export_to_SVG(event=None):
      f.Export('torus_export.svg', Graphic3d_EF_SVG)
  
  
  def export_to_PS(event=None):
      f.Export('torus_export.ps', Graphic3d_EF_PostScript)
  
  
  def export_to_EnhPS(event=None):
      f.Export('torus_export_enh.ps', Graphic3d_EF_EnhPostScript)
  
  
  def export_to_TEX(event=None):
      f.Export('torus_export.tex', Graphic3d_EF_TEX)
  
  
  if __name__ == '__main__':
      add_menu('screencapture')
      add_function_to_menu('screencapture', export_to_PDF)
      add_function_to_menu('screencapture', export_to_SVG)
      add_function_to_menu('screencapture', export_to_PS)
      add_function_to_menu('screencapture', export_to_EnhPS)
      add_function_to_menu('screencapture', export_to_TEX)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_export_to_EF-1-1511701688.jpeg

