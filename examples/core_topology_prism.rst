core_topology_prism.py
======================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_prism.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.Core.gp import gp_Pnt, gp_Vec
  from OCC.Core.GeomAPI import GeomAPI_PointsToBSpline
  from OCC.Core.TColgp import TColgp_Array1OfPnt
  from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakePrism
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def prism():
      # the bspline profile
      array = TColgp_Array1OfPnt(1, 5)
      array.SetValue(1, gp_Pnt(0, 0, 0))
      array.SetValue(2, gp_Pnt(1, 2, 0))
      array.SetValue(3, gp_Pnt(2, 3, 0))
      array.SetValue(4, gp_Pnt(4, 3, 0))
      array.SetValue(5, gp_Pnt(5, 5, 0))
      bspline = GeomAPI_PointsToBSpline(array).Curve()
      profile = BRepBuilderAPI_MakeEdge(bspline).Edge()
  
      # the linear path
      starting_point = gp_Pnt(0., 0., 0.)
      end_point = gp_Pnt(0., 0., 6.)
      vec = gp_Vec(starting_point, end_point)
      path = BRepBuilderAPI_MakeEdge(starting_point, end_point).Edge()
  
      # extrusion
      prism = BRepPrimAPI_MakePrism(profile, vec).Shape()
  
      display.DisplayShape(profile, update=False)
      display.DisplayShape(starting_point, update=False)
      display.DisplayShape(end_point, update=False)
      display.DisplayShape(path, update=False)
      display.DisplayShape(prism, update=True)
  
  if __name__ == '__main__':
      prism()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_prism-1-1511702278.jpeg

  .. image:: images/screenshots/capture-core_topology_prism-2-1511702278.jpeg

  .. image:: images/screenshots/capture-core_topology_prism-3-1511702278.jpeg

  .. image:: images/screenshots/capture-core_topology_prism-4-1511702278.jpeg

  .. image:: images/screenshots/capture-core_topology_prism-5-1511702278.jpeg

