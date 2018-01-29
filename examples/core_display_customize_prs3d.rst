core_display_customize_prs3d.py
===============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_customize_prs3d.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  #
  # This sample shows howto set display quality (higher or lower).
  # Be carful that improving quality results in higher memory consumption
  #
  
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeCylinder
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.SetModeHLR()
  #
  # Get Context
  #
  ais_context = display.GetContext().GetObject()
  #
  # Get Prs3d_drawer from previous context
  #
  drawer_handle = ais_context.DefaultDrawer()
  drawer = drawer_handle.GetObject()
  drawer.SetIsoOnPlane(True)
  
  la = drawer.LineAspect().GetObject()
  la.SetWidth(4)
  # increase line width in the current viewer
  # This is only viewed in the HLR mode (hit 'e' key for instance)
  line_aspect = drawer.SeenLineAspect().GetObject()
  drawer.EnableDrawHiddenLine()
  line_aspect.SetWidth(4)
  #
  drawer.SetWireAspect(line_aspect.GetHandle())
  #
  # Displays a cylinder
  #
  s = BRepPrimAPI_MakeCylinder(50., 50.).Shape()
  display.DisplayShape(s)
  #
  # Display settings and display loop
  #
  display.View_Iso()
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_customize_prs3d-1-1511701684.jpeg

