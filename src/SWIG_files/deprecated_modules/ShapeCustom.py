import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ShapeCustom is deprecated since pythonocc-0.18.2. Use OCC.Core.ShapeCustom", DeprecationWarning)

from OCC.Core.ShapeCustom import *
