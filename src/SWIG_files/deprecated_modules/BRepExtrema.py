import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepExtrema is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepExtrema", DeprecationWarning)

from OCC.Core.BRepExtrema import *
