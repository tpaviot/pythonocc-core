core_geometry_bounding_box.py
=============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_bounding_box.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from OCC.Bnd import Bnd_Box
  from OCC.BRepBndLib import brepbndlib_Add
  from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCylinder
  from OCC.BRepMesh import BRepMesh_IncrementalMesh
  
  
  def get_boundingbox(shape, tol=1e-6, use_mesh=True):
      """ return the bounding box of the TopoDS_Shape `shape`
      Parameters
      ----------
      shape : TopoDS_Shape or a subclass such as TopoDS_Face
          the shape to compute the bounding box from
      tol: float
          tolerance of the computed boundingbox
      use_mesh : bool
          a flag that tells whether or not the shape has first to be meshed before the bbox
          computation. This produces more accurate results
      """
      bbox = Bnd_Box()
      bbox.SetGap(tol)
      if use_mesh:
          mesh = BRepMesh_IncrementalMesh()
          mesh.SetParallel(True)
          mesh.SetShape(shape)
          mesh.Perform()
          assert mesh.IsDone()
      brepbndlib_Add(shape, bbox, use_mesh)
  
      xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
      return xmin, ymin, zmin, xmax, ymax, zmax, xmax-xmin, ymax-ymin, zmax-zmin
  
  print("Box bounding box computation")
  box_shape = BRepPrimAPI_MakeBox(10., 20., 30.).Shape()
  bb1 = get_boundingbox(box_shape)
  print(bb1)
  
  print("Cylinder bounding box computation")
  cyl_shape = BRepPrimAPI_MakeCylinder(10., 20.).Shape()
  bb2 = get_boundingbox(cyl_shape)
  print(bb2)
  
  print("Torus bounding box computation")
  torus_shape = BRepPrimAPI_MakeCylinder(15., 5.).Shape()
  bb3 = get_boundingbox(torus_shape)
  print(bb3)

Screenshots
^^^^^^^^^^^


No available screenshot.
