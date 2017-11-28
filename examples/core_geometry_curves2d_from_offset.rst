core_geometry_curves2d_from_offset.py
=====================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_curves2d_from_offset.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.gp import gp_Pnt2d
  from OCC.TColgp import TColgp_Array1OfPnt2d
  from OCC.Geom2dAPI import Geom2dAPI_PointsToBSpline
  from OCC.Geom2d import Geom2d_OffsetCurve
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def curves2d_from_offset(event=None):
      '''
      @param display:
      '''
      pnt2d_array = TColgp_Array1OfPnt2d(1, 5)
      pnt2d_array.SetValue(1, gp_Pnt2d(-4, 0))
      pnt2d_array.SetValue(2, gp_Pnt2d(-7, 2))
      pnt2d_array.SetValue(3, gp_Pnt2d(-6, 3))
      pnt2d_array.SetValue(4, gp_Pnt2d(-4, 3))
      pnt2d_array.SetValue(5, gp_Pnt2d(-3, 5))
  
      spline_1 = Geom2dAPI_PointsToBSpline(pnt2d_array).Curve()
  
      dist = 1
      offset_curve1 = Geom2d_OffsetCurve(spline_1, dist)
      result = offset_curve1.IsCN(2)
      print("Offset curve yellow is C2: %r" % result)
      dist2 = 1.5
      offset_curve2 = Geom2d_OffsetCurve(spline_1, dist2)
      result2 = offset_curve2.IsCN(2)
      result = offset_curve1.IsCN(2)
      print("Offset curve blue is C2: %r" % result2)
  
      display.DisplayShape(spline_1)
      display.DisplayShape(offset_curve1, color='YELLOW')
      display.DisplayShape(offset_curve2, color='BLUE', update=True)
  
  
  if __name__ == '__main__':
      curves2d_from_offset()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_curves2d_from_offset-1-1511701795.jpeg

  .. image:: images/screenshots/capture-core_geometry_curves2d_from_offset-2-1511701795.jpeg

  .. image:: images/screenshots/capture-core_geometry_curves2d_from_offset-3-1511701795.jpeg

