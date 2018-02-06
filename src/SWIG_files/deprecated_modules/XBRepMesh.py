import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XBRepMesh is deprecated since pythonocc-0.18.2. Use OCC.Core.XBRepMesh", DeprecationWarning)

from OCC.Core.XBRepMesh import *
