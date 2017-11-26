core_topology_evolved_shape.py
==============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_evolved_shape.py

------


Code
^^^^


.. code-block:: python

  from OCC.gp import gp_Pnt
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakePolygon
  from OCC.GeomAbs import GeomAbs_Arc
  from OCC.BRepOffsetAPI import BRepOffsetAPI_MakeEvolved
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def evolved_shape():
      P = BRepBuilderAPI_MakePolygon()
      P.Add(gp_Pnt(0., 0., 0.))
      P.Add(gp_Pnt(200., 0., 0.))
      P.Add(gp_Pnt(200., 200., 0.))
      P.Add(gp_Pnt(0., 200., 0.))
      P.Add(gp_Pnt(0., 0., 0.))
      wprof = BRepBuilderAPI_MakePolygon(gp_Pnt(0., 0., 0.), gp_Pnt(-60., -60., -200.))
      S = BRepOffsetAPI_MakeEvolved(P.Wire(),
                                    wprof.Wire(),
                                    GeomAbs_Arc,
                                    True,
                                    False,
                                    True,
                                    0.0001)
      S.Build()
      display.DisplayShape(S.Shape(), update=True)
  
  if __name__ == '__main__':
      evolved_shape()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_evolved_shape-1-1511702245.jpeg

