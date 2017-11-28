core_geometry_geomplate.py
==========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_geomplate.py

------


Code
^^^^


.. code-block:: python

  
  import os
  import sys
  import time
  
  from OCC.BRep import BRep_Tool
  from OCC.BRepAdaptor import BRepAdaptor_HCurve
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakePolygon
  from OCC.BRepFill import BRepFill_CurveConstraint
  from OCC.Display.SimpleGui import init_display
  from OCC.GeomAbs import GeomAbs_C0
  from OCC.GeomLProp import GeomLProp_SLProps
  from OCC.GeomLProp import GeomLProp_SurfaceTool
  from OCC.GeomPlate import GeomPlate_BuildPlateSurface, GeomPlate_PointConstraint, GeomPlate_MakeApprox
  from OCC.ShapeAnalysis import ShapeAnalysis_Surface
  from OCC.gp import gp_Pnt
  
  from core_geometry_utils import make_face, make_vertex
  from core_topology_traverse import WireExplorer, Topo
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  try:
      HAS_SCIPY = True
      from scipy import arange
      from scipy.optimize import fsolve
  except ImportError:
      print('scipy not installed, will not be able to run the geomplate example')
      HAS_SCIPY = False
  
  # TODO:
  # - need examples where the tangency to constraining faces is respected
  
  
  def make_n_sided(edges, points, continuity=GeomAbs_C0):
      """
      builds an n-sided patch, respecting the constraints defined by *edges*
      and *points*
  
      a simplified call to the BRepFill_Filling class
      its simplified in the sense that to all constraining edges and points
      the same level of *continuity* will be applied
  
      *continuity* represents:
  
      GeomAbs_C0 : the surface has to pass by 3D representation of the edge
      GeomAbs_G1 : the surface has to pass by 3D representation of the edge
      and to respect tangency with the given face
      GeomAbs_G2 : the surface has to pass by 3D representation of the edge
      and to respect tangency and curvature with the given face.
  
      NOTE: it is not required to set constraining points.
      just leave the tuple or list empty
  
      :param edges: the constraining edges
      :param points: the constraining points
      :param continuity: GeomAbs_0, 1, 2
      :return: TopoDS_Face
      """
      from OCC.BRepFill import BRepFill_Filling
      n_sided = BRepFill_Filling()
      for edg in edges:
          n_sided.Add(edg, continuity)
      for pt in points:
          n_sided.Add(pt)
      n_sided.Build()
      face = n_sided.Face()
      return face
  
  
  def make_closed_polygon(*args):
      poly = BRepBuilderAPI_MakePolygon()
      for pt in args:
          if isinstance(pt, list) or isinstance(pt, tuple):
              for i in pt:
                  poly.Add(i)
          else:
              poly.Add(pt)
      poly.Build()
      poly.Close()
      result = poly.Wire()
      return result
  
  
  def iges_importer(path_):
      from OCC.IGESControl import IGESControl_Reader
      from OCC.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
      iges_reader = IGESControl_Reader()
      status = iges_reader.ReadFile(path_)
  
      if status == IFSelect_RetDone:  # check status
          failsonly = False
          iges_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
          iges_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
          ok = iges_reader.TransferRoots()
          aResShape = iges_reader.Shape(1)
          return aResShape
      else:
          raise AssertionError("could not import IGES file: {0}".format(path_))
  
  
  def geom_plate(event=None):
      display.EraseAll()
      p1 = gp_Pnt(0, 0, 0)
      p2 = gp_Pnt(0, 10, 0)
      p3 = gp_Pnt(0, 10, 10)
      p4 = gp_Pnt(0, 0, 10)
      p5 = gp_Pnt(5, 5, 5)
      poly = make_closed_polygon([p1, p2, p3, p4])
      edges = [i for i in Topo(poly).edges()]
      face = make_n_sided(edges, [p5])
      display.DisplayShape(edges)
      display.DisplayShape(make_vertex(p5))
      display.DisplayShape(face, update=True)
  
  
  # ============================================================================
  # Find a surface such that the radius at the vertex is n
  # ============================================================================
  
  
  def build_plate(polygon, points):
      '''
      build a surface from a constraining polygon(s) and point(s)
      @param polygon:     list of polygons ( TopoDS_Shape)
      @param points:      list of points ( gp_Pnt )
      '''
      # plate surface
      bpSrf = GeomPlate_BuildPlateSurface(3, 15, 2)
  
      # add curve constraints
      for poly in polygon:
          for edg in WireExplorer(poly).ordered_edges():
              c = BRepAdaptor_HCurve()
              c.ChangeCurve().Initialize(edg)
              constraint = BRepFill_CurveConstraint(c.GetHandle(), 0)
              bpSrf.Add(constraint.GetHandle())
  
      # add point constraint
      for pt in points:
          bpSrf.Add(GeomPlate_PointConstraint(pt, 0).GetHandle())
          bpSrf.Perform()
  
      maxSeg, maxDeg, critOrder = 9, 8, 0
      tol = 1e-4
      dmax = max([tol, 10 * bpSrf.G0Error()])
  
      srf = bpSrf.Surface()
      plate = GeomPlate_MakeApprox(srf, tol, maxSeg, maxDeg, dmax, critOrder)
      uMin, uMax, vMin, vMax = srf.GetObject().Bounds()
  
      return make_face(plate.Surface(), uMin, uMax, vMin, vMax, 1e-4)
  
  
  def radius_at_uv(face, u, v):
      '''
      returns the mean radius at a u,v coordinate
      @param face:    surface input
      @param u,v:     u,v coordinate
      '''
      h_srf = BRep_Tool().Surface(face)
      uv_domain = GeomLProp_SurfaceTool().Bounds(h_srf)
      curvature = GeomLProp_SLProps(h_srf, u, v, 1, 1e-6)
      try:
          _crv_min = 1. / curvature.MinCurvature()
      except ZeroDivisionError:
          _crv_min = 0.
  
      try:
          _crv_max = 1. / curvature.MaxCurvature()
      except ZeroDivisionError:
          _crv_max = 0.
      return abs((_crv_min + _crv_max) / 2.)
  
  
  def uv_from_projected_point_on_face(face, pt):
      '''
      returns the uv coordinate from a projected point on a face
      '''
      srf = BRep_Tool().Surface(face)
      sas = ShapeAnalysis_Surface(srf)
      uv = sas.ValueOfUV(pt, 1e-2)
      print('distance ', sas.Value(uv).Distance(pt))
      return uv.Coord()
  
  
  class RadiusConstrainedSurface():
      '''
      returns a surface that has `radius` at `pt`
      '''
  
      def __init__(self, display, poly, pnt, targetRadius):
          self.display = display
          self.targetRadius = targetRadius
          self.poly = poly
          self.pnt = pnt
          self.plate = self.build_surface()
  
      def build_surface(self):
          '''
          builds and renders the plate
          '''
          self.plate = build_plate([self.poly], [self.pnt])
          self.display.EraseAll()
          self.display.DisplayShape(self.plate)
          vert = make_vertex(self.pnt)
          self.display.DisplayShape(vert, update=True)
  
      def radius(self, z):
          '''
          sets the height of the point constraining the plate, returns
          the radius at this point
          '''
          if isinstance(z, float):
              self.pnt.SetX(z)
          else:
              self.pnt.SetX(float(z[0]))
          self.build_surface()
          uv = uv_from_projected_point_on_face(self.plate, self.pnt)
          radius = radius_at_uv(self.plate, uv[0], uv[1])
          print('z: ', z, 'radius: ', radius)
          self.curr_radius = radius
          return self.targetRadius - abs(radius)
  
      def solve(self):
          fsolve(self.radius, 1, maxfev=1000)
          return self.plate
  
  
  def solve_radius(event=None):
      if not HAS_SCIPY:
          print("sorry cannot run solve_radius, scipy was not found...")
          return
      display.EraseAll()
      p1 = gp_Pnt(0, 0, 0)
      p2 = gp_Pnt(0, 10, 0)
      p3 = gp_Pnt(0, 10, 10)
      p4 = gp_Pnt(0, 0, 10)
      p5 = gp_Pnt(5, 5, 5)
      poly = make_closed_polygon([p1, p2, p3, p4])
      for i in (0.1, 0.5, 1.5, 2., 3., 0.2):
          rcs = RadiusConstrainedSurface(display, poly, p5, i)
          face = rcs.solve()
          print('Goal: %s radius: %s' % (i, rcs.curr_radius))
          time.sleep(0.1)
  
  
  def build_geom_plate(edges):
      bpSrf = GeomPlate_BuildPlateSurface(3, 9, 12)
  
      # add curve constraints
      for edg in edges:
          c = BRepAdaptor_HCurve()
          print('edge:', edg)
          c.ChangeCurve().Initialize(edg)
          constraint = BRepFill_CurveConstraint(c.GetHandle(), 0)
          bpSrf.Add(constraint.GetHandle())
  
      # add point constraint
      try:
          bpSrf.Perform()
      except RuntimeError:
          print('failed to build the geom plate surface ')
  
      srf = bpSrf.Surface()
      plate = GeomPlate_MakeApprox(srf, 0.01, 10, 5, 0.01, 0, GeomAbs_C0)
  
      uMin, uMax, vMin, vMax = srf.GetObject().Bounds()
      face = make_face(plate.Surface(), uMin, uMax, vMin, vMax, 1e-6)
      return face
  
  
  def build_curve_network(event=None):
      '''
      mimic the curve network surfacing command from rhino
      '''
      print('Importing IGES file...')
      pth = os.path.dirname(os.path.abspath(__file__))
      pth = os.path.abspath(
          os.path.join(pth, 'models', 'curve_geom_plate.igs'))
      iges = iges_importer(pth)
      print('done.')
  
      print('Building geomplate...')
      topo = Topo(iges)
      edges_list = list(topo.edges())
      face = build_geom_plate(edges_list)
      print('done.')
      display.EraseAll()
      display.DisplayShape(edges_list)
      display.DisplayShape(face)
      display.FitAll()
      print('Cutting out of edges...')
  
  
  def exit(event=None):
      sys.exit()
  
  
  if __name__ == "__main__":
      add_menu('geom plate')
      add_function_to_menu('geom plate', geom_plate)
      add_function_to_menu('geom plate', solve_radius)
      add_function_to_menu('geom plate', build_curve_network)
      add_function_to_menu('geom plate', exit)
  
      build_curve_network()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_geomplate-1-1511701827.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-10-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-100-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-101-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-102-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-103-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-104-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-105-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-106-1511701848.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-107-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-108-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-109-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-11-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-110-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-111-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-112-1511701849.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-113-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-114-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-115-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-116-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-117-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-118-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-119-1511701850.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-12-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-120-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-121-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-122-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-123-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-124-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-125-1511701851.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-126-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-127-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-128-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-129-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-13-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-130-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-131-1511701852.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-132-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-133-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-134-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-135-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-136-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-137-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-138-1511701853.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-139-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-14-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-140-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-141-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-142-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-143-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-144-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-145-1511701854.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-146-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-147-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-148-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-149-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-15-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-150-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-151-1511701855.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-152-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-153-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-154-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-155-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-156-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-157-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-158-1511701856.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-159-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-16-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-160-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-161-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-162-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-163-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-164-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-165-1511701857.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-166-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-167-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-168-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-169-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-17-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-170-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-171-1511701858.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-172-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-173-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-174-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-175-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-176-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-177-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-178-1511701859.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-179-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-18-1511701829.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-180-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-181-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-182-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-183-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-184-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-185-1511701860.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-186-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-187-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-188-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-189-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-19-1511701830.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-190-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-191-1511701861.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-192-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-193-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-194-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-195-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-196-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-197-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-198-1511701862.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-199-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-2-1511701827.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-20-1511701830.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-200-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-201-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-202-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-203-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-204-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-205-1511701863.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-206-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-207-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-208-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-209-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-21-1511701830.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-210-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-211-1511701864.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-212-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-213-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-214-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-215-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-216-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-217-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-218-1511701865.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-219-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-22-1511701830.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-220-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-221-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-222-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-223-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-224-1511701866.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-225-1511701867.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-226-1511701867.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-227-1511701867.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-228-1511701867.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-229-1511701867.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-23-1511701830.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-230-1511701868.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-231-1511701868.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-232-1511701869.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-233-1511701869.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-234-1511701869.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-235-1511701869.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-236-1511701870.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-237-1511701870.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-238-1511701870.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-239-1511701870.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-24-1511701831.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-240-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-241-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-242-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-243-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-244-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-245-1511701871.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-246-1511701872.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-247-1511701872.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-248-1511701872.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-249-1511701872.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-25-1511701831.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-250-1511701873.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-251-1511701873.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-252-1511701873.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-253-1511701873.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-26-1511701832.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-27-1511701832.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-28-1511701832.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-29-1511701833.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-3-1511701827.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-30-1511701833.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-31-1511701833.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-32-1511701833.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-33-1511701833.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-34-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-35-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-36-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-37-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-38-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-39-1511701834.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-4-1511701827.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-40-1511701835.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-41-1511701835.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-42-1511701835.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-43-1511701835.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-44-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-45-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-46-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-47-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-48-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-49-1511701836.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-5-1511701827.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-50-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-51-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-52-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-53-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-54-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-55-1511701837.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-56-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-57-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-58-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-59-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-6-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-60-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-61-1511701838.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-62-1511701839.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-63-1511701839.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-64-1511701839.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-65-1511701839.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-66-1511701839.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-67-1511701840.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-68-1511701840.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-69-1511701840.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-7-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-70-1511701840.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-71-1511701840.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-72-1511701841.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-73-1511701841.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-74-1511701842.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-75-1511701842.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-76-1511701842.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-77-1511701842.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-78-1511701843.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-79-1511701843.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-8-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-80-1511701843.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-81-1511701843.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-82-1511701843.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-83-1511701844.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-84-1511701844.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-85-1511701844.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-86-1511701844.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-87-1511701845.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-88-1511701845.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-89-1511701845.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-9-1511701828.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-90-1511701846.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-91-1511701846.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-92-1511701846.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-93-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-94-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-95-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-96-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-97-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-98-1511701847.jpeg

  .. image:: images/screenshots/capture-core_geometry_geomplate-99-1511701847.jpeg

