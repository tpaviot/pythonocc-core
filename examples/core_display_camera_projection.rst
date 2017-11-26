core_display_camera_projection.py
=================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_camera_projection.py

------


Code
^^^^


.. code-block:: python

  
  from OCC.Display.SimpleGui import init_display
  from OCC.Graphic3d import Graphic3d_RenderingParams
  from OCC.BRepTools import breptools_Read
  from OCC.TopoDS import TopoDS_Shape
  from OCC.BRep import BRep_Builder
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  # loads the motor model
  motor_c = TopoDS_Shape()
  builder = BRep_Builder()
  breptools_Read(motor_c, './models/Motor-c.brep', builder)
  display.DisplayShape(motor_c, update=True)
  
  def perspective(event=None):
      display.SetPerspectiveProjection()
      display.FitAll()
  
  def orthographic(event=None):
      display.SetOrthographicProjection()
      display.FitAll()
  
  def anaglyph_red_cyan(event=None):
      display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_RedCyan_Simple)
      display.FitAll()
  
  def anaglyph_red_cyan_optimized(event=None):
      display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_RedCyan_Optimized)
      display.FitAll()
  
  def anaglyph_yellow_blue(event=None):
      display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_YellowBlue_Simple)
      display.FitAll()
  
  def anaglyph_green_magenta(event=None):
      display.SetAnaglyphMode(Graphic3d_RenderingParams.Anaglyph_GreenMagenta_Simple)
      display.FitAll()
  
  def exit(event=None):
      sys.exit()
  
  
  if __name__ == '__main__':
      add_menu('camera projection')
      add_function_to_menu('camera projection', perspective)
      add_function_to_menu('camera projection', orthographic)
      add_function_to_menu('camera projection', anaglyph_red_cyan)
      add_function_to_menu('camera projection', anaglyph_red_cyan_optimized)
      add_function_to_menu('camera projection', anaglyph_yellow_blue)
      add_function_to_menu('camera projection', anaglyph_green_magenta)
      add_function_to_menu('camera projection', exit)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_camera_projection-1-1511701668.jpeg

