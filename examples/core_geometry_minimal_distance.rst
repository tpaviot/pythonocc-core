core_geometry_minimal_distance.py
=================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_minimal_distance.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.Core.BRepExtrema import BRepExtrema_DistShapeShape
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.gp import gp_Pnt, gp_Ax2, gp_Circ
  
  from OCC.Extend.ShapeFactory import make_edge, make_vertex
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def compute_minimal_distance_between_cubes():
      """ compute the minimal distance between 2 cubes
  
      the line between the 2 points is rendered in cyan
  
      """
      b1 = BRepPrimAPI_MakeBox(gp_Pnt(100, 0, 0), 10., 10., 10.).Shape()
      b2 = BRepPrimAPI_MakeBox(gp_Pnt(45, 45, 45), 10., 10., 10.).Shape()
      display.DisplayShape([b1, b2])
  
      dss = BRepExtrema_DistShapeShape()
      dss.LoadS1(b1)
      dss.LoadS2(b2)
      dss.Perform()
  
      assert dss.IsDone()
  
      edg = make_edge(dss.PointOnShape1(1), dss.PointOnShape2(1))
      display.DisplayColoredShape([edg], color="CYAN")
  
  
  def compute_minimal_distance_between_circles():
      """ compute the minimal distance between 2 circles
  
      here the minimal distance overlaps the intersection of the circles
      the points are rendered to indicate the locations
  
      """
      # required for precise rendering of the circles
      display.Context.SetDeviationCoefficient(0.0001)
      L = gp_Pnt(4, 10, 0)
      M = gp_Pnt(10, 16, 0)
  
      Laxis = gp_Ax2()
      Maxis = gp_Ax2()
      Laxis.SetLocation(L)
      Maxis.SetLocation(M)
  
      r1 = 12.0
      r2 = 15.0
      Lcircle = gp_Circ(Laxis, r1)
      Mcircle = gp_Circ(Maxis, r2)
  
      l_circle, m_circle = make_edge(Lcircle), make_edge(Mcircle)
      display.DisplayShape((l_circle, m_circle))
  
      # compute the minimal distance between 2 circles
      # the minimal distance here matches the intersection of the circles
      dss = BRepExtrema_DistShapeShape(l_circle, m_circle)
  
      print("intersection parameters on l_circle:",
            [dss.ParOnEdgeS1(i) for i in range(1, dss.NbSolution() + 1)])
      print("intersection parameters on m_circle:",
            [dss.ParOnEdgeS2(i) for i in range(1, dss.NbSolution() + 1)])
  
      for i in range(1, dss.NbSolution() + 1):
          pnt = dss.PointOnShape1(i)
          display.DisplayShape(make_vertex(pnt))
  
  
  if __name__ == "__main__":
      compute_minimal_distance_between_cubes()
      compute_minimal_distance_between_circles()
      display.FitAll()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_minimal_distance-1-1511701886.jpeg

  .. image:: images/screenshots/capture-core_geometry_minimal_distance-2-1511701887.jpeg

  .. image:: images/screenshots/capture-core_geometry_minimal_distance-3-1511701887.jpeg

  .. image:: images/screenshots/capture-core_geometry_minimal_distance-4-1511701887.jpeg

  .. image:: images/screenshots/capture-core_geometry_minimal_distance-5-1511701887.jpeg

