core_visualization_camera.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_visualization_camera.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.Graphic3d import Graphic3d_Camera
  
  import sys, os
  
  sys.path.append(os.path.dirname(__name__))
  from OCC.Extend.DataExchange import read_step_file
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  # load step file
  the_shape = read_step_file('./models/as1_pe_203.stp')
  display.DisplayShape(the_shape)
  
  
  def animate_viewpoint():
      display.FitAll()
      display.Context.UpdateCurrentViewer()
  
      cam = display.View.Camera().GetObject()  # type: Graphic3d_Camera
  
      center = cam.Center()
      eye = cam.Eye()
  
      for i in range(100):
          eye.SetY(eye.Y() + i)
          cam.SetEye(eye)
          display.View.ZFitAll()
          display.Context.UpdateCurrentViewer()
  
      for i in range(100):
          center.SetZ(center.Z() + i)
          cam.SetCenter(center)
          display.View.ZFitAll()
          display.Context.UpdateCurrentViewer()
  
  
  add_menu("camera")
  add_function_to_menu("camera", animate_viewpoint)
  
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_visualization_camera-1-1511702304.jpeg

