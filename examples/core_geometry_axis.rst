core_geometry_axis.py
=====================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_geometry_axis.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from __future__ import print_function
  
  import sys
  
  from OCC.gp import gp_Pnt, gp_Dir, gp_Ax3
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  def axis():
      p1 = gp_Pnt(2., 3., 4.)
      d = gp_Dir(4., 5., 6.)
      a = gp_Ax3(p1, d)
      a_IsDirect = a.Direct()
      print("a is direct:", a_IsDirect)
      # a_XDirection = a.XDirection()
      # a_YDirection = a.YDirection()
      p2 = gp_Pnt(5., 3., 4.)
      a2 = gp_Ax3(p2, d)
      a2.YReverse()
      # axis3 is now left handed
      a2_IsDirect = a2.Direct()
      print("a2 is direct:", a2_IsDirect)
      # a2_XDirection = a2.XDirection()
      # a2_YDirection = a2.YDirection()
      display.DisplayShape(p1, update=True)
      display.DisplayShape(p2, update=True)
      display.DisplayMessage(p1, "P1")
      display.DisplayMessage(p2, "P2")
  
  
  def exit(event=None):
      sys.exit()
  
  if __name__ == '__main__':
      axis()
      start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_geometry_axis-1-1511701767.jpeg

  .. image:: images/screenshots/capture-core_geometry_axis-2-1511701767.jpeg

