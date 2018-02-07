import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Graphic3d is deprecated since pythonocc-0.18.2. Use OCC.Core.Graphic3d", DeprecationWarning)

from OCC.Core.Graphic3d import *
