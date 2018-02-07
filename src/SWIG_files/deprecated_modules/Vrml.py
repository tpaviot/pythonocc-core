import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Vrml is deprecated since pythonocc-0.18.2. Use OCC.Core.Vrml", DeprecationWarning)

from OCC.Core.Vrml import *
