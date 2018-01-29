core_visualization_3d_to_2d_screen_coordinates.py
=================================================

Abstract
^^^^^^^^

Select a vertex, and you'll see both 3d and 2d screen
coordinates in the console.

------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_visualization_3d_to_2d_screen_coordinates.py

------


Code
^^^^


.. code-block:: python

  """ Select a vertex, and you'll see both 3d and 2d screen
  coordinates in the console.
  """
  
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.Graphic3d import Graphic3d_Camera
  from OCC.Core.TopoDS import topods_Vertex
  from OCC.Core.BRep import BRep_Tool
  from OCC.Extend.DataExchange import read_step_file
  
  def vertex_clicked(shp, *kwargs):
      """ This function is called whenever a vertex is selected
      """
      for shape in shp:  # this should be a TopoDS_Vertex
          print("Face selected: ", shape)
          v = topods_Vertex(shape)
          pnt = BRep_Tool.Pnt(v)
          print("3d gp_Pnt selected coordinates : X=", pnt.X(),
                "Y=", pnt.Y(), "Z=", pnt.Z())
          # then convert to screen coordinates
          screen_coord = display.View.Convert(pnt.X(), pnt.Y(), pnt.Z())
          print("2d screen coordinates : ", screen_coord)
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  # loads  and displays a step file
  the_shape = read_step_file('./models/as1_pe_203.stp')
  
  display.SetSelectionModeVertex()  # switch to Vertex selection mode
  display.register_select_callback(vertex_clicked)
  display.DisplayShape(the_shape, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_visualization_3d_to_2d_screen_coordinates-1-1512140980.jpeg

