import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepFeat is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepFeat", DeprecationWarning)

from OCC.Core.BRepFeat import *
