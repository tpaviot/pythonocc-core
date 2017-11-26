core_geometry_point_from_curve.py
=================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_point_from_curve.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from OCC.gp import gp_Pnt, gp_Pnt2d, gp_OX2d
  from OCC.Geom2d import Geom2d_Circle
  from OCC.Geom2dAdaptor import Geom2dAdaptor_Curve
  from OCC.GCPnts import GCPnts_UniformAbscissa
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def points_from_curve():
      radius = 5.
      abscissa = 3.
      circle = Geom2d_Circle(gp_OX2d(), radius, True)
      gac = Geom2dAdaptor_Curve(circle.GetHandle())
      ua = GCPnts_UniformAbscissa(gac, abscissa)
      a_sequence = []
      if ua.IsDone():
          n = ua.NbPoints()
          for count in range(1, n + 1):
              p = gp_Pnt2d()
              circle.D0(ua.Parameter(count), p)
              a_sequence.append(p)
      # convert analytic to bspline
      display.DisplayShape(circle, update=True)
      i = 0
      for p in a_sequence:
          i = i + 1
          pstring = 'P%i : parameter %f' % (i, ua.Parameter(i))
          pnt = gp_Pnt(p.X(), p.Y(), 0)
          # display points
          display.DisplayShape(pnt, update=True)
          display.DisplayMessage(pnt, pstring)
  
  if __name__ == '__main__':
      points_from_curve()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_point_from_curve-1-1511701893.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-10-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-11-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-12-1511701895.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-13-1511701895.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-2-1511701893.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-3-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-4-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-5-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-6-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-7-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-8-1511701894.jpeg

  .. image:: images/screenshots/capture-core_geometry_point_from_curve-9-1511701894.jpeg

