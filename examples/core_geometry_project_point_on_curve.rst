core_geometry_project_point_on_curve.py
=======================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_project_point_on_curve.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.gp import gp_Pnt, gp_XOY
  from OCC.GeomAPI import GeomAPI_ProjectPointOnCurve
  from OCC.Geom import Geom_Circle
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def project_point_on_curve():
      '''
      '''
      point_to_project = gp_Pnt(1., 2., 3.)
      radius = 5.
  
      # create a circle, centered at origin with a given radius
      circle = Geom_Circle(gp_XOY(), radius)
      display.DisplayShape(circle)
      display.DisplayShape(point_to_project, update=True)
      display.DisplayMessage(point_to_project, "P")
  
      # project the point P on the circle
      projection = GeomAPI_ProjectPointOnCurve(point_to_project,
                                               circle.GetHandle())
      # get the results of the projection
      # the point
      projected_point = projection.NearestPoint()
      # the number of possible results
      nb_results = projection.NbPoints()
      print("NbResults : %i" % nb_results)
  
      pstring = "N : at Distance : %f" % projection.LowerDistance()
      display.DisplayMessage(projected_point, pstring)
  
      # thre maybe many different possible solutions
      if nb_results > 0:
          for i in range(1, nb_results+1):
              Q = projection.Point(i)
              distance = projection.Distance(i)
              pstring = "Q%i: at Distance :%f" % (i, distance)
              display.DisplayShape(Q)
              display.DisplayMessage(Q, pstring)
  
  
  if __name__ == '__main__':
      project_point_on_curve()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_project_point_on_curve-1-1511701901.jpeg

  .. image:: images/screenshots/capture-core_geometry_project_point_on_curve-2-1511701901.jpeg

  .. image:: images/screenshots/capture-core_geometry_project_point_on_curve-3-1511701901.jpeg

  .. image:: images/screenshots/capture-core_geometry_project_point_on_curve-4-1511701901.jpeg

