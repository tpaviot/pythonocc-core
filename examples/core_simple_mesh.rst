core_simple_mesh.py
===================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_simple_mesh.py

------


Code
^^^^


.. code-block:: python

  from OCC.Core.BRep import BRep_Builder, BRep_Tool
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
  from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Fuse
  from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
  from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
  from OCC.Core.TopExp import TopExp_Explorer
  from OCC.Core.TopoDS import TopoDS_Compound, topods_Face, topods_Edge
  from OCC.Core.TopAbs import TopAbs_FACE
  from OCC.Core.TopLoc import TopLoc_Location
  from OCC.Core.gp import gp_Pnt
  from OCC.Display.SimpleGui import init_display
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  display.SetSelectionModeVertex()
  
  
  def simple_mesh():
      #
      # Create the shape
      #
      theBox = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
      theSphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()
      shape = BRepAlgoAPI_Fuse(theSphere, theBox).Shape()
      #
      # Mesh the shape
      #
      BRepMesh_IncrementalMesh(shape, 0.8)
      builder = BRep_Builder()
      comp = TopoDS_Compound()
      builder.MakeCompound(comp)
  
      bt = BRep_Tool()
      ex = TopExp_Explorer(shape, TopAbs_FACE)
      while ex.More():
          face = topods_Face(ex.Current())
          location = TopLoc_Location()
          facing = (bt.Triangulation(face, location)).GetObject()
          tab = facing.Nodes()
          tri = facing.Triangles()
          for i in range(1, facing.NbTriangles()+1):
              trian = tri.Value(i)
              index1, index2, index3 = trian.Get()
              for j in range(1, 4):
                  if j == 1:
                      m = index1
                      n = index2
                  elif j == 2:
                      n = index3
                  elif j == 3:
                      m = index2
                  me = BRepBuilderAPI_MakeEdge(tab.Value(m), tab.Value(n))
                  if me.IsDone():
                      builder.Add(comp, me.Edge())
          ex.Next()
      display.EraseAll()
      display.DisplayShape(shape)
      display.DisplayShape(comp, update=True)
  
  if __name__ == '__main__':
      simple_mesh()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_simple_mesh-1-1511702216.jpeg

  .. image:: images/screenshots/capture-core_simple_mesh-2-1511702216.jpeg

