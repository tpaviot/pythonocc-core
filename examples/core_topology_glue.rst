core_topology_glue.py
=====================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_glue.py

------


Code
^^^^


.. code-block:: python

  
      :param _shape: TopoDS_Shape, or a subclass like TopoDS_Solid
      :return: a list of faces found in `_shape`
      """
      topExp = TopExp_Explorer()
      topExp.Init(_shape, TopAbs_FACE)
      _faces = []
  
      while topExp.More():
          fc = topods_Face(topExp.Current())
          _faces.append(fc)
          topExp.Next()
  
      return _faces
  
  
  def tag_faces(_shape, _color, shape_name):
      """ tag the faces of a shape
  
      in this example, this easy to see which faces of the 2 shapes we need to glue together
      so by reading the tagged faces, its easy to find the correct index for the
      list `facesA` (5) and `facesB` (4)
  
      :param _shape: the shape to tag
      :param color: a string, to colors the faces the `_shape` we're exploring
      :param shape_name: name to tag the faces the `_shape`
      """
      for n, f in enumerate(_shape):
          # centroid of the face
          center_pt = center_boundingbox(f)
          # displays the face in the viewer
          display.DisplayShape(f, color=_color, transparency=0.9)
          # tag the face in the viewer
          display.DisplayMessage(center_pt, "{0}_nr_{1}".format(shape_name, n))
  
  
  def tag_edge(_edge, msg, _color=(1, 0, 0)):
      """ tag an edge
      """
      pt = center_boundingbox(_edge)
      display.DisplayMessage(pt, msg, None, _color, False)
  
  
  def glue_solids(event=None):
      display.EraseAll()
      display.Context.RemoveAll()
      # Without common edges
      S1 = BRepPrimAPI_MakeBox(gp_Pnt(500., 500., 0.), gp_Pnt(100., 250., 300.)).Shape()
      facesA = get_faces(S1)
      tag_faces(facesA, "BLUE", "facesA")
  
      # the face to glue
      F1 = facesA[5]
  
      S2 = BRepPrimAPI_MakeBox(gp_Pnt(400., 400., 300.), gp_Pnt(200., 300., 500.)).Shape()
      facesB = get_faces(S2)
  
      tag_faces(facesB, "GREEN", "facesB")
  
      # the face to glue of the opposite shape
      F2 = facesB[4]
  
      # perform glueing operation
      glue1 = BRepFeat_Gluer(S2, S1)
      glue1.Bind(F2, F1)
      shape = glue1.Shape()
  
      display.SetModeHLR()
  
      # move the glued shape, such to be able to inspect input and output
      # of glueing operation
      trsf = gp_Trsf()
      trsf.SetTranslation(gp_Vec(500, 0, 0))
      shape.Move(TopLoc_Location(trsf))
  
      tag_faces(get_faces(shape), "BLACK", "")
  
      # render glued shape
      display.DisplayShape(shape)
      display.FitAll()
  
  
  def glue_solids_edges(event=None):
      display.EraseAll()
      display.Context.RemoveAll()
  
      # With common edges
      S3 = BRepPrimAPI_MakeBox(500., 400., 300.).Shape()
      S4 = BRepPrimAPI_MakeBox(gp_Pnt(0., 0., 300.), gp_Pnt(200., 200., 500.)).Shape()
  
      faces_S3 = get_faces(S3)
      faces_S4 = get_faces(S4)
  
      # tagging allows to visually find the right faces to glue
      tag_faces(faces_S3, "BLUE", "s3")
      tag_faces(faces_S4, "GREEN", "s4")
  
      F3, F4 = faces_S3[5], faces_S4[4]
  
      glue2 = BRepFeat_Gluer(S4, S3)
      glue2.Bind(F4, F3)
      glue2.Build()
      shape = glue2.Shape()
  
      # move the glued shape, such to be able to inspect input and output
      # of glueing operation
      trsf = gp_Trsf()
      trsf.SetTranslation(gp_Vec(750, 0, 0))
      shape.Move(TopLoc_Location(trsf))
  
      common_edges = LocOpe_FindEdges(F4, F3)
      common_edges.InitIterator()
  
      n = 0
      while common_edges.More():
          edge_from = common_edges.EdgeFrom()
          edge_to = common_edges.EdgeTo()
  
          tag_edge(edge_from, "edge_{0}_from".format(n))
          tag_edge(edge_to, "edge_{0}_to".format(n))
  
          glue2.Bind(edge_from, edge_to)
          common_edges.Next()
          n += 1
  
      tag_faces(get_faces(shape), "BLACK", "")
      display.FitAll()
  
  
  if __name__ == "__main__":
      menu_name = 'glue topology'
      add_menu(menu_name)
      add_function_to_menu(menu_name, glue_solids)
      add_function_to_menu(menu_name, glue_solids_edges)
      # add_function_to_menu(menu_name, exit)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_glue-1-1511702258.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-10-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-11-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-12-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-13-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-14-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-15-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-16-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-17-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-18-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-19-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-2-1511702258.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-20-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-21-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-22-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-23-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-24-1511702260.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-25-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-26-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-27-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-28-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-29-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-3-1511702258.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-30-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-31-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-32-1511702261.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-33-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-34-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-35-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-36-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-37-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-38-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-39-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-4-1511702258.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-40-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-41-1511702262.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-42-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-43-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-44-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-45-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-46-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-47-1511702263.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-5-1511702258.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-6-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-7-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-8-1511702259.jpeg

  .. image:: images/screenshots/capture-core_topology_glue-9-1511702259.jpeg

