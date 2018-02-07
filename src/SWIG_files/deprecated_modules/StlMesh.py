import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StlMesh is deprecated since pythonocc-0.18.2. Use OCC.Core.StlMesh", DeprecationWarning)

from OCC.Core.StlMesh import *
