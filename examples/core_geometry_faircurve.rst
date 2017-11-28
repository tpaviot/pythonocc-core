core_geometry_faircurve.py
==========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_faircurve.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  import math
  import time
  import sys
  
  from OCC.gp import gp_Pnt2d, gp_Pln
  from OCC.Geom import Geom_Plane
  from OCC.FairCurve import FairCurve_MinimalVariation
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def error_code(n):
      errors = {0: "FairCurve_OK",
                1: "FairCurve_NotConverged",
                2: "FairCurve_InfiniteSliding",
                3: "FairCurve_NullHeight",
              }
      return errors[n]
  
  
  def batten_curve(pt1, pt2, height, slope, angle1, angle2):
      fc = FairCurve_MinimalVariation(pt1, pt2, height, slope)
      fc.SetConstraintOrder1(2)
      fc.SetConstraintOrder2(2)
      fc.SetAngle1(angle1)
      fc.SetAngle2(angle2)
      fc.SetHeight(height)
      fc.SetSlope(slope)
      fc.SetFreeSliding(True)
      print(fc.DumpToString())
      status = fc.Compute()
      print(error_code(status[0]), error_code(status[1]))
      return fc.Curve()
  
  
  def faircurve(event=None):
      pt1 = gp_Pnt2d(0., 0.)
      pt2 = gp_Pnt2d(0., 120.)
      height = 100.
      pl = Geom_Plane(gp_Pln())
      for i in range(0, 40):
          # TODO: the parameter slope needs to be visualized
          slope = i/100.
          bc = batten_curve(pt1, pt2, height, slope,
                            math.radians(i), math.radians(-i))
          display.EraseAll()
          edge = BRepBuilderAPI_MakeEdge(bc, pl.GetHandle()).Edge()
          display.DisplayShape(edge, update=True)
          time.sleep(0.21)
  
  
  def exit(event=None):
      sys.exit(0)
  
  if __name__ == "__main__":
      add_menu('fair curve')
      add_function_to_menu('fair curve', faircurve)
      add_function_to_menu('fair curve', exit)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_faircurve-1-1511701798.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-10-1511701802.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-11-1511701803.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-12-1511701803.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-13-1511701804.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-14-1511701804.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-15-1511701805.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-16-1511701805.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-17-1511701806.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-18-1511701806.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-19-1511701807.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-2-1511701799.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-20-1511701807.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-21-1511701808.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-22-1511701808.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-23-1511701808.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-24-1511701809.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-25-1511701809.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-26-1511701810.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-27-1511701810.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-28-1511701811.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-29-1511701811.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-3-1511701799.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-30-1511701812.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-31-1511701812.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-32-1511701813.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-33-1511701813.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-34-1511701814.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-35-1511701814.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-36-1511701815.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-37-1511701815.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-38-1511701816.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-39-1511701816.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-4-1511701800.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-40-1511701817.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-5-1511701800.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-6-1511701800.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-7-1511701801.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-8-1511701801.jpeg

  .. image:: images/screenshots/capture-core_geometry_faircurve-9-1511701802.jpeg

