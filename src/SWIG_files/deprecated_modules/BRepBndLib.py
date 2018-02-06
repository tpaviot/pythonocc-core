import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepBndLib is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepBndLib", DeprecationWarning)

from OCC.Core.BRepBndLib import *
