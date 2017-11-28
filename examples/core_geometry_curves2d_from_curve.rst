core_geometry_curves2d_from_curve.py
====================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_curves2d_from_curve.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.gp import gp_OX2d
  from OCC.GCE2d import GCE2d_MakeEllipse
  from OCC.Geom2d import Geom2d_TrimmedCurve
  from OCC.Geom2dConvert import geom2dconvert_CurveToBSplineCurve
  from OCC.Convert import Convert_TgtThetaOver2
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def curves2d_from_curves():
      major, minor = 12, 4
      axis = gp_OX2d()
      ellipse = GCE2d_MakeEllipse(axis, major, minor).Value()
      trimmed_curve = Geom2d_TrimmedCurve(ellipse, -1, 2, True)
      bspline = geom2dconvert_CurveToBSplineCurve(trimmed_curve.GetHandle(),
                                                  Convert_TgtThetaOver2)
      display.DisplayShape(bspline, update=True)
  
  
  if __name__ == '__main__':
      curves2d_from_curves()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_curves2d_from_curve-1-1511701791.jpeg

