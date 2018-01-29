core_geometry_quaternion.py
===========================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_quaternion.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.gp import gp_QuaternionSLerp, gp_Quaternion, gp_Vec, gp_Pnt
  from OCC.Extend.ShapeFactory import make_edge
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def as_pnt(a_gp_Vec):
      return gp_Pnt(a_gp_Vec.XYZ())
  
  
  def rotate(event=None):
      display.EraseAll()
      origin = gp_Vec(0, 0, 0)
      origin_pt = as_pnt(origin)
  
      vX = gp_Vec(12, 0, 0)
      vY = gp_Vec(0, 12, 0)
      vZ = gp_Vec(0, 0, 12)
      v45 = (gp_Vec(1, 1, 1).Normalized() * 12)
      q1 = gp_Quaternion(vX, vY)
  
      p1 = as_pnt(origin + vX)
      p2 = as_pnt(origin + vY)
      p3 = as_pnt(origin + (q1 * vY))
      p4 = as_pnt(origin + (q1 * v45))
  
      # RED
      e1 = make_edge(origin_pt, p1)
      e2 = make_edge(origin_pt, p2)
      e3 = make_edge(origin_pt, as_pnt(v45))
      # GREEN -> transformed
      e4 = make_edge(origin_pt, p3)
      e5 = make_edge(origin_pt, p4)
  
      display.DisplayShape([e1, e2, e3])
      display.DisplayColoredShape([e4, e5], 'GREEN')
      display.DisplayMessage(p1, 'e1')
      display.DisplayMessage(p2, 'e2')
      display.DisplayMessage(as_pnt(v45), 'e3')
      display.DisplayMessage(p3, 'q1*vY')
      display.DisplayMessage(p4, 'q1*v45')
      display.DisplayVector((q1 * vY).Normalized(), as_pnt(origin + q1 * vY / 2.))
      display.DisplayVector((q1 * v45).Normalized(), as_pnt(origin + q1 * v45 / 2.))
      display.FitAll()
  
  
  def frange(start, end=None, inc=None):
      "A range function, that does accept float increments..."
  
      if end is None:
          end = start + 0.0
          start = 0.0
  
      if inc is None:
          inc = 1.0
  
      L = []
      while 1:
          next_ = start + len(L) * inc
          if inc > 0 and next_ >= end:
              break
          elif inc < 0 and next_ <= end:
              break
          L.append(next_)
  
      return L
  
  
  def interpolate(event=None):
      display.EraseAll()
  
      origin = gp_Vec()
      vX = gp_Vec(12, 0, 0)
      vY = gp_Vec(0, 12, 0)
      v45 = (gp_Vec(1, 1, 1).Normalized() * 12)
  
      q = gp_Quaternion()
      interp = gp_QuaternionSLerp(gp_Quaternion(vX, vX), gp_Quaternion(vX, vY))
  
      for i in frange(0, 1.0, 0.01):
          interp.Interpolate(i, q)
          # displace the white edges a little from the origin so not to obstruct the other edges
          v = gp_Vec(0, -24*i, 0)
          q_v_ = q * v45
          p = gp_Pnt((q_v_ + v).XYZ())
          v__as_pnt = gp_Pnt((origin + v).XYZ())
          e = make_edge(v__as_pnt, p)
          display.DisplayColoredShape(e, 'WHITE')
          msg = 'v45->q1*v45 @{0}'.format(i / 10.)
          display.DisplayMessage(p, msg)
      display.FitAll()
  
  
  if __name__ == '__main__':
      add_menu('quaternion')
      add_function_to_menu('quaternion', rotate)
      add_function_to_menu('quaternion', interpolate)
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_quaternion-1-1511701904.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-10-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-100-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-101-1511701916.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-102-1511701916.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-11-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-12-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-13-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-14-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-15-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-16-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-17-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-18-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-19-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-2-1511701904.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-20-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-21-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-22-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-23-1511701906.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-24-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-25-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-26-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-27-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-28-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-29-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-3-1511701904.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-30-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-31-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-32-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-33-1511701907.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-34-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-35-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-36-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-37-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-38-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-39-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-4-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-40-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-41-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-42-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-43-1511701908.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-44-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-45-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-46-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-47-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-48-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-49-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-5-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-50-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-51-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-52-1511701909.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-53-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-54-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-55-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-56-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-57-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-58-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-59-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-6-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-60-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-61-1511701910.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-62-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-63-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-64-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-65-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-66-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-67-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-68-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-69-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-7-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-70-1511701911.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-71-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-72-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-73-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-74-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-75-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-76-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-77-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-78-1511701912.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-79-1511701913.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-8-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-80-1511701913.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-81-1511701913.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-82-1511701913.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-83-1511701913.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-84-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-85-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-86-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-87-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-88-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-89-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-9-1511701905.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-90-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-91-1511701914.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-92-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-93-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-94-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-95-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-96-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-97-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-98-1511701915.jpeg

  .. image:: images/screenshots/capture-core_geometry_quaternion-99-1511701915.jpeg

