core_dimensions.py
==================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_dimensions.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  from OCC.gp import gp_Dir, gp_Ax2, gp_Circ, gp_Pnt
  from OCC.AIS import AIS_Shape, AIS_RadiusDimension
  from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeEdge
  from OCC.Display.SimpleGui import init_display
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  c = gp_Circ(gp_Ax2(gp_Pnt(200., 200., 0.), gp_Dir(0., 0., 1.)), 80)
  ec = BRepBuilderAPI_MakeEdge(c).Edge()
  ais_shp = AIS_Shape(ec)
  display.Context.Display(ais_shp.GetHandle())
  
  
  rd = AIS_RadiusDimension(ec)
  #rd.SetArrowSize(12)
  display.Context.Display(rd.GetHandle())
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


No available screenshot.
