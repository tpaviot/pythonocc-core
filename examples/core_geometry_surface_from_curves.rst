core_geometry_surface_from_curves.py
====================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_surface_from_curves.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.gp import gp_Pnt, gp_Vec
  from OCC.GeomFill import (GeomFill_BSplineCurves,
                            GeomFill_StretchStyle,
                            GeomFill_CoonsStyle,
                            GeomFill_CurvedStyle)
  from OCC.GeomAPI import GeomAPI_PointsToBSpline
  from OCC.Geom import Handle_Geom_BSplineCurve_DownCast
  
  from OCC.Display.SimpleGui import init_display
  
  from core_geometry_utils import point_list_to_TColgp_Array1OfPnt, make_face
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def surface_from_curves():
      '''
      @param display:
      '''
      # First spline
      array = []
      array.append(gp_Pnt(-4, 0, 2))
      array.append(gp_Pnt(-7, 2, 2))
      array.append(gp_Pnt(-6, 3, 1))
      array.append(gp_Pnt(-4, 3, -1))
      array.append(gp_Pnt(-3, 5, -2))
  
      pt_list1 = point_list_to_TColgp_Array1OfPnt(array)
      SPL1 = GeomAPI_PointsToBSpline(pt_list1).Curve()
      SPL1_c = SPL1.GetObject()
  
      # Second spline
      a2 = []
      a2.append(gp_Pnt(-4, 0, 2))
      a2.append(gp_Pnt(-2, 2, 0))
      a2.append(gp_Pnt(2, 3, -1))
      a2.append(gp_Pnt(3, 7, -2))
      a2.append(gp_Pnt(4, 9, -1))
      pt_list2 = point_list_to_TColgp_Array1OfPnt(a2)
      SPL2 = GeomAPI_PointsToBSpline(pt_list2).Curve()
      SPL2_c = SPL2.GetObject()
  
      # Fill with StretchStyle
      aGeomFill1 = GeomFill_BSplineCurves(SPL1,
                                          SPL2,
                                          GeomFill_StretchStyle)
  
      SPL3 = Handle_Geom_BSplineCurve_DownCast(SPL1_c.Translated(gp_Vec(10, 0, 0)))
      SPL4 = Handle_Geom_BSplineCurve_DownCast(SPL2_c.Translated(gp_Vec(10, 0, 0)))
      # Fill with CoonsStyle
      aGeomFill2 = GeomFill_BSplineCurves(SPL3,
                                          SPL4,
                                          GeomFill_CoonsStyle)
      SPL5 = Handle_Geom_BSplineCurve_DownCast(SPL1_c.Translated(gp_Vec(20, 0, 0)))
      SPL6 = Handle_Geom_BSplineCurve_DownCast(SPL2_c.Translated(gp_Vec(20, 0, 0)))
      # Fill with CurvedStyle
      aGeomFill3 = GeomFill_BSplineCurves(SPL5,
                                          SPL6,
                                          GeomFill_CurvedStyle)
  
      aBSplineSurface1 = aGeomFill1.Surface()
      aBSplineSurface2 = aGeomFill2.Surface()
      aBSplineSurface3 = aGeomFill3.Surface()
      
      display.DisplayShape(make_face(aBSplineSurface1, 1e-6))
      display.DisplayShape(make_face(aBSplineSurface2, 1e-6))
      display.DisplayShape(make_face(aBSplineSurface3, 1e-6), update=True)
  
  if __name__ == '__main__':
      surface_from_curves()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_surface_from_curves-1-1511701968.jpeg

  .. image:: images/screenshots/capture-core_geometry_surface_from_curves-2-1511701968.jpeg

  .. image:: images/screenshots/capture-core_geometry_surface_from_curves-3-1511701969.jpeg

