import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BRepMesh is deprecated since pythonocc-0.18.2. Use OCC.Core.BRepMesh", DeprecationWarning)

from OCC.Core.BRepMesh import *
