core_topology_boolean.py
========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_topology_boolean.py

------


Code
^^^^


.. code-block:: python

  import time
  
  from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Fuse, BRepAlgoAPI_Common, BRepAlgoAPI_Section, BRepAlgoAPI_Cut
  from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeFace, BRepBuilderAPI_Transform
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeWedge, BRepPrimAPI_MakeSphere, BRepPrimAPI_MakeTorus
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.gp import gp_Vec, gp_Ax2, gp_Pnt, gp_Dir, gp_Pln, gp_Trsf
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def translate_topods_from_vector(brep_or_iterable, vec, copy=False):
      '''
      translate a brep over a vector
      @param brep:    the Topo_DS to translate
      @param vec:     the vector defining the translation
      @param copy:    copies to brep if True
      '''
      trns = gp_Trsf()
      trns.SetTranslation(vec)
      brep_trns = BRepBuilderAPI_Transform(brep_or_iterable, trns, copy)
      brep_trns.Build()
      return brep_trns.Shape()
  
  
  def fuse(event=None):
      display.EraseAll()
      box1 = BRepPrimAPI_MakeBox(2, 1, 1).Shape()
      box2 = BRepPrimAPI_MakeBox(2, 1, 1).Shape()
      box1 = translate_topods_from_vector(box1, gp_Vec(.5, .5, 0))
      fuse_shp = BRepAlgoAPI_Fuse(box1, box2).Shape()
      display.DisplayShape(fuse_shp)
      display.FitAll()
  
  
  def common(event=None):
      # Create Box
      axe = gp_Ax2(gp_Pnt(10, 10, 10), gp_Dir(1, 2, 1))
      Box = BRepPrimAPI_MakeBox(axe, 60, 80, 100).Shape()
      # Create wedge
      Wedge = BRepPrimAPI_MakeWedge(60., 100., 80., 20.).Shape()
      # Common surface
      CommonSurface = BRepAlgoAPI_Common(Box, Wedge).Shape()
  
      display.EraseAll()
      ais_box = display.DisplayShape(Box)
      ais_wedge = display.DisplayShape(Wedge)
      display.Context.SetTransparency(ais_box, 0.8)
      display.Context.SetTransparency(ais_wedge, 0.8)
      display.DisplayShape(CommonSurface)
      display.FitAll()
  
  
  def slicer(event=None):
      # Param
      Zmin, Zmax, deltaZ = -100, 100, 5
      # Note: the shape can also come from a shape selected from InteractiveViewer
      if 'display' in dir():
          shape = display.GetSelectedShape()
      else:
          # Create the shape to slice
          shape = BRepPrimAPI_MakeSphere(60.).Shape()
      # Define the direction
      D = gp_Dir(0., 0., 1.)  # the z direction
      # Perform slice
      sections = []
      init_time = time.time()  # for total time computation
      for z in range(Zmin, Zmax, deltaZ):
          # Create Plane defined by a point and the perpendicular direction
          P = gp_Pnt(0, 0, z)
          Pln = gp_Pln(P, D)
          face = BRepBuilderAPI_MakeFace(Pln).Shape()
          # Computes Shape/Plane intersection
          section_shp = BRepAlgoAPI_Section(shape, face)
          if section_shp.IsDone():
              sections.append(section_shp)
      total_time = time.time() - init_time
      print("%.3fs necessary to perform slice." % total_time)
  
      display.EraseAll()
      display.DisplayShape(shape)
      for section_ in sections:
          display.DisplayShape(section_.Shape())
      display.FitAll()
  
  
  def section(event=None):
      torus = BRepPrimAPI_MakeTorus(120, 20).Shape()
      radius = 120.0
      sections = []
      for i in range(-3, 4):
          # Create Sphere
          sphere = BRepPrimAPI_MakeSphere(gp_Pnt(26 * 3 * i, 0, 0), radius).Shape()
          # Computes Torus/Sphere section
          section_shp = BRepAlgoAPI_Section(torus, sphere, False)
          section_shp.ComputePCurveOn1(True)
          section_shp.Approximation(True)
          section_shp.Build()
          sections.append(section_shp)
  
      display.EraseAll()
      display.DisplayShape(torus)
      for section_ in sections:
          display.DisplayShape(section_.Shape())
      display.FitAll()
  
  
  def cut(event=None):
      # Create Box
      Box = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
      # Create Sphere
      Sphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()
      # Cut: the shere is cut 'by' the box
      Cut = BRepAlgoAPI_Cut(Sphere, Box).Shape()
      display.EraseAll()
      ais_box = display.DisplayShape(Box)
      display.Context.SetTransparency(ais_box, 0.8)
      display.DisplayShape(Cut)
      display.FitAll()
  
  
  def exit(event=None):
      sys.exit()
  
  
  if __name__ == '__main__':
      add_menu('topology boolean operations')
      add_function_to_menu('topology boolean operations', fuse)
      add_function_to_menu('topology boolean operations', common)
      add_function_to_menu('topology boolean operations', cut)
      add_function_to_menu('topology boolean operations', section)
      add_function_to_menu('topology boolean operations', slicer)
      add_function_to_menu('topology boolean operations', exit)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_topology_boolean-1-1511702220.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-10-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-11-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-12-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-13-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-14-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-15-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-16-1511702223.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-17-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-18-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-19-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-2-1511702221.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-20-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-21-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-22-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-23-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-24-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-25-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-26-1511702224.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-27-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-28-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-29-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-3-1511702221.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-30-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-31-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-32-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-33-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-34-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-35-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-36-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-37-1511702225.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-38-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-39-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-4-1511702221.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-40-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-41-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-42-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-43-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-44-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-45-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-46-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-47-1511702226.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-48-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-49-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-5-1511702221.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-50-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-51-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-52-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-53-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-54-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-55-1511702227.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-6-1511702221.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-7-1511702222.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-8-1511702222.jpeg

  .. image:: images/screenshots/capture-core_topology_boolean-9-1511702223.jpeg

