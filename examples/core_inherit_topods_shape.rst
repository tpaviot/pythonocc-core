core_inherit_topods_shape.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_inherit_topods_shape.py

------


Code
^^^^


.. code-block:: python

  from __future__ import print_function
  
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
  from OCC.TopoDS import TopoDS_Edge
  from OCC.gp import gp_Pnt
  from OCC.BRep import BRep_Tool
  
  from OCC.Display.SimpleGui import init_display
  
  
  class InheritEdge(TopoDS_Edge):
      def __init__(self, edge):
          # following constructor creates an empy TopoDS_Edge
          super(InheritEdge, self).__init__()
          # we need to copy the base shape using the following three lines
          print(self.IsNull())
          self.TShape(edge.TShape())
          self.Location(edge.Location())
          self.Orientation(edge.Orientation())
          print(self.IsNull())
          # then it becomes possible to extend the base class
  
      def get_curve(self):
          return BRep_Tool.Curve(self)
  
  if __name__ == "__main__":
      base_edge = BRepBuilderAPI_MakeEdge(gp_Pnt(), gp_Pnt(100., 0., 0.)).Edge()
      inherited_edge = InheritEdge(base_edge)
      print(inherited_edge.get_curve())
      display, start_display, add_menu, add_function_to_menu = init_display()
      display.DisplayShape(inherited_edge, update=True)
      start_display()
  

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_inherit_topods_shape-1-1511701981.jpeg

