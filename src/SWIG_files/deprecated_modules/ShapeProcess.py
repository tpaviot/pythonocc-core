import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeProcess is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeProcess", DeprecationWarning)

from OCC.Core.ShapeProcess import *
