core_matplotlib_box.py
======================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_matplotlib_box.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  # Small example how to use the Tesselator interface to draw
  # a shape with matplotlib
  
  import sys
  
  from OCC.Visualization import Tesselator
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
  try:
      from mpl_toolkits.mplot3d import Axes3D
      from matplotlib import pyplot as plt
      from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
  except ImportError:
      print("This example requires matplotlib.")
      sys.exit(0)
  
  def draw_shape_mpl(shape):
      """
      Draw a TopoDS_Shape with matplotlib
      """
  
      tess = Tesselator(shape)
  
      triangles = []
      edges = []
  
      # get the triangles
      triangle_count = tess.ObjGetTriangleCount()
      for i_triangle in range(0, triangle_count):
          i1, i2, i3 = tess.GetTriangleIndex(i_triangle)
          triangles.append([tess.GetVertex(i1), tess.GetVertex(i2), tess.GetVertex(i3)])
  
      # get the edges
      edge_count = tess.ObjGetEdgeCount()
      for i_edge in range(0, edge_count):
          vertex_count = tess.ObjEdgeGetVertexCount(i_edge)
          edge = []
          for i_vertex in range(0, vertex_count):
              vertex = tess.GetEdgeVertex(i_edge, i_vertex)
              edge.append(vertex)
          edges.append(edge)
  
      # plot it
      fig = plt.figure()
      ax = Axes3D(fig)
  
      ax.add_collection3d(Poly3DCollection(triangles, linewidths=0.2, alpha=0.5))
      ax.add_collection3d(Line3DCollection(edges, colors='w', linewidths=1.0))
  
      ax.get_xaxis().set_visible(True)
      ax.get_yaxis().set_visible(True)
      ax.set_autoscale_on(True)
      plt.show()
  
  
  box = BRepPrimAPI_MakeBox(1,1,1).Shape()
  draw_shape_mpl(box)

Screenshots
^^^^^^^^^^^


No available screenshot.
