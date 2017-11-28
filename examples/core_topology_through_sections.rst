core_topology_through_sections.py
=================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_through_sections.py

------


Code
^^^^


.. code-block:: python

  from OCC.gp import gp_Dir, gp_Pnt, gp_Circ, gp_Ax2
  from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeWire,
                                  BRepBuilderAPI_MakeEdge)
  from OCC.BRepOffsetAPI import BRepOffsetAPI_ThruSections
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def through_sections():
      #ruled
      circle_1 = gp_Circ(gp_Ax2(gp_Pnt(-100., 0., -100.), gp_Dir(0., 0., 1.)), 40.)
      wire_1 = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_1).Edge()).Wire()
      circle_2 = gp_Circ(gp_Ax2(gp_Pnt(-10., 0., -0.), gp_Dir(0., 0., 1.)), 40.)
      wire_2 = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_2).Edge()).Wire()
      circle_3 = gp_Circ(gp_Ax2(gp_Pnt(-75., 0., 100.), gp_Dir(0., 0., 1.)), 40.)
      wire_3 = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_3).Edge()).Wire()
      circle_4 = gp_Circ(gp_Ax2(gp_Pnt(0., 0., 200.), gp_Dir(0., 0., 1.)), 40.)
      wire_4 = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_4).Edge()).Wire()
  
      generatorA = BRepOffsetAPI_ThruSections(False, True)
      # the use of the map function fails at producing the ThruSection
      # on py3k. Why ?
      # map(generatorA.AddWire, [wire_1, wire_2, wire_3, wire_4])
      # we have to use a loop
      for wir in [wire_1, wire_2, wire_3, wire_4]:
          generatorA.AddWire(wir)
      generatorA.Build()
      display.DisplayShape(generatorA.Shape())
  
      #smooth
      circle_1b = gp_Circ(gp_Ax2(gp_Pnt(100., 0., -100.), gp_Dir(0., 0., 1.)), 40.)
      wire_1b = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_1b).Edge()).Wire()
      circle_2b = gp_Circ(gp_Ax2(gp_Pnt(210., 0., -0.), gp_Dir(0., 0., 1.)), 40.)
      wire_2b = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_2b).Edge()).Wire()
      circle_3b = gp_Circ(gp_Ax2(gp_Pnt(275., 0., 100.), gp_Dir(0., 0., 1.)), 40.)
      wire_3b = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_3b).Edge()).Wire()
      circle_4b = gp_Circ(gp_Ax2(gp_Pnt(200., 0., 200.), gp_Dir(0., 0., 1.)), 40.)
      wire_4b = BRepBuilderAPI_MakeWire(BRepBuilderAPI_MakeEdge(circle_4b).Edge()).Wire()
      generatorB = BRepOffsetAPI_ThruSections(True, False)
      # same here, the following line fails
      # map(generatorB.AddWire, [wire_1b, wire_2b, wire_3b, wire_4b])
      for wir in [wire_1b, wire_2b, wire_3b, wire_4b]:
          generatorB.AddWire(wir)
      generatorB.Build()
      display.DisplayShape(generatorB.Shape(), update=True)
  
  if __name__ == '__main__':
      through_sections()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_through_sections-1-1511702293.jpeg

  .. image:: images/screenshots/capture-core_topology_through_sections-2-1511702293.jpeg

