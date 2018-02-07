import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepIntCurveSurface is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepIntCurveSurface", DeprecationWarning)

from OCC.Core.BRepIntCurveSurface import *
