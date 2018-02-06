import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IVtk is deprecated since pythonocc-0.18.2. Use OCC.Core.IVtk", DeprecationWarning)

from OCC.Core.IVtk import *
