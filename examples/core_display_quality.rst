core_display_quality.py
=======================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_quality.py

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
  
  
  #
  # Get Context
  #
  ais_context = display.GetContext().GetObject()
  #
  # Display current quality
  dc = ais_context.DeviationCoefficient()
  dc_hlr = ais_context.HLRDeviationCoefficient()
  da = ais_context.DeviationAngle()
  da_hlr = ais_context.HLRAngle()
  print("Default display quality settings:")
  print("Deviation Coefficient: %f" % dc)
  print("Deviation Coefficient Hidden Line Removal: %f" % dc_hlr)
  print("Deviation Angle: %f" % da)
  print("Deviation Angle Hidden Line Removal: %f" % da_hlr)
  #
  # Improve quality by a factor 10
  #
  factor = 20
  ais_context.SetDeviationCoefficient(dc/factor)
  ais_context.SetDeviationAngle(da/factor)
  ais_context.SetHLRDeviationCoefficient(dc_hlr/factor)
  ais_context.SetHLRAngle(da_hlr/factor)
  print("Quality display improved by a factor {0}".format(factor))
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


  .. image:: images/screenshots/capture-core_display_quality-1-1511701718.jpeg

