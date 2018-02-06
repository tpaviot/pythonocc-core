import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StdMeshers is deprecated since pythonocc-0.18.2. Use OCC.Core.StdMeshers", DeprecationWarning)

from OCC.Core.StdMeshers import *
