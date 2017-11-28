core_geometry_bspline.py
========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_bspline.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.gp import gp_Pnt2d
  from OCC.Geom2dAPI import Geom2dAPI_Interpolate, Geom2dAPI_PointsToBSpline
  from OCC.TColgp import TColgp_HArray1OfPnt2d, TColgp_Array1OfPnt2d
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def bspline():
      # the first bspline
      array = TColgp_Array1OfPnt2d(1, 5)
      array.SetValue(1, gp_Pnt2d(0, 0))
      array.SetValue(2, gp_Pnt2d(1, 2))
      array.SetValue(3, gp_Pnt2d(2, 3))
      array.SetValue(4, gp_Pnt2d(4, 3))
      array.SetValue(5, gp_Pnt2d(5, 5))
      bspline_1 = Geom2dAPI_PointsToBSpline(array).Curve()
  
      # the second one
      harray = TColgp_HArray1OfPnt2d(1, 5)
      harray.SetValue(1, gp_Pnt2d(0, 0))
      harray.SetValue(2, gp_Pnt2d(1, 2))
      harray.SetValue(3, gp_Pnt2d(2, 3))
      harray.SetValue(4, gp_Pnt2d(4, 3))
      harray.SetValue(5, gp_Pnt2d(5, 5))
  
      anInterpolation = Geom2dAPI_Interpolate(harray.GetHandle(), False, 0.01)
      anInterpolation.Perform()
      bspline_2 = anInterpolation.Curve()
  
      harray2 = TColgp_HArray1OfPnt2d(1, 5)
      harray2.SetValue(1, gp_Pnt2d(11, 0))
      harray2.SetValue(2, gp_Pnt2d(12, 2))
      harray2.SetValue(3, gp_Pnt2d(13, 3))
      harray2.SetValue(4, gp_Pnt2d(15, 3))
      harray2.SetValue(5, gp_Pnt2d(16, 5))
  
      anInterpolation2 = Geom2dAPI_Interpolate(harray.GetHandle(), True, 0.01)
      anInterpolation2.Perform()
      bspline_3 = anInterpolation2.Curve()
  
      for j in range(array.Lower(), array.Upper()+1):
          p = array.Value(j)
          display.DisplayShape(p, update=False)
      for j in range(harray.Lower(), harray.Upper()+1):
          p = harray.Value(j)
          display.DisplayShape(p, update=False)
  
      display.DisplayShape(bspline_1, update=False)
      display.DisplayShape(bspline_2, update=False, color='GREEN')
      display.DisplayShape(bspline_3, update=True, color='BLUE')
  
  if __name__ == '__main__':
      bspline()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_bspline-1-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-10-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-11-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-12-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-13-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-2-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-3-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-4-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-5-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-6-1511701787.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-7-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-8-1511701788.jpeg

  .. image:: images/screenshots/capture-core_geometry_bspline-9-1511701788.jpeg

