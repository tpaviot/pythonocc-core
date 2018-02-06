import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepAlgo is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepAlgo", DeprecationWarning)

from OCC.Core.BRepAlgo import *
