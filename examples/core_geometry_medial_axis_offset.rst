core_geometry_medial_axis_offset.py
===================================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_medial_axis_offset.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  # this example was ported from: http://heekscnc.blogspot.nl/2009/09/occ-offset.html, by Dan Heeks
  
  from OCC.BRepOffsetAPI import BRepOffsetAPI_MakeOffset
  from OCC.Display.SimpleGui import init_display
  from OCC.GeomAbs import GeomAbs_Arc
  from OCC.gp import gp_Pnt
  from core_geometry_utils import make_edge, make_vertex, make_wire, make_face
  from core_topology_traverse import Topo
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def boolean_cut(shapeToCutFrom, cuttingShape):
      from OCC.BRepAlgoAPI import BRepAlgoAPI_Cut
      cut = BRepAlgoAPI_Cut(shapeToCutFrom, cuttingShape)
  
      if not cut.BuilderCanWork():
          raise AssertionError("input shapes invalid")
  
      _error = {0: '- Ok',
                1: '- The Object is created but Nothing is Done',
                2: '- Null source shapes is not allowed',
                3: '- Check types of the arguments',
                4: '- Can not allocate memory for the DSFiller',
                5: '- The Builder can not work with such types of arguments',
                6: '- Unknown operation is not allowed',
                7: '- Can not allocate memory for the Builder',
              }
      print('error status:', _error[cut.ErrorStatus()])
      cut.RefineEdges()
      cut.FuseEdges()
      shp = cut.Shape()
      return shp
  
  
  def make_face_to_contour_from():
      v1 = make_vertex(gp_Pnt(0, 0, 0))
      v2 = make_vertex(gp_Pnt(10, 0, 0))
      v3 = make_vertex(gp_Pnt(7, 10, 0))
      v4 = make_vertex(gp_Pnt(10, 20, 0))
      v5 = make_vertex(gp_Pnt(0, 20, 0))
      v6 = make_vertex(gp_Pnt(3, 10, 0))
      e1 = make_edge(v1, v2)
      e2 = make_edge(v2, v3)
      e3 = make_edge(v3, v4)
      e4 = make_edge(v4, v5)
      e5 = make_edge(v5, v6)
      e6 = make_edge(v6, v1)
      v7 = make_vertex(gp_Pnt(2, 2, 0))
      v8 = make_vertex(gp_Pnt(8, 2, 0))
      v9 = make_vertex(gp_Pnt(7, 3, 0))
      v10 = make_vertex(gp_Pnt(3, 3, 0))
      e7 = make_edge(v7, v8)
      e8 = make_edge(v8, v9)
      e9 = make_edge(v9, v10)
      e10 = make_edge(v10, v7)
      w1 = make_wire([e1, e2, e3, e4, e5, e6])
      f = make_face(w1)
      w2 = make_wire(e7, e8, e9, e10)
      f2 = make_face(w2)
      f3 = boolean_cut(f, f2)
      return f3
  
  
  def create_offsets(face, nr_of_counters, distance_between_contours):
      offset = BRepOffsetAPI_MakeOffset()
      offset.Init(GeomAbs_Arc)
  
      for wi in Topo(face).wires():
          offset.AddWire(wi)
  
      for i in range(nr_of_counters):
          offset.Perform(-distance_between_contours * i)
          if offset.IsDone():
              yield offset.Shape()
  
  
  face = make_face_to_contour_from()
  display.DisplayShape(face)
  
  for contour in create_offsets(face, 50, 0.12):
      display.DisplayShape(contour)
  
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-1-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-10-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-11-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-12-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-13-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-14-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-15-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-16-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-17-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-18-1511701879.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-19-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-2-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-20-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-21-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-22-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-23-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-24-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-25-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-26-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-27-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-28-1511701880.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-29-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-3-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-30-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-31-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-32-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-33-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-34-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-35-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-36-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-37-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-38-1511701881.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-39-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-4-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-40-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-41-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-42-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-43-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-44-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-45-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-46-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-47-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-48-1511701882.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-49-1511701883.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-5-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-50-1511701883.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-51-1511701883.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-6-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-7-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-8-1511701878.jpeg

  .. image:: images/screenshots/capture-core_geometry_medial_axis_offset-9-1511701879.jpeg

