core_offscreen_rendering.py
===========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_offscreen_rendering.py

------


Code
^^^^


.. code-block:: python

  from OCC.Display.OCCViewer import Display3d, Viewer3d
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  
  # create the renderer
  offscreen_renderer = Viewer3d(None)
  offscreen_renderer.Create()
  offscreen_renderer.SetSize(1024, 768)
  offscreen_renderer.SetModeShaded()
  
  # then the shape
  my_box = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  
  # send the shape to the renderer
  offscreen_renderer.DisplayShape(my_box, update=True)
  #start_display()
  data = offscreen_renderer.GetImageData(1)
  
  # export the view to image
  offscreen_renderer.View.Dump('./capture_jpeg.jpeg')

Screenshots
^^^^^^^^^^^


No available screenshot.
