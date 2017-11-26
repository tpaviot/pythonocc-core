core_topology_tetrahedron.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_tetrahedron.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from OCC.gp import gp_Pnt
  from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                  BRepBuilderAPI_MakeWire,
                                  BRepBuilderAPI_MakeFace,
                                  BRepBuilderAPI_Sewing)
  from OCC.Display.SimpleGui import init_display
  
  # create vertices
  v1 = gp_Pnt(1, 0, 0)
  v2 = gp_Pnt(0, 1, 0)
  v3 = gp_Pnt(0, 0, 1)
  v4 = gp_Pnt(0, 0, 0)
  
  # create edges
  e0 = BRepBuilderAPI_MakeEdge(v1, v4).Edge()
  e1 = BRepBuilderAPI_MakeEdge(v4, v2).Edge()
  e2 = BRepBuilderAPI_MakeEdge(v4, v3).Edge()
  e3 = BRepBuilderAPI_MakeEdge(v2, v1).Edge()
  e4 = BRepBuilderAPI_MakeEdge(v3, v2).Edge()
  e5 = BRepBuilderAPI_MakeEdge(v3, v1).Edge()
  
  # create wires
  w0 = BRepBuilderAPI_MakeWire(e5, e3, e4).Wire()
  w1 = BRepBuilderAPI_MakeWire(e1, e3, e0).Wire()
  w2 = BRepBuilderAPI_MakeWire(e0, e5, e2).Wire()
  w3 = BRepBuilderAPI_MakeWire(e2, e4, e1).Wire()
  
  # then create faces
  f0 = BRepBuilderAPI_MakeFace(w0).Face()
  f1 = BRepBuilderAPI_MakeFace(w1).Face()
  f2 = BRepBuilderAPI_MakeFace(w2).Face()
  f3 = BRepBuilderAPI_MakeFace(w3).Face()
  
  # sew the faces together to create a shell
  sew = BRepBuilderAPI_Sewing()
  sew.Add(f0)
  sew.Add(f1)
  sew.Add(f2)
  sew.Add(f3)
  sew.Perform()
  tetrahedron_shell = sew.SewedShape()
  
  # display the result
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  display.DisplayShape(tetrahedron_shell, update=True)
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_tetrahedron-1-1511702289.jpeg

