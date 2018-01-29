core_display_textured_shape.py
==============================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_display_textured_shape.py

------


Code
^^^^


.. code-block:: python

  ##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
  
  import os
  
  from OCC.Core.Graphic3d import Graphic3d_NOM_SILVER, Graphic3d_MaterialAspect
  from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeCylinder
  
  from OCC.Display.SimpleGui import init_display
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  
  class Texture(object):
      """
      This class encapsulates the necessary texture properties:
      Filename, toScaleU, etc.
      """
      def __init__(self, filename):
          if not os.path.isfile(filename):
              raise IOError("File %s not found.\n" % filename)
          self._filename = filename
          self._toScaleU = 1.0
          self._toScaleV = 1.0
          self._toRepeatU = 1.0
          self._toRepeatV = 1.0
          self._originU = 0.0
          self._originV = 0.0
  
      def TextureScale(self, toScaleU, toScaleV):
          self._toScaleU = toScaleU
          self._toScaleV = toScaleV
  
      def TextureRepeat(self, toRepeatU, toRepeatV):
          self._toRepeatU = toRepeatU
          self._toRepeatV = toRepeatV
  
      def TextureOrigin(self, originU, originV):
          self._originU = originU
          self._originV = originV
  
      def GetProperties(self):
          return (self._filename,
                  self._toScaleU, self._toScaleV,
                  self._toRepeatU, self._toRepeatV,
                  self._originU, self._originV)
  
  #
  # First create texture and a material
  #
  texture_filename = './images/ground.bmp'
  t = Texture(texture_filename)
  m = Graphic3d_MaterialAspect(Graphic3d_NOM_SILVER)
  #
  # Displays a cylinder with a material and a texture
  #
  s = BRepPrimAPI_MakeCylinder(60, 200)
  display.DisplayShape(s.Shape(), material=m, texture=t)
  #
  # Display settings
  #
  display.View_Iso()
  display.FitAll()
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_display_textured_shape-1-1511701725.jpeg

