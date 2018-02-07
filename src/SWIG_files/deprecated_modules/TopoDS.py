import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopoDS is deprecated since pythonocc-0.18.2. Use OCC.Core.TopoDS", DeprecationWarning)

from OCC.Core.TopoDS import *
