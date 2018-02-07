import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Select3D is deprecated since pythonocc-0.18.2. Use OCC.Core.Select3D", DeprecationWarning)

from OCC.Core.Select3D import *
