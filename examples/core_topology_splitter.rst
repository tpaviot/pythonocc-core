core_topology_splitter.py
=========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_splitter.py

------


Code
^^^^


.. code-block:: python

  
  import sys
  import time
  
  from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, \
      BRepBuilderAPI_MakeFace
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.GEOMAlgo import GEOMAlgo_Splitter
  from OCC.Core.TopAbs import TopAbs_EDGE
  from OCC.Core.TopExp import TopExp_Explorer
  from OCC.Core.gp import gp_Dir, gp_Pln, gp_Pnt
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def split_face_and_edge(event=None):
      display.EraseAll()
      p0 = gp_Pnt()
      vnorm = gp_Dir(1, 0, 0)
      pln = gp_Pln(p0, vnorm)
      face = BRepBuilderAPI_MakeFace(pln, -10, 10, -10, 10).Face()
      p1 = gp_Pnt(0, 0, 15)
      p2 = gp_Pnt(0, 0, -15)
      edge = BRepBuilderAPI_MakeEdge(p1, p2).Edge()
      # Initialize splitter
      splitter = GEOMAlgo_Splitter()
      # Add both the face and edge as arguments. This will split both of the
      # shapes.
      splitter.AddArgument(face)
      splitter.AddArgument(edge)
      splitter.Perform()
      display.DisplayShape(splitter.Shape())
      display.FitAll()
  
  
  def split_face_with_edge(event=None):
      display.EraseAll()
      p0 = gp_Pnt()
      vnorm = gp_Dir(1, 0, 0)
      pln = gp_Pln(p0, vnorm)
      face = BRepBuilderAPI_MakeFace(pln, -10, 10, -10, 10).Face()
      p1 = gp_Pnt(0, 0, 15)
      p2 = gp_Pnt(0, 0, -15)
      edge = BRepBuilderAPI_MakeEdge(p1, p2).Edge()
      # Initialize splitter
      splitter = GEOMAlgo_Splitter()
      # Add the face as an argument and the edge as a tool. This will split
      # the face with the edge.
      splitter.AddArgument(face)
      splitter.AddTool(edge)
      splitter.Perform()
      display.DisplayShape(splitter.Shape())
      display.FitAll()
  
  
  def split_edge_with_face(event=None):
      display.EraseAll()
      p0 = gp_Pnt()
      vnorm = gp_Dir(1, 0, 0)
      pln = gp_Pln(p0, vnorm)
      face = BRepBuilderAPI_MakeFace(pln, -10, 10, -10, 10).Face()
      p1 = gp_Pnt(0, 0, 15)
      p2 = gp_Pnt(0, 0, -15)
      edge = BRepBuilderAPI_MakeEdge(p1, p2).Edge()
      # Initialize splitter
      splitter = GEOMAlgo_Splitter()
      # Add the edge as an argument and the face as a tool. This will split
      # the edge with the face.
      splitter.AddArgument(edge)
      splitter.AddTool(face)
      splitter.Perform()
  
      edges = []
      exp = TopExp_Explorer(splitter.Shape(), TopAbs_EDGE)
      while exp.More():
          edges.append(exp.Current())
          exp.Next()
      print('Number of edges in split shape: ', len(edges))
      display.DisplayShape(edges[0], color='red')
      display.DisplayShape(edges[1], color='green')
      display.DisplayShape(edges[2], color='yellow')
      display.FitAll()
  
  
  def exit(event=None):
      sys.exit()
  
  
  if __name__ == '__main__':
      add_menu('GEOMAlgo Splitter Example')
      add_function_to_menu('GEOMAlgo Splitter Example', split_face_and_edge)
      add_function_to_menu('GEOMAlgo Splitter Example', split_face_with_edge)
      add_function_to_menu('GEOMAlgo Splitter Example', split_edge_with_face)
      add_function_to_menu('GEOMAlgo Splitter Example', exit)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_splitter-1-1511702285.jpeg

  .. image:: images/screenshots/capture-core_topology_splitter-2-1511702285.jpeg

  .. image:: images/screenshots/capture-core_topology_splitter-3-1511702286.jpeg

  .. image:: images/screenshots/capture-core_topology_splitter-4-1511702286.jpeg

  .. image:: images/screenshots/capture-core_topology_splitter-5-1511702286.jpeg

