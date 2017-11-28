core_topology_draft_angle.py
============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_draft_angle.py

------


Code
^^^^


.. code-block:: python

  import math
  from OCC.gp import gp_Dir, gp_Pln, gp_Ax3, gp_XOY
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  from OCC.BRepOffsetAPI import BRepOffsetAPI_DraftAngle
  from OCC.Precision import precision_Angular
  from OCC.BRep import BRep_Tool_Surface
  from OCC.TopExp import TopExp_Explorer
  from OCC.TopAbs import TopAbs_FACE
  from OCC.Geom import Handle_Geom_Plane_DownCast
  from OCC.TopoDS import topods_Face
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def draft_angle(event=None):
      S = BRepPrimAPI_MakeBox(200., 300., 150.).Shape()
      adraft = BRepOffsetAPI_DraftAngle(S)
      topExp = TopExp_Explorer()
      topExp.Init(S, TopAbs_FACE)
      while topExp.More():
          face = topods_Face(topExp.Current())
          surf = Handle_Geom_Plane_DownCast(BRep_Tool_Surface(face)).GetObject()
          dirf = surf.Pln().Axis().Direction()
          ddd = gp_Dir(0, 0, 1)
          if dirf.IsNormal(ddd, precision_Angular()):
              adraft.Add(face, ddd, math.radians(15), gp_Pln(gp_Ax3(gp_XOY())))
          topExp.Next()
      adraft.Build()
      display.DisplayShape(adraft.Shape(), update=True)
  
  
  if __name__ == '__main__':
      draft_angle()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_draft_angle-1-1511702236.jpeg

