import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MeshVS is deprecated since pythonocc-0.18.2. Use OCC.Core.MeshVS", DeprecationWarning)

from OCC.Core.MeshVS import *
